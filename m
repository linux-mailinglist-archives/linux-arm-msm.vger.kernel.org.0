Return-Path: <linux-arm-msm+bounces-73551-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D03AFB57757
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 12:59:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7DCBF162C55
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 10:59:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CD542FC013;
	Mon, 15 Sep 2025 10:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nQn4rFQP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5002F242D88
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 10:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757933940; cv=none; b=JSNOdcD3Zqs2pT5WYobzivr8dNehEliMQuFfklFKfEVOyi/bYuj09lhovrqJARHYwQifyiYXMIEz+fhlCqgC3BcbIFmH+CT7S22EMHPMpEOrEqh4m6wYVx0aWDgzGAmTRyJJBuZ9oaIw/EK6zK//LUtztcigCe6KXM08OwcQrkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757933940; c=relaxed/simple;
	bh=tEh8ZoBXLUGU5jPXVKCduCcrrcA3PMn3JN5BnZgScxY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XeFXz6IC9Ra0CFopHeiznIpRYMffB8jtA2t6T4U6Af2qke3IagYkW1ISQc09uym8mdVwPX+WD+kV2+lrYFTDiZO++jBMolXGwM1tz5umVD1ocuk/94jrha2SLYAnd9sjA416sUr97B/9zZ6nAdLhrAMpa3WpIsRxV8VWnkxyz1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nQn4rFQP; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3dad6252eacso1636416f8f.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 03:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757933937; x=1758538737; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XAynPQhGGigAoLGUsNG/nP7nnU/F6joYqW8ReXsj3TQ=;
        b=nQn4rFQPF/cA/sB5OdFIegHt/pI/AP0qLmMhFzE6cR6xnx51Y/7rdtOIKXcDMqVfyo
         CE0EYzSakJxW/LsbT7yABwHReSF69ooOb/oPuRUC3oyJHLRppo3Rqmv+o7cbrK5HY4PI
         xH5SMqAsBmGqg+BwZdvt1LLjwwE+0s90uTg68wmJ//aQvrt/P8IS09JFZeDADnTUDm61
         6qxRviUyNxzTc0AxjF1L/uZn6CVBYARQD1S4jOXeFuTk5LPQdfH2ZuaF4icWJiNwMCe/
         HZP9TxKtkS5ar1kDQqFx5WK4+sd5OPUa9+OfGYCwmNP+23xouVYm2bjLX0IxtvS16oib
         i9Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757933937; x=1758538737;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XAynPQhGGigAoLGUsNG/nP7nnU/F6joYqW8ReXsj3TQ=;
        b=ZKLn6Q6uYFMP/T71ke38iI9VnNqymtP7fsW02BI5BfVhh72MfAmOGmj3J11XIbXrjQ
         d76QjLftMPnUF0jKqDi4uxPjW5aHIlxveARj//oK3bZW6wUdF4oxCztmjMawxSlI2fm+
         +jqi4lJRRqhvMmvvqhVItRTK4tER9aJhU7HdqGYzpPW6+HsGf8yQYNBI7FMuEVVFL4w3
         OFfiMI/jW3wJRAHjsXkDuUhhVQFv3wenfhO+MvRJBQynyF67T7pwxEcw2HAkNHofLX2O
         frF9+cEsSahVcNcPMK5FdcIBeV5yT0us7NHLbM7rQptSEazHULVN3lLQP27nIAHMmvSk
         5Ekw==
X-Forwarded-Encrypted: i=1; AJvYcCUXAHyT78ML8MIkD3tdnSY95EKg3dthGT5PBwN3eyYD0Bo3/gT12e+ayI5+jIb8QSoy3IHX864+TqCI6f6+@vger.kernel.org
X-Gm-Message-State: AOJu0YxCzOUsszbzI2A+b2+7lyMwhXCHwBduXKRT0FjlwavWFgLk295u
	btk2H0ug7azrBKtWfQktTxNXwGeu1/27sWSlohJIvLX6fmlFYeZ3Qdev2+xziguhQcs=
X-Gm-Gg: ASbGncsbqpULm5YCguolBmBWWJqnfxFm9v0LgEFG4qqQTcqHdLMpT84EA4KTwsQuBte
	hbEfz/geGoDQUd5IATGjTwLd9dc+wKTzxBwZs48DVLOlMeY1wvKBcgaUmJBAaDAJOdAzoC30xJT
	KY+DM5MXamSvRYpEBkXPlwk3NIQTOGOq/NUt+O8Ur6GMnmjWnAo9jBX1uSAbLrf8EJA2orCVkcw
	c7+CsP2eYHaxG6tM1G0eyQWcXJqGIondTKBfDSsneYgMYHPthgHxCyT7kGkjlY0zkWicIQSBILR
	HTFMpUPumOGFoN1K2PVcddlm36vfmCcmAR3VwT045yKvMVxM8sO8zCEEDig/MWgaqQMqsueYhWM
	1thH8kbftWnNG+SvHbKBdRl0xUfkpJTJT8zYkbAEYaUT5q1tE7+GPQGCFTBExwKiHz4xGdHK74U
	MfoaVuQGEeRU+xyR6pkSbaUwm7OrQqLA==
X-Google-Smtp-Source: AGHT+IFTNWcYzpONk7q5sHZJPcB+MjCfusTYtLZp44gnfW+zyeIpjyoAejs0bsdSiNwXO1ddWHKtJg==
X-Received: by 2002:a05:6000:2b0f:b0:3e8:e7a6:e5bd with SMTP id ffacd0b85a97d-3e8e7a6ea8amr4633702f8f.36.1757933936590;
        Mon, 15 Sep 2025 03:58:56 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e01865ff7sm94729955e9.2.2025.09.15.03.58.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Sep 2025 03:58:55 -0700 (PDT)
Message-ID: <d965949c-a7a0-43df-9bf1-c1232fc7e38e@linaro.org>
Date: Mon, 15 Sep 2025 11:58:52 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] dt-bindings: clock: qcom: Add SM8750 video clock
 controller
To: Taniya Das <taniya.das@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
 Imran Shaik <quic_imrashai@quicinc.com>,
 Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250829-sm8750-videocc-v2-v2-0-4517a5300e41@oss.qualcomm.com>
 <EAIobHjo8rM1e0LwqDqaUllC0qjV5ElMMhk6KgT1oNnFt_-k7ctM2_6kym9OjEtse5o4pOFM7yCkXgrSGRZhuw==@protonmail.internalid>
 <20250829-sm8750-videocc-v2-v2-2-4517a5300e41@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250829-sm8750-videocc-v2-v2-2-4517a5300e41@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29/08/2025 11:15, Taniya Das wrote:
> Add compatible string for SM8750 video clock controller and the bindings
> for SM8750 Qualcomm SoC.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>   .../bindings/clock/qcom,sm8450-videocc.yaml        |  5 ++-
>   include/dt-bindings/clock/qcom,sm8750-videocc.h    | 40 ++++++++++++++++++++++
>   2 files changed, 44 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
> index fcd2727dae46711650fc8fe71221a06630040026..b31bd833552937fa896f69966cfe5c79d9cfdd21 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
> @@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>   title: Qualcomm Video Clock & Reset Controller on SM8450
> 
>   maintainers:
> -  - Taniya Das <quic_tdas@quicinc.com>
> +  - Taniya Das <taniya.das@oss.qualcomm.com>
>     - Jagadeesh Kona <quic_jkona@quicinc.com>
> 
>   description: |
> @@ -17,6 +17,7 @@ description: |
>     See also:
>       include/dt-bindings/clock/qcom,sm8450-videocc.h
>       include/dt-bindings/clock/qcom,sm8650-videocc.h
> +    include/dt-bindings/clock/qcom,sm8750-videocc.h
> 
>   properties:
>     compatible:
> @@ -25,6 +26,7 @@ properties:
>         - qcom,sm8475-videocc
>         - qcom,sm8550-videocc
>         - qcom,sm8650-videocc
> +      - qcom,sm8750-videocc

Shouldn't this be qcom,pakala-videocc now ?

---
bod

