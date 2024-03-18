Return-Path: <linux-arm-msm+bounces-14411-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8612487EC30
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Mar 2024 16:30:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3BE42281158
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Mar 2024 15:30:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EB254F206;
	Mon, 18 Mar 2024 15:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cLXsB8H4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B29B54F1FA
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Mar 2024 15:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710775829; cv=none; b=ICjzVAF8e5gV1knBiubzFKGfFpVHgqc4pJl8JYiGtYj2A1M05sav9VCB/Y+PXbnMOgstjeCNtbhv6y5I8EywBECaUmyIrY4I8WTDej6gDSsp8Udq73Vy7NQzYdtaolQ/faxjdj2N6KtC9LQ8aCufN2RzcQ4Ms7Gl4Dyoaf2xOuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710775829; c=relaxed/simple;
	bh=9ttNpHLNHVB5SH+295amwQekMvFSDrUFuqdRogaB4hU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=FBtx/7WDK7ftUOME+5ISB9szR7yM3JyHp7/gInI0yzAZmvGdcPEhfLEwMCR7IMShICq0PzH3yUmrtMOrLIuI5PD6Fwt9Ptsv2FfRrVC5Z4rcgekKrA4irFxPxbrVNl/segzvUoqgnJ7zz314vb/3/At67tW0hZkdtG6VW90BXnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cLXsB8H4; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-41409fd8b6eso18964805e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Mar 2024 08:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710775826; x=1711380626; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hvkZMpuU/BxP5fokIc7kS/rTPDyW8R0hs8/rMgw1XDM=;
        b=cLXsB8H4xIao+yQZ0sbt+6KpiTGehUnVD1XZ2D310ImvBV8sCq9KoNlckKbZkyHJOS
         jMTFL3EIekzlaq9nHyNg5Q8nGLhmvT4ov/l2t7ZATyoqlXgmv521JNCMR1YGOotVfUp+
         urHT87XXsrcrcUwhthQM5/bFuuIDELQrv0dkHcLpYylSdZ64uTQ/8Q1rafr53VF/UyXC
         pXulnsvoT1WUOZsYo5Z5R8fhxefzUzmzxsbdm2BFThCLWs884xEy+b1Z+IwCYMVbTFsV
         2LYdWzkRK0+N/2seshMDuEVx+2dszn2GwAJxpxhX4qJGw+tLruk/LUt3Dw1xlYBUV+Y0
         l57g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710775826; x=1711380626;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hvkZMpuU/BxP5fokIc7kS/rTPDyW8R0hs8/rMgw1XDM=;
        b=Hds7g5Mi4syPessMzrFQYNaTxWn5R+SSzPE9M0wEDD/CYKiWlcAHKFGSz/swvhKUx5
         aSgWIcKvzsqbb5TjnT16s19kBSLL37Sn+LzylxNDihqlYmdlxuJ9DHITW6rneHwTJb8a
         Rm8C7q3QahmU00m6zh/j0q6pEbWROhJDjVATsS8p6GPH66SIAutyTg4lYAyRJFTG/dc1
         zjUw0+/WXEUZO24MMThQV8ZpMqrbCRoXjiViCE2SffmJZW4Ms5SPeENIv75lE57AvsxA
         pxw4UH0YFnn1PB29Ovhc47degahsMPlikymIsjX73J1mdEvRWhBeH4CqE6TlY9zqDL7f
         YXWg==
X-Forwarded-Encrypted: i=1; AJvYcCVZ7S21tSoakalypbo+CvN8T1eupkGIbaKQNCzMWAunIiMCVeiPdywAS5a0iXeuP+JJg1lqFz9BGYDDcom1Ma+hKPWhcGWX1QuCjiaSEg==
X-Gm-Message-State: AOJu0Ywb9n/z8rDFr13uFXzUtWWsHGbLDJkmYBh29ccz2Z5PqSxJdzgr
	ZGOQ/i4DC2W+Ma3q6J33y1HXjeaa8vx9j/OsNNPqCjn8SZAubMq4SugaOK7x8lE=
X-Google-Smtp-Source: AGHT+IG65Iiy+t7CKXPc9JmLj5cwjFxDw7a7LwVVfZZIKCacwhyyxjQIoSpC43mpT0Ju+4J6mdd9DA==
X-Received: by 2002:a05:600c:3556:b0:412:beee:36b3 with SMTP id i22-20020a05600c355600b00412beee36b3mr7825440wmq.7.1710775825906;
        Mon, 18 Mar 2024 08:30:25 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:ad2b:a316:59d9:3dbc? ([2a01:e0a:982:cbb0:ad2b:a316:59d9:3dbc])
        by smtp.gmail.com with ESMTPSA id t6-20020a05600c450600b004133365bbc6sm18280915wmo.19.2024.03.18.08.30.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Mar 2024 08:30:25 -0700 (PDT)
Message-ID: <11cecb76-dbbe-417c-824b-85cff556f304@linaro.org>
Date: Mon, 18 Mar 2024 16:30:23 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: sm8650: add support for the
 SM8650-HDK board
Content-Language: en-US, fr
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
References: <20240318-topic-sm8650-upstream-hdk-v2-0-b63a5d45a784@linaro.org>
 <20240318-topic-sm8650-upstream-hdk-v2-2-b63a5d45a784@linaro.org>
 <aylnxuyqkf2ikotqwqylpvuojiwkkxgnjrjx3d2ocoo6vqngih@bfpkmov5cdg6>
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
Organization: Linaro Developer Services
In-Reply-To: <aylnxuyqkf2ikotqwqylpvuojiwkkxgnjrjx3d2ocoo6vqngih@bfpkmov5cdg6>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/03/2024 15:43, Bjorn Andersson wrote:
> On Mon, Mar 18, 2024 at 10:51:54AM +0100, Neil Armstrong wrote:
> [..]
>> diff --git a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
> [..]
>> +	vph_pwr: vph-pwr-regulator {
>> +		compatible = "regulator-fixed";
>> +
>> +		regulator-name = "vph_pwr";
>> +		regulator-min-microvolt = <3700000>;
>> +		regulator-max-microvolt = <3700000>;
>> +
>> +		regulator-always-on;
>> +		regulator-boot-on;
>> +	};
>> +
>> +	vreg_bob_3v3: regulator-vreg-bob-3v3 {
> 
> It would be nice if these nodes where sorted alphabetically.

damn, ok

> 
>> +		compatible = "regulator-fixed";
>> +
>> +		regulator-name = "VREG_BOB_3P3";
>> +		regulator-min-microvolt = <3300000>;
>> +		regulator-max-microvolt = <3300000>;
>> +
>> +		vin-supply = <&vph_pwr>;
>> +	};
>> +
>> +	wcd939x: audio-codec {
>> +		compatible = "qcom,wcd9395-codec", "qcom,wcd9390-codec";
>> +
>> +		pinctrl-0 = <&wcd_default>;
>> +		pinctrl-names = "default";
>> +
>> +		qcom,micbias1-microvolt = <1800000>;
>> +		qcom,micbias2-microvolt = <1800000>;
>> +		qcom,micbias3-microvolt = <1800000>;
>> +		qcom,micbias4-microvolt = <1800000>;
>> +		qcom,mbhc-buttons-vthreshold-microvolt = <75000 150000 237000 500000 500000 500000 500000 500000>;
>> +		qcom,mbhc-headset-vthreshold-microvolt = <1700000>;
>> +		qcom,mbhc-headphone-vthreshold-microvolt = <50000>;
>> +		qcom,rx-device = <&wcd_rx>;
>> +		qcom,tx-device = <&wcd_tx>;
>> +
>> +		reset-gpios = <&tlmm 107 GPIO_ACTIVE_LOW>;
>> +
>> +		vdd-buck-supply = <&vreg_l15b_1p8>;
>> +		vdd-rxtx-supply = <&vreg_l15b_1p8>;
>> +		vdd-io-supply = <&vreg_l15b_1p8>;
>> +		vdd-mic-bias-supply = <&vreg_bob1>;
>> +
>> +		#sound-dai-cells = <1>;
>> +	};
>> +};
> [..]
>> +&mdss_mdp {
>> +	status = "okay";
> 
> On other platforms we left status = okay on the mdp child node, as it's
> pretty rare that you want mdss okay, but mdp disabled...

Sure, but this is quite unrelated to HDK

> 
>> +};
>> +
>> +&pcie0 {
>> +	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
>> +	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
>> +
>> +	pinctrl-0 = <&pcie0_default_state>;
>> +	pinctrl-names = "default";
>> +
>> +	status = "okay";
>> +};
>> +
>> +&pcie0_phy {
>> +	vdda-phy-supply = <&vreg_l1i_0p88>;
>> +	vdda-pll-supply = <&vreg_l3i_1p2>;
>> +
>> +	status = "okay";
>> +};
>> +
>> +&pcie1 {
>> +	wake-gpios = <&tlmm 99 GPIO_ACTIVE_HIGH>;
>> +	perst-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
>> +
>> +	pinctrl-0 = <&pcie1_default_state>;
>> +	pinctrl-names = "default";
>> +
>> +	status = "okay";
>> +};
>> +
>> +&pcie1_phy {
>> +	vdda-phy-supply = <&vreg_l3e_0p9>;
>> +	vdda-pll-supply = <&vreg_l3i_1p2>;
>> +	vdda-qref-supply = <&vreg_l1i_0p88>;
>> +
>> +	status = "okay";
>> +};
>> +
>> +&pcie_1_phy_aux_clk {
>> +	clock-frequency = <1000>;
> 
> Is that so?

This is how the pcie_1_phy_aux_clk was documented on SM8550 and SM8650
and downstream uses the same clock-frequency.

Neil
> 
>> +};
>> +
> 
> Regards,
> Bjorn


