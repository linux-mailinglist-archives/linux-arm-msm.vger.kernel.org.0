Return-Path: <linux-arm-msm+bounces-221-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 334587E6386
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Nov 2023 07:06:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D3395281136
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Nov 2023 06:06:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF6BBD292;
	Thu,  9 Nov 2023 06:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZxI0ZuK8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6CAFD27D
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Nov 2023 06:06:11 +0000 (UTC)
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 277C726A4
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Nov 2023 22:06:11 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-9becde9ea7bso334801966b.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Nov 2023 22:06:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1699509969; x=1700114769; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mhQRJ2tsdSmsbr+tWtWTDDJ49tF/bwf8rgyCxeQj0go=;
        b=ZxI0ZuK8xctNKm5ZBcbijs8aiEwWdi4Oxsajl5rcVfl857bti2Px2nlA1loeLQrJ51
         4flyPnqUlmdaBIGhclsIIGDo5qVw6/NVKILsh5btWR3IiE4zgFJbIpoU+Q46VYDPtugr
         RGd09V4nTYpfFmsWuW/ph73Q2dASc5XLiOQGM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699509969; x=1700114769;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mhQRJ2tsdSmsbr+tWtWTDDJ49tF/bwf8rgyCxeQj0go=;
        b=X7Kg3mJeDD4uR9xYiKi2h6AtwIkj4BA2x/8LLyhMLgnmtF4KeFgjSopI/wbCMmT3kE
         LiCGiZ6BKXn27HY3MwPbEScaB+1wZlHUibcnepSrcOP/K9V/46HKs3hujNEV7RRoqRB4
         VEMTouo1iY7NtMA4BZKdstdqdePxxGQFv2svbK1h9byN7u8D7q0t+/VDtx9jCmQdL2uh
         4RNFM8ADKwz+N0kfNASpkopxY5EIWbsNxQCTlMyagjuU5gRTnb6yeCaj9oJi+8ur3EZG
         4vb1e56wUQiHAsruaqPL8wF+vxSlJBbuxfqI1ETEfAnSEIan0ML5hGOI2W4Zg8xdgNoF
         +EhQ==
X-Gm-Message-State: AOJu0YzehHPpzLRv83k6FX+mlXAihtdPkSVFaQuMEyWBDW0yBzd2qjAm
	F9A3Vqr+jT5H5iF8sCQgzxu7BvxyLLP40mI+hRYgyBYW
X-Google-Smtp-Source: AGHT+IF/c11zXdnWPV8MTqYmblB1lMpope0eFTBrCvMo6hpJfVPNRfupiTR8t/GX2H8YiTwmY6PSbA==
X-Received: by 2002:a17:906:7092:b0:9ad:e62c:4517 with SMTP id b18-20020a170906709200b009ade62c4517mr6946096ejk.34.1699509968847;
        Wed, 08 Nov 2023 22:06:08 -0800 (PST)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com. [209.85.128.53])
        by smtp.gmail.com with ESMTPSA id t18-20020a1709066bd200b009db9c5e9b4csm2046995ejs.122.2023.11.08.22.06.08
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Nov 2023 22:06:08 -0800 (PST)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4081ccf69dcso9487395e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Nov 2023 22:06:08 -0800 (PST)
X-Received: by 2002:a5d:648c:0:b0:32f:86e7:9bef with SMTP id
 o12-20020a5d648c000000b0032f86e79befmr5265032wri.8.1699509967695; Wed, 08 Nov
 2023 22:06:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231106143940.324020-1-benjamin.gaignard@collabora.com>
 <20231108102444.4yp7y7mgsociy725@chromium.org> <1da380ce-aef9-4ed2-9581-21301833d556@collabora.com>
In-Reply-To: <1da380ce-aef9-4ed2-9581-21301833d556@collabora.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Thu, 9 Nov 2023 15:05:48 +0900
X-Gmail-Original-Message-ID: <CAAFQd5DDpqZc41qKF_6mzOF3YAR_c6swisVDNSjapRFxHz2s9Q@mail.gmail.com>
Message-ID: <CAAFQd5DDpqZc41qKF_6mzOF3YAR_c6swisVDNSjapRFxHz2s9Q@mail.gmail.com>
Subject: Re: [PATCH v14.1] media: videobuf2: Be more flexible on the number of
 queue stored buffers
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: mchehab@kernel.org, m.szyprowski@samsung.com, ming.qian@nxp.com, 
	ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de, 
	gregkh@linuxfoundation.org, hverkuil-cisco@xs4all.nl, 
	nicolas.dufresne@collabora.com, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev, 
	kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 8, 2023 at 10:56=E2=80=AFPM Benjamin Gaignard
<benjamin.gaignard@collabora.com> wrote:
>
>
> Le 08/11/2023 =C3=A0 11:24, Tomasz Figa a =C3=A9crit :
> > On Mon, Nov 06, 2023 at 03:39:40PM +0100, Benjamin Gaignard wrote:
> >> Add 'max_num_buffers' field in vb2_queue struct to let drivers decide
> >> how many buffers could be stored in a queue.
> >> This require 'bufs' array to be allocated at queue init time and freed
> >> when releasing the queue.
> >> By default VB2_MAX_FRAME remains the limit.
> >>
> >> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> >> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> >> ---
> >> version 14.1:
> >> - Do not change the number of freed buffers in vb2_core_queue_release(=
).
> >>
> >>   .../media/common/videobuf2/videobuf2-core.c   | 39 +++++++++++++++--=
--
> >>   .../media/common/videobuf2/videobuf2-v4l2.c   |  6 +--
> >>   include/media/videobuf2-core.h                | 10 ++++-
> >>   3 files changed, 43 insertions(+), 12 deletions(-)
> >>
> >> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers=
/media/common/videobuf2/videobuf2-core.c
> >> index c5c5ae4d213d..5711c6a130fd 100644
> >> --- a/drivers/media/common/videobuf2/videobuf2-core.c
> >> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> >> @@ -416,7 +416,7 @@ static void init_buffer_cache_hints(struct vb2_que=
ue *q, struct vb2_buffer *vb)
> >>    */
> >>   static void vb2_queue_add_buffer(struct vb2_queue *q, struct vb2_buf=
fer *vb, unsigned int index)
> >>   {
> >> -    WARN_ON(index >=3D VB2_MAX_FRAME || q->bufs[index]);
> >> +    WARN_ON(index >=3D q->max_num_buffers || q->bufs[index]);
> >>
> >>      q->bufs[index] =3D vb;
> >>      vb->index =3D index;
> >> @@ -449,9 +449,9 @@ static int __vb2_queue_alloc(struct vb2_queue *q, =
enum vb2_memory memory,
> >>      struct vb2_buffer *vb;
> >>      int ret;
> >>
> >> -    /* Ensure that q->num_buffers+num_buffers is below VB2_MAX_FRAME =
*/
> >> +    /* Ensure that the number of already queue + num_buffers is below=
 q->max_num_buffers */
> > Perhaps "the number of buffers already in the queue"?
>
> I will do that in the next version.
>
> >
> >>      num_buffers =3D min_t(unsigned int, num_buffers,
> >> -                        VB2_MAX_FRAME - q_num_buffers);
> >> +                        q->max_num_buffers - q_num_buffers);
> >>
> >>      for (buffer =3D 0; buffer < num_buffers; ++buffer) {
> >>              /* Allocate vb2 buffer structures */
> >> @@ -813,7 +813,7 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2=
_memory memory,
> >>      unsigned plane_sizes[VB2_MAX_PLANES] =3D { };
> >>      bool non_coherent_mem =3D flags & V4L2_MEMORY_FLAG_NON_COHERENT;
> >>      unsigned int i;
> >> -    int ret;
> >> +    int ret =3D 0;
> >>
> >>      if (q->streaming) {
> >>              dprintk(q, 1, "streaming active\n");
> >> @@ -857,17 +857,22 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum v=
b2_memory memory,
> >>      /*
> >>       * Make sure the requested values and current defaults are sane.
> >>       */
> >> -    WARN_ON(q->min_buffers_needed > VB2_MAX_FRAME);
> > Do we really want to remove this warning completely?
>
> Yes because VB2_MAX_FRAME is no more relevant.

Hmm, but we still have q->max_num_buffers. Although given your reply
to my other comment below, we may be able to just ensure the value is
valid in vb2_core_queue_init().

>
> >
> >>      num_buffers =3D max_t(unsigned int, *count, q->min_buffers_needed=
);
> >> -    num_buffers =3D min_t(unsigned int, num_buffers, VB2_MAX_FRAME);
> >> +    num_buffers =3D min_t(unsigned int, num_buffers, q->max_num_buffe=
rs);
> >>      memset(q->alloc_devs, 0, sizeof(q->alloc_devs));
> >>      /*
> >>       * Set this now to ensure that drivers see the correct q->memory =
value
> >>       * in the queue_setup op.
> >>       */
> >>      mutex_lock(&q->mmap_lock);
> >> +    if (!q->bufs)
> >> +            q->bufs =3D kcalloc(q->max_num_buffers, sizeof(*q->bufs),=
 GFP_KERNEL);
> > Shouldn't this happen in core code rather than the v4l2-specific ioctl
> > helper? Since we just allocate the maximum possible size, then maybe
> > vb2_core_queue_init()?
>
> Hans had already suggest that in a previous version but it appear that
> vb2_core_queue_init() and vb2_core_queue_release() aren't balanced so
> we got cases where queue aren't initialized before reqbufs or create_bufs
> that why I had to put this allocation here.

How about __vb2_queue_alloc()?

>
> >
> >> +    if (!q->bufs)
> >> +            ret =3D -ENOMEM;
> >>      q->memory =3D memory;
> >>      mutex_unlock(&q->mmap_lock);
> >> +    if (ret)
> >> +            return ret;
> >>      set_queue_coherency(q, non_coherent_mem);
> >>
> >>      /*
> >> @@ -976,7 +981,7 @@ int vb2_core_create_bufs(struct vb2_queue *q, enum=
 vb2_memory memory,
> >>      bool no_previous_buffers =3D !q_num_bufs;
> >>      int ret =3D 0;
> >>
> >> -    if (q_num_bufs =3D=3D VB2_MAX_FRAME) {
> >> +    if (q->num_buffers =3D=3D q->max_num_buffers) {
> >>              dprintk(q, 1, "maximum number of buffers already allocate=
d\n");
> >>              return -ENOBUFS;
> >>      }
> >> @@ -993,7 +998,13 @@ int vb2_core_create_bufs(struct vb2_queue *q, enu=
m vb2_memory memory,
> >>               */
> >>              mutex_lock(&q->mmap_lock);
> >>              q->memory =3D memory;
> >> +            if (!q->bufs)
> >> +                    q->bufs =3D kcalloc(q->max_num_buffers, sizeof(*q=
->bufs), GFP_KERNEL);
> > Ditto.
> >
> >> +            if (!q->bufs)
> >> +                    ret =3D -ENOMEM;
> >>              mutex_unlock(&q->mmap_lock);
> >> +            if (ret)
> >> +                    return ret;
> >>              q->waiting_for_buffers =3D !q->is_output;
> >>              set_queue_coherency(q, non_coherent_mem);
> >>      } else {
> >> @@ -1005,7 +1016,7 @@ int vb2_core_create_bufs(struct vb2_queue *q, en=
um vb2_memory memory,
> >>                      return -EINVAL;
> >>      }
> >>
> >> -    num_buffers =3D min(*count, VB2_MAX_FRAME - q_num_bufs);
> >> +    num_buffers =3D min(*count, q->max_num_buffers - q_num_bufs);
> >>
> >>      if (requested_planes && requested_sizes) {
> >>              num_planes =3D requested_planes;
> >> @@ -2465,6 +2476,12 @@ int vb2_core_queue_init(struct vb2_queue *q)
> >>      /*
> >>       * Sanity check
> >>       */
> >> +    if (!q->max_num_buffers)
> >> +            q->max_num_buffers =3D VB2_MAX_FRAME;
> > Can we add a comment here to explain that this is for backwards
> > compatibility with drivers which don't support more buffers?
> >
> > Actually, we should probably document in kerneldoc for vb2_queue that 0=
 is
> > an allowed and special value.
>
> I will do that.
>
> >
> >> +
> >> +    /* The maximum is limited by offset cookie encoding pattern */
> >> +    q->max_num_buffers =3D min_t(unsigned int, q->max_num_buffers, MA=
X_BUFFER_INDEX);
> >> +
> >>      if (WARN_ON(!q)                   ||
> >>          WARN_ON(!q->ops)              ||
> >>          WARN_ON(!q->mem_ops)          ||
> >> @@ -2474,6 +2491,10 @@ int vb2_core_queue_init(struct vb2_queue *q)
> >>          WARN_ON(!q->ops->buf_queue))
> >>              return -EINVAL;
> >>
> >> +    if (WARN_ON(q->max_num_buffers > MAX_BUFFER_INDEX) ||
> > Hmm, how is this possible?
>
> MAX_BUFFER_INDEX depends on PAGE_SHIFT and, on some architectures,
> it can goes up to 15. In this MAX_BUFFER_INDEX is only equal to 512,
> that why this check in needed.
>
> >
> >> +        WARN_ON(q->min_buffers_needed > q->max_num_buffers))
> >> +            return -EINVAL;
> > I have a loose recollection that it's allowed for a driver to change th=
is
> > value depending on the configuration. You may want to double check if a=
ny
> > driver doesn't do so already if we want to disallow that. (and also
> > document that it's not allowed)
>
> I don't think any driver change is value given the configuration but Hans=
 wants
> to clarify the usage of this field on another series.
>

Okay, thanks.

> >
> >> +
> >>      if (WARN_ON(q->requires_requests && !q->supports_requests))
> >>              return -EINVAL;
> >>
> >> @@ -2520,6 +2541,8 @@ void vb2_core_queue_release(struct vb2_queue *q)
> >>      __vb2_queue_cancel(q);
> >>      mutex_lock(&q->mmap_lock);
> >>      __vb2_queue_free(q, vb2_get_num_buffers(q));
> >> +    kfree(q->bufs);
> >> +    q->bufs =3D NULL;
> >>      q->num_buffers =3D 0;
> >>      mutex_unlock(&q->mmap_lock);
> >>   }
> >> diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers=
/media/common/videobuf2/videobuf2-v4l2.c
> >> index 7d798fb15c0b..f3cf4b235c1f 100644
> >> --- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
> >> +++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> >> @@ -627,7 +627,7 @@ struct vb2_buffer *vb2_find_buffer(struct vb2_queu=
e *q, u64 timestamp)
> >>       * This loop doesn't scale if there is a really large number of b=
uffers.
> >>       * Maybe something more efficient will be needed in this case.
> >>       */
> >> -    for (i =3D 0; i < vb2_get_num_buffers(q); i++) {
> >> +    for (i =3D 0; i < q->max_num_buffers; i++) {
> >>              vb2 =3D vb2_get_buffer(q, i);
> >>
> >>              if (!vb2)
> >> @@ -1142,7 +1142,7 @@ int _vb2_fop_release(struct file *file, struct m=
utex *lock)
> >>
> >>      if (lock)
> >>              mutex_lock(lock);
> >> -    if (file->private_data =3D=3D vdev->queue->owner) {
> >> +    if (!vdev->queue->owner || file->private_data =3D=3D vdev->queue-=
>owner) {
> >>              vb2_queue_release(vdev->queue);
> >>              vdev->queue->owner =3D NULL;
> >>      }
> >> @@ -1270,7 +1270,7 @@ void vb2_video_unregister_device(struct video_de=
vice *vdev)
> >>       */
> >>      get_device(&vdev->dev);
> >>      video_unregister_device(vdev);
> >> -    if (vdev->queue && vdev->queue->owner) {
> >> +    if (vdev->queue) {
> >>              struct mutex *lock =3D vdev->queue->lock ?
> >>                      vdev->queue->lock : vdev->lock;
> >>
> >> diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-=
core.h
> >> index 8f9d9e4af5b1..e77a397195f2 100644
> >> --- a/include/media/videobuf2-core.h
> >> +++ b/include/media/videobuf2-core.h
> >> @@ -558,6 +558,7 @@ struct vb2_buf_ops {
> >>    * @dma_dir:       DMA mapping direction.
> >>    * @bufs:  videobuf2 buffer structures
> >>    * @num_buffers: number of allocated/used buffers
> >> + * @max_num_buffers: upper limit of number of allocated/used buffers
> >>    * @queued_list: list of buffers currently queued from userspace
> >>    * @queued_count: number of buffers queued and ready for streaming.
> >>    * @owned_by_drv_count: number of buffers owned by the driver
> >> @@ -619,8 +620,9 @@ struct vb2_queue {
> >>      struct mutex                    mmap_lock;
> >>      unsigned int                    memory;
> >>      enum dma_data_direction         dma_dir;
> >> -    struct vb2_buffer               *bufs[VB2_MAX_FRAME];
> >> +    struct vb2_buffer               **bufs;
> >>      unsigned int                    num_buffers;
> >> +    unsigned int                    max_num_buffers;
> >>
> >>      struct list_head                queued_list;
> >>      unsigned int                    queued_count;
> >> @@ -1248,6 +1250,12 @@ static inline void vb2_clear_last_buffer_dequeu=
ed(struct vb2_queue *q)
> >>   static inline struct vb2_buffer *vb2_get_buffer(struct vb2_queue *q,
> >>                                              unsigned int index)
> >>   {
> >> +    if (!q->bufs)
> >> +            return NULL;
> >> +
> >> +    if (index >=3D q->max_num_buffers)
> > Wouldn't this be already prevented by the condition below?
>
> yes but the series will remove q->num_buffers after this patch
> so for me it make sense to introduce this check now.
>

Yeah, I realized it later. Thanks.

Best regards,
Tomasz

