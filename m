Return-Path: <linux-arm-msm+bounces-61430-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B31ADAEEB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 13:44:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6C578188AE7A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 11:45:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 473E92E7F35;
	Mon, 16 Jun 2025 11:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WvW97kI7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D39F2E2EFF
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 11:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750074279; cv=none; b=aKpa/Qahr9+1FM+dIxHTEsQ64n4zjerEOdtd0KfXYuih7zeOlb0ybM5SSdaNYS5RevoQ0lWqsnhv/zd8G+IU0H4bT4gX0wcl4gdX6QW3DJAOcB8IIqy7JZeVDjzwHLNb7zw+gTYO7RUFD1vgC0xuJoVIz1uSZFUxl0cRunA7Sso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750074279; c=relaxed/simple;
	bh=6OFo5pBMYnYh2m/fkEpOWd415EFJQ4PzegzdB78/qh8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n43TX+LT1ok03nEPg82NmOFigMsHveyegt4KVf8QSAbmIQWKlTZN3fh2bxK9g8W2B0BOGmo/6RyCS3BAnZc51PKxJZLQiE/0Z+bTTMBNQ//OnrwRjozXtyAPiGl1JPVZQgHs/tAN91Wn0uHVJPIiehF2QGTJuoUjnz3epZtP9Ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=WvW97kI7; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-32b3b250621so31877101fa.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 04:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750074275; x=1750679075; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JC57BNOILQO91SpxcwM/H8uetMBSbdJpDUePGneKOZM=;
        b=WvW97kI7MGz08Rj1VhMCOZXdEpVYtnTclE8suo1tn2OFf/uHasAyMkUDSfDVwIopMg
         1x+xquc9+WR5RvaVgc6bXWN7Bu8jP/pCfZ4UHGQcJ5t3l93phdoYcAbouP/K4iIqjGlQ
         gzgpsE2XWk6q1PWe+1E7RpVOHnjh68umB+z+k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750074275; x=1750679075;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JC57BNOILQO91SpxcwM/H8uetMBSbdJpDUePGneKOZM=;
        b=vsmxsQHJ2o2f56ohiC3T/Rv9ocUT6BvD1UqdU5pw+hjtTDFO4fMsgiGLhmFB1vlD2c
         5O3HWMzNt9XHFIa+4mWFb10JqzLe7JSyA82i7aBKstjRTiEbes94TXSbn8JVKdzc86ct
         IpDlLb8baeHJepl17IPR+uPySYG7gGbPjvcPWe0ZLO3E2j59AW/Dzktokf/FUIvZZxHN
         z/irQtk9EUbzf02/deFnv1V+h0XcwF5nUT4suR8tOShwFfhf7KucAeovBxYz7hB3WuBJ
         WdwW/kdLBSxbrDiUCgT1tAbl08agZCigHHlKDBXyQDwQzr59UEtIuu1K60+LjzMszdmW
         WbAg==
X-Forwarded-Encrypted: i=1; AJvYcCU7hpukFnKA7fB4a9wNrMEFh0/jf/NqK2Wai3h4RIfT/FDZEDJSJfdZBAiuqBBOZ+/yrOVMxKZsC/KtgG7e@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9AIIWEXm1Ig8nVa/1kcegiYaDbbE3jVRIycNvtC1J/n24uY6d
	IeSAluQpxIl3VVAs0bu4YuCPoOt/bcC4DnXZ2phrS4ovao2BrcTGo9pLQ6/UFqerSjJFFigrZoy
	G5vc=
X-Gm-Gg: ASbGncvurq/02I6jtxh25mevPH9GmeM0BCjyf0ovhK/m+UmahlEgR7rnQmMwhgRSZdn
	j809D1B+9L9gr+ind2xA67yDSMnsXGLTMAEuPHDa0aLpRJpWniR6CYEX6R+FZ3UkzRlYcuCGAYF
	auDd6hfPAPhPt++lhqaS4TOy9JCPQrI/VO/kcEK2k9pjIVe8YZuyqzA5jII3NKugTWH+fp4kvNT
	jDQBsrXdjRcwkbUvJhVUw79puOxxM9otbkRveNdr3o7ieWFm7k8xMRIpzQ06vo0tngN6JCmHNSq
	5gvDhfemE4vy0mx5hgaGy+DWd2d32VWd4oVk24lGyoXa/nJH04sXx7sZHi3s9F8C0tRMSSr/9RU
	hcvgfy15IFNdYBcVZiCybnKsk
X-Google-Smtp-Source: AGHT+IH4d/jBWWyqrNyiszG+0LO4hAxkQ0gdevHRKYQdN5UnYmE0IiAoCsw2Q/X+f85EBCdMcKyC7Q==
X-Received: by 2002:a05:651c:50c:b0:32b:2e45:c403 with SMTP id 38308e7fff4ca-32b4a5d9710mr22418471fa.39.1750074275202;
        Mon, 16 Jun 2025 04:44:35 -0700 (PDT)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com. [209.85.167.42])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32b3307eceesm15582801fa.48.2025.06.16.04.44.34
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 04:44:34 -0700 (PDT)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-553b51f5218so2644970e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 04:44:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX70ltWyYfY15KpNN/URa6IJJle6HGX2OOpOLZYBRWh9Qx09yIqbrcAiHFOeXUmWHC62CaMfDcIvf9d/6KM@vger.kernel.org
X-Received: by 2002:a05:6512:3d8d:b0:553:26a7:70e0 with SMTP id
 2adb3069b0e04-553b6f31f40mr2247748e87.43.1750074274315; Mon, 16 Jun 2025
 04:44:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250111-fix-cocci-v6-0-1aa7842006cc@chromium.org>
 <20250111-fix-cocci-v6-2-1aa7842006cc@chromium.org> <41cba134-4c8c-bb6d-c68b-a7de8da0689c@quicinc.com>
In-Reply-To: <41cba134-4c8c-bb6d-c68b-a7de8da0689c@quicinc.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 16 Jun 2025 13:44:20 +0200
X-Gmail-Original-Message-ID: <CANiDSCsVN0gXd=0GLALYvoBZ=cBY8daAJBmL=NJ5UteikZLpNg@mail.gmail.com>
X-Gm-Features: AX0GCFuBOjMnH3G2kUW3qtOUSx12VY80ZFNRDQ0cje6-a_VtuYVOFZQBnrrxyFE
Message-ID: <CANiDSCsVN0gXd=0GLALYvoBZ=cBY8daAJBmL=NJ5UteikZLpNg@mail.gmail.com>
Subject: Re: [PATCH v6 2/6] media: venus: vdec: Clamp parm smaller than 1fps
 and bigger than 240.
To: Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, Hans Verkuil <hverkuil@xs4all.nl>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Vikash

On Mon, 16 Jun 2025 at 13:04, Vikash Garodia <quic_vgarodia@quicinc.com> wrote:
>
>
> On 1/11/2025 3:25 PM, Ricardo Ribalda wrote:
> > The driver uses "whole" fps in all its calculations (e.g. in
> > load_per_instance()). Those calculation expect an fps bigger than 1, and
> > not big enough to overflow.
> >
> > Clamp the value if the user provides a parm that will result in an invalid
> > fps.
> >
> > Reported-by: Hans Verkuil <hverkuil@xs4all.nl>
> > Closes: https://lore.kernel.org/linux-media/f11653a7-bc49-48cd-9cdb-1659147453e4@xs4all.nl/T/#m91cd962ac942834654f94c92206e2f85ff7d97f0
> > Fixes: 7472c1c69138 ("[media] media: venus: vdec: add video decoder files")
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/platform/qcom/venus/core.h | 2 ++
> >  drivers/media/platform/qcom/venus/vdec.c | 5 ++---
> >  2 files changed, 4 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
> > index 44f1c3bc4186..afae2b9fdaf7 100644
> > --- a/drivers/media/platform/qcom/venus/core.h
> > +++ b/drivers/media/platform/qcom/venus/core.h
> > @@ -28,6 +28,8 @@
> >  #define VIDC_RESETS_NUM_MAX          2
> >  #define VIDC_MAX_HIER_CODING_LAYER 6
> >
> > +#define VENUS_MAX_FPS                        240
> > +
> >  extern int venus_fw_debug;
> >
> >  struct freq_tbl {
> > diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
> > index 98c22b9f9372..c1d5f94e16b4 100644
> > --- a/drivers/media/platform/qcom/venus/vdec.c
> > +++ b/drivers/media/platform/qcom/venus/vdec.c
> > @@ -481,11 +481,10 @@ static int vdec_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
> >       us_per_frame = timeperframe->numerator * (u64)USEC_PER_SEC;
> >       do_div(us_per_frame, timeperframe->denominator);
> >
> > -     if (!us_per_frame)
> > -             return -EINVAL;
> > -
> > +     us_per_frame = max(USEC_PER_SEC, us_per_frame);
> This logic changes the actual fps from client. Consider a regular encode usecase
> from client setting an fps as 30. The "max(USEC_PER_SEC, us_per_frame)" would
> override it to USEC_PER_SEC and then the subsequent logic would eventually make
> fps to 1.
> Please make it conditional to handle the 0 fps case, i guess that the objective
> in above code, something like below
> if (!us_per_frame)
>   us_per_frame = USEC_PER_SEC;

You are correct. Thanks for catching it!

I think I prefer:
us_per_frame = clamp(us_per_frame, 1, USEC_PER_SEC);

Regards



>
> Regards,
> Vikash
> >       fps = (u64)USEC_PER_SEC;
> >       do_div(fps, us_per_frame);
> > +     fps = min(VENUS_MAX_FPS, fps);
> >
> >       inst->fps = fps;
> >       inst->timeperframe = *timeperframe;
> >



--
Ricardo Ribalda

