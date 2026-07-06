Return-Path: <linux-arm-msm+bounces-116743-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bMcnAb6LS2oBVQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116743-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 13:04:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D6570F9FC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 13:04:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=DRIBpWRj;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116743-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116743-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3CCBF31BFFAB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 10:14:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC7E23E92B5;
	Mon,  6 Jul 2026 10:12:27 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1ED93BBA09
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 10:12:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783332747; cv=none; b=Rd57fr93wP5Z7qLxc9SW3+UYIzTLe9a1CJp9ufZq4Fo/hliQ9ywuPUL2pgv0hX8Vdt55dn5QQZNLc1AmhtV46C40G+hMRUfXF7fpCSPX0gGJMKviY0seMO2F8hplBuvkrnRpORARGGFJpKGB3zOTWHrsexbFrF3mdDzoYeZHb7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783332747; c=relaxed/simple;
	bh=gqgOIGIN6sXR8VaiD0l5Q2LHm5agZmjYy0VZs9k+yjg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V1kdILxXfp1leccBl6ygR7xcwB8r6kW+8QcQwn/obQ+gTVOiMeuv9iYJRPBqSweR8hVNqAEWgcph+7Oyg6hnqmQajVDahXLWcUDmbHkkNvcpy4+WvNtAaIxpb7HGfphLUEPYVR/Qv9H1vd1NQztSo4EXS9F7Z2jIBBEe8iPpXFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DRIBpWRj; arc=none smtp.client-ip=209.85.208.42
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-698ab9aae16so4893200a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 03:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783332744; x=1783937544; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AqdiZptSXu3ipdJWB6QZa/nDkTWEQFhlT8vnJMgKmk4=;
        b=DRIBpWRjP6YIlMnqGcYDXJ+MeyD3nsqikVqkGuR//MWxv21DRVtdAje+7iHEXQM6wF
         l1ecU8eqR5Ggg8MjCn80bql/csRRt2hGBTTTbSudJG5Q9Waw0CWMDsf+GALBEnUiqCPs
         LUO+HQkplwRdHPevEt39FnHn0afp/ntUwN65pUtfgkZFFfpI22p7mb+LJxuIirRniumA
         uiMB3VeHVALtHIssz8Sk/ZtPNoj2OyWPmAHSa5DoYANBiS8u/u0485j1Uq+CrNxwhxJe
         6V2qABnaG8aA8nXlB11Q/s2FJ4Bv9KbzSmN01AF79BMbY25NwETuwZ/nHlGV9CAxsKjI
         aSyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783332744; x=1783937544;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AqdiZptSXu3ipdJWB6QZa/nDkTWEQFhlT8vnJMgKmk4=;
        b=fNIirQWaeiGa+XGeEDqW+jtaqG83otPATXAJXWSTlmRCPqU7zyPT7ZSTiimVhuE9tX
         MLos79/6+CqTfkBKFu2Kogecbh8r09m/swlk0QuNyPUmkMgC5REGre9J7qfsoT+9k23Z
         +G/nYgJZBZAqIP2RZPy9O4ocVns93Bxs9XJ83w1Jm1tvE9+OCodDiBT6fhgQ4d0QJyDC
         e/5TDksz9iJWye8308PlP5D1bSaEKvmNjDy5ZWCir7rvLw4YWKHVQAc71ILqNEYyFV7p
         iOggU5g3qC1A77dlGMMdC0C7AnaF0FDOI+UKcuuz3o+eFKe4xcYcZLlwOWu/Q+mwV07X
         Vx8g==
X-Forwarded-Encrypted: i=1; AHgh+Rp01avtr6VoM8WtTMUMaE5GDpURKX02UqpfD8N+4OHmeGRj8TItNCvbUl0NrNVfEPPuHwkPJ4Jju7HaiYtT@vger.kernel.org
X-Gm-Message-State: AOJu0YyeU9icWA1+1bNXNnEdIPouwU21lyC++K8Cq0sNxA9mFKz9Epn+
	vUiUxrgKeSJ5Dw2GtJ4E2JkbdE9xkRQKNZwemio2hUtqYg1z9R0YJmuF6ez4Vm2MSc4=
X-Gm-Gg: AfdE7cmv9kCvzkBN1qBHgi6mmSOfOGfWZ0UQARERH2MWGB76Om0CD3En1h9uOUpzC8m
	WBmhrRU9v6yMge6lMnysxO8ugUXhTFHz/R3hqkVYrGQM9NGxZgowPRPYjSlnMuF/IZcfiaXzW40
	aQjSb8LXdcBtt+nF9tILiJdfaAum5sv1jBpT2HwMcp8AaQXXcGq29vmTGtZ0yl/e5bYmmmCQsD/
	Cqn5QpcKxu63ganK47pjh43ebIIT2dKHkm2qpUAz84wcI5cvnBhYTqdA4xc0yLOv96p7L8piYFo
	TLGI7J7cJ3dGZwhNRRHpvrDKM17ThrGH49UaEGfx3f+2j8wNjN4npedi3QCzpTLlan3E37va7ri
	lssfcl26MyN3ojcUXRwtbfaCxjWYY0JZiE2UdS55mVy4/xvXIM4NLLnYwdaymsHFqJU9YP1Rm5v
	9OJmkNe7J2nOw/HlAvy5Vjlw7RW68JCQKvvSn4
X-Received: by 2002:a17:907:9454:b0:c0f:beeb:dbd8 with SMTP id a640c23a62f3a-c12e6b2e5ecmr395937066b.27.1783332744035;
        Mon, 06 Jul 2026 03:12:24 -0700 (PDT)
Received: from [192.168.0.101] ([109.77.44.220])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b6290972sm712364866b.41.2026.07.06.03.12.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 03:12:23 -0700 (PDT)
Message-ID: <68e59764-5a10-4abc-849c-14ea2d9ef76e@linaro.org>
Date: Mon, 6 Jul 2026 11:12:22 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] Add Qualcomm JPEG V4L2 encoder for SM8250
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
 linux-media@vger.kernel.org
Cc: vladimir.zapolskiy@linaro.org, loic.poulain@oss.qualcomm.com,
 mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116743-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:atanas.filipov@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,linaro.org:from_mime,linaro.org:dkim,linaro.org:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 57D6570F9FC

On 06/07/2026 08:11, Atanas Filipov wrote:
> Note: The handling of shared camera subsystem resources (power domains,
> interconnects) for child IP blocks is still an open design question.

Why ?

A device needs to vote on its own interconnect and power-domains on any 
bus. A sub-device of another device may wish to ramp a clock for 
whatever reason.

There is no "master" device in this block of devices - save perhaps for 
the CSID mux / wrappers on some of these parts.

We have shared resources like camera noc, system noc and external clocks.

Please include power-domains and interconnects.

---
bod

