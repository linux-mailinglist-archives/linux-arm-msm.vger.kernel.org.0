Return-Path: <linux-arm-msm+bounces-17001-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC62189ECAF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Apr 2024 09:52:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D01871C20363
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Apr 2024 07:52:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CB5E13D28B;
	Wed, 10 Apr 2024 07:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bsBvAJeD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62DE713D500
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Apr 2024 07:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712735549; cv=none; b=YyZSlnvd/KdjM1kpKQobRiOJ0m6bB7NH8rX9MXw/syEU1KifC4kiU7RpAc4aas1SnrjAMFbUGWVtqSlt7mGCEC16k6JLvLK9AtukmzhyKn8iFBqNCmyRpypZpsZXqA1VzYBdlevCsMMBObZiK6Z1pFQx5jHCHjLTNdC8aV3H+7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712735549; c=relaxed/simple;
	bh=s55ge6FmZY8BxcYb+Y+MB5u4Uxwu11M89mmH/eppLK4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=oCAP9fiiIZlRpLct1U+h0NpyDZELWcOSGptxhLgwC/FWSj72ffjQ2B0oHqviTwabTEIivafVxGouYM8XTnjNYXwLX/YhFi9W5RLEmi7OoD0q899tYHlnDzwBxabFOsgt6/ZxkQM7fGIjXEn3blEoFDzskiKxPqUFMF0DAJgO3W0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bsBvAJeD; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3442f4e098bso2130295f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Apr 2024 00:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712735546; x=1713340346; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v/m8qJwzkT/VZiX36jHmbUZWWGRc3tHuKkun6/Cnk8s=;
        b=bsBvAJeD3iTaw5a33b+ILw3sPjlNnxVcpulI3I+3d0REK6mtuSmYgrE+8OKeFFTykG
         EZWz1DKd30AgZKKeNJZTBbbRdaT2uE2HrX06hGRQ2O7yT3YvYKfBiQGzLRyST3TPopPh
         ymGOz7SZahO6uZGEIcmThq6xIx3XQROe4poBufiautcGNcujTAtpYGWWaT7RVODKubLB
         /zSsHZ+mYe7XaaCkF1u4sWEPpaxQ4bylHCbi/P6xB4E6Th/ngrchQIVqlGBNV0neAINB
         4a/4VzD+/5LdAIRhlC1NV/NGAGU74vAhLV5fwT9NW+NUVfkHxQQGYy94Y71TFaTv0yCm
         t9IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712735546; x=1713340346;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=v/m8qJwzkT/VZiX36jHmbUZWWGRc3tHuKkun6/Cnk8s=;
        b=ZS1p6+dqTSB34Z9X43lR8Sps82ldZBaK/Aa7zSrpGb6xD84fGSUcLl9etGgB8YIrJc
         3el/9ZSj/FiWhP6vjCSwos+Btjxd57fyTSbTW0HU4lLYRDuY7mHQnJY3q3Z51qWGTrML
         Fmew676wGZhbhFVy4cNJiErCe2qydqdxLaajb3fH0Zlu567ZPSBNogWAtIlEmpLAL8y3
         NeFpqVAVhmun5DCvnbyGS0kCPFNIYEGgbgUDE1VuJV2CU4DDtr1bivuLGckEzjctZRRb
         R7XRaGjccsWljDxHEJ9YXWLkPawY87LIeYHcHiyD1/gOCBCRS7vhygfhwUAT7SOqYQhg
         dbeQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhdBeHhWypLJM7Qy8lPNNvCK7Yjpwfv5KOxPEIkXHiwD94Nj2bhikYcrEQreATBaoG+ltbOJprHR7Llfb/JVwGpLbWDp3RAXcSV/uuGQ==
X-Gm-Message-State: AOJu0Yxl8HQznlXdcFAPFMdNWwkp4spWEXPN43kfAhQrRrB0Jqf4OE22
	zq6n7R/cPlgmbaFBYzrpD4EjWB8Wdm4pkO37knoG3k6KVqYSOSmpyE3W0MJmDyg=
X-Google-Smtp-Source: AGHT+IGg5jRi5wpwfPvuEzPPien6Vl3FUXFYM0j9YeRpmHD1u38gUS6R5fD884mpnl6X4NIy/PtnUg==
X-Received: by 2002:a5d:6d49:0:b0:346:20ea:2e5e with SMTP id k9-20020a5d6d49000000b0034620ea2e5emr3861716wri.21.1712735545423;
        Wed, 10 Apr 2024 00:52:25 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:7b0c:6cd:4afa:674b? ([2a01:e0a:982:cbb0:7b0c:6cd:4afa:674b])
        by smtp.gmail.com with ESMTPSA id c8-20020adfe748000000b00343a0e2375esm13175297wrn.27.2024.04.10.00.52.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 00:52:25 -0700 (PDT)
Message-ID: <72816a9f-3c25-44d3-8386-9b561a8ae996@linaro.org>
Date: Wed, 10 Apr 2024 09:52:24 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH] arm64: dts: qcom: sm8650: add description of CCI
 controllers
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20240410074951.447898-1-vladimir.zapolskiy@linaro.org>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20240410074951.447898-1-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 10/04/2024 09:49, Vladimir Zapolskiy wrote:
> Qualcomm SM8650 SoC has three CCI controllers with two I2C busses
> connected to each of them.
> 
> The CCI controllers on SM8650 are compatible with the ones found on
> many other older generations of Qualcomm SoCs.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
> The change is based and depends on a patch series from Jagadeesh Kona:
> 
>    https://lore.kernel.org/linux-arm-msm/20240321092529.13362-1-quic_jkona@quicinc.com/
> 
> It might be an option to add this change right to the series,
> since it anyway requires a respin.
> 
> A new compatible value "qcom,sm8650-cci" is NOT added to
> Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml , because
> the controller IP description and selection is covered by a generic
> compatible value "qcom,msm8996-cci".

You'll still need to add qcom,sm8650-cci to the "CCI v2" list in qcom,i2c-cci.yaml,
otherwise the DTBS check fail, even if the fallback is already present.

Neil

> 
>   arch/arm64/boot/dts/qcom/sm8650.dtsi | 315 +++++++++++++++++++++++++++
>   1 file changed, 315 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> index b406835b2e71..160b618dff9c 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> @@ -3122,6 +3122,114 @@ videocc: clock-controller@aaf0000 {
>   			#power-domain-cells = <1>;
>   		};
>   
> +		cci0: cci@ac15000 {
> +			compatible = "qcom,sm8650-cci", "qcom,msm8996-cci";
> +			reg = <0 0x0ac15000 0 0x1000>;
> +			interrupts = <GIC_SPI 426 IRQ_TYPE_EDGE_RISING>;
> +			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
> +			clocks = <&camcc CAM_CC_CAMNOC_AXI_NRT_CLK>,
> +				 <&camcc CAM_CC_SLOW_AHB_CLK_SRC>,
> +				 <&camcc CAM_CC_CPAS_AHB_CLK>,
> +				 <&camcc CAM_CC_CCI_0_CLK>;
> +			clock-names = "camnoc_axi",
> +				      "slow_ahb_src",
> +				      "cpas_ahb",
> +				      "cci";
> +			pinctrl-0 = <&cci0_default &cci1_default>;
> +			pinctrl-1 = <&cci0_sleep &cci1_sleep>;
> +			pinctrl-names = "default", "sleep";
> +			status = "disabled";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			assigned-clocks = <&camcc CAM_CC_CCI_0_CLK_SRC>;
> +			assigned-clock-rates = <37500000>;
> +
> +			cci0_i2c0: i2c-bus@0 {
> +				reg = <0>;
> +				clock-frequency = <400000>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
> +
> +			cci0_i2c1: i2c-bus@1 {
> +				reg = <1>;
> +				clock-frequency = <400000>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
> +		};
> +
> +		cci1: cci@ac16000 {
> +			compatible = "qcom,sm8650-cci", "qcom,msm8996-cci";
> +			reg = <0 0x0ac16000 0 0x1000>;
> +			interrupts = <GIC_SPI 427 IRQ_TYPE_EDGE_RISING>;
> +			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
> +			clocks = <&camcc CAM_CC_CAMNOC_AXI_NRT_CLK>,
> +				 <&camcc CAM_CC_SLOW_AHB_CLK_SRC>,
> +				 <&camcc CAM_CC_CPAS_AHB_CLK>,
> +				 <&camcc CAM_CC_CCI_1_CLK>;
> +			clock-names = "camnoc_axi",
> +				      "slow_ahb_src",
> +				      "cpas_ahb",
> +				      "cci";
> +			pinctrl-0 = <&cci2_default &cci3_default>;
> +			pinctrl-1 = <&cci2_sleep &cci3_sleep>;
> +			pinctrl-names = "default", "sleep";
> +			status = "disabled";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
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
> +		cci2: cci@ac17000 {
> +			compatible = "qcom,sm8650-cci", "qcom,msm8996-cci";
> +			reg = <0 0x0ac17000 0 0x1000>;
> +			interrupts = <GIC_SPI 428 IRQ_TYPE_EDGE_RISING>;
> +			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
> +			clocks = <&camcc CAM_CC_CAMNOC_AXI_NRT_CLK>,
> +				 <&camcc CAM_CC_SLOW_AHB_CLK_SRC>,
> +				 <&camcc CAM_CC_CPAS_AHB_CLK>,
> +				 <&camcc CAM_CC_CCI_2_CLK>;
> +			clock-names = "camnoc_axi",
> +				      "slow_ahb_src",
> +				      "cpas_ahb",
> +				      "cci";
> +			pinctrl-0 = <&cci4_default &cci5_default>;
> +			pinctrl-1 = <&cci4_sleep &cci5_sleep>;
> +			pinctrl-names = "default", "sleep";
> +			status = "disabled";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
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
>   		camcc: clock-controller@ade0000 {
>   			compatible = "qcom,sm8650-camcc";
>   			reg = <0 0x0ade0000 0 0x20000>;
> @@ -3815,6 +3923,213 @@ tlmm: pinctrl@f100000 {
>   
>   			wakeup-parent = <&pdc>;
>   
> +			cci0_default: cci0-default-state {
> +				sda-pins {
> +					pins = "gpio113";
> +					function = "cci_i2c_sda";
> +					drive-strength = <2>;
> +					bias-pull-up = <2200>;
> +				};
> +
> +				scl-pins {
> +					pins = "gpio114";
> +					function = "cci_i2c_scl";
> +					drive-strength = <2>;
> +					bias-pull-up = <2200>;
> +				};
> +			};
> +
> +			cci0_sleep: cci0-sleep-state {
> +				sda-pins {
> +					pins = "gpio113";
> +					function = "cci_i2c_sda";
> +					drive-strength = <2>;
> +					bias-pull-down;
> +				};
> +
> +				scl-pins {
> +					pins = "gpio114";
> +					function = "cci_i2c_scl";
> +					drive-strength = <2>;
> +					bias-pull-down;
> +				};
> +			};
> +
> +			cci1_default: cci1-default-state {
> +				sda-pins {
> +					pins = "gpio115";
> +					function = "cci_i2c_sda";
> +					drive-strength = <2>;
> +					bias-pull-up = <2200>;
> +				};
> +
> +				scl-pins {
> +					pins = "gpio116";
> +					function = "cci_i2c_scl";
> +					drive-strength = <2>;
> +					bias-pull-up = <2200>;
> +				};
> +
> +				mclk-pins {
> +					pins = "gpio101";
> +					function = "cam_mclk";
> +					drive-strength = <2>;
> +					bias-disable;
> +				};
> +
> +				rst-pins {
> +					pins = "gpio15";
> +					function = "gpio";
> +					drive-strength = <2>;
> +					bias-disable;
> +					output-low;
> +				};
> +			};
> +
> +			cci1_sleep: cci1-sleep-state {
> +				sda-pins {
> +					pins = "gpio115";
> +					function = "cci_i2c_sda";
> +					drive-strength = <2>;
> +					bias-pull-down;
> +				};
> +
> +				scl-pins {
> +					pins = "gpio116";
> +					function = "cci_i2c_scl";
> +					drive-strength = <2>;
> +					bias-pull-down;
> +				};
> +			};
> +
> +			cci2_default: cci2-default-state {
> +				sda-pins {
> +					pins = "gpio117";
> +					function = "cci_i2c_sda";
> +					drive-strength = <2>;
> +					bias-pull-up = <2200>;
> +				};
> +
> +				scl-pins {
> +					pins = "gpio118";
> +					function = "cci_i2c_scl";
> +					drive-strength = <2>;
> +					bias-pull-up = <2200>;
> +				};
> +			};
> +
> +			cci2_sleep: cci2-sleep-state {
> +				sda-pins {
> +					pins = "gpio117";
> +					function = "cci_i2c_sda";
> +					drive-strength = <2>;
> +					bias-pull-down;
> +				};
> +
> +				scl-pins {
> +					pins = "gpio118";
> +					function = "cci_i2c_scl";
> +					drive-strength = <2>;
> +					bias-pull-down;
> +				};
> +			};
> +
> +			cci3_default: cci3-default-state {
> +				sda-pins {
> +					pins = "gpio12";
> +					function = "cci_i2c_sda";
> +					drive-strength = <2>;
> +					bias-pull-up = <2200>;
> +				};
> +
> +				scl-pins {
> +					pins = "gpio13";
> +					function = "cci_i2c_scl";
> +					drive-strength = <2>;
> +					bias-pull-up = <2200>;
> +				};
> +			};
> +
> +			cci3_sleep: cci3-sleep-state {
> +				sda-pins {
> +					pins = "gpio12";
> +					function = "cci_i2c_sda";
> +					drive-strength = <2>;
> +					bias-pull-down;
> +				};
> +
> +				scl-pins {
> +					pins = "gpio13";
> +					function = "cci_i2c_scl";
> +					drive-strength = <2>;
> +					bias-pull-down;
> +				};
> +			};
> +
> +			cci4_default: cci4-default-state {
> +				sda-pins {
> +					pins = "gpio112";
> +					function = "cci_i2c_sda";
> +					drive-strength = <2>;
> +					bias-pull-up = <2200>;
> +				};
> +
> +				scl-pins {
> +					pins = "gpio153";
> +					function = "cci_i2c_scl";
> +					drive-strength = <2>;
> +					bias-pull-up = <2200>;
> +				};
> +			};
> +
> +			cci4_sleep: cci4-sleep-state {
> +				sda-pins {
> +					pins = "gpio112";
> +					function = "cci_i2c_sda";
> +					drive-strength = <2>;
> +					bias-pull-down;
> +				};
> +
> +				scl-pins {
> +					pins = "gpio153";
> +					function = "cci_i2c_scl";
> +					drive-strength = <2>;
> +					bias-pull-down;
> +				};
> +			};
> +
> +			cci5_default: cci5-default-state {
> +				sda-pins {
> +					pins = "gpio119";
> +					function = "cci_i2c_sda";
> +					drive-strength = <2>;
> +					bias-pull-up = <2200>;
> +				};
> +
> +				scl-pins {
> +					pins = "gpio120";
> +					function = "cci_i2c_scl";
> +					drive-strength = <2>;
> +					bias-pull-up = <2200>;
> +				};
> +			};
> +
> +			cci5_sleep: cci5-sleep-state {
> +				sda-pins {
> +					pins = "gpio119";
> +					function = "cci_i2c_sda";
> +					drive-strength = <2>;
> +					bias-pull-down;
> +				};
> +
> +				scl-pins {
> +					pins = "gpio120";
> +					function = "cci_i2c_scl";
> +					drive-strength = <2>;
> +					bias-pull-down;
> +				};
> +			};
> +
>   			hub_i2c0_data_clk: hub-i2c0-data-clk-state {
>   				/* SDA, SCL */
>   				pins = "gpio64", "gpio65";


