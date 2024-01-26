Return-Path: <linux-arm-msm+bounces-8486-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8084383E3D5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jan 2024 22:21:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 15F912873AE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jan 2024 21:21:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F221724A04;
	Fri, 26 Jan 2024 21:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tnDNMgYd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A5B249F3
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jan 2024 21:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706304055; cv=none; b=tgh9CvK7DR4cqAQLCO5uK8XevarN8Bdqw7Ep1UMHNHhKEEJBpwDcA2smG90Jt3bbmEbIozDDO2mgX3NpM75yjLAsNTu+s0Fabd9FMKyJOnNld0rFwM6A+ed88x6zNPVCtf9mg5jLww1loMq1Q8qNw4P5u4FZnFS6v/s9FzYrF9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706304055; c=relaxed/simple;
	bh=li0J15xsdzoQMYSfgqZD+7xj6XkdotMlIQR8ht0mUpM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UY1Np9IrzTy+/k7fGBqA+J36AknfBpedsmsC2x62oWHZBHJGad4JXKV8Dkqej7Xtlz0wSwoPu/S5i/ijq6Q6uVpauLsvjdl/v/zOjQI+21z+/iF3H+YydA1fvphRghSIbIsg5E5GfRlpVFzihkQakJslblyYCRiCqC4CszDBwDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tnDNMgYd; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-40e913e3f03so13185945e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jan 2024 13:20:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706304051; x=1706908851; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ckLdbkYosqR4Batu5HIoSckjmeDoA5OjOfUTS7alHpg=;
        b=tnDNMgYdXyWh0MiP4DjYXiHERnfiVrBYaVy3DNE/8kbw4RV+QQE8CFzCjCQQuf9lgs
         2okP3Q8ZDUxpyXMps0qPhrfEaYdV/CNyf57DcF9noRKlNqT6OJJwa7ZA44xV2z0pd288
         DmLGuqxn++cEU1tNsoVoe/9ZnTVaPG6jLK7+sU8JCvKVPnc+FCqlenzqRtDzQaKx/mDh
         x9l7MGOHsBZdaiu/0yDRho8n3FQbVVevXlsAiHwltkHKl6ChIyT5CMAI3Wb2FEOnwCJC
         xaodCevnMkFQukMaqlos/ocX35ofNzapPEJohZ+Nd7vRLwD1Ljp3SKm67uB1qIQsJDp2
         EIPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706304051; x=1706908851;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ckLdbkYosqR4Batu5HIoSckjmeDoA5OjOfUTS7alHpg=;
        b=Jakari+xJa3hbG6dr4OlPO6OWmSKr4f3HtFH2+Ds/bSW9dzht+hq60kSofSmpOHBtU
         qr2i+Z27+zN55mheV3AaN/wvedb3tXqvzyGUNeEetT3QyKYJSo4/HijwcVBs/6O6I7/a
         mXdszHfCJ5bGZZnqNXHRpVcmSyXKLJ9VXQd+2zlQI7anYbEeAM0MoMAvO4Qkq8ZaghWP
         UHTMxBAdmCQt2jt5a6Hzktr/18T2V8KYyvCz/7euzYJVmcWV8+2W26SAAAVuAzZQt8Jo
         fvxc+rpJtwXRzfSl1IF4/XSdLLIlkYaYOCwWbMpA4o9FNpbLMf6OsQP5sVlJQbCK+WxV
         ndaQ==
X-Gm-Message-State: AOJu0YyGAZAkvmNi+2j75Be/BoMR0igYGg/tjS1zBeEV2QsDRigQ0exg
	927vMRsynoxMlrmQk7LCgtkALrZRJNFZ6TW/RS5Y7SECmt7hgiuoescUBhKuzEEYa+kVBiavbvt
	s
X-Google-Smtp-Source: AGHT+IFWnVaV/VRp7Y5n09XhjbL3qsH+jvvcN81KHkbuPDQHoIiucel4O1eWjYMAYLhSs0rXQsy6Xg==
X-Received: by 2002:a05:600c:4f13:b0:40e:df1c:cf1 with SMTP id l19-20020a05600c4f1300b0040edf1c0cf1mr295035wmq.135.1706304051180;
        Fri, 26 Jan 2024 13:20:51 -0800 (PST)
Received: from [192.168.231.132] (178235179146.dynamic-4-waw-k-1-3-0.vectranet.pl. [178.235.179.146])
        by smtp.gmail.com with ESMTPSA id ef14-20020a05640228ce00b0055d18d6a586sm972863edb.13.2024.01.26.13.20.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jan 2024 13:20:50 -0800 (PST)
Message-ID: <566a10b0-a7dc-42f3-9b8c-f9acd8d3a22c@linaro.org>
Date: Fri, 26 Jan 2024 22:20:49 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: sc8280xp: Introduce additional tsens
 instances
To: Bjorn Andersson <quic_bjorande@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>
References: <20240126-sc8280xp-tsens2_3-v2-1-8504d18828de@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240126-sc8280xp-tsens2_3-v2-1-8504d18828de@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.01.2024 16:12, Bjorn Andersson wrote:
> The SC8280XP contains two additional tsens instances, providing among
> other things thermal measurements for the GPU.
> 
> Add these and a GPU thermal-zone.
> 
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
> Changes in v2:
> - Drop TM/SROT comments
> - Remove polling delays, rely on interrupts
> - Link to v1: https://lore.kernel.org/r/20240118-sc8280xp-tsens2_3-v1-1-e86bce14f6bf@quicinc.com
> ---
>  arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 37 ++++++++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> index febf28356ff8..7bfbb1bd8f4a 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> @@ -4033,6 +4033,28 @@ tsens1: thermal-sensor@c265000 {
>  			#thermal-sensor-cells = <1>;
>  		};
>  
> +		tsens2: thermal-sensor@c251000 {
> +			compatible = "qcom,sc8280xp-tsens", "qcom,tsens-v2";
> +			reg = <0 0x0c251000 0 0x1ff>,
> +			      <0 0x0c224000 0 0x8>;
> +			#qcom,sensors = <11>;
> +			interrupts-extended = <&pdc 122 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&pdc 124 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "uplow", "critical";
> +			#thermal-sensor-cells = <1>;
> +		};
> +
> +		tsens3: thermal-sensor@c252000 {
> +			compatible = "qcom,sc8280xp-tsens", "qcom,tsens-v2";
> +			reg = <0 0x0c252000 0 0x1ff>,
> +			      <0 0x0c225000 0 0x8>;
> +			#qcom,sensors = <5>;
> +			interrupts-extended = <&pdc 123 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&pdc 125 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "uplow", "critical";
> +			#thermal-sensor-cells = <1>;

With the sorting issue that Johan mentioned resolved:

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

