Return-Path: <linux-arm-msm+bounces-22498-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 192AC905ACD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 20:25:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B912A1F21AF0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 18:25:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 574283A1CC;
	Wed, 12 Jun 2024 18:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mWAY5ohU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8425938DF2
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jun 2024 18:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718216735; cv=none; b=LViB7qGhmYu3Bocp+zsu5c4h4/1RbohTPkh7PfnAC40ZZ+dYVOLfOwjID+YSqduP92KbvAFARIkuGrqayiwhR9iW7acNarLnaG3PCPqutv6rtmhAUqvu2cqbn5jhT8WmVFI+xyOkZQ0A5rjgBZYJZv5eZkSTEH0hdZRpC9pVmxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718216735; c=relaxed/simple;
	bh=3kUBWI4USBzjZKPXVZNR0nIVIZpN7x7rC54XJGeyqr0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ko6dVhjZUu2f6Zy4DqkFbog9T7QZ5DDMl9zBR6hR1NDQaNhDqm6V1BHWaWI2dPByKbS8hfsEz0Wcd2O5IeHCOUxrdWkkcnlnccxMFhOoe8cCPZyV+Xd2XPUV4H+kEJHqBgYEJeCEL2lZ2UTBVMbq+3p6jtcFGhQ3YrDoTo7jnZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mWAY5ohU; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-52bc335e49aso227313e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jun 2024 11:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718216731; x=1718821531; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5MiBUTW7EcQsE3tA5rTxGajDwyId4SXUZYUQvKFKzeI=;
        b=mWAY5ohU2BsnLiqz/BFHIWDl+1wEzyWi05zDRcybFCa9cuT1Er643CGW2eHKAQzY5Q
         kJEjXU9plAKFvXrD/pko1f9m4yM312ihhV1icyicuZkC4YXZoXbym+DG2I3sfBp6ZWh4
         tkMJ2EJc+U2pvMwlmWzFbswmnwSr+HAgfXmOAhguj7RlQZNq5F9oOOHQ2GmC0k3LWKqk
         LdHuINL+TkR22u2bXh/uE26uiZ8Z23AytzgR8G+8xH+tP9UTxfmGcT+FJR6pZpfqg9fU
         yTjXQorL4rK7qlbzE6gtIh/fWhUDJXZ0WutAvN6NapJ5ivsNi3hqPF7JCHUa4vygJ5Rv
         vk5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718216731; x=1718821531;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5MiBUTW7EcQsE3tA5rTxGajDwyId4SXUZYUQvKFKzeI=;
        b=ajGR8rk3iFD4Vr/hqWgwyKmQCE+hE6MxyUn9g48P3XUUvavS9XhpbNHUOfKxYFPcPU
         efVQPfE8F9q8K7VBFYOhVvEXveaW/ebnrwI5CdTJANa9PPQATWFwXxsBV7F3AuH/DOAm
         Ezqqg0k9zaCAvhn+4QUripBAnruXGB0VPEflQF1CFCcYqc8BP7B8x8FTEwWttzSrML1Y
         6wdY5iM3QKcscCFbD3HrM124T+1JO0TbVyPshRoe1crLHD3eFiWAW+KPEvQFZ/FSZwwa
         Mb/NHr83HidGaMuyfGwI5efScrr0IZgt6y+troyaDbXC8bBvOxsSyA5Cg/ZFU3fjetZo
         /kOA==
X-Forwarded-Encrypted: i=1; AJvYcCX8MmsiKpO4KdAX0VaKe/tVs0BI48MIyoc82/9oE4xtJSyM0vEFsLWnoRCyMv2OQhiKcIdxu9nrOBXTweci6jZaCzFj+WjQ7z02jmdgtg==
X-Gm-Message-State: AOJu0YwWW2TMw1xT8fBAAHPStBJVqThqTIIxv0nd5aPgTE4BqdhQBXQB
	0Vsm223FZEbCfuJe60zn1z/Wn/PVH6EyC9/KPUNagPY7ASAfG2TnSxduLIGXbew=
X-Google-Smtp-Source: AGHT+IGCXojNZAC9o4U/PbKSm6cWJB5eAwMbe4bN54my04+Vz1htOJQMk15Dw1/WVuBJUZh54EKdpA==
X-Received: by 2002:a05:6512:798:b0:52c:9808:ddc3 with SMTP id 2adb3069b0e04-52c9a3c6cfcmr1583587e87.15.1718216731517;
        Wed, 12 Jun 2024 11:25:31 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52c8980bb7fsm1575034e87.42.2024.06.12.11.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 11:25:31 -0700 (PDT)
Date: Wed, 12 Jun 2024 21:25:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Komal Bajaj <quic_kbajaj@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, inux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: qdu1000: Add secure qfprom node
Message-ID: <jlmunx3cimwnaaxc2glhzoidarpr4rdj2dokrlepenk4zzkhae@iqiktjxwpnrl>
References: <20240612063424.2494-1-quic_kbajaj@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240612063424.2494-1-quic_kbajaj@quicinc.com>

On Wed, Jun 12, 2024 at 12:04:24PM +0530, Komal Bajaj wrote:
> Add secure qfprom node and also add properties for multi channel
> DDR. This is required for LLCC driver to pick the correct LLCC
> configuration.
> 
> Signed-off-by: Komal Bajaj <quic_kbajaj@quicinc.com>
> ---
> Changes in v2:
> * Minor correction in commit message
> * Link to v1: https://lore.kernel.org/linux-arm-msm/20240607113445.2909-1-quic_kbajaj@quicinc.com/
> ---
> 
>  arch/arm64/boot/dts/qcom/qdu1000.dtsi | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)

Fixes: 6209038f131f ("arm64: dts: qcom: qdu1000: Add LLCC/system-cache-controller")

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> 
> diff --git a/arch/arm64/boot/dts/qcom/qdu1000.dtsi b/arch/arm64/boot/dts/qcom/qdu1000.dtsi
> index 7a77f7a55498..d8df1bab63d5 100644
> --- a/arch/arm64/boot/dts/qcom/qdu1000.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qdu1000.dtsi
> @@ -1584,6 +1584,21 @@ system-cache-controller@19200000 {
>  			reg-names = "llcc0_base",
>  				    "llcc_broadcast_base";
>  			interrupts = <GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			nvmem-cell-names = "multi-chan-ddr";
> +			nvmem-cells = <&multi_chan_ddr>;
> +		};
> +
> +		sec_qfprom: efuse@221c8000 {
> +			compatible = "qcom,qdu1000-sec-qfprom", "qcom,sec-qfprom";
> +			reg = <0 0x221c8000 0 0x1000>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +
> +			multi_chan_ddr: multi-chan-ddr@12b {
> +				reg = <0x12b 0x1>;
> +				bits = <0 2>;
> +			};
>  		};
>  	};
> 
> --
> 2.42.0
> 

-- 
With best wishes
Dmitry

