Return-Path: <linux-arm-msm+bounces-25340-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B2F928498
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jul 2024 11:05:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 79B822878B6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jul 2024 09:05:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1331F1465A2;
	Fri,  5 Jul 2024 09:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w2mZBr2+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC416142911
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Jul 2024 09:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720170152; cv=none; b=ePyFj9YG4ZorjoQWkSMVwQ8gK/p4FX/CGfsR2HlXmwyA5hrdlFXScMjydJSGT5hyhiFPJYlwhS72QMkwS56aQ3Bxy0xnHm/5CENDnGQuhwypxG+ZAG7GEcO9OCVdyTL+gYOoXFEsNeNH3cxdxVhPapNKU0Q4zhIxjRh8bT3u5Oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720170152; c=relaxed/simple;
	bh=hoPUxeHfJ7KPSIZUsYL9QtkquBLpF6py4k4dw5gZTq8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HP2dSHsoekwLdQ3ouaf8gVGEl9OfaavpuxMAWi3TIjp4GSr+t7fyxMSj7h+VfWcujcBF6aIcTjZ4jIWPvBNQYmEIJU91+Zde0uCCslyo1So60qxIBYPQIzkcS1F6YtOpZzPV1D601vdEHRKavhQhg7aChauMk15638CGNlrXF/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w2mZBr2+; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-425814992aeso9436365e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Jul 2024 02:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720170148; x=1720774948; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KuEOpCa7BlhTdxLDAlgleowtxS6YCNppFKHl3bsKyYA=;
        b=w2mZBr2+fiis+lT30CpU6JJiJ9RwQurnW3stsh3KG/72kNLeI3NkgnK9Zqt9y4NtsV
         5USZ2VwDQzeWDldF70nOOntooTWtbusYKajjoQNE1NOZoxYQAurxzaS9LwpXndzsPKjR
         QN1wZkkhJlKxG8VVWEhtBQbMqcQxCIU9eI9iZMGQ/8hcgCJpOLzFx/e04iv+e3g9+mmk
         FSk4QJtCyk0lsLzIcevflrb0P9cYWzQexLLQrqp4pLlHk/FQmW0PdfbcX7VDaGfdxTK/
         41id7hj6BqRn2FeDgVit/eqdpsW0ER0h23jUwEiO9dmlPggTxqQsAmK94wyAEUKE+vfW
         pwNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720170148; x=1720774948;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KuEOpCa7BlhTdxLDAlgleowtxS6YCNppFKHl3bsKyYA=;
        b=Cxwy8pTamsf91c/UQfTD1RBL57lnM3KX25X7yxpxNeuj/NDnivyd9jtyxE9wCLK7Fp
         1DtK6V4eJdT0w9+DbhKTmu7VAhkmRzSt8ZLoHTt85q/gN1O+AMfJoHGdpKJatBUZ/XfD
         SFHh6E1l088IFumrXbB+r6nILrfyA6uBmdURk2oro5COrGHYPcVEHUSijwg6TdGddi8C
         1z6pM/505e/adcPMpKexWCILtvI581vDIa4Mwuw70pVUfhjvH4VT+3TeGnWaMuqE++zc
         McNB0FqxoFV6iax7hf7TmsiQxYDbeb++EEOlmlRImQfa4JPNA89O+cJgESV6GmL5yJ6O
         sp/g==
X-Forwarded-Encrypted: i=1; AJvYcCX7vnWI9PTIMwsvbLP2SRScD1UxPlJ1Cs+L1J7auw8tB/jXmdwPKP4SDUGRswVuPkO4uu4aIQklO1VqRBZdAtHgCqVV3PlfleiGS40rGw==
X-Gm-Message-State: AOJu0YyWGXCBNv1TBxO7WrGrCIoCpOtS5kbrSvYM7sdOM3L81PA4o+1d
	fkHFeDVJvjZrbn1ds7Ndh/UiAFi2uK5i4CEdjSeIU3j1AWT/TQj4yEDrUEbFI28=
X-Google-Smtp-Source: AGHT+IG4TbHwC5fmIONvMRgLBPsnGfmEMkbWB9nPZ5iCJdBPAnLJjs5uiezifVHO1Hl3VZ+VmYq5eg==
X-Received: by 2002:a05:600c:3b90:b0:425:65c5:79b4 with SMTP id 5b1f17b1804b1-4264a3f55f6mr26545185e9.26.1720170148036;
        Fri, 05 Jul 2024 02:02:28 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a251ef5sm53233165e9.36.2024.07.05.02.02.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jul 2024 02:02:27 -0700 (PDT)
Message-ID: <907ec6a8-da8b-4b9a-aac0-c650bab04905@linaro.org>
Date: Fri, 5 Jul 2024 11:02:25 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] dt-bindings: arm:
 qcom,coresight-static-replicator: Add property for source filtering
To: Tao Zhang <quic_taozha@quicinc.com>,
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
 Trilok Soni <quic_tsoni@quicinc.com>, Song Chai <quic_songchai@quicinc.com>,
 linux-arm-msm@vger.kernel.org, Jie Gan <quic_jiegan@quicinc.com>
References: <20240705085152.9063-1-quic_taozha@quicinc.com>
 <20240705085152.9063-2-quic_taozha@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240705085152.9063-2-quic_taozha@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05/07/2024 10:51, Tao Zhang wrote:
> Add a new property "filter_src" to label the source corresponding
> to the output connection for a static replicator. By combining
> a funnel and a static replicator in devicetree, a new device that
> supports multi-port input and multi-port output is implemented.
> In order to match the output port with the input port and
> successfully build the trace path, add this new property to
> indicate the data source corresponding to this output port.
> 
> Signed-off-by: Tao Zhang <quic_taozha@quicinc.com>
> ---
>  .../arm/arm,coresight-static-replicator.yaml   | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml
> index 1892a091ac35..d9538563f9c6 100644
> --- a/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml
> +++ b/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml
> @@ -45,7 +45,21 @@ properties:
>      patternProperties:
>        '^port@[01]$':
>          description: Output connections to CoreSight Trace bus
> -        $ref: /schemas/graph.yaml#/properties/port
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +
> +        properties:
> +          endpoint:
> +            $ref: /schemas/media/video-interfaces.yaml#

Ehm? How is this video interface?

> +
> +            properties:
> +              filter_src:

There are no properties with underscores...

> +                $ref: /schemas/types.yaml#/definitions/phandle
> +                description:
> +                  defines a phandle reference to an associated CoreSight trace device.
> +                  When the associated trace device is enabled, then the respective
> +                  trace path will be built and enabled.

How does it differ from remote endpoint? What is "respective trace path"?

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


Best regards,
Krzysztof


