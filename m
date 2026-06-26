Return-Path: <linux-arm-msm+bounces-114676-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fHHbE22KPmrOHgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114676-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 16:19:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D7A6CDD8F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 16:19:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=infradead.org header.s=casper.20170209 header.b=ptpS7SPO;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114676-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114676-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=infradead.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6FE743045387
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 14:15:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2973037C910;
	Fri, 26 Jun 2026 14:15:36 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC7C3F8234;
	Fri, 26 Jun 2026 14:15:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782483336; cv=none; b=QkB5aP3y7qnEt01LDfR+oLEJwP8atWW86nF5b4AU4NK56bL0eXpJ+O4RodeTWVl0EqmZcHL9qNHGWE5Zlv5wD4l5cQkYG0T74YEPhVMveDGeA/FXivhiiOKiQbIaQWvvQ1t98chQWSsMc9A661bdRzmdWcLTQDpksOkZomOVpgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782483336; c=relaxed/simple;
	bh=LKm0E14Bs6b8dXbyOiOJrggabFAJn7iZ0//R0pG9R+A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SgvwWjeBpWT6hCYIM4FztiBQqxx8GjYhkj8oIvhaIluzmHr0LfIS7s4bSdTl5q4nGT590ghI5B1hvffAcIyULRbDpWwikMRK4vCXtGND/4tXj0DL2Mqwt+YEK8W0ZuTUDk5VDQjS9IT3QS0vRAQ/CPFCZvo03lzxFepliaSq7Y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=ptpS7SPO; arc=none smtp.client-ip=90.155.50.34
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Fk23Dy4ZIc61XYKtH81zEfyaoMPF2yWZmOGN1C30DSY=; b=ptpS7SPO8KrxMt8IaYVlZ4Zn2D
	4r9VnoW06/NoZlCKiKfiBWTVJkxsCvLwBnIOmDZQMF5YBqXGi5Q+E3FNyEhl0h0J6BxooH0qpBXXy
	gwDAxiSr/RaFQ9nGw8tGxeRRNvstWM/3h3fBoIos7vr7+yJj9BuzmftTQMWBDKG7eHVXMZYoejtRD
	cWBrmR6//Oxd+cjFgObvz4lTWQ2CVY+bSUJ6q3OB87WIU3ufmMekEg7JWCRB1fEk68MZV6ihVx7QD
	gVxD/g6Gi+U6+Y2iOn8T+Zp6+mK0tH4obdHvjerDebPqDm2uJUEvUf3WBituFBor7aEdSdFN7Phsn
	5iCyMUJw==;
Received: from willy by casper.infradead.org with local (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd7L2-0000000BxKA-0uSb;
	Fri, 26 Jun 2026 14:15:24 +0000
Date: Fri, 26 Jun 2026 15:15:24 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Pranjal Arya <pranjal.arya@oss.qualcomm.com>
Cc: Uladzislau Rezki <urezki@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
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
Message-ID: <aj6JfHxWGbJr0WPZ@casper.infradead.org>
References: <20260613-vmalloc_maple-v1-0-0aa740bb944b@oss.qualcomm.com>
 <ai3kkIpaR0aT_6q5@casper.infradead.org>
 <ai_LVreyRWx-RDEd@pc636>
 <ajGQ_WPT3Ra2kPCQ@casper.infradead.org>
 <ajPDDkV7yqWlhPIh@pc636>
 <e65e6153-10b4-403e-ac40-10687ea5cb68@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e65e6153-10b4-403e-ac40-10687ea5cb68@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=casper.20170209];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:pranjal.arya@oss.qualcomm.com,m:urezki@gmail.com,m:akpm@linux-foundation.org,m:liam@infradead.org,m:aliceryhl@google.com,m:andrewjballance@gmail.com,m:linux-arm-msm@vger.kernel.org,m:linux-mm@kvack.org,m:linux-kernel@vger.kernel.org,m:maple-tree@lists.infradead.org,m:ljs@kernel.org,m:praan@google.com,m:will@kernel.org,m:Suzuki.Poulose@arm.com,m:neil.armstrong@linaro.org,m:smostafa@google.com,m:balbirs@nvidia.com,m:surenb@google.com,m:elver@google.com,m:dvyukov@google.com,m:glider@google.com,m:shuah@kernel.org,m:dev.jain@arm.com,m:jackmanb@google.com,m:puranjay@kernel.org,m:santosh.shukla@amd.com,m:wkarny@gmail.com,m:sudeep.holla@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114676-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER(0.00)[willy@infradead.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,linux-foundation.org,infradead.org,google.com,vger.kernel.org,kvack.org,lists.infradead.org,kernel.org,arm.com,linaro.org,nvidia.com,amd.com];
	RCPT_COUNT_TWELVE(0.00)[28];
	RCVD_COUNT_THREE(0.00)[4];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,infradead.org:dkim,infradead.org:from_mime,casper.infradead.org:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 98D7A6CDD8F

On Fri, Jun 26, 2026 at 04:17:08PM +0530, Pranjal Arya wrote:
> I am planning to have following approach on this:
> 
>   1. mas_preallocate(GFP_NOWAIT | __GFP_NOWARN) + mas_store_prealloc
>      will be fast path. The preallocate attempt will be non sleeping and,
>      if it succeeds, the subsequent store won't require allocation.
> 
>   2. mas_store_gfp(GFP_ATOMIC | __GFP_NOWARN) fallback: if
>      preallocate fails (rare but possible under memory pressure),
>      GFP_ATOMIC will make a non sleeping allocation attempt inline.

This isn't how you're supposed to use the maple tree.  The intent is
that it's protected by its internal spinlock, and so it can drop the
lock to allocate memory if it needs to in order to balance the tree.

If the user needs to also use that spinlock to protect other things,
that's allowed.


