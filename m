Return-Path: <linux-arm-msm+bounces-224-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C035F7E6449
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Nov 2023 08:28:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8EF9A1C203FF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Nov 2023 07:28:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E281FDDBC;
	Thu,  9 Nov 2023 07:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="A5p2BVCm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A14DDB8
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Nov 2023 07:28:45 +0000 (UTC)
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5B55271F
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Nov 2023 23:28:44 -0800 (PST)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-9be02fcf268so81319066b.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Nov 2023 23:28:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1699514922; x=1700119722; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ZGyCYYTcq3tfAOSXtV2/dw7L3jydVZ3P+lrWN5MQ7s=;
        b=A5p2BVCmgcvEh+SNWcZmn/oFYCGeI3MxBZj2usP0awAyeOhLGCLnHVJqBWqCNvzOKS
         pfBOaXKE7KNbaF7/YksY4aboWweSrKf0FtVv7oTBo9FN/HZkaELy2AnUO2EUPYkqkNws
         LA7DLoXbUwL1sqiNM0AcIAxykwzpOY0VO2YwU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699514922; x=1700119722;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1ZGyCYYTcq3tfAOSXtV2/dw7L3jydVZ3P+lrWN5MQ7s=;
        b=cHj0AzdjVFU2r+JTxJBhCFW8ovWZd4KoiQzQY4+xeskbkb6bMaz9JtHip0chozcObx
         hCKypVPkeBlhzNBc6W/HkXNWyCO9xVDu8PK+1oDujwFOFINaGkayqehrsarbz0bIeYO0
         2lK638PyWby6cNmjDvVNLBWO1BqoY5Joqd2wkCBfogrQZE2dnnkZfnVk+Ke973q21BBL
         HkDkzp1uFd4TUN28nbNY8ICk7hRwdUch5WgsrTyvJSyvgAyuKSFnZUCzoKxZWxyd1YZv
         xh+yADaAkeWUoS23niD4nfw2Lpe8oTbLr1RaLo41rdIKHLdqfBsgODfU56NBnHR0iZIB
         8I+w==
X-Gm-Message-State: AOJu0Yy1Z9pti+z2sDKZSPxS8up+aKyFKgQcUyMPL3Qf1xtUrZ52Oh8N
	qyi6u6lQZ4GIfUmqktmU7fiL26ibFIrJJoNyDkeacJAp
X-Google-Smtp-Source: AGHT+IF2kGu0v1+C6ysFc57T0uC2S5FkazjEhLnARF0NDzshZ22kwub8dEKAViIi4xO2d5TTNKbP1w==
X-Received: by 2002:a17:907:8691:b0:9b2:cf77:a105 with SMTP id qa17-20020a170907869100b009b2cf77a105mr3488118ejc.15.1699514922103;
        Wed, 08 Nov 2023 23:28:42 -0800 (PST)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com. [209.85.221.49])
        by smtp.gmail.com with ESMTPSA id pk18-20020a170906d7b200b0099ce188be7fsm2140831ejb.3.2023.11.08.23.28.40
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Nov 2023 23:28:41 -0800 (PST)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-32f9268bf8cso317102f8f.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Nov 2023 23:28:40 -0800 (PST)
X-Received: by 2002:adf:e311:0:b0:32c:ea14:89e5 with SMTP id
 b17-20020adfe311000000b0032cea1489e5mr3220105wrj.39.1699514920620; Wed, 08
 Nov 2023 23:28:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231031163104.112469-1-benjamin.gaignard@collabora.com>
 <20231031163104.112469-53-benjamin.gaignard@collabora.com>
 <20231108104439.oxpbbd2yro7u57t4@chromium.org> <e9eeac63-b4d5-4710-bb85-b0997dce55cc@collabora.com>
In-Reply-To: <e9eeac63-b4d5-4710-bb85-b0997dce55cc@collabora.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Thu, 9 Nov 2023 16:28:20 +0900
X-Gmail-Original-Message-ID: <CAAFQd5AH6x461-a2=2JmzUhW2pWacgwj1w3SZH1kfMBbsmaZ3A@mail.gmail.com>
Message-ID: <CAAFQd5AH6x461-a2=2JmzUhW2pWacgwj1w3SZH1kfMBbsmaZ3A@mail.gmail.com>
Subject: Re: [PATCH v14 52/56] media: core: Add bitmap manage bufs array entries
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

On Thu, Nov 9, 2023 at 12:30=E2=80=AFAM Benjamin Gaignard
<benjamin.gaignard@collabora.com> wrote:
>
>
> Le 08/11/2023 =C3=A0 11:44, Tomasz Figa a =C3=A9crit :
> > On Tue, Oct 31, 2023 at 05:31:00PM +0100, Benjamin Gaignard wrote:
[snip]
> >> @@ -1150,7 +1150,10 @@ static inline bool vb2_fileio_is_active(struct =
vb2_queue *q)
> >>    */
> >>   static inline unsigned int vb2_get_num_buffers(struct vb2_queue *q)
> >>   {
> >> -    return q->num_buffers;
> >> +    if (!q->bufs_bitmap)
> >> +            return 0;
> >> +
> >> +    return bitmap_weight(q->bufs_bitmap, q->max_num_buffers);
> > Hmm, could we just cache the number of buffers we have, so that we don'=
t
> > have to go over the entire bitmap every time? (Basically just keep the
> > code that we had for handling q->num_buffers before this patch.)
>
> I would prefer no duplicate how the number of buffers in a queue is compu=
ted
> and bitmap offer helpers for that. Why not use it ?
>

bitmap_weight() can become costly when the number of buffers grows.
Since it's easy to track how many buffers we add and remove, we could
just cache that number and then any code could call
vb2_get_num_buffers() whenever it needs the buffer count without
caring how costly it is.

> >
> >>   }
> >>
> >>   /**
> >> @@ -1253,13 +1256,13 @@ static inline void vb2_clear_last_buffer_deque=
ued(struct vb2_queue *q)
> >>   static inline struct vb2_buffer *vb2_get_buffer(struct vb2_queue *q,
> >>                                              unsigned int index)
> >>   {
> >> -    if (!q->bufs)
> >> +    if (!q->bufs_bitmap)
> >>              return NULL;
> >>
> >>      if (index >=3D q->max_num_buffers)
> >>              return NULL;
> >>
> >> -    if (index < q->num_buffers)
> >> +    if (test_bit(index, q->bufs_bitmap))
> > Aha, I see why we need the extra condition above now. Perhaps it should=
've
> > been added in this patch instead?
>
> For me it was more explicit do introduce it at the same time that
> max_num_buffers field.

Okay. I don't have a strong opinion, especially since it was just an
intermediate patch.

Best regards,
Tomasz

