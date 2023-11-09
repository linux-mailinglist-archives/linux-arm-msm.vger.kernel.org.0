Return-Path: <linux-arm-msm+bounces-246-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BA8927E6715
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Nov 2023 10:48:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 20F60B20C8D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Nov 2023 09:48:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0411B134AA;
	Thu,  9 Nov 2023 09:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HUZ7LK7/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69081134B3
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Nov 2023 09:48:37 +0000 (UTC)
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 765E32715
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Nov 2023 01:48:36 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-9dbb3e0ff65so103634766b.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Nov 2023 01:48:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1699523314; x=1700128114; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DilLKYDfiJHifO/My66ufTYoZBnb4NT+vvrqkX7FBNE=;
        b=HUZ7LK7//OQZcRIixLlVUPSTAJUiKGzIciDJhOkpwgdYhdIvTAPbv0X1FOnSoodnQM
         Of6cdJhMZkYPfxmlF3g4xMGZv6idHxw4KVBkH0meAlJT5IFGgcMLu371ZRmmJpsfuI/Q
         Hk7vwAsT/wxiQkdlTgmCXfFtuhSfOOBhmaXSo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699523314; x=1700128114;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DilLKYDfiJHifO/My66ufTYoZBnb4NT+vvrqkX7FBNE=;
        b=kbl3jyxvO4jOIUwg2DMiuGtkWtg0G8+8p60M+voAcLkV1O7g7w2mKactb5NhyNCKNm
         LvGxZ5e/BZ+rbereKn05EYo7y4HuKzc+KMSy4DMS4hrH6RbKLOoCgMS+CqATZRB+N8l9
         mzQhknLca3/YXv3UObnTngc9U9iqF2H/hMH/0HOulRXCYCHSsmka0NlEGy9V0/YC3ps8
         3xkHlj/8DgjiEwssQzQEZ99cB5pnrPGdS21HySePf9x7JyLUmTVTy4CHX6A7ljjm1E1v
         yXO+ZVC/oA+0eKV0c5DwLZJbixT32HaJa5LCU/pzOkuLZz1YDDxHJ9m22r8+Bs5FHDN2
         bCiQ==
X-Gm-Message-State: AOJu0Ywky4xRIQH+suEC9xoncRfcpnqwMUCoXPY7XBSEHCOwC3IGYL+K
	66Nnrrd1pb3U7bUL+FaOcbDrBIyaZwvEfJXzeuAnvRBH
X-Google-Smtp-Source: AGHT+IE6MMJ0XwfuGo0tN8dPfzloZMogISuAlmjt1+MSpuky3N4bwLP7a7ELqPO6MFynH0VfNks7BQ==
X-Received: by 2002:a17:907:608f:b0:9d3:f436:6804 with SMTP id ht15-20020a170907608f00b009d3f4366804mr3627762ejc.29.1699523313774;
        Thu, 09 Nov 2023 01:48:33 -0800 (PST)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com. [209.85.128.52])
        by smtp.gmail.com with ESMTPSA id k25-20020a1709061c1900b009944e955e19sm2304427ejg.30.2023.11.09.01.48.33
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Nov 2023 01:48:33 -0800 (PST)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-40906fc54fdso4519385e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Nov 2023 01:48:33 -0800 (PST)
X-Received: by 2002:a5d:64a9:0:b0:32f:7f09:160f with SMTP id
 m9-20020a5d64a9000000b0032f7f09160fmr4230407wrp.12.1699523312965; Thu, 09 Nov
 2023 01:48:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231031163104.112469-1-benjamin.gaignard@collabora.com>
 <20231031163104.112469-57-benjamin.gaignard@collabora.com>
 <20231109094311.yzmmn4vvskmrk4tk@chromium.org> <2f5ad14b-528d-4656-84d8-f85467c5b475@collabora.com>
In-Reply-To: <2f5ad14b-528d-4656-84d8-f85467c5b475@collabora.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Thu, 9 Nov 2023 18:48:15 +0900
X-Gmail-Original-Message-ID: <CAAFQd5CH=NoDUJArp=6_28WSgkQ3jTMR3SOyx1iYro-7e4c2hA@mail.gmail.com>
Message-ID: <CAAFQd5CH=NoDUJArp=6_28WSgkQ3jTMR3SOyx1iYro-7e4c2hA@mail.gmail.com>
Subject: Re: [PATCH v14 56/56] media: test-drivers: Use helper for DELETE_BUFS ioctl
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

On Thu, Nov 9, 2023 at 6:46=E2=80=AFPM Benjamin Gaignard
<benjamin.gaignard@collabora.com> wrote:
>
>
> Le 09/11/2023 =C3=A0 10:43, Tomasz Figa a =C3=A9crit :
> > On Tue, Oct 31, 2023 at 05:31:04PM +0100, Benjamin Gaignard wrote:
> >> Allow test drivers to use DELETE_BUFS by adding vb2_ioctl_delete_bufs(=
) helper.
> >>
> >> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> >> ---
> >>   drivers/media/test-drivers/vicodec/vicodec-core.c |  2 ++
> >>   drivers/media/test-drivers/vimc/vimc-capture.c    |  2 ++
> >>   drivers/media/test-drivers/visl/visl-video.c      |  2 ++
> >>   drivers/media/test-drivers/vivid/vivid-core.c     | 13 ++++++++++---
> >>   4 files changed, 16 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/drivers/media/test-drivers/vicodec/vicodec-core.c b/drive=
rs/media/test-drivers/vicodec/vicodec-core.c
> >> index 69cbe2c094e1..f14a8fd506d0 100644
> >> --- a/drivers/media/test-drivers/vicodec/vicodec-core.c
> >> +++ b/drivers/media/test-drivers/vicodec/vicodec-core.c
> >> @@ -1339,6 +1339,7 @@ static const struct v4l2_ioctl_ops vicodec_ioctl=
_ops =3D {
> >>      .vidioc_prepare_buf     =3D v4l2_m2m_ioctl_prepare_buf,
> >>      .vidioc_create_bufs     =3D v4l2_m2m_ioctl_create_bufs,
> >>      .vidioc_expbuf          =3D v4l2_m2m_ioctl_expbuf,
> >> +    .vidioc_delete_bufs     =3D v4l2_m2m_ioctl_delete_bufs,
> >>
> >>      .vidioc_streamon        =3D v4l2_m2m_ioctl_streamon,
> >>      .vidioc_streamoff       =3D v4l2_m2m_ioctl_streamoff,
> >> @@ -1725,6 +1726,7 @@ static int queue_init(void *priv, struct vb2_que=
ue *src_vq,
> >>      dst_vq->mem_ops =3D &vb2_vmalloc_memops;
> >>      dst_vq->timestamp_flags =3D V4L2_BUF_FLAG_TIMESTAMP_COPY;
> >>      dst_vq->lock =3D src_vq->lock;
> >> +    dst_vq->supports_delete_bufs =3D true;
> > Since we have to explicitly provide the vidioc_delete_bufs callback any=
way,
> > is there any value in having a separate supports_delete_bufs flag? Or w=
e
> > envision that some drivers would support deleting buffers only for some
> > queues?
>
> That exactly the case for Hantro driver, it can support deleting buffers =
on
> capture queue but not on output queue.

Fair enough.

Best regards,
Tomasz

