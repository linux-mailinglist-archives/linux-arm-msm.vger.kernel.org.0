Return-Path: <linux-arm-msm+bounces-118364-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ruYhBQFIUWo/BwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118364-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 21:29:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6450873DC4A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 21:29:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gourry.net header.s=google header.b=dbm+yKTe;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118364-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118364-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7DCD630131CA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 19:26:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D5F7383316;
	Fri, 10 Jul 2026 19:26:08 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33AE7382299
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 19:26:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783711568; cv=none; b=SljYtPDUUYRwvFwiVuGtSmBlRWe0Fg75p6l1huqP10NvX/AerDBvm667ucOUO2uP1rKMHaGzm725wGLcbI5uF9oGuJzw06C02QwKggrpx2AkzckUYKcjevY/1wJ2rIBksORVghA5NrMN2ip2n9gbaVix203ZpNezVcPeD4jhfaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783711568; c=relaxed/simple;
	bh=QOojT1E2vhWM7tSRUHih+fCOI5zTfyzCTjJ63JRhM4w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jxzdmgpe5UTxqVjGZdv2VUQZ67uLkIlqa2gBQKPw3wIwCp2rlT0gJKfgdi7+8gK//tcf7mb0GkeGXX3R0WKgZLZtIQKMjwEdMPchPmDV5q9JJ4YWzkSR/JvsBmxHpaws5nJHfvTyMJOL0FtYhFQ2RngAwPm9Vn1gEXHQ1XQLsbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=dbm+yKTe; arc=none smtp.client-ip=209.85.222.179
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-920f33347f5so69157985a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 12:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1783711565; x=1784316365; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aHwFumUUjp1dZn3azv3jRxV2z4/4b2Y11BxxEMyANyA=;
        b=dbm+yKTeJMcBsc/CYkcTAQ4TIaGcuSrF3MF8158c1/hSDk31EH/NClDCmOcYl88b3+
         hXK2sJzbsspq3YRmQe/WvOsgPfE3Qzw5eyC/EKH6hSvkj/mG9cOY7C4On4sX5yfxN23N
         IIZT62bWwMkkXTTwstqxKOhh8SSCO4kYe+3dI0dJ/f0zNPLVc0f/SCNfGd7jQQdwLW8y
         BbAHzwTvJM0kOtacFFyDuHKqRY4VG9oFO8eAMNtw/Gb2mSJuYiE890oQvrnVkH2rMIL/
         9/oLWYzMWVDHe+7TRYQoM0jPmN3lg+xFcC9eeEkkAzAAR19IeCxBEu5izY1fuWnQK5w2
         rTwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783711565; x=1784316365;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aHwFumUUjp1dZn3azv3jRxV2z4/4b2Y11BxxEMyANyA=;
        b=CRBkocxZXFZbgR85TIoRuibtR1nL0VbQd2dlhZowOlEcMfP7nqZW+RCLI0/IVRLXp7
         T4K9074jIZ/gNH3LkOR4DUWJ/CU2K7sVgXn0NEAWZcCnwp4y4g+zi/fu7pYcwGwhrW8E
         EzxHv8mt9eYlIg5IpUAVTVlXzLlb7dAQMrH0Bogofrza7FpHawqolsOT4l8QlhTWfAo/
         F9GPdcMrszienBHNHRz+RrWpggrNFg76vM5G651xOL1RPYPnlXo1VkIHtg0wUrfi/gxe
         mCV8DhXgnLd01bfDUKbCBMZOVI2s4kW6+ckdYPWtgx95aR263vKa7cM/x/pjIjLpxceC
         yfPQ==
X-Forwarded-Encrypted: i=1; AHgh+RrW6rd1q2gReESjQVkJWL5vSjtGyQR02dMK3CPqxwy8YYB4UZKq5NQOGSzl+nNJsyg3TAYYP8QhZ55NDY2F@vger.kernel.org
X-Gm-Message-State: AOJu0YySVVyJCepQGawy7jnaSKQTy28XQqBVfGw7rRlxf5OimivxpNPQ
	n32IIeJEgQexLaoJ/9kKgmqPVwpkeElVVWeo2FwNVCRFeeXqOxlmfzcXu2kUO9TrulU=
X-Gm-Gg: AfdE7cmf1mAapOff62MpppJkpwJj3rKi680zf7BPpibRjhsvYrDwRUskVjHJ4ss7WwZ
	iy1DpjcKYKYAH5keqm2wSUqOq9epSbs9/Atbn+0KH3QjnlfDdz7RKBMcNflPuFoYQ6uJr2CXPHC
	qjrsV67YBZACRg/C/C7PO8sqkBple7iyiqfD5IxDG2kKBpqpL1pAbABqnWiMmskSX3Wx8h6sBNh
	I0bBkccbpNbOQbE0X3o3IADqGBILrqg0xIO3Ih8nfMUQmolGQ/YqUdOuN4WFKU87mo2QeM7qan4
	USN7D79AnNVwofB94EU2I0jyZUsJ1cyP4BZnNQlYce2B6+1utI/C5nUlb47UbkOIE6WdO5tIvZP
	dPhKExiOdPOqCU1rq3Qwy78Fw9UeuxmOxm7w2oTVGy8AzVcM0vQm1TSVX4OLYYwB5WTb5nn+mEs
	cLcECFyeS1QP+JoQpBHVVYiTw9dF84/qY6l0Scrtws2jp5jMbvr6w2QiHL4SRgEM05q1N7psOqt
	cBrSlM=
X-Received: by 2002:a05:620a:2993:b0:915:8502:f7f6 with SMTP id af79cd13be357-92ef2b575e8mr66564685a.35.1783711565033;
        Fri, 10 Jul 2026 12:26:05 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92ee5d37540sm265182485a.38.2026.07.10.12.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 12:26:04 -0700 (PDT)
Date: Fri, 10 Jul 2026 15:25:59 -0400
From: Gregory Price <gourry@gourry.net>
To: Lorenzo Stoakes <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Russell King <linux@armlinux.org.uk>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Simon Schuster <schuster.simon@siemens-energy.com>,
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>, Jarkko Sakkinen <jarkko@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	Ian Abbott <abbotti@mev.co.uk>,
	H Hartley Sweeten <hsweeten@visionengravers.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Christian Koenig <christian.koenig@amd.com>,
	Huang Rui <ray.huang@amd.com>, Ankit Agrawal <ankita@nvidia.com>,
	Alex Williamson <alex@shazbot.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Dan Williams <djbw@kernel.org>, Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	David Hildenbrand <david@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	"Liam R . Howlett" <liam@infradead.org>,
	Matthew Wilcox <willy@infradead.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Steven Rostedt <rostedt@goodmis.org>, SeongJae Park <sj@kernel.org>,
	Miaohe Lin <linmiaohe@huawei.com>, Hugh Dickins <hughd@google.com>,
	Mike Rapoport <rppt@kernel.org>, Kees Cook <kees@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org,
	linux-sgx@vger.kernel.org, etnaviv@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org, linux-tegra@vger.kernel.org,
	kvm@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	nvdimm@lists.linux.dev, linux-mm@kvack.org, iommu@lists.linux.dev,
	linux-perf-users@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
	damon@lists.linux.dev, Pedro Falcato <pfalcato@suse.de>,
	Rik van Riel <riel@surriel.com>, Harry Yoo <harry@kernel.org>,
	Jann Horn <jannh@google.com>
Subject: Re: [PATCH 27/30] mm/vma: correct incorrect vma.h inclusion
Message-ID: <alFHR3fg8K1-SITK@gourry-fedora-PF4VCD3F>
References: <cover.1782735110.git.ljs@kernel.org>
 <22d0f4e3fe11f6fd1312734e242d008267ad142c.1782735110.git.ljs@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <22d0f4e3fe11f6fd1312734e242d008267ad142c.1782735110.git.ljs@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gourry.net:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118364-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ljs@kernel.org,m:akpm@linux-foundation.org,m:linux@armlinux.org.uk,m:dinguyen@kernel.org,m:schuster.simon@siemens-energy.com,m:James.Bottomley@hansenpartnership.com,m:deller@gmx.de,m:jarkko@kernel.org,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:abbotti@mev.co.uk,m:hsweeten@visionengravers.com,m:l.stach@pengutronix.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:patrik.r.jakobsson@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:tomi.valkeinen@ideasonboard.com,m:thierry.reding@kernel.org,m:mperttunen@nvidia.com,m:jonathanh@nvidia.com,m:christian.koenig@amd.com,m:ray.huang@amd.com,m:ankita@nvidia.com,m:alex@shazbot.org,m:viro@zeniv.linux.org.uk,m:brauner@kernel.org,m:djbw@kernel.org,m:muchun.song@linux.dev,m:osalvador@suse.de,m:david@kernel.org,m:surenb@google.com,m:liam@infradead.org,m:willy@infradead.org,m:m.szyprow
 ski@samsung.com,m:peterz@infradead.org,m:acme@kernel.org,m:namhyung@kernel.org,m:mhiramat@kernel.org,m:oleg@redhat.com,m:rostedt@goodmis.org,m:sj@kernel.org,m:linmiaohe@huawei.com,m:hughd@google.com,m:rppt@kernel.org,m:kees@kernel.org,m:pbonzini@redhat.com,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-parisc@vger.kernel.org,m:linux-sgx@vger.kernel.org,m:etnaviv@lists.freedesktop.org,m:dri-devel@lists.freedesktop.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-tegra@vger.kernel.org,m:kvm@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:nvdimm@lists.linux.dev,m:linux-mm@kvack.org,m:iommu@lists.linux.dev,m:linux-perf-users@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:kasan-dev@googlegroups.com,m:damon@lists.linux.dev,m:pfalcato@suse.de,m:riel@surriel.com,m:harry@kernel.org,m:jannh@google.com,m:patrikrjakobsson@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linux-foundation.org,armlinux.org.uk,kernel.org,siemens-energy.com,hansenpartnership.com,gmx.de,redhat.com,alien8.de,linux.intel.com,mev.co.uk,visionengravers.com,pengutronix.de,gmail.com,ffwll.ch,suse.de,oss.qualcomm.com,ideasonboard.com,nvidia.com,amd.com,shazbot.org,zeniv.linux.org.uk,linux.dev,google.com,infradead.org,samsung.com,goodmis.org,huawei.com,vger.kernel.org,lists.infradead.org,lists.freedesktop.org,lists.linux.dev,kvack.org,googlegroups.com,surriel.com];
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
	RCPT_COUNT_GT_50(0.00)[76];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,gourry-fedora-PF4VCD3F:mid,gourry.net:from_mime,gourry.net:email,gourry.net:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6450873DC4A

On Mon, Jun 29, 2026 at 01:23:38PM +0100, Lorenzo Stoakes wrote:
> The only files which should be including vma.h are the implementation files
> for the core VMA logic - vma.c, vma_init.c, and vma_exec.c.
> 
> This is in order to allow for userland testing of core VMA logic. In this
> cases, vma_internal.h and vma.h are included, providing both the
> dependencies upon which the core VMA logic requires and its declarations.
> 
> Userland testable VMA logic is achieved by having separate vma_internal.h
> implementations for userland and kernel.
> 
> Callers other than the core VMA implementation should include internal.h
> instead. This header does not need to include vma_internal.h as it only
> contains the vma.h declarations, for which the includes already present
> suffice.
> 
> Update code to reflect this, update comments to reflect the fact there are
> 3 VMA implementation files and document things more clearly.
> 
> While we're here, slightly improve the language of the comment describing
> vma_exec.c.
> 
> No functional change intended.
> 
> Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>

Reviewed-by: Gregory Price <gourry@gourry.net>

> +/*
> + * To allow for userland testing we place internal dependencies in
> + * vma_internal.h and external VMA API declarations in vma.h.
> + */
...
> +/*
> + * To allow for userland testing we place internal dependencies in
> + * vma_internal.h and external VMA API declarations in vma.h.
> + */
...
> +/*
> + * To allow for userland testing we place internal dependencies in
> + * vma_internal.h and external VMA API declarations in vma.h.
> + */

Do you actually need 3 copies of this comment or just one copy in
vma_internal.h?

