Return-Path: <linux-arm-msm+bounces-99984-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wPvfDoeTxGnH0gQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99984-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 03:01:43 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CE5A832E274
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 03:01:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 645E5300FEC2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 01:51:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A2B83644CE;
	Thu, 26 Mar 2026 01:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z0jzwhZ5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 878062DBF75
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 01:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774489889; cv=none; b=JgFwRSSVvVaL10jVr4q1HoTQHKCsnweqn6tQ9sxnhZ7jE96QNireAOr/pC/+raAUFnPfSb8LdMm3jNuOGrVER3MaPkJ6YrSKjmAYcJzbo6bBBEkN98n3b43GJw9PjwryeI57ym/3nCprtQFDgG47jNRXwPHrysUvi/iYMdSaLsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774489889; c=relaxed/simple;
	bh=rUxcPY1pKjNKkuCXrvvt2Y64QqdkwyCUDmgJEVlUu1w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yo9fha4dxUK7xcIKvg0CWbG0XJPOLbgCHKsGnP4FjvwLQov3M3L4DQGqS248ryi33suWC9VCh/K0xxu+gehblya5WiVQsyb9elNldpXZSkXW5IbV3QsesX/aJu85nvcG72iOTwlVz4A4WIDxrUDvZWriqaoclIfJZLPastuCHs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z0jzwhZ5; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5a28cdf7a92so70728e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 18:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774489886; x=1775094686; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=66PFHV45L6JK0kry67ATm2uMaTr448PNAnY9DrkuAGQ=;
        b=Z0jzwhZ5VCZrEG7aMHOE4DuQCvbcopnNUuw4YMLPimt/BcEk8EoX/LXUyktCv8NB+f
         tOPnRNvvs+MGYUOuVVgORuBdbL+Vze2oYzeqmXnigPByc/iTnG5rG41bErWgcXzY+vIW
         hgli3quiszUd/fJ5qLfaay6B3QnfhEsr7BNDaIujQ7a/YF0YGfwUumAXqaD+//vqXQqR
         P66T8YMsUfyMlK7x8U1a5Il3fyurLF9l0a9pCpSYa5EigUyttaK35Mjas9UOOPCJB5Wb
         3OBirHB/rMQXctCp4aaTIQQRjPGHD1OhWZFWyncuQF0UNOrn2jcP/tNPnIdXFEID39K5
         /mnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774489886; x=1775094686;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=66PFHV45L6JK0kry67ATm2uMaTr448PNAnY9DrkuAGQ=;
        b=WlqoJ7KvLsGfUf5r98xJhmAR2geZjhmqcDi7cAXV83+2He+CpwCAz71qSX4QrUwuPJ
         vMgzThdvnbWdLoKJV0vNB7aGhdDy8vyN8BxeLpEFWV1nySxONl+l4o/QlDMEtgTEemL8
         eSHJMYEj/fqGTC5v6kMnPZ/emHmrM+ryzR8QIcBrpm2fUWWYpk6cooSxLv6HYjNtAJx+
         zUz1c2XfJ8Dpk2yrc8JKvukfTztAopPbsGhyF2Fh11+3G7Qh2DzlqcOOw7bucoCQsZp0
         1X0jp1QOtW70cc4yuJeVKZZTu8EPpNSoQK5zyvmyrqco4Io5r+b0Q8572PiEdaV02isU
         oBEA==
X-Gm-Message-State: AOJu0YwpH7pSjQURiqZaHrSyqqfyINlMoUsKa6JVU1EJkxuHVCocoCg3
	ftBDNsBUAKnDDRelqFoH9p9CnyrktfCcGCe1uU1CMQ1BC5rsd6lxq55YfxEGP/ysQec=
X-Gm-Gg: ATEYQzw31+ekJ6TrAgD7bL4wmHwK8C715mFS0XloUFbE4Jv3WNG0dSQbykyllZ24mNu
	wRMshTpvs7XX9YSpS/kw9JuaUbMVUrSgOzIzIiU3YdAvPjRfhbaYIvbJjrENP90SYsxSByhaPjI
	LNehEsMvZ9oqOMqMlZO/1GsRzSwJ/AOMbxosZrxW8RtcGC400xxTVXK/HhfYdUWTgAp7W6Gh/vA
	raTHFdryIMlD5V9R6EwHKTVsSe8eBE9GPmQObmrtItf4vZXZmYTVXXUCNvstoH962kRxBdyqp8U
	IDp/HCDUhqxjN0omwNrvcJP2w9WkbPBIhObXzyaTp1mKGceG/vyiYVaLFjLt/uRfdjqu6l5N9oh
	6HEDjiAVuyJGBYfFS0wW4BFr2BxeoJfd3TUgciL6UBYccmcKIUEVY8s5ZfgF+lzsdB90JHjJXic
	68uflYOXvsSLPh7T7Mf69MDSNqFvGKb5PYAIlFT+fGafHggD5LBU+G9HG3E5NJvXhSGFKPuMuDQ
	5/PAg==
X-Received: by 2002:a05:6512:33d1:b0:5a1:2ec0:7442 with SMTP id 2adb3069b0e04-5a29b947c2emr1087597e87.0.1774489885671;
        Wed, 25 Mar 2026 18:51:25 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2a063ef5bsm252287e87.17.2026.03.25.18.51.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 18:51:25 -0700 (PDT)
Message-ID: <17ab70a4-1ab8-4384-8537-44dbfe31889a@linaro.org>
Date: Thu, 26 Mar 2026 03:51:24 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 2/7] dt-bindings: media: qcom,x1e80100-camss: Add
 support for combo-mode endpoints
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Bryan O'Donoghue <bod@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Christopher Obbard <christopher.obbard@linaro.org>
References: <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-0-5b93415be6dd@linaro.org>
 <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-2-5b93415be6dd@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-2-5b93415be6dd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[linaro.org,kernel.org,baylibre.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_FROM(0.00)[bounces-99984-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_PROHIBIT(0.00)[0.0.0.1:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.0:email,linaro.org:dkim,linaro.org:email,linaro.org:mid]
X-Rspamd-Queue-Id: CE5A832E274
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/26/26 03:28, Bryan O'Donoghue wrote:
> Qualcomm CSI2 PHYs support a mode where two sensors may be attached to the
> one CSIPHY.
> 
> When we have one endpoint we may have
> - DPHY 1, 2 or 4 data lanes + 1 clock lane
> - CPHY 3 wire data lane
> 
> When we have two endpoints this indicates the special fixed combo-mode.
> - DPHY endpoint0 => 2+1 and endpoint1 => 1+1 data-lane/clock-lane combination.
> 
> Reviewed-by: Christopher Obbard <christopher.obbard@linaro.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   .../bindings/media/qcom,x1e80100-camss.yaml        | 69 ++++++++++++++++++++--
>   1 file changed, 65 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> index c17b9757b2c86..f44138f522bba 100644
> --- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> @@ -148,7 +148,8 @@ properties:
>       $ref: /schemas/graph.yaml#/properties/ports
>   
>       description:
> -      CSI input ports.
> +      CSI input ports. Supports either standard single sensor mode or
> +      Qualcomm's combo mode with one sensor in 2x1 + 1x1 data-lane, clock-lane mode.
>   
>       patternProperties:
>         "^port@[0-3]$":
> @@ -156,26 +157,86 @@ properties:
>           unevaluatedProperties: false
>   
>           description:
> -          Input port for receiving CSI data from a CSIPHY.
> +          Input port for receiving CSI data.
>   
>           properties:
> -          endpoint:
> +          endpoint@0:
>               $ref: video-interfaces.yaml#
>               unevaluatedProperties: false
>   
> +            description:
> +              Endpoint for receiving a single sensor input (or first leg of combo).
> +
>               properties:
>                 data-lanes:
>                   minItems: 1
> -                maxItems: 4
> +                maxItems: 4 # Base max allows 4 (for D-PHY)
> +
> +              clock-lanes:
> +                maxItems: 1
>   
>                 bus-type:
>                   enum:
>                     - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
>                     - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
>   
> +          endpoint@1:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            description:
> +              Endpoint for receiving the second leg of a combo sensor input.
> +
> +            properties:
> +              data-lanes:
> +                maxItems: 1
> +
> +              clock-lanes:
> +                maxItems: 1
> +
> +              bus-type:
> +                const: 4 # Combo is D-PHY specific
> +

It's unclear why both 'bus-type' and 'phys' cell argument are needed
at the same time, they are equal and thus one of two is redundant.

-- 
Best wishes,
Vladimir

