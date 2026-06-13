Return-Path: <linux-arm-msm+bounces-113023-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sOmxNJzkLWoZmQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113023-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Jun 2026 01:15:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2686B68004B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Jun 2026 01:15:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=infradead.org header.s=casper.20170209 header.b=hLXD7eOS;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113023-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113023-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=infradead.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EB4FE300D16D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jun 2026 23:15:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61D0E25B0B2;
	Sat, 13 Jun 2026 23:15:38 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 716193C06;
	Sat, 13 Jun 2026 23:15:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781392538; cv=none; b=RBI9qPo0FLF/F/4xbA0Vc5dN/UFsSm4rMh05qYr0D19mC429JAoe98qhAj6dnC8TOZqwGHO0jFMv1brCta92v25tiAESGzvnzkvoA6NOrcu1BMCnuWKljwsOyKsoUdzdV0StEJNQelbS3kkJVd+aWngrx7Ci6rJHTyiNKXxXzV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781392538; c=relaxed/simple;
	bh=oRCbb7uF19rBpg+kFz0Ksuzjghw5gzUWnmeats7BJ0w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OStR7WPDfwuaekZL7iYOHmoWeJmfxeHr5mc2Ic2WWtajYzmHq8AUR4ftKqIfaPGL6iZ8/TzuxDtYLUEIWxxMEMqgLGQjbFF03a8q74QS8pPYi4UjaljFiCmMjXdSpwwsra5dpbH/YX4d69qjbyzEBaYqW8L+ZRAso4jad47gi+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=hLXD7eOS; arc=none smtp.client-ip=90.155.50.34
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=dG3xiqATit6gEoZb/SAPMSkQ9RbQB4Q9JV9vSc+U8/U=; b=hLXD7eOSFoc4e2VKrlStDVD/Du
	Rr+P17+rwokxTAhVCNohqPP9xa8dwN5Gi99qnUYhjXMy1K2Er6rjVlTluAYt0GL2ig88zArVF+8DL
	1/r8ywXcf5yEuOG0JnPadEGtjy5v63TLkLSQ70KRMIuWmvKKakX7q1pHwcg1DfEk4IeZ/S6IqkYln
	kK9hiVzrvTJZ/6d9Odoqp+g1zWurLoBhkgzSKTtbcDwye5KDzjdlm+L9hX3dMprypCjS5+1y1JLrS
	xwqZskhRqi/p1tQ841bYJ3x4SRVontkg24HJu8IqA2hPgNMB4hyDySHxDiw4H7B/Tgi2UkDMmFTXs
	EFlnYPnA==;
Received: from willy by casper.infradead.org with local (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYXZY-00000006DCZ-3ADY;
	Sat, 13 Jun 2026 23:15:28 +0000
Date: Sun, 14 Jun 2026 00:15:28 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Pranjal Arya <pranjal.arya@oss.qualcomm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
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
Message-ID: <ai3kkIpaR0aT_6q5@casper.infradead.org>
References: <20260613-vmalloc_maple-v1-0-0aa740bb944b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260613-vmalloc_maple-v1-0-0aa740bb944b@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=casper.20170209];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-113023-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER(0.00)[willy@infradead.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[linux-foundation.org,gmail.com,infradead.org,google.com,vger.kernel.org,kvack.org,lists.infradead.org,kernel.org,arm.com,linaro.org,nvidia.com,amd.com];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORGED_RECIPIENTS(0.00)[m:pranjal.arya@oss.qualcomm.com,m:akpm@linux-foundation.org,m:urezki@gmail.com,m:liam@infradead.org,m:aliceryhl@google.com,m:andrewjballance@gmail.com,m:linux-arm-msm@vger.kernel.org,m:linux-mm@kvack.org,m:linux-kernel@vger.kernel.org,m:maple-tree@lists.infradead.org,m:ljs@kernel.org,m:praan@google.com,m:will@kernel.org,m:Suzuki.Poulose@arm.com,m:neil.armstrong@linaro.org,m:smostafa@google.com,m:balbirs@nvidia.com,m:surenb@google.com,m:elver@google.com,m:dvyukov@google.com,m:glider@google.com,m:shuah@kernel.org,m:dev.jain@arm.com,m:jackmanb@google.com,m:puranjay@kernel.org,m:santosh.shukla@amd.com,m:wkarny@gmail.com,m:sudeep.holla@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[willy@infradead.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[infradead.org:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,infradead.org:dkim,infradead.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2686B68004B

On Sat, Jun 13, 2026 at 10:49:42PM +0530, Pranjal Arya wrote:
> vmalloc's free/busy/lazy area tracking is one of the last remaining
> augmented-rb_tree consumers in the core mm allocators. The rest of
> mm/ has been gradually consolidating range-keyed indexing around
> maple_tree (notably the per-process VMA tree in mm/mmap.c), and
> the underlying reason is a structural mismatch between rb_tree and
> range tracking:

First, and most importantly, I love this.  The maple tree is undoubtedly
the right data structure to use for this purpose.

What I don't understand is why you maintain a separate "free" tree.
It should not be necessary any more, but maybe you tried removing it
already and found a performance problem?

