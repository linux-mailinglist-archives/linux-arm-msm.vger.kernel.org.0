Return-Path: <linux-arm-msm+bounces-85013-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E0CCB55D2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 10:35:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9506130057D5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 09:35:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 395A31B3B19;
	Thu, 11 Dec 2025 09:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DeOTeIRC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A6F62F6562
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 09:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765445717; cv=none; b=CmOlkjHJs5CpteMKKqKIq6qKExUgG9jripUgiAj5O434lFE+1gxnAWF3n2FYuvdAnimqccvV8EyrEf7lfIgPziXqa+SpnzfIFGcDqEgCr/k7hMO5+cNBzlvRGwt2SI7WCIt4b9z6M2aFYUu9FyI4qoLyQTIBXoou3/jeSKaA3vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765445717; c=relaxed/simple;
	bh=nJrunBhBQBMvNQw/Fbsfe7jvJ+KN4zVgiCXiLL/YIHI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L2RW9M76oiT0IZfb8t4/KPNcxYR9ACnS/nQ0pIeAZa/qEmJjOE+XtKil68A5t78XbuSSCimhAaI8wjQpNbhBMfQmlWqCO6Y7+f3vB03zVMnnHd/rq8csxPNvY57FNfP+/Fvfo/cOfEA8c8vZSaQxYZuZqAATrlwUS7YyvcLxwJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DeOTeIRC; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5986cd85d83so96163e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 01:35:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765445713; x=1766050513; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gHjKWneZHFEFoK9PkdTJIjwJCl0oEnMit2/JJ/uLhvY=;
        b=DeOTeIRCxam89wbqzl/aWKdDIg8mGIbTlTiIVhyq/AgpcH7ZBzP69sNFjeNh6EtEji
         NRbvqZ4GTgL8hnBV7GoG3iTP/ytJ1BZa16qn4uk9zK7f0AREIswrjbj64YJYEjzkxklk
         uzmbpVYtn8c7Zu9RIApBoxCqGCaZcSNc3e/JB0lfYtBOt0+p05oHrWFfXS20QjVp2Mve
         KzLa/3478tPY/XkeOS8zsNZF7KO3DqUNIiEWGa8nsiosPpd72PkjTZo0hCuMC7B3g//R
         XCDr99Th1B/9eKy/0WnmBW2VJPKm3hKW03cZrB8N2TUqrpYYk8reHoATQ/BuqumtA8eR
         d4KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765445713; x=1766050513;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gHjKWneZHFEFoK9PkdTJIjwJCl0oEnMit2/JJ/uLhvY=;
        b=goX3r8Pn9jPVNrG6TgY6drIrgTO2ImkNupcDTZ1TBoUt+sRes3mLtpNYVWzjjbNyjf
         +JTLCPEZggfF56cx41Gb+Ca3sv4kf2HEC8MaYTzwVwSomQM9iCecpfA8V683TPb4Z/So
         Eq02H0Jsv0NfvbBi1M+l0TNWZKM0WDHt0lPPDxgBrMjLYucjI4nzEHBsOWbSlqg+6SeD
         fNYgDeThfeki8+T8tPPML4d+TRHmnTbWyOTeqpaaxvwF99LFW5IPLq/p/b5tXYpvwo8N
         5HRS/ICIQ+o/UyEimT9B1kq15XxUbUZoiKi918d8r9CtMfenEI7Uy7X2kddoRtFUCO/p
         evaA==
X-Forwarded-Encrypted: i=1; AJvYcCVSFgK4AdnZ8PDPJa9x8Uqd7a+OyeLIy4y/0M0RJee2CII9LXgSOwsSDxPJOg9OOXC7Vx/TiqEintnVadtg@vger.kernel.org
X-Gm-Message-State: AOJu0YxxEjjRlj3W2MZZP9wpKelQKIEBmPiG3f5VAd8Rqvr6/tsrv+1T
	iAXtSO5lu2Xb0msOL8rMAhqACUC14+jpj/ucHG7Dola6vpjiYtF1k90wGk71PHRolp0=
X-Gm-Gg: AY/fxX5dambR+ZtXCdVudo4fLlzJYNroVzsGx4GfTsAZoxMxKCTrI16oB41v1nIXARX
	igYNjrdPxSVI4WrPJ51E5z2/4vRuNlXDpg054V97a5p7fy5aR/yYCv5OJqX1g68J1ScNfXWMlQW
	EcP0vWNTpbxBqVaaTdVuqG+wC35CPhM/DnlqE8YHY3p6dIIqataZ5U4EEgCir5CxN523bshlJu7
	6KliXlTiJ57/WneSIze5ySeW3DiFGH7kmECyx2UXad3q7Dn12Ckhm7AwuTmGP3fnM4qTENazoNr
	WbBPigurJohVD1B1zcqXS3Q2P8xIFP7tUQy5KXEtIjnAjgC9yv5iFLggR8i2Q1bpZUeDhxBTON6
	MZWVK9+f/lsw0HhwTD6Ub/XD2eRn+A9t48XyKXzaE3zq8cPWyVUxR2sjoGjXv8jUO72iVBEVswu
	R0a09y5ohpSPEPFFq+oWe8o45z/2BcFzSODnmtYEnRcljQ8WK6cYeJdNlHjF3KR2McmBfJTWGXq
	VTk
X-Google-Smtp-Source: AGHT+IFmYQeN0NmklStZ/0kcb9NNDJoQrGwBtmW+zlao4Ey6WBHWnQ/bowNdnSt64t/1gqgeBKnRPg==
X-Received: by 2002:a05:6512:3ca0:b0:594:253c:20a5 with SMTP id 2adb3069b0e04-598ee53a6d3mr1211114e87.5.1765445711723;
        Thu, 11 Dec 2025 01:35:11 -0800 (PST)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-598f2f3ef28sm700274e87.24.2025.12.11.01.35.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Dec 2025 01:35:11 -0800 (PST)
Message-ID: <74d7b5a6-c65d-47be-8e2b-f527b1d0bbc2@linaro.org>
Date: Thu, 11 Dec 2025 11:35:09 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] dt-bindings: media: i2c: Add Sony IMX355
To: Richard Acayan <mailingradian@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Tianshu Qiu <tian.shu.qiu@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-media@vger.kernel.org
Cc: Robert Mader <robert.mader@collabora.com>
References: <20251211014846.16602-1-mailingradian@gmail.com>
 <20251211014846.16602-2-mailingradian@gmail.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20251211014846.16602-2-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Richard.

On 12/11/25 03:48, Richard Acayan wrote:
> The IMX355 camera sensor is a camera sensor that can be found as the
> front camera in some smartphones, such as the Pixel 3, Pixel 3 XL, Pixel
> 3a, and Pixel 3a XL. It already has a driver, but needs support for
> device tree. Document the IMX355 to support defining it in device tree.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>   .../bindings/media/i2c/sony,imx355.yaml       | 119 ++++++++++++++++++
>   1 file changed, 119 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml
> new file mode 100644
> index 000000000000..9aa2c7b7ea71
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml
> @@ -0,0 +1,119 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/sony,imx355.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sony IMX355 Sensor
> +
> +maintainers:
> +  - Richard Acayan <mailingradian@gmail.com>
> +
> +description:
> +  The IMX355 sensor is a 3280x2464 image sensor, commonly found as the front
> +  camera in smartphones.
> +
> +allOf:
> +  - $ref: /schemas/media/video-interface-devices.yaml#
> +
> +properties:
> +  compatible:
> +    const: sony,imx355
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    const: mclk
> +
> +  avdd-supply:
> +    description: Analog power supply.
> +
> +  dvdd-supply:
> +    description: Digital power supply.
> +
> +  dovdd-supply:
> +    description: Interface power supply.
> +
> +  reset-gpios:
> +    maxItems: 1
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/$defs/port-base
> +    additionalProperties: false
> +
> +    properties:
> +      endpoint:
> +        $ref: /schemas/media/video-interfaces.yaml
> +        unevaluatedProperties: false
> +
> +        data-lanes:
> +          items:
> +            - const: 0
> +            - const: 1
> +            - const: 2
> +            - const: 3

Please enumerate data lanes starting from 1.

> +
> +        required:
> +          - link-frequencies
> +          - data-lanes

If the sensor does not support any other lanes configuration,
the property can be optional.

> +
> +    required:
> +      - endpoint
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - avdd-supply
> +  - dvdd-supply
> +  - dovdd-supply
> +  - port
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,camcc-sdm845.h>
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        camera@1a {
> +            compatible = "sony,imx355";
> +            reg = <0x1a>;
> +
> +            clocks = <&camcc CAM_CC_MCLK2_CLK>;
> +            clock-names = "mclk";
> +
> +            assigned-clocks = <&camcc CAM_CC_MCLK2_CLK>;
> +            assigned-clock-rates = <24000000>;
> +
> +            reset-gpios = <&tlmm 9 GPIO_ACTIVE_HIGH>;
> +
> +            avdd-supply = <&cam_front_ldo>;
> +            dvdd-supply = <&cam_front_ldo>;
> +            dovdd-supply = <&cam_vio_ldo>;
> +
> +            pinctrl-names = "default";
> +            pinctrl-0 = <&cam_front_default>;
> +
> +            rotation = <270>;
> +            orientation = <0>;
> +
> +            port {
> +                cam_front_endpoint: endpoint {
> +                    data-lanes = <0 1 2 3>;
> +                    link-frequencies = /bits/ 64 <360000000>;
> +                    remote-endpoint = <&camss_endpoint1>;
> +                };
> +            };
> +        };
> +    };

-- 
Best wishes,
Vladimir

