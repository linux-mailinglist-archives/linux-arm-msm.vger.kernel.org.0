Return-Path: <linux-arm-msm+bounces-113148-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /aQMGGLLL2rtGQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113148-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 11:52:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 595686852F1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 11:52:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=AM505f8h;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113148-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113148-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 72F2F300405C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 09:52:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83EDD3DB30C;
	Mon, 15 Jun 2026 09:52:29 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B1A63C37A3
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 09:52:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781517149; cv=none; b=U9X+4mLQzCDuB4TbWpRQltX/1NDwivywZ60CKRQNczmX3kEyA1piVL1RAWFY7dDjvvdmz66odI7ks6ojvQPBrt9iLvhxAox7Oqr8l6hBGHqKgU7EG9BsgzgAy757RPPuFJ/AZCJqrPae2wASRgTuvpwN0bWDS1PJ2tC/eFMXY/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781517149; c=relaxed/simple;
	bh=E9DzElj/L3Z4sBd5ZAO7ctqMgVFfgB9yNx3juJWYoDI=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HR4kPh/MZF3+VC++XjIYQFpWCuzNiSlcLK5IFtFPJjTuxU+IcjOGbxtYDVlVUidAl0Sm9LLBAngKOmue7lLJDx03SfjzqxZQF4iIw3fr0ASyqyvg5Ja3Da73LnHmCsyTHVzSjRMFLiA1hMHdF5xZ2pxrH5TcalnWHTj2XV0BGYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AM505f8h; arc=none smtp.client-ip=209.85.208.178
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-396aacc5bcfso28118351fa.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 02:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781517146; x=1782121946; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Kj0Gn7Jr1tSJCs+Q3oh8GCThTx5Sz26eyH6pCBt9/Lc=;
        b=AM505f8hQYxg2pBMWzVJOiyY7GK9vW0ZiZeslycN0EV85rhhjj+DcbWE2jVEV/V1sJ
         IQIzQhWtRYnvtTwbAaA9JVZFox/5MzYF8khxM9xLJeBg91/kecmmWMB3CmdYcbGJWgJ+
         tx3c2UVdkri4faXpzxa7I1CXroicpHMVNRbgg+K+FfsyBPwxQNhqFhCUlIWZv9B5ZINb
         FmjoydQ2Q/rlDAIslC1Jm4h8TFRTo/Xe/59wq8fb6L+Mk2QJ3wt/oaHmEbcLw8XKBGmt
         AkA8BdDc7HFrpWth0uQ8p3RIGED2djazHJpjgc5xiQT6xXtGq1piQh+l6EY4viWfi92H
         Denw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781517146; x=1782121946;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kj0Gn7Jr1tSJCs+Q3oh8GCThTx5Sz26eyH6pCBt9/Lc=;
        b=bmcIik3b12SdikcBkn/pji0BvbghzHFxtbVhqiYotXN74/urZ3iCXKvU2mOAe9NDYl
         qU5INbWoIusfQ7VrGfUdcO79vvEOwF3LerXDALNqMpqrmfU6f0SE+bW+CVKeqjpVaqLD
         DSBQkbVu/DQ0mlPNbz26LZBp7v0Cfiw9n+CCxB3q9qsDvSvCnQYBLStfbjPvHJqg++WI
         Ax88+JRm69WHQf2+0iofHX+pZTEeDLfxg4QgzlSKjxnVEgs3AOVvLDDNpUXW04mxwRxa
         uZ2EqES5tfLHYx02nTLPaJ9/9Uq3kdc0Yjydb3UzTke1Kae4guCPvaLIRNBBewBMw7Et
         SFfQ==
X-Forwarded-Encrypted: i=1; AFNElJ9HizNfX0AsaGxIgJRwynDg66r6m0W65TuP1hrQUxcRkSSj5wLkgZziGjcOILIVg2fuz80jqMO1cN8uvsoT@vger.kernel.org
X-Gm-Message-State: AOJu0YztEVAhWZH+RcO86M2VYzMFbega+ygyZjaPmsBxbCbIIVyN8CwR
	kHkdbOlly81xQp7rno89vLEYF5OqLW43Uge1WLtfOBLbDEeiakxAf+YB
X-Gm-Gg: Acq92OEpHepVlFoj1nQo07eu5Z9On3IXddreVu/9grWESdAu/hVsjuqWFGus14pfBWE
	DewmVqWQk/Y4i4nQMRbTA8GGTWoXFgEmei+ibZNwr9uG394wJJT3aevpWSHOzxhzG1getOSQOtt
	UI0nWKQFMPGS8nEyXsMDFkejLARirhcFk1U9x6funn8OJOIS6OxhxCVbUa4xoGkjUmNQ+MXDhVb
	Mc5/VGvC5yVhxPIz2e7O/IKFHQvAYxQEHMX9WJvY6dyyMPrND6rMi7gtO+jUb37qp9xNedssbOM
	eNts1HyO7qKlMpqNFDM88D8B6LBfc76ufC9ysx1IDy0A0U0h+2oZNHVeCObehf/VYb0RUMbVBn0
	zGmmCtMWwGiSKh1NVCmSwXKlev9NpuoP7I7y20TF+UpzIgiGps6gmNh4/48gurfKEVFY/bBl9pT
	kda4YvM6fs9Fx6ujyqacbN6Jr1B5ZcjbaNNiX6m0oKaR0xdQUt
X-Received: by 2002:a05:6512:800f:10b0:5aa:8562:2a7c with SMTP id 2adb3069b0e04-5ad2db6fcd1mr2639291e87.31.1781517145832;
        Mon, 15 Jun 2026 02:52:25 -0700 (PDT)
Received: from pc636 (host-90-233-213-1.mobileonline.telia.com. [90.233.213.1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e161fc7sm2679862e87.12.2026.06.15.02.52.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 02:52:25 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Mon, 15 Jun 2026 11:52:22 +0200
To: Matthew Wilcox <willy@infradead.org>
Cc: Pranjal Arya <pranjal.arya@oss.qualcomm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	"Liam R. Howlett" <liam@infradead.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Andrew Ballance <andrewjballance@gmail.com>,
	linux-arm-msm@vger.kernel.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, maple-tree@lists.infradead.org,
	Lorenzo Stoakes <ljs@kernel.org>,
	Pranjal Shrivastava <praan@google.com>,
	Will Deacon <will@kernel.org>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Mostafa Saleh <smostafa@google.com>,
	Balbir Singh <balbirs@nvidia.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>,
	Alexander Potapenko <glider@google.com>,
	Shuah Khan <shuah@kernel.org>, Dev Jain <dev.jain@arm.com>,
	Brendan Jackman <jackmanb@google.com>,
	Puranjay Mohan <puranjay@kernel.org>,
	Santosh Shukla <santosh.shukla@amd.com>,
	Wyes Karny <wkarny@gmail.com>,
	Sudeep Holla <sudeep.holla@kernel.org>
Subject: Re: [PATCH RFC 00/12] mm/vmalloc: migrate vmap_area indexing from
 rb-tree to maple-tree
Message-ID: <ai_LVreyRWx-RDEd@pc636>
References: <20260613-vmalloc_maple-v1-0-0aa740bb944b@oss.qualcomm.com>
 <ai3kkIpaR0aT_6q5@casper.infradead.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ai3kkIpaR0aT_6q5@casper.infradead.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113148-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:willy@infradead.org,m:pranjal.arya@oss.qualcomm.com,m:akpm@linux-foundation.org,m:urezki@gmail.com,m:liam@infradead.org,m:aliceryhl@google.com,m:andrewjballance@gmail.com,m:linux-arm-msm@vger.kernel.org,m:linux-mm@kvack.org,m:linux-kernel@vger.kernel.org,m:maple-tree@lists.infradead.org,m:ljs@kernel.org,m:praan@google.com,m:will@kernel.org,m:Suzuki.Poulose@arm.com,m:neil.armstrong@linaro.org,m:smostafa@google.com,m:balbirs@nvidia.com,m:surenb@google.com,m:elver@google.com,m:dvyukov@google.com,m:glider@google.com,m:shuah@kernel.org,m:dev.jain@arm.com,m:jackmanb@google.com,m:puranjay@kernel.org,m:santosh.shukla@amd.com,m:wkarny@gmail.com,m:sudeep.holla@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[urezki@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,linux-foundation.org,gmail.com,infradead.org,google.com,vger.kernel.org,kvack.org,lists.infradead.org,kernel.org,arm.com,linaro.org,nvidia.com,amd.com];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[urezki@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 595686852F1

On Sun, Jun 14, 2026 at 12:15:28AM +0100, Matthew Wilcox wrote:
> On Sat, Jun 13, 2026 at 10:49:42PM +0530, Pranjal Arya wrote:
> > vmalloc's free/busy/lazy area tracking is one of the last remaining
> > augmented-rb_tree consumers in the core mm allocators. The rest of
> > mm/ has been gradually consolidating range-keyed indexing around
> > maple_tree (notably the per-process VMA tree in mm/mmap.c), and
> > the underlying reason is a structural mismatch between rb_tree and
> > range tracking:
> 
> First, and most importantly, I love this.  The maple tree is undoubtedly
> the right data structure to use for this purpose.
> 
> What I don't understand is why you maintain a separate "free" tree.
> It should not be necessary any more, but maybe you tried removing it
> already and found a performance problem?
>
We maintain it in order to split several entities. That prevents
interfering between allocated data and vmap-free-space manager.
So in that case one context can easily access allocated data, for
example vread iterator, etc., whereas another can do an allocation.

So by splitting parts i minimize lock-contention.

--
Uladzislau Rezki

