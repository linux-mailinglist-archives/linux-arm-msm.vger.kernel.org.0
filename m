Return-Path: <linux-arm-msm+bounces-110861-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TBtTIr1XH2o3kwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110861-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 00:22:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E604632651
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 00:22:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=dL3AdcYA;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-110861-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-110861-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 817263007234
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2026 22:22:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41ABC3B6C1D;
	Tue,  2 Jun 2026 22:22:46 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9C72E173B
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jun 2026 22:22:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780438966; cv=none; b=OrdRqc77iLwq4v8k5dU4E3ELvqO1hf/tcG+caFDt4PDbK1WgkV1wqny6fefhEIPZvql4uf8I/fEEbW/HyT+Wg6chcYO9cur6+jzm2sIx+Lzzf2R3wW7x1eU81oPzIS684Aa5GzpDMokGRZd8j2CT26dR0pLQpsAJgimpwEac+tY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780438966; c=relaxed/simple;
	bh=XNUExCvA+WARuUW8BQZoPl41BM6NXl/RrTpIJO+J1zA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cXVo6xrj7DAtSn2e8NvoANuvIJc/ymur9ATfMbN2E3xYbtsykLEpDtdKzr/bcJFocGAy8yw0P8X7ukVpZ0zMFWB8ZJRabrOd4Wn64PZJLEoCvb7LfdrZ62NTFayZFyadkH3M9zi+Sj1P8o3ZZFeFXjRqeTsGc6x2YExHmBToybk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dL3AdcYA; arc=none smtp.client-ip=209.85.128.54
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4905529b933so94419325e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 15:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780438963; x=1781043763; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C5YMLNp4uCEpkwe9D6P+mENG3LiY0e9ha51X9dT+gkc=;
        b=dL3AdcYA6/iHoD9LfCqAVpxuTI4KVU1glkBFbUTSAWJQdeOoym93DIDSGAoAx8/J8a
         GDejkzXlm7y39wOEeGvs+NFVJBNkYB8P7oH4EiFJqyLlHLP+YgakLnrnCET7SXLEgx+A
         2Z8aEZlnxZUUkdGeD6b6Z1PoSYnO+vOjtDkz2wVZWJY+vdw2FtMnuZRejCDNpbk8XM9v
         6z0x2rrihVglxdvSx7O2CtrUpyygcbo5SKiNl/WOfEraTcXLeHpWVv1O7lZZFOWwEZcZ
         YRN7DzhmXRbsrPu6JjbLChMrEpAUJFjwjcvxIsOiBhy8wrmN79zXvuQc8FOHsPvP1TOC
         2PIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780438963; x=1781043763;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C5YMLNp4uCEpkwe9D6P+mENG3LiY0e9ha51X9dT+gkc=;
        b=LNDfZX5OABSsN08iIZCBR2tcLpOsWOJevoA++bgQKwYY++4UO6A1ix6ohA7jgpXLQ+
         SwjO+8u3GceLitGKURi4299VToMd4ZtpwkF5JCxM1AYR9Jlua3NPTNPw6HBSMi0eV6Ys
         WqvPBGk74Xb0yw3Okrcvf5Y1VznIiat6Ng6MDsnIqBazznOM9mpmDxO8bWmhR/cRw1Un
         iTwyMyRhKwfxsS++OJRyOqG98jHmPlrYoZfeBTDSJCr+TCPpkqZ4MdQz/4lMGCC6YcO2
         55z5FpFerZGoNpSpyMBi9nPnyJ/7bdo2eqZ5Ash9N+6KI7pz44WhCHfgnKgPLDL5Iq3r
         OvtQ==
X-Forwarded-Encrypted: i=1; AFNElJ898BCg1B2Gns8Tr7Q7STZKDhOHDZHz4t0L0XB3bCovQr3psptMXiH9jd+TLAUNJCRVFAXwbSHIg2Iyucgu@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6t9rUUHnfrw53uIMWidMHG9wMz1prn2i6b5WGjn0+CqEJFcvQ
	LvGFKys2am92lc0UYnHh2mjnOaWYzsA3mceEUodIJwBwxz7QaPsfbmN2Stq+WVUoKoo=
X-Gm-Gg: Acq92OHar+O0ozIMIeSneqq2Ex4zoOqOsRRFX7eAA4HCOv3dupvpudhayWE8sER8m8a
	UvemkQBHvNu0b0yNgE0dcJ2I6Ndef05/2Q/rS7ZQNoDnQXxh9MYCEUukJzZXDsBM5goIX2g0PVu
	yoqBY+MVws9J+n6E7EFPyfFdYrEHUldeGaZANaskmAGkZTrxopOipXuUEIzBp6ZHb76NXnGcKgI
	3rv+SiuPT91mz8OsQel3zfbKO1/4iUyD4bE+xaCUMh6cXd6BFv5KmfY128jqFgOCjBMQ0Ieq2+i
	xPOfcNHbWY137CQv0RFuhSUbnHW6gZje9cHIiCSUUVKU+VV20NM8SPsPE52qq7MIpGaZ3rzvSGL
	8l0SGzGwN6guKCOxioRC4jpt/CC0HJLXDtb2lLSpnoUWQEboVL8zt3AAbdVD1vw82YxJuwJ97bJ
	rWgJNV6If8fFgkJ7gccbprQEOPPtwSfCSnP3iIHCp0zeHB
X-Received: by 2002:a05:600c:1c1e:b0:48e:6db3:ff3a with SMTP id 5b1f17b1804b1-490b5eb137bmr11597745e9.16.1780438963385;
        Tue, 02 Jun 2026 15:22:43 -0700 (PDT)
Received: from [192.168.0.35] ([109.77.42.178])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b5885c26sm5064835e9.10.2026.06.02.15.22.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 15:22:42 -0700 (PDT)
Message-ID: <be3e1abe-5148-4247-930b-2e23164eea73@linaro.org>
Date: Tue, 2 Jun 2026 23:22:41 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bryan O'Donoghue <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260523-x1e-csi2-phy-v8-0-a85668459521@linaro.org>
 <20260523-x1e-csi2-phy-v8-2-a85668459521@linaro.org>
 <54904b61-222d-4600-ad4c-c03a9952d337@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <54904b61-222d-4600-ad4c-c03a9952d337@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110861-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vladimir.zapolskiy@linaro.org,m:vkoul@kernel.org,m:kishon@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neil.armstrong@linaro.org,m:bod@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linaro.org:mid,linaro.org:from_mime,linaro.org:dkim,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7E604632651

On 02/06/2026 23:07, Vladimir Zapolskiy wrote:
>> +    ret = fwnode_property_read_u32(ep, "clock-lanes", &clock_lane);
>> +    if (ret) {
>> +        clock_lane = CSI2_DEFAULT_CLK_LN;
>> +        dev_info(dev, "Using default clock-lane %d\n",
>> +             CSI2_DEFAULT_CLK_LN);
> 
> Why CSI2_DEFAULT_CLK_LN is set to 7, what does it mean and how is it used?
> 
> Since "7" is a meaningless number in the context, I believe it's 
> practically
> not used at all, and if so, 'clock-lanes' property should be just removed.

Documentation shows clock lane at lane 7.

Truthfully it makes no sense that the clock lane would genuinely be 
locked to lane 7 but the documentation does seem to suggest it.

Yes in fact I agree. clock-lanes can be reintroduced if someone can show 
hardware that supports/depends on it.

---
bod

