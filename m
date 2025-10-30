Return-Path: <linux-arm-msm+bounces-79647-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id F0140C1F9F5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 11:44:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 77C684EAC78
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 10:43:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C46E3351FD6;
	Thu, 30 Oct 2025 10:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UTKlwLDW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C9FF33DEFD
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 10:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761820999; cv=none; b=cC0M/qWkVsAKcQgivcCZ28LL+pLYEZ48JcAAGGZedxp34oXwtoNpFhkUE5JtcRmQubrSFZ6JsmnWt2Vx5lBgRvdzMZ/sHA3RjmBaC4a8CGE+07A1xrvfs5ZgrwvG48/ooqf9RrE91GucD8nKMd5tYNkuCkIMiUJ2BN81eR9/8wQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761820999; c=relaxed/simple;
	bh=M5LN/CfuYlAsOGMOcCsGJW78k1Ii/25HikD9T71XSMY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cxILlbVN5aGsWEZbWclkmGP9+YEEQeaTgMv8yz3VC0SDuRVTh+MyBsjj9OGvmhQDARCKt887LiauqkWH6ZxCd8L19m9JirkEIavB5ET8PAr/ehH5FdCZacqux7TVz33KILKz3VaNHDgQP37J4frpMbwi9b8bhVDUT+ueuio+t0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UTKlwLDW; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4770c2cd96fso6580865e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 03:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761820995; x=1762425795; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PZ75iMivqNNhr/B3CKSu8v6BPgomwit/xVK0FAim4i8=;
        b=UTKlwLDWXrF1jGfA441q7zoGt1F4sk8SJe7xZXFQtDkXtDnnRBSe84swpMvsJNwpX9
         tQ1Mqr+HPcLwImDMLRkhA0K+V/jSRKY/YQ2rmOovmrAxZCNr+8RSJFCKS1zBJmDw4EQY
         4oegkPBi9GMYfLowcgYD5XaU8vnB/OxgG9N1hl5eKaQSrF3pCVBCBSRCzqmSHE1Fje3A
         K0BY8zGlpGNTIvWkQHSXETfnhenDn/eYn9y2K1PE+yPz7bB4EIx3Hzv/9dYRV76ckT0G
         t2BbU06YQnXDYnByirt/WftYucu5pNRnxELMKS+zgs7KdXYRe7Fo+SjJbSpCQBH424YE
         HCFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761820995; x=1762425795;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PZ75iMivqNNhr/B3CKSu8v6BPgomwit/xVK0FAim4i8=;
        b=oBXMYVtepD+7Yx+X4N/M3gsUIRM3z2UTiN5MxSprPXyqfRbft5+pvxzkyrMCpxpYRZ
         vE/wSIZ881CySh8jc9dySM7X0oNCc0iXHuNEdIdx80zUo3oBKSejapXxMbMEgv6P+uwv
         Sd8HBCyLN6u3FAW1PmHetmFp7cJQJ3HRGRctJDOWrSgt1UJ7LHmvGelVlsYpMxGAs3Vx
         zMWCwWT60DEKVK2lxJtakNfq3QAW74xEc/vP31wj2OitobDDNKHn0Tl9dl7RDu7TTCqc
         JuS3w6XMuK8agGCOsoyS63WFG6ybhdXE96hLzBErIXb1UqAqegB1zppbFbVB0l5c2vMn
         7xDw==
X-Forwarded-Encrypted: i=1; AJvYcCWKKeN82eBqEMuuL5VJbtuD+bjRTWj0peBFTXCP7mqzA+V7+eqziL030u0ERtZkIZMByCPAPkXI3SujY2q1@vger.kernel.org
X-Gm-Message-State: AOJu0YzJMhNMd1T2t/EA18O9nhhMbbHOy/uB+Zp7bFrgXmqEdD3Bp862
	DBXxZr4aHnlQ58M0x6+7vFupGtVEMM0+K5i16GMyAHGqMW2ZPByhSg1Hs+ke1w6hgiI=
X-Gm-Gg: ASbGncseLpcI3Gb5BfvNmlzHP0pcN7tjQjM8V1S7PrxifpSegP5zSWol9j6r0YFaUN3
	0eZ1McR9lGoj+UQangD9mEsEvgbPh6jhzqlDD2vdqrebEw0PN40h5WfGpt0gYsF4LY5mfbjWAYj
	nCW2RpIs8R1lzD9F73nf6BaB16TowGfnKuNP3S1b939WmY0AIpHJhcQtJrIrfUxGOh/ITfqB/Uj
	CfhHsbyZ38xqit46GGfSVsHm9jHliv/qVNxapbPw2W43JiPULePni4r39rgVMknOwIDHSezkVUV
	mLv9c/oPcN/zGFAjS9sCpXHBpR9fR5+2XejjGIsboL+XrChKvipDMvF0tVW3Xx4gRnAH1npLD4v
	SjGg2Gwe7b+XJ/VJunjf980848aNvyW+dSuXqgM4VozfAscPflZJlGfKoTnn104SxaJSTltTUBa
	6QQbRqRib+CVwa/8qGcQ9poP0u1U5Wx+heLfTQZ3VDWg==
X-Google-Smtp-Source: AGHT+IEJDT+VEOtWM3AxIaDKwce/lsT2ux+ORGMFhB1JqWFm8K6YO+34rU/7eFruiB0UUjJVBwoLyg==
X-Received: by 2002:a5d:584b:0:b0:429:ba8a:a860 with SMTP id ffacd0b85a97d-429ba8aa933mr651765f8f.12.1761820994810;
        Thu, 30 Oct 2025 03:43:14 -0700 (PDT)
Received: from [192.168.0.21] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952db9d1sm30898105f8f.35.2025.10.30.03.43.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 03:43:14 -0700 (PDT)
Message-ID: <eeba18d3-089b-4874-b473-6238a9cd23ea@linaro.org>
Date: Thu, 30 Oct 2025 10:43:12 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] arm64: dts: qcom: qcs8300: Add CCI definitions
To: Vikram Sharma <quic_vikramsa@quicinc.com>, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andersson@kernel.org, konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
 cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, quic_svankada@quicinc.com,
 quic_nihalkum@quicinc.com, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Ravi Shankar <quic_rshankar@quicinc.com>,
 Vishal Verma <quic_vishverm@quicinc.com>
References: <20251015131303.2797800-1-quic_vikramsa@quicinc.com>
 <20251015131303.2797800-3-quic_vikramsa@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20251015131303.2797800-3-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/10/2025 14:13, Vikram Sharma wrote:
> From: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
> 
> Qualcomm QCS8300 SoC contains 3 Camera Control Interface (CCI). Compared
> to lemans, the key difference is in SDA/SCL GPIO assignments and number
> of CCIs.
> 
> Co-developed-by: Ravi Shankar <quic_rshankar@quicinc.com>
> Signed-off-by: Ravi Shankar <quic_rshankar@quicinc.com>
> Co-developed-by: Vishal Verma <quic_vishverm@quicinc.com>
> Signed-off-by: Vishal Verma <quic_vishverm@quicinc.com>
> Co-developed-by: Suresh Vankadara <quic_svankada@quicinc.com>
> Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
> Signed-off-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>   arch/arm64/boot/dts/qcom/qcs8300.dtsi | 303 ++++++++++++++++++++++++++
>   1 file changed, 303 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> index 75fafbcea845..8f2b5f40ce14 100644
> --- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> @@ -4769,6 +4769,117 @@ videocc: clock-controller@abf0000 {
>   			#power-domain-cells = <1>;
>   		};
>   
> +		cci0: cci@ac13000 {
> +			compatible = "qcom,qcs8300-cci", "qcom,msm8996-cci";
> +			reg = <0x0 0x0ac13000 0x0 0x1000>;
> +
> +			interrupts = <GIC_SPI 460 IRQ_TYPE_EDGE_RISING>;
> +
> +			clocks = <&camcc CAM_CC_CPAS_AHB_CLK>,
> +				 <&camcc CAM_CC_CCI_0_CLK>;
> +			clock-names = "cpas_ahb",
> +				      "cci";
> +
> +			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
> +
> +			pinctrl-0 = <&cci0_i2c0_default &cci0_i2c1_default>;
> +			pinctrl-1 = <&cci0_i2c0_sleep &cci0_i2c1_sleep>;
> +			pinctrl-names = "default", "sleep";
> +
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			status = "disabled";
> +
> +			cci0_i2c0: i2c-bus@0 {
> +				reg = <0>;
> +				clock-frequency = <1000000>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
> +
> +			cci0_i2c1: i2c-bus@1 {
> +				reg = <1>;
> +				clock-frequency = <1000000>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
> +		};
> +
> +		cci1: cci@ac14000 {
> +			compatible = "qcom,qcs8300-cci", "qcom,msm8996-cci";
> +			reg = <0x0 0x0ac14000 0x0 0x1000>;
> +
> +			interrupts = <GIC_SPI 271 IRQ_TYPE_EDGE_RISING>;
> +
> +			clocks = <&camcc CAM_CC_CPAS_AHB_CLK>,
> +				 <&camcc CAM_CC_CCI_1_CLK>;
> +			clock-names = "cpas_ahb",
> +				      "cci";
> +
> +			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
> +
> +			pinctrl-0 = <&cci1_i2c0_default &cci1_i2c1_default>;
> +			pinctrl-1 = <&cci1_i2c0_sleep &cci1_i2c1_sleep>;
> +			pinctrl-names = "default", "sleep";
> +
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			status = "disabled";
> +
> +			cci1_i2c0: i2c-bus@0 {
> +				reg = <0>;
> +				clock-frequency = <1000000>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
> +
> +			cci1_i2c1: i2c-bus@1 {
> +				reg = <1>;
> +				clock-frequency = <1000000>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
> +		};
> +
> +		cci2: cci@ac15000 {
> +			compatible = "qcom,qcs8300-cci", "qcom,msm8996-cci";
> +			reg = <0x0 0x0ac15000 0x0 0x1000>;
> +
> +			interrupts = <GIC_SPI 651 IRQ_TYPE_EDGE_RISING>;
> +
> +			clocks = <&camcc CAM_CC_CPAS_AHB_CLK>,
> +				 <&camcc CAM_CC_CCI_2_CLK>;
> +			clock-names = "cpas_ahb",
> +				      "cci";
> +
> +			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
> +
> +			pinctrl-0 = <&cci2_i2c0_default &cci2_i2c1_default>;
> +			pinctrl-1 = <&cci2_i2c0_sleep &cci2_i2c1_sleep>;
> +			pinctrl-names = "default", "sleep";
> +
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			status = "disabled";
> +
> +			cci2_i2c0: i2c-bus@0 {
> +				reg = <0>;
> +				clock-frequency = <1000000>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
> +
> +			cci2_i2c1: i2c-bus@1 {
> +				reg = <1>;
> +				clock-frequency = <1000000>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
> +		};
> +
>   		camss: isp@ac78000 {
>   			compatible = "qcom,qcs8300-camss";
>   
> @@ -5063,6 +5174,198 @@ tlmm: pinctrl@f100000 {
>   			#interrupt-cells = <2>;
>   			wakeup-parent = <&pdc>;
>   
> +			cci0_i2c0_default: cci0-0-default-state {
> +				sda-pins {
> +					pins = "gpio57";
> +					function = "cci_i2c_sda";
> +					drive-strength = <2>;
> +					bias-pull-up = <2200>;
> +				};
> +
> +				scl-pins {
> +					pins = "gpio58";
> +					function = "cci_i2c_scl";
> +					drive-strength = <2>;
> +					bias-pull-up = <2200>;
> +				};
> +			};
> +
> +			cci0_i2c0_sleep: cci0-0-sleep-state {
> +				sda-pins {
> +					pins = "gpio57";
> +					function = "cci_i2c_sda";
> +					drive-strength = <2>;
> +					bias-pull-down;
> +				};
> +
> +				scl-pins {
> +					pins = "gpio58";
> +					function = "cci_i2c_scl";
> +					drive-strength = <2>;
> +					bias-pull-down;
> +				};
> +			};
> +
> +			cci0_i2c1_default: cci0-1-default-state {
> +				sda-pins {
> +					pins = "gpio29";
> +					function = "cci_i2c_sda";
> +					drive-strength = <2>;
> +					bias-pull-up = <2200>;
> +				};
> +
> +				scl-pins {
> +					pins = "gpio30";
> +					function = "cci_i2c_scl";
> +					drive-strength = <2>;
> +					bias-pull-up = <2200>;
> +				};
> +			};
> +
> +			cci0_i2c1_sleep: cci0-1-sleep-state {
> +				sda-pins {
> +					pins = "gpio29";
> +					function = "cci_i2c_sda";
> +					drive-strength = <2>;
> +					bias-pull-down;
> +				};
> +
> +				scl-pins {
> +					pins = "gpio30";
> +					function = "cci_i2c_scl";
> +					drive-strength = <2>;
> +					bias-pull-down;
> +				};
> +			};
> +
> +			cci1_i2c0_default: cci1-0-default-state {
> +				sda-pins {
> +					pins = "gpio59";
> +					function = "cci_i2c_sda";
> +					drive-strength = <2>;
> +					bias-pull-up = <2200>;
> +				};
> +
> +				scl-pins {
> +					pins = "gpio60";
> +					function = "cci_i2c_scl";
> +					drive-strength = <2>;
> +					bias-pull-up = <2200>;
> +				};
> +			};
> +
> +			cci1_i2c0_sleep: cci1-0-sleep-state {
> +				sda-pins {
> +					pins = "gpio59";
> +					function = "cci_i2c_sda";
> +					drive-strength = <2>;
> +					bias-pull-down;
> +				};
> +
> +				scl-pins {
> +					pins = "gpio60";
> +					function = "cci_i2c_scl";
> +					drive-strength = <2>;
> +					bias-pull-down;
> +				};
> +			};
> +
> +			cci1_i2c1_default: cci1-1-default-state {
> +				sda-pins {
> +					pins = "gpio31";
> +					function = "cci_i2c_sda";
> +					drive-strength = <2>;
> +					bias-pull-up = <2200>;
> +				};
> +
> +				scl-pins {
> +					pins = "gpio32";
> +					function = "cci_i2c_scl";
> +					drive-strength = <2>;
> +					bias-pull-up = <2200>;
> +				};
> +			};
> +
> +			cci1_i2c1_sleep: cci1-1-sleep-state {
> +				sda-pins {
> +					pins = "gpio31";
> +					function = "cci_i2c_sda";
> +					drive-strength = <2>;
> +					bias-pull-down;
> +				};
> +
> +				scl-pins {
> +					pins = "gpio32";
> +					function = "cci_i2c_scl";
> +					drive-strength = <2>;
> +					bias-pull-down;
> +				};
> +			};
> +
> +			cci2_i2c0_default: cci2-0-default-state {
> +				sda-pins {
> +					pins = "gpio61";
> +					function = "cci_i2c_sda";
> +					drive-strength = <2>;
> +					bias-pull-up = <2200>;
> +				};
> +
> +				scl-pins {
> +					pins = "gpio62";
> +					function = "cci_i2c_scl";
> +					drive-strength = <2>;
> +					bias-pull-up = <2200>;
> +				};
> +			};
> +
> +			cci2_i2c0_sleep: cci2-0-sleep-state {
> +				sda-pins {
> +					pins = "gpio61";
> +					function = "cci_i2c_sda";
> +					drive-strength = <2>;
> +					bias-pull-down;
> +				};
> +
> +				scl-pins {
> +					pins = "gpio62";
> +					function = "cci_i2c_scl";
> +					drive-strength = <2>;
> +					bias-pull-down;
> +				};
> +			};
> +
> +			cci2_i2c1_default: cci2-1-default-state {
> +				sda-pins {
> +					pins = "gpio54";
> +					function = "cci_i2c_sda";
> +					drive-strength = <2>;
> +					bias-pull-up = <2200>;
> +				};
> +
> +				scl-pins {
> +					pins = "gpio55";
> +					function = "cci_i2c_scl";
> +					drive-strength = <2>;
> +					bias-pull-up = <2200>;
> +				};
> +			};
> +
> +			cci2_i2c1_sleep: cci2-1-sleep-state {
> +				sda-pins {
> +					pins = "gpio54";
> +					function = "cci_i2c_sda";
> +					drive-strength = <2>;
> +					bias-pull-down;
> +				};
> +
> +				scl-pins {
> +					pins = "gpio55";
> +					function = "cci_i2c_scl";
> +					drive-strength = <2>;
> +					bias-pull-down;
> +				};
> +			};
> +
>   			hs0_mi2s_active: hs0-mi2s-active-state {
>   				pins = "gpio106", "gpio107", "gpio108", "gpio109";
>   				function = "hs0_mi2s";

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

