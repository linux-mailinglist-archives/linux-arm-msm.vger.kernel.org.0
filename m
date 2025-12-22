Return-Path: <linux-arm-msm+bounces-86248-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CABDCD69E4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 16:50:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 96BCC30562C9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 15:50:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C592C32E73A;
	Mon, 22 Dec 2025 15:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PYZsnfHh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F4CA32D0E9
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 15:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766418628; cv=none; b=EcNVZ4h36mVnkkI1BNrxzWJgIyEWfWhnwcF44abNvmfPnMknQORRADXwt/Lc3QrMEYPHmaq3YK4yCMsK9nJZLqbtMYTacLQrBAOf6PF6JAZEIjw+Yf9ym2tzYBd0oZLAlTCZhcHZPNq5tYTtNbGDFm63yDXP0/uWDwnp556JCG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766418628; c=relaxed/simple;
	bh=qCaw8AecTqvnpTYslVOSBCuOt9l5TDhTjG01WAGiQVw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PhjiTjqjrA4V6Qw1c+FTp7NE23niPWRm8RKH3XBLc9/5GB/Cpw376J4D729k6zq6aLMkTQH8Wy75lBgeWLgkGAkilf3QhH0msOjGSnL7Gz3jfqMT0vAiUS3fSrFbDSu8xqAii4zQGN12PK2qpe0a9zZKY3SNXvQY9VDA7HnAoo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PYZsnfHh; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-47a80d4a065so20890755e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 07:50:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766418624; x=1767023424; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MGab5CiD2jPfRBpHkXEMh/Ov2EOaoVnUhQp2EuD9XIo=;
        b=PYZsnfHhYbdm4IXW0iBfSnfe/eFErLMoAx5eL9pPxqjCnv+MWiSod6WAz4dEfnZdah
         IVOthkCYQtRHSNFf9n027nO0JH6YNLYblhYWDoqT6aE8xgGOL02Z7FEixzH7hR1Da+3u
         clcIOJj3EzmKoaCtsdlpsYryoxqoew/RWdl7rIsdv44bvAQdAzRNMV5iemaY6r6RB61s
         61/PYZ9sumEQYsMkCjt2ZksVqO8PKeTdoMMTywm43p8swMB+4Xqf3GO23wPKmxZm0VkX
         j8LTKIJUMotQOMEyIWjoqLCXdDNQMyD41bpOTRj72lAmjbySEtcoBgiycuZ+eNIM8Z2D
         rcIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766418624; x=1767023424;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MGab5CiD2jPfRBpHkXEMh/Ov2EOaoVnUhQp2EuD9XIo=;
        b=CLr1OwN3IihAm+hjgdm/Vuy7bxg/K5k4HcC0pBxhPJSr6IlmWx7HiV7yFoyenzFw4w
         UolLjG8tID0idMlroT5WwUUnc0sEoVOMg9ZPOg+t3Ym9rPvuyu1NZDAWzGD70ZCnEHw3
         Zwr1KYj1y/mqrbJA9EbM/jlpG8JhzAIlLfGeexFVZqp1pL9VXJ9/L1J8Fdy8V9HOuYSx
         1qa8JlM6uvUi1BnztwLdQrL7CwQg1vUTD+vhJRSh1hwSHkPbFLU/IIf6tiu4bjEH9rxh
         LkHuzW2tydw2wuumMkunQ1ZV+tnUaRh43k41T9K9X/mfe7JK7upSikJOKmK9k35p5TnF
         EYvA==
X-Forwarded-Encrypted: i=1; AJvYcCV11DiPhgwyCAqDJD2LBRoXx/Vx+gWVO1kSa+7ExYd7uFVn4aB5Hh0LenQkZDoRXVwZzbGNhe90FS85Cu8H@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg++VNOAazcPmmysbhXb+28YdAcVQLha+nLNXY6Nn1eRL62e9T
	NRpbsxqydKSsSwxhL4TU+nZcACf3jLCzWH4osbBmEqUm+6V3FosrroL9efHw/lwCcY0=
X-Gm-Gg: AY/fxX523S1SyT5SefPl/SWHqiw5AVy9FAe195G6iv54CaZKDluuBxNEH5Bc9O7byIf
	gJ4fbTJKfUnNU2lvCVEQyLhAX7QTKBOEfXKgP610cdpihYMA+GsPKa6ffi/k9qzaf9i0gqXuKjx
	cFDSb0dYDcgk9kHlA7ltEeDRoi7B23Klh1DgI8NmVx52um1V/zFpH+7H/VXGwoCYmxFPzsWJA04
	U4MvJQ5W7V44Rh7p64K8/3vtVknIpiM88qCHALUNZlynTaoEww5C2gKN97PzygHoHhhjoSEZgFa
	cRwna3T2rbLjrQNw36sJP5SdKHZwV01Otg8WARDZD0TgvbJYdFK7W+NRxezufnsT5J7xCQBlZz6
	9C3DJqnXCOZQL4Imj00ifr+HGbAzgmXouf3xWAwTPZocDOUGJJTc1CF0Va+WMMzgeZnVXzSEPGy
	hrkJVTzuSlg0P6pO1aOeI6pqpUkUEi90+bNGJjpiqO0EX+lN7p8INj
X-Google-Smtp-Source: AGHT+IEnNeIB7reQ9q4c4bCwKMSYMzsv5bCPVpus/n3dmX0FSxO1gTmCSFGyNJQfHYz24HlzhWIwfw==
X-Received: by 2002:a05:600c:3b15:b0:479:3a88:de5d with SMTP id 5b1f17b1804b1-47d247132b8mr82213085e9.36.1766418623769;
        Mon, 22 Dec 2025 07:50:23 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be279c5f8sm237816905e9.9.2025.12.22.07.50.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 07:50:23 -0800 (PST)
Message-ID: <517d6611-7540-4026-91ca-26c3d712517b@linaro.org>
Date: Mon, 22 Dec 2025 15:50:21 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] media: dt-bindings: Correct camss supply description
To: david@ixit.cz, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vikram Sharma <quic_vikramsa@quicinc.com>,
 Kapatrala Syed <akapatra@quicinc.com>,
 Hariram Purushothaman <hariramp@quicinc.com>,
 Richard Acayan <mailingradian@gmail.com>, Bryan O'Donoghue <bod@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>, Depeng Shao <quic_depengs@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20251222-docs-camss-fixes-v4-1-914a4e5f7822@ixit.cz>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20251222-docs-camss-fixes-v4-1-914a4e5f7822@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/12/2025 14:16, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Usually, the supply is around 1.2 V, not 1.8 V, and also correct wording.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
> Eventually, if more changes would be requested, would make sense someone
> from Qualcomm to follow-up on these, as I don't have schematics,
> documentation or also no access to the internal resources.
> 
> Thank you
> ---
> Changes in v4:
> - Everything in one commit. (Krzysztof)
> - Dropped Fixes tag. (Bryan)
> - Updated rest of the files to make them in sync.
> - Link to v3: https://lore.kernel.org/r/20251216-docs-camss-fixes-v3-0-c238b6810771@ixit.cz
> 
> Changes in v3:
> - Add commit improving vdda-phy-supply description to match more recent
>    bindings.
> - Double-checked and specified it's 1.2 V vdda-pll-supply. (Vladimir)
> - Link to v2: https://lore.kernel.org/r/20251213-docs-camss-fixes-v2-1-a8a4d4d51c6c@ixit.cz
> 
> Changes in v2:
> - Applied suggestion to clarify the description. (Krzysztof)
> - Link to v1: https://lore.kernel.org/r/20251212-docs-camss-fixes-v1-1-5c011505ff59@ixit.cz
> ---
>   Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml  | 4 ++--
>   Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml   | 4 ++--
>   Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml | 4 ++--
>   Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml   | 4 ++--
>   Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml   | 4 ++--
>   Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml   | 4 ++--
>   Documentation/devicetree/bindings/media/qcom,sm8550-camss.yaml   | 4 ++--
>   Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml | 4 ++--
>   8 files changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
> index 019caa2b09c32..48f280e998096 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
> @@ -126,11 +126,11 @@ properties:
>   
>     vdda-phy-supply:
>       description:
> -      Phandle to a regulator supply to PHY core block.
> +      0.88V supply to CSIPHY IP blocks.
>   
>     vdda-pll-supply:
>       description:
> -      Phandle to 1.8V regulator supply to PHY refclk pll block.
> +      1.2V supply to CSIPHY IP blocks.
>   
>     ports:
>       $ref: /schemas/graph.yaml#/properties/ports
> diff --git a/Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml
> index ee35e3bc97ffd..b1c54c5b01b28 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml
> @@ -125,11 +125,11 @@ properties:
>   
>     vdda-phy-supply:
>       description:
> -      Phandle to a regulator supply to PHY core block.
> +      0.88V supply to CSIPHY IP blocks.
>   
>     vdda-pll-supply:
>       description:
> -      Phandle to 1.8V regulator supply to PHY refclk pll block.
> +      1.2V supply to CSIPHY IP blocks.
>   
>     ports:
>       $ref: /schemas/graph.yaml#/properties/ports
> diff --git a/Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml
> index c99fe4106eee9..354130aba9fc9 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml
> @@ -264,11 +264,11 @@ properties:
>   
>     vdda-phy-supply:
>       description:
> -      Phandle to a regulator supply to PHY core block.
> +      0.88V supply to CSIPHY IP blocks.
>   
>     vdda-pll-supply:
>       description:
> -      Phandle to 1.8V regulator supply to PHY refclk pll block.
> +      1.2V supply to CSIPHY IP blocks.
>   
>   required:
>     - clock-names
> diff --git a/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
> index 35c40fe223767..46cc7fff15992 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
> @@ -91,11 +91,11 @@ properties:
>   
>     vdda-phy-supply:
>       description:
> -      Phandle to a regulator supply to PHY core block.
> +      0.88V supply to CSIPHY IP blocks.
>   
>     vdda-pll-supply:
>       description:
> -      Phandle to 1.8V regulator supply to PHY refclk pll block.
> +      1.2V supply to CSIPHY IP blocks.
>   
>     ports:
>       $ref: /schemas/graph.yaml#/properties/ports
> diff --git a/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
> index 82bf4689d3300..be09cf3a3b3b8 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
> @@ -207,11 +207,11 @@ properties:
>   
>     vdda-phy-supply:
>       description:
> -      Phandle to a regulator supply to PHY core block.
> +      0.88V supply to CSIPHY IP blocks.
>   
>     vdda-pll-supply:
>       description:
> -      Phandle to 1.8V regulator supply to PHY refclk pll block.
> +      1.2V supply to CSIPHY IP blocks.
>   
>   required:
>     - clock-names
> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
> index ebf68ff4ab961..a509d4bbcb4aa 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
> @@ -296,11 +296,11 @@ properties:
>   
>     vdda-phy-supply:
>       description:
> -      Phandle to a regulator supply to PHY core block.
> +      0.88V supply to CSIPHY IP blocks.
>   
>     vdda-pll-supply:
>       description:
> -      Phandle to 1.8V regulator supply to PHY refclk pll block.
> +      1.2V supply to CSIPHY IP blocks.
>   
>   required:
>     - clock-names
> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-camss.yaml
> index cd34f14916b42..4b9ab1352e914 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sm8550-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sm8550-camss.yaml
> @@ -134,11 +134,11 @@ properties:
>   
>     vdda-phy-supply:
>       description:
> -      Phandle to a regulator supply to PHY core block.
> +      0.88V supply to CSIPHY IP blocks.
>   
>     vdda-pll-supply:
>       description:
> -      Phandle to 1.2V regulator supply to PHY refclk pll block.
> +      1.2V supply to CSIPHY IP blocks.
>   
>     ports:
>       $ref: /schemas/graph.yaml#/properties/ports
> diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> index b87a13479a4bf..2d1662ef522b7 100644
> --- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> @@ -120,11 +120,11 @@ properties:
>   
>     vdd-csiphy-0p8-supply:
>       description:
> -      Phandle to a 0.8V regulator supply to a PHY.
> +      0.8V supply to a PHY.
>   
>     vdd-csiphy-1p2-supply:
>       description:
> -      Phandle to 1.2V regulator supply to a PHY.
> +      1.2V supply to a PHY.
>   
>     ports:
>       $ref: /schemas/graph.yaml#/properties/ports
> 
> ---
> base-commit: cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
> change-id: 20251212-docs-camss-fixes-0fa525271951
> 
> Best regards,

I think the 'to a PHY' bit is redundant but sure, leave it as is.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

