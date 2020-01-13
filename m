Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B32261398C4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2020 19:21:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728731AbgAMSVz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Jan 2020 13:21:55 -0500
Received: from mail-io1-f67.google.com ([209.85.166.67]:40998 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728665AbgAMSVy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Jan 2020 13:21:54 -0500
Received: by mail-io1-f67.google.com with SMTP id c16so10856441ioo.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jan 2020 10:21:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=faQWvc/wE+kEb4VK/AMJjVnhIh5CGLbIFJOvwtoDeSQ=;
        b=cV/K54nlcU/NC6qPAsJ+PhswzDd65sDc65Fu3LIM7dUAFtWwmTeIzdcAik7D4owl6g
         ryoa//LuJ0JcpG+WglskivMmtnVOYZ/74e5rXAtS5ps9JTYOvPdkzMdBqcxqSClJtn47
         L9a4oR05F4WN9acV0TFfCso0rk6TOlRCGTw/E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=faQWvc/wE+kEb4VK/AMJjVnhIh5CGLbIFJOvwtoDeSQ=;
        b=b9axsNXUYHqFY7ejgDXdxIotO/iMxQRDpbSuzwdAIawzpbMUdck6j4jBFmPS3I84iZ
         H4MnrjcMEAv3QmEvUQ3NX+lyIIVG4AfEghf09hurP6f6Ek6/8M3OPlJ4KwHdasp8gdl6
         xyiAYPrW79NKsSGYLJ6mYxZViTHtJj6hdnCmq1FcPKX4jxlR37/Lco2EKS398Xz2wFSX
         ywmMDNlWPFwr1IDZ9og06C0Au+s/5oNzWyhJjb8N3EFas95oGaOqRsxd+bApnmsWGU/A
         zD8e/7Gybb38rXQUPbjkDzjHkCz29JucMXQJlhazcKlQbahDQjYLzGBc7fiXzf+3exSP
         y18Q==
X-Gm-Message-State: APjAAAV8j4OWCA174bE3cciwhE5XXUmDuW6VuFx2rsUvZvTS/FLm5Mvw
        vJyUYBOSofHsYD+3Tq5ASZ/wH5wMJ6wmYKFmQSwPAQ==
X-Google-Smtp-Source: APXvYqyzPZ9yAgvXQd/wru4uzogF6SSa/aeZmXqnSB79b3yi+iW0R53EMmdVdntfsz1psPjRpyUt4Rk6+p9cL7DAMkg=
X-Received: by 2002:a5e:a906:: with SMTP id c6mr13209384iod.244.1578939713675;
 Mon, 13 Jan 2020 10:21:53 -0800 (PST)
MIME-Version: 1.0
References: <20200113153605.52350-1-brian@brkho.com> <20200113153605.52350-3-brian@brkho.com>
 <20200113175148.GC26711@jcrouse1-lnx.qualcomm.com>
In-Reply-To: <20200113175148.GC26711@jcrouse1-lnx.qualcomm.com>
From:   Rob Clark <robdclark@chromium.org>
Date:   Mon, 13 Jan 2020 10:21:42 -0800
Message-ID: <CAJs_Fx50tfO=JjoMc_8y+0qe-tgPx75e2_v1G-Vu9r2wpe-rdA@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH 2/2] drm/msm: Add MSM_WAIT_IOVA ioctl
To:     Brian Ho <brian@brkho.com>,
        freedreno <freedreno@lists.freedesktop.org>,
        robdclark@chromium.org, David Airlie <airlied@linux.ie>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <dri-devel@lists.freedesktop.org>, Rob Clark <robdclark@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, hoegsberg@chromium.org,
        Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jan 13, 2020 at 9:51 AM Jordan Crouse <jcrouse@codeaurora.org> wrote:
>
> On Mon, Jan 13, 2020 at 10:36:05AM -0500, Brian Ho wrote:
> > Implements an ioctl to wait until a value at a given iova is greater
> > than or equal to a supplied value.
> >
> > This will initially be used by turnip (open-source Vulkan driver for
> > QC in mesa) for occlusion queries where the userspace driver can
> > block on a query becoming available before continuing via
> > vkGetQueryPoolResults.
> >
> > Signed-off-by: Brian Ho <brian@brkho.com>
> > ---
> >  drivers/gpu/drm/msm/msm_drv.c | 63 +++++++++++++++++++++++++++++++++--
> >  include/uapi/drm/msm_drm.h    | 13 ++++++++
> >  2 files changed, 74 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> > index c84f0a8b3f2c..dcc46874a5a2 100644
> > --- a/drivers/gpu/drm/msm/msm_drv.c
> > +++ b/drivers/gpu/drm/msm/msm_drv.c
> > @@ -36,10 +36,11 @@
> >   *           MSM_GEM_INFO ioctl.
> >   * - 1.4.0 - softpin, MSM_RELOC_BO_DUMP, and GEM_INFO support to set/get
> >   *           GEM object's debug name
> > - * - 1.5.0 - Add SUBMITQUERY_QUERY ioctl
> > + * - 1.5.0 - Add SUBMITQUEUE_QUERY ioctl
> > + * - 1.6.0 - Add WAIT_IOVA ioctl
> >   */
> >  #define MSM_VERSION_MAJOR    1
> > -#define MSM_VERSION_MINOR    5
> > +#define MSM_VERSION_MINOR    6
> >  #define MSM_VERSION_PATCHLEVEL       0
> >
> >  static const struct drm_mode_config_funcs mode_config_funcs = {
> > @@ -952,6 +953,63 @@ static int msm_ioctl_submitqueue_close(struct drm_device *dev, void *data,
> >       return msm_submitqueue_remove(file->driver_priv, id);
> >  }
> >
> > +static int msm_ioctl_wait_iova(struct drm_device *dev, void *data,
> > +             struct drm_file *file)
> > +{
> > +     struct msm_drm_private *priv = dev->dev_private;
> > +     struct drm_gem_object *obj;
> > +     struct drm_msm_wait_iova *args = data;
> > +     ktime_t timeout = to_ktime(args->timeout);
> > +     unsigned long remaining_jiffies = timeout_to_jiffies(&timeout);
> > +     struct msm_gpu *gpu = priv->gpu;
> > +     void *base_vaddr;
> > +     uint64_t *vaddr;
> > +     int ret;
> > +
> > +     if (args->pad)
> > +             return -EINVAL;
> > +
> > +     if (!gpu)
> > +             return 0;
>
> If the GPU isn't up, it should be an error since this macro is specifically
> designed for just the GPU (though, I suppose the display *COULD* use it to watch
> a memory mapped register or something).
>
> > +
> > +     obj = drm_gem_object_lookup(file, args->handle);
> > +     if (!obj)
> > +             return -ENOENT;
> > +
> > +     base_vaddr = msm_gem_get_vaddr(obj);
> > +     if (IS_ERR(base_vaddr)) {
> > +             ret = PTR_ERR(base_vaddr);
> > +             goto err_put_gem_object;
> > +     }
> > +     if (args->offset + sizeof(*vaddr) > obj->size) {
>
> There is a chance to trigger a u64 overflow here resulting in an arbitrary (ish)
> vaddr two lines below.
>
>
> > +             ret = -EINVAL;
> > +             goto err_put_vaddr;
> > +     }
>
> You can check this before getting the vaddr which would save you a clean up
> step.
>
> > +
> > +     vaddr = base_vaddr + args->offset;
> > +
> > +     /* Assumes WC mapping */
> > +     ret = wait_event_interruptible_timeout(
> > +                     gpu->event, *vaddr >= args->value, remaining_jiffies);
>
> I feel like a barrier might be needed before checking *vaddr just in case you
> get the interrupt and wake up the queue before the write posts from the
> hardware.
>
> > +
>
> > +     if (ret == 0) {
> > +             ret = -ETIMEDOUT;
> > +             goto err_put_vaddr;
> > +     } else if (ret == -ERESTARTSYS) {
> > +             goto err_put_vaddr;
> > +     }
>
> You don't need either goto here because both paths execute the following cleanup
> steps. I'm also not sure you need to worry about explicitly checking the
> ERESTARTSYS value, I think that this would be sufficient:
>
>  if (ret == 0)
>      ret = -ETIMEDOUT;
>  else if (ret > 0)
>      ret = 0;
>
> > +
>
> Put your err_put_vaddr: label here, but looking up, if you move the bounds check
> before the msm_gem_get_vaddr, I don't think you need a label.
>
> > +     msm_gem_put_vaddr(obj);
>
> Put the err_put_gem_object: label here.
>
> > +     drm_gem_object_put_unlocked(obj);
> > +     return 0;
>
> return ret;
>
> > +
> > +err_put_vaddr:
> > +     msm_gem_put_vaddr(obj);
> > +err_put_gem_object:
> > +     drm_gem_object_put_unlocked(obj);
> > +     return ret;
> > +}
>
> And then these guys aren't needed.
>
> > +
> >  static const struct drm_ioctl_desc msm_ioctls[] = {
> >       DRM_IOCTL_DEF_DRV(MSM_GET_PARAM,    msm_ioctl_get_param,    DRM_RENDER_ALLOW),
> >       DRM_IOCTL_DEF_DRV(MSM_GEM_NEW,      msm_ioctl_gem_new,      DRM_RENDER_ALLOW),
> > @@ -964,6 +1022,7 @@ static const struct drm_ioctl_desc msm_ioctls[] = {
> >       DRM_IOCTL_DEF_DRV(MSM_SUBMITQUEUE_NEW,   msm_ioctl_submitqueue_new,   DRM_RENDER_ALLOW),
> >       DRM_IOCTL_DEF_DRV(MSM_SUBMITQUEUE_CLOSE, msm_ioctl_submitqueue_close, DRM_RENDER_ALLOW),
> >       DRM_IOCTL_DEF_DRV(MSM_SUBMITQUEUE_QUERY, msm_ioctl_submitqueue_query, DRM_RENDER_ALLOW),
> > +     DRM_IOCTL_DEF_DRV(MSM_WAIT_IOVA, msm_ioctl_wait_iova, DRM_RENDER_ALLOW),
> >  };
> >
> >  static const struct vm_operations_struct vm_ops = {
> > diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
> > index 0b85ed6a3710..8477f28a4ee1 100644
> > --- a/include/uapi/drm/msm_drm.h
> > +++ b/include/uapi/drm/msm_drm.h
> > @@ -298,6 +298,17 @@ struct drm_msm_submitqueue_query {
> >       __u32 pad;
> >  };
> >
> > +/* This ioctl blocks until the u64 value at bo + offset is greater than or
> > + * equal to the reference value.
> > + */
> > +struct drm_msm_wait_iova {
> > +     __u32 handle;          /* in, GEM handle */
> > +     __u32 pad;
> > +     struct drm_msm_timespec timeout;   /* in */
> > +     __u64 offset;          /* offset into bo */
> > +     __u64 value;           /* reference value */
>
> Any specific reason why we wouldn't just put the offset and value first and save
> ourselves the padding?

I'd actually like to have a pad must-be-zero flag to make this easier
to extend in the future, if needed.

(Maybe there is a use-case for a wait_iova that is scoped to a
specific submit-queue, or we want to add other types of tests beyond
GTE, etc)

BR,
-R


> > +};
> > +
> >  #define DRM_MSM_GET_PARAM              0x00
> >  /* placeholder:
> >  #define DRM_MSM_SET_PARAM              0x01
> > @@ -315,6 +326,7 @@ struct drm_msm_submitqueue_query {
> >  #define DRM_MSM_SUBMITQUEUE_NEW        0x0A
> >  #define DRM_MSM_SUBMITQUEUE_CLOSE      0x0B
> >  #define DRM_MSM_SUBMITQUEUE_QUERY      0x0C
> > +#define DRM_MSM_WAIT_IOVA      0x0D
> >
> >  #define DRM_IOCTL_MSM_GET_PARAM        DRM_IOWR(DRM_COMMAND_BASE + DRM_MSM_GET_PARAM, struct drm_msm_param)
> >  #define DRM_IOCTL_MSM_GEM_NEW          DRM_IOWR(DRM_COMMAND_BASE + DRM_MSM_GEM_NEW, struct drm_msm_gem_new)
> > @@ -327,6 +339,7 @@ struct drm_msm_submitqueue_query {
> >  #define DRM_IOCTL_MSM_SUBMITQUEUE_NEW    DRM_IOWR(DRM_COMMAND_BASE + DRM_MSM_SUBMITQUEUE_NEW, struct drm_msm_submitqueue)
> >  #define DRM_IOCTL_MSM_SUBMITQUEUE_CLOSE  DRM_IOW (DRM_COMMAND_BASE + DRM_MSM_SUBMITQUEUE_CLOSE, __u32)
> >  #define DRM_IOCTL_MSM_SUBMITQUEUE_QUERY  DRM_IOW (DRM_COMMAND_BASE + DRM_MSM_SUBMITQUEUE_QUERY, struct drm_msm_submitqueue_query)
> > +#define DRM_IOCTL_MSM_WAIT_IOVA        DRM_IOW (DRM_COMMAND_BASE + DRM_MSM_WAIT_IOVA, struct drm_msm_wait_iova)
> >
> >  #if defined(__cplusplus)
> >  }
> > --
> > 2.25.0.rc1.283.g88dfdc4193-goog
> >
> > _______________________________________________
> > Freedreno mailing list
> > Freedreno@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/freedreno
>
> --
> The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
> a Linux Foundation Collaborative Project
