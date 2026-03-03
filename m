Return-Path: <linux-arm-msm+bounces-95180-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eKEyBGEUp2ncdQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95180-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 18:03:29 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A1031F45D7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 18:03:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7844F3028EF5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 16:57:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B962E3DBD66;
	Tue,  3 Mar 2026 16:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HvwwAKDA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 960813AE194
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Mar 2026 16:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772557071; cv=none; b=oT5EyZ6kFY2y/Vq+OdlV2xp4voRCFZ9TlwspsNbPMVeKGHbQcTAmTxFUqrjGGzkpDwHi13Ng0xt4O0Hk2CUeb7EqZXzppreVuf3pl6UU8aCAQq8jmxAlLYoO9hJpa4gd37O7iohgci+ACFpSBnLl3wAWVtQB1PkIASrUXMpEz8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772557071; c=relaxed/simple;
	bh=3/GzSmoRFQsgGZDBWOEZf5WA45dc4iHal7c2SQqyU/M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dhaj0d20F4Xy+bXbphrj0WhgdKGhOP8dJR6SRf99RS7YB9lR9envDLvubEArkoZRzA3byoaeXkEnkDOp3/Vi1wkltiSatVoIKRENLUOAMrGyJRfa2ZmkEWl0ciZNpWXAaY/ADmF0x+RO6wc6EIHvms5CkMYHy5VUQxL3/S7dieE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HvwwAKDA; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c736261ee8dso771338a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 08:57:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772557070; x=1773161870; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=DV/HSQAamVa6HSuuaGYt1Sx9aCryyCjzy9hIsHP5+oE=;
        b=HvwwAKDARrPFqD3SS5xzq/r5mXo7NoKE7T6BD9dD8EDEFQAuJqiXbPvOGTZ7zuexG+
         p4++vojTrsNVrp7npf+SU6Nw78R1rhpXT8fcWBzC+YBecRbmnYKdZXDoE12WbFRid0zG
         eoeRH77r9zOan6tV+X89Ph36kU6ygpjYsrWzcc1zfYScYeiAnDtXXMGoHrh9+03Twx/k
         nKTXQQYYfBdhyQgvm5xhqY/1Vq+jz1jHoqNOkXXD/udJGDS4sxQ2keR2sNcF07T+ogoa
         YkzxBu72PM8Eyjh6GQnOjQQtRaHDztyY5J2WrUXUEXm+3CAPvv0Tuz3Wvcx/T5USEVAu
         6aQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772557070; x=1773161870;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DV/HSQAamVa6HSuuaGYt1Sx9aCryyCjzy9hIsHP5+oE=;
        b=mPvkuj/7ZNN6bkRoLA7/aC0Uzfx8MNtka22DNXsN96Y4Vo+R3N2qxmVEK6dZBAJQvU
         6gQvmvefPfgpbKKzhYDVEYr4R1eSEv9akoRB01cAjbqjiaMwih6OYcZB/bnuqCYlHUiS
         aUOhvZmQraLG0iIpbvo0wfmMOmXA/bqICj/aoxxioyLeRy4HgUoXO7PPC0ZTiH+3tAuQ
         odhXg1ix6rRclCwtpEJ1QBNtv/T6wg2zUX8kj5qqQ8ohJlaK0e4RsCRd7n0PVvpyUUYP
         cWmRr99npMCjMYE02wyS/S9fDL12GnXZR6IwgIvMhRFdA8REGWJCJmIhacW/t9Lx5awn
         uwig==
X-Forwarded-Encrypted: i=1; AJvYcCUwA8+RO4sjZicO4OodoQ+razvt12BY0KbuVKwYBj+AbjUbZD9DkRhzmk97QpaoV42WOnOWQB+hXnGV1AZm@vger.kernel.org
X-Gm-Message-State: AOJu0YybPAvVG/Ks85+lFf20OHOAvEABXyjcUd5gH2qpe8bBWe+oPJZM
	iqFEJjD/OK8tesK/IvGT9rg3OAaIYe5d/4wBFgp6OYsNLJY8gvXWRbEb
X-Gm-Gg: ATEYQzxsKrFBrETiZGKRE4RjYLblQi3aS9gDwlZJ5u1BhdmpVdtQpwTgpJZBb0iJU1y
	ixvtyeNAY6fI+VL1Wo19m4Xhj2z9kpKXIHLrk0dM9yfTbQBFi+IHVxRYPAsNV5MDMX6nVcb+c8p
	krLhwU6bNANsjeXkM7D0ENESZrzJTb7XcJjSXX1YbNdt0KLpnILHPMzu8hP6MYRSo1MM8Nu0QIT
	jNaCKbySm3nfJVMe4rmzFCg+898VfEtRnLZzZtKsGRUH4nsHbtI37VMUDsYo05FhPJsO3+eC+6b
	C4EWFjmMXuliN3fs/CQQiJ0QtlYYNdJ0Qo6+1nGCiVwEOS9R/H/fP0xztvsG36bI73URTIS0fu8
	6vYHUQLhy44cojJA9kmPPHaNsDmQYUozIY2gwNhVla9+BtDa84zZRHvhu7yba+xlrHUYBtWn0Vm
	dXPgljf4NCp3dZy7dOxrJl6AhHw1IfqR3eyIoHbM/LtWksQ5dyQyojX19Mt9XwyOYcfu0DasxLu
	ilrvQSRrEw=
X-Received: by 2002:a17:903:2f89:b0:2ae:6317:56e3 with SMTP id d9443c01a7336-2ae63175cb8mr20707785ad.28.1772557069742;
        Tue, 03 Mar 2026 08:57:49 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae4802645bsm83989515ad.12.2026.03.03.08.57.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 08:57:49 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <4a7ac923-0f1a-431f-a029-8843a8eddca3@roeck-us.net>
Date: Tue, 3 Mar 2026 08:57:47 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] hwmon: axi-fan: don't use driver_override as IRQ
 name
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, hanguidong02@gmail.com,
 ysato@users.sourceforge.jp, dalias@libc.org, glaubitz@physik.fu-berlin.de,
 abelvesa@kernel.org, srini@kernel.org, s.nawrocki@samsung.com,
 nuno.sa@analog.com, driver-core@lists.linux.dev,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-sh@vger.kernel.org,
 Guenter Roeck <groeck7@gmail.com>
References: <20260303115720.48783-1-dakr@kernel.org>
 <20260303115720.48783-4-dakr@kernel.org>
 <b46c5757-b67d-4949-b8d8-54b799464b5d@roeck-us.net>
 <DGTACERFTTCV.29XON9ZLYAEQL@kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <DGTACERFTTCV.29XON9ZLYAEQL@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 5A1031F45D7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95180-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,gmail.com,users.sourceforge.jp,libc.org,physik.fu-berlin.de,samsung.com,analog.com,lists.linux.dev,vger.kernel.org];
	DMARC_NA(0.00)[roeck-us.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@roeck-us.net,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[analog.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On 3/3/26 08:25, Danilo Krummrich wrote:
> On Tue Mar 3, 2026 at 5:23 PM CET, Guenter Roeck wrote:
>> On Tue, Mar 03, 2026 at 12:53:20PM +0100, Danilo Krummrich wrote:
>>> Do not use driver_override as IRQ name, as it is not guaranteed to point
>>> to a valid string; use NULL instead (which makes the devm IRQ helpers
>>> use dev_name()).
>>>
>>> Fixes: 8412b410fa5e ("hwmon: Support ADI Fan Control IP")
>>> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
>>> Reviewed-by: Nuno Sá <nuno.sa@analog.com>
>>
>> Applied.
> 
> I need this patch in the driver-core tree, otherwise I can't land patch 4 of
> this series [1]. :(
> 
> Any chance you can drop it from your tree?
> 
> [1] https://lore.kernel.org/driver-core/20260303115720.48783-5-dakr@kernel.org/
> 

Sure, I'll drop it. Please add

Acked-by: Guenter Roeck <linux@roeck-us.net>

Thanks,
Guenter


