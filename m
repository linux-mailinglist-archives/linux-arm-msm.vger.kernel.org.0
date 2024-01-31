Return-Path: <linux-arm-msm+bounces-9190-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5640B8438D9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jan 2024 09:24:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 49DB31C2677F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jan 2024 08:24:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DE265A796;
	Wed, 31 Jan 2024 08:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="en0wiYJW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24AC25FB91
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Jan 2024 08:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706689481; cv=none; b=Hs311opewUU9yFchRAtYWvKbkDW4V+E8gFke/0hiskFXR3SppkfMj0eVnWC/y2kpgjHYCiMw4FR0inm2Wwm23/S6z9ETh4xr7lOKxV++FmthwsmLyw0zS8YSyxFoAPfQFILo9DYDcgAXK0cQUOAtFuOdG46gZOV21hqYyd/kXlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706689481; c=relaxed/simple;
	bh=n09nk+I99NwBzalB8taJXkZZ3OBYgSqsdL/c/0XAceI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dxdg9VNRR3sd2YTNkj0o50049CVqLZRXcKsDvNr/XTfh0zVXmYAtB7bG46QJYB94PJG2lR46glGJ60p0TSmdUbUeGWeSeXdUVSCmeLzk6M+wJSF8wy4ljwt/pS22VRnDrdY8Yl58qteijg2kNc9MEeRSng0VEMmXejyvwxPP9LE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=en0wiYJW; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-55ef0465507so4113215a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Jan 2024 00:24:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706689477; x=1707294277; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dB/T1txNelCxk/CjBbf2KDEji7TyaQep7Rhsn+Ws6nY=;
        b=en0wiYJWeoTQM58EeBsfh8m0fAl974Rlh1A0lqffWByZucGcbMVCcb9Y8jLxrmx6jk
         fqT3ovwIeMth1zSSpIfU8aUEvbwgHftaaFJMIoPzcBfA6dfco61mIw5CiOXthpVRDZMg
         eKCGADkRtFBLvyEaou5fdi0Cd17aif+xCwUZdt/N9gfowPy+furPyQewYoaCyQLOQ1Gk
         hWXDovHyQJA7kgc8o+SmENOKM4Pci6wkYTqOSwBY2J1jA87OpY6w3NUy2KVJAkN91IRd
         ALzaYLBK+48MgDKWP8qp8bGCpBthhnVTqrak4F5dBPMoZSKvg/by3YZwIzgSgLlWjzSl
         15wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706689477; x=1707294277;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dB/T1txNelCxk/CjBbf2KDEji7TyaQep7Rhsn+Ws6nY=;
        b=rN6+5ch7be7jlZo05bjbNqXz43cvzF8JltIkuTfjhf7zhAYDkrLE/1mVFjtbcG7WwQ
         drzxnl/De2qCDdrhWhFWUP8zY4CQWr8o/HrK5kKKJRfS8SbZVlW6r12jztX6U2NcVfRi
         9NldFeBTznhxif2SDmOUvQr0lTWDM7V2ADbI3mhxC5XI4z5eqaw137aT8DsRocrPj36p
         1gfY//U7PFXE7lcC0GVx7Z/aw1xfDrH8Vyee0PLPrRmaqxhMUYM6cVZwoLrEZwtIZ9hv
         GOlqG6hp5e6jHKm3DOkX6S7+IQ2SFu2WSo0aUUgoQ/rlGxgPDyqzOynC+cuMBURL6X4l
         3UdQ==
X-Gm-Message-State: AOJu0YwGxMTRVugW6Qy39n7Mzmhs9mGjHz+IBPE4Fps1wLvrBFvx+7cb
	CuuOI9mnDShqPSl7HAXtIqbxHM/Fw8XzYQW3wpUtOPi+gvoZfeQjGea2qh94z3I=
X-Google-Smtp-Source: AGHT+IEceZEXZ5o+qVbDJaRcuZ6zrl4jan1r+8cY7olSbbqE1s+7VIV2rQ9H+zxjpWvbsUWtqts/gA==
X-Received: by 2002:a50:c303:0:b0:55e:fe1a:4d2f with SMTP id a3-20020a50c303000000b0055efe1a4d2fmr586279edb.2.1706689477278;
        Wed, 31 Jan 2024 00:24:37 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCX9MwwphK140Edu+ITC+1hB2sY1PfEHVDf/NJFuqWdIWzWorQz76flrFZ5CL96+SzBoe6Rm12FaSDz9nvEy5i49sfPTpumtKuB6dshmwUK6f58DohTlnAy0u3njjjpRipPCgJepnX29gR+wZrqFfnbhcCcickZpJFw2z/yhCKs78Y7L6hKGZ1flspSc84Y6slez+H4MMqIDpvQNB0HxugJoOTPy2mkYHYXL/8tsb57+AFkHxKLUiwvSFqPPTQyqFp2M49AjFqvgY17SRfycEDCSEu2VMvBFrjDucU75YVYMEmjX9yYmqF2f4CsJztcnuopvhC3zJ5UPUhcQtjuIkJ6kR/YH9qjsx3cu7rrGCZhQQ7128S8jOIFBQZHS0kmi4zwreozf1f16miznC0Gr4SX432iHpmPOGz31oM31cyJAJH7rPC5APBbatczTotEhg5nVHZlZGjSO259yAw==
Received: from [192.168.1.20] ([178.197.222.62])
        by smtp.gmail.com with ESMTPSA id en26-20020a056402529a00b0055823c2ae17sm5530662edb.64.2024.01.31.00.24.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Jan 2024 00:24:36 -0800 (PST)
Message-ID: <7875c806-b787-4daf-8012-e3d2129914f8@linaro.org>
Date: Wed, 31 Jan 2024 09:24:35 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] dt-bindings: usb: qcom,pmic-typec: add support for
 the PM4125 block
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org
References: <20240130-pm4125-typec-v1-0-e8d0097e2991@linaro.org>
 <20240130-pm4125-typec-v1-2-e8d0097e2991@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240130-pm4125-typec-v1-2-e8d0097e2991@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/01/2024 20:42, Dmitry Baryshkov wrote:
> The PM4125 PMIC has the same Type-C register block as the PMI632.
> Likewise it doesn't support USB Power Delivery. Define the compatible
> for the TypeC block found on PM4125, using PMI632 as a compatible.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
> index 6c0c6b337693..9750cbb7558c 100644
> --- a/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
> +++ b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
> @@ -14,9 +14,15 @@ description:
>  
>  properties:
>    compatible:
> -    enum:
> -      - qcom,pmi632-typec
> -      - qcom,pm8150b-typec
> +    oneOf:
> +      - enum:
> +          - qcom,pmi632-typec
> +          - qcom,pm8150b-typec
> +      - items:
> +          - enum:
> +              - qcom,pm4125-typec
> +          - const: qcom,pmi632-typec
> +
>  
>    connector:
>      type: object
> @@ -93,6 +99,7 @@ allOf:
>            contains:
>              enum:
>                - qcom,pmi632-typec
> +              - qcom,pm4125-typec

This should not be needed. You have 632 fallback present here.

Best regards,
Krzysztof


