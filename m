Return-Path: <linux-arm-msm+bounces-113458-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id q1XzMxWRMWqbmwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113458-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 20:08:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 361BE693D3F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 20:08:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=infradead.org header.s=casper.20170209 header.b=Tgw+agkf;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113458-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113458-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=infradead.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 670623160E0A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 18:08:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 392503D45D0;
	Tue, 16 Jun 2026 18:08:17 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9EBF3D45CB;
	Tue, 16 Jun 2026 18:08:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781633297; cv=none; b=Vg0cyOjihnLq94xMIxPB4qVwobkhlpgEPib88O0XYZNr7uEZjSlnjyQpG6jc8/63r1HySuyO4hDkgpCAe2llWei25hOGK3jtnDzFvwQ8etBuGNUpYr19gFDI+cXJCLLS/x4xAu2KfhUbBzLaQLYeqMXji74RHB7Em/5EQU8h84c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781633297; c=relaxed/simple;
	bh=ZfH3JOgmf9XdcKWDOKQ+is9C8wTOGtm2ZIDba5Hcbeg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UvwHWxCqhF7a8s8q2EsDsiWx3OzAKWD8weUgMbVn7vrH/xn4oChPl/kGqOGI5iz5KM3xv0b3qQEOTT33xwxZNA20ykSF3a60DTgnb9d4mmjfd1KWnAlbvCFNYVMPr8RUrvOXRNQ/xf3h2aY2mMTmMa3oYcV9Eqdct3XsZHO3uXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Tgw+agkf; arc=none smtp.client-ip=90.155.50.34
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=BCfXNXLBXAr5Arz1BeAs2uSx+MoF38R1sHrI4zD9Grw=; b=Tgw+agkf9gNlr8xaAP7VLpUzIn
	mt1q8YgGNxaT3kdLwwutfEOiVNWP8kfZl5jlDf/gbEwtfOk0/voLcLbyZ4c6+vlrbtaEWg3c9pJ47
	TJAbjLdXZWaEYwwdJiNm7Hf2BMTC67SE/oQFHWawdwQuQ/tuP8551dSyKfgF97f3KHEGYa8+ur9v3
	2qumHDZ3IyHB+cpsKf5VnypfQwsU9pFSAnHk88i+oJerth2ngfdZXq/EkhaKrnXLr9uotceyBKJM3
	hdw5NTp4WubwiE38Aowitpr8cKTxGFQPnThPTi+4QU6OAaL9RDlK2LPUlwhOVr2ELXgK2WT8K9gSo
	17584hAg==;
Received: from willy by casper.infradead.org with local (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZYCb-0000000BFII-16Pg;
	Tue, 16 Jun 2026 18:07:57 +0000
Date: Tue, 16 Jun 2026 19:07:57 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Uladzislau Rezki <urezki@gmail.com>
Cc: Pranjal Arya <pranjal.arya@oss.qualcomm.com>,
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
Message-ID: <ajGQ_WPT3Ra2kPCQ@casper.infradead.org>
References: <20260613-vmalloc_maple-v1-0-0aa740bb944b@oss.qualcomm.com>
 <ai3kkIpaR0aT_6q5@casper.infradead.org>
 <ai_LVreyRWx-RDEd@pc636>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ai_LVreyRWx-RDEd@pc636>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=casper.20170209];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113458-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:urezki@gmail.com,m:pranjal.arya@oss.qualcomm.com,m:akpm@linux-foundation.org,m:liam@infradead.org,m:aliceryhl@google.com,m:andrewjballance@gmail.com,m:linux-arm-msm@vger.kernel.org,m:linux-mm@kvack.org,m:linux-kernel@vger.kernel.org,m:maple-tree@lists.infradead.org,m:ljs@kernel.org,m:praan@google.com,m:will@kernel.org,m:Suzuki.Poulose@arm.com,m:neil.armstrong@linaro.org,m:smostafa@google.com,m:balbirs@nvidia.com,m:surenb@google.com,m:elver@google.com,m:dvyukov@google.com,m:glider@google.com,m:shuah@kernel.org,m:dev.jain@arm.com,m:jackmanb@google.com,m:puranjay@kernel.org,m:santosh.shukla@amd.com,m:wkarny@gmail.com,m:sudeep.holla@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORGED_SENDER(0.00)[willy@infradead.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,linux-foundation.org,infradead.org,google.com,gmail.com,vger.kernel.org,kvack.org,lists.infradead.org,kernel.org,arm.com,linaro.org,nvidia.com,amd.com];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,infradead.org:dkim,infradead.org:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,casper.infradead.org:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 361BE693D3F

On Mon, Jun 15, 2026 at 11:52:22AM +0200, Uladzislau Rezki wrote:
> On Sun, Jun 14, 2026 at 12:15:28AM +0100, Matthew Wilcox wrote:
> > What I don't understand is why you maintain a separate "free" tree.
> > It should not be necessary any more, but maybe you tried removing it
> > already and found a performance problem?
>
> We maintain it in order to split several entities. That prevents
> interfering between allocated data and vmap-free-space manager.
> So in that case one context can easily access allocated data, for
> example vread iterator, etc., whereas another can do an allocation.
> 
> So by splitting parts i minimize lock-contention.

Sure, but there are many ways to reduce lock contention.  One is to not
take locks at all; the maple tree is RCU-safe, so you can read the tree
holding only the RCU read lock, as long as you obey the RCU rules.

Specifically:
 - Write side has to RCU-free the objects that are stored in the tree
 - Read side has to trylock the objects it finds (and retry the walk
   if the trylock fails)
 - Read side can see a mixture of objects if the tree is changed while
   it is reading, but for any given index in the tree it is guaranteed
   to see one of the objects which has been referred to by that index.
   That is, if the write side overwrites an index that referred to
   object A with object B, the reader will see either object A or B.
   It will not see NULL and it will not see any other object.
 - If the write side stores both object C and object D in the tree,
   the read side may see neither, both, only C or only D.

