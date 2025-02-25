Return-Path: <linux-arm-msm+bounces-49251-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7521DA43A92
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 11:04:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 617EE174ECE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 10:01:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 148B7266EF4;
	Tue, 25 Feb 2025 09:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tLHTlHth"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35518262D03
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 09:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740477382; cv=none; b=iSM0uB5rdewcjvrqHWEvgypjpRvZi5YhY10d9rU+muHqCa5qJkUb/xIYgYo0zDo/cwXQ55/atGSzlXUOD36uyMU0bH+x5wrjojJA6FP4FbGDO3rgztmX//5DW33L4PbNUSzG3eBWIUsxiS0jwW9kD+qwD4bSK0hTyZJONDxflJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740477382; c=relaxed/simple;
	bh=BPTfQFwVb38cEkzMTiSXAuUl8yu357azPBx4X8TXPFw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tXQEsK+ASpCTY3IBpzdxfnKJi9TNoXLnqezrmUSEMyrUZpIhwdjH2y3fhTRmJZgMc3kXYEeg8rIpW7aaOLOp7MNNaj4MfGNZQOQcw3bO/ybCbpY8AJk36q7qndLouvOTConsYRKZNzaNxFSd7cIfo7Uw/ZlfRNm0Xbi+XxLyBT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tLHTlHth; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5462a2b9dedso6456920e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 01:56:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740477378; x=1741082178; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kHo4ant3MqBLIezJ4GpXKRoe+W8rFXGvNO2fyprBZXo=;
        b=tLHTlHthDPccW1IhmZ+6AWhFKe++IlwF4Xtb2D2EF4xoHG73f1Oq+nUwpf016CyYoa
         8lwLzCBqotHSGJstEzJ3aICic3eMhn1wxtVV6uo7FWHa2hRPBvKHJZShdO5P/a6GJ0dM
         J3pvBBpRMfu9TB/bwXGbxkHYGE5suxNuWWVIMrBt6RfzGof4Rmcf1iu9OGGLcNR58vwm
         azXao/KBOR8OzkPjDf+fF1Yiz2NO6++cFfYdx27tdBpjBu8Y9wSugmPG0+YdaRysBW9u
         QrRLTC4oyMNEJw310QgHGDZyh2/+LZkad59ySawkF/+E0vYmv9KWB4SGlI5FGJcAQU88
         sDmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740477378; x=1741082178;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kHo4ant3MqBLIezJ4GpXKRoe+W8rFXGvNO2fyprBZXo=;
        b=ry465/aRaAIWdOTukLxaA67VhreHfk39B6KGoWaUqnsO6by1oZoqLPzOxu1w8n3lAX
         kC3jhDBAEXfFHQO4lH0k0gBSKJ64Q4E6dMJgCmdA0YVHxb5SVCxpqYfGkYq03Tlg/yTq
         7whfwWTK3qUAkWUdyBqRG98HWFkUgu0H0A23ouQfhyp65dvs8Hfie+S6mWRp81JGlgJa
         +d1HvwJ6fX/EFQw5InqtfJPSzwrqsFyPdvrHQFamhbXhwFfGsUMWnkCYx9NpNl9oyHAR
         06F2qJ1tvUpqgOJTt5ImwzJDHltd/NHkDZwDeZ18Yt43uBP171pQDmC5K4GJFFzs0QPp
         Wc4g==
X-Forwarded-Encrypted: i=1; AJvYcCVmX3UcnPKOyAVzI4WTf/vm0RYdW0AlYfPkoO5fvMjZzoy7z6fNgbc+HmnItePDGjgCYUVwvQrJFOBmGiMg@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3txSP29DRZzsC4ZT758JAuSTktS9sBM0tMUkcu6UA0qUir5HZ
	vCxh1+qB+uW2wKGvAbwH6ui4P9XaANb0i3o/UMDa1ZsYdVe4OoyAilrqP+WAcwI=
X-Gm-Gg: ASbGncu879VeKUv16YI9yARNbfqlcJY8oY5sV60ku5ZdoBQzGe0WRewFKyC54Vb6wBS
	/C2OFHNdCPUH+HtbOiMPVDOHSX6dQBoUfWKfkMTpioBoiiZwsMnR9tGHGNCYJluU/isn3km7mdM
	ilaDhuMrTC5jh83L+Xd6q2vCo2vbfy82Zt8jrHRZcykYUXAvtcPZyBWPj/5GIe+snTi1LvSqHnQ
	UkWqZyp6AZCGbLn7hpgC6L58KMDOXs93S0gmAC50v/pYeGf2x2/Lhh58pzDmG3NcSBzJAa3j3Bm
	9xxPEPk9N62y6BXSvGAopnQVYQFf+X1/VlirH3U60y+Sm7s3GxSY2kzrjsj9KNLglqoeG2daSMZ
	qbse6VA==
X-Google-Smtp-Source: AGHT+IGf1fx9WhECupnAo7w7pPkCUTIZiLjuAfityvrjrpdZZn0ACc3Tdi/B9/4MMPHnQlSO6ot9lQ==
X-Received: by 2002:ac2:4c47:0:b0:545:1240:24f1 with SMTP id 2adb3069b0e04-54839271758mr6486094e87.47.1740477378212;
        Tue, 25 Feb 2025 01:56:18 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-548514bc3dcsm136367e87.103.2025.02.25.01.56.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 01:56:16 -0800 (PST)
Date: Tue, 25 Feb 2025 11:56:14 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rudraksha Gupta <guptarud@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	wctrl <wctrl@proton.me>
Subject: Re: [PATCH] ARM: dts: qcom: msm8960: add tsens
Message-ID: <xgj6voxz7vf52tg2zslnj6wdih63vjrwqesgeuiqzopmjqhcr2@x54q5pxopvxu>
References: <20250225-expressatt-tsens-v1-1-024bee5f2047@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225-expressatt-tsens-v1-1-024bee5f2047@gmail.com>

On Tue, Feb 25, 2025 at 01:19:44AM -0800, Rudraksha Gupta wrote:
> Copy tsens node from ap8064 and adjust some values
> 
> Co-developed-by: wctrl <wctrl@proton.me>
> Signed-off-by: wctrl <wctrl@proton.me>
> Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
> ---
>  arch/arm/boot/dts/qcom/qcom-msm8960.dtsi | 62 +++++++++++++++++++++++++++++++-
>  1 file changed, 61 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
> index 865fe7cc39511d7cb9ec5c4b12100404f77e2989..167953605447bfaa0d33b0e41b581220f86c72e6 100644
> --- a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
> +++ b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
> @@ -52,6 +52,40 @@ memory@80000000 {
>  		reg = <0x80000000 0>;
>  	};
>  
> +	thermal-zones {
> +		cpu0-thermal {
> +			polling-delay-passive = <250>;
> +			polling-delay = <1000>;
> +
> +			thermal-sensors = <&tsens 0>;
> +			coefficients = <1199 0>;

Doesn't tsens driver read the slope and offset from the EEPROM?

> +
> +
> +			tsens_calib: calib@404 {
> +				reg = <0x404 0x10>;
> +			};
> +			tsens_backup: backup-calib@414 {
> +				reg = <0x414 0x10>;
> +			};

missing empty line between nodes


> +		};
> +
>  		msmgpio: pinctrl@800000 {
>  			compatible = "qcom,msm8960-pinctrl";
>  			gpio-controller;
> @@ -127,7 +175,7 @@ msmgpio: pinctrl@800000 {
>  		};
>  
>  		gcc: clock-controller@900000 {
> -			compatible = "qcom,gcc-msm8960";
> +			compatible = "qcom,gcc-msm8960", "syscon";
>  			#clock-cells = <1>;
>  			#reset-cells = <1>;
>  			reg = <0x900000 0x4000>;
> @@ -135,6 +183,18 @@ gcc: clock-controller@900000 {
>  				 <&pxo_board>,
>  				 <&lcc PLL4>;
>  			clock-names = "cxo", "pxo", "pll4";
> +
> +			tsens: thermal-sensor {
> +				compatible = "qcom,msm8960-tsens";
> +
> +				nvmem-cells = <&tsens_calib>, <&tsens_backup>;
> +				nvmem-cell-names = "calib", "calib_backup";
> +				interrupts = <GIC_SPI 178 IRQ_TYPE_LEVEL_HIGH>;
> +				interrupt-names = "uplow";
> +
> +				#qcom,sensors = <5>;
> +				#thermal-sensor-cells = <1>;
> +			};
>  		};
>  
>  		lcc: clock-controller@28000000 {
> 
> ---
> base-commit: ffd294d346d185b70e28b1a28abe367bbfe53c04
> change-id: 20250225-expressatt-tsens-06d46587a584
> 
> Best regards,
> -- 
> Rudraksha Gupta <guptarud@gmail.com>
> 

-- 
With best wishes
Dmitry

