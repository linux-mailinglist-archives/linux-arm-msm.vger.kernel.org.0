Return-Path: <linux-arm-msm+bounces-108440-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8LsGEXE5DGq2aAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108440-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 12:20:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AF65657C15F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 12:20:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B4C78308E705
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 10:14:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 176B14A2E23;
	Tue, 19 May 2026 10:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Dfa7yMlZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EAE24A2E03
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 10:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779185670; cv=none; b=CaEWEl1QjHuiNieEA5avm6YJzo9aMkMbNPxufOyMAy1FJxlsQNkticSyTXKHz32ynxswar2Ec+yrg49kfD1ygrUW05gi/11z417iuoeyVQ3FTO016G8X1FMhKULyDl9Y2TcGZj6h0H49pQngQddAx4uotnDL67m5OObD+lKD3NQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779185670; c=relaxed/simple;
	bh=MlZzsCiCJz/qU1zTGyvtf9iZTc9M1v0MuPCcay3MIV0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Z+d8acdaOvAq9/bb6wrypY2NPYdmtTLFTEF3oPnYnibd1oJ1Y1iW72uzhXJpU1ZmKanoRg4saWvFU9uq+r4LU0J+svnvCPwfTwamsBgVPWWhnabqotcyx4XtPaI6Vl4OfYJViwkkcz3kBeTtvDaNhDuDoO80kByCnMXQljTMeSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Dfa7yMlZ; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4891c00e7aeso24311465e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 03:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779185661; x=1779790461; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=68UC5v88IYbqRoSyuw3awSX++kyoya+p9VCms7nJOuE=;
        b=Dfa7yMlZhiDDdJG1CoBkmsZlBIG5QtQ2+LwnK0D1vZNbwDN7OChr2wewIbaU0x1vfy
         ojN5Y+uxuSo9g9fTh4nOpBLS+f41tntgzH39bBFX03l5eU+RhLvEJ1rMsq7DrgWWtAuE
         3vgh1YDSQheGGs+yX7wlo4HHzMUjWDQxZOHx4/4SKaAm3xVXxgQgRx6Oh0BPsj2HFbmk
         JoJEq2tld03RdB/TG+UJjrOB6is2a+juejyfhGe+0M7pWE5MnpkPnp+r+vb+3dAyrU1v
         V7Zr9TI/9560UXge1JLK9dE2FBXLn0hnZFlzlb2Piln6XhToil0kzWp3eqBiAl2DFXKu
         HrVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779185661; x=1779790461;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=68UC5v88IYbqRoSyuw3awSX++kyoya+p9VCms7nJOuE=;
        b=Zw0OZmu1+0pdHwll3rvKtWmHpMgMYAaotip+seth9aiYejS4KtPdt33k2ZkXNuv17N
         P3dtqiUAd87Sf8CaanJmKvrXyGLxdn40I+WN2Lh0dGl92vnTOoRoHublGSK4Gw/JBs7B
         aUDbobBFzAaNXVwyGhk+lfDH22qJ2ziuzVNJQMEZq6gfjMFoqo0oRL/FXZnf6fm6NmW5
         UZwPaZ8kK31y/grvjK+so6GymIXOP56o8Oxi4DFFwykfoj2BYEIEMwiX1zDsyqO2GxPj
         aloBpUYT2D28gtzdao/1JL3PyECqSGVcD1DNQt4yN9tvgTZF88NVmAOdDRQZWvii2Un5
         gYow==
X-Forwarded-Encrypted: i=1; AFNElJ9wUdFC3+ofOoAU2oh3oeg8SVGgU0NggXm/3ZHVBjgaF+iDSyik2DNH90bPKfSNRwwyfdfEm3xEhgjZm/6n@vger.kernel.org
X-Gm-Message-State: AOJu0YyZMZtfzLUBhzGGg82kmzdKV6j7scjOv1Bm7K7cUd2HnxesOGWB
	LDPXgpTwxhFyT0wfjzcLK9yxj/X9i7l0YHcUcFt3LRWJm8J1C26s8qYjyggj6tPXxjU=
X-Gm-Gg: Acq92OHVtytkDE1VGm318AfZKMlLcAUOmO8ea/Ge9eHG/nduTuaYi15iPTAXOZmr+4S
	OBBBvg0z3LxilPuQHW4crPNPnPsaxkodthP1f57XIhs6dBeluG5udixWJ0ZaYJtOgoyz55eiLXd
	+d0PGB5OD+VZcstC5neLVd8HiI/3GPFNQEmB4wAl54F4F6/0yZmDFNa22UF0pAJj+cWyG+s3NRJ
	tZ7IWJDdgy6ucS0tYrH7UBG/Jo7cwLHcdl3pV23bVCCBPBoId3RZxm+6T2dM4vL2WuAupaP92NX
	IX52HLqp45+1+zs+4nWxcyC1hRIr4k8dRC4aeoNsb7bOQ9J9HxRUy8t9R7PCeyRdXH6HudnbCSZ
	sDaiB1UoS12Ma8A8VTtBKXXGcnpG63qJ508gey19QExN6d/a4tERUOEfZ1W2Px9Scjiw3sblA6c
	LILg3wncZfxU379rJU5MOieVXEzrwQUKG1kA==
X-Received: by 2002:a05:600c:6383:b0:489:1c1f:35f9 with SMTP id 5b1f17b1804b1-48fe60ea4ebmr288426235e9.9.1779185661151;
        Tue, 19 May 2026 03:14:21 -0700 (PDT)
Received: from [192.168.0.35] ([51.37.145.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9ec39ff1sm47579782f8f.10.2026.05.19.03.14.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 03:14:20 -0700 (PDT)
Message-ID: <f8bda354-ca64-433e-9e9a-4eabeb9a7169@linaro.org>
Date: Tue, 19 May 2026 11:14:19 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: usb: qcom,pmic-typec: Drop redundant
 port
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260519100014.282058-3-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20260519100014.282058-3-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108440-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,linaro.org:email,linaro.org:mid,linaro.org:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: AF65657C15F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 19/05/2026 11:00, Krzysztof Kozlowski wrote:
> The binding defines both "port" and "connector" properties, where the
> "port" is claimed to be for "data-role switching messages".  There is no
> such dedicated data port for this device and role switching is part of
> connector ports - the port going to the USB controller.
> 
> The driver does not use the "port" property and there is no upstream DTS
> which would have it.  It looks like it's left-over of early versions of
> this patchset and is completely redundant now, so let's drop it.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>   Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml | 5 -----
>   1 file changed, 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
> index 6d3fa2bc9cee..975032ba6004 100644
> --- a/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
> +++ b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
> @@ -84,11 +84,6 @@ properties:
>     vdd-pdphy-supply:
>       description: VDD regulator supply to the PDPHY.
>   
> -  port:
> -    $ref: /schemas/graph.yaml#/properties/port
> -    description:
> -      Contains a port which produces data-role switching messages.
> -
>   required:
>     - compatible
>     - reg

True, the ports are in the connector now.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod

