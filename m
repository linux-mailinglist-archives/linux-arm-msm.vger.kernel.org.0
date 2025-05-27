Return-Path: <linux-arm-msm+bounces-59549-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1B4AC4EA9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 14:26:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 77C2217DA6F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 12:26:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C908E26868E;
	Tue, 27 May 2025 12:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jTjlI23q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1631EEA3C
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 12:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748348774; cv=none; b=lVChzAnWK0pk74n66vPclJGdpjhvY8sryuEw63aGUp0LhAeZSaizOnnj38CS/l0NCJUKfVIXtve7ORSRXy80RDq+RSGz5FtT0af2kmZjpLCAhc6sHyT89N+mQ7ErGAB0iLE9Kyj3KMkO4YdeLmvDjlW35JdqpoCm2etwBdBFrUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748348774; c=relaxed/simple;
	bh=fM0vRwBMxorOIhQNnNbmUaQmnFKU/onoNSRD3Seu0ao=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IZmU2QEGTrTyYf01vLQbCMrm9WcrNs8c9yPbSof495KE6Bm6cjLOWIM/mtFkfaJhVIYgyEG5jx6Cr/yfPKwan8IAcxXEurexQTgdf3zZbJsvC1Jxu4gvFmx/mIQ3xjPtv5eV5JXrP6K11pmh4Y84S9P8JmWPhEsgeqfyCXvFBYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jTjlI23q; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43edecbfb46so30045065e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 05:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748348770; x=1748953570; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nlX5wgZ807rg2otTHb6eiNJdskenA3vuBmoIAlMxE3c=;
        b=jTjlI23qO6hQF4tNDqEkeFY9N7grLR7rJzJlPJTyEFwquJA3eBQWzmd9jzb1f4TE8w
         3nZ+ruHS482IO8msWdnC4rlcn8uQ9sLi3O/vvL71uTgykJyX61xEU4L6poPe0FvlShgz
         JaEHSiGGYYcwKbS7hIanR1vOYCOHavcMsdo2nwhM4SOohbTRFgROzALJCdCaUhbHW3FE
         XpZ/MFBowRe8+zI1FW5Lku2tEwI0iSuzvYqZ9VuPHVdt9d80FjS6TzqRnSd9/Zne4NK8
         r5XOOboOeHdRVWJWvQfCtFn9hQktjhj2dEuNj/XvdJ/amD67RT8n83uMEvPEMH1nQA5+
         ZcHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748348770; x=1748953570;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nlX5wgZ807rg2otTHb6eiNJdskenA3vuBmoIAlMxE3c=;
        b=tuBPw3m9V29GZrl5QOftjRejiGA6hg+7PcbQ63i03LMRpnhqOzQqo5Bq3tq+/vhCJu
         maKCwj7x1426hhBMYIM5IkFloi/1yYGUB+7FwhwQPQ2diTSAoLbzUYaVZtZepdwe07/E
         v6bX0glsVwVDPM/CXIwOjgwaGRRyWuA1uV5tL8/tbkM2pdSUtmKi4N1b9IUHgMkfVo0q
         dFIpXCAmRHADdW0GEvH6WuxamNnKhqaJIwadfY4Y8+v14U1Ha9FO/KdNzO/RxAWJmekI
         qycol4jjlJPtOgYiC+3Vmnvu0u46PmWR2IKwy73iS7KNYMl/njrompH7KNTbUsADSIgw
         YR8A==
X-Gm-Message-State: AOJu0YyYYo6DHfoTyh5PvRTSOYsnlyTlTbu8SvEl9+RGt2hSRi4frwZ7
	yusB1YvZigxVcoVR+pCDH64nnEHVsGejh8b3wnDhJcRWAMoI8zqnoHZVIzOIhUseCgA=
X-Gm-Gg: ASbGnct3Aphh9ZI7uYhlx4FpJv7vzkW+vyaJhdz7F+9WvXmOyfMPE2oer7tqmK/hhVi
	04mKCqBdge9lgyK3Im+9c8l1jM1OLEVZdad+VWaEBjlzsRAbv47pvruMkOMJpxjwSJz2Ke/VSW3
	z8STMScscEOpiKZPk80dsA94SGoyKaWRoJIpjZJZF2VOrJpR0ct4Ou0pF03Ek+3wQRIjE9bNtUa
	kxTk+EYY9NW8PlQjLPyiSkCm+gDvdgZqlMSztXkrbKnk91rju1nKIpLQVDUQjGd/ZJyKltHE9gr
	XnrFVYmSzDGRZ0QUZRCL/GRVblNAb8U6WTVMwdTCndRpqXjzN5CbMEtf8AF05j9LDAq1b41A90q
	Eu7+8MaEviuiHGcb2
X-Google-Smtp-Source: AGHT+IGSXfGdKP76E+voScAgxzkXTjTLIJ5G7H9dlDZ79GKUItZtXNtAfGBIwcxqnJ3965Y7OhGq9w==
X-Received: by 2002:a05:6000:18aa:b0:3a4:c909:ce2b with SMTP id ffacd0b85a97d-3a4cb47e859mr11143560f8f.54.1748348770176;
        Tue, 27 May 2025 05:26:10 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4d6c9faffsm6782308f8f.74.2025.05.27.05.26.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 05:26:09 -0700 (PDT)
Message-ID: <83b0b7e1-6b5f-41e8-94b1-3073c47e9840@linaro.org>
Date: Tue, 27 May 2025 13:26:08 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: media: qcom,x1e80100-camss: Tighten the
 property regex pattern
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250502204142.2064496-1-vladimir.zapolskiy@linaro.org>
 <20250502204142.2064496-2-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250502204142.2064496-2-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/05/2025 21:41, Vladimir Zapolskiy wrote:
> There are 4 CSIPHY ports on X1E80100, it'd be preferred to tinker a too
> loose the regexp, which covers all these port names.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>   .../devicetree/bindings/media/qcom,x1e80100-camss.yaml          | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> index 113565cf2a99..680f3f514132 100644
> --- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> @@ -133,7 +133,7 @@ properties:
>         CSI input ports.
>   
>       patternProperties:
> -      "^port@[0-3]+$":
> +      "^port@[0-3]$":
>           $ref: /schemas/graph.yaml#/$defs/port-base
>           unevaluatedProperties: false
>   
Acked-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

