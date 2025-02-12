Return-Path: <linux-arm-msm+bounces-47779-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C016A32B4D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 17:16:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 17AEC1883B95
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 16:17:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D0CF1E491B;
	Wed, 12 Feb 2025 16:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mFPhC3WH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE71271838;
	Wed, 12 Feb 2025 16:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739377012; cv=none; b=PuZHvgBsFAjhAWInItqFxsU6IVpQ1AWmhDjEd7iN8aiLiqXiy5edjJtJ2l8uVPy2kh/PemSIDGyBr49K34hY7fRc6TTeHHKoDf3q0TKWaEZI96RZeGLMtLINy8b+xkpaVZwcTNtfubH1+CNhLlpdC7lqfcp3zLVyJJ4XjJ/nv4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739377012; c=relaxed/simple;
	bh=K/BdaHT1Me12GLrUJISIULeIvIuEzXg6imrye1p2Ckw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HzTrdI8nTeeAdlp+ONM1xSWwVuqTYouDmJED5UkQ5ZGkeV8gJ/Cs45xia8ELNzNLUldlPzOZucgvqxwdSuzAuycnFGgcIlAhGs4XnEFuljxFQ738ys1LsxTWfmAKQr0N7JYr6c4P+HxvDS6UNwFKJrQU4HWQdL7xVErZiUIM6aU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mFPhC3WH; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-21f818a980cso68095735ad.3;
        Wed, 12 Feb 2025 08:16:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739377011; x=1739981811; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=puZMEhQ0jQEkXyS2pOZ2hsMMHW+APfyvQf4b0vFTcBA=;
        b=mFPhC3WHGX2b3zAhacCBcoO0F6q9wy1LCWkGrxIhkzstikVEPr3Gmo/04E/7P0muek
         /jtyZMkovKBV+MEGC+xw1nX32+P0Eg4gkUxTGYKE9jffvUmGX0ILeIX9pjEqloO0J1FI
         cqZPg9zC11glFGEBiwcUzbz1+/vfim7XnNVhL/2EofLLSBces/0a0pxce/IM4Ysb+kaL
         qA78FaYA8Rg8oRFQXoReA9N8OhGYY+HTt8drUOJmKNGGgLrh7a4Bt08ePdQSqXAANuoC
         dkBqQbhDr+iuPnDwg25MM4EVktDN9BjEUfI+2O7zQR2UmOTpFcUbxNDo1pQGNwzbGsgn
         ttRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739377011; x=1739981811;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=puZMEhQ0jQEkXyS2pOZ2hsMMHW+APfyvQf4b0vFTcBA=;
        b=gHdN0veqwevgj1JzTXw+jk7PRb0861AHpu0ESiZw3Mz28k4+nSFKqgngKODCZG70Ip
         6ghxURuEvOBfOGDZXbKf8IHo57IYaAfTMcvYGmfJiaDeOpQQX3/D01sTgLH3TRPGtAbC
         t0pS60NV2NukR/TFOGki/nqxPsAOfl4r5Jo/BrEkqpX0o/0peDOfELGL1XY1QPiioP78
         n9rmiviL6eXNsQA2MJJHVtA5w+vJFEIgwz/6wRWNEAfr1TZfXjX5SOeZmeauSv2rMHPM
         v+ZdFEDR38yMo39qS9YElZ9k9otSLf7RtoFttVKFWctoEn0SiDONqIshjNfMUTTySxdm
         fk4g==
X-Forwarded-Encrypted: i=1; AJvYcCVm23FGad4sMoaqQnnz54tgz1+1c9973Ml7u4CPguvz81mjWLzKSxeXJH1FANSP19BJOIcgPyd1iX9CfV8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmW/3cbNxofDce2ObUgMqRFh1Xn4TmsBfq/BJIXfe85vX2ssqJ
	ZFYm6ROf6s8nXmpC2fkQC+VSw5dErYXxUtGOMTaFoL2XpSL/lRd2
X-Gm-Gg: ASbGnct9av948pmrS8ei83uJmpTCwZncuYT114+d7dYZuEpWuO+2s2r0AVxwSwUdJ97
	QFXu+296PabwKK64/3dwFjlsLWPa5MjizwymjrngFoeRKrcC0m7arMwOMY/jum0gCJcmz8UEyUK
	ctJLG+cVsjTpn9sGEXuumYrMGNfzhHkNGyvcvVKBM3tGwmiEQ26Ab+j4Ex041TzAUQUwQj3sqSE
	fKExUDRTjyBNlmnhyLXECkvrGx1gJL/LJlReyf/ITwVA85/jKyQmzDdhf3YVk09p1Xzay2wpEtQ
	OcoSowf6R94DO3xKttQh9lml062o7vEQgMAg4Y2VXA==
X-Google-Smtp-Source: AGHT+IH+MLR86gpLuYxn0zYuz7R9Sm0XEnoZmLxS6eHY+vuFIuq8NaebWegX7qRYu0drMpcFXArypQ==
X-Received: by 2002:a05:6a00:2e1c:b0:730:95a6:375f with SMTP id d2e1a72fcca58-7322c376adbmr5981435b3a.3.1739377010514;
        Wed, 12 Feb 2025 08:16:50 -0800 (PST)
Received: from jamesmacinnes-VirtualBox ([66.119.214.127])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7307b6691e3sm7503229b3a.129.2025.02.12.08.16.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 08:16:50 -0800 (PST)
Date: Wed, 12 Feb 2025 08:16:41 -0800
From: "James A. MacInnes" <james.a.macinnes@gmail.com>
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, sean@poorly.run, airlied@gmail.com,
 simona@ffwll.ch
Subject: Re: [PATCH 1/2] drm/msm/dp: Disable wide bus support for SDM845
Message-ID: <20250212081641.258dea11@jamesmacinnes-VirtualBox>
In-Reply-To: <vl6cfjpckgndu5nacw3o5wvdfwaijactokby6q2lywcdccicgz@k27my3352m2k>
References: <20250212034225.2565069-1-james.a.macinnes@gmail.com>
	<20250212034225.2565069-2-james.a.macinnes@gmail.com>
	<vl6cfjpckgndu5nacw3o5wvdfwaijactokby6q2lywcdccicgz@k27my3352m2k>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 12 Feb 2025 11:03:39 +0100
Marijn Suijten <marijn.suijten@somainline.org> wrote:

> On 2025-02-11 19:42:24, James A. MacInnes wrote:
> > SDM845 DPU hardware is rev 4.0.0 per hardware document.  
> 
> Just checking: version 4.0.0 is not named in the code that you're
> changing: are you mentioning this because the patch you're fixing
> here [1] says that widebus is "recommended" on 5.x.x which includes
> sc7180, yet didn't account for that sc7180_dp_descs also being used
> in the SDM845 compatible which is 4.0.0?  That is something worth
> mentioning in the patch description.
> 
> [1]:
> https://lore.kernel.org/linux-arm-msm/20240730195012.2595980-1-quic_abhinavk@quicinc.com/

That is correct. All the 'modern' Qualcomm dpus got wide-bus turned on
and as the SDM845 has not had a working Type-C port it was never tested.

Happy to add that to my commit message. This is my second submission to
the kernel forum.

> 
> > 
> > Incorrect setting caused inop displayport.  
> 
> Inop doesn't seem to be a common abbreviation, there's enough space
> to spell out "inoperative".  And spend some more words on _why_ this
> is an "incorrect setting" in the first place  (based on the
> suggestion above)?
> 

Happy to spend many more words. Just looking to meet the requirements
for the boards and try to not ruffle any feathers. It seems to easy to
be far too verbose.

> I am trying to remember the details from the original widebus series:
> we discussed that the INTF_CFG2_DATABUS_WIDEN flag was available
> starting with DPU 4.0.0 (IIRC, cannot find the source), yet the DSI
> host only supports it from 6G v2.5 onwards (SC7280 and up?) [2].
> Seems a similar limitation applies to DP hosts.
> 
> [2]:
> https://lore.kernel.org/linux-arm-msm/20230822-add-widebus-support-v4-4-9dc86083d6ea@quicinc.com/
> 

That would reflect the testing I have performed. With the wide_bus
system enabled, The MIPI display functions fine, but the Altmode
DisplayPort (type-c to DP) does not turn on a standard monitor and the
type-c to HDMI connection has either a system that does not sync
(horrific flashing) or just a single solid line. At other resolutions I
was getting vblank errors from deeper into the system.

> > Corrected by separating SDM845 to own descriptor.  
> 
> its own*
> 
> > 
> > Fixes: c7c412202623 ("drm/msm/dp: enable widebus on all relevant
> > chipsets") 
> 
> No need for empty lines between trailing tags.
> 
> > Signed-off-by: James A. MacInnes <james.a.macinnes@gmail.com>
> > ---
> >  drivers/gpu/drm/msm/dp/dp_display.c | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/dp/dp_display.c
> > b/drivers/gpu/drm/msm/dp/dp_display.c index
> > aff51bb973eb..2cbdbf85a85c 100644 ---
> > a/drivers/gpu/drm/msm/dp/dp_display.c +++
> > b/drivers/gpu/drm/msm/dp/dp_display.c @@ -126,6 +126,11 @@ static
> > const struct msm_dp_desc msm_dp_desc_sa8775p[] = { {}
> >  };
> >  
> > +static const struct msm_dp_desc msm_dp_desc_sdm845[] = {
> > +	{ .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0,
> > .wide_bus_supported = false },  
> 
> We can probably drop the assignment, it'll be false/0 by default.
> 
> - Marijn
> 

Thank you, I will get that cleaned up. 

> > +	{}
> > +};
> > +
> >  static const struct msm_dp_desc msm_dp_desc_sc7180[] = {
> >  	{ .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0,
> > .wide_bus_supported = true }, {}
> > @@ -178,7 +183,7 @@ static const struct of_device_id
> > msm_dp_dt_match[] = { { .compatible = "qcom,sc8180x-edp", .data =
> > &msm_dp_desc_sc8180x }, { .compatible = "qcom,sc8280xp-dp", .data =
> > &msm_dp_desc_sc8280xp }, { .compatible = "qcom,sc8280xp-edp", .data
> > = &msm_dp_desc_sc8280xp },
> > -	{ .compatible = "qcom,sdm845-dp", .data =
> > &msm_dp_desc_sc7180 },
> > +	{ .compatible = "qcom,sdm845-dp", .data =
> > &msm_dp_desc_sdm845 }, { .compatible = "qcom,sm8350-dp", .data =
> > &msm_dp_desc_sc7180 }, { .compatible = "qcom,sm8650-dp", .data =
> > &msm_dp_desc_sm8650 }, { .compatible = "qcom,x1e80100-dp", .data =
> > &msm_dp_desc_x1e80100 }, -- 
> > 2.43.0
> >   


