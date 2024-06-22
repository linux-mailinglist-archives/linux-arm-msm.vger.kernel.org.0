Return-Path: <linux-arm-msm+bounces-23693-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB530913368
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Jun 2024 13:39:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 073991C21160
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Jun 2024 11:39:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F78814C591;
	Sat, 22 Jun 2024 11:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G7Gfb3NU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70EC414B089
	for <linux-arm-msm@vger.kernel.org>; Sat, 22 Jun 2024 11:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719056388; cv=none; b=SklH3dJsrZmXoDMiI88E60wmmlXKpwxkYdXUcApBQhKDfaq6n/9OILegYT3TfURI1ovCCOlPn1vWQaiNqGmYlkZOCavwFIocPsawbipi7aGukwS/NhH7BFjw+wrwgundAgdM3RrD09OOW/h+PH6KymYaEYsfGdQOgYikUt64+o8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719056388; c=relaxed/simple;
	bh=OCdsOo/BOHyFx3+Z3l2bC9A5tuN2RyWDPRXhs4S8JMw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qBZekKilYEMBx/Y54w/7Hib0Z89jfCB7GB46JbfvQtuqQO0duEGN8wEJ3TUh4JZ67Iwz1JwuowiWpW61wJit3U9/vBhOTFvkmsVuNEgXlvuiWG/Rz0EIr8e/zYhccWifD5XgZQUj8RZSfiUrXvBJLdpDnynj7zIq9SoXRhNaR/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=G7Gfb3NU; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52cdf4bc083so413559e87.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 22 Jun 2024 04:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719056384; x=1719661184; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Kh1lIxhRvlZJlWBZQ3fVihNtTYBls5m4TXb40w4pSDE=;
        b=G7Gfb3NUQbkIsTjW8i6snwZXelsv5h4jQ2m89YIJFoxvjnRW/JUMxNHEGrcPkKZ38u
         VD/THeaNL3PFpnGqKxetOistIbpfqZHveJ8is4KAvIAlEwXWcugtL4GU7k4YQCWo488f
         gTUNd6W9XCQfWqUAPD3CUXvHaYwVAAkPAuTlncIEClGy5Hi3XrnpGld2Qrfx595+qLuD
         WyLwEFVWFE74Q/EX9DY6TnwyrCf+3ZXWt1x4/GcHVgi47oY+b+Hdt03tobVF2TfTsdp9
         coLY376fwYxcFuRRgsc+YOaqF0vkeeAPTuJV+6ABMEe4fuurUq01kewcNTbCj9yufHE+
         XJDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719056385; x=1719661185;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kh1lIxhRvlZJlWBZQ3fVihNtTYBls5m4TXb40w4pSDE=;
        b=iQO6WDcS7eOhaeM7aiPqLrhy9tBj0FYhFpRmKCmec0w6VSzTZIBUFtde+fAdmxiGh+
         CsOffCAfzj16JYpxkyx8wQR4LNdNM7QdWq9Sdr9cyBhs+8A2v9kRbH8B+7WlPedBxya4
         EmkJLsQ7qz1+kRbxwjiZfCctcVlzoxlIBsrGw2jkAMJasrfrEL2AyXcufjsKVMUN1HiQ
         VzysSs+gqRmhlxbOhZOaVt3TY+AhNSnymuGrJEELsEJfg/TCBAU+DczaVu1BHAHuvZo9
         TgGK4lxOxbPhnR9qwl05A/zd2O5sLLdekKQtm+M4F9mZGedCw1DMiobDTy+QJXjILjUr
         OI6A==
X-Forwarded-Encrypted: i=1; AJvYcCVxWUa26PxWPmW74XovkJwFIXl6MQVruenxW30HSiW5+UqrkNeh5gh7SyQMhbyeJNzwpLzmTb151341AtJiGkN6cfNmlANpa5e0BAqVEg==
X-Gm-Message-State: AOJu0YwWbQHd84BNotLGMk7RQbDCZz0NIuf2qubMdQh5tT+G4W9KH9Lm
	sPRqvZX23bz7UjlqmqHKQjpNcCpMUo/JxN6N7eZrpRRiYUIvEGiLXIvglSkUjnE=
X-Google-Smtp-Source: AGHT+IH8k8QOA58L7YU6kzdfuHzkc3ehVV5Iyo7noGGH483YxSGNq0lgFwx7Vjua/ahxSsJU6oNR2g==
X-Received: by 2002:ac2:4209:0:b0:52c:cb5a:a60d with SMTP id 2adb3069b0e04-52ce06104d7mr249031e87.8.1719056384543;
        Sat, 22 Jun 2024 04:39:44 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52cd63b4100sm474271e87.36.2024.06.22.04.39.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jun 2024 04:39:44 -0700 (PDT)
Date: Sat, 22 Jun 2024 14:39:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <trabarni@gmail.com>, 
	Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: guard ctl irq callback register/unregister
Message-ID: <jeiz7tfgmhbswfhyrt4xervypw4ltonfbimoa45rykuaimkyst@yevqeplcrrwq>
References: <20240509-ctl_irq-v1-1-9433f2da9dc7@gmail.com>
 <151f3503-d7ce-b11d-0658-1d26a47b1920@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <151f3503-d7ce-b11d-0658-1d26a47b1920@quicinc.com>

On Thu, May 09, 2024 at 12:14:19PM GMT, Abhinav Kumar wrote:
> 
> 
> On 5/9/2024 10:52 AM, Barnabás Czémán wrote:
> > CTLs on older qualcomm SOCs like msm8953 and msm8996 has not got interrupts,
> > so better to skip CTL irq callback register/unregister
> > make dpu_ctl_cfg be able to define without intr_start.
> > 
> 
> Thanks for the patch.
> 
> Have msm8953 and msm8996 migrated to DPU or is there a series planned to
> migrate them?
> 
> The change itself is correct but without the catalogs for those chipsets
> merged, we will never hit this path.

I think I'm going to accept this patch. While we might not be supporting
these chipsets, it's easier to have this in.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> > Signed-off-by: Barnabás Czémán <trabarni@gmail.com>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> > index 489be1c0c704..250d83af53a4 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> > @@ -298,7 +298,7 @@ static void dpu_encoder_phys_cmd_irq_enable(struct dpu_encoder_phys *phys_enc)
> >   				       phys_enc);
> >   	dpu_encoder_phys_cmd_control_vblank_irq(phys_enc, true);
> > -	if (dpu_encoder_phys_cmd_is_master(phys_enc))
> > +	if (dpu_encoder_phys_cmd_is_master(phys_enc) && phys_enc->irq[INTR_IDX_CTL_START])
> >   		dpu_core_irq_register_callback(phys_enc->dpu_kms,
> >   					       phys_enc->irq[INTR_IDX_CTL_START],
> >   					       dpu_encoder_phys_cmd_ctl_start_irq,
> > @@ -311,7 +311,7 @@ static void dpu_encoder_phys_cmd_irq_disable(struct dpu_encoder_phys *phys_enc)
> >   					   phys_enc->hw_pp->idx - PINGPONG_0,
> >   					   phys_enc->vblank_refcount);
> > -	if (dpu_encoder_phys_cmd_is_master(phys_enc))
> > +	if (dpu_encoder_phys_cmd_is_master(phys_enc) && phys_enc->irq[INTR_IDX_CTL_START])
> >   		dpu_core_irq_unregister_callback(phys_enc->dpu_kms,
> >   						 phys_enc->irq[INTR_IDX_CTL_START]);
> > 
> > ---
> > base-commit: 704ba27ac55579704ba1289392448b0c66b56258
> > change-id: 20240509-ctl_irq-a90b2d7a0bf5
> > 
> > Best regards,

-- 
With best wishes
Dmitry

