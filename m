Return-Path: <linux-arm-msm+bounces-2394-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5A47FD333
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 10:48:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 090BF1C20980
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 09:48:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DFE715E86;
	Wed, 29 Nov 2023 09:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FsaqE7jL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EA4E213C
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Nov 2023 01:48:38 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-50bc36725bbso955456e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Nov 2023 01:48:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701251314; x=1701856114; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Mx325DtRKaxi+9uS3mKSouj4W90XaTo1Gq8eIdHtzI=;
        b=FsaqE7jLU97/EJKeoxPCH61jaAYwzlL0hZ6apWnoLJjD4KnbGtu+/ITAlSe05sheDW
         I4E8Rg/75YyV62X9kqfWLoPPGwa7NmkJixDX+BWv0GlrDCp1LjyEm4UUwTDpfzdr+3s7
         GwFN1spp1532goxyuuQEwngF8U45yCZGcGx1I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701251314; x=1701856114;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1Mx325DtRKaxi+9uS3mKSouj4W90XaTo1Gq8eIdHtzI=;
        b=IdZm2lZNIeKkKGZZJCXdsTSAxrcEy8XPKwDCCeH8iY2VHPi7E+cnU05zr1gO7gtJhS
         2032bQw2GfwxUC0itugk7IUy2+USRbyR7ToO6zPpcBdrrLGI4I6zHin6r0rPozwOVMBO
         VyKlKaUTLxjtZ30kmliTZLath/sSjJN4iPrujd434+ljFEaT4g/k23pfNLZCIKg03e9F
         EhIlkvBRchKEdg9/RGZmdtaxxOqTjxIvkNNlqz/z5rkfx6t94KfDTTHELL7xFybmfoZF
         Its/r+GeAZk1CfhkMbS+APYb6SEyBOoahglfcUuBaFO6Fr/VlekN5XauElNcjYt3cQvr
         AMkA==
X-Gm-Message-State: AOJu0YzLwou4puym6TApH1zXaXMWzyAzCtkndnLi2aql8/t3elXc6y90
	Sz+hjakTjfzk6yn3q/aqMQfcNhw8PVPa4mnwoYz83E2E
X-Google-Smtp-Source: AGHT+IFj/MPSUox5oIjCJ44gFNd66ZNTz2Z5ekHFg3PTP6yRlIUXbzt+cMXuAxnjvKNcUflHhEHwUA==
X-Received: by 2002:a05:6512:1242:b0:50a:7640:6a7f with SMTP id fb2-20020a056512124200b0050a76406a7fmr11394749lfb.12.1701251314426;
        Wed, 29 Nov 2023 01:48:34 -0800 (PST)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com. [209.85.208.182])
        by smtp.gmail.com with ESMTPSA id dx8-20020a0565122c0800b0050aabf7a82csm2095362lfb.160.2023.11.29.01.48.33
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Nov 2023 01:48:34 -0800 (PST)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2c9b5c12898so20170871fa.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Nov 2023 01:48:33 -0800 (PST)
X-Received: by 2002:a2e:b008:0:b0:2c9:bf5b:5408 with SMTP id
 y8-20020a2eb008000000b002c9bf5b5408mr833397ljk.24.1701251313149; Wed, 29 Nov
 2023 01:48:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231127165454.166373-1-benjamin.gaignard@collabora.com>
 <20231127165454.166373-17-benjamin.gaignard@collabora.com> <cf444351-4305-450d-9b3a-a02a310543c7@xs4all.nl>
In-Reply-To: <cf444351-4305-450d-9b3a-a02a310543c7@xs4all.nl>
From: Tomasz Figa <tfiga@chromium.org>
Date: Wed, 29 Nov 2023 18:48:15 +0900
X-Gmail-Original-Message-ID: <CAAFQd5DHQvvodpKTYN4AE6Q=48Mby+qtt_kE9xjgarn1jQextw@mail.gmail.com>
Message-ID: <CAAFQd5DHQvvodpKTYN4AE6Q=48Mby+qtt_kE9xjgarn1jQextw@mail.gmail.com>
Subject: Re: [PATCH 16/55] media: qcom: venus: Stop abusing of
 min_buffers_needed field
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>, mchehab@kernel.org, 
	m.szyprowski@samsung.com, matt.ranostay@konsulko.com, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, kernel@collabora.com, 
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, Vikash Garodia <quic_vgarodia@quicinc.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 28, 2023 at 7:26=E2=80=AFPM Hans Verkuil <hverkuil@xs4all.nl> w=
rote:
>
> On 27/11/2023 17:54, Benjamin Gaignard wrote:
> > 'min_buffers_needed' is suppose to be used to indicate the number
> > of buffers needed by DMA engine to start streaming.
> > venus driver doesn't use DMA engine and just want to specify
> > the minimum number of buffers to allocate when calling VIDIOC_REQBUFS.
> > That 'min_reqbufs_allocation' field purpose so use it.
> >
> > Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> > CC: Stanimir Varbanov <stanimir.k.varbanov@gmail.com> (maintainer:QUALC=
OMM VENUS VIDEO ACCELERATOR DRIVER)
> > CC: Vikash Garodia <quic_vgarodia@quicinc.com> (maintainer:QUALCOMM VEN=
US VIDEO ACCELERATOR DRIVER)
> > CC: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org> (reviewer:QUALCOMM =
VENUS VIDEO ACCELERATOR DRIVER)
> > CC: Andy Gross <agross@kernel.org> (maintainer:ARM/QUALCOMM SUPPORT)
> > CC: Bjorn Andersson <andersson@kernel.org> (maintainer:ARM/QUALCOMM SUP=
PORT)
> > CC: Konrad Dybcio <konrad.dybcio@linaro.org> (maintainer:ARM/QUALCOMM S=
UPPORT)
> > CC: linux-arm-msm@vger.kernel.org
> > ---
> >  drivers/media/platform/qcom/venus/vdec.c | 4 ++--
> >  drivers/media/platform/qcom/venus/venc.c | 4 ++--
> >  2 files changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/p=
latform/qcom/venus/vdec.c
> > index dbf305cec120..16b8d0dde10d 100644
> > --- a/drivers/media/platform/qcom/venus/vdec.c
> > +++ b/drivers/media/platform/qcom/venus/vdec.c
> > @@ -1641,7 +1641,7 @@ static int m2m_queue_init(void *priv, struct vb2_=
queue *src_vq,
> >       src_vq->drv_priv =3D inst;
> >       src_vq->buf_struct_size =3D sizeof(struct venus_buffer);
> >       src_vq->allow_zero_bytesused =3D 1;
> > -     src_vq->min_buffers_needed =3D 0;
> > +     src_vq->min_reqbufs_allocation =3D 0;
>
> Just drop this.
>
> >       src_vq->dev =3D inst->core->dev;
> >       src_vq->lock =3D &inst->ctx_q_lock;
> >       ret =3D vb2_queue_init(src_vq);
> > @@ -1656,7 +1656,7 @@ static int m2m_queue_init(void *priv, struct vb2_=
queue *src_vq,
> >       dst_vq->drv_priv =3D inst;
> >       dst_vq->buf_struct_size =3D sizeof(struct venus_buffer);
> >       dst_vq->allow_zero_bytesused =3D 1;
> > -     dst_vq->min_buffers_needed =3D 0;
> > +     dst_vq->min_reqbufs_allocation =3D 0;
> >       dst_vq->dev =3D inst->core->dev;
> >       dst_vq->lock =3D &inst->ctx_q_lock;
> >       return vb2_queue_init(dst_vq);
> > diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/p=
latform/qcom/venus/venc.c
> > index 44b13696cf82..e399d01c208c 100644
> > --- a/drivers/media/platform/qcom/venus/venc.c
> > +++ b/drivers/media/platform/qcom/venus/venc.c
> > @@ -1398,7 +1398,7 @@ static int m2m_queue_init(void *priv, struct vb2_=
queue *src_vq,
> >       src_vq->drv_priv =3D inst;
> >       src_vq->buf_struct_size =3D sizeof(struct venus_buffer);
> >       src_vq->allow_zero_bytesused =3D 1;
> > -     src_vq->min_buffers_needed =3D 1;
> > +     src_vq->min_reqbufs_allocation =3D 1;
>
> So for platform drivers like this it is going to be more difficult to
> determine which meaning min_buffers_needed had: is at least one queued
> buffer needed before you can start streaming, or is this for a minimum
> buffer allocation?

By the way, for stateful decoders, we also have the
V4L2_CID_MIN_BUFFERS_FOR_CAPTURE control, which tells the userspace
the minimum buffers that need to be allocated and the drivers also
should adjust the number requested in REQBUFS to be at least that.

>
> In the case of m2m devices using the v4l2-mem2mem framework it is almost
> certainly the minimum buffer allocation since the m2m framework already
> checks that there are input and output buffers queued (__v4l2_m2m_try_que=
ue).
>
> So just delete the src_vq->min_buffers_needed =3D 1; line, and there is
> no need to set min_reqbufs_allocation.
>
> >       src_vq->dev =3D inst->core->dev;
> >       src_vq->lock =3D &inst->ctx_q_lock;
> >       if (inst->core->res->hfi_version =3D=3D HFI_VERSION_1XX)
> > @@ -1415,7 +1415,7 @@ static int m2m_queue_init(void *priv, struct vb2_=
queue *src_vq,
> >       dst_vq->drv_priv =3D inst;
> >       dst_vq->buf_struct_size =3D sizeof(struct venus_buffer);
> >       dst_vq->allow_zero_bytesused =3D 1;
> > -     dst_vq->min_buffers_needed =3D 1;
> > +     dst_vq->min_reqbufs_allocation =3D 1;
> >       dst_vq->dev =3D inst->core->dev;
> >       dst_vq->lock =3D &inst->ctx_q_lock;
> >       return vb2_queue_init(dst_vq);
>
> Ditto.
>
> Regards,
>
>         Hans

