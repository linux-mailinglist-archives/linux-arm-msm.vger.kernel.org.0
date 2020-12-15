Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC3E22DAC5E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Dec 2020 12:52:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728540AbgLOLtE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Dec 2020 06:49:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728580AbgLOLtA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Dec 2020 06:49:00 -0500
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6036BC06179C
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Dec 2020 03:48:14 -0800 (PST)
Received: by mail-ed1-x542.google.com with SMTP id cm17so20698710edb.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Dec 2020 03:48:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VY9C6dKzDaM57v3JdSf9JJx6SvlGxl+IBr0BX0RagYY=;
        b=N9uyguSnGB+JUEvy3Zokm/wwWmOPeKisc2thcMEVjc8JqPOw4S+qpWc7TN43mrmb/R
         atMsEGLUAf0pEj1yDu/bUT5OE9UTG3bwoMph8vSrfnTxCEKSqrfU2I8yHFt6MhZZpc8g
         jeS5KYLTnisHoG+YLt8S3bJH5lgv8pMMa+MJU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VY9C6dKzDaM57v3JdSf9JJx6SvlGxl+IBr0BX0RagYY=;
        b=ZNvgsuN3EkSx7JpBg8uTdsEW0NOBYtqJ19e8CPk+SFy+vfRnL4XTlSOaW6az8R8TMl
         2e82GIzQMvG8CzQcUv8ExutT+8fsUJX1DEJU3tjGHVSYH3UwZo1dVbsjQ/Gm9SdTu/DH
         DPQQzrkUcvHHbLr2fFGP+XVBHPDY2xA1rMPFseC/oq62UZMjKq/PbghzVxXfqgJpqEn+
         LF1SIvJFAhalEdAoo09I/ai//egFgLP5Kvp+Vp+LtBrzWWLnFtxUBuVR1V9iw2oBgNlG
         xbtJcj7NqnxmNKKCl+KmqkIzD3Ss43gx9bxWsq6HhqX1NiWcCJVH69uueWa1YOOC96mA
         D4eg==
X-Gm-Message-State: AOAM532EkMFh9SwYIbXVYE3f7ueNQnIXWaCaXvtM5SXGjhnIJR0OsiHq
        cgbhk8xAoxc5c6P5pfSHTqrBGPon/tslHQ==
X-Google-Smtp-Source: ABdhPJwGFFyRXB4V4EnQ0sgSQcV+PPOZFs649pk9iSKizSWUrpHakz4yjbVheV7AESn2gD2b/1Faqg==
X-Received: by 2002:aa7:c856:: with SMTP id g22mr28736479edt.85.1608032892802;
        Tue, 15 Dec 2020 03:48:12 -0800 (PST)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com. [209.85.221.54])
        by smtp.gmail.com with ESMTPSA id n16sm18478974edq.62.2020.12.15.03.48.12
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Dec 2020 03:48:12 -0800 (PST)
Received: by mail-wr1-f54.google.com with SMTP id q18so12024063wrn.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Dec 2020 03:48:12 -0800 (PST)
X-Received: by 2002:a5d:6209:: with SMTP id y9mr6274395wru.197.1608032891619;
 Tue, 15 Dec 2020 03:48:11 -0800 (PST)
MIME-Version: 1.0
References: <20201214125703.866998-1-acourbot@chromium.org> <5319c101-f4a4-9c99-b15d-4999366f7a63@linaro.org>
In-Reply-To: <5319c101-f4a4-9c99-b15d-4999366f7a63@linaro.org>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Tue, 15 Dec 2020 20:47:59 +0900
X-Gmail-Original-Message-ID: <CAAFQd5AQ8VHiRYkzkd5ZJBPT5_5WO0tyQrwqBEfnMVKYiTugTA@mail.gmail.com>
Message-ID: <CAAFQd5AQ8VHiRYkzkd5ZJBPT5_5WO0tyQrwqBEfnMVKYiTugTA@mail.gmail.com>
Subject: Re: [PATCH] media: venus: use contig vb2 ops
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     Alexandre Courbot <acourbot@chromium.org>,
        Fritz Koenig <frkoenig@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Dec 15, 2020 at 8:16 PM Stanimir Varbanov
<stanimir.varbanov@linaro.org> wrote:
>
> Hi,
>
> Cc: Robin
>
> On 12/14/20 2:57 PM, Alexandre Courbot wrote:
> > This driver uses the SG vb2 ops, but effectively only ever accesses the
> > first entry of the SG table, indicating that it expects a flat layout.
> > Switch it to use the contiguous ops to make sure this expected invariant
>
> Under what circumstances the sg table will has nents > 1? I came down to
> [1] but not sure I got it right.
>
> I'm afraid that for systems with low amount of system memory and when
> the memory become fragmented, the driver will not work. That's why I
> started with sg allocator.

It is exactly the opposite. The vb2-dma-contig allocator is "contig"
in terms of the DMA (aka IOVA) address space. In other words, it
guarantees that having one DMA address and length fully describes the
buffer. This seems to be the requirement of the hardware/firmware
handled by the venus driver. If the device is behind an IOMMU, which
is the case for the SoCs in question, the underlying DMA ops will
actually allocate a discontiguous set of pages, so it has nothing to
do to system memory amount or fragmentation. If for some reason the
IOMMU can't be used, there is no way around, the memory needs to be
contiguous because of the hardware/firmware/driver expectation.

On the other hand, the vb2-dma-sg allocator doesn't have any
continuity guarantees for the DMA, or any other, address space. The
current code works fine, because it calls dma_map_sg() on the whole
set of pages and that ends up mapping it contiguously in the IOVA
space, but that's just an implementation detail, not an API guarantee.

Best regards,
Tomasz

>
> [1]
> https://elixir.bootlin.com/linux/v5.10.1/source/drivers/iommu/dma-iommu.c#L782
>
> > is always enforced. Since the device is supposed to be behind an IOMMU
> > this should have little to none practical consequences beyond making the
> > driver not rely on a particular behavior of the SG implementation.
> >
> > Reported-by: Tomasz Figa <tfiga@chromium.org>
> > Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> > ---
> > Hi everyone,
> >
> > It probably doesn't hurt to fix this issue before some actual issue happens.
> > I have tested this patch on Chrome OS and playback was just as fine as with
> > the SG ops.
> >
> >  drivers/media/platform/Kconfig              | 2 +-
> >  drivers/media/platform/qcom/venus/helpers.c | 9 ++-------
> >  drivers/media/platform/qcom/venus/vdec.c    | 6 +++---
> >  drivers/media/platform/qcom/venus/venc.c    | 6 +++---
> >  4 files changed, 9 insertions(+), 14 deletions(-)
> >
> > diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
> > index 35a18d388f3f..d9d7954111f2 100644
> > --- a/drivers/media/platform/Kconfig
> > +++ b/drivers/media/platform/Kconfig
> > @@ -533,7 +533,7 @@ config VIDEO_QCOM_VENUS
> >       depends on INTERCONNECT || !INTERCONNECT
> >       select QCOM_MDT_LOADER if ARCH_QCOM
> >       select QCOM_SCM if ARCH_QCOM
> > -     select VIDEOBUF2_DMA_SG
> > +     select VIDEOBUF2_DMA_CONTIG
> >       select V4L2_MEM2MEM_DEV
> >       help
> >         This is a V4L2 driver for Qualcomm Venus video accelerator
> > diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
> > index 50439eb1ffea..859d260f002b 100644
> > --- a/drivers/media/platform/qcom/venus/helpers.c
> > +++ b/drivers/media/platform/qcom/venus/helpers.c
> > @@ -7,7 +7,7 @@
> >  #include <linux/mutex.h>
> >  #include <linux/slab.h>
> >  #include <linux/kernel.h>
> > -#include <media/videobuf2-dma-sg.h>
> > +#include <media/videobuf2-dma-contig.h>
> >  #include <media/v4l2-mem2mem.h>
> >  #include <asm/div64.h>
> >
> > @@ -1284,14 +1284,9 @@ int venus_helper_vb2_buf_init(struct vb2_buffer *vb)
> >       struct venus_inst *inst = vb2_get_drv_priv(vb->vb2_queue);
> >       struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
> >       struct venus_buffer *buf = to_venus_buffer(vbuf);
> > -     struct sg_table *sgt;
> > -
> > -     sgt = vb2_dma_sg_plane_desc(vb, 0);
> > -     if (!sgt)
> > -             return -EFAULT;
> >
> >       buf->size = vb2_plane_size(vb, 0);
> > -     buf->dma_addr = sg_dma_address(sgt->sgl);
>
> Can we do it:
>
>         if (WARN_ON(sgt->nents > 1))
>                 return -EFAULT;
>
> I understand that logically using dma-sg when the flat layout is
> expected by the hardware is wrong, but I haven't seen issues until now.
>
> > +     buf->dma_addr = vb2_dma_contig_plane_dma_addr(vb, 0);
> >
> >       if (vb->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
> >               list_add_tail(&buf->reg_list, &inst->registeredbufs);
> > diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
> > index 8488411204c3..3fb277c81aca 100644
> > --- a/drivers/media/platform/qcom/venus/vdec.c
> > +++ b/drivers/media/platform/qcom/venus/vdec.c
> > @@ -13,7 +13,7 @@
> >  #include <media/v4l2-event.h>
> >  #include <media/v4l2-ctrls.h>
> >  #include <media/v4l2-mem2mem.h>
> > -#include <media/videobuf2-dma-sg.h>
> > +#include <media/videobuf2-dma-contig.h>
> >
> >  #include "hfi_venus_io.h"
> >  #include "hfi_parser.h"
> > @@ -1461,7 +1461,7 @@ static int m2m_queue_init(void *priv, struct vb2_queue *src_vq,
> >       src_vq->io_modes = VB2_MMAP | VB2_DMABUF;
> >       src_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
> >       src_vq->ops = &vdec_vb2_ops;
> > -     src_vq->mem_ops = &vb2_dma_sg_memops;
> > +     src_vq->mem_ops = &vb2_dma_contig_memops;
> >       src_vq->drv_priv = inst;
> >       src_vq->buf_struct_size = sizeof(struct venus_buffer);
> >       src_vq->allow_zero_bytesused = 1;
> > @@ -1475,7 +1475,7 @@ static int m2m_queue_init(void *priv, struct vb2_queue *src_vq,
> >       dst_vq->io_modes = VB2_MMAP | VB2_DMABUF;
> >       dst_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
> >       dst_vq->ops = &vdec_vb2_ops;
> > -     dst_vq->mem_ops = &vb2_dma_sg_memops;
> > +     dst_vq->mem_ops = &vb2_dma_contig_memops;
> >       dst_vq->drv_priv = inst;
> >       dst_vq->buf_struct_size = sizeof(struct venus_buffer);
> >       dst_vq->allow_zero_bytesused = 1;
> > diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
> > index 1c61602c5de1..a09550cd1dba 100644
> > --- a/drivers/media/platform/qcom/venus/venc.c
> > +++ b/drivers/media/platform/qcom/venus/venc.c
> > @@ -10,7 +10,7 @@
> >  #include <linux/pm_runtime.h>
> >  #include <linux/slab.h>
> >  #include <media/v4l2-mem2mem.h>
> > -#include <media/videobuf2-dma-sg.h>
> > +#include <media/videobuf2-dma-contig.h>
> >  #include <media/v4l2-ioctl.h>
> >  #include <media/v4l2-event.h>
> >  #include <media/v4l2-ctrls.h>
> > @@ -1001,7 +1001,7 @@ static int m2m_queue_init(void *priv, struct vb2_queue *src_vq,
> >       src_vq->io_modes = VB2_MMAP | VB2_USERPTR | VB2_DMABUF;
> >       src_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
> >       src_vq->ops = &venc_vb2_ops;
> > -     src_vq->mem_ops = &vb2_dma_sg_memops;
> > +     src_vq->mem_ops = &vb2_dma_contig_memops;
> >       src_vq->drv_priv = inst;
> >       src_vq->buf_struct_size = sizeof(struct venus_buffer);
> >       src_vq->allow_zero_bytesused = 1;
> > @@ -1017,7 +1017,7 @@ static int m2m_queue_init(void *priv, struct vb2_queue *src_vq,
> >       dst_vq->io_modes = VB2_MMAP | VB2_USERPTR | VB2_DMABUF;
> >       dst_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
> >       dst_vq->ops = &venc_vb2_ops;
> > -     dst_vq->mem_ops = &vb2_dma_sg_memops;
> > +     dst_vq->mem_ops = &vb2_dma_contig_memops;
> >       dst_vq->drv_priv = inst;
> >       dst_vq->buf_struct_size = sizeof(struct venus_buffer);
> >       dst_vq->allow_zero_bytesused = 1;
> >
>
> --
> regards,
> Stan
