Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E575C13AFA7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2020 17:40:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726270AbgANQk4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Jan 2020 11:40:56 -0500
Received: from mail-ot1-f99.google.com ([209.85.210.99]:45386 "EHLO
        mail-ot1-f99.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726053AbgANQkx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Jan 2020 11:40:53 -0500
Received: by mail-ot1-f99.google.com with SMTP id 59so13202912otp.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jan 2020 08:40:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brkho-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=cc7Za5Y/R1rp2q5C1XKjl4yrTgkVP1wqFap7o5I27FE=;
        b=ELFy8dY4mQe2s4MT9ahOjzu7/Snid/fjMusqEFf24hXsW3yg0yiBuCmnvl5J/syFxZ
         z+mFeMh5KjXEZV76BpzxNDLqUyGeASLVSd/2o9XB1F8d9KoLg7BJ6hkd51wf7wNOPL0A
         5jfL7DSmM775RnPik5VawzWUWUbVVMtupMmkZDV6rWZqRkLU1JftNqtUIyvcStleNHut
         x/+zKMUAuUHirCeAR/5Xpn+CsTqQa2RT1eBKH6oppqkeIzHLmnPjXa2NAWylvk6nc1F1
         4M3laqsPTEvKYCiE3k+akrX94JavtnqQexd7JSjtngrtOcPyXEu7YI7uVNcB5GdySRwi
         YiLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=cc7Za5Y/R1rp2q5C1XKjl4yrTgkVP1wqFap7o5I27FE=;
        b=nLsKSBdISDj7NuynjXE5nVC5u9BESCnnAZKuhn79W1HQ/jJvcr5D6D8BgThtihszSW
         yOklF8aRPQ8pttmNM8LYOXsDlqSbkYyC8XJeZa6lBO78UuhaEl0nr59LOVGrmKvmfBTm
         SsXLgYBLsZBoWgcBnPjxc4KoSHjpBkq0qaYLsiC8ykBPdlvWD7TIGe3LXdgNUF32HYuQ
         X4wGdxPLj1TUQzH3Eh0h9rRdLFE5h1LdddMiTfpIC1vs6xwKM4rFrfvgfPSb+xOhhn4Q
         GDca+ja2A3VpXe/19jnTcKmpVqwL8xgEg4K6cBC4hRlwAju93oXfcetZUA1Dpvj0CJs/
         mn+Q==
X-Gm-Message-State: APjAAAUYmJs/nbWcytpTxSuQkECQCVGJ6M04WuRzm6w71ANkENGRnbe7
        g4EjSO6ER77eY4CCh++gORR9t7BEFJ0Kkm5p+pijZaMn3WSPzg==
X-Google-Smtp-Source: APXvYqw5ANolhtEOEHbIFOgMMC+Kec3dfnRg8HKRPQhGMPYjtzAt5SkhCCKSUDGLWRXd+G72NEHJ3THlXy3C
X-Received: by 2002:a05:6830:1141:: with SMTP id x1mr18041465otq.120.1579020052295;
        Tue, 14 Jan 2020 08:40:52 -0800 (PST)
Received: from google.com ([100.118.32.120])
        by smtp-relay.gmail.com with ESMTPS id d15sm1728317otl.0.2020.01.14.08.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2020 08:40:52 -0800 (PST)
X-Relaying-Domain: brkho.com
Date:   Tue, 14 Jan 2020 11:40:35 -0500
From:   Brian Ho <brian@brkho.com>
To:     Rob Clark <robdclark@chromium.org>
Cc:     Kristian Kristensen <hoegsberg@google.com>,
        freedreno <freedreno@lists.freedesktop.org>,
        hoegsberg <hoegsberg@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <dri-devel@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] drm/msm: Add MSM_WAIT_IOVA ioctl
Message-ID: <20200114164034.GA213224@google.com>
References: <20200113153605.52350-1-brian@brkho.com>
 <20200113153605.52350-3-brian@brkho.com>
 <CAJs_Fx48B-C8GEeAmPaqGAqAOTR2dT0csg8W=TRyULOfy=1=VQ@mail.gmail.com>
 <CAOPc6Tn8CWVzcLoJOGmn3CW6B9FMKf_-NzE8TpwDHsPfoQDaQQ@mail.gmail.com>
 <20200113225516.GA157345@google.com>
 <CAJs_Fx5i-cZ0qXk_jNo=JGfZRc7uuvUcTZ2TE1ppuYUfNLymKQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJs_Fx5i-cZ0qXk_jNo=JGfZRc7uuvUcTZ2TE1ppuYUfNLymKQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jan 13, 2020 at 03:17:38PM -0800, Rob Clark wrote:
> On Mon, Jan 13, 2020 at 2:55 PM Brian Ho <brian@brkho.com> wrote:
> >
> > On Mon, Jan 13, 2020 at 09:57:43AM -0800, Kristian Kristensen wrote:
> > > On Mon, Jan 13, 2020 at 8:25 AM Rob Clark <robdclark@chromium.org> wrote:
> > >
> > > > On Mon, Jan 13, 2020 at 7:37 AM Brian Ho <brian@brkho.com> wrote:
> > > > >
> > > > > Implements an ioctl to wait until a value at a given iova is greater
> > > > > than or equal to a supplied value.
> > > > >
> > > > > This will initially be used by turnip (open-source Vulkan driver for
> > > > > QC in mesa) for occlusion queries where the userspace driver can
> > > > > block on a query becoming available before continuing via
> > > > > vkGetQueryPoolResults.
> > > > >
> > > > > Signed-off-by: Brian Ho <brian@brkho.com>
> > > > > ---
> > > > >  drivers/gpu/drm/msm/msm_drv.c | 63 +++++++++++++++++++++++++++++++++--
> > > > >  include/uapi/drm/msm_drm.h    | 13 ++++++++
> > > > >  2 files changed, 74 insertions(+), 2 deletions(-)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/msm/msm_drv.c
> > > > b/drivers/gpu/drm/msm/msm_drv.c
> > > > > index c84f0a8b3f2c..dcc46874a5a2 100644
> > > > > --- a/drivers/gpu/drm/msm/msm_drv.c
> > > > > +++ b/drivers/gpu/drm/msm/msm_drv.c
> > > > > @@ -36,10 +36,11 @@
> > > > >   *           MSM_GEM_INFO ioctl.
> > > > >   * - 1.4.0 - softpin, MSM_RELOC_BO_DUMP, and GEM_INFO support to set/get
> > > > >   *           GEM object's debug name
> > > > > - * - 1.5.0 - Add SUBMITQUERY_QUERY ioctl
> > > > > + * - 1.5.0 - Add SUBMITQUEUE_QUERY ioctl
> > > > > + * - 1.6.0 - Add WAIT_IOVA ioctl
> > > > >   */
> > > > >  #define MSM_VERSION_MAJOR      1
> > > > > -#define MSM_VERSION_MINOR      5
> > > > > +#define MSM_VERSION_MINOR      6
> > > > >  #define MSM_VERSION_PATCHLEVEL 0
> > > > >
> > > > >  static const struct drm_mode_config_funcs mode_config_funcs = {
> > > > > @@ -952,6 +953,63 @@ static int msm_ioctl_submitqueue_close(struct
> > > > drm_device *dev, void *data,
> > > > >         return msm_submitqueue_remove(file->driver_priv, id);
> > > > >  }
> > > > >
> > > > > +static int msm_ioctl_wait_iova(struct drm_device *dev, void *data,
> > > > > +               struct drm_file *file)
> > > > > +{
> > > > > +       struct msm_drm_private *priv = dev->dev_private;
> > > > > +       struct drm_gem_object *obj;
> > > > > +       struct drm_msm_wait_iova *args = data;
> > > > > +       ktime_t timeout = to_ktime(args->timeout);
> > > > > +       unsigned long remaining_jiffies = timeout_to_jiffies(&timeout);
> > > > > +       struct msm_gpu *gpu = priv->gpu;
> > > > > +       void *base_vaddr;
> > > > > +       uint64_t *vaddr;
> > > > > +       int ret;
> > > > > +
> > > > > +       if (args->pad)
> > > > > +               return -EINVAL;
> > > > > +
> > > > > +       if (!gpu)
> > > > > +               return 0;
> > > >
> > > > hmm, I'm not sure we should return zero in this case.. maybe -ENODEV?
> > > >
> > > > > +
> > > > > +       obj = drm_gem_object_lookup(file, args->handle);
> > > > > +       if (!obj)
> > > > > +               return -ENOENT;
> > > > > +
> > > > > +       base_vaddr = msm_gem_get_vaddr(obj);
> > > > > +       if (IS_ERR(base_vaddr)) {
> > > > > +               ret = PTR_ERR(base_vaddr);
> > > > > +               goto err_put_gem_object;
> > > > > +       }
> > > > > +       if (args->offset + sizeof(*vaddr) > obj->size) {
> > > > > +               ret = -EINVAL;
> > > > > +               goto err_put_vaddr;
> > > > > +       }
> > > > > +
> > > > > +       vaddr = base_vaddr + args->offset;
> > > > > +
> > > > > +       /* Assumes WC mapping */
> > > > > +       ret = wait_event_interruptible_timeout(
> > > > > +                       gpu->event, *vaddr >= args->value,
> > > > remaining_jiffies);
> > > >
> > >
> > > This needs to do the awkward looking
> > >
> > >   (int64_t)(*data - value) >= 0
> > >
> > > to properly handle the wraparound case.
> > >
> >
> > I think this comparison will run into issues if we allow for 64-bit
> > reference values. For example, if value is ULLONG_MAX, and *data
> > starts at 0 on the first comparison, we'll immediately return.
> >
> > It's not too much of an issue in fence_completed (msm_fence.c), but
> > in this ioctl, *data can grow at an arbitrary rate. Are we concerned
> > about this?
> >
> > > > +
> > > > > +       if (ret == 0) {
> > > > > +               ret = -ETIMEDOUT;
> > > > > +               goto err_put_vaddr;
> > > > > +       } else if (ret == -ERESTARTSYS) {
> > > > > +               goto err_put_vaddr;
> > > > > +       }
> > > >
> > > > maybe:
> > > >
> > > >  } else {
> > > >    ret = 0;
> > > >  }
> > > >
> > > > and then drop the next three lines?
> > > >
> > > > > +
> > > > > +       msm_gem_put_vaddr(obj);
> > > > > +       drm_gem_object_put_unlocked(obj);
> > > > > +       return 0;
> > > > > +
> > > > > +err_put_vaddr:
> > > > > +       msm_gem_put_vaddr(obj);
> > > > > +err_put_gem_object:
> > > > > +       drm_gem_object_put_unlocked(obj);
> > > > > +       return ret;
> > > > > +}
> > > > > +
> > > > >  static const struct drm_ioctl_desc msm_ioctls[] = {
> > > > >         DRM_IOCTL_DEF_DRV(MSM_GET_PARAM,    msm_ioctl_get_param,
> > > > DRM_RENDER_ALLOW),
> > > > >         DRM_IOCTL_DEF_DRV(MSM_GEM_NEW,      msm_ioctl_gem_new,
> > > > DRM_RENDER_ALLOW),
> > > > > @@ -964,6 +1022,7 @@ static const struct drm_ioctl_desc msm_ioctls[] = {
> > > > >         DRM_IOCTL_DEF_DRV(MSM_SUBMITQUEUE_NEW,
> > > >  msm_ioctl_submitqueue_new,   DRM_RENDER_ALLOW),
> > > > >         DRM_IOCTL_DEF_DRV(MSM_SUBMITQUEUE_CLOSE,
> > > > msm_ioctl_submitqueue_close, DRM_RENDER_ALLOW),
> > > > >         DRM_IOCTL_DEF_DRV(MSM_SUBMITQUEUE_QUERY,
> > > > msm_ioctl_submitqueue_query, DRM_RENDER_ALLOW),
> > > > > +       DRM_IOCTL_DEF_DRV(MSM_WAIT_IOVA, msm_ioctl_wait_iova,
> > > > DRM_RENDER_ALLOW),
> > > > >  };
> > > > >
> > > > >  static const struct vm_operations_struct vm_ops = {
> > > > > diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
> > > > > index 0b85ed6a3710..8477f28a4ee1 100644
> > > > > --- a/include/uapi/drm/msm_drm.h
> > > > > +++ b/include/uapi/drm/msm_drm.h
> > > > > @@ -298,6 +298,17 @@ struct drm_msm_submitqueue_query {
> > > > >         __u32 pad;
> > > > >  };
> > > > >
> > > > > +/* This ioctl blocks until the u64 value at bo + offset is greater than
> > > > or
> > > > > + * equal to the reference value.
> > > > > + */
> > > > > +struct drm_msm_wait_iova {
> > > > > +       __u32 handle;          /* in, GEM handle */
> > > > > +       __u32 pad;
> > > > > +       struct drm_msm_timespec timeout;   /* in */
> > > > > +       __u64 offset;          /* offset into bo */
> > > > > +       __u64 value;           /* reference value */
> > > >
> > > > Maybe we should go ahead and add a __u64 mask;
> > > >
> > > > that would let us wait for 32b values as well, and wait for bits in a
> > > > bitmask
> > > >
> > >
> > > I think we'd be OK to just default to 32 bit values instead, since most of
> > > the CP commands that this is intended to work with (CP_EVENT_WRITE,
> > > CP_WAIT_MEM_GTE etc) operate on 32 bit values. We could move 'value' to the
> > > slot right after 'handle' but then we'd not have any pad/reserved fields.
> > > Maybe we keep 'value' 64 bit but restrict it to 32 bits, with an option to
> > > add a 64 bit flag in 'pad' later on?
> > >
> >
> > FWIW, the current usage of this in my mesa MR uses a 64 bit value.
> > There's no super great reason that the available bit is 64 bits and
> > not 32 bits (I think it made the addressing math a bit simpler), but
> > I'm fine with whatever you all decide on here.
> >
> 
> I assume you are waiting for a fence value written w/ CP_EVENT_WRITE?
> Or at least that is what I'd recommend.  That would be 32b
> 
> BR,
> -R
> 

So it's actually a little bit different than that. I allocate a bo
for the occlusion query which has an "availability" bit (0 for
unavailable, 1 for available). When the occlusion query ends, we
write the fragments passed value to the bo via CP_EVENT_WRITE and
then wait for that write to complete before setting the available
bit to 1 via a simple CP_MEM_WRITE [1].

It's that CP_MEM_WRITE that I plan on waiting on with this new iova
ioctl.

[1] https://gitlab.freedesktop.org/mesa/mesa/blob/768106c50a5569796bb6d5e04b5e4d65c1d00ea0/src/freedreno/vulkan/tu_query.c#L529

> > > >
> > > > Other than those minor comments, it looks pretty good to me
> > > >
> > > > BR,
> > > > -R
> > > >
> > > > > +};
> > > > > +
> > > > >  #define DRM_MSM_GET_PARAM              0x00
> > > > >  /* placeholder:
> > > > >  #define DRM_MSM_SET_PARAM              0x01
> > > > > @@ -315,6 +326,7 @@ struct drm_msm_submitqueue_query {
> > > > >  #define DRM_MSM_SUBMITQUEUE_NEW        0x0A
> > > > >  #define DRM_MSM_SUBMITQUEUE_CLOSE      0x0B
> > > > >  #define DRM_MSM_SUBMITQUEUE_QUERY      0x0C
> > > > > +#define DRM_MSM_WAIT_IOVA      0x0D
> > > > >
> > > > >  #define DRM_IOCTL_MSM_GET_PARAM        DRM_IOWR(DRM_COMMAND_BASE +
> > > > DRM_MSM_GET_PARAM, struct drm_msm_param)
> > > > >  #define DRM_IOCTL_MSM_GEM_NEW          DRM_IOWR(DRM_COMMAND_BASE +
> > > > DRM_MSM_GEM_NEW, struct drm_msm_gem_new)
> > > > > @@ -327,6 +339,7 @@ struct drm_msm_submitqueue_query {
> > > > >  #define DRM_IOCTL_MSM_SUBMITQUEUE_NEW    DRM_IOWR(DRM_COMMAND_BASE +
> > > > DRM_MSM_SUBMITQUEUE_NEW, struct drm_msm_submitqueue)
> > > > >  #define DRM_IOCTL_MSM_SUBMITQUEUE_CLOSE  DRM_IOW (DRM_COMMAND_BASE +
> > > > DRM_MSM_SUBMITQUEUE_CLOSE, __u32)
> > > > >  #define DRM_IOCTL_MSM_SUBMITQUEUE_QUERY  DRM_IOW (DRM_COMMAND_BASE +
> > > > DRM_MSM_SUBMITQUEUE_QUERY, struct drm_msm_submitqueue_query)
> > > > > +#define DRM_IOCTL_MSM_WAIT_IOVA        DRM_IOW (DRM_COMMAND_BASE +
> > > > DRM_MSM_WAIT_IOVA, struct drm_msm_wait_iova)
> > > > >
> > > > >  #if defined(__cplusplus)
> > > > >  }
> > > > > --
> > > > > 2.25.0.rc1.283.g88dfdc4193-goog
> > > > >
> > > >
