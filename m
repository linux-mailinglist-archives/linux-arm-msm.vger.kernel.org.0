Return-Path: <linux-arm-msm+bounces-98554-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +C57HNPxumkBdQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98554-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 19:41:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F161A2C1776
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 19:41:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5F48531976B4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 18:35:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 928D53DFC86;
	Wed, 18 Mar 2026 18:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HYZGVDQe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF2F93E1CFB
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 18:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773858956; cv=none; b=JOipciMX1P2N/SherU/zpvtRq0cpKf+mWxd67l+ttAKZug6gUqJSJxC5xy8Z6M4TDBaAIO2HDRQZeYMpiSM2RuMdsV6IUrXys1YHmcUBxx0q8m2uwrWRqlDygN2Gi1Ib8Z9dT79UmMY7Ltwb42dbw0rkuXVmKq45mVneRJ+qkC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773858956; c=relaxed/simple;
	bh=FHbqUJz1qg98S1kFnBdMI5LurL2tKtVKMf2OieQFW/U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XbYFMW0iM2GDpyVcropFN4TqRDwXh2R+qBtPkHhKXXzEnt1llGgXCijfvmdGuh7Iwl3MkjXPkHDfmTlW3VKtqn5cfbnulkhQXr5IJ/7KyYrs78LjaSz7yyLPJJPcoRzh5Ug3yqBeR389TUrLdCn+L7+ZCPIWfyrO/mIkXEhSlX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HYZGVDQe; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-12732165d1eso301783c88.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 11:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773858951; x=1774463751; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MGYjogK2bqnTZSNWLTogcS+9CBE/p5Q+uf/wMeebhBo=;
        b=HYZGVDQeos8Xx79PoZOphhSOCAiRtveMov+4WjwIfA7pbwPPYn7ruS4me94SBEWLxd
         5ftt9crYK6mY65yexUdIIFSZW1Kw1nbNqDpvPhcOyvQd8jEFlK96j+5eTmBdY5rN8Qyg
         4rA7KGGE/Pg22J9VmMy6rCenqDgZkyRniVM5rX7uLAL0rr6bjYPvvajjcRk5QyR1waDy
         zNuS0ElHzP9PIVndyz4zTis0xmNEXy6rDIMJels0pSQ4IHe3sutSN50g66AjQyln+Mco
         uVEUY6N/2Xg44bwuYTdxcA/0N4HD7bPYf3+Q56wzYufwS4U+2j3BG+i2pnSawt5Sn7+h
         1/tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773858951; x=1774463751;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MGYjogK2bqnTZSNWLTogcS+9CBE/p5Q+uf/wMeebhBo=;
        b=dejUqlK4qy2SOIIQfWli9LV25wdoi700tlCrzrtrHBV80t3D/2tQoflKoxLCPUFfpC
         YYnT4SW0vnZQjpERzELPF7A5cnZSGcSUpBaWu5Ny0sIJOTXLOBm9tvEWmdDLeq/QPBrU
         IzoCyCbwqtZLd/IdMnJL9zsyfZjY1o5xnY/Yyszm4T72+tHwhoVu7rNLQWF6uUCsg8kX
         F1bphyW5T/BWaqUIN5kpcfR+qNaEbsD7AP4OZPP2aI0fC69gRCO70k5mgtFT3rG3PLoo
         gqH98HDMHU2LwYZWXu+boZr1KSjbv4QczgcikbPvUywL8taS3IktHv/WwYaVPNbcvgTC
         Md9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUpYhLPhOUHx9X8SeFWOpJsbbFxKQ2kZ16am/l3AW8kcHlLBBmC2IDE7h4B/raW0FLVV8xCWGox+zK/I3sB@vger.kernel.org
X-Gm-Message-State: AOJu0YyW/haY/R33Xq5yRohxxUxSJtyL/JNnBLSzy8J1oAciY8vnHnUb
	JhsrNOuX5U8ulLLBzEB7qca2SWsQnPKmo0ASvB07q6wBAwE9n7WjOyJz
X-Gm-Gg: ATEYQzzk4OCcbtT/IyrG8xv+HWKe24aR4fOL2LhEPrkBuVVZWPyzgOtkR3KcCEZB1pz
	qgy2oYShX+ZNoWUsLlXLW7zn70v1AjdiQkLpaH6tkJrvEs42x61qepGGhFHtsqUvvJgVPojXEPr
	7eaiy8ZuyrCmZFrbk4eWOFxLYHVF4jgPsRMrqIn8L3n4ucW1BwqcYzW/gCMsFEZkoBzsNPxPYQY
	L3mjMZqpXLUGF+Ux0Q9OvVCip4+LiOJ83FQQcZEd2lZHYpCYO4dqD88nzfDC+iNyuJ5JLvR96XI
	i4Z5gFeU6nOOKlLipRoEPllDeKSMdtyTyXVgSvonvZh1R2j6IBjOxtZndF0049ztKM3uBCgaTgq
	5pgpV/ybJQCtxx03itQBOhfdgjeCehsGLrd78dp7NxO8UgLsbmiTrZcnfMlnc2xa4ueY+GN5ju3
	TLIjHx3BTaRwFNbn43GRl0vCfgl9WHB54RonUPTKMv8t2mOyihca7IWJM/yJLxy7Mrh5Yw49yMw
	LKaHg==
X-Received: by 2002:a05:7022:239a:b0:127:9cad:1a65 with SMTP id a92af1059eb24-1299ba99df9mr2479792c88.14.1773858950492;
        Wed, 18 Mar 2026 11:35:50 -0700 (PDT)
Received: from [192.168.68.65] (104-12-136-65.lightspeed.irvnca.sbcglobal.net. [104.12.136.65])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-129a7153051sm4145211c88.0.2026.03.18.11.35.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 11:35:50 -0700 (PDT)
Message-ID: <22b1b8f1-b87d-4f34-9e04-0a39758bfe15@gmail.com>
Date: Wed, 18 Mar 2026 11:35:48 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: leds: rt8515: Support single-GPIO flash
 ICs with unlock gate
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20260306-expressatt_camera_flash-v1-0-b1996f7cdfdd@gmail.com>
 <20260306-expressatt_camera_flash-v1-1-b1996f7cdfdd@gmail.com>
 <20260307-fennec-of-nonstop-hurricane-de4f97@quoll>
Content-Language: en-US
From: Rudraksha Gupta <guptarud@gmail.com>
In-Reply-To: <20260307-fennec-of-nonstop-hurricane-de4f97@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-98554-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guptarud@gmail.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: F161A2C1776
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 3/7/26 07:46, Krzysztof Kozlowski wrote:
> On Fri, Mar 06, 2026 at 04:58:02PM -0800, Rudraksha Gupta wrote:
>> Some flash ICs use the same one-wire pulse-count protocol as the RT8515
>> but have only a single GPIO line for both flash and torch modes, plus an
>> optional unlock gate (e.g. a PMIC MPP) that must be driven high before
>> the chip responds to the enable GPIO.
>>
>> Make ent-gpios optional and add an unlock-gpios property to support
>> these variants. Add a oneOf constraint requiring exactly one of
>> ent-gpios or unlock-gpios. Add a binding example showing the
>> single-GPIO configuration.
>>
>> Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
>> ---
>>   .../devicetree/bindings/leds/richtek,rt8515.yaml   | 36 +++++++++++++++++++++-
>>   1 file changed, 35 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/leds/richtek,rt8515.yaml b/Documentation/devicetree/bindings/leds/richtek,rt8515.yaml
>> index 0356371a6b01..820cf8c55090 100644
>> --- a/Documentation/devicetree/bindings/leds/richtek,rt8515.yaml
>> +++ b/Documentation/devicetree/bindings/leds/richtek,rt8515.yaml
>> @@ -15,6 +15,10 @@ description: |
>>     current for each mode is defined in hardware using two resistors
>>     RFS and RTS.
>>   
>> +  This driver also supports single-GPIO flash ICs that use the same
> Drop reference to driver and explain the hardware here.
>
>> +  one-wire pulse-count protocol on one line for both flash and torch.
>> +  For these, only enf-gpios is required.
>> +
>>   properties:
>>     compatible:
>>       const: richtek,rt8515
>> @@ -26,6 +30,14 @@ properties:
>>     ent-gpios:
>>       maxItems: 1
>>       description: A connection to the 'ENT' (enable torch) pin.
>> +      Optional for single-GPIO flash ICs where enf-gpios is used for
>> +      both flash and torch modes.
> So what happens with ENT GPIO on such boards? How is it connected?

Hello Krzysztof,

Thanks for these comments. I have addressed these in v2

Rudraksha

>
> Best regards,
> Krzysztof
>

