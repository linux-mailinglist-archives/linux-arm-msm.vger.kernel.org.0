Return-Path: <linux-arm-msm+bounces-116909-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZDIUOLzJS2oYaQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116909-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 17:29:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B34712993
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 17:29:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=BQqkMLNq;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116909-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116909-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F21D231643C7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 14:49:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C96BD41A76F;
	Mon,  6 Jul 2026 14:49:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E22A73F484B
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 14:49:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783349363; cv=none; b=SgkaRqBGRJpI5ZkKeNeev2jjKKkVd6mjKblyV5wMvA1Vleeah0McAu6+CYnmvocIbMLYxELD6ze+g/399QLMppOCkrqJ9NiEBxxFH+cyubGUdPz4gq3gDNfBzkbKUgShn/fsMy/wLvG/bRFQuygUXP6m99aASPCp1Lfj7u/33qA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783349363; c=relaxed/simple;
	bh=Y/EJaKXUiPjtu9QsTiWTSVoWswUxIqzGEcw/GlNHd2w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bD2oIvri9TdLWOf24WKnnSRYUSqdVnZo5z1ILpVg75o/e7mx1M4eWmLpu/YcYG6WPX1stTF0oBfCJ2Xym23Ldi/cJF9Tz9Vh+O+z+4bfdRovCg47mBs52KAcURQ1rDfMH7RMrMAv8Kio0yLTbgg8lO5dUiBYpZ14xMeO8OWsEn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BQqkMLNq; arc=none smtp.client-ip=209.85.218.54
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c126fe7d0f3so402112466b.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 07:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783349360; x=1783954160; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aktuCm4dzDRogmLQjOyUeMLfDpXuAbLPNIV0dLlhxik=;
        b=BQqkMLNqTgpHJc4zSxFVhNzaVp6NFTut5WaQU5Ry9ge+m2itHkI73gWK/Du2Sx32H6
         gZvNCxKqMf9gjhFhIUtGK/+YGP5D11WLV0YOlFxoIwkVEAKo7Je7TLNmVRvT+HeL3JmU
         AAU6YnTQPc3KUoQwBC2l4HEZdp8n0qmpazgaXgxM4+XqFfLMcDQieovdkEqdOA1rjlYj
         gC2xXSW213QbxueaKXgkOutQhCvCJ0Guq+Jle0ZbNAGyHJvIhan2fASc15VN6CTipmsR
         MCYgHnJHDYJkEJID/SBiRNKF+yQWoqYl5czG6zLCD6LH43KwPpqSIedAB7BMG7q7viw7
         aXTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783349360; x=1783954160;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aktuCm4dzDRogmLQjOyUeMLfDpXuAbLPNIV0dLlhxik=;
        b=UlslrJ9QJDxrX2sKQQBaDyAbLK7g0oJXjWl1XYs2FV7xYkOvTqRegF9LgH+Gm1j3vx
         r3RhyukYnduKrd74S7xIaDpdADkqSoh6Mgz7DPI6AFt4YhyX+f0Z/A9jiMkEbyWtoq4i
         5crJe45tnQCpPn7rq7YvhtAHu/vLISEySo3ftYohdKAoqgbPWFZfK+5DY4KKtvG2DyTI
         SJggkCQ5ZNdtEr1GTlBPxkCkfLnSRlAQT7BVd/MO9KJwRLj6qH20f0x2MMu47Bh4gs4y
         Kcbb6FdydUKqz3ey+uvDdNAwAH+rLonG8WmbStudmwYskyCHNctK+BQyDU9jDhjM6+A/
         0yGA==
X-Forwarded-Encrypted: i=1; AHgh+RoaSP0WffcTHF1pY8TY+fiflXk9avuH3/Sb15U9541D9FqVqufYYGB9VnM/zxghNQ/yDztwTq5tpqapEUnM@vger.kernel.org
X-Gm-Message-State: AOJu0Yyf5lQwOqsVmx1gtlPUjaFjPbq8auuCSAixfrXdyVicV9uWhkuP
	5CmaVupqvfKogb1Et5tnTIyZM6Ir+XU61d0UbCp77DAc1L/Ye9ZOPNlWeEvPpGKlh4wN1oI0FNb
	VS5kn
X-Gm-Gg: AfdE7clOOVKs8tj2Iz9Uih9Kv1YVC6tMDk2CBlfO+K+lAI/ZmBuVbUxeU1peD6EDUdx
	nwZhO0BdNnN5nkKbvmb0wuXAE0V1RbFcesv5dh0ISlTV3YFscE5EyWyT6upsIN3Ui2vQDP90zfo
	0+PcgYOh5iujOBTDEihzJ9rfSV/c9tJw8Bf65oc3gNlyOs4xOP7Em7I4GjFmmSpiYMD2NOcFdLB
	TVV7a8Eb3UF8rTRrcIBTfckUFlnTqbUzQmpJUA1fGg8jQLx9ZnrJuDQ4ye4uZGKN+F+O4I5CNRn
	twbEcbJAMm/XJmwox5se1Qcv88HXH6E00odcaSoX8DsC0JL+VHh05OuwTIUBG8zgTxExlrSnQOd
	Jdbch2BdViWl3ym36bM36WHXfIRAx6eQoKJ3zhcFkZIjW174D7a4arc7AEBKqzX0L1j8wjFqcCY
	YzN1aJHjErcRGfy/DfwtC90H5R96kpl6IoQ/IB
X-Received: by 2002:a17:907:742:b0:c12:8331:bd6d with SMTP id a640c23a62f3a-c15a6907332mr59088666b.44.1783349360298;
        Mon, 06 Jul 2026 07:49:20 -0700 (PDT)
Received: from [192.168.0.101] ([109.77.44.220])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62f5c41sm768765266b.59.2026.07.06.07.49.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 07:49:19 -0700 (PDT)
Message-ID: <6e8ccebb-4eb8-479f-a589-6981b543fc2b@linaro.org>
Date: Mon, 6 Jul 2026 15:49:18 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] Add Qualcomm JPEG V4L2 encoder for SM8250
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Atanas Filipov <atanas.filipov@oss.qualcomm.com>, linux-media@vger.kernel.org
Cc: loic.poulain@oss.qualcomm.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <68e59764-5a10-4abc-849c-14ea2d9ef76e@linaro.org>
 <d74d7839-d126-427a-b151-ca895a27a83e@linaro.org>
 <437d1eb0-4495-406a-9501-b0515cfa3151@linaro.org>
 <e04cb9dc-76dd-4fa8-92f4-be002bf7ee8b@linaro.org>
 <8116c54e-4050-4e9d-b236-59d74846bd57@linaro.org>
 <48c3ce6b-1e2a-457c-93b2-8fbc0912dc20@linaro.org>
 <f3d148cc-496d-4301-af45-51d8921d7798@linaro.org>
 <3b0f7a36-05d7-417f-8efe-d6ba06488406@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <3b0f7a36-05d7-417f-8efe-d6ba06488406@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116909-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vladimir.zapolskiy@linaro.org,m:atanas.filipov@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:from_mime,linaro.org:email,linaro.org:mid,linaro.org:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 69B34712993

On 06/07/2026 15:35, Vladimir Zapolskiy wrote:
>> omitting power-domains for individual nodes is incorrect. Best practice
>> and in fact the _only_ practice that can work is to list power-domains,
> 
> Let's step back and discuss hardware description of CAMSS IPs, so far
> there is no point to jump to the practice.
> 
>> interconnects in the individual nodes themselves as - I've pointed out
>> multiple times now - those blocks have to ramp clocks and scale voltages
>> dependent on their particular use cases.
>>
> 
> Right, you've pointed it a few times, no surprise a straw man fallacy
> argument resembles as is, because it does not address or debate the
> initial point of concern [1], when the absolutely excessive complexity
> is proposed to be implemented for "CAMSS power island" and its IPs.
> 
> [1] https://lore.kernel.org/linux-media/e04cb9dc-76dd-4fa8-92f4- 
> be002bf7ee8b@linaro.org

You seem a little stuck on the term "CAMSS power island" the individual 
blocks within the CAMSS "island" are individually collapsible.

That is why they _must_ have their own power-domains.

The CamNoc is shared between these components but not outside. Hence it 
is more like a bus than a parent/child relationship.

As to your argument about complexity. I think that's subjective.

---
bod

