Return-Path: <linux-arm-msm+bounces-17522-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B300C8A5E5D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Apr 2024 01:34:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 21506B20E0E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Apr 2024 23:34:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C01031591F8;
	Mon, 15 Apr 2024 23:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oOw7OV1K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12EA2158DC9
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Apr 2024 23:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713224065; cv=none; b=MNprDkyeVkA26a+44li1Z9zjwAiApp0nY/gwRxfrJCXaC/TJD9Ykzbc0zRC9vxOVTr5AfwMZZIiVbj2jx9KKfzzCfmNSUHMnyDIaJw+obG1H3mhUUmu6dllxCFfOGWLsj+QpCqj+ZFzm+nYE7H6Pszd9pihE/agfKsflJGgc70E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713224065; c=relaxed/simple;
	bh=gDfOKvooARS595YuZePIjRQWJo1r71UJRl8JvveYf6U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xel2EZ8b8aDxqweML67J5UDVFpSUomTaaIkxqLH0wfM0+X3+KRpamc4FXBqJXvlnqtnv4bfEcTjPGxGhQC76ILniargVPzjMbKnhNctdZHoU1wfTL3qzb5HP1AoM8Veb7ciDxuZnXhL+29UmhvYO1INdsZqbAdbkVoDfri1aEXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oOw7OV1K; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a51addddbd4so440493466b.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Apr 2024 16:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713224062; x=1713828862; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uWnsgwxyp2hync1lURb/DLtXuqHZbxB6A8Mb4rkvI9U=;
        b=oOw7OV1Kt/rvgxF55ShUInwfEMGj1KZ1yTBhlKBkp+onqVaZDm6nt03zX3KL8P5CW7
         ThnVt+WKF2f1Di6wGtYzYx/GlP8nho4g+MBJqlevljXxWNntnIyemYKn7Wor1yPg3atD
         JzZI6P1ClyGSaasmmrCfeurcN9hm6uYs+deZN6TnkRfYnBKSiP7NAcJ9BmAV8SgNonP1
         S0+rEMH0469270k8uiCgorYhQetW/btp66X9WINbXZTqNKX+/iC5PxOFDukw+ykYdQn5
         dzXQYW6996zvo/oOXwhaOvLPF/iNTSCtqjo6u2kkNnpRntcFDBAJnNb8pxD4gTTZ189g
         QuJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713224062; x=1713828862;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uWnsgwxyp2hync1lURb/DLtXuqHZbxB6A8Mb4rkvI9U=;
        b=pufC8h/q+/uzN0SUV0h3uAkdUFuoC8Hz/dzP7/Z0kquqLg6qSKpqLf8YRONdyTgjJr
         yCy/1vNYmGS3XSIJr3tPEQvUk8zh7JVtaEWXyZNuDfPMN8iuLwCNx7Q/q3ZTcdvbVfPv
         5v6pL1OxfmC6A8/l6x8DIvTFt/DllLjZLTmTwKSik9u1i0aQYxT2RQgExgUaImIfmlpH
         gpORFl17X6M70tvuvez2VRecDRTxkkYTcL33gOx+f2vhrkLPTWNdZ2GDs4m/MYRzGCpn
         t22v2El9DYyIf825TsLhQCbgbbwP+M8Rnq0d1MrWwITzmnYOfIa6nqNeaUcshViBU1R0
         CIqg==
X-Forwarded-Encrypted: i=1; AJvYcCUc7CombF+cT/CmX46Cv7vWLfsEDehj20DHtzs+ov3dhHF9MW7VWCbY/5SvyKKvGnh8iX6dLBIfiGKis4PCDTpXclQ7tWuObqK8D8ZO+Q==
X-Gm-Message-State: AOJu0Yybug7nNC2kiQw7gGmp/8beC5+lzNWe57M9E7lz/qD9W5LNwSoR
	jHiybccV8Q3+sxGVdrxMToj23tXoqYGAEOx0jvIKeV7dJ8hllxGuej+hm2gNOP1iK2fZWXlsO9f
	Qok8=
X-Google-Smtp-Source: AGHT+IFDqJ7Gb2kmxnRa15zVV+E5hZy9b0WN+KN56XBvq/Ng/slpNQeTpIhhKfBlP+Rb2/KA+4whPg==
X-Received: by 2002:a17:907:9705:b0:a52:4403:9c2 with SMTP id jg5-20020a170907970500b00a52440309c2mr6293627ejc.14.1713224062407;
        Mon, 15 Apr 2024 16:34:22 -0700 (PDT)
Received: from ?IPV6:2a00:f41:c52:73b0:74d6:fe8a:b9f:ef94? ([2a00:f41:c52:73b0:74d6:fe8a:b9f:ef94])
        by smtp.gmail.com with ESMTPSA id cw4-20020a170906c78400b00a4e58c74c9fsm6008220ejb.6.2024.04.15.16.34.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Apr 2024 16:34:22 -0700 (PDT)
Message-ID: <d8dc2a6b-4797-4829-9581-1a9e3fce069a@linaro.org>
Date: Tue, 16 Apr 2024 01:34:19 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm8650: add description of CCI
 controllers
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20240410074951.447898-1-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240410074951.447898-1-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/10/24 09:49, Vladimir Zapolskiy wrote:
> Qualcomm SM8650 SoC has three CCI controllers with two I2C busses
> connected to each of them.
> 
> The CCI controllers on SM8650 are compatible with the ones found on
> many other older generations of Qualcomm SoCs.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---

[...]

>   
> +		cci0: cci@ac15000 {
> +			compatible = "qcom,sm8650-cci", "qcom,msm8996-cci";
> +			reg = <0 0x0ac15000 0 0x1000>;
> +			interrupts = <GIC_SPI 426 IRQ_TYPE_EDGE_RISING>;
> +			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
> +			clocks = <&camcc CAM_CC_CAMNOC_AXI_NRT_CLK>,
> +				 <&camcc CAM_CC_SLOW_AHB_CLK_SRC>,
The DT should never ever touch the _SRC clocks directly, especially since
you're referencing the branch downstream of it right below

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

Why?

[...]

> +			pinctrl-0 = <&cci2_default &cci3_default>;
> +			pinctrl-1 = <&cci2_sleep &cci3_sleep>;

Please stick to a single naming scheme (cciX_Y or csiN)

Konrad

