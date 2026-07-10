Return-Path: <linux-arm-msm+bounces-118129-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JHeUAZhwUGoNzAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118129-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 06:10:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB94737135
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 06:09:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=infradead.org header.s=bombadil.20210309 header.b=UZKgSZ9H;
	dmarc=pass (policy=none) header.from=infradead.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118129-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118129-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BE46C300F521
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 04:09:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B99972E7382;
	Fri, 10 Jul 2026 04:09:53 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFECC4499A3;
	Fri, 10 Jul 2026 04:09:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783656593; cv=none; b=YNgWfo+jgK+TcEiPQVtMQXB2wRSle4mToXTgmo5FmBN7Onin57UD/oR7ABuUSJc4+kmhwxydebDdeOllj+AR2jKKRCYZtrCkcUg719iQ+fEhxYpQku3Ebhi0JPQHqSWOnBLWmwFvxQIh+0QcVGJtTREv4yhSRtOsNdJpNAnq5mA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783656593; c=relaxed/simple;
	bh=+uGUBqvPYES6PXfbIHb0cgdUSGMx1u7ozvhCYTMpAcc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gcOZeFqyiWIDZXKmUvvxBu91k1IRXAGDck8uryDXJQy+Fan7LNFL8KTOh+ZDUhtvUGLh+ZjMIn/E65evRgDiL8HTzsHryZVDA6fgzKOmch/78ZClvjibsDLqCP/SmwMdh0QkESnf3mubCNybBT8TEXJTABxdQGehDP+QOcTNwYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=UZKgSZ9H; arc=none smtp.client-ip=198.137.202.133
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=XZ2ZKJwyH+czH0S6wCGrcRFmnJfF64txwylbTE5TD3Y=; b=UZKgSZ9HstM/m6zYkRbYa7ngfh
	DZ/56Ny6UarWRcWvOxILB52RdTY0S/lHv4mZLNuD2heZv5MHp43p74p7HIuDftdk55uB6CB1dDa3K
	jbkrEd87hXH4+3hLmn0IQwvXRw/c7ySwiiHkMFgXYVetbjUKqLsHBY1QS+vuGR6dG38TRnUY/Neoo
	XJlA7lXNLL8J0bmr4Y4KTj+lhtXLClFJ3OqTu6Z/Dkfng25d6iHRlJh/0nzLndSfFYKGT6Gf2BPMr
	PVr+yA/Fk8aBAZWsQVZ6SRgj7aGESs5Kjbdl/pHBqMDGf/0EupVJ0um+iO2M4vAGoq7t4phcoTnCW
	l0QHE1dg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi2YJ-000000044w5-0wtb;
	Fri, 10 Jul 2026 04:09:27 +0000
Date: Thu, 9 Jul 2026 21:09:27 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Lorenzo Stoakes <ljs@kernel.org>
Cc: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Eugen Hristev <ehristev@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
	Christoph Lameter <cl@gentwo.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>,
	Kees Cook <kees@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	David Hildenbrand <david@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Brendan Jackman <jackmanb@google.com>,
	Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>,
	Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>,
	Barry Song <baohua@kernel.org>,
	Youngjun Park <youngjun.park@lge.com>,
	Petr Mladek <pmladek@suse.com>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 11/26] mm/swapfile: Annotate static information into
 meminspect
Message-ID: <alBwd9ACdVNEucut@infradead.org>
References: <20260708-meminspect-v3-v3-0-7aa5a0a74d5c@oss.qualcomm.com>
 <20260708-meminspect-v3-v3-11-7aa5a0a74d5c@oss.qualcomm.com>
 <ak4AgXqMnkn8rVGE@lucifer>
 <20260708190535.fhqaddicljho44eq@hu-mojha-hyd.qualcomm.com>
 <ak-1HujOABoQ9wR_@lucifer>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ak-1HujOABoQ9wR_@lucifer>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-118129-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ljs@kernel.org,m:mukesh.ojha@oss.qualcomm.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:ehristev@kernel.org,m:arnd@arndb.de,m:dennis@kernel.org,m:tj@kernel.org,m:cl@gentwo.org,m:akpm@linux-foundation.org,m:tglx@kernel.org,m:peterz@infradead.org,m:anna-maria@linutronix.de,m:frederic@kernel.org,m:jstultz@google.com,m:sboyd@kernel.org,m:kees@kernel.org,m:mingo@redhat.com,m:juri.lelli@redhat.com,m:vincent.guittot@linaro.org,m:dietmar.eggemann@arm.com,m:rostedt@goodmis.org,m:bsegall@google.com,m:mgorman@suse.de,m:vschneid@redhat.com,m:kprateek.nayak@amd.com,m:david@kernel.org,m:liam@infradead.org,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:jackmanb@google.com,m:hannes@cmpxchg.org,m:ziy@nvidia.com,m:chrisl@kernel.org,m:kasong@tencent.com,m:shikemeng@huaweicloud.com,m:nphamcs@gmail.com,m:baoquan.he@linux.dev,m:baohua@kernel.org,m:youngjun.park@lge.com,m:pmladek@suse.com,m:john.ogness@linutronix.de,m:senozhatsky@chromium.org,m
 :andersson@kernel.org,m:mathieu.poirier@linaro.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:saravanak@kernel.org,m:workflows@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arch@vger.kernel.org,m:linux-mm@kvack.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[hch@infradead.org,linux-arm-msm@vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,lwn.net,linuxfoundation.org,kernel.org,arndb.de,gentwo.org,linux-foundation.org,infradead.org,linutronix.de,google.com,redhat.com,linaro.org,arm.com,goodmis.org,suse.de,amd.com,suse.com,cmpxchg.org,nvidia.com,tencent.com,huaweicloud.com,gmail.com,linux.dev,lge.com,chromium.org,vger.kernel.org,kvack.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_GT_50(0.00)[60];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hch@infradead.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[infradead.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,infradead.org:from_mime,infradead.org:dkim,infradead.org:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7AB94737135

On Thu, Jul 09, 2026 at 03:53:44PM +0100, Lorenzo Stoakes wrote:
> > The whole reason we had to tag most of the MM symbols is that
> > the crash tool looks for this information while launching itself.
> 
> You're missing the point.
> 
> EXPORT_SYMBOL_GPL() != EXPORT_SYMBOL().
> 
> We cannot and will not allow symbols that are GPL-only to be exported by the
> back door to non-GPL modules.
> 
> Meminspect seems to ignore all of this and just exports symbols another way
> overriding kernel mechanisms which is just not acceptable...
> 
> I also don't really understand what you're saying here either, what has what
> crash looks up on startup got to do with anything?

Yeah, random backdoor exports for a totally opaque facility without
good use cases that comes from a known malicious actor like qualcomm is
a no-go.  I don't think anyone should even waste time on this.


