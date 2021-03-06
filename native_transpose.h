#ifndef NATIVE_TRANSPOSE_IMPL
#define NATIVE_TRANSPOSE_IMPL

void transpose(int *src, int *dst, int w, int h)
{
    for (int x = 0; x < w; x++)
        for (int y = 0; y < h; y++)
            *(dst + x * h + y) = *(src + y * w + x);
}

#endif /* TRANSPOSE_IMPL */
