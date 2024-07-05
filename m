Return-Path: <linux-arm-msm+bounces-25341-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A73859284BD
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jul 2024 11:08:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 301BF1F26230
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jul 2024 09:08:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8006E1474A6;
	Fri,  5 Jul 2024 09:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JLMcxbCR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE581474B2
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Jul 2024 09:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720170449; cv=none; b=XDxpqtYwlq9HlU6KNjodaS2vmn053VAoZ7PfHbXrWKXUqz4KPveqJUH1tgqqzICfx13NYUBdS5CKNCivr/I9X5vlklaPhje6ShDhX9loVVgpMrG/HXfAkhTySn8V6oPhGPm9pxLIm3HpjAMPGJ7GTzKxvKHw1mjc9XV1SJNoAWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720170449; c=relaxed/simple;
	bh=p2YlsrYGFGe/umkJI/1dvCDsxjnyG63634lPFW0Im8k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MaCayDxUvrBlhTiJ3Ky8lnytVr0lKswqFt9BX7qyvsSSgORCWwijQQd/oxvn4IrUjLucvzYN3mNszXDXfNl0WTJrGK3pxDrWNi7lT/qUgQbEd+B14RLQepGYp/qzpvfgYM1hgbi+D2aTiWxjd1tlpWtnab3FW+lGxeuJ6LzdWkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JLMcxbCR; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3678f36f154so755236f8f.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Jul 2024 02:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720170445; x=1720775245; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=s7+f4bN9IA3GtOkD93O0fqU7xnjj0JuofASwj6krZME=;
        b=JLMcxbCRc3f+KJ/m/+43+NcJ/ZxhttyLS4yv0r1N6tb3ptOPscq7G9pyM/h/+KlXEQ
         I5u7ZR5prlgaddMouBMzZ/oNA49/EICfETXHXvy2pah2iJSWVtaGz/jzZtA5l/FI9F71
         INmUezdoNa86waIfmCViVPzGZFK2923cjD34ouCClYlxTHw2cqBhV9eDov72xw2W8oEJ
         F4mneK3SUOJcIrUcqnQfJIOHUhZesu9GXmni2E3rXkSdGvGrty05g2hWkJ0zSEcdLjYp
         NMNH6onikYgAyWaikITSU7EIE7PIwXrCojWmq6A05Ul43hO9KdJysCAwvZWEIUxlpAx5
         jmeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720170445; x=1720775245;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s7+f4bN9IA3GtOkD93O0fqU7xnjj0JuofASwj6krZME=;
        b=Y8pk0UQ3pUBlPWlDhqSefTVvl9+OfaC57nz7wLLd5FxzXGbqZklmBI3Fk0Ug2ch6+9
         68LkKQSE1eQEm2UKV2oPG6q9sXcUWnAJxSsrjZDWls2RtYIYR1dqrhdsRNVvuyq8s+8M
         dyGlfyLFCYw+3/fwYOGrlL+CvgDD3Zr67x9XHFVowPl07dzwwLwF0A7zyyrWE/xWV373
         jda9WpfMS/T3K28s0smx1a6xXWdAvZ/5AozdqQbuIM5orQCgKY69hwnZGrIgxie/61DD
         PEbo6RA1hvx+AIthYzI2VJhHdjhIg1QTUhvVH4kSUGwPoIAam7pLn0ktMZzwrxeMzdNH
         hh2g==
X-Forwarded-Encrypted: i=1; AJvYcCUAvRoDYvXe+cEfgD9sBLYqqoojCQxztd6qWxHtEHxEFRL/lHagSwOcUjeShc2p1+S7hrcZVWNwccy4adWIck/UlJKfxsvapsvxshYuqQ==
X-Gm-Message-State: AOJu0Yz15SH3yEXsZPL/iLssIW/IUDhSqJLsmRrEhxTjTgZ1bLsgNlO4
	CfCca4pw9CnhBVFaLAJ5ajsLSlZaUlkzPnvNvcId+F+IuPBK08WEmgpLvX21PiY=
X-Google-Smtp-Source: AGHT+IFcutVu2ekAp7fLPXcXazDy+13qbDBe2jaFzTw/7WA/dC1t2iWx+iFoJItONpfBMX1C8NWkYA==
X-Received: by 2002:adf:ff83:0:b0:367:4d9d:568b with SMTP id ffacd0b85a97d-3679de96b24mr2849650f8f.68.1720170444676;
        Fri, 05 Jul 2024 02:07:24 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367900fd1e5sm6924021f8f.63.2024.07.05.02.07.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jul 2024 02:07:24 -0700 (PDT)
Message-ID: <5f7cf9e4-cf1c-41d1-8985-3bcf1d943f08@linaro.org>
Date: Fri, 5 Jul 2024 11:07:22 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] dt-bindings: arm: Add binding document for
 Coresight Control Unit device.
To: Jie Gan <quic_jiegan@quicinc.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Mike Leach <mike.leach@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 James Clark <james.clark@arm.com>
Cc: Jinlong Mao <quic_jinlmao@quicinc.com>, Leo Yan <leo.yan@linaro.org>,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Tingwei Zhang <quic_tingweiz@quicinc.com>,
 Yuanfang Zhang <quic_yuanfang@quicinc.com>,
 Tao Zhang <quic_taozha@quicinc.com>, Trilok Soni <quic_tsoni@quicinc.com>,
 Song Chai <quic_songchai@quicinc.com>, linux-arm-msm@vger.kernel.org
References: <20240705090049.1656986-1-quic_jiegan@quicinc.com>
 <20240705090049.1656986-3-quic_jiegan@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240705090049.1656986-3-quic_jiegan@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05/07/2024 11:00, Jie Gan wrote:
> Add binding document for Coresight Control Unit device.

<form letter>
Please use scripts/get_maintainers.pl to get a list of necessary people
and lists to CC (and consider --no-git-fallback argument). It might
happen, that command when run on an older kernel, gives you outdated
entries. Therefore please be sure you base your patches on recent Linux
kernel.

Tools like b4 or scripts/get_maintainer.pl provide you proper list of
people, so fix your workflow. Tools might also fail if you work on some
ancient tree (don't, instead use mainline) or work on fork of kernel
(don't, instead use mainline). Just use b4 and everything should be
fine, although remember about `b4 prep --auto-to-cc` if you added new
patches to the patchset.
</form letter>

Or stop developing on some old tree. It's some sort of weird pattern in
entire Qualcomm Coresight - everything developed on old kernels.

You must work on latest mainline or maintainer or linux-next tree, not
some old Qualcomm tree. Your v5.15, v5.19, v6.4 or v6.8 or whatever you
have there: BIG NOPE.

> 
> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
> ---

Subject: it never ends with full stop.

A nit, subject: drop second/last, redundant "bindings". The
"dt-bindings" prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v6.7-rc8/source/Documentation/devicetree/bindings/submitting-patches.rst#L18

>  .../bindings/arm/qcom,coresight-ccu.yaml      | 87 +++++++++++++++++++
>  1 file changed, 87 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/qcom,coresight-ccu.yaml
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ccu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ccu.yaml
> new file mode 100644
> index 000000000000..9bb8ced393a7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ccu.yaml
> @@ -0,0 +1,87 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/qcom,coresight-ccu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: CoreSight Control Unit
> +
> +maintainers:
> +  - Yuanfang Zhang <quic_yuanfang@quicinc.com>
> +  - Mao Jinlong <quic_jinlmao@quicinc.com>
> +  - Jie Gan <quic_jiegan@quicinc.com>
> +
> +description:
> +  The Coresight Control unit controls various Coresight behaviors.
> +  Used to enable/disable ETR’s data filter function based on trace ID.
> +
> +properties:
> +  compatible:
> +    const: qcom,coresight-ccu
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    items:
> +      - const: apb_pclk

Drop _pclk

> +
> +  reg-names:

Please follow DTS coding style about order of properties.

> +    items:
> +      - const: ccu-base
> +
> +  in-ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    unevaluatedProperties:

This was never tested and it cannot reliably work.

Sorry, this is waste of our time.


> +      patternProperties:
> +        '^port(@[0-7])?$':
> +          description: Input connections from CoreSight Trace bus
> +          $ref: /schemas/graph.yaml#/properties/port
> +
> +          properties:
> +            qcom,ccu-atid-offset:
> +              description:
> +                Offset to the Coresight Control Unit component's ATID register
> +                that is used by specific TMC ETR. The ATID register can be programed based
> +                on the trace id to filter out specific trace data which gets into ETR buffer.
> +              $ref: /schemas/types.yaml#/definitions/uint32
> +
> +required:
> +  - compatible
> +  - reg
> +  - in-ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    syscon@1001000 {

That's not a syscon.

> +        compatible = "qcom,coresight-ccu";
> +        reg = <0x1001000 0x1000>;
> +        reg-names = "ccu-base";
> +

Best regards,
Krzysztof


