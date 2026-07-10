Return-Path: <linux-arm-msm+bounces-118422-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yTS3D/lmUWpDEAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118422-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 23:41:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BA40673F0FD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 23:41:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gourry.net header.s=google header.b=KcM3Wylc;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118422-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118422-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BC1293035D6F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 21:39:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FD0D3C5DA1;
	Fri, 10 Jul 2026 21:39:31 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A27923C09E7
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 21:39:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783719571; cv=none; b=Lc1HFmC7nYIR1f/jjD+Q1PAEPt5w6qCdTqXnFU1V05QKKTPlA3kX8StylG5Vv7Zt7PjycEBXPUfrDl68BP9pQ0IFeBbWLDlcUVVwMKBfV15lfkCwg/gQiXF+T4uVGAhYv1y/MPNI6ir3Y1k1VeoRiW1YczJo+RTOkpMtfnzqrgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783719571; c=relaxed/simple;
	bh=8IQ5CYx7b5nVnRm8wkAHsld3shhNHab0xIV3bA9f26A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WWk13sfOeEvZo7v/p1PgMHqdKEnJuWTrP3oqNCrsXGd5YIi8nEIx27hsCYZLohqO95fwMZqssN5HFZOJVzKUrshjNE7D57SDS4XXChGxgHPx83J4Ai2E9LhayWFBy71oSGuTHPW+Mz0/6gF2r7qMl430XeU+nckzz9VBmGWbCAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=KcM3Wylc; arc=none smtp.client-ip=209.85.219.45
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-8f0d6853360so11373306d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 14:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1783719568; x=1784324368; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Wb1LcvJKID9cCXN+ue8juptbLrwaSleub1+yDxtfpnU=;
        b=KcM3WylcLQKgQyXi9yGb6DVP2xBKT/WbjS7kPU2VDU7XkEH4msaT6vN2PsX/38yBZz
         8DXrNaOJya8FB8lundHEne4O353YE2hDIALM9o/2VBTcWWbIZXjoSBld1dOop2vOMmbl
         GEaav3WGOuAd2joAlZRxieqZmCAlx13NmAF+RsQB7bqQCVVuuJoLKuPXDyfv9EbDog7+
         0APUZO2+koKajYBqWUXhYmRb8Mut7lET+V6pvLRRbwbSLd1Fx+tBt1OR8kCkbkOVm8rj
         YLaiVQtEgIVqoEXPWjQhT1+7yX1R5ZUSI9TK6UaCYaaaQmY8ZPknfw0RBIeoO11F9jrN
         GWUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783719568; x=1784324368;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wb1LcvJKID9cCXN+ue8juptbLrwaSleub1+yDxtfpnU=;
        b=i8VG4cQLRSCU7CGt7cVtfGwZHKSGwpFMTYF/JzUSikldJec2zMN0bYXbBIvzxCXWxp
         Vx3WQddc1M3Plc15X4/DAt/E2Bb2mti6JEh8JUVmVl2g8oQ/mC0839dytwfduMrG6moU
         pXvwckMpixR5y7jhpHPU5DY/nOzGf41uSp6tsesjMbnXgULjesbj1WFSSbx6MyGV85pW
         mUAcisdr+xBPg+fcb1Z35HV/todDVOx476jSAXVGFUuaUrMtV24c8hNXgLZjTltqQpHb
         f+fuxNdnEGXlCMPclc3UZM9wS7VTuRQ2+QgdXsax7xNSgc3AWBaTy4OzPBMleY4BILhe
         3k5Q==
X-Forwarded-Encrypted: i=1; AHgh+RqH8ikdD/P8jDzC9ks1OcuWjM5GPFK9xT2eYeZSsB8NhZMheKQoTyZKe7A+z2xLshrKoFl7Y4R+/H2ff8T6@vger.kernel.org
X-Gm-Message-State: AOJu0YzGZ3oVzJiivscx9uE1wtLRfVVdz3D7l50NeOORjBMd4tEbHFrB
	oQK52yeM7letvwwdMlHwsbS4MtF+bN0irkiweofZ31/1DObQlATz/1CnOoIlJQmGuK0=
X-Gm-Gg: AfdE7clh0jX8+EPDsNcZlKYSUTxKT59qGXOvMC4Uen87Bk4mnBHf0RfN2mxFqy6Z6mT
	l8gezUcHIWf9oG4F8tOz+uciKn4E7TZo4nXKibGp7uV6IJlkJ3dN9JGFR044l3YENbD2DBrn0LO
	qrMfvoLOWZb3jvTwXdoYZfHiKVSnoUKVwC81m4Em4ihVOyMVLwTPPt6/Wr+TaZFPTj/PtrYeLtL
	BGhqS68SNIa+JRQjitk1wVExG95uMs0/u0dqwCtFDfsxPzQlNQyLfTENoNv/ooIHvHCTcWPu5FE
	pFuhriqllh+18wPSyg8LZpwuDdurn/2yP6/M4QwIY8bhqCXObZiCIvSi0xNyr3F6AXoCP07047f
	uVXQsGzNvJhyP+z3a7L1MzsHNIQFVW3XNLyu2xuy4lpthDFvp2r2ycicyZcpAro6uTmg4rJuAdp
	sxFR8Xw87fvIe7hQNTfMUwsJuQXyl0LK5Uippo/Gu7iigk+2v1dPx/5Lt3hbF3gPYUQ5dz
X-Received: by 2002:a05:6214:5904:b0:8ce:9cbd:b0ce with SMTP id 6a1803df08f44-90400c8fae9mr11445886d6.34.1783719567574;
        Fri, 10 Jul 2026 14:39:27 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd50e081dsm50984276d6.9.2026.07.10.14.39.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 14:39:25 -0700 (PDT)
Date: Fri, 10 Jul 2026 17:39:19 -0400
From: Gregory Price <gourry@gourry.net>
To: Lorenzo Stoakes <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Rik van Riel <riel@surriel.com>,
	Harry Yoo <harry@kernel.org>, Jann Horn <jannh@google.com>,
	Lance Yang <lance.yang@linux.dev>, Pedro Falcato <pfalcato@suse.de>,
	Russell King <linux@armlinux.org.uk>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Simon Schuster <schuster.simon@siemens-energy.com>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	Dan Williams <djbw@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>, Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
	Miaohe Lin <linmiaohe@huawei.com>,
	Naoya Horiguchi <nao.horiguchi@gmail.com>,
	Xu Xin <xu.xin16@zte.com.cn>,
	Chengming Zhou <chengming.zhou@linux.dev>, SJ Park <sj@kernel.org>,
	Matthew Brost <matthew.brost@intel.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
	Byungchul Park <byungchul@sk.com>,
	Ying Huang <ying.huang@linux.alibaba.com>,
	Alistair Popple <apopple@nvidia.com>,
	Hugh Dickins <hughd@google.com>, Peter Xu <peterx@redhat.com>,
	Kees Cook <kees@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@kernel.org>, Borislav Petkov <bp@alien8.de>,
	x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
	Ian Abbott <abbotti@mev.co.uk>, Paolo Bonzini <pbonzini@redhat.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Usama Arif <usama.arif@linux.dev>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, nvdimm@lists.linux.dev,
	linux-perf-users@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, damon@lists.linux.dev,
	iommu@lists.linux.dev, kasan-dev@googlegroups.com,
	linux-sgx@vger.kernel.org, etnaviv@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org, linux-tegra@vger.kernel.org,
	kvm@vger.kernel.org, Russell King <linux+etnaviv@armlinux.org.uk>
Subject: Re: [PATCH v2 28/33] mm/vma: slightly rework the anonymous check in
 __mmap_new_vma()
Message-ID: <alFmh0sm1are2VIq@gourry-fedora-PF4VCD3F>
References: <20260710-b4-pre-scalable-cow-v2-0-2a5aa403d977@kernel.org>
 <20260710-b4-pre-scalable-cow-v2-28-2a5aa403d977@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260710-b4-pre-scalable-cow-v2-28-2a5aa403d977@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gourry.net:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118422-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ljs@kernel.org,m:akpm@linux-foundation.org,m:david@kernel.org,m:liam@infradead.org,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:riel@surriel.com,m:harry@kernel.org,m:jannh@google.com,m:lance.yang@linux.dev,m:pfalcato@suse.de,m:linux@armlinux.org.uk,m:dinguyen@kernel.org,m:schuster.simon@siemens-energy.com,m:James.Bottomley@hansenpartnership.com,m:deller@gmx.de,m:viro@zeniv.linux.org.uk,m:brauner@kernel.org,m:jack@suse.cz,m:djbw@kernel.org,m:willy@infradead.org,m:muchun.song@linux.dev,m:osalvador@suse.de,m:mhiramat@kernel.org,m:oleg@redhat.com,m:peterz@infradead.org,m:mingo@redhat.com,m:acme@kernel.org,m:namhyung@kernel.org,m:mark.rutland@arm.com,m:alexander.shishkin@linux.intel.com,m:jolsa@kernel.org,m:irogers@google.com,m:adrian.hunter@intel.com,m:james.clark@linaro.org,m:ziy@nvidia.com,m:baolin.wang@linux.alibaba.com,m:npache@redhat.com,m:ryan.roberts@arm.com,m:dev.jain@arm.com,m:baohua@kernel.org,m:linmiaohe@huawei.com,m:
 nao.horiguchi@gmail.com,m:xu.xin16@zte.com.cn,m:chengming.zhou@linux.dev,m:sj@kernel.org,m:matthew.brost@intel.com,m:joshua.hahnjy@gmail.com,m:rakie.kim@sk.com,m:byungchul@sk.com,m:ying.huang@linux.alibaba.com,m:apopple@nvidia.com,m:hughd@google.com,m:peterx@redhat.com,m:kees@kernel.org,m:m.szyprowski@samsung.com,m:robin.murphy@arm.com,m:andreyknvl@gmail.com,m:glider@google.com,m:dvyukov@google.com,m:rostedt@goodmis.org,m:mathieu.desnoyers@efficios.com,m:jarkko@kernel.org,m:dave.hansen@linux.intel.com,m:tglx@kernel.org,m:bp@alien8.de,m:x86@kernel.org,m:hpa@zytor.com,m:abbotti@mev.co.uk,m:pbonzini@redhat.com,m:shakeel.butt@linux.dev,m:usama.arif@linux.dev,m:linux-mm@kvack.org,m:linux-kernel@vger.kernel.org,m:linux-parisc@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:nvdimm@lists.linux.dev,m:linux-perf-users@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:damon@lists.linux.dev,m:iommu@lists.linux.dev,m:kasan-dev@googlegroups.com,m:linux-sgx@vger.kernel.org,m:etnaviv@lists.f
 reedesktop.org,m:dri-devel@lists.freedesktop.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-tegra@vger.kernel.org,m:kvm@vger.kernel.org,m:linux+etnaviv@armlinux.org.uk,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linux-foundation.org,kernel.org,infradead.org,google.com,suse.com,surriel.com,linux.dev,suse.de,armlinux.org.uk,siemens-energy.com,hansenpartnership.com,gmx.de,zeniv.linux.org.uk,suse.cz,redhat.com,arm.com,linux.intel.com,intel.com,linaro.org,nvidia.com,linux.alibaba.com,huawei.com,gmail.com,zte.com.cn,sk.com,samsung.com,goodmis.org,efficios.com,alien8.de,zytor.com,mev.co.uk,kvack.org,vger.kernel.org,lists.linux.dev,googlegroups.com,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[gourry.net];
	FORGED_SENDER(0.00)[gourry@gourry.net,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gourry.net:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gourry@gourry.net,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[92];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,etnaviv];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gourry.net:from_mime,gourry.net:email,gourry.net:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,gourry-fedora-PF4VCD3F:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BA40673F0FD

On Fri, Jul 10, 2026 at 09:17:09PM +0100, Lorenzo Stoakes wrote:
> Determine if the VMA is anonymous early on, so we separate the logic which
> invokes callbacks from the rest of the logic.
> 
> This is in order that a subsequent commit which asserts correct virtual
> page offset for anonymous mappings correctly asserts this for new anonymous
> mappings.
> 
> No functional change intended.
> 
> Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>

Reviewed-by: Gregory Price <gourry@gourry.net>


