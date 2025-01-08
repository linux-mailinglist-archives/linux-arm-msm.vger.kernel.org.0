Return-Path: <linux-arm-msm+bounces-44374-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A2EA05C4C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 14:02:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5A06B7A03B5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 13:02:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE3381FBE87;
	Wed,  8 Jan 2025 13:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OhIuPgv1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA6A51FBCB9
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jan 2025 13:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736341339; cv=none; b=ddrGhWo5IE7mYjVNBvBLzCyql32HfiSfH8kNOTRmpyoIWz5Zv4fMivX0b9nokv5/w7knpCrwUWlJBs5+yWskEaJy27FDxetnHC5S6xEh4zT88DG09bNgpk+n7giQcrzx9TM3pm9WLzdSwZAgBilN1/Ywtnoa3pHCstugTvJoCPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736341339; c=relaxed/simple;
	bh=pfXKttkEL2SWWU2rinTk0BU61tt2kEqGuqQajYKioxY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CQqBOKNnP58ueJ/2EvglSNo6Fxjdm+p4Ldik1ptG4xIWTR5jiA6NeohVD4nxpT1swUIEAZGZNk7t7pjeOW4sR8icxzHJqiZ/I5kcXnZLV/fCPMOcHPEVmJxqHgWq938SY8ZR+vXrifMGmliGJ6tOCh+sHw5Lbu3XUJ2Zkyvj/7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OhIuPgv1; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5401d3ea5a1so16573362e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jan 2025 05:02:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736341336; x=1736946136; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LtdjdENjpDlREgBVNAk/GURw9RLq4teFMIc2Gk3yyCc=;
        b=OhIuPgv1Qu6NoixcFS6zJJFc+GeYERk45gQGBMqJ1YO6ppsxXaVjPp2YitVY/ynS0j
         O195VUw6K/gfx0vzlmqjZbWEdL8FAwBs23WWcmA8O4pT21evMIrOoya5XHBUd5L84plQ
         1hWcx8151ZsaZsMwIot5Brj+Ek4rF1Nbe1Xfn2xwmDCAFSrHoFTHcBIuNT7w6DCzEtEd
         1oWDNqXWITabYAqkgCyuCISarSDsJVqEF5luMDwdqbddUk2vagQgIgKA8tV2qbFrviop
         3IvTnp/ZF67zf76wwBsCjw0WTAV1VgQwBOZJPgu5ahPgRjpprFbtvpp12J34S0MFkQ7b
         jxQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736341336; x=1736946136;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LtdjdENjpDlREgBVNAk/GURw9RLq4teFMIc2Gk3yyCc=;
        b=jruk7ThbMDLJ/ioyDZbbKG0UKD8jB7eZVJ/eimdoPOVRsgGZkMV/EzXSorj+5zmRch
         HS2sPGwg+MxBNabEBwG8LN44zSCaVNBCyVCB09rurxv72Z843IoTSta9UIfHoH80indY
         7R+pz+VWSpSfB9Yq4jBWkCvjkaIRtkr8pSJbqukyl1VklUH13ABVFF3V6Hs6ctvRbOpy
         AfET2Zqgcp36l5U+gBDdhvcQVQrqNnPDUi208Se7ZaNR/YoRPJIEJGfROuG/Tb9Acqs0
         ZtBPKDdnRz6ACOo9RqcSnHJMEqbmRtsA7caQQpz5dah2qFR6PeYnty4aSKpgqOFQgwgI
         M9Hg==
X-Forwarded-Encrypted: i=1; AJvYcCW5yfszaVDQtcn0VlNl6uq/6Qs46glr6iKYknONF/C35Gb2vcbUxh40uimtTgiiGSkmDYrmz9PRnBAe6FPC@vger.kernel.org
X-Gm-Message-State: AOJu0Yxhl7GdFTFL0kbyoYCQJIply/BWIEtdQyJ/HExg/FHKABJDH/w2
	sMnlYVODGloZN7XWihQi2n1+5xH7e2WwoZIsu/MYRY5B1uG+DNf1Ins9Sz0AenY=
X-Gm-Gg: ASbGncs5VvQoy2NCQhDHT57zo4U2pwKS/+rQV7jNzXoiUw6B5ps979yBjlEO3UhKkk9
	2DSrWQlNvswc4kln/nqLSofjS/UF6zx6U6PI+Hq9oFOudOG1ifSOjGUCfjYx0cux1Vte9GSz9m2
	XJJITHsMU3UP+8BjfY0uSd3lrm8ZhD7rL4Lzeg83q58gtb5NNodzGPwlgmWu7ZXrmSQ10UM5aLR
	8vk8vwBtcUQ3FeVnB+Y7O2BQviReqCPWLE7S6hWhkLFdsuvwWIcgY7vE3uy/KzuMPfgOXiESKif
	uk5Wmv0oIEyM0Bj7T9AnCRRk8l2bzG3UGoMT
X-Google-Smtp-Source: AGHT+IF11Wgw4NNBGE9Alqz5c2ikDMgSytLQymr22qioeMYiszQ6HPLJGryvXEb7CVA6I7N4H4lGkQ==
X-Received: by 2002:ac2:4e08:0:b0:542:23b3:d81b with SMTP id 2adb3069b0e04-5428450707amr631936e87.5.1736341335696;
        Wed, 08 Jan 2025 05:02:15 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542236000ddsm5590003e87.82.2025.01.08.05.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 05:02:15 -0800 (PST)
Date: Wed, 8 Jan 2025 15:02:12 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Stephen Boyd <swboyd@chromium.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org, patches@lists.linux.dev, 
	devicetree@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Rob Herring <robh@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, 
	Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Subject: Re: [RFC PATCH 6/6] arm64: dts: qcom: sc7180: Add SoC specific
 compatible to soc node
Message-ID: <n3fn5mnrrinrgrvadqgymv3cx355qpx5kk27nlrz2emoxfmjyt@ymwpfxf7lv4r>
References: <20250108012846.3275443-1-swboyd@chromium.org>
 <20250108012846.3275443-7-swboyd@chromium.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250108012846.3275443-7-swboyd@chromium.org>

On Tue, Jan 07, 2025 at 05:28:43PM -0800, Stephen Boyd wrote:
> Allow an SoC driver to probe for these devices. Add the SoC specific
> compatible to the soc node. Leave the original simple-bus compatible in
> place so that everything keeps working.
> 
> Cc: Rob Herring <robh@kernel.org>
> Cc: Bjorn Andersson <andersson@kernel.org>
> Cc: Konrad Dybcio <konradybcio@kernel.org>
> Cc: <linux-arm-msm@vger.kernel.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index 76fe314d2ad5..257890a193e6 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -782,7 +782,7 @@ soc: soc@0 {
>  		#size-cells = <2>;
>  		ranges = <0 0 0 0 0x10 0>;
>  		dma-ranges = <0 0 0 0 0x10 0>;
> -		compatible = "simple-bus";
> +		compatible = "qcom,soc-sc7180", "simple-bus";

If the new driver requires this compatible, it will break compatibility
with older DT files (and it should be avoided).

>  
>  		gcc: clock-controller@100000 {
>  			compatible = "qcom,gcc-sc7180";
> -- 
> https://chromeos.dev
> 

-- 
With best wishes
Dmitry

