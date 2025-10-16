Return-Path: <linux-arm-msm+bounces-77594-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3243ABE3CC3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Oct 2025 15:49:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9652C1885D09
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Oct 2025 13:48:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5570733A03E;
	Thu, 16 Oct 2025 13:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wf0mGeeX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A1611C3BE0
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 13:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760622488; cv=none; b=FN2duQhjJWKu5eUErqI9esMb/LaA8XfZUeii6pWRpkREMwU7vo29Z1deHCxErd6tk/I7/GSWJFEEoub6RX+bub/jvBRDXsCGRJ3VEfa3yRHfOHkqka75goXULpA/rLatvIFm+AKgThTk+crAIxUD5GYMwM1lw5J+B696a2VyQ/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760622488; c=relaxed/simple;
	bh=sSDe1mGlkEL2RtCUFKIHhbHVM3TXv73UeokYbvF2fOY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nR45w+pvro/klpQtIBdTcCtaAJlhglSeb43VTWMtdEYVT5dUMUiWPW6WMBQ0Ci4IBVhpDSiLdPAICsumqihiwWrXeEMXq+9IxglIjWTFZVFTrm+xPpCj2DSW622QTQY1o5Ic3cz2c1gpxWiSrFTpd0FBztqsRwCxwnaLF8vwokY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wf0mGeeX; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-57b35d221e2so159110e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 06:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760622484; x=1761227284; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gcAg85FBlDnXHKhY+clR6LHNWXAePe89oWLFHhsgwvw=;
        b=wf0mGeeXXJaeC+ph0tGH1pvKZc02ZCHXYW6ydDgGVrmiB03NAe5eLQ98FshU2Cu6Em
         /UmyNTG6MuiwZjgoa0KX7oIgMs1QL26i2GEBEKh+l8F4jFgB/e3DNNMvhKvC9HnMtMmp
         4utiEufqWdXjm/mejyYDaGc6Vc1xRAhCa+hirOBmJHZ2+AeC1qHm07yh/z3bYhXTtnT7
         peJJUNuCrOSy7bf2b/nsBNHPJi8upVnQKKXvPkfEFYN5/o7LO01NKVM+J0/LAewRqIyK
         tGWaT71xNnuez7SsU0wkvgfcv4Rnbrlheow0yVjS1qOXi0UDfWU9pHdLtWUOfsxJ/1K+
         O3qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760622484; x=1761227284;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gcAg85FBlDnXHKhY+clR6LHNWXAePe89oWLFHhsgwvw=;
        b=SrrzGUT269DeN2VLiTImR5m/FN4jTEK8OlMLIRbOiK9xppNE6JK5sLN6Unlhu81ZNK
         pp1tzGHF5HAKlk3AaLkGw+aLToLsOG9r2vh893gCepyvx6ye5QbNZR/bXWduj+PjCRcH
         nHZKrI13EbY/gKSABkMn6WcdwBII5czqowN2xTy9sd6wBon74GeH/Ceqic0faCik4co4
         xbjREUJEEp7iDmuLA2XFm3TdcuV+1XvR6PAOLCysBNXhE74ozCIsfeJ78c5qKkrkxbso
         xyQgx4X/7ymy1elVky6v7OTvSdhqMMlq76+MphwdpdwuP9qrTczdi6ivWaZ7KMzhTLw0
         QcNA==
X-Forwarded-Encrypted: i=1; AJvYcCUjNwglX9DyibYfdVmIMT4NQffz74MJZ//+UrTPiHegn+LSqZt+bP5vshFq387D9rn8imSJRFCXUaaVPe8f@vger.kernel.org
X-Gm-Message-State: AOJu0YyztvpZpZxFRw2w6ccrf9oBx7BRzyQZtSVF8Dxf08vi/8EMVhN5
	RjUalI2nKPrK4YCLxED98dUWjDXvzWHiZKSfBHq6iaNmeDafE+tQTEnOyeA4rnVJCGA=
X-Gm-Gg: ASbGnctguEc4vO0XTu0Ef9XGRWA1A7t5Ct3u6J2sei+EsbomdEXi5F2uDWf26B+OC5N
	u3Ol1i/GFKWo4g5E78ieR1RVFJea/zsB/V0FMxYrFRgoIwKxMFVT1yY38dSGsbMibMYTZ6tsRVW
	xAhjfT2PN7nXPd4oTGBxaoV+sTBwFtdiOtE2WK4g/USrVPu7PUbduPsIcxbR215R+X4HIs/z0q3
	Se+yNK+q3Ollet4LJxnJjkk7gC/Kmm+1b1/KI1elHyxdwg91FQjUOEq+oUL/zwP/74xVweGtKHi
	wICHttAqc7+ZsNm5gDZmpMxzvSLvmcmVrHLi9v3danNl4A0a/T6bk8CM4FBRibbgCtnoSXRE3BG
	nRILBORtRLhyQvhb92r65LqO7p88FxSDaUbU0mNwVNe3ou5vnAGzlx694qq9ClV0qliFazOLkaJ
	EqQez03tkqUxUZOdUlB+1BpDmShTa07t7h9etF0recEMSTTxdlvttmea1YbFhXdzmrXAMK+PgcM
	I6jUdkX
X-Google-Smtp-Source: AGHT+IFJNT+AAD99Hz3zpEUaGMgFi/cx8sgcMYMp0PdSXJ1mbaKwn/y+9OKRg8oSB9qI/6dBNhERfA==
X-Received: by 2002:a05:6512:3ca5:b0:55f:461e:b458 with SMTP id 2adb3069b0e04-591d8550df2mr36408e87.4.1760622484271;
        Thu, 16 Oct 2025 06:48:04 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590885768desm7109937e87.98.2025.10.16.06.48.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Oct 2025 06:48:03 -0700 (PDT)
Message-ID: <b0224cd8-fe81-4229-94a4-c314c7b19811@linaro.org>
Date: Thu, 16 Oct 2025 16:48:02 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm6150: Add camss node
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251016-sm6150-camss-v1-0-e7f64ac32370@oss.qualcomm.com>
 <20251016-sm6150-camss-v1-3-e7f64ac32370@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20251016-sm6150-camss-v1-3-e7f64ac32370@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/16/25 13:22, Wenmeng Liu wrote:
> Add node for the SM6150 camera subsystem.
> 
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/sm6150.dtsi | 121 +++++++++++++++++++++++++++++++++++
>   1 file changed, 121 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm6150.dtsi b/arch/arm64/boot/dts/qcom/sm6150.dtsi
> index 3d2a1cb02b628a5db7ca14bea784429be5a020f9..ebfb336439b4fdfa567c0e011cd4da88a6290dfd 100644
> --- a/arch/arm64/boot/dts/qcom/sm6150.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm6150.dtsi
> @@ -3646,6 +3646,127 @@ videocc: clock-controller@ab00000 {
>   			#power-domain-cells = <1>;
>   		};
>   
> +		camss: isp@acb3000 {
> +			compatible = "qcom,sm6150-camss";
> +
> +			reg = <0x0 0x0acb3000 0x0 0x1000>,
> +			      <0x0 0x0acba000 0x0 0x1000>,
> +			      <0x0 0x0acc8000 0x0 0x1000>,
> +			      <0x0 0x0ac65000 0x0 0x1000>,
> +			      <0x0 0x0ac66000 0x0 0x1000>,
> +			      <0x0 0x0ac67000 0x0 0x1000>,
> +			      <0x0 0x0acaf000 0x0 0x4000>,
> +			      <0x0 0x0acb6000 0x0 0x4000>,
> +			      <0x0 0x0acc4000 0x0 0x4000>;
> +			reg-names = "csid0",
> +				    "csid1",
> +				    "csid_lite",
> +				    "csiphy0",
> +				    "csiphy1",
> +				    "csiphy2",
> +				    "vfe0",
> +				    "vfe1",
> +				    "vfe_lite";
> +
> +			clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
> +				 <&camcc CAM_CC_CPAS_AHB_CLK>,
> +				 <&camcc CAM_CC_CSIPHY0_CLK>,
> +				 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
> +				 <&camcc CAM_CC_CSIPHY1_CLK>,
> +				 <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
> +				 <&camcc CAM_CC_CSIPHY2_CLK>,
> +				 <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
> +				 <&gcc GCC_CAMERA_HF_AXI_CLK>,
> +				 <&camcc CAM_CC_SOC_AHB_CLK>,
> +				 <&camcc CAM_CC_IFE_0_CLK>,
> +				 <&camcc CAM_CC_IFE_0_AXI_CLK>,
> +				 <&camcc CAM_CC_IFE_0_CPHY_RX_CLK>,
> +				 <&camcc CAM_CC_IFE_0_CSID_CLK>,
> +				 <&camcc CAM_CC_IFE_1_CLK>,
> +				 <&camcc CAM_CC_IFE_1_AXI_CLK>,
> +				 <&camcc CAM_CC_IFE_1_CPHY_RX_CLK>,
> +				 <&camcc CAM_CC_IFE_1_CSID_CLK>,
> +				 <&camcc CAM_CC_IFE_LITE_CLK>,
> +				 <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
> +				 <&camcc CAM_CC_IFE_LITE_CSID_CLK>;
> +
> +			clock-names = "camnoc_axi",
> +				      "cpas_ahb",
> +				      "csiphy0",
> +				      "csiphy0_timer",
> +				      "csiphy1",
> +				      "csiphy1_timer",
> +				      "csiphy2",
> +				      "csiphy2_timer",
> +				      "gcc_axi_hf",
> +				      "soc_ahb",
> +				      "vfe0",
> +				      "vfe0_axi",
> +				      "vfe0_cphy_rx",
> +				      "vfe0_csid",
> +				      "vfe1",
> +				      "vfe1_axi",
> +				      "vfe1_cphy_rx",
> +				      "vfe1_csid",
> +				      "vfe_lite",
> +				      "vfe_lite_cphy_rx",
> +				      "vfe_lite_csid";
> +
> +			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> +					 &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
> +					<&mmss_noc MASTER_CAMNOC_HF0 QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +			interconnect-names = "ahb",
> +					     "hf_mnoc";
> +
> +			interrupts = <GIC_SPI 464 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 466 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names = "csid0",
> +					  "csid1",
> +					  "csid_lite",
> +					  "csiphy0",
> +					  "csiphy1",
> +					  "csiphy2",
> +					  "vfe0",
> +					  "vfe1",
> +					  "vfe_lite";
> +
> +			iommus = <&apps_smmu 0x820 0x40>;
> +
> +			power-domains = <&camcc IFE_0_GDSC>,
> +					<&camcc IFE_1_GDSC>,
> +					<&camcc TITAN_TOP_GDSC>;
> +			power-domain-names = "ife0",
> +					     "ife1",
> +					     "top";
> +
> +			status = "disabled";

Please remove empty lines between properties all above.

> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +				};
> +
> +				port@2 {
> +					reg = <2>;
> +				};
> +			};
> +		};
> +
>   		camcc: clock-controller@ad00000 {
>   			compatible = "qcom,qcs615-camcc";
>   			reg = <0 0x0ad00000 0 0x10000>;
> 

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir

