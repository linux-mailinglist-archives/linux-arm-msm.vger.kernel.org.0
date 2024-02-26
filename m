Return-Path: <linux-arm-msm+bounces-12569-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF4B867A7E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Feb 2024 16:41:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6099B1F243AF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Feb 2024 15:41:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41AAD12AAD8;
	Mon, 26 Feb 2024 15:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HdzRKzUT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1BE6249F9
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Feb 2024 15:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708962103; cv=none; b=J6duJ+yyCbiU/AD7z7Huu6/vjZwxt2nEQ4Z4hcI5BM8FWsO3LgSYAS68E+WmVEjcbHBkReUgiB424hZSVFdI3gPY922LnDDTI3iutVWTc/5Jbn6H9uk/CBQIUARCIGw9u8MuimFkmSrEy2LfFBAYRbiBLJGo0unv0FQVi5aj1Ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708962103; c=relaxed/simple;
	bh=ROfZL+8h3faUigYCfFD1t/VZMW/wKSl1v3AwMMgB+iY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dHOucQ8B2f94nKFzd1qidkAcKaDa2CZbvZw/9UE9Wl0KiX86DcqfKZgg7fqN9RVKc/cc2ZyzC0bUbkzuFHiDx4o/RSmYK6cu0Ng63S0Hu7Ci3Oe32vO7IXLAdZ5S78/w52I8iuxkPhl2W/TH4gJ28ZyNgH88RioM26unDUNUEDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HdzRKzUT; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6e4f5e84abeso706221b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Feb 2024 07:41:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708962101; x=1709566901; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zqorEYJP95Qb8X25T5MHrt2/iyFyV6PT4PckHw2t2nA=;
        b=HdzRKzUTRsyKnH+I97qyXKvLRBzIkq5BpbpQNM57PmgMk3/LeJU+SWCvvgcG93YsSn
         KI8JVnlSfCTbwjCln2cG5mc3SvT9SlNvOPB7lZLxbegf2eU69C4YIncSQxa9Go0HjW3z
         AbwYbTpDTyPxEZueZ8hCG1L1arL/yEBSLuS9gPRISpjD5yFd0mJFYRbKPAl12KoLr0S8
         M8mR76/J1W5/h3ypHspLD2FY/V2GtlyYZKjN/Y3ByC2lk5mHZhN7TrK/SUazS58FJEEB
         qy+yqwcNdTCNQwUMYECM4EFxjIM2BFM7GI898qlHyXFbQ3o6P4xNg0e6318HHWpX/ZsS
         NHqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708962101; x=1709566901;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zqorEYJP95Qb8X25T5MHrt2/iyFyV6PT4PckHw2t2nA=;
        b=UhcReCLza2xm+T5Osf4+F+yBQwy2deN0BGgMinZ1Q90Vv9N4obKlANWKI3ei8+BIMR
         SjKLhGFopsJUT6oJbGOTfuTXYZMU6H4D5SwIuvOyuJu+zT1o1p2L/zflbxnt1/y6caLb
         yBpkOKDVYtyHUmMLkL9lPWJa+9g0rYzmgriXv3652M+c9uo48FIeUZbFIEPEd0a0QkVS
         A6mHeploBiUzLwkWt1gM66Kp2mGW3XVw7BbEliB9WVXUMjf5ylPWmTycrdOZEb7dWTke
         sZGXikXVYiOnpyUxLCMLfyye/INAV2wzdUibppZhoUWG3h+aM6LKF3EQ6aeohyeGCBOs
         YY1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWxiz9kb5UyOU+x0eyhz1tvBgi/PgDqOmxz+QuAizOLAQvKntN8zTmyeElfhEDj42Nf1eqdi6GMdcA7yLp9dqUX/wM7g56sr3dYumVnwA==
X-Gm-Message-State: AOJu0Yx23DSfcLJ75T5AHqse5LiKbY1NdwViwwDoUltqzv/+RApTw4+F
	ytnR1QXT904D62k6iuneBQZt49bU+B0Y9YBcJCwgckhGNajT3OAADGpRxmLn9A==
X-Google-Smtp-Source: AGHT+IEz5RGOjmGJm6K+8JAvLy1n3CFVFLZcKYWZ/CM3mfcFa3J1NmyxKtra4CQAUyHjYaen+sgS8A==
X-Received: by 2002:a05:6a21:3988:b0:1a0:e9ad:7f29 with SMTP id ad8-20020a056a21398800b001a0e9ad7f29mr6816478pzc.6.1708962101003;
        Mon, 26 Feb 2024 07:41:41 -0800 (PST)
Received: from thinkpad ([117.202.184.81])
        by smtp.gmail.com with ESMTPSA id v13-20020a17090a520d00b0029ab17eaa40sm3252777pjh.3.2024.02.26.07.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 07:41:40 -0800 (PST)
Date: Mon, 26 Feb 2024 21:11:36 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Viken Dadhaniya <quic_vdadhani@quicinc.com>
Cc: andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, quic_msavaliy@quicinc.com,
	quic_vtanuku@quicinc.com, quic_cchiluve@quicinc.com
Subject: Re: [PATCH v4] arm64: dts: qcom: sc7280: add slimbus DT node
Message-ID: <20240226154136.GH8422@thinkpad>
References: <20240219051455.25927-1-quic_vdadhani@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240219051455.25927-1-quic_vdadhani@quicinc.com>

On Mon, Feb 19, 2024 at 10:44:55AM +0530, Viken Dadhaniya wrote:
> Populate the DTSI node for slimbus instance to be
> used by bluetooth FM audio case.
> 

Just curious, where is the patch to enable bluetooth FM?

> Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
> ---
> v3 -> v4:
> - Correct email address for linux-arm-msm.
> 
> v2 -> v3:
> - Fix patch title by adding "PATCH" string.
> - Update commit log.
> 
> v1 -> v2:
> - change 0x0 -> 0 to reg property.
> - reorder the DT property.
> - change node tag slim_msm to slim.
> ---
> ---
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index 581818676a4c..1d6afde915aa 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -2672,6 +2672,31 @@
>  			status = "disabled";
>  		};
>  
> +		slimbam: dma-controller@3a84000 {
> +			compatible = "qcom,bam-v1.7.0";
> +			reg = <0 0x03a84000 0 0x20000>;
> +			interrupts = <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>;
> +			#dma-cells = <1>;
> +			qcom,controlled-remotely;
> +			num-channels  = <31>;
> +			qcom,ee = <1>;
> +			qcom,num-ees = <2>;
> +			iommus = <&apps_smmu 0x1826 0x0>;
> +			status = "disabled";
> +		};
> +
> +		slim: slim-ngd@3ac0000 {
> +			compatible = "qcom,slim-ngd-v1.5.0";
> +			reg = <0 0x03ac0000 0 0x2c000>;
> +			interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>;
> +			dmas = <&slimbam 3>, <&slimbam 4>;
> +			dma-names = "rx", "tx";
> +			iommus = <&apps_smmu 0x1826 0x0>;

Does both nodes need IOMMU translation with same SID? This hints that only one
needed.

- Mani

> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
>  		lpass_hm: clock-controller@3c00000 {
>  			compatible = "qcom,sc7280-lpasshm";
>  			reg = <0 0x03c00000 0 0x28>;
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
> of Code Aurora Forum, hosted by The Linux Foundation
> 

-- 
மணிவண்ணன் சதாசிவம்

