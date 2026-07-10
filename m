Return-Path: <linux-arm-msm+bounces-118428-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GbUIAgx2UWrfFAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118428-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 00:45:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FBD573F9AB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 00:45:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linux-foundation.org header.s=korg header.b=ZSx7QPoS;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118428-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118428-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6B50E301175D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 22:45:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8568383334;
	Fri, 10 Jul 2026 22:45:27 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F50E4499A6;
	Fri, 10 Jul 2026 22:45:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783723527; cv=none; b=SlzS9tfSC6p3tbPajrQWA0AZdF3WLWGn5YW9uxK8np0bnHzeA8pOonqbpARd/4jy86IDVwjmOFDFNB0WOloyQmbl1bm2UYqHzqf+FzXnN1UAquq+YAFrj8YyotF+ulqK5wno65mdPf0rLj9XcfPQJ3w4pzP5Iu59UAuPuER7RYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783723527; c=relaxed/simple;
	bh=hCZkEMaSNg91BSp9lPUnfEVv5lLLPtH93/eR1BiWlDo=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=RBSFGV0OBxO+paqutAdCctxdiMU+2Wida7p6GAX/repCyt3bMoDU8KxaSTzj4wfGWfoL0qwxTflTbFFtHDNTdrKNs2W4ZvsUQsijY/t0F5NFa71/qVcUj2CdWhItDqYYOwcP3bySFEAS/2IDlEKUYE6gAo3zy9opH1eGHFaFP8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=ZSx7QPoS; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28FA61F000E9;
	Fri, 10 Jul 2026 22:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1783723525;
	bh=Yq17DLw8B7m0Ic0jrotN2vK5MclACu0PBR+dyFlWO78=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=ZSx7QPoSol/yIwMXKEmUJhTjHYhOTBLc5mXwwU3UwAh9roiwGFOEkEGDc9BHD66gH
	 ol4A8UhH1Qv4PL+p4SHToO2ow21dRlKuMhNHReG860Gc0SP2DYkvm0I7ZKgAi4s3Wk
	 nNh7xrNAGItIywqfA1/YCTySczvPZbj9fgWwv5ao=
Date: Fri, 10 Jul 2026 15:45:21 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Lorenzo Stoakes <ljs@kernel.org>
Cc: David Hildenbrand <david@kernel.org>, "Liam R. Howlett"
 <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport
 <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko
 <mhocko@suse.com>, Rik van Riel <riel@surriel.com>, Harry Yoo
 <harry@kernel.org>, Jann Horn <jannh@google.com>, Lance Yang
 <lance.yang@linux.dev>, Pedro Falcato <pfalcato@suse.de>, Russell King
 <linux@armlinux.org.uk>, Dinh Nguyen <dinguyen@kernel.org>, Simon Schuster
 <schuster.simon@siemens-energy.com>, "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner
 <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Dan Williams
 <djbw@kernel.org>, Matthew Wilcox <willy@infradead.org>, Muchun Song
 <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, Masami
 Hiramatsu <mhiramat@kernel.org>, Oleg Nesterov <oleg@redhat.com>, Peter
 Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Arnaldo
 Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Alexander Shishkin
 <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, Ian
 Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, James
 Clark <james.clark@linaro.org>, Zi Yan <ziy@nvidia.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Nico Pache <npache@redhat.com>, Ryan
 Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song
 <baohua@kernel.org>, Miaohe Lin <linmiaohe@huawei.com>, Naoya Horiguchi
 <nao.horiguchi@gmail.com>, Xu Xin <xu.xin16@zte.com.cn>, Chengming Zhou
 <chengming.zhou@linux.dev>, SJ Park <sj@kernel.org>, Matthew Brost
 <matthew.brost@intel.com>, Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim
 <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>, Gregory Price
 <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>, Alistair
 Popple <apopple@nvidia.com>, Hugh Dickins <hughd@google.com>, Peter Xu
 <peterx@redhat.com>, Kees Cook <kees@kernel.org>, Marek Szyprowski
 <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, Andrey
 Konovalov <andreyknvl@gmail.com>, Alexander Potapenko <glider@google.com>,
 Dmitry Vyukov <dvyukov@google.com>, Steven Rostedt <rostedt@goodmis.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Jarkko Sakkinen
 <jarkko@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, Thomas
 Gleixner <tglx@kernel.org>, Borislav Petkov <bp@alien8.de>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Ian Abbott <abbotti@mev.co.uk>, H Hartley
 Sweeten <hsweeten@visionengravers.com>, Lucas Stach
 <l.stach@pengutronix.de>, Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Patrik
 Jakobsson <patrik.r.jakobsson@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Clark
 <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang
 <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>, Thierry Reding
 <thierry.reding@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Christian Koenig
 <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>, Matthew Auld
 <matthew.auld@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas
 <yishaih@nvidia.com>, Shameer Kolothum <skolothumtho@nvidia.com>, Kevin
 Tian <kevin.tian@intel.com>, Ankit Agrawal <ankita@nvidia.com>, Alex
 Williamson <alex@shazbot.org>, Paolo Bonzini <pbonzini@redhat.com>, Shakeel
 Butt <shakeel.butt@linux.dev>, Usama Arif <usama.arif@linux.dev>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, nvdimm@lists.linux.dev,
 linux-perf-users@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 damon@lists.linux.dev, iommu@lists.linux.dev, kasan-dev@googlegroups.com,
 linux-sgx@vger.kernel.org, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 kvm@vger.kernel.org, Russell King <linux+etnaviv@armlinux.org.uk>, Ackerley
 Tng <ackerleytng@google.com>, Kai Huang <kai.huang@intel.com>
Subject: Re: [PATCH v2 00/33] mm: make VMA page offset handling more
 consistent
Message-Id: <20260710154521.435f67cc7b03ed3a9ccd423a@linux-foundation.org>
In-Reply-To: <20260710-b4-pre-scalable-cow-v2-0-2a5aa403d977@kernel.org>
References: <20260710-b4-pre-scalable-cow-v2-0-2a5aa403d977@kernel.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[linux-foundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118428-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ljs@kernel.org,m:david@kernel.org,m:liam@infradead.org,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:riel@surriel.com,m:harry@kernel.org,m:jannh@google.com,m:lance.yang@linux.dev,m:pfalcato@suse.de,m:linux@armlinux.org.uk,m:dinguyen@kernel.org,m:schuster.simon@siemens-energy.com,m:James.Bottomley@HansenPartnership.com,m:deller@gmx.de,m:viro@zeniv.linux.org.uk,m:brauner@kernel.org,m:jack@suse.cz,m:djbw@kernel.org,m:willy@infradead.org,m:muchun.song@linux.dev,m:osalvador@suse.de,m:mhiramat@kernel.org,m:oleg@redhat.com,m:peterz@infradead.org,m:mingo@redhat.com,m:acme@kernel.org,m:namhyung@kernel.org,m:mark.rutland@arm.com,m:alexander.shishkin@linux.intel.com,m:jolsa@kernel.org,m:irogers@google.com,m:adrian.hunter@intel.com,m:james.clark@linaro.org,m:ziy@nvidia.com,m:baolin.wang@linux.alibaba.com,m:npache@redhat.com,m:ryan.roberts@arm.com,m:dev.jain@arm.com,m:baohua@kernel.org,m:linmiaohe@huawei.com,m:nao.horiguchi@gmail.com,m:xu
 .xin16@zte.com.cn,m:chengming.zhou@linux.dev,m:sj@kernel.org,m:matthew.brost@intel.com,m:joshua.hahnjy@gmail.com,m:rakie.kim@sk.com,m:byungchul@sk.com,m:gourry@gourry.net,m:ying.huang@linux.alibaba.com,m:apopple@nvidia.com,m:hughd@google.com,m:peterx@redhat.com,m:kees@kernel.org,m:m.szyprowski@samsung.com,m:robin.murphy@arm.com,m:andreyknvl@gmail.com,m:glider@google.com,m:dvyukov@google.com,m:rostedt@goodmis.org,m:mathieu.desnoyers@efficios.com,m:jarkko@kernel.org,m:dave.hansen@linux.intel.com,m:tglx@kernel.org,m:bp@alien8.de,m:x86@kernel.org,m:hpa@zytor.com,m:abbotti@mev.co.uk,m:hsweeten@visionengravers.com,m:l.stach@pengutronix.de,m:christian.gmeiner@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:patrik.r.jakobsson@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:tomi.valkeinen@ideasonboa
 rd.com,m:thierry.reding@kernel.org,m:mperttunen@nvidia.com,m:jonathanh@nvidia.com,m:christian.koenig@amd.com,m:ray.huang@amd.com,m:matthew.auld@intel.com,m:jgg@ziepe.ca,m:yishaih@nvidia.com,m:skolothumtho@nvidia.com,m:kevin.tian@intel.com,m:ankita@nvidia.com,m:alex@shazbot.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[linux-foundation.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[akpm@linux-foundation.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,infradead.org,google.com,suse.com,surriel.com,linux.dev,suse.de,armlinux.org.uk,siemens-energy.com,HansenPartnership.com,gmx.de,zeniv.linux.org.uk,suse.cz,redhat.com,arm.com,linux.intel.com,intel.com,linaro.org,nvidia.com,linux.alibaba.com,huawei.com,gmail.com,zte.com.cn,sk.com,gourry.net,samsung.com,goodmis.org,efficios.com,alien8.de,zytor.com,mev.co.uk,visionengravers.com,pengutronix.de,ffwll.ch,oss.qualcomm.com,poorly.run,somainline.org,ideasonboard.com,amd.com,ziepe.ca,shazbot.org,kvack.org,vger.kernel.org,lists.infradead.org,lists.linux.dev,googlegroups.com,lists.freedesktop.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_GT_50(0.00)[123];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akpm@linux-foundation.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[linux-foundation.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,etnaviv];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux-foundation.org:from_mime,linux-foundation.org:dkim,linux-foundation.org:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4FBD573F9AB

On Fri, 10 Jul 2026 21:16:41 +0100 Lorenzo Stoakes <ljs@kernel.org> wrote:

> This series performs a series of cleanups and improvements around how the
> vma->vm_pgoff field is used.

Thanks, I'll add this to mm-new.

Sashiko wasn't able to apply it :(

There were some minor collisions in ksm.c, thanks to
https://lore.kernel.org/20260703162510242nxmjbcLy5ccp1dbZSK3EU@zte.com.cn.

(You'd think His Royal AIness could figure out how to resolve a few
dopey patch rejects.  Oh well.)

