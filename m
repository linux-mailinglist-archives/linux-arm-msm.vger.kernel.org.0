Return-Path: <linux-arm-msm+bounces-118413-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HJeXDc5fUWqqDQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118413-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 23:10:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 70FAD73EA67
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 23:10:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gourry.net header.s=google header.b="IeOfG/44";
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118413-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118413-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4C27330131B3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 21:10:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E8CB3B42D9;
	Fri, 10 Jul 2026 21:10:05 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A825E1C3BF7
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 21:10:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783717805; cv=none; b=eGgb86IQhx9bjhxCEAz2quNWkSjn3B+1gaUzhFH8UPrLZpDmwVStHdrQ36eHrnpZEZNuNA9vIlnaMwi8VCQ3ZpJOSnLtyPgCpJoiL1Vd+ETq7avdTkuJDKt++nfSpIAFCpj61bnVH/k8InxMGXHWrnwR39TgA/SsFvBxEK8KZm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783717805; c=relaxed/simple;
	bh=dNW60Nn0Pk4RAFrYvjK4f4wy+wh7S7nAq4Uli4yrIhU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iX9zYNYTce/PSyz478ATLA9YtJAo7P0s2J+n1smCBv+Z2MUSR3OI3fXTe7CYAj2L22rEScoGaucCTcb5DFbljzEbBuJCztxx5c0U50mX3xe7eQJx0O4uVIntyYgiLzlI39Cg944d0x9ggYrAmSUt4J/EjelGzktU1CsuIeQ24Mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=IeOfG/44; arc=none smtp.client-ip=209.85.219.53
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-8efec2c28f8so10841236d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 14:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1783717801; x=1784322601; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FM5wmgcpnXqQ2LPOtHbLfNIfX5IHSF2YMfcySjsQd8k=;
        b=IeOfG/44lUDhZNIy2n53/oJ2urnUwg/8zqSNAqnWhDDzsuc2hRT/2MJ44iW3PIUUdY
         0cKCLWB1ldejcRPaxLKKE2HNwwb5n6ERzHg4JGWFDufdCh56F770PixKeR5QwDzQznz1
         Jmx/9iGCwJs5BmrWXg5kE7KtFI3LPyXEmWOGL3lAh64raZt3/H3BRH4jM+3Ckk1pq0gS
         AVdCqYlgpu3IdxLLPaWkz2qyyo3FTRx6zjiABH8qF1KwW2Jm/HULxy3PrZTkOXDKa4ZT
         b0yZMAD13765/Yo1FNsj9VMVnFaBJKi3QlTJITHTFpoqoSFecjMGs9mDCknxy9BlA7ql
         oyTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783717801; x=1784322601;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FM5wmgcpnXqQ2LPOtHbLfNIfX5IHSF2YMfcySjsQd8k=;
        b=lHMzUpxQme1ruJIKpG/pwmj3kbrT2eyyU7VYrCLa7d9/Rm1yZ3n+iAcHR5AzR+Egrx
         vb6Ba5XLBGy4lN1PTkvNNM1sOcrq48KEzFiyxC0MJjpBclz9SPtg9o7SDMAWCEVcS9nT
         ebYsRuvM0RXUQu+6YgEWLBuuUt25fufmX4V9opEtJy1yOrJXuJlWT+vzSw7nErEp4ZVy
         LOfepMZK2+urmsWHfjtRZqUPqGssoQbcLrPe3s6KezNXXzO+mOKUi21OO6e5Imun22hw
         3QQArMDzlq1Ttjwq+V/ZWjhKNMcEv+wcsJTehrXJIn8L3rjvZDgex/BZKccAQm0oa72J
         xSLg==
X-Forwarded-Encrypted: i=1; AHgh+Rr68zIQoCJTzjISdYJyUbGnARIY9FdmPe1YOQ8LQtLgeEovYFzaNN2Nlmj3o74W5MOehaAf2XFBgPzFiKie@vger.kernel.org
X-Gm-Message-State: AOJu0YzOeb53Ot29x0gP6E3SzNI1c1pqgtxzETmgEA47ti4N11EZskee
	ZlrM/CA+CperQKN9Q5za/z5CJiG5gnp/tXqCXqO4RcnNSQSjP/r8AaHNU9r852maeY8=
X-Gm-Gg: AfdE7cmIEW6JAtFs+xnJDNw4TX9ehdfe0j7zBXlW4BD1cWU4OsAMgzizKTVxzjDGiVm
	7hHz4rAkzOuL/S+iRm4cM/9GioFhviWbUxMucdFcrGKjgRdWElRCnp8uinEB89+4ABtAJB+E3k6
	4Jme2tCZPSOJzlxU4T8DwK6DHoIhKDXw/0brYSqyx4yBnZD1QRK+HPFw5k2Ec+Hm2SYXu98IGOA
	f3EiGlU/aqDvrRBRFVLHD59azyLAuCEcPkr3S8VgF8y09knHcPRky88FCziLGv9Sdbtmb6ITirh
	ML6McmqaHnS+6uqYBZONUBbjTilDTTTrvIiPQUFvJiT27wLpdEAhKCjLCGLfS0WT06OoN+cZgkg
	UEwf+Bm7zG4xi35BX+Ac6NkYNck+PZb2zSzfO88Pr4uE3pPLf7Z5OZ0FPJM7sSKmCzgnxFGJXVO
	U2Z6i5sVih59c5dpxnTCn50Kxh/6F3FEc3IufQPJk+gpY26gYjfZ0GCkBTSLyYaGjacMjN
X-Received: by 2002:a05:6214:31a1:b0:8d1:d1e1:8360 with SMTP id 6a1803df08f44-90400b7f3e1mr9010646d6.39.1783717800595;
        Fri, 10 Jul 2026 14:10:00 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd87c8d4csm52955776d6.44.2026.07.10.14.09.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 14:09:59 -0700 (PDT)
Date: Fri, 10 Jul 2026 17:09:54 -0400
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
	Huang Rui <ray.huang@amd.com>,
	Matthew Auld <matthew.auld@intel.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>,
	Shameer Kolothum <skolothumtho@nvidia.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Ankit Agrawal <ankita@nvidia.com>,
	Alex Williamson <alex@shazbot.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Usama Arif <usama.arif@linux.dev>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	kasan-dev@googlegroups.com, linux-sgx@vger.kernel.org,
	etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
	linux-tegra@vger.kernel.org, kvm@vger.kernel.org,
	Russell King <linux+etnaviv@armlinux.org.uk>
Subject: Re: [PATCH v2 33/33] tools/testing/vma: output compared expression
 on ASSERT_[EQ, NE]()
Message-ID: <alFfopehgN0dkMzM@gourry-fedora-PF4VCD3F>
References: <20260710-b4-pre-scalable-cow-v2-0-2a5aa403d977@kernel.org>
 <20260710-b4-pre-scalable-cow-v2-33-2a5aa403d977@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260710-b4-pre-scalable-cow-v2-33-2a5aa403d977@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gourry.net:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118413-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ljs@kernel.org,m:akpm@linux-foundation.org,m:david@kernel.org,m:liam@infradead.org,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:riel@surriel.com,m:harry@kernel.org,m:jannh@google.com,m:lance.yang@linux.dev,m:pfalcato@suse.de,m:linux@armlinux.org.uk,m:dinguyen@kernel.org,m:schuster.simon@siemens-energy.com,m:James.Bottomley@hansenpartnership.com,m:deller@gmx.de,m:viro@zeniv.linux.org.uk,m:brauner@kernel.org,m:jack@suse.cz,m:djbw@kernel.org,m:willy@infradead.org,m:muchun.song@linux.dev,m:osalvador@suse.de,m:mhiramat@kernel.org,m:oleg@redhat.com,m:peterz@infradead.org,m:mingo@redhat.com,m:acme@kernel.org,m:namhyung@kernel.org,m:mark.rutland@arm.com,m:alexander.shishkin@linux.intel.com,m:jolsa@kernel.org,m:irogers@google.com,m:adrian.hunter@intel.com,m:james.clark@linaro.org,m:ziy@nvidia.com,m:baolin.wang@linux.alibaba.com,m:npache@redhat.com,m:ryan.roberts@arm.com,m:dev.jain@arm.com,m:baohua@kernel.org,m:linmiaohe@huawei.com,m:
 nao.horiguchi@gmail.com,m:xu.xin16@zte.com.cn,m:chengming.zhou@linux.dev,m:sj@kernel.org,m:matthew.brost@intel.com,m:joshua.hahnjy@gmail.com,m:rakie.kim@sk.com,m:byungchul@sk.com,m:ying.huang@linux.alibaba.com,m:apopple@nvidia.com,m:hughd@google.com,m:peterx@redhat.com,m:kees@kernel.org,m:m.szyprowski@samsung.com,m:robin.murphy@arm.com,m:andreyknvl@gmail.com,m:glider@google.com,m:dvyukov@google.com,m:rostedt@goodmis.org,m:mathieu.desnoyers@efficios.com,m:jarkko@kernel.org,m:dave.hansen@linux.intel.com,m:tglx@kernel.org,m:bp@alien8.de,m:x86@kernel.org,m:hpa@zytor.com,m:ray.huang@amd.com,m:matthew.auld@intel.com,m:jgg@ziepe.ca,m:yishaih@nvidia.com,m:skolothumtho@nvidia.com,m:kevin.tian@intel.com,m:ankita@nvidia.com,m:alex@shazbot.org,m:pbonzini@redhat.com,m:shakeel.butt@linux.dev,m:usama.arif@linux.dev,m:linux-mm@kvack.org,m:linux-kernel@vger.kernel.org,m:iommu@lists.linux.dev,m:kasan-dev@googlegroups.com,m:linux-sgx@vger.kernel.org,m:etnaviv@lists.freedesktop.org,m:dri-devel@lists.fr
 eedesktop.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-tegra@vger.kernel.org,m:kvm@vger.kernel.org,m:linux+etnaviv@armlinux.org.uk,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linux-foundation.org,kernel.org,infradead.org,google.com,suse.com,surriel.com,linux.dev,suse.de,armlinux.org.uk,siemens-energy.com,hansenpartnership.com,gmx.de,zeniv.linux.org.uk,suse.cz,redhat.com,arm.com,linux.intel.com,intel.com,linaro.org,nvidia.com,linux.alibaba.com,huawei.com,gmail.com,zte.com.cn,sk.com,samsung.com,goodmis.org,efficios.com,alien8.de,zytor.com,amd.com,ziepe.ca,shazbot.org,kvack.org,vger.kernel.org,lists.linux.dev,googlegroups.com,lists.freedesktop.org];
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
	RCPT_COUNT_GT_50(0.00)[93];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,etnaviv];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gourry.net:from_mime,gourry.net:email,gourry.net:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,gourry-fedora-PF4VCD3F:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 70FAD73EA67

On Fri, Jul 10, 2026 at 09:17:14PM +0100, Lorenzo Stoakes wrote:
> Update the macros to output the compared values at hex for easier debugging
> when test asserts fail.
> 
> We have to be careful not to re-evaluate expressions as they may have
> side-effects. So update the code to take local copies and use these for
> both the test and the debug output.

Aw you found it before i reported it :]

> 
> Also remove unused IS_SET() macro.
> 
> Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>


Reviewed-by: Gregory Price <gourry@gourry.net>


