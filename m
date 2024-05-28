Return-Path: <linux-arm-msm+bounces-20712-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E818D17EB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 12:01:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9E2E31F25DF5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 10:01:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 388E916C874;
	Tue, 28 May 2024 09:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zSdza3la"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BA6616B739
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 May 2024 09:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716890360; cv=none; b=An804T/wW0m6UT5O4ug4sfEpKe8rL1WIRXZzkuXdGJCMP7xodtVdyXqPUd16XNzmqh0oqZl17BqBrzOe7Z9C5l5TiooZdN39dgu6f1zxDLqhZlI62GjnO5s6eLiVG/Y/L8lRe6aKF248U4ZXVeMROQB3GDmJoCKoQ0lV5CU1H3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716890360; c=relaxed/simple;
	bh=LGIhCON7RwGoB5/JEr45SIhv70cKMYe/9XS35SkES+Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZEuVMUlR5e7GUEmvYNC03xn//r90hX+k3IkW2Cj2ZWMwQcy9j//em2GYbK86ISQur0E9Yxd5rwGAXZQ5ofeNc+4eIW1diKbRCTl4syqRCFQ98/CQLWcdr3BGw75xs7sKWrymw6kLw9H/eCHPCy+iLzkDXw5cilLSWxAyMUSN78g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zSdza3la; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2e72224c395so5427911fa.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 May 2024 02:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716890356; x=1717495156; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fOHB0bGKjsCzyiTOasGxYrmiv1nfb2UcuoN8pI6JNDM=;
        b=zSdza3laR78oECApOpTJUORy2cAhIrbE3lcrWp5+DEmzZGLc3PwLwo9tstn2853P2S
         mT+py0pmSo5xXMBkl/MVA9fMzkLbziVJkgoN5v88N4kaOZXFRtolxOtiiKRTcq00I9RM
         XpRxJPo/UGrNz8UxzuR5Km0jIe9UCpKHo6cS7ZmQbfaP/cXvGPAbKcWAjXsiJdnYCptC
         SPrTHv05E0df+1KbfouqjZ8aWsJrfkRkCWmJB+Vt/oD8KegN5Oh/n9IUVdmwXm2KjLy/
         saYp/B0kddBx3mBaPdUBKzE9VeZ4/dBLlBShEzbfpdhhnSZAc3G3txvjnHOnJ8O8Tipa
         Yv1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716890356; x=1717495156;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fOHB0bGKjsCzyiTOasGxYrmiv1nfb2UcuoN8pI6JNDM=;
        b=rtONWx7iA8q+WLHP5a9iMyeRsqT8JqH2wNd9iFNYjcdZsqsiHxGFgT/akr6nxnw+L6
         cWpUgVw62bMC5gWMyBLlZGWyYt1JyUqkiB6zUYTKirOGnsmHb62YvShEZ14zAmncT4I9
         vp8v9HtYr0k+e9xopJw6rHuv8vJ5TxoeWQukWgwQgEHcHjRJ8fPbWO5d+ML77Ri0yeDx
         hqbV9Jfe7Lh9iNWlR/z55Qc0Q38OeOMjauk4LeASwcyN7rRiP9prPD2YJZxMr+Q6wg7i
         ohmaeVrSlMWofDkXyS9J1QMyb5q8ZnpTSGxcCHI2muzYh4SeNR4Jws8bzPy+lCvg1k4K
         M5Yg==
X-Forwarded-Encrypted: i=1; AJvYcCVnjK2V8PHxnBI1U/d2S3pYB2T3f7EUKuAG6M/SC4DnlxRTJUdu8yWDghxc/7n6XBC+g2MAJ2/LyX6UOIepafAEFSsP1HfThYvCIp45aw==
X-Gm-Message-State: AOJu0Yy26/WQdvSPmsa/+ZErJfPuoKK3kGn4i7nyPnDU0tzxrYSTo2+D
	5nARuFsjq54aXBXIhI7QNEcegKJHLx0DbD4YiInrAy9k5jOs/0ELROFdkLtrMWlj0170f6VxP5O
	jUhB5Ld19GAu/50tCEfuWJm5c53qwP2ZouXvmXQ==
X-Google-Smtp-Source: AGHT+IEZJYr+NYpN1e2hcVYIpvKh++Em5UUPY+WUg+bF4xLU9EiG0nuQH84CetGWUAZkjEZpNzWVC6lOezqgm1EUpDo=
X-Received: by 2002:a2e:80da:0:b0:2e9:798c:8525 with SMTP id
 38308e7fff4ca-2e9798c866cmr27784281fa.26.1716890356147; Tue, 28 May 2024
 02:59:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240527-msm-drm-dsc-dsi-video-upstream-4-v5-0-f797ffba4682@linaro.org>
 <20240527-msm-drm-dsc-dsi-video-upstream-4-v5-2-f797ffba4682@linaro.org> <57sr3ssi6nwermdqtnb2ackmu4tlxs4gcslvp4v6ndafnvbqhb@4npuqfpkzzan>
In-Reply-To: <57sr3ssi6nwermdqtnb2ackmu4tlxs4gcslvp4v6ndafnvbqhb@4npuqfpkzzan>
From: Jun Nie <jun.nie@linaro.org>
Date: Tue, 28 May 2024 17:59:13 +0800
Message-ID: <CABymUCOCcgfHsBaFBk63z+CLJu6Lee983nCM14PgPWZjkFFikQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/6] drm/msm/dpu: adjust data width for widen bus case
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, Vinod Koul <vkoul@kernel.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2024=E5=B9=B45=E6=
=9C=8828=E6=97=A5=E5=91=A8=E4=BA=8C 08:48=E5=86=99=E9=81=93=EF=BC=9A
>
> On Mon, May 27, 2024 at 10:21:48PM +0800, Jun Nie wrote:
> > data is valid for only half the active window if widebus
> > is enabled
> >
> > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/=
drm/msm/disp/dpu1/dpu_hw_intf.c
> > index 225c1c7768ff..f97221423249 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> > @@ -168,6 +168,15 @@ static void dpu_hw_intf_setup_timing_engine(struct=
 dpu_hw_intf *intf,
> >
> >       data_width =3D p->width;
> >
> > +     /*
> > +      * If widebus is enabled, data is valid for only half the active =
window
> > +      * since the data rate is doubled in this mode. But for the compr=
ession
> > +      * mode in DP case, the p->width is already adjusted in
> > +      * drm_mode_to_intf_timing_params()
>
> Is there any reason for divergence here?

Lots of parameters in dpu_hw_intf_setup_timing_engine() is calculated
from timing->width,
such as hsync_period and display_v_start. So the width cannot be
adjusted beforehand in
drm_mode_to_intf_timing_params(). Otherwise, we get below error.

I guess the interface timing configuration differ in silicon, thus the
software shall handle the
difference. If we adjust the width beforehand for DSI, we get below error.

[    6.625446] [drm:dpu_encoder_frame_done_timeout:2469] [dpu
error]enc31 frame done timeout
[    6.642369] [drm:dpu_encoder_phys_vid_wait_for_commit_done:525]
[dpu error]vblank timeout: 4200c1
[    6.642395] [drm:dpu_kms_wait_for_commit_done:493] [dpu error]wait
for commit done returned -110


>
> > +      */
> > +     if (p->wide_bus_en && !dp_intf)
> > +             data_width =3D p->width >> 1;
> > +
> >       hsync_data_start_x =3D hsync_start_x;
> >       hsync_data_end_x =3D  hsync_start_x + data_width - 1;
> >
> >
> > --
> > 2.34.1
> >
>
> --
> With best wishes
> Dmitry

