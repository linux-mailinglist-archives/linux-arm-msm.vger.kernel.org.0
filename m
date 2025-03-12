Return-Path: <linux-arm-msm+bounces-51201-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D3601A5E641
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 22:09:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3F25618913F5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 21:09:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A96FD159596;
	Wed, 12 Mar 2025 21:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fOh+ayNS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C606915CD74
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Mar 2025 21:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741813736; cv=none; b=FTtjDExM+H0PxZl10yyJAAS0J+/9mBLlIWdurBF6sRyEHnF/ABXEmFKf9/FDPvNhMI0w/PY5z2WHEHB9yBjmY1LKGiTvnudagK5eCU7LzKR64aZcdaPocjL9pRD3swLq2Jn/3YuSY5MEgCVzFAH8RaWJBojY0zlAd4EWE0AJeDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741813736; c=relaxed/simple;
	bh=2SADhtRscCayEWIilVsOvVg+MYIKsQ1fFuXlAmHgLmo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L7Vu5btyhuetcP3HXe8gmBI7JcF1WjKuv1vfIytx248MiHGryQSSOObxZ+lhG92MMJjMIKIlcWty2+9J+sVFX/Tu4XVzbSmdQIB4dfEwVuTOiq+YVgCKxvXFmSqDrPJ/Fr5M7gm2qoT8/Hz02kipUtOlx8O++JqHuMUJIIRxNRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fOh+ayNS; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5e614da8615so598109a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Mar 2025 14:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741813732; x=1742418532; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IsN0yxxswAlGhNym0IDJR3BHiKwcdQHi9QIjjoxz35M=;
        b=fOh+ayNS2cpEo069ObI+/hJLmsJBvzIAhU6ObbZbqvB6dNcunNkKoSkhqEPfkDi1Lg
         8iGczDQIUx91PZb6zbTypn95XEeWdAJR0KrTYEY2uquxI5vJmAUKj1e10UvkPJPoM4Xy
         Azfl/JPju/u5lVADhcdV+nQhBstu0xNQ7uKCQMvDSGkSGhFrJciH0bIucPW/rdOmVDxc
         qWqth3F5fukMfAaenZLbIi7zCBKImvmyuhmUwnVKNUkKwfUQzYdvwpg72h58RVxayib3
         Yt80g0P963VUEabCQqDkqgiHsRYwiA+F+ltyc3l9vyUo9gRSVYKIfiIBtGc3AzoYt8iJ
         Et0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741813732; x=1742418532;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IsN0yxxswAlGhNym0IDJR3BHiKwcdQHi9QIjjoxz35M=;
        b=PAumghai5hW9A+/nyedd1lpa4knT5+4cyPZmevTvrvQ0RK1eBDsN8GcMRt8jkEudBC
         mVuJJu/NwE9hBo8Su4PuW76fnjEcrNzvWp6+NGVKzuBmqJOPVkcHFUxfBc/nV5JTM7Ab
         ahiB7aU5InGhv6dN3sQlRP+/WPHsWZGBU/wERTekld/UBl0GCJ/YJRfswXT2xv0oQQE7
         Oc672dXRZDWovFM8jhsoQ2wItlhS6lfGOh3mdKpXe3INpBh4LoB4qYpjb6sMfh990xvA
         i+sxaNzABxOjKDQUyfaXEeLp2smRN+0+C5BNtqVdBOk/bNZgH2RFMPliGk0Oq8xz10yg
         NbDw==
X-Forwarded-Encrypted: i=1; AJvYcCW2WsrEUYST7i9qYArPsqfkGYL5AtcATepJyp1SoHpXcl1PJa9r4wXb8tEGpKFMsYpaju6b1yo+WKrEk8yC@vger.kernel.org
X-Gm-Message-State: AOJu0YyJy8wxOgbsflRPP46Wm7VTt8ruYtpvZ4zWSaEFYTmniUWhaTAF
	sqHMohkzH4rDu5lqFu/jjoKJ5N7icqaQ+H5QHm90cBTSlWEJYX8yaqePGAZY+ss=
X-Gm-Gg: ASbGnctaTRYP3ulsbt6CYalqetou/Ah3aifljEhmvWWU5HGEWS/YoYWEZ013HF6vgN1
	82IvRnOxXiVKCc1EMEQqutddAkSFVrE0FojxUSZQwr3niWb6krXEvEqj1T6MO9pS0RBGDeekScL
	GyGNFJuu2zSXfoXq0bEs5zTLKN+NddEb8wrX6VXvE9H8wIYBn4SsRqIouVgM3VLhE6kCjFSOeKr
	N9TmBRYbg3ic/vJX5A0aGznuMeAi3839WGL12ge00nRH0tCO4b/hE3M6iG6AVXvlK2BQn8Ror8N
	88vcA1oxFt9REheLrhJo6rCQFbFr/ogIk/s4kaXOUBlCmTLvWdPY4vIlWY0BaZgGAsT98z4CbBv
	kmxeVbbWC4EeaLe6vI1wkGSI044EsbPlqbqBNxfOvfmH8aZtTsOQWo4cFbvGDc9NaLvnUw9nwXt
	pooSqMKqHm4DcumLHZ7pjx7rh0zmYiE3Y=
X-Google-Smtp-Source: AGHT+IGu9QSi3oHsmEZcocabYYmsMoC3bELw0Bk9y7r00YGcGUiF1uhL8B16Ug87tfivCjf/Yx1FNQ==
X-Received: by 2002:a05:6402:278f:b0:5e7:87cd:2479 with SMTP id 4fb4d7f45d1cf-5e814e26e0bmr40071a12.8.1741813732063;
        Wed, 12 Mar 2025 14:08:52 -0700 (PDT)
Received: from ?IPV6:2001:1c06:2302:5600:7555:cca3:bbc4:648b? (2001-1c06-2302-5600-7555-cca3-bbc4-648b.cable.dynamic.v6.ziggo.nl. [2001:1c06:2302:5600:7555:cca3:bbc4:648b])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e5c74a8f3bsm10361448a12.44.2025.03.12.14.08.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Mar 2025 14:08:51 -0700 (PDT)
Message-ID: <2ac587e5-374b-4486-b6f5-6b23f37da973@linaro.org>
Date: Wed, 12 Mar 2025 21:08:50 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sm8650: Add CAMSS block definition
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20250312001132.1832655-1-vladimir.zapolskiy@linaro.org>
 <20250312001132.1832655-3-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250312001132.1832655-3-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/03/2025 00:11, Vladimir Zapolskiy wrote:
> Add SM8650 CAMSS device tree node to the platform dtsi file,
> it contains of
> * 6 x CSIPHY
> * 3 x CSID
> * 2 x CSID Lite
> * 3 x IFE
> * 2 x IFE Lite
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sm8650.dtsi | 184 +++++++++++++++++++++++++++
>   1 file changed, 184 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> index 719ad437756a..bf5e238a93c3 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> @@ -4903,6 +4903,190 @@ cci2_i2c1: i2c-bus@1 {
>   			};
>   		};
>   
> +		camss: isp@acb8000 {
> +			compatible = "qcom,sm8650-camss";
> +			reg = <0 0x0acb8000 0 0x1000>,
> +			      <0 0x0acba000 0 0x1000>,
> +			      <0 0x0acbc000 0 0x1000>,
> +			      <0 0x0accb000 0 0x1000>,
> +			      <0 0x0acd0000 0 0x1000>,
> +			      <0 0x0acb6000 0 0x1000>,
> +			      <0 0x0ace4000 0 0x2000>,
> +			      <0 0x0ace6000 0 0x2000>,
> +			      <0 0x0ace8000 0 0x2000>,
> +			      <0 0x0acea000 0 0x2000>,
> +			      <0 0x0acec000 0 0x2000>,
> +			      <0 0x0acee000 0 0x2000>,
> +			      <0 0x0ac62000 0 0xf000>,
> +			      <0 0x0ac71000 0 0xf000>,
> +			      <0 0x0ac80000 0 0xf000>,
> +			      <0 0x0accc000 0 0x2000>,
> +			      <0 0x0acd1000 0 0x2000>;
> +			reg-names = "csid0",
> +				    "csid1",
> +				    "csid2",
> +				    "csid_lite0",
> +				    "csid_lite1",
> +				    "csid_wrapper",
> +				    "csiphy0",
> +				    "csiphy1",
> +				    "csiphy2",
> +				    "csiphy3",
> +				    "csiphy4",
> +				    "csiphy5",
> +				    "vfe0",
> +				    "vfe1",
> +				    "vfe2",
> +				    "vfe_lite0",
> +				    "vfe_lite1";
> +			clocks = <&camcc CAM_CC_CAMNOC_AXI_NRT_CLK>,
> +				 <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
> +				 <&camcc CAM_CC_CPAS_AHB_CLK>,
> +				 <&camcc CAM_CC_CPAS_FAST_AHB_CLK>,
> +				 <&camcc CAM_CC_CPAS_IFE_0_CLK>,
> +				 <&camcc CAM_CC_CPAS_IFE_1_CLK>,
> +				 <&camcc CAM_CC_CPAS_IFE_2_CLK>,
> +				 <&camcc CAM_CC_CPAS_IFE_LITE_CLK>,
> +				 <&camcc CAM_CC_CSID_CLK>,
> +				 <&camcc CAM_CC_CSIPHY0_CLK>,
> +				 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
> +				 <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
> +				 <&camcc CAM_CC_CSIPHY1_CLK>,
> +				 <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
> +				 <&camcc CAM_CC_CSIPHY2_CLK>,
> +				 <&camcc CAM_CC_CSI3PHYTIMER_CLK>,
> +				 <&camcc CAM_CC_CSIPHY3_CLK>,
> +				 <&camcc CAM_CC_CSI4PHYTIMER_CLK>,
> +				 <&camcc CAM_CC_CSIPHY4_CLK>,
> +				 <&camcc CAM_CC_CSI5PHYTIMER_CLK>,
> +				 <&camcc CAM_CC_CSIPHY5_CLK>,
> +				 <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>,
> +				 <&gcc GCC_CAMERA_AHB_CLK>,
> +				 <&gcc GCC_CAMERA_HF_AXI_CLK>,
> +				 <&gcc GCC_CAMERA_SF_AXI_CLK>,
> +				 <&camcc CAM_CC_QDSS_DEBUG_XO_CLK>,
> +				 <&camcc CAM_CC_IFE_0_CLK>,
> +				 <&camcc CAM_CC_IFE_0_FAST_AHB_CLK>,
> +				 <&camcc CAM_CC_IFE_1_CLK>,
> +				 <&camcc CAM_CC_IFE_1_FAST_AHB_CLK>,
> +				 <&camcc CAM_CC_IFE_2_CLK>,
> +				 <&camcc CAM_CC_IFE_2_FAST_AHB_CLK>,
> +				 <&camcc CAM_CC_IFE_LITE_CLK>,
> +				 <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
> +				 <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
> +				 <&camcc CAM_CC_IFE_LITE_CSID_CLK>;
> +			clock-names = "camnoc_axi_nrt",
> +				      "camnoc_axi_rt",
> +				      "cpas_ahb",
> +				      "cpas_fast_ahb",
> +				      "cpas_vfe0",
> +				      "cpas_vfe1",
> +				      "cpas_vfe2",
> +				      "cpas_vfe_lite",
> +				      "csid",
> +				      "csiphy0",
> +				      "csiphy0_timer",
> +				      "csiphy1",
> +				      "csiphy1_timer",
> +				      "csiphy2",
> +				      "csiphy2_timer",
> +				      "csiphy3",
> +				      "csiphy3_timer",
> +				      "csiphy4",
> +				      "csiphy4_timer",
> +				      "csiphy5",
> +				      "csiphy5_timer",
> +				      "csiphy_rx",
> +				      "gcc_ahb_clk",
> +				      "gcc_axi_hf",
> +				      "gcc_axi_sf",
> +				      "qdss_debug_xo",
> +				      "vfe0",
> +				      "vfe0_fast_ahb",
> +				      "vfe1",
> +				      "vfe1_fast_ahb",
> +				      "vfe2",
> +				      "vfe2_fast_ahb",
> +				      "vfe_lite",
> +				      "vfe_lite_ahb",
> +				      "vfe_lite_cphy_rx",
> +				      "vfe_lite_csid";
> +			interrupts = <GIC_SPI 601 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 603 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 431 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 605 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 376 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 448 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 122 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 89 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 602 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 604 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 688 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 606 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 377 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names = "csid0",
> +					  "csid1",
> +					  "csid2",
> +					  "csid_lite0",
> +					  "csid_lite1",
> +					  "csiphy0",
> +					  "csiphy1",
> +					  "csiphy2",
> +					  "csiphy3",
> +					  "csiphy4",
> +					  "csiphy5",
> +					  "vfe0",
> +					  "vfe1",
> +					  "vfe2",
> +					  "vfe_lite0",
> +					  "vfe_lite1";
> +			interconnects = <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_CAMERA_CFG 0>,
> +					<&mmss_noc MASTER_CAMNOC_HF 0 &mc_virt SLAVE_EBI1 0>;
> +			interconnect-names = "ahb",
> +					     "hf_0_mnoc";
> +			iommus = <&apps_smmu 0x800 0x20>,
> +				 <&apps_smmu 0x18a0 0x40>,
> +				 <&apps_smmu 0x1860 0x00>;
> +			power-domains = <&camcc CAM_CC_IFE_0_GDSC>,
> +					<&camcc CAM_CC_IFE_1_GDSC>,
> +					<&camcc CAM_CC_IFE_2_GDSC>,
> +					<&camcc CAM_CC_TITAN_TOP_GDSC>;
> +			power-domain-names = "ife0", "ife1", "ife2", "top";
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
> +
> +				port@3 {
> +					reg = <3>;
> +				};
> +
> +				port@4 {
> +					reg = <4>;
> +				};
> +
> +				port@5 {
> +					reg = <5>;
> +				};
> +			};
> +		};
> +
>   		camcc: clock-controller@ade0000 {
>   			compatible = "qcom,sm8650-camcc";
>   			reg = <0 0x0ade0000 0 0x20000>;

Missing some \n between reg/reg-name and the next logical group.

---
bod

