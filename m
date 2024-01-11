Return-Path: <linux-arm-msm+bounces-7078-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DDFA82B7E2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jan 2024 00:14:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 99A5AB21847
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jan 2024 23:14:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 448A65810E;
	Thu, 11 Jan 2024 23:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e90pFJOD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC679FC08
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jan 2024 23:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3bbd1e9c5f7so4763784b6e.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jan 2024 15:14:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705014878; x=1705619678; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wrVoNjP495STQIQ3FVMsai806YpFMUIXx4z0Rg6visI=;
        b=e90pFJODmaP1x1AFdNljmBfXMKU0hkIiLhAZXJ/VqtiwmhUv9JPMUaF31pt66xScf+
         nN6SOrDTvndAWG7G6bbJwLseXyGM92bj+vMRK6wYZJZ1wwZnp3Ds91iHKBgVMPBWAMr1
         5wCO7dbxtUfeJ8eyeglt1d4rOR4Tta2jkLP2Cqo1IWa+QHmY95LkaxbMrROFy51f5YY2
         ruioPda42AiMAvnjQzfFLWRt/ZVOLFm7drBIVIc5RoCRnuFd1kKsC8wyqI8NWxoHEFYf
         VZBmYBONYtAYc56JaDt4YJvbSSS1QHPJ40reeCR5HGD4Y7k4MfrrRl/QCmMvNcKOxL7p
         dD1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705014878; x=1705619678;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wrVoNjP495STQIQ3FVMsai806YpFMUIXx4z0Rg6visI=;
        b=K9xmN86d6L2uAQLXJSR9Pxjc5x8ZUiVZpXGexnLyarhVYbqHTrOE0vK8+hijoQe8/X
         RUcB/cVBihpSt3Gt1WyxaDvJIlW6RMkuFl5yln8OupiK4mtFRfya2g5Rx1U7gWvu1HF/
         SoSpLQF71endZHKouy7M3y/L/kwCsaASdCx5HSuNgibzCNG+NwMl7DOQNrCchyymkRbx
         DBOmlA0SOe+fT1YvsvF4ARHGSbXk9emXK7B082s/aAdJFWDp4FynsMe4t9BthEhaTna5
         bJws6BSwCnvwNUgn9Q/4IAtgepeTa/bDOM7r/MZPbkQLenYodffrgSJK/LtPsVqDInyF
         50wg==
X-Gm-Message-State: AOJu0YxX9VQ2Oe9D4rd4eaHZj/TeCw2VSi8HPKPwD4pw3nyuos+JC/tc
	mZqaY1x0tl3/Hr13LqpcyV0=
X-Google-Smtp-Source: AGHT+IGDpKcp2NUQHYqgIYov31tIUZuCdOiqNmsa1HKjxrxNTrNHs1Lbzf8wtArROVtJKBgCf+AvNA==
X-Received: by 2002:a05:6808:1308:b0:3bd:5791:67f3 with SMTP id y8-20020a056808130800b003bd579167f3mr101557oiv.30.1705014877887;
        Thu, 11 Jan 2024 15:14:37 -0800 (PST)
Received: from localhost ([2607:fea8:52a3:d200::a40a])
        by smtp.gmail.com with ESMTPSA id s4-20020ad45004000000b0067f07683decsm627592qvo.99.2024.01.11.15.14.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jan 2024 15:14:37 -0800 (PST)
Date: Thu, 11 Jan 2024 18:14:34 -0500
From: Richard Acayan <mailingradian@gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Stephen Boyd <swboyd@chromium.org>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: Re: [PATCH] drm/msm/mdss: specify cfg bandwidth for SDM670
Message-ID: <ZaB2WjoHBNPnv0CN@radian>
References: <20231215013222.827975-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231215013222.827975-1-dmitry.baryshkov@linaro.org>

On Fri, Dec 15, 2023 at 03:32:22AM +0200, Dmitry Baryshkov wrote:
> Lower the requested CFG bus bandwidth for the SDM670 platform. The
> default value is 153600 kBps, which is twice as big as required by the
> platform according to the vendor kernel.
>
> Fixes: a55c8ff252d3 ("drm/msm/mdss: Handle the reg bus ICC path")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/msm_mdss.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> index 455b2e3a0cdd..35423d10aafa 100644
> --- a/drivers/gpu/drm/msm/msm_mdss.c
> +++ b/drivers/gpu/drm/msm/msm_mdss.c
> @@ -562,6 +562,7 @@ static const struct msm_mdss_data sdm670_data = {
>  	.ubwc_enc_version = UBWC_2_0,
>  	.ubwc_dec_version = UBWC_2_0,
>  	.highest_bank_bit = 1,
> +	.reg_bus_bw = 76800,

This seems to be the bandwidth applied to the "cpu-cfg" path, but it is
not in the device tree yet and is not allowed by schema (for no
particular reason). In sdm670.dtsi, it would be defined as:

	<&gladiator_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_DISPLAY_CFG 0>

Furthermore, I have not yet emailed the patches that I use to test the
display on SDM670, namely, the panel driver and device tree changes for
the Pixel 3a. Nevertheless, this does not break anything, even with the
interconnect path and everything needed to test.

Tested-by: Richard Acayan <mailingradian@gmail.com>

>  };
>  
>  static const struct msm_mdss_data sdm845_data = {
> -- 
> 2.39.2
>

