Return-Path: <linux-arm-msm+bounces-85162-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D018CBB514
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Dec 2025 01:05:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7104B300A1FD
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Dec 2025 00:05:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22C713B8D7F;
	Sun, 14 Dec 2025 00:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iNoA/bek"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 076BE748F
	for <linux-arm-msm@vger.kernel.org>; Sun, 14 Dec 2025 00:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765670699; cv=none; b=cUHsS+VbIH8M78jgu3VBp/qQ2NuDj/KxrouwKCfbtgU/dmqAZFuLI+h2BhjCNmD9xcXr2z+4/WPYxo8XfR45onWreK10eFb3OUJ7dNIJ8TVWoW4pWSKcfdOfRWWHd0HTR3OeaRpvyf4xN5v1mNC+rIuOsJDRgs2dX6KR0lQV7ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765670699; c=relaxed/simple;
	bh=+zQAz+Rb/94sTj+jzifGC0Wl/VBMTW3fTEGmfxduBUk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CfhNK2P3viwzlvTdiEX5XztNLxOPo6bxzfpGyg2OKzsIxoRE3LQKGpi20ztwucLBQJ+62mIpkkJcsDAZkaCujg/gAhLLrjtgoFDujMIKMA27mPLvsU1GJWgK/r5KaNrH8tt71PS5lfgs7QIMaxAQe2tjPY82bZZNnYcbJHevmJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iNoA/bek; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-37b8f270a3dso2524001fa.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 Dec 2025 16:04:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765670695; x=1766275495; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5BgboonVbxKrO9X8kRKN4BUW9psx0IkF2ipu6x5mfes=;
        b=iNoA/bekPHTxP1q3Nr2OzNojY8sy6H/d8k9YHmSPWix9gHriFGPYgqcX23fodFeet1
         OgIpuxYVeYK/hzPB6YQyyDCOJrMAQZqgwp1YvLu/43oq4+oe1ABoBMWzrLfh2b7/Kww6
         rOsiw9yETELqkwFxZfk2PCw63/W4ciQNm9HO5ckuLLz6CSc/iNyOG8+HVK+2gbZB2U3Y
         ORxlAn+cjwaDRICR/8cI7neCFXdXEqlv7PTFjiwNczwqAJVkJBkS7AsgbrCXZNx3fUrK
         7SfXVedYW2/KctJKCc5MO1T8+N+z/79T4IGVcznJ3dzYhupRzqoMJ/zX7HjXlv+B9oc3
         HpaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765670695; x=1766275495;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5BgboonVbxKrO9X8kRKN4BUW9psx0IkF2ipu6x5mfes=;
        b=pf6dcdgqgrmbaNuEBcH1arVNAyCm/rMmhtUBzF3BhKsqBfck6VCc04giTZnW+zz24l
         mgCsjnNHhNyd0BYy3xE9uQLcoo5ruMhSAdPxwlY5ZGoiDRHD54+6L+aZZSHWP/EhhlNb
         SYXqyH0VHiBdA5fRClQxw+9HGFL0JiHYO3KnRzQZ+znOjscJdwFxq3GbU6sRFMhSY5Ol
         wLMHNy3BVHxM18V66vH4ABPlWVcQd0FL3rVZfcxObQQlVJvUn9602Vrf7UIzvDJKrqL+
         o6rbDgTRApJHd6EEosK5gp6Kholr6Xtlo94wDp24cVH+1R2Cmrcrg9krWpPRQqKMuDn1
         xMeA==
X-Forwarded-Encrypted: i=1; AJvYcCUs3g/bA0Zm2HiNAfjIz4bLjG1sE4mIAf4F7XCscfDJXhCD18EJzGDBpJwquMeNiH7O/Nyvvmuoot/72CIa@vger.kernel.org
X-Gm-Message-State: AOJu0YxNatz2SSwnDhi/tVUCAVBZDuSfVedFDMBR270szTaMVLRNWCBQ
	PqbT+hKm85HA//ZTx7+f9H4eaR1Q/K74zR1vGsYnKNRjhMSRRoW7fcYUgi1e/uxODio=
X-Gm-Gg: AY/fxX4cynSvgP06Q4Sipvpg5TFN8kbjpEANZT0Yt9H2cLEkvR6NBeG6zj/KW/I8M6Z
	BiKWOheZKn0JRskUem41n80eyZDZh4afJ5kA+rReWBxAsWsqsG+lM/HctFVsUilKylmheol1zoQ
	3IT6gpHAydvKJ0en7yfny/b8pEqRn2rp1kyKtW+VIc3qNc7ZkzPz2Yff60/awLQW0MNtJFCVV7/
	/DYf7wbd+1CZtKcTnBaEI/SVyA0To9WiyGJNJMGAbXKobmfhetlL6rI8k+lPNH9Kt+Cmbv2ffa9
	C0M1hgPT+qJYp0INRF6iM0SzdpPyPeEzcwF8nwmxfJdYY8AOxpBmk667JRsKRPSxzosKYn7aYJQ
	CDGKZf1w9KxbWvh5Cc+Ho9wRi5fZBwXfHBu3lOwJIowCyOGR1g0nRpWTvCNbloX3icB2q1tnozt
	7bRZOQLk6Gdc5NeQu4OjsyBoHOPUxVNy2NGUJbLc1q9lOjPGNOLPOyuPhNZ83tySqOXxTbchGrT
	//5
X-Google-Smtp-Source: AGHT+IG0gHywQrxKrfUQzEHRspDDk2UVqLJp4GZHTOJ02LFhlHAWCfdGIvRgbfMc4gVJJKA+2cbEpg==
X-Received: by 2002:a05:6512:b98:b0:594:93b8:88a0 with SMTP id 2adb3069b0e04-598faa8dc1fmr1251168e87.6.1765670694934;
        Sat, 13 Dec 2025 16:04:54 -0800 (PST)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-598f3195e52sm3425805e87.84.2025.12.13.16.04.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Dec 2025 16:04:53 -0800 (PST)
Message-ID: <1e09a93a-d42f-4a23-b346-9f158a60d8aa@linaro.org>
Date: Sun, 14 Dec 2025 02:04:43 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: dt-bindings: Correct camss VDDA PLL supply
 description
To: david@ixit.cz, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vikram Sharma <quic_vikramsa@quicinc.com>,
 Kapatrala Syed <akapatra@quicinc.com>,
 Hariram Purushothaman <hariramp@quicinc.com>,
 Richard Acayan <mailingradian@gmail.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20251212-docs-camss-fixes-v1-1-5c011505ff59@ixit.cz>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20251212-docs-camss-fixes-v1-1-5c011505ff59@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/13/25 00:55, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Usually, the supply is around 1.2 V, not 1.8 V. Rather remove mention of
> voltage from the description.
> 
> Fixes: 849139d46d09 ("media: dt-bindings: media: camss: Fixup vdda regulator descriptions sdm845")
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
> Added only Fixes tag for the initial commit, not all the copy-paste
> propagated ones.

Generally it should be possible to specify a list of Fixes: tags.

However, despite the change is the proper one, there is an opinion that Fixes
tags are not applicable to dt bindings with a given reason that only executed
code can be fixed. So you may be asked to remove even a single Fixes tag.

>   Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml  | 2 +-
>   Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml   | 2 +-
>   Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml | 2 +-
>   Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml   | 2 +-
>   Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml   | 2 +-
>   Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml   | 2 +-
>   6 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
> index 019caa2b09c32..9009cfe993d75 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
> @@ -130,7 +130,7 @@ properties:
>   
>     vdda-pll-supply:
>       description:
> -      Phandle to 1.8V regulator supply to PHY refclk pll block.
> +      Phandle to regulator supply to PHY refclk pll block.
>   
>     ports:
>       $ref: /schemas/graph.yaml#/properties/ports
> diff --git a/Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml
> index ee35e3bc97ffd..cb922f90fe900 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml
> @@ -129,7 +129,7 @@ properties:
>   
>     vdda-pll-supply:
>       description:
> -      Phandle to 1.8V regulator supply to PHY refclk pll block.
> +      Phandle to regulator supply to PHY refclk pll block.
>   
>     ports:
>       $ref: /schemas/graph.yaml#/properties/ports
> diff --git a/Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml
> index c99fe4106eee9..2231d7216f62a 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml
> @@ -268,7 +268,7 @@ properties:
>   
>     vdda-pll-supply:
>       description:
> -      Phandle to 1.8V regulator supply to PHY refclk pll block.
> +      Phandle to regulator supply to PHY refclk pll block.
>   
>   required:
>     - clock-names
> diff --git a/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
> index 35c40fe223767..8e6ca94c88695 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
> @@ -95,7 +95,7 @@ properties:
>   
>     vdda-pll-supply:
>       description:
> -      Phandle to 1.8V regulator supply to PHY refclk pll block.
> +      Phandle to regulator supply to PHY refclk pll block.
>   
>     ports:
>       $ref: /schemas/graph.yaml#/properties/ports
> diff --git a/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
> index 82bf4689d3300..d50e096b900db 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
> @@ -211,7 +211,7 @@ properties:
>   
>     vdda-pll-supply:
>       description:
> -      Phandle to 1.8V regulator supply to PHY refclk pll block.
> +      Phandle to regulator supply to PHY refclk pll block.
>   
>   required:
>     - clock-names
> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
> index ebf68ff4ab961..ccd2d024bfd10 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
> @@ -300,7 +300,7 @@ properties:
>   
>     vdda-pll-supply:
>       description:
> -      Phandle to 1.8V regulator supply to PHY refclk pll block.
> +      Phandle to regulator supply to PHY refclk pll block.
>   
>   required:
>     - clock-names
> 

As for the change itself it is good, I'd prefer to get a correction
to 1.2V in the documentation rather than a complete removal though.

In any case,

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir

