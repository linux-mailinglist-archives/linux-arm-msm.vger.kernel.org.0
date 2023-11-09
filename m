Return-Path: <linux-arm-msm+bounces-219-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE377E62D4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Nov 2023 05:27:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D10371C203BA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Nov 2023 04:27:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E31476AA1;
	Thu,  9 Nov 2023 04:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Je/5w0H2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E74A6AA6
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Nov 2023 04:27:46 +0000 (UTC)
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 959C8269E
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Nov 2023 20:27:45 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-544455a4b56so570280a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Nov 2023 20:27:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1699504063; x=1700108863; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZTb319PKi1K5hE3fGXAxhdTNxkLrwLwVOwF53ZkG1AY=;
        b=Je/5w0H2VO8Ome6eJ7oQHEPbPQAcgcI+ks9aRuQH1gaBxFGW63U0vrrs3uwyPMnP0Q
         bfP59PTq29EUh55J1tJylIeokClozwOM4i6lxZ4DPB0I8FoCEQeu2ApmXfS2T1HDVMrI
         h6r1F9JeL5ANzS+2wCMylvEE3JbZrofylmWxE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699504063; x=1700108863;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZTb319PKi1K5hE3fGXAxhdTNxkLrwLwVOwF53ZkG1AY=;
        b=UU+h0O43J6a6NjoGWxw2D/xa9f8tYP0RaI2AKYs5hYP06n3kv3v+cKEQAdy5havKNZ
         DtYWWTWIwrhq8lyrQFw5LAIpb9rHVQKQ/bcszffuxmBlEpT+zoJREW3HX345dPA2+E68
         5JIcs0dOtQl1rQPvlLrOpKMSa6f7uPVWd7B4/agd/cLPEOSqzdx6668wctQQW3xWaYq/
         ERyQD3zAeoyGkIt4IQOrFElodfLO+5V5xGZ4XffhgUaQgecF9gDs9za6Llm389aYmXtO
         tdL/lla9hcIcbAYHT1TPiPgqqjZPLQwEZaNvq8QmAKMLrm6jK7CgR1plSvTM1Nugv2QI
         Wp7g==
X-Gm-Message-State: AOJu0Yxdu36paBXNq4368xFpHHDgNh3MLB20tDwrr1WQXNkl0Fb/jlbx
	YKdxl8VUnUbVvxPE13qLluLZMihklHH8Atu73M+VRfal
X-Google-Smtp-Source: AGHT+IFZ40TnZwu6IXZsjpuRbFzhmjj+8boNZxz/DahzEouOPODkaYs7eTjb83b0xLo6z2hsl2NUmA==
X-Received: by 2002:a50:9e6c:0:b0:540:b524:5228 with SMTP id z99-20020a509e6c000000b00540b5245228mr3172218ede.33.1699504063330;
        Wed, 08 Nov 2023 20:27:43 -0800 (PST)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com. [209.85.128.45])
        by smtp.gmail.com with ESMTPSA id d26-20020a50cd5a000000b0053dab756073sm7797766edj.84.2023.11.08.20.27.42
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Nov 2023 20:27:43 -0800 (PST)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-40891d38e3fso2529635e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Nov 2023 20:27:42 -0800 (PST)
X-Received: by 2002:a05:600c:4ecd:b0:405:7400:1e3d with SMTP id
 g13-20020a05600c4ecd00b0040574001e3dmr3298654wmq.32.1699504062425; Wed, 08
 Nov 2023 20:27:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231031163104.112469-1-benjamin.gaignard@collabora.com>
 <20231031163104.112469-6-benjamin.gaignard@collabora.com> <20231108085016.3kmhmdroh4qs53f5@chromium.org>
 <795ef94f-23d3-433e-b5a3-0a2e0ab7a18c@collabora.com>
In-Reply-To: <795ef94f-23d3-433e-b5a3-0a2e0ab7a18c@collabora.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Thu, 9 Nov 2023 13:27:22 +0900
X-Gmail-Original-Message-ID: <CAAFQd5Dd_w50ppjy1_wQ2yX+Qj0mOMWbhJKsJ7Cq6zYsQ+GwyQ@mail.gmail.com>
Message-ID: <CAAFQd5Dd_w50ppjy1_wQ2yX+Qj0mOMWbhJKsJ7Cq6zYsQ+GwyQ@mail.gmail.com>
Subject: Re: [PATCH v14 05/56] media: videobuf2: Access vb2_queue bufs array
 through helper functions
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

On Wed, Nov 8, 2023 at 7:24=E2=80=AFPM Benjamin Gaignard
<benjamin.gaignard@collabora.com> wrote:
>
>
> Le 08/11/2023 =C3=A0 09:50, Tomasz Figa a =C3=A9crit :
> > On Tue, Oct 31, 2023 at 05:30:13PM +0100, Benjamin Gaignard wrote:
> >> This patch adds 2 helpers functions to add and remove vb2 buffers
> >> from a queue. With these 2 and vb2_get_buffer(), bufs field of
> >> struct vb2_queue becomes like a private member of the structure.
> >>
> >> After each call to vb2_get_buffer() we need to be sure that we get
> >> a valid pointer in preparation for when buffers can be deleted.
> >>
> >> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> >> ---
> >>   .../media/common/videobuf2/videobuf2-core.c   | 151 +++++++++++++---=
--
> >>   .../media/common/videobuf2/videobuf2-v4l2.c   |  50 ++++--
> >>   2 files changed, 149 insertions(+), 52 deletions(-)
> >>
> >> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers=
/media/common/videobuf2/videobuf2-core.c
> >> index 968b7c0e7934..b406a30a9b35 100644
> >> --- a/drivers/media/common/videobuf2/videobuf2-core.c
> >> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> >> @@ -408,6 +408,31 @@ static void init_buffer_cache_hints(struct vb2_qu=
eue *q, struct vb2_buffer *vb)
> >>              vb->skip_cache_sync_on_finish =3D 1;
> >>   }
> >>
> >> +/**
> >> + * vb2_queue_add_buffer() - add a buffer to a queue
> >> + * @q:      pointer to &struct vb2_queue with videobuf2 queue.
> >> + * @vb:     pointer to &struct vb2_buffer to be added to the queue.
> >> + * @index: index where add vb2_buffer in the queue
> >> + */
> >> +static void vb2_queue_add_buffer(struct vb2_queue *q, struct vb2_buff=
er *vb, unsigned int index)
> >> +{
> >> +    WARN_ON(index >=3D VB2_MAX_FRAME || q->bufs[index]);
> > nit: Would it make sense to also ensure that vb->vb2_queue is NULL?
>
> Since vb->vb2_queue and q->bufs[index] are always set and clear in the sa=
me
> functions I don't think it is useful to test the both here.
>

Well, they are if the caller is not buggy. But I suppose the check is
to detect buggy callers?

For example, an m2m driver could accidentally call this on a buffer
that was already added to another queue.

Best regards,
Tomasz

