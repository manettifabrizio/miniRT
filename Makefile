# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fmanetti <fmanetti@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/05/22 20:52:58 by fmanetti          #+#    #+#              #
#    Updated: 2020/09/19 19:29:10 by fmanetti         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = 		miniRT

SOURCE = 	srcs/minirt.c \
			srcs/graph/render.c \
			srcs/graph/trace.c \
			srcs/graph/cast_ray.c \
			srcs/graph/window/draw.c \
			srcs/graph/window/hook.c \
			srcs/graph/window/bmp_image.c \
			srcs/graph/intersection/intersect.c \
			srcs/graph/intersection/sp_intersect.c \
			srcs/graph/intersection/pl_intersect.c \
			srcs/graph/intersection/sq_intersect.c \
			srcs/graph/intersection/cy_intersect.c \
			srcs/graph/intersection/tr_intersect.c \
			srcs/math/point_ops0.c \
			srcs/math/point_ops1.c \
			srcs/math/clr_ops.c \
			srcs/math/quad_solver.c \
			srcs/math/deg2rad.c \
			srcs/math/normalize.c \
			srcs/math/mtx.c \
			srcs/utilities/fill.c \
			srcs/utilities/my_atoi.c \
			srcs/utilities/my_atof.c \
			srcs/utilities/var0.c \
			srcs/parsing/parse.c \
			srcs/parsing/settings_parser.c \
			srcs/parsing/shapes_parser.c \
			srcs/parsing/object_parser.c \
			srcs/parsing/lst_check/obj_lstadd_back.c \
			srcs/parsing/lst_check/obj_lstnew.c \
			srcs/parsing/lst_check/obj_lstcheck.c \
			srcs/parsing/lst_check/obj_lstlast.c \
			srcs/parsing/lst_check/obj_lstsize.c \
			srcs/errors/errors.c \
			srcs/errors/memory_free.c \
			srcs/errors/lstclear.c

INCLUDE =	include/libft/libft.a \
			include/minilibx/libmlx.a

OBJ			= $(SOURCE:%.c=%.o)

CC			= gcc

FLAGS 		= -L include/minilibx -lmlx -framework OpenGL -framework Appkit -fsanitize=address -O0 -g3
CFLAGS		= -Wall -Wextra -Werror -I include/

FSANITIZE	= -g3 -fsanitize=address

all: $(NAME)

$(NAME): $(OBJ)
	@make -C include/libft/
	@make bonus -C include/libft/
	@$(CC) -o $(NAME) $(FLAGS) $(OBJ) $(INCLUDE) $(FSANITIZE)
	@printf "[ miniRT ] Compiled \033[0;32mSuccessfully\n\033[0m"

bonus: $(NAME)
	@printf "[ $(NAME) + bonus] Created \033[0;32mSuccessfully\n\033[0m" $(SUCCESS)

clean:
	@make clean -C include/libft/
	@/bin/rm -f $(OBJ)
	@printf "Object files \033[0;31mremoved\n\033[0m"

fclean: clean
	@/bin/rm -f $(NAME)
	@/bin/rm -f libft.a
	@make fclean -C include/libft/
	@/bin/rm -f image.bmp
	@printf "[ $(NAME) ] \033[0;31mremoved\n\033[0m"

re: fclean all

.PHONY: all clean fclean re