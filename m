Return-Path: <linux-arm-msm+bounces-13226-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8271F86FB08
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Mar 2024 08:43:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A58051C20D60
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Mar 2024 07:43:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2066C14AAE;
	Mon,  4 Mar 2024 07:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o1UTy42l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C96615AE0
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Mar 2024 07:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709538178; cv=none; b=MYvUEHiU8tVjVCGgqtpl47OqYOcpkouWQgfHlvV+Db4xl7vqTc3RI32eF6qTUwzy7CZIn2ObRkrJVNe3rFqVZajj1Qx8CvYsP7LJXYRoWTuRA9tQ94k+yPzbMgdWw5QuoWz18qOKrm1Wg1TD2CnWsAxs4K7CXfzoxw03h1R3m0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709538178; c=relaxed/simple;
	bh=+QYqdSicz9PUyoLuH7jo+sRCts6urGGcztdtQQDag4E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d6nAC5bd3hZVxMbiKAhK8cFmer0xQ7uantZ5+o+G9rabbqrlDgxHrtvOv3/npcYhBp/qdjAOyhUlZ6zBvsLsjsyXLTm2Rs9+/byw90CFAzeFK6Qr/FwC4e8/AyDVZXhN3oINOPteZxPyvKmxCtYIfavu3PXdnw7y1sUbhsIfLoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o1UTy42l; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5131c48055cso4035067e87.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 03 Mar 2024 23:42:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709538174; x=1710142974; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ss2Ma+EeepaoNCQs3iENzScIEgucg+g1E1aaSuixovU=;
        b=o1UTy42lT+qOI6gadM/dk/8pFTC+Fy0WfjG4XScarzgLF297zmh51L5D5nwlyfJkLf
         Ed8DoVH8w3y9b8quM4jKDtoJg+mPI1dFBWbvXtJASMKVlw7eHcYL32fwlZ5zJqPlrxWX
         Tzc5reHbPMMk2WPIoZrCvl9QhhA4j5s+jXk8zOAuST5+r90iG0hkHh+pFpnnL8RFjW94
         Zc9HkCZh4D2S3KohyLgKh5L6iUav674m7svP0xVT3Q8jqMiQZgW7Pp4Q+2bS8Lg0b9J9
         6funHUaRPJN0texcgERAt3MKWmi41dvfMEaSwYeSynwyqkqjvqerIBR7a4i2vGrkrzfb
         g6gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709538174; x=1710142974;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ss2Ma+EeepaoNCQs3iENzScIEgucg+g1E1aaSuixovU=;
        b=qyr69TY68WrpH3EsYiTRaVCbYwWoKPAwxm5aSS6hCkeiqUxBP2eodGc5fvV9NgG6R9
         2lqP6Kqoc7rECLP97TnQnqxlZSNj8EPLY/ujqpHxEMM1pGSHGs0aEP9M/RrGAY9YeQym
         v1svGbmfceolMpJkfmPMxU02hsUJ/KPpkHL8HdWIL1KlV3m+FS/g8e0k8VvVvfoP8fMt
         G/U28dSxaXcv2OSDlH8psnSMBiYCUMPe19+tFe1T+AlZtqanEc240pYI248Bi6GUKKkA
         ST7BkiXSMH/MgbeChXtW6LjFBfXhpDGwnTSxxI1sve6E12ZF5PhIuqUX8C5JkFwppvK2
         /ohw==
X-Forwarded-Encrypted: i=1; AJvYcCVkhQ230IbChK0bih0O2YgbSr5OsQR10e5XpQDeD0bz7WkDLsMQuHnJScIEInRCFkpXT9tO12oMNOTfwJGbZ0dUUAywZux8oRf2qqD4Ng==
X-Gm-Message-State: AOJu0YxJ1b/QLK8g2IMbpXipZ90HfMO2K006+WWKq1756qmWu3AwCL4b
	glOkdfcCPLaOxtHhM5+3E5++mMV7i79+Kr/Rs6sX6qfZqbBt8KJCPmSBJbr4uGA=
X-Google-Smtp-Source: AGHT+IHcT225AtlFE9HyGDUn7/x9qopIqcD9Ljm7HOO77maMJBoug+GQ2gkGZ1MbYk+aUfXlPocwoQ==
X-Received: by 2002:a05:6512:3c9a:b0:512:d7e8:7046 with SMTP id h26-20020a0565123c9a00b00512d7e87046mr6774119lfv.42.1709538174382;
        Sun, 03 Mar 2024 23:42:54 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id l19-20020a7bc453000000b0041292306f2csm16490671wmi.16.2024.03.03.23.42.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 Mar 2024 23:42:53 -0800 (PST)
Message-ID: <f19113bb-d66a-4197-a5d7-f51c1fb8c157@linaro.org>
Date: Mon, 4 Mar 2024 08:42:52 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/4] dt-bindings: arm: qcom: Document QCS8550 SoC and
 the AIM300 AIoT board
Content-Language: en-US
To: Tengfei Fan <quic_tengfan@quicinc.com>, andersson@kernel.org,
 konrad.dybcio@linaro.org, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 dmitry.baryshkov@linaro.org
Cc: keescook@chromium.org, tony.luck@intel.com, gpiccoli@igalia.co,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
 kernel@quicinc.com
References: <20240301134113.14423-1-quic_tengfan@quicinc.com>
 <20240301134113.14423-2-quic_tengfan@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240301134113.14423-2-quic_tengfan@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/03/2024 14:41, Tengfei Fan wrote:
> Document QCS8550 SoC and the AIM300 AIoT board bindings.
> QCS8550 is derived from SM8550. The difference between SM8550 and
> QCS8550 is QCS8550 doesn't have modem RF system. QCS8550 is mainly used
> in IoT scenarios.
> AIM300 Series is a highly optimized family of modules designed to
> support AIoT applications. It integrates QCS8550 SoC, UFS and PMIC chip
> etc.
> AIM stands for Artificial Intelligence Module. AIoT stands for AI IoT.
> 
> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> index 66beaac60e1d..0ca4333fa8cf 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -42,6 +42,7 @@ description: |
>          msm8996
>          msm8998
>          qcs404
> +        qcs8550
>          qcm2290
>          qcm6490
>          qdu1000
> @@ -868,6 +869,13 @@ properties:
>            - const: qcom,qcs404-evb
>            - const: qcom,qcs404
>  
> +      - items:
> +          - enum:
> +              - qcom,qcs8550-aim300-aiot
> +          - const: qcom,qcs8550-aim300
> +          - const: qcom,qcs8550
> +          - const: qcom,sm8550

This should be after sm8550 boards, not after qcs404.

Best regards,
Krzysztof


