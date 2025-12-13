Return-Path: <linux-arm-msm+bounces-85139-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id CF16FCBA627
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Dec 2025 07:48:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3221F30011B2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Dec 2025 06:48:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41E5E1DF25C;
	Sat, 13 Dec 2025 06:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V/rv/PvX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79FFA70808
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Dec 2025 06:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765608525; cv=none; b=NqLdwl+q8ye25a1zLhCbtbZfyHGv85rzxCde2X1Jh/QD3g4yqIJowXJJ0r+l9OO0XNnSzJWHoNIqi5UG6ZUtH2gi5+NxbyI/TGvjT+/RR4F4GjmuJxPGD1lFB8Ckf+sAEWpaS+0EmyTS4xMeikrYfiz8cpmovA8htdMlBm1SizY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765608525; c=relaxed/simple;
	bh=OSPLFg4W3QR5ByFn0Z+25izVWJy4kGkKLbWih19PHZA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nmTfwaRrsK5yIW5UVa02fAUIQWUZtfXfUSCVz9nVcV/bvyVI/jRGareeys770LZwc2sXCG6kb57FgTcSMhQ9Yc9d3JA6HHOuyFBVrlvOqn917k3B9CCIN7UTXZ3gPQKn3wNxuJFOIOh69f8KDq70MR2buEifuuR7FP0AyG7/k8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V/rv/PvX; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7b89c1ce9easo2211580b3a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Dec 2025 22:48:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765608523; x=1766213323; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OSPLFg4W3QR5ByFn0Z+25izVWJy4kGkKLbWih19PHZA=;
        b=V/rv/PvXawv5NhhkAlMigL5A3ymTVqMjUYFcMQfTez04D7GoxsMFc3nHxvrRxu0+Bx
         q/ag4Oils+4vYzzLAYkocXSctwh95tJIk7AfzCjE9g4pD/crZacOKcamExzMPbbSjgdU
         KpahdKnZjsNP57dPYv7jaInJnq5iLcW9+0ZWmvT2OozAB0E1wIJitV0Dv73h8kHCl6Je
         gm6vdMhqnhnrGP6jyc/R+pcvBWKNWf5P9e8+76Dii1eOMderlpgnbFv5KVQKR9ZZP1Q2
         +7GgkROGYw6lLjhmPRcJU5vV3NKGCV2mkB6SwBClNERHoV9nzTfyhH/Rn2nie3gdTSjk
         kIXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765608523; x=1766213323;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OSPLFg4W3QR5ByFn0Z+25izVWJy4kGkKLbWih19PHZA=;
        b=hjkpHbbffozDd/asyUxhYLcCDWAgM5Oh9rtwBgPswm7zLUWKmBnYtx/uyU1eTsdoff
         fds6E5P6KUp4t1ipKULlrxvM+JhF4FceOMm3bwNFAY8/thmXOpHFDJYl7gsYbkMhoAW1
         2fXv1wPGPleMkwr04ygRFrBxndVwIIOQBYw4Nd6ys/b67kEJGK8iSxbfG6SLWV8OP6Wd
         HqYRckGkqg9hP9ZHiO2BWwa42g76079IGNbFS3yYRUtPAuoqoeNHvb5hkajUUte8PcZ5
         DWTzazgeoICcJLxyzoDkA+iXMkCOYYznMZODvQDTOJXS8RTc69RTUmFtMTLNCtvnvoHC
         ZeDg==
X-Gm-Message-State: AOJu0YyI3zSKr1WM8XKUJvXPx7sehPhplm0Rv9KUJ0AOTafb8ZVfUenI
	riyOAykxjCtNsUp1BLBYcu/I5PabOZsSRAb8kGae127GaRjXl2yfHw+srHfsCUWcy/YB9RXgnLj
	kN3py1g8=
X-Gm-Gg: AY/fxX5DXR6srJUUGO3OVBHgBrmEJCLJKNLy/Tsm/rApT1ueInFN2+f23i3qSuDYOYq
	GcyBSzTVxapcb7Fp8Q2WnabqjBbCOGccfToEY68aX5928b75TBzeLp4mQPE75NZ7i19gpKAL+Um
	otZK+iMK9uDAwBaitUsv2U5Kg+MqVLRktOIc8R1CJwfZInysQZfAze5FaAz9oPMFfOwLIe9a7Km
	tMMe/nO1Bb23/f1lfvXN7Gd6DU510FzlTCNbhoQMknmT3gvAv2f0ozUQknKgXTYQpB+nu2DSkq8
	b/7mgKOXaM94Uv09p27TjAxZk3Tcwo1KliHIX+/4fHjxpgZmp4KFecX24iyQep4IQWU8bqT6Kl2
	1pXhovIgV/H4GfMJqpbLUdczPo3+Q8QFLbpZsOoad2Rp5E9l0BOvTzqm8xPueCCER5jNwrMWUio
	laNpuoUnvSM07vu+b2Z1G6KHgQ/Gxp1l8otFGJPEWfQ345LB4tBqJ7TQQ2lL85FQ==
X-Google-Smtp-Source: AGHT+IHwMXPg7Qn0Ef9xWbq83SFpsB1sFhZLa5C8vjkRdWjkXJZFN6bz1qhctibBoHiLjB/xaNqEfg==
X-Received: by 2002:a05:6a00:1c99:b0:7e8:4471:ae56 with SMTP id d2e1a72fcca58-7f6694a964bmr3530338b3a.34.1765608522549;
        Fri, 12 Dec 2025 22:48:42 -0800 (PST)
Received: from [10.200.3.203] (p99250-ipoefx.ipoe.ocn.ne.jp. [153.246.134.249])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7f4c4ab52aasm6927000b3a.38.2025.12.12.22.48.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Dec 2025 22:48:41 -0800 (PST)
Message-ID: <bf00eec5-e9fe-41df-b758-7601815b24a0@linaro.org>
Date: Sat, 13 Dec 2025 08:48:33 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/26] Introduce meminspect
To: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, tglx@linutronix.de, andersson@kernel.org,
 pmladek@suse.com, rdunlap@infradead.org, corbet@lwn.net, david@redhat.com,
 mhocko@suse.com
Cc: tudor.ambarus@linaro.org, mukesh.ojha@oss.qualcomm.com,
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org,
 jonechou@google.com, rostedt@goodmis.org, linux-doc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-arch@vger.kernel.org, tony.luck@intel.com, kees@kernel.org,
 Trilok Soni <tsoni@quicinc.com>, Kaushal Kumar <kaushalk@qti.qualcomm.com>,
 Shiraz Hashim <shashim@qti.qualcomm.com>,
 Peter Griffin <peter.griffin@linaro.org>, stephen.s.brennan@oracle.com,
 Will McVicker <willmcvicker@google.com>,
 "stefan.schmidt@linaro.org" <stefan.schmidt@linaro.org>
References: <20251119154427.1033475-1-eugen.hristev@linaro.org>
From: Eugen Hristev <eugen.hristev@linaro.org>
Content-Language: en-US
In-Reply-To: <20251119154427.1033475-1-eugen.hristev@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/19/25 17:44, Eugen Hristev wrote:
> meminspect is a mechanism which allows the kernel to mark specific memory
> areas for memory dumping or specific inspection, statistics, usage.
> Once regions are marked, meminspect keeps an internal list with the regions
> in a dedicated table.

[...]


> I will present this version at Plumbers conference in Tokyo on December 13th:
> https://lpc.events/event/19/contributions/2080/
> I am eager to discuss it there face to face.

Summary of the discussions at LPC talk on Dec 13th:

One main idea on the static variables annotation was to do some linker
magic, to create a list of variables in the tree, that would be parsed
by some script, the addresses and sizes would be then stored into the
dedicated section at the script level, without having any C code change.
Pros: no C code change, Cons: it would be hidden/masked from the code,
easy to miss out, which might lead to people's variables being annotated
without them knowing

Another idea was to have variables directly stored in a dedicated
section which would be added to the table.
e.g. static int __attribute(section (...)) nr_irqs;
Pros: no more meminspect section Cons: have to keep all interesting
variables in a separate section, which might not be okay for everyone.

On dynamic memory, the memblock flag marking did not receive any obvious
NAKs.

On dynamic memory that is bigger in size than one page, as the table
entries are registered by virtual address, this would be non-contiguous
in physical memory. How is this solved?
-> At the moment it's left for the consumer drivers to handle this
situation. If the region is a VA and the size > PAGE_SIZE, then the
driver needs to handle the way it handles it. Maybe the driver that
parses the entry needs to convert it into multiple contiguous entries,
or just have virtual address is enough. The inspection table does not
enforce or limit the entries to contiguous entries only.

On the traverse/notifier system, the implementation did not receive any
obvious NAKs

General comments:

Trilok Soni from Qualcomm mentioned they will be using this into their
software deliveries in production.

Someone suggested to have some mechanism to block specific data from
being added to the inspection table as being sensitive non-inspectable
data.
[Eugen]: Still have to figure out how that could be done. Stuff is not
being added to the table by default.

Another comment was about what use case there is in mind, is this for
servers, or for confidential computing, because each different use case
might have different requirements, like ignoring some regions is an
option in one case, but bloating the table in another case might not be
fine.
[Eugen]: The meminspect scenario should cover all cases and not be too
specific. If it is generic enough and customizable enough to care for
everyone's needs then I consider it being a success. It should not
specialize in neither of these two different cases, but rather be
tailored by each use case to provide the mandatory requirements for that
case.

Another comment mentioned that this usecase does not apply to many
people due to firmware or specific hardware needed.
[Eugen]: one interesting proposed usecase is to have a pstore
driver/implementation that would traverse the inspection table at panic
handler time, then gather data from there to store in the pstore
(ramoops, mtdoops or whatever backend) and have it available to the
userspace after reboot. This would be a nice use case that does not
require firmware nor specific hardware, just pstore backend support.

Ending note was whether this implementation is going in a good direction
and what would be the way to having it moving upstream.

Thanks everyone who attended and came up with ideas and comments.
There are a few comments which I may have missed, so please feel free to
reply to this email to start a discussion thread on the topic you are
interested in.

Eugen

