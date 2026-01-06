Return-Path: <linux-arm-msm+bounces-87722-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BFB1CF9412
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 17:06:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3CBEE308FED4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jan 2026 16:00:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B14F433D50F;
	Tue,  6 Jan 2026 15:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ViORQnc5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE342338586
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jan 2026 15:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767715187; cv=none; b=RtAwOtPq5aOLhkBoUxZ2UShdSkyVI9ShzjpudMEU1gj9wXFL9Tsx+Enj8BCz9NaVT1zIPT01Ro03k6vCitGVqL71od1grTsf8+bsAtRVfANed35tyU6iUqAJwzy/zGOc7mJxo+eFAYutMeUzH9F/HE/V3r2p5hNQHYYYm8IIbao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767715187; c=relaxed/simple;
	bh=kaP5otL1mzgsOgdU4Az/gGANwwqslx0lpSlpDY5vJOU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SSZJrFLV8VchdUc11bVXFFf6GmVqaSn6rpU8DNjATDsdhy+FUOU88Mnz2FK//gRuoeETwe0hS4ZLhYhJAKKANeCTSO4vR30DOgCNeLA3HPfgsZytbb98FFGrmk43gTUk5JU5kbjvqTwxFdIHwRJ6/fkFRF2YPV76HXUyCzM7/K8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ViORQnc5; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4775ae77516so12336905e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 07:59:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767715184; x=1768319984; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y3iasiVbIfTUBqUGsPzIES4MtJT+8WmKx7DGtl0TfGI=;
        b=ViORQnc551lfinHGwRmAAwYqoJGR4TQ0a+cWgPyTI61097U+TYe20bJ6X69wn7helF
         hsyU7xEG6bj8WVkos84FcOa+B/8rMO1xkgiiGWLpIdKPZ5TQ8ob7TWiGLlnxIT8s5WPE
         62fUvp5+1+tAwDV3OqwnPpaD3sTmrOR0wQ+x/2KrpV8gppybUhoQ7YKyN33ESLq7uNwN
         2ErHQxw6jIlKYhvHgOSndJLlsaLv4hvttafAD/X5Rr0xLK3gYPDNjg2zWV1Zixtv3nJQ
         XzJvmphPew8yYaW1BLXtx2ig2jKAL/FFAemZ2S41O1qnvWR+8fz1WiiRuyPPJ995rCZx
         t1Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767715184; x=1768319984;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y3iasiVbIfTUBqUGsPzIES4MtJT+8WmKx7DGtl0TfGI=;
        b=uWkXuyfs2vd9PRL3RYuRa7CQU9bBOyNF+JcsGO8R4e6uPonJ1qUJQaW/FiDhdW0gk+
         jqzJYOHkszpcU0Y5PiXy+6niMGK4x20SnaaC56nVUm6cg3YpQpqNp7eHk3jrHNubK3mg
         G9rLIz1QKpuV3az+9nVlk+ztxOyZaFjxTbjp/JplJQYQQz/iNEm43xU+WJxn+DBXHnmJ
         HfCeGazA4mShUdRadjjZa3ghx3S4x2LXzVsDi10Kmwxc/2fE6vXmot+avURgF24sUSKq
         5HLG/Ud5N6pk9r1oKWUf0h02tqMGLQjjsAIZ/Ff6GiJFcKAg0ssSuUDxiN2frIPFgCwr
         Xkqg==
X-Forwarded-Encrypted: i=1; AJvYcCUjvV6OHQ1pSkAESCIFwIf/euWgGKJtpAztbvyZvB4Q1veqORWD000qqaO8FsnKG5pF282I0NDBohOSdqRM@vger.kernel.org
X-Gm-Message-State: AOJu0Yyv4XHzPKDe3jOpKDqImRCfR+4K1Uj1uUKvfmatOWU/QxbRvKxr
	nsXYBs8wP1XuDDr1lcOE+1g/woXnkKz6/oiFqHOKuo0vuWwZWVhFkEV5U6/NZ1mogqI=
X-Gm-Gg: AY/fxX68GOOP814gSAiUq9pUxor+GMdV0wEzftBaVEz9CyTX6rI76ERK5J0Vev+0Qf/
	QgAI42NduuiIKAfdeT+nw86Zx6xlCQ5NuoZ7zpVrcoJ4OgGTw6s6HHyPRm1jfpcrihQLXB/3vs7
	UWZ4kzwWfB/b/TvbQxQgU9I7izntb3aaR7KOFknYwxke7PkBZsi+/9sFx73LI8jTKgUo8un6mIz
	6rueeTK2R47XCYoO3V7wacVWRwTNJibZjddrHQRT1ox2csHEFQTRyOiwQDyNVIfRBpQUQp+kMvW
	yJ9O8O12+kXwGQYOG3QHHvOUWfkmZxbsCEEsFphuGm5GyDhNX6Ht1e5jky8B3wtNNK5BvWxm+IW
	0RJYFZT5zf5sSobBPn9kK1EWsN/YuJ9+UPW6FGhojPf7QrDF66qmO1lEt0R36YwOlDmRjtUnQ4C
	Kof6Rl7cK0jYekBuvo/in3D2zddee898xxOR3y/95M1KHcDma+UI7z5MRNHdUpGE0=
X-Google-Smtp-Source: AGHT+IFCEs7tJ2cq92dDqDDafjwnY0veB3PRSrw4h3ai1KnvueJZ50OixuVRoK+Vuq8gcPpj9E7OGw==
X-Received: by 2002:a05:600c:8210:b0:477:abea:9023 with SMTP id 5b1f17b1804b1-47d7f076291mr33785385e9.9.1767715183916;
        Tue, 06 Jan 2026 07:59:43 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f69e802sm49960335e9.8.2026.01.06.07.59.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jan 2026 07:59:43 -0800 (PST)
Message-ID: <816f9777-5e40-469a-bccb-68e96a7eeecb@linaro.org>
Date: Tue, 6 Jan 2026 15:59:42 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: talos: Add camss node
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260106-sm6150-camss-v3-0-d1d5c4d02b0b@oss.qualcomm.com>
 <20260106-sm6150-camss-v3-3-d1d5c4d02b0b@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260106-sm6150-camss-v3-3-d1d5c4d02b0b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/01/2026 09:04, Wenmeng Liu wrote:
> Add node for the SM6150 camera subsystem.
> 
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/talos.dtsi | 200 ++++++++++++++++++++++++++++++++++++
>   1 file changed, 200 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
> index 95d26e3136229f9015d49e2be22f6b28f1e842f4..6368e0a2502cf41acee0783dcd2950099a29f40b 100644
> --- a/arch/arm64/boot/dts/qcom/talos.dtsi
> +++ b/arch/arm64/boot/dts/qcom/talos.dtsi
> @@ -3785,6 +3785,206 @@ videocc: clock-controller@ab00000 {
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
> +			      <0x0 0x0acc4000 0x0 0x4000>,
> +			      <0x0 0x0ac6f000 0x0 0x3000>,
> +			      <0x0 0x0ac42000 0x0 0x5000>,
> +			      <0x0 0x0ac48000 0x0 0x1000>,
> +			      <0x0 0x0ac40000 0x0 0x1000>,
> +			      <0x0 0x0ac18000 0x0 0x3000>,
> +			      <0x0 0x0ac00000 0x0 0x6000>,
> +			      <0x0 0x0ac10000 0x0 0x8000>,
> +			      <0x0 0x0ac87000 0x0 0x3000>,
> +			      <0x0 0x0ac52000 0x0 0x4000>,
> +			      <0x0 0x0ac4e000 0x0 0x4000>,
> +			      <0x0 0x0ac6b000 0x0 0x0a00>;
> +			reg-names = "csid0",
> +				    "csid1",
> +				    "csid_lite",
> +				    "csiphy0",
> +				    "csiphy1",
> +				    "csiphy2",
> +				    "vfe0",
> +				    "vfe1",
> +				    "vfe_lite",
> +				    "bps",
> +				    "camnoc",
> +				    "cpas_cdm",
> +				    "cpas_top",
> +				    "icp_csr",
> +				    "icp_qgic",
> +				    "icp_sierra",
> +				    "ipe0",
> +				    "jpeg_dma",
> +				    "jpeg_enc",
> +				    "lrme";
> +
> +			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
> +				 <&gcc GCC_CAMERA_HF_AXI_CLK>,
> +				 <&camcc CAM_CC_CAMNOC_AXI_CLK>,
> +				 <&camcc CAM_CC_CPAS_AHB_CLK>,
> +				 <&camcc CAM_CC_CSIPHY0_CLK>,
> +				 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
> +				 <&camcc CAM_CC_CSIPHY1_CLK>,
> +				 <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
> +				 <&camcc CAM_CC_CSIPHY2_CLK>,
> +				 <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
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
> +				 <&camcc CAM_CC_IFE_LITE_CSID_CLK>,
> +				 <&camcc CAM_CC_BPS_CLK>,
> +				 <&camcc CAM_CC_BPS_AHB_CLK>,
> +				 <&camcc CAM_CC_BPS_AXI_CLK>,
> +				 <&camcc CAM_CC_BPS_AREG_CLK>,
> +				 <&camcc CAM_CC_ICP_CLK>,
> +				 <&camcc CAM_CC_IPE_0_CLK>,
> +				 <&camcc CAM_CC_IPE_0_AHB_CLK>,
> +				 <&camcc CAM_CC_IPE_0_AREG_CLK>,
> +				 <&camcc CAM_CC_IPE_0_AXI_CLK>,
> +				 <&camcc CAM_CC_JPEG_CLK>,
> +				 <&camcc CAM_CC_LRME_CLK>;
> +			clock-names = "gcc_ahb",
> +				      "gcc_axi_hf",
> +				      "camnoc_axi",
> +				      "cpas_ahb",
> +				      "csiphy0",
> +				      "csiphy0_timer",
> +				      "csiphy1",
> +				      "csiphy1_timer",
> +				      "csiphy2",
> +				      "csiphy2_timer",
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
> +				      "vfe_lite_csid",
> +				      "bps",
> +				      "bps_ahb",
> +				      "bps_axi",
> +				      "bps_areg",
> +				      "icp",
> +				      "ipe0",
> +				      "ipe0_ahb",
> +				      "ipe0_areg",
> +				      "ipe0_axi",
> +				      "jpeg",
> +				      "lrme";
> +
> +			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> +					 &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
> +					<&mmss_noc MASTER_CAMNOC_HF0 QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> +					<&mmss_noc MASTER_CAMNOC_HF1 QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> +					<&mmss_noc MASTER_CAMNOC_SF QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +			interconnect-names = "ahb",
> +					     "hf_0",
> +					     "hf_1",
> +					     "sf_mnoc";
> +
> +			interrupts = <GIC_SPI 464 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 466 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 459 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 461 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 463 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 475 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 474 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 476 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names = "csid0",
> +					  "csid1",
> +					  "csid_lite",
> +					  "csiphy0",
> +					  "csiphy1",
> +					  "csiphy2",
> +					  "vfe0",
> +					  "vfe1",
> +					  "vfe_lite",
> +					  "camnoc",
> +					  "cdm",
> +					  "icp",
> +					  "jpeg_dma",
> +					  "jpeg_enc",
> +					  "lrme";
> +
> +			iommus = <&apps_smmu 0x0820 0x40>,
> +				 <&apps_smmu 0x0840 0x00>,
> +				 <&apps_smmu 0x0860 0x40>,
> +				 <&apps_smmu 0x0c00 0x00>,
> +				 <&apps_smmu 0x0cc0 0x00>,
> +				 <&apps_smmu 0x0c80 0x00>,
> +				 <&apps_smmu 0x0ca0 0x00>,
> +				 <&apps_smmu 0x0d00 0x00>,
> +				 <&apps_smmu 0x0d20 0x00>,
> +				 <&apps_smmu 0x0d40 0x00>,
> +				 <&apps_smmu 0x0d80 0x20>,
> +				 <&apps_smmu 0x0da0 0x20>,
> +				 <&apps_smmu 0x0de2 0x00>;
> +
> +			power-domains = <&camcc IFE_0_GDSC>,
> +					<&camcc IFE_1_GDSC>,
> +					<&camcc TITAN_TOP_GDSC>,
> +					<&camcc BPS_GDSC>,
> +					<&camcc IPE_0_GDSC>;
> +			power-domain-names = "ife0",
> +					     "ife1",
> +					     "top",
> +					     "bps",
> +					     "ipe";
> +
> +			status = "disabled";
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
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

