Return-Path: <linux-arm-msm+bounces-115630-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gVxtBiXmRGoq2woAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115630-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 12:04:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1BE6EBDBD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 12:04:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Z7znZD+Y;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115630-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115630-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1A9A0300E913
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 10:01:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D0E03F7A95;
	Wed,  1 Jul 2026 10:01:37 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1EB93BB9F4
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 10:01:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782900096; cv=none; b=LxC4Q0JXUdpuoxtMaWEoNcaYD05p/MmxpQOMn6nbh7XVSiRM04UFR5WDwEcNhPjYYGXtHooJrXLn7J4ilR+WOsAvQoYFl47a/hAoD5z7CU1kUWyKmSVM6IIWZH/kAasfSa7wP/CCr0FTyH0zYUX9P9jZptab/99h/65I8PX7Nx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782900096; c=relaxed/simple;
	bh=Wr7k6ms8w5cf7YX6QyMsz1ACCB5ddoRBekCXGDNdT8I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PmERkpAuKO6APU5u1tqX/r5WK3Nwrqj3Vpvyjl7++hPv4LfOv/jbo0nFzqT3tutmHzmMYlrO04lR0Y73n56Ma8BuXo91LCkjZPytMawWjQxdojES9ut1DRc2pLEGSswoDTktt1lvnCVzgSvVsBExFzEyoGriYB/abB9kJIPUYVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z7znZD+Y; arc=none smtp.client-ip=209.85.210.50
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7e9bc8dd61fso442406a34.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 03:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782900095; x=1783504895; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0mNQ3A3467geVX/IW6n7aAdW3fUUPOZsOtAnCuwuGrQ=;
        b=Z7znZD+YWTbZ6L9t5lYpv+TGZirrgWRV46H8GSVHr9rBT2cw5E2sccANpfb28kUPSt
         kLKIzrM1Qv5jWveSyLfloEW/r2qnjYxk85Rr2FavkLSrKIT4dYybv0gwZURRaOyRVi0Q
         3dM5BNeXAit2VLKE/G1w9UAuBj7R0cTh/MbtU/DJZsr/a6Wd1zwWRZyI3EnLRoTxsD6P
         Bq36zGp8xMv6JZjtI4BZ1fYcKot8Li26nXqbIUAwpw8pBQUCPyvQaeFDk1lVe6fUgnPf
         DMUmH5CUhUIRAGPmF8fgtJLovjkN/WC6mscQzOySm6OHbDG7CeIaVqatSixgF4P64BXc
         NIjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782900095; x=1783504895;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0mNQ3A3467geVX/IW6n7aAdW3fUUPOZsOtAnCuwuGrQ=;
        b=ZOhBGivm5H0M6qNtRjFqD45npDzcZk3N44JAh3TG3M2oc9WVTPYV9cJEIP/2k/+grH
         RKAGg6JmvqQIrXCKKOO5TJmX/kmMUZ02+bB2GBy2pAR1BWNCAUl4Ok28PpCB6Iy8rtey
         DUka/F+JfBTgdUupuM454CWYAmgxh9lE1P9EGeext/PtYsd78/ckBii6/Dq5BVsD0L0H
         SaPHRIe3VnDA5Busz2al0HMcd7J73mEmdkSTX0z3YeGhw/FtNtAqNF7MA1pImZQbDnfi
         2FgLAH4+A/lZyiVmXFiqZ7U0ztjg4IHGetJmTKqR1CjaMR63iY0Ey/GmkbeYRYFc+hJ/
         Romw==
X-Forwarded-Encrypted: i=1; AFNElJ+l8ZMrsu1TLUC0cT9Y8wfvfGhCY5x/8pXqmwXuN42jY3rb0esIGtc4DwVbmpsQaaB0FXTO6ozJGg2aYGc8@vger.kernel.org
X-Gm-Message-State: AOJu0YwYnIwofxoYLErskw6ZeY9iLQtJnp1LuVuMwyJK8qNryU/Q4kWQ
	tObWZ8zNSTjZsOjGZ9e5vbkaawDm7QzJ8ZTM0tCrl/zk5320xEzztftn
X-Gm-Gg: AfdE7ckXFwyL+/gX6z4NeJ9Vijy6us3qVvTxhfTTpTgbl0cmxvYp0TIHWAzAcbgGpVN
	rQwUUHiK2ApSYg8XRjxfXRnkQpmLsgx0n6ucJJijNWwv8E7qkEpsKAjopV0JKVK627ohdMw+fUr
	0DFuqaFBHC0mQtsB7OODZjei+D1SHEsX92Z+wZGJFfq+bQuvsGzvLix+BXhjmDgxXdVSlJmU50S
	hQyz+ymKfCVO5C2AmooOrgjVE1s5a7Hud4pjHpu9re7rxqAVIxeBscXK2X+J2JLVEdHLH4lnrpF
	9rWylqlHBqgvdLS8X6al24oZHp5TydMmk6RUW7Jhh9Xd5ntjQjNcEzLIpWfmVEZwNc9s8vSJDfR
	9BwVXyPtb8UvilN4ZvDieWvMPxDOWM0Srb7+Hndq5afhysrbV7/r5nKM2/BEDkp2KMJYT+s7M2T
	PSOFGn
X-Received: by 2002:a05:6830:8291:b0:7e9:ebfe:a0a7 with SMTP id 46e09a7af769-7eb5056d2c0mr91138a34.29.1782900094634;
        Wed, 01 Jul 2026 03:01:34 -0700 (PDT)
Received: from localhost ([74.80.182.83])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e9ebfec7easm4541881a34.12.2026.07.01.03.01.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 03:01:33 -0700 (PDT)
Date: Wed, 1 Jul 2026 13:01:24 +0300
From: Dan Carpenter <error27@gmail.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Vladimir Zapolskiy <vz@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: Return expected ENOMEM error on dynamic
 allocation failure
Message-ID: <akTldJur7GEgSkDD@stanley.mountain>
References: <20260629162127.3910603-1-vz@kernel.org>
 <39032914-3a66-43d9-885f-55f5d60da047@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <39032914-3a66-43d9-885f-55f5d60da047@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115630-lists,linux-arm-msm=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[error27@gmail.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:vz@kernel.org,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[error27@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:email,stanley.mountain:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AD1BE6EBDBD

On Tue, Jun 30, 2026 at 10:50:13AM +0200, Konrad Dybcio wrote:
> On 6/29/26 6:21 PM, Vladimir Zapolskiy wrote:
> > If a dynamic memory allocation fails, the returned error code in clock
> > controller driver probe functions on a few legacy platforms should be
> > set to -ENOMEM instead of -EINVAL.
> > 
> > Fixes: ee15faffef11 ("clk: qcom: common: Add API to register board clocks backwards compatibly")
> > Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
> > ---
> 
> Hm, I'dve assumed that static checkers would be able to find this pattern
> 
> +Dan do you still work on smatch nowadays? It doesn't seem to
> catch this one, but I think it'd be valuable to look for this pattern
> - AFAICS it only flags returning -1 instead of -ENOMEM but I can't
> seem to trigger it with a manual edit to this file and the following
> args:
> 
> -p=kernel --pedantic --two-passes --assume-loops
> 
> 
> For the patch
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

I'm re-working a bunch of Smatch internals right now.  I've
fixed the -1 vs -ENOMEM warning, but it's affected by the re-work
so it's going to be a while before it hits mainline.

I can create a warning for returning -EINVAL or other error
codes instead of -ENOMEM.

regards,
dan carpenter


