Return-Path: <linux-arm-msm+bounces-45093-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7AFCA11EB9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2025 10:59:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EB52716098B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2025 09:59:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97AA51F9A9F;
	Wed, 15 Jan 2025 09:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oyhZ31Aj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A63941EEA46
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jan 2025 09:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736935196; cv=none; b=DcH2c3MrLOefRlRT7IseY6uzm9RALeP5MvqsP1ONFTotgadXi2qPGCsCHGM0LOWFLZRAM1mH8jTX83JPmeXeeHC0LttCUy3MSPQiwrcfBwFRvZXa0SEfs3hFsQkkthycTVIZAc/UmaxMNdXr1fL2s0SMqq5DvfdPY7wBDSv7Pnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736935196; c=relaxed/simple;
	bh=arnBScITMw6eWK5Hb/OMFQMtjHacKocanV14wKe420c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FiGXm/Sagy+vTyaKXgmJr0eYKnuCXEb+CAp/uXqykUkrkjFlKCiUri3NUwawz6f+p0EFx5ipDQILa08lfu2FKUK4ea5PjxUrsvhJ6+YhbEVa7x5edSZY56LMNxqyaphb00/HXeFvOhLnhIHsmkv5wGl09JXLMkxDliR1Y5vAZsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oyhZ31Aj; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-305d843d925so51561701fa.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jan 2025 01:59:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736935193; x=1737539993; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KAC0ImRqrlKmmuDsCZDTBGDlxgeMelWM2j2WFaaGPeg=;
        b=oyhZ31Aj89CwXU//neqwQ+U6G8HdabL7azE++DOWEyOtdY/TUsAn53GzwBZlKa8/90
         QDDKVkzajCZHvMuJy/KlAkNVOArns8GZtBFjuAimCltDuYIaR7bF06lslmwC9pU2roRE
         /ESfLTY5gYIOYl9eYmSyK6Hy/WeSXw8ufPclYqQuGJ+x6zWjvrG0D3EFgwzzq/DHr1GM
         M5yqzLNJ0K3k6Q89CcHkPzfS7TXVNiVHWQrkV1CIfcLFA04JaKbKoAK8vHgV0fVLXk4F
         OaXlPrK/c0Va+DKBOShYXlqXWa8oao/KAcxVilTO9xzSzmLoH4uUIfl2gOJVCQeapfRK
         m8FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736935193; x=1737539993;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KAC0ImRqrlKmmuDsCZDTBGDlxgeMelWM2j2WFaaGPeg=;
        b=FUeGEKFo3Bzpz2+rRENh/IBrCVLUMlDvPY0LYmt1jI1xxZ2ut3U6f/OEjUNffRuxVm
         Jzh98ntP2PUocuLZZY8PhtgM2pqdVac/BWQAiJ07Ny+73K+jm7PZlllxOSZxX6NKFiv3
         NXTFPOEV+co6Z5riWvB/CAEyZzF7YLqROv26qKXLbvtP4q91M/Q8ed0NLZW43z4nUmaP
         TDamnUu+1UQoEGoC5IF3bvPRuI6T3dCJ/Q3gOhZ3zmvLkscqg6ES8Xlgv8mhfR7OE1zV
         WJmieDd9gBYY2UTHhthRfkIS7VfGRRg9RuCjxeQuePVn37IyNI6ASSiyIVGcJ7u7bvuJ
         hbew==
X-Forwarded-Encrypted: i=1; AJvYcCWkTuyasM30ETL84U7e4htlYoN+ZCKKiP4chbziKai6ksg2KZeItJM/mhGwlqM5l0ddnER15RizHx5U0iBQ@vger.kernel.org
X-Gm-Message-State: AOJu0YycFRrL6v9d265OVW7EhyQLYgdVpZYLY/8EYOlPqijfAsK9HdXi
	XU/WBmtqXKqGIBpGkcm0xfpNb5V4DrRKdeGqCX3AVxplmgMrI3v17v1KO5WcisQ=
X-Gm-Gg: ASbGncuSzCBcNdSsOumbMa1X2mqgIM62iyZlXEMStRaJzmTh3fy18bYi+y3vByCUe1p
	KMLsAHlg4QWb1NbKWLf2u4eBkIQe4pQFtozuViueTt5cMXL08jrcRvD1Fz7FPiP6MEDxHvpE2dm
	ejVIguI+21hEGZyrHv2f50SQr/rg94g7WUQGDIpvJY14WfHqoGU9e/ti+ufBKo/0hpQi6Mn8aTU
	rSd8o4YoRHsN4I5MoKVuyXCDqdBJd6XPas+DVoiIOdXycCDCpAXsvYYMizZn6dUSweYjifJ4ND+
	DiBo9cYey5H9wk1stAXaJNm4ffeLw6BXM6zS
X-Google-Smtp-Source: AGHT+IE7R9Qxg16KDuzLxSKIeuLYGKpQVT1tb0Zi8z6Fsln5bLd6SnosN5wWzlYrBvclpItzOVRwzA==
X-Received: by 2002:a2e:a78a:0:b0:300:1f2c:e3cf with SMTP id 38308e7fff4ca-305f454ffabmr99049431fa.13.1736935192587;
        Wed, 15 Jan 2025 01:59:52 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-305ff1c7af6sm21333041fa.92.2025.01.15.01.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 01:59:51 -0800 (PST)
Date: Wed, 15 Jan 2025 11:59:48 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Renjiang Han <quic_renjiang@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, Vikash Garodia <quic_vgarodia@quicinc.com>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, Taniya Das <quic_tdas@quicinc.com>
Subject: Re: [PATCH v3 0/3] Use APIs in gdsc genpd to switch gdsc mode for
 venus v4 core
Message-ID: <bkjthw5osu5dkwpr46zanwyfqquo45gaivlojqp6n7ixwbdnua@3t3ap2yor5z4>
References: <20250115-switch_gdsc_mode-v3-0-9a24d2fd724c@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250115-switch_gdsc_mode-v3-0-9a24d2fd724c@quicinc.com>

On Wed, Jan 15, 2025 at 03:00:51PM +0530, Renjiang Han wrote:
> The Venus driver requires vcodec GDSC to be ON in SW mode for clock
> operations and move it back to HW mode to gain power benefits. Earlier,
> as there is no interface to switch the GDSC mode from GenPD framework,
> the GDSC is moved to HW control mode as part of GDSC enable callback and
> venus driver is writing to its POWER_CONTROL register to keep the GDSC ON
> from SW whereever required. But the POWER_CONTROL register addresses are
> not constant and can vary across the variants.
> 
> Also as per the HW recommendation, the GDSC mode switching needs to be
> controlled from respective GDSC register and this is a uniform approach
> across all the targets. Hence use dev_pm_genpd_set_hwmode() API which
> controls GDSC mode switching using its respective GDSC register.
> 
> If only the clock patch or the venus driver patch is merged, the venus
> driver will not work properly. Although it does not affect other system
> functions, it is still recommended to wait until both the clock patch
> and the venus driver patch are reviewed and passed, and then merge them
> into the same release by their respective maintainers.

NO! This will not work, as both -media and arm-soc branches will be
broken. Please read about the git-bisect before making such suggestions.

A proper plan would be:
- implement a function which allows one to check that hwmode is
  supported by the genpd driver
- Change Venus to use hwmode for those platforms if it is enabled
- Enable HWMODE support in the clock driver. Clearly identify that this
  patch should be merged together and after Venus changes if all
  maintainers agree with that
- Clean up now-dead code.

Doing it in any other way would result in the broken kernels.

> 
> Validated this series on QCS615 and SC7180.
> 
> Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
> ---
> Changes in v3:
> - 1. Update commit message.
> - 2. Add a patch to clean up the dead code for the venus driver.
> - 3. Remove vcodec_control_v4() function.
> - 4. Directly call dev_pm_genpd_set_hwmode() without vcodec_control_v4().
> - Link to v2: https://lore.kernel.org/r/20241223-switch_gdsc_mode-v2-0-eb5c96aee662@quicinc.com
> 
> Changes in v2:
> - 1. Add the HW_CTRL_TRIGGER flag for the targets SM7150/SM8150 and SM8450
> video GDSCs supporting movement between HW and SW mode of the GDSC.
> (Suggested by Dmitry Baryshkov)
> - 2. There is a dependency of the clock driver introducing the new flag
> and the video driver adapting to this new API. Missing either the clock
> and video driver could potentially break the video driver.
> - Link to v1: https://lore.kernel.org/r/20241122-switch_gdsc_mode-v1-0-365f097ecbb0@quicinc.com
> 
> ---
> Renjiang Han (2):
>       venus: pm_helpers: Use dev_pm_genpd_set_hwmode to switch GDSC mode on V4
>       venus: pm_helpers: Remove dead code and simplify power management
> 
> Taniya Das (1):
>       clk: qcom: videocc: Use HW_CTRL_TRIGGER flag for video GDSC's
> 
>  drivers/clk/qcom/videocc-sc7180.c              |  2 +-
>  drivers/clk/qcom/videocc-sdm845.c              |  4 +-
>  drivers/clk/qcom/videocc-sm7150.c              |  4 +-
>  drivers/clk/qcom/videocc-sm8150.c              |  4 +-
>  drivers/clk/qcom/videocc-sm8450.c              |  4 +-
>  drivers/media/platform/qcom/venus/pm_helpers.c | 73 +++-----------------------
>  6 files changed, 17 insertions(+), 74 deletions(-)
> ---
> base-commit: 63b3ff03d91ae8f875fe8747c781a521f78cde17
> change-id: 20250115-switch_gdsc_mode-a9c14fad9a36
> 
> Best regards,
> -- 
> Renjiang Han <quic_renjiang@quicinc.com>
> 

-- 
With best wishes
Dmitry

