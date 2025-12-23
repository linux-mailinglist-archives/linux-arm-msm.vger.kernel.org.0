Return-Path: <linux-arm-msm+bounces-86308-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE64CD8AB9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 10:57:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0C787300B938
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 09:57:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A70A322539;
	Tue, 23 Dec 2025 09:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="c6PVnFn4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B86FD2D3732
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 09:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766483854; cv=none; b=WR4WF8CbxSe/uQORjv9orG/LKhC/kWE/Vt4dm+sSn7q50eS67IGiXmKuW7ljqyRJcIm+OsISZOfyieeb54PIfBd29+686/rPohHks5sDkozu6iyt1HtU6cOwkP/H7W21OaRgbXMW2X9e6SdLNrj1akEEGQll1yRd6mHZH9JAj3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766483854; c=relaxed/simple;
	bh=H6kcB9vxdASqAMUnCMihAw+U+96Gdq79Q4nX4V+t/Xg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OAoowTahP3THVrJ35nKpWjypJp12WGIQ1B45oAOQH5BIi41AezWe5dw6CMBH4c6t7wgwAc4pvQoyWiWLh8FPhFA92D0/frW6RnFamrhQD5rdpbgZBim3kc05PS2K5WWSne9sqLA7zIWyhbuFWWj4iPot31fKCLkQHTF2FMW6C+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=c6PVnFn4; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-59a10ef758aso3946388e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 01:57:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1766483850; x=1767088650; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xcbQKaDIQemvrPXvwFd+jNWXArT2dsZasu7EBT9ao2c=;
        b=c6PVnFn4WFPMsyZCSwgf4ZlMN6ecyY7lXBO7XO7/B9KrbD8BiAsaB8L5oNAGphraPJ
         RYP3VMFfr+r3HpD5YqJCAL66iIqy12gu1OwQFbum1RUn48HyK90wGI3jp7cBkGgSet3w
         /iBG4mqMnO8ASc4g5yu/NOuV0SkVs2vFKfTAk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766483850; x=1767088650;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xcbQKaDIQemvrPXvwFd+jNWXArT2dsZasu7EBT9ao2c=;
        b=CGBYFBT78pqyng2kaF3FBgAYK3UPUF2tEL8gIYoRW6AAXTcXfwjpl+X11dwdm9tD6p
         jYCthUOBpQUtXLJ6BjWlANmBMfD8hvCzb2Hp51kV1+4Qv6JYDRtCeBl9IgcvkFVNZA1z
         HNKFrguBAVVKGwJrMeeroqQGx337GBNi0UtOzERjPXjXlHDajKIC/UAcn6lQ7O5ksexB
         5nYz9hFBTSXdr1LR0b3LKXSAr0d6nEFae4mI2o2XSuj60jlYU+XwXsXpjZOXqFhiOr1p
         uIGWB1qCAHIDudI20Vc0++nYMx6tIM8Dw2542YPFS7cvDTGP8tJ9l13HELiK5NaO3L+G
         Lcyg==
X-Forwarded-Encrypted: i=1; AJvYcCXyk2WaP1I2ViZk8QtxSwnGADZHBYez6aD0Agd69TUWnwaaoOirNsJJxZr/PPohhJYYj3A1gOVrNbOZj8Sx@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5y89dnkK0CvhLv263ik1R1cqppbo7yFAtOfs6/EMXj//4DhR5
	qQRHEUQPu5FsW/HUbfF9fN25OKSND2sDMx5/cXWVWlEPAp1u7Hd8pjfSA+KP7b+gI2kvk03uJ8J
	gzuAanA==
X-Gm-Gg: AY/fxX6wTVnILJcMV8uyV1N9CfQAKQtYKSSp5VKF02mb9uoKTHna8r7SSJMHC6DKsKj
	3m+/8iZts/vb6dVY/+3yXuCi61qvZXrjHYtXdI1/WYn1ddwnX+di3XZ80WfVH2cJzKvMT1wbHfT
	N0fHYJEONTxv8LGwbBh21pStVpus/EeV/ya/1E67j+LHtx1dP9nThmuROFCQ3bDnjsany2WRbAF
	fC4tXaFOn4Dx1tT4D1gZKAjpSP7PAkiYGn01dm9PAjL6DaY8LzSUnNnWYwXXz7v6nOhk52i1pW0
	14ntO1tSYJh9wY5mpifqsyeQN9HEvF9hzuw99LnQreQ2uoHl1femeryGgaD7K9Aw3cTHjULtWlE
	i+wDbEdXblliaPqDoXbsGHtS8OK1zTJWmappbemfqQbbgIGMMv0MGphvP21nVLCwK59E/kbhBXm
	47p5YZDy1psNVbYkn9miPmnliMRuyejG1n08k+q/r06fcfXrEs4qcI
X-Google-Smtp-Source: AGHT+IHznt8a6z0VI4oILiB/Wyxi+7MLS54q7SqLfNXDgV70Z/dQ3mN3rpUxiPEN5f8tgEnNHZTKFw==
X-Received: by 2002:a05:6512:3b29:b0:598:eaaf:a476 with SMTP id 2adb3069b0e04-59a17d4ca64mr4764165e87.46.1766483850424;
        Tue, 23 Dec 2025 01:57:30 -0800 (PST)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com. [209.85.208.179])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a1861f7f5sm3919018e87.72.2025.12.23.01.57.29
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Dec 2025 01:57:29 -0800 (PST)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-37bac34346dso35595651fa.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 01:57:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVAD6j+D0kOS8o7JQewOgH1e/NZ7YmTBxbcVhbE5mhJMYD+Dn00esy+g1AHPJwSzopwNVQckIx490C2KLM3@vger.kernel.org
X-Received: by 2002:a2e:bc18:0:b0:37b:575d:6403 with SMTP id
 38308e7fff4ca-38121566d15mr43298201fa.6.1766483848778; Tue, 23 Dec 2025
 01:57:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251216-warnings-6-19-v2-0-12075e3dece7@chromium.org>
 <20251216-warnings-6-19-v2-2-12075e3dece7@chromium.org> <a90943c6-0e7f-51cb-05d6-41e131797196@oss.qualcomm.com>
In-Reply-To: <a90943c6-0e7f-51cb-05d6-41e131797196@oss.qualcomm.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 23 Dec 2025 10:57:16 +0100
X-Gmail-Original-Message-ID: <CANiDSCt2+jqrcTEFXk+Qx4hv7XE2ReSdojGFdLgVOoOM9LKw9w@mail.gmail.com>
X-Gm-Features: AQt7F2q8tKmrjpznyuaGTBd-ivAL0-SHsAmqJWL6ETs3H9P3HZNyV4Yx_-HbshQ
Message-ID: <CANiDSCt2+jqrcTEFXk+Qx4hv7XE2ReSdojGFdLgVOoOM9LKw9w@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] media: iris: Fix fps calculation
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Keke Li <keke.li@amlogic.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Daniel Scally <dan.scally@ideasonboard.com>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	"Bryan O'Donoghue" <bod@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 23 Dec 2025 at 10:39, Dikshita Agarwal
<dikshita.agarwal@oss.qualcomm.com> wrote:
>
>
>
> On 12/16/2025 9:12 PM, Ricardo Ribalda wrote:
> > iris_venc_s_param() uses do_div to divide two 64 bits operators, this is
> > wrong. Luckily for us, both of the operators fit in 32 bits, so we can use
> > a normal division.
> >
> > Now that we are at it, mark the fps smaller than 1 as invalid, the code
> > does not seem to handle them properly.
> >
> > The following cocci warning is fixed with this patch:
> > ./platform/qcom/iris/iris_venc.c:378:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead
> >
> > Fixes: 4ff586ff28e3 ("media: iris: Add support for G/S_PARM for encoder video device")
> > Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/platform/qcom/iris/iris_venc.c | 15 +++++----------
> >  1 file changed, 5 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
> > index 5830eba93c68b27fa9db87bac63a691eaca338d2..3b941aeb55a2f498898a27a5f8cb58cdb26fdfed 100644
> > --- a/drivers/media/platform/qcom/iris/iris_venc.c
> > +++ b/drivers/media/platform/qcom/iris/iris_venc.c
> > @@ -382,8 +382,7 @@ int iris_venc_s_param(struct iris_inst *inst, struct v4l2_streamparm *s_parm)
> >       struct v4l2_fract *timeperframe = NULL;
> >       u32 default_rate = DEFAULT_FPS;
> >       bool is_frame_rate = false;
> > -     u64 us_per_frame, fps;
> > -     u32 max_rate;
> > +     u32 fps, max_rate;
> >
> >       int ret = 0;
> >
> > @@ -405,23 +404,19 @@ int iris_venc_s_param(struct iris_inst *inst, struct v4l2_streamparm *s_parm)
> >                       timeperframe->denominator = default_rate;
> >       }
> >
> > -     us_per_frame = timeperframe->numerator * (u64)USEC_PER_SEC;
> > -     do_div(us_per_frame, timeperframe->denominator);
> > -
> > -     if (!us_per_frame)
> > +     fps = timeperframe->numerator / timeperframe->denominator;
>
> This is wrong, should be timeperframe->denominator/timeperframe->numerator

Ups, sorry about that :S

> Also I think it would be better to clamp the fps?

Do you mean clamp instead of returning -ENOMEM? I have no strong
opinion about that, but I believe that should be a follow up patch.

>
> Thanks,
> Dikshita
>
> > +     if (!fps)
> >               return -EINVAL;
> >
> > -     fps = (u64)USEC_PER_SEC;
> > -     do_div(fps, us_per_frame);
> >       if (fps > max_rate) {
> >               ret = -ENOMEM;
> >               goto reset_rate;
> >       }
> >
> >       if (is_frame_rate)
> > -             inst->frame_rate = (u32)fps;
> > +             inst->frame_rate = fps;
> >       else
> > -             inst->operating_rate = (u32)fps;
> > +             inst->operating_rate = fps;
> >
> >       if ((s_parm->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE && vb2_is_streaming(src_q)) ||
> >           (s_parm->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE && vb2_is_streaming(dst_q))) {
> >



-- 
Ricardo Ribalda

