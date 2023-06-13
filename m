Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46ED672E73F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jun 2023 17:33:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241382AbjFMPck (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Jun 2023 11:32:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242790AbjFMPcj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Jun 2023 11:32:39 -0400
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com [IPv6:2001:4860:4864:20::33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 754AD183
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jun 2023 08:32:36 -0700 (PDT)
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-19f31d6b661so4524007fac.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jun 2023 08:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686670356; x=1689262356;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UnaqhwjlCJW4rONwgkzq9LoubKZ8qoNtbP44UDq+JhU=;
        b=mIICRCtD8jdZBzwV/YZMuFbJKUWKL0pLZzltKSu5VzzBiaM43z4Fdgqkak4z5eS7Dz
         z5MUz6Zk0w5kAaPBDBOG0725I86PCIKwHE0LUpGEpWxspmyVTL12+Eom6J3jAAEZH1XA
         Fxb2Y51L07bP7LYth5St+n2UgnuosuSbT31Y/jMIOi2ype7ZVZCISKn+zBcm2piy48az
         iAIc/J+HI3Z9KKaVopyZuvC4hJYSY+q1m883K/OAPryRxG3Ke0feJsw1QfVooLyYwX+v
         R/74ReLM3O5f+C00YMPAYS52DcCoZdjNIjDlkZzqudRVYqCOdqhrn8Db92qx0tp9T9fp
         iLEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686670356; x=1689262356;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UnaqhwjlCJW4rONwgkzq9LoubKZ8qoNtbP44UDq+JhU=;
        b=Dk+qoI8OQ4zIrwaezeTsYNusGjzYA9BDAMWfxgRdlm7aD9WgvAU1e2D3cs7wd99sKu
         aIJtx/+mtyvQua2C06vnHcU2KWucQINHmKMh6TyRi9EwDuzy+H+0knS98ufGWgkjRghV
         HJZ3FwK1AwH4KNu0wshBVzuylWEV5UjTnpozFOOwhEU7GMkBy5c6rJT6XHcXuPvt9eam
         Ud+BdMMqaPEWzl1aXnPnu2M3nF6rk6YmHg7RA2hTYCQmblsFv/PiG9Yo+h6HRZkmAMyb
         NmuTia6yuRbNEZjt9sgKQmqSNwMHO7+mraFpuuC3vizfIRF3DtmRPuO1oa9tSdQF37Hg
         YlUw==
X-Gm-Message-State: AC+VfDzXV+e5rf/F4PEJrzDg6Ela9aCSyRPVAJ5HnR6wCFKRBPS5ztDT
        0+Ef89uMk4hhtSk1XA2B30XMH+3tmva8fy7URbA=
X-Google-Smtp-Source: ACHHUZ4P5TyQWlHmJrNfETqp6fwdCdavD/NfOPVwwNYz7F+KqT7WwtVIfkSm/7QuJ56EHlfptCNup1WxTsZvJtIHzko=
X-Received: by 2002:a05:6870:3a31:b0:1a6:b74e:afd9 with SMTP id
 du49-20020a0568703a3100b001a6b74eafd9mr1817813oab.35.1686670355466; Tue, 13
 Jun 2023 08:32:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230613150441.17720-1-tzimmermann@suse.de> <20230613150441.17720-3-tzimmermann@suse.de>
In-Reply-To: <20230613150441.17720-3-tzimmermann@suse.de>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Tue, 13 Jun 2023 11:32:24 -0400
Message-ID: <CADnq5_NiD4_zu8mexCcPCptow_ePkUb=bveF+xp1_be5te1vAw@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm: Remove struct drm_driver.gem_prime_mmap
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     daniel@ffwll.ch, airlied@gmail.com, robdclark@gmail.com,
        quic_abhinavk@quicinc.com, sean@poorly.run,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jun 13, 2023 at 11:05=E2=80=AFAM Thomas Zimmermann <tzimmermann@sus=
e.de> wrote:
>
> All drivers initialize this field with drm_gem_prime_mmap(). Call
> the function directly and remove the field. Simplifies the code and
> resolves a long-standing TODO item.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Series is:
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  Documentation/gpu/todo.rst                      |  9 ---------
>  drivers/accel/ivpu/ivpu_drv.c                   |  1 -
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c         |  1 -
>  drivers/gpu/drm/drm_fbdev_dma.c                 |  6 +-----
>  drivers/gpu/drm/drm_prime.c                     | 14 ++------------
>  drivers/gpu/drm/etnaviv/etnaviv_drv.c           |  1 -
>  drivers/gpu/drm/exynos/exynos_drm_drv.c         |  1 -
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c |  1 -
>  drivers/gpu/drm/lima/lima_drv.c                 |  1 -
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c          |  1 -
>  drivers/gpu/drm/msm/msm_drv.c                   |  1 -
>  drivers/gpu/drm/msm/msm_drv.h                   |  1 -
>  drivers/gpu/drm/msm/msm_gem_prime.c             |  5 -----
>  drivers/gpu/drm/nouveau/nouveau_drm.c           |  1 -
>  drivers/gpu/drm/panfrost/panfrost_drv.c         |  1 -
>  drivers/gpu/drm/pl111/pl111_drv.c               |  1 -
>  drivers/gpu/drm/radeon/radeon_drv.c             |  1 -
>  drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c   |  1 -
>  drivers/gpu/drm/rockchip/rockchip_drm_drv.c     |  1 -
>  drivers/gpu/drm/v3d/v3d_drv.c                   |  1 -
>  drivers/gpu/drm/virtio/virtgpu_drv.c            |  1 -
>  drivers/gpu/drm/xen/xen_drm_front.c             |  1 -
>  include/drm/drm_drv.h                           | 14 --------------
>  include/drm/drm_gem_dma_helper.h                |  6 ++----
>  include/drm/drm_gem_shmem_helper.h              |  1 -
>  include/drm/drm_gem_vram_helper.h               |  1 -
>  26 files changed, 5 insertions(+), 69 deletions(-)
>
> diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> index 68bdafa0284f5..ca1efad8c89c3 100644
> --- a/Documentation/gpu/todo.rst
> +++ b/Documentation/gpu/todo.rst
> @@ -319,15 +319,6 @@ Contact: Daniel Vetter, Noralf Tronnes
>
>  Level: Advanced
>
> -struct drm_gem_object_funcs
> ----------------------------
> -
> -GEM objects can now have a function table instead of having the callback=
s on the
> -DRM driver struct. This is now the preferred way. Callbacks in drivers h=
ave been
> -converted, except for struct drm_driver.gem_prime_mmap.
> -
> -Level: Intermediate
> -
>  connector register/unregister fixes
>  -----------------------------------
>
> diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.=
c
> index 2df7643b843d5..9f2b9fdcc5498 100644
> --- a/drivers/accel/ivpu/ivpu_drv.c
> +++ b/drivers/accel/ivpu/ivpu_drv.c
> @@ -376,7 +376,6 @@ static const struct drm_driver driver =3D {
>         .prime_handle_to_fd =3D drm_gem_prime_handle_to_fd,
>         .prime_fd_to_handle =3D drm_gem_prime_fd_to_handle,
>         .gem_prime_import =3D ivpu_gem_prime_import,
> -       .gem_prime_mmap =3D drm_gem_prime_mmap,
>
>         .ioctls =3D ivpu_drm_ioctls,
>         .num_ioctls =3D ARRAY_SIZE(ivpu_drm_ioctls),
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_drv.c
> index c9a41c997c6c7..7681f79f462eb 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -2809,7 +2809,6 @@ static const struct drm_driver amdgpu_kms_driver =
=3D {
>         .prime_handle_to_fd =3D drm_gem_prime_handle_to_fd,
>         .prime_fd_to_handle =3D drm_gem_prime_fd_to_handle,
>         .gem_prime_import =3D amdgpu_gem_prime_import,
> -       .gem_prime_mmap =3D drm_gem_prime_mmap,
>
>         .name =3D DRIVER_NAME,
>         .desc =3D DRIVER_DESC,
> diff --git a/drivers/gpu/drm/drm_fbdev_dma.c b/drivers/gpu/drm/drm_fbdev_=
dma.c
> index d86773fa8ab00..8217f1ddc0075 100644
> --- a/drivers/gpu/drm/drm_fbdev_dma.c
> +++ b/drivers/gpu/drm/drm_fbdev_dma.c
> @@ -54,12 +54,8 @@ static void drm_fbdev_dma_fb_destroy(struct fb_info *i=
nfo)
>  static int drm_fbdev_dma_fb_mmap(struct fb_info *info, struct vm_area_st=
ruct *vma)
>  {
>         struct drm_fb_helper *fb_helper =3D info->par;
> -       struct drm_device *dev =3D fb_helper->dev;
> -
> -       if (drm_WARN_ON_ONCE(dev, !fb_helper->dev->driver->gem_prime_mmap=
))
> -               return -ENODEV;
>
> -       return fb_helper->dev->driver->gem_prime_mmap(fb_helper->buffer->=
gem, vma);
> +       return drm_gem_prime_mmap(fb_helper->buffer->gem, vma);
>  }
>
>  static const struct fb_ops drm_fbdev_dma_fb_ops =3D {
> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
> index d29dafce9bb0a..6bcf324ef81c9 100644
> --- a/drivers/gpu/drm/drm_prime.c
> +++ b/drivers/gpu/drm/drm_prime.c
> @@ -715,8 +715,6 @@ EXPORT_SYMBOL(drm_gem_dmabuf_vunmap);
>   * the same codepath that is used for regular GEM buffer mapping on the =
DRM fd.
>   * The fake GEM offset is added to vma->vm_pgoff and &drm_driver->fops->=
mmap is
>   * called to set up the mapping.
> - *
> - * Drivers can use this as their &drm_driver.gem_prime_mmap callback.
>   */
>  int drm_gem_prime_mmap(struct drm_gem_object *obj, struct vm_area_struct=
 *vma)
>  {
> @@ -772,25 +770,17 @@ EXPORT_SYMBOL(drm_gem_prime_mmap);
>   * @vma: virtual address range
>   *
>   * Provides memory mapping for the buffer. This can be used as the
> - * &dma_buf_ops.mmap callback. It just forwards to &drm_driver.gem_prime=
_mmap,
> - * which should be set to drm_gem_prime_mmap().
> - *
> - * FIXME: There's really no point to this wrapper, drivers which need an=
ything
> - * else but drm_gem_prime_mmap can roll their own &dma_buf_ops.mmap call=
back.
> + * &dma_buf_ops.mmap callback. It just forwards to drm_gem_prime_mmap().
>   *
>   * Returns 0 on success or a negative error code on failure.
>   */
>  int drm_gem_dmabuf_mmap(struct dma_buf *dma_buf, struct vm_area_struct *=
vma)
>  {
>         struct drm_gem_object *obj =3D dma_buf->priv;
> -       struct drm_device *dev =3D obj->dev;
>
>         dma_resv_assert_held(dma_buf->resv);
>
> -       if (!dev->driver->gem_prime_mmap)
> -               return -ENOSYS;
> -
> -       return dev->driver->gem_prime_mmap(obj, vma);
> +       return drm_gem_prime_mmap(obj, vma);
>  }
>  EXPORT_SYMBOL(drm_gem_dmabuf_mmap);
>
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etna=
viv/etnaviv_drv.c
> index 31a7f59ccb49e..00223a8749092 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> @@ -484,7 +484,6 @@ static const struct drm_driver etnaviv_drm_driver =3D=
 {
>         .prime_handle_to_fd =3D drm_gem_prime_handle_to_fd,
>         .prime_fd_to_handle =3D drm_gem_prime_fd_to_handle,
>         .gem_prime_import_sg_table =3D etnaviv_gem_prime_import_sg_table,
> -       .gem_prime_mmap     =3D drm_gem_prime_mmap,
>  #ifdef CONFIG_DEBUG_FS
>         .debugfs_init       =3D etnaviv_debugfs_init,
>  #endif
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/ex=
ynos/exynos_drm_drv.c
> index 6b73fb7a83c3c..c9e3c88fb329c 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
> @@ -113,7 +113,6 @@ static const struct drm_driver exynos_drm_driver =3D =
{
>         .prime_fd_to_handle     =3D drm_gem_prime_fd_to_handle,
>         .gem_prime_import       =3D exynos_drm_gem_prime_import,
>         .gem_prime_import_sg_table      =3D exynos_drm_gem_prime_import_s=
g_table,
> -       .gem_prime_mmap         =3D drm_gem_prime_mmap,
>         .ioctls                 =3D exynos_ioctls,
>         .num_ioctls             =3D ARRAY_SIZE(exynos_ioctls),
>         .fops                   =3D &exynos_drm_driver_fops,
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/drivers/gp=
u/drm/hisilicon/hibmc/hibmc_drm_drv.c
> index 0c4aa4d9b0a77..8a98fa276e8a9 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> @@ -63,7 +63,6 @@ static const struct drm_driver hibmc_driver =3D {
>         .debugfs_init           =3D drm_vram_mm_debugfs_init,
>         .dumb_create            =3D hibmc_dumb_create,
>         .dumb_map_offset        =3D drm_gem_ttm_dumb_map_offset,
> -       .gem_prime_mmap         =3D drm_gem_prime_mmap,
>  };
>
>  static int __maybe_unused hibmc_pm_suspend(struct device *dev)
> diff --git a/drivers/gpu/drm/lima/lima_drv.c b/drivers/gpu/drm/lima/lima_=
drv.c
> index e8566211e9fa1..65c31dc38049a 100644
> --- a/drivers/gpu/drm/lima/lima_drv.c
> +++ b/drivers/gpu/drm/lima/lima_drv.c
> @@ -279,7 +279,6 @@ static const struct drm_driver lima_drm_driver =3D {
>         .prime_fd_to_handle =3D drm_gem_prime_fd_to_handle,
>         .gem_prime_import_sg_table =3D drm_gem_shmem_prime_import_sg_tabl=
e,
>         .prime_handle_to_fd =3D drm_gem_prime_handle_to_fd,
> -       .gem_prime_mmap =3D drm_gem_prime_mmap,
>  };
>
>  struct lima_block_reader {
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/med=
iatek/mtk_drm_drv.c
> index 6dcb4ba2466c0..5693bb8d29ce4 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -560,7 +560,6 @@ static const struct drm_driver mtk_drm_driver =3D {
>         .prime_fd_to_handle =3D drm_gem_prime_fd_to_handle,
>         .gem_prime_import =3D mtk_drm_gem_prime_import,
>         .gem_prime_import_sg_table =3D mtk_gem_prime_import_sg_table,
> -       .gem_prime_mmap =3D drm_gem_prime_mmap,
>         .fops =3D &mtk_drm_fops,
>
>         .name =3D DRIVER_NAME,
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.=
c
> index 891eff8433a9c..47efa3c4492c4 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -1089,7 +1089,6 @@ static const struct drm_driver msm_driver =3D {
>         .prime_handle_to_fd =3D drm_gem_prime_handle_to_fd,
>         .prime_fd_to_handle =3D drm_gem_prime_fd_to_handle,
>         .gem_prime_import_sg_table =3D msm_gem_prime_import_sg_table,
> -       .gem_prime_mmap     =3D msm_gem_prime_mmap,
>  #ifdef CONFIG_DEBUG_FS
>         .debugfs_init       =3D msm_debugfs_init,
>  #endif
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.=
h
> index e13a8cbd61c95..44c9e06f2dffa 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -282,7 +282,6 @@ unsigned long msm_gem_shrinker_shrink(struct drm_devi=
ce *dev, unsigned long nr_t
>  void msm_gem_shrinker_init(struct drm_device *dev);
>  void msm_gem_shrinker_cleanup(struct drm_device *dev);
>
> -int msm_gem_prime_mmap(struct drm_gem_object *obj, struct vm_area_struct=
 *vma);
>  struct sg_table *msm_gem_prime_get_sg_table(struct drm_gem_object *obj);
>  int msm_gem_prime_vmap(struct drm_gem_object *obj, struct iosys_map *map=
);
>  void msm_gem_prime_vunmap(struct drm_gem_object *obj, struct iosys_map *=
map);
> diff --git a/drivers/gpu/drm/msm/msm_gem_prime.c b/drivers/gpu/drm/msm/ms=
m_gem_prime.c
> index 2c846afe049e4..5f68e31a3e4e1 100644
> --- a/drivers/gpu/drm/msm/msm_gem_prime.c
> +++ b/drivers/gpu/drm/msm/msm_gem_prime.c
> @@ -11,11 +11,6 @@
>  #include "msm_drv.h"
>  #include "msm_gem.h"
>
> -int msm_gem_prime_mmap(struct drm_gem_object *obj, struct vm_area_struct=
 *vma)
> -{
> -       return drm_gem_prime_mmap(obj, vma);
> -}
> -
>  struct sg_table *msm_gem_prime_get_sg_table(struct drm_gem_object *obj)
>  {
>         struct msm_gem_object *msm_obj =3D to_msm_bo(obj);
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouv=
eau/nouveau_drm.c
> index cc7c5b4a05fd8..4199b8294e6e8 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
> @@ -1237,7 +1237,6 @@ driver_stub =3D {
>         .prime_handle_to_fd =3D drm_gem_prime_handle_to_fd,
>         .prime_fd_to_handle =3D drm_gem_prime_fd_to_handle,
>         .gem_prime_import_sg_table =3D nouveau_gem_prime_import_sg_table,
> -       .gem_prime_mmap =3D drm_gem_prime_mmap,
>
>         .dumb_create =3D nouveau_display_dumb_create,
>         .dumb_map_offset =3D drm_gem_ttm_dumb_map_offset,
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/pa=
nfrost/panfrost_drv.c
> index 19f8cff52e533..d2916bf435473 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -542,7 +542,6 @@ static const struct drm_driver panfrost_drm_driver =
=3D {
>         .prime_handle_to_fd     =3D drm_gem_prime_handle_to_fd,
>         .prime_fd_to_handle     =3D drm_gem_prime_fd_to_handle,
>         .gem_prime_import_sg_table =3D panfrost_gem_prime_import_sg_table=
,
> -       .gem_prime_mmap         =3D drm_gem_prime_mmap,
>  };
>
>  static int panfrost_probe(struct platform_device *pdev)
> diff --git a/drivers/gpu/drm/pl111/pl111_drv.c b/drivers/gpu/drm/pl111/pl=
111_drv.c
> index 43049c8028b21..c4b8357ea9996 100644
> --- a/drivers/gpu/drm/pl111/pl111_drv.c
> +++ b/drivers/gpu/drm/pl111/pl111_drv.c
> @@ -227,7 +227,6 @@ static const struct drm_driver pl111_drm_driver =3D {
>         .prime_handle_to_fd =3D drm_gem_prime_handle_to_fd,
>         .prime_fd_to_handle =3D drm_gem_prime_fd_to_handle,
>         .gem_prime_import_sg_table =3D pl111_gem_import_sg_table,
> -       .gem_prime_mmap =3D drm_gem_prime_mmap,
>
>  #if defined(CONFIG_DEBUG_FS)
>         .debugfs_init =3D pl111_debugfs_init,
> diff --git a/drivers/gpu/drm/radeon/radeon_drv.c b/drivers/gpu/drm/radeon=
/radeon_drv.c
> index e4374814f0ef6..cf1b960c4200c 100644
> --- a/drivers/gpu/drm/radeon/radeon_drv.c
> +++ b/drivers/gpu/drm/radeon/radeon_drv.c
> @@ -607,7 +607,6 @@ static const struct drm_driver kms_driver =3D {
>         .prime_handle_to_fd =3D drm_gem_prime_handle_to_fd,
>         .prime_fd_to_handle =3D drm_gem_prime_fd_to_handle,
>         .gem_prime_import_sg_table =3D radeon_gem_prime_import_sg_table,
> -       .gem_prime_mmap =3D drm_gem_prime_mmap,
>
>         .name =3D DRIVER_NAME,
>         .desc =3D DRIVER_DESC,
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c b/drivers/gpu/=
drm/renesas/rcar-du/rcar_du_drv.c
> index ed3ee3d15baec..4280ff5fa91f2 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
> @@ -608,7 +608,6 @@ static const struct drm_driver rcar_du_driver =3D {
>         .prime_handle_to_fd     =3D drm_gem_prime_handle_to_fd,
>         .prime_fd_to_handle     =3D drm_gem_prime_fd_to_handle,
>         .gem_prime_import_sg_table =3D rcar_du_gem_prime_import_sg_table,
> -       .gem_prime_mmap         =3D drm_gem_prime_mmap,
>         .fops                   =3D &rcar_du_fops,
>         .name                   =3D "rcar-du",
>         .desc                   =3D "Renesas R-Car Display Unit",
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c b/drivers/gpu/dr=
m/rockchip/rockchip_drm_drv.c
> index c0ebfdf56a711..b8cf89f0cc566 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
> @@ -227,7 +227,6 @@ static const struct drm_driver rockchip_drm_driver =
=3D {
>         .prime_handle_to_fd     =3D drm_gem_prime_handle_to_fd,
>         .prime_fd_to_handle     =3D drm_gem_prime_fd_to_handle,
>         .gem_prime_import_sg_table      =3D rockchip_gem_prime_import_sg_=
table,
> -       .gem_prime_mmap         =3D drm_gem_prime_mmap,
>         .fops                   =3D &rockchip_drm_driver_fops,
>         .name   =3D DRIVER_NAME,
>         .desc   =3D DRIVER_DESC,
> diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.=
c
> index 71f9fdde24b41..845a36e36450d 100644
> --- a/drivers/gpu/drm/v3d/v3d_drv.c
> +++ b/drivers/gpu/drm/v3d/v3d_drv.c
> @@ -174,7 +174,6 @@ static const struct drm_driver v3d_drm_driver =3D {
>         .prime_handle_to_fd =3D drm_gem_prime_handle_to_fd,
>         .prime_fd_to_handle =3D drm_gem_prime_fd_to_handle,
>         .gem_prime_import_sg_table =3D v3d_prime_import_sg_table,
> -       .gem_prime_mmap =3D drm_gem_prime_mmap,
>
>         .ioctls =3D v3d_drm_ioctls,
>         .num_ioctls =3D ARRAY_SIZE(v3d_drm_ioctls),
> diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virti=
o/virtgpu_drv.c
> index add075681e18f..91ace7a44f2a6 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_drv.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
> @@ -188,7 +188,6 @@ static const struct drm_driver driver =3D {
>  #endif
>         .prime_handle_to_fd =3D drm_gem_prime_handle_to_fd,
>         .prime_fd_to_handle =3D drm_gem_prime_fd_to_handle,
> -       .gem_prime_mmap =3D drm_gem_prime_mmap,
>         .gem_prime_import =3D virtgpu_gem_prime_import,
>         .gem_prime_import_sg_table =3D virtgpu_gem_prime_import_sg_table,
>
> diff --git a/drivers/gpu/drm/xen/xen_drm_front.c b/drivers/gpu/drm/xen/xe=
n_drm_front.c
> index 90996c108146d..62c3c13b3a175 100644
> --- a/drivers/gpu/drm/xen/xen_drm_front.c
> +++ b/drivers/gpu/drm/xen/xen_drm_front.c
> @@ -477,7 +477,6 @@ static const struct drm_driver xen_drm_driver =3D {
>         .prime_handle_to_fd        =3D drm_gem_prime_handle_to_fd,
>         .prime_fd_to_handle        =3D drm_gem_prime_fd_to_handle,
>         .gem_prime_import_sg_table =3D xen_drm_front_gem_import_sg_table,
> -       .gem_prime_mmap            =3D drm_gem_prime_mmap,
>         .dumb_create               =3D xen_drm_drv_dumb_create,
>         .fops                      =3D &xen_drm_dev_fops,
>         .name                      =3D "xendrm-du",
> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
> index 89e2706cac561..870278ecd8ba9 100644
> --- a/include/drm/drm_drv.h
> +++ b/include/drm/drm_drv.h
> @@ -343,20 +343,6 @@ struct drm_driver {
>                                 struct drm_device *dev,
>                                 struct dma_buf_attachment *attach,
>                                 struct sg_table *sgt);
> -       /**
> -        * @gem_prime_mmap:
> -        *
> -        * mmap hook for GEM drivers, used to implement dma-buf mmap in t=
he
> -        * PRIME helpers.
> -        *
> -        * This hook only exists for historical reasons. Drivers must use
> -        * drm_gem_prime_mmap() to implement it.
> -        *
> -        * FIXME: Convert all drivers to implement mmap in struct
> -        * &drm_gem_object_funcs and inline drm_gem_prime_mmap() into
> -        * its callers. This hook should be removed afterwards.
> -        */
> -       int (*gem_prime_mmap)(struct drm_gem_object *obj, struct vm_area_=
struct *vma);
>
>         /**
>          * @dumb_create:
> diff --git a/include/drm/drm_gem_dma_helper.h b/include/drm/drm_gem_dma_h=
elper.h
> index 8a043235dad81..61da596780b64 100644
> --- a/include/drm/drm_gem_dma_helper.h
> +++ b/include/drm/drm_gem_dma_helper.h
> @@ -169,8 +169,7 @@ drm_gem_dma_prime_import_sg_table(struct drm_device *=
dev,
>         .dumb_create            =3D (dumb_create_func), \
>         .prime_handle_to_fd     =3D drm_gem_prime_handle_to_fd, \
>         .prime_fd_to_handle     =3D drm_gem_prime_fd_to_handle, \
> -       .gem_prime_import_sg_table =3D drm_gem_dma_prime_import_sg_table,=
 \
> -       .gem_prime_mmap         =3D drm_gem_prime_mmap
> +       .gem_prime_import_sg_table =3D drm_gem_dma_prime_import_sg_table
>
>  /**
>   * DRM_GEM_DMA_DRIVER_OPS - DMA GEM driver operations
> @@ -207,8 +206,7 @@ drm_gem_dma_prime_import_sg_table(struct drm_device *=
dev,
>         .dumb_create            =3D dumb_create_func, \
>         .prime_handle_to_fd     =3D drm_gem_prime_handle_to_fd, \
>         .prime_fd_to_handle     =3D drm_gem_prime_fd_to_handle, \
> -       .gem_prime_import_sg_table =3D drm_gem_dma_prime_import_sg_table_=
vmap, \
> -       .gem_prime_mmap         =3D drm_gem_prime_mmap
> +       .gem_prime_import_sg_table =3D drm_gem_dma_prime_import_sg_table_=
vmap
>
>  /**
>   * DRM_GEM_DMA_DRIVER_OPS_VMAP - DMA GEM driver operations ensuring a vi=
rtual
> diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shm=
em_helper.h
> index 5994fed5e3278..46eb46e690630 100644
> --- a/include/drm/drm_gem_shmem_helper.h
> +++ b/include/drm/drm_gem_shmem_helper.h
> @@ -293,7 +293,6 @@ int drm_gem_shmem_dumb_create(struct drm_file *file, =
struct drm_device *dev,
>         .prime_handle_to_fd     =3D drm_gem_prime_handle_to_fd, \
>         .prime_fd_to_handle     =3D drm_gem_prime_fd_to_handle, \
>         .gem_prime_import_sg_table =3D drm_gem_shmem_prime_import_sg_tabl=
e, \
> -       .gem_prime_mmap         =3D drm_gem_prime_mmap, \
>         .dumb_create            =3D drm_gem_shmem_dumb_create
>
>  #endif /* __DRM_GEM_SHMEM_HELPER_H__ */
> diff --git a/include/drm/drm_gem_vram_helper.h b/include/drm/drm_gem_vram=
_helper.h
> index f4aab64411d82..6b265cb9f45a4 100644
> --- a/include/drm/drm_gem_vram_helper.h
> +++ b/include/drm/drm_gem_vram_helper.h
> @@ -160,7 +160,6 @@ void drm_gem_vram_simple_display_pipe_cleanup_fb(
>         .debugfs_init             =3D drm_vram_mm_debugfs_init, \
>         .dumb_create              =3D drm_gem_vram_driver_dumb_create, \
>         .dumb_map_offset          =3D drm_gem_ttm_dumb_map_offset, \
> -       .gem_prime_mmap           =3D drm_gem_prime_mmap, \
>         .prime_handle_to_fd       =3D drm_gem_prime_handle_to_fd, \
>         .prime_fd_to_handle       =3D drm_gem_prime_fd_to_handle
>
> --
> 2.41.0
>
