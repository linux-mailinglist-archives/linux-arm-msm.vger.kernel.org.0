Return-Path: <linux-arm-msm+bounces-115867-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5K/RNjItRmqLLAsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115867-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 11:19:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7E56F528D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 11:19:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=nheqRINr;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115867-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115867-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D951F3091757
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 08:47:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 739B6451044;
	Thu,  2 Jul 2026 08:46:10 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD5C042A78D
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 08:46:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782981969; cv=none; b=SsTlzRFm4ZvYW8TCa+oVt3RwgpfQSfZ1Uz/IaGyLD5erbglrJ3BzDd1RKsCj0ZncOKfxyGP7FFU6mfH1Fzm+JIRlJjUYOHKWbt3MDWiUPQXC+e0z5HbDHhtqFlQeZRSgUwVr19zGlgBHk6BAeFWGMBsMzA129mdXhhLUmaMxeDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782981969; c=relaxed/simple;
	bh=MS5mWFwy5vf0hf4HoyQCtkkdTuvb0vq8o19bZAWxSgE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kZdQhvfXWzpn2peY/9LyIR4QDWhzVmppwK6VJQOspEaGwYWTGOXGVCQcZ/xY0huK+JikUKu7A39SlvfCQIJsm1CSoAhInnn7BN9y+wxUVhxect58CcsyrQPBVqPC1eQSkhW/bopJ4mersizrh6T3M3195bwD1ZE8sIEvpPQeS+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nheqRINr; arc=none smtp.client-ip=209.85.218.48
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c127813835aso202104966b.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 01:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782981966; x=1783586766; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XTERvRmf6CZrO5bc1Pl8xU9eJ7e9Wlwnz0/kVW1zl8I=;
        b=nheqRINrw8OuAzndytOu+U0QWFfYPNF1JD9cSK+I+G7nlr4N9TjerS2hZFQUpTNCkn
         FNLWVeCDnsGuEetWuhqiZLF83EhZL6V0gEBfT29X9sZ+8jj5ysod+s49WmgzOLq6un9n
         AlY4Hc/NJbqX53jNeop1y3rwiVUJ4pjVOR7CeDrP5/a+5GICf//1RhbzLcuWwZ46n4PO
         JcZcZvjnQRbiV3FlxLw7CgLvDKUjZjYxmrhCWSaSDSGjg73CDYrvrdumLtj8fh47uNdO
         Fd1s9E87rZWnmOz8MhcKvZsljcVOZ3X7eo/R8S9u4kkCGvdbxR3th46Yibx0rx5oUjRr
         acow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782981966; x=1783586766;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XTERvRmf6CZrO5bc1Pl8xU9eJ7e9Wlwnz0/kVW1zl8I=;
        b=OaBWSrRnwe8u9nTQTSoahag8VFPFXaXFWCUuYCy+Zh1hhnEyCSsfCpjiviPqKYS8ol
         RXf1iH/AEjjMB4b5oG8D2DVanpdNuIuTSHTqKid5zWjB9ugahGXN2wWV/0wZNRXT6eB5
         RrfuSq9xtVoRJSRQD6UJqxfXFw3gp6e9hqGQsWKn67tKq6t0QhGoVKw9dktNSHHwDJol
         zKB53FXUpB+qJ6/M5Tu3g6hfEqTGnS/zY4P/yDtPg70RsZ0Q/NQdXKUAQHnKo1TsSU4r
         gmIQ7OQ3hKdniX/woDaujVne6yVRQl2NS42uMe6iFZg2t+J6PJHIBRhhbceMfdtmzlHR
         zw7Q==
X-Gm-Message-State: AOJu0Yx3zXgMlkAeqyd9p7D4UNhFitmWto0Me9gEn8fyDZvmvVS6WnHy
	rsYaJXpL70pugKUEk8nzrtZHF3uDAQtrq/wEH6W5JdGHJiymSpN/e5kpVexKW1lLbgg=
X-Gm-Gg: AfdE7clvTIABa/YTscg+WFHrsg6Xzd6zqn0I2CtCNTcHJ2Z95Qj4aOte8WSrDMk8OhC
	FuvEjqeJBVzuzWjZwTNpykdzFAxnYOe741aTHZ2yZBQMVN+prmMuTo4wBu+l6E0ftWFPFcJyOLP
	AOg224PIsjAFTGsR6eBuz9DojaUpsZPKiAXKDVJ9hd+eau+xcP1N2f+VdScRkuPrl+/taULjRxJ
	w+QYUofP1AzCjZX3FbE65pC5Ue0XqmVnP3672E9+viVOuHw4DVVqGcSCwZviJVYzTId85bNctDX
	xq1v2R+Efw6IjBpctywiGtw/Brft0NAey7FpNQiQjak/5sexXVaRDc5wTAhaTDno6V7WAkCqUb5
	nWg+VheAN15A2euHOFDq8+C8XEUbMDFsLZeaWj/USK4zlG5TO2zjJ0jGxbKP8N/K8IslScM1ptm
	q76Wv1Kt17IPa2xr8jnKmNFEk=
X-Received: by 2002:a17:906:6a07:b0:c12:706f:c8ee with SMTP id a640c23a62f3a-c12a9d385e9mr217162766b.11.1782981966186;
        Thu, 02 Jul 2026 01:46:06 -0700 (PDT)
Received: from [192.168.0.101] ([109.76.47.17])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62f6e3dsm89006666b.62.2026.07.02.01.46.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 01:46:05 -0700 (PDT)
Message-ID: <3e2e6184-e020-49cc-9a4b-609c05aed846@linaro.org>
Date: Thu, 2 Jul 2026 09:46:04 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260523-x1e-csi2-phy-v8-0-a85668459521@linaro.org>
 <20260523-x1e-csi2-phy-v8-1-a85668459521@linaro.org>
 <rpnNMsR9GY8gbynzeBO8Zm61JAOq3ubt6sp0x3WDPPwkMAJzlcofECD1kabN-IUoK6sSwP5P6l28UIZLFCOpjQ==@protonmail.internalid>
 <dda32577-04e0-4507-acaf-a5694f4f31b3@linaro.org>
 <7c564df8-5c5a-4b43-806e-5e017e5c51db@kernel.org>
 <ae3a381b-5697-43ee-bdfd-aaf2d22ceedf@linaro.org>
 <6b6492a4-7610-4dce-a81c-8dc0387a4061@linaro.org>
 <1c583e24-09db-4d90-8f32-d3d3961188a0@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <1c583e24-09db-4d90-8f32-d3d3961188a0@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115867-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vladimir.zapolskiy@linaro.org,m:bod@kernel.org,m:vkoul@kernel.org,m:kishon@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neil.armstrong@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,linaro.org:dkim,linaro.org:mid,linaro.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EF7E56F528D

On 02/07/2026 09:31, Vladimir Zapolskiy wrote:
>>>> phy-cells = 1 with CPHY/DPHY specified in the consumer, as was Rob's
>>>> suggestion will specify the mode.
>>>
>>> This cell is just not needed, and unneeded complexity should not be 
>>> added.
>>
>> I'm going to stick to Rob's initial guidance on this.
>>
>> https://lore.kernel.org/linux-media/20250710230846.GA44483- 
>> robh@kernel.org/
>>
> 
> Sure, the discussion will be continued abouve v9 of the series, it's
> just a chance to do it now. Rob properly pointed out, that the invented
> "phy-type" is not needed at all.

I'll quote here

 >> +  phy-type:
 >> +    description: D-PHY or C-PHY mode
 >> +    enum: [ 10, 11 ]
 >> +    $ref: /schemas/types.yaml#/definitions/uint32

 > Perhaps putting this in phy cells would be better because the consumer
 > decides on the mode.

A clear instruction which I'm implementing.

> Ther fact is that the whole placement of the CSIPHY to phy subsystem
> looks execessive, since you add a driver for a media device, there will
> be nothing PHY driver specific left in the CSIPHY driver but name.
No, a block with its own pins, external voltage rails, even its own 
specific votes to scale individual clocks, is a distinct PHY.

There will be no further CSIPHY init sequences getting buried in CAMSS. 
It is well past time to dispense with the monolith.

---
bod

