Return-Path: <linux-arm-msm+bounces-97096-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id koF5M7P8sWkAHwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97096-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 00:37:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1033E26B622
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 00:37:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6E7AE306FE38
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 23:37:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFE823A75A1;
	Wed, 11 Mar 2026 23:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ps+yJ8fB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 974583A759A
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 23:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773272237; cv=none; b=sMigYJAmadFctxLu2jIoblt0KtlgzlUYrNhymKilJs6uvQGJfhZBjHPVpAscKVmpn660V1z5UAg+WOI6jsJdFzrSTSwBQ+h2CBfw4c9dCm+A/IYDDnWEaLbOZq4mDDANNPtITzKGDuhNHF9OmTwq0fS1fo2UrljSV9uX+0AdOuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773272237; c=relaxed/simple;
	bh=2eupapEfQNeHkUYEMcdS3p7DAYeAm6TzkamnfJ7DyWI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GJBFy3Okzl99ycr5t7/P4/hel0dTgg9Wf3tGai4AwVgSUMNoBN1nIUhzKXuRLmKXNs+uMhpRhzTmyCCPnEeIjXingLBmjdZyAiiVIGqynKeduPcvRlBwf4/lx4RkPVisn9OZBAGOuqZbNpaYkAyCWibEgUOrB+m6hZlCOjBnl6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ps+yJ8fB; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso3352315e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 16:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773272234; x=1773877034; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xz4JhHpkfUtvuhugX98hnbwV87DiIdMI+Eh59bG8IRE=;
        b=ps+yJ8fBp1nhZE28AcPJ6JyWkKdM4ixkKfpfWFfJN7bCO30rQt9aA+BjJlTRyg2SXi
         6lkNXP0qShkkMuZlW5O1e3Xzxu2qx7iEG+twb5wIXgQFLz+vBB8nfBVArFa0IoqSEHvc
         fuzmYeM4CnD3Dt16EolAIdqiYnk56T4MGK0UpTmJZZbA3t+urUTuCA/Fpq4FDoKPCAU+
         piNBGPtdLhQ7cK9xP82tzZ8M2qBqXNVD1/KlPIkjQvsKjPDVQjeddErHce2qpBfpY+dn
         jhsO4VZ1yOOq1j51XdftPUKOZ3MEkZhdpczwa8BMVcCfeWV3gYmJCrmCWfST8nkzrAef
         BYJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773272234; x=1773877034;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xz4JhHpkfUtvuhugX98hnbwV87DiIdMI+Eh59bG8IRE=;
        b=NX18YXT4Z6ojN6sPm/nmaoEQcrDeQE+TNB7AuhT/TOyax1N+BfPxTMaHFWUmVyJAYR
         4wFqGoQhZWKpvPYc8FjLjLA4l0IswZy5LTs4DAsgIzqfRcIPbRUyi8OPr9JQGRiUk96V
         ZAEUfdxD/D2SSkZ0l+Pu2XzWdqthv4GZgN3C4dZmtzt0A5VVHA/wLdwFzmZTYaSYBfOS
         OEfqpF0jPwOIOpsZqBCpElXZW6iXXpV1bGEAag92HoHON3MoV68c+Ndafdu0ZK6IUCs3
         wRmhc+Jq3ieimsOTAFWMCHaU+N9Z+qz8Q0QWljhlwwXJYbnhTM+qtyxWEGj41BKlfOmS
         Vk9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUVrdMYpFLfoE9aUmD6F58J73IanQxDQKIEeapzQKABQN+FBbLyno1eyjjojoO9/EHyrnZvvOFHvxvNV21O@vger.kernel.org
X-Gm-Message-State: AOJu0YwnwCsP04vHdBM3Zi9W4nZVK9iHPawybgITuQxTooLvsWYFoEAe
	3cnrLfNNn/jEA7uZvgow+tdsbM50ZfaE8yZ6Lik5eb4VRmh3wu+peETvTm7P0gHUkL0=
X-Gm-Gg: ATEYQzx+fC+v52M45YPiuU10vjx/MUJNes1Ae1QSNfI28Gw2+CpyKDJnFerbhnmMefX
	hWNRqL0Mdkddg4ifJ4Fej/p18GiWhrCtdK+MMKuZNck+Rk9DdtuN9VIaUVtWhWofphDtXHzZaYv
	M0VseicGm4+R/EZ4cFyS+FlIMBtxlf9ZRvcXsGHaUA+BRP/DJkIOkkjDynPpodoekpxnQXmoOng
	no5CnyXSLGFqgAXK1/UWGBhRJ4tNHXso1V7vmzU0ECS+6sFW5mYZAYv6yKZ2ZvgCD/C3Y0OEE2e
	sXxVBLAZd8iYDMc4OCZOJB9zwxIkTJtYLbzOIJagBh6Gaj5RuJff0OvAKdSBqI8QkxpTmuZAgeb
	iFmu3zktKZ8SZXCm4e7jwYeY3ZpdKgarVkGz6Eu8EDFskGYymltWl4hErtiC2/Bsgytr+/tvu8/
	D8sN4ssEZ6VfEqVc1UJ9CrUsGu7/VL73sm0w==
X-Received: by 2002:a05:600c:6085:b0:485:3d9f:5510 with SMTP id 5b1f17b1804b1-4854b10a1f5mr74417745e9.19.1773272233921;
        Wed, 11 Mar 2026 16:37:13 -0700 (PDT)
Received: from [192.168.0.101] ([109.77.88.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe1a737csm2657859f8f.10.2026.03.11.16.37.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 16:37:13 -0700 (PDT)
Message-ID: <223e0295-1819-4234-90d9-7db440f25be3@linaro.org>
Date: Wed, 11 Mar 2026 23:37:11 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv2] usb: typec: qcom-pmic-typec: simplify allocation
To: Rosen Penev <rosenp@gmail.com>, linux-usb@vger.kernel.org
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kees Cook
 <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 "open list:QUALCOMM TYPEC PORT MANAGER DRIVER"
 <linux-arm-msm@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 open "list:KERNEL" HARDENING "(not" covered by other
 "areas):Keyword:b__counted_by(_le|_be)?b" <linux-hardening@vger.kernel.org>
References: <20260311232347.18257-1-rosenp@gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260311232347.18257-1-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	TAGGED_FROM(0.00)[bounces-97096-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:dkim,linaro.org:mid]
X-Rspamd-Queue-Id: 1033E26B622
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 11/03/2026 23:23, Rosen Penev wrote:
> Change kzalloc + kcalloc to just kzalloc with a flexible array member.
> 
> Add __counted_by for extra runtime analysis when requested.
> 
> Move counting assignment immediately after allocation as required by
> __counted_by.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Hi Rosen.

Thanks for your patch.

I have the same feedback as Greg gave you previously on this.

Each line-item in your log should really be its own patch i.e. v3 should 
be three patches

[PATCH v3 1/3] Change kzalloc + kcalloc to just kzalloc with a flexible 
array member.

[PATCH v3 2/3] Add __counted_by for extra runtime analysis when requested.

[PATCH v3 3/3] Move counting assignment immediately after allocation as 
required by __counted_by.

Or something pretty close to that.

There are several reasons for that

1. Bisectability
    The ability to more easily bisect patches.

2. Logical separation
    If a change deserves its own line-item in a patch
    then that change almost certainly deserves its own patch.

3. Mixing stuff up in a big patch is confusing
    I look at a commit log and see lots of things going on in one go.
    I as a reviewer or say someone tracking -stable and deciding which
    patches to pull into my tree can't look at a patch a "just know" what
    it is doing.

So v3 should please

- Have a cover letter
- Contain three patches one for each logical change

Oh and reason 4 is the most important !

Patch count bragging rights !

---
bod

