Return-Path: <linux-arm-msm+bounces-118357-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id q2uhOgVBUWpHBQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118357-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 20:59:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E52973D7A2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 20:59:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gourry.net header.s=google header.b=fxaRVrzr;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118357-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118357-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 93062301DAE7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 18:57:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66B84381AED;
	Fri, 10 Jul 2026 18:57:30 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E32A03803F3
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 18:57:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783709850; cv=none; b=Y3ZgJdSBK87/uRMdH/Jxizri3Dc2sYKX1lSzfrtz5LYKxeuusJLf3l3WhUgmSQHKN8tNZtQ7U8sPHnZVm4EaLMYG6lhIQUmiDgXU0DJia6AIhSp3YoexvzMFp/KXqJe8lMAP+BUhG+u5VBsGX3OApWb/ffVa4DSCAAy8L4P9XyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783709850; c=relaxed/simple;
	bh=mfAQ6U6Pagde6/OTMZV/3pa3xVR9imBJSf9e6QtJA6o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i/HIL/rR0bxjGukZNyno6JbVL2XWR/voxRT7Pc/wKCFuYxFLI4GwRSRUA65vKEpkxcGhHoPCVrL5i/SUH35UPKzS4ttAkgkrHBw0Ta2GN1j/2GyGebjSOpGjNCanmwqgZ724VmmLVsWdR/TlwettHaSUKNS55h3HimR/5rX48b4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=fxaRVrzr; arc=none smtp.client-ip=209.85.222.178
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-92eafc94c9cso66162585a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 11:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1783709847; x=1784314647; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kUriDsQ9XZtRyYKZZfoXUueFFJuZPgSg6lCZHNic6sM=;
        b=fxaRVrzr0pu8Uz/SO7/A7nmTf/OpotguYO9NJQKIkwviKFH5uDnq4kTQpYDajWVd+9
         faZwKB1PVsoYOX/6WOFdDBt5VUDMlX+XBugqcTfI4I+8aywYSLm2Gts3IcALhGIvCG/K
         hHZgu/Zw6gcJZ+xoWFWQcNmy6X8husI3BglEromZ8sXqN5+EvW/wDw0IrUu+X3nSmczz
         PE8+czA5trAIhNeulj7pYBJMlBucJKhEzcYLF+F/qHpTTu4+JBGJTqXP18vS9QbjkqOI
         TaQZUztVq1axOw86ojkd+MdfZfF986LEDKifyKhbCywDWB9d93mAwvELkPXX/paVW27p
         tzvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783709847; x=1784314647;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kUriDsQ9XZtRyYKZZfoXUueFFJuZPgSg6lCZHNic6sM=;
        b=PsylfrfCZ80lGxGs8cLwnOAIEa50W7jxT/+9aNs+aIuVVIU3mdrtMHN9e3L6n022x0
         jJKFbS8cADS5hS06uk8b2+YDpu162lgwogVMR1Zfw8N5wVDG/5F7+vk/XHMM0N9QK//l
         iwluiPKdzqd5QqK2awjMVwiGaIJBJ2gcIcgOO0uMQ0EWxL5pDWdul/Lv8ZjqbOhObNc6
         vuJn78Fm/CmTv9+mIyEN2GK3Zuqoi62KPtJpw3tZB9DAC/jSGbMppKbp//A1mOTuhhep
         9x666uCpnDAsu9jVUGxE4YbAX/u7u8EVxUnyt9phCdb6Zbi8SLBmCpkIF/uu63eF6QLp
         cokg==
X-Forwarded-Encrypted: i=1; AHgh+RqjJzqUXiHdG0fHy6EXNSaxRgLdS8AWZ8U68679IYA2swurbDpTPfiqTB+qxafyI861CgoTnI1aR3n5NQdo@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg+pFxirRbJg2Bd0lZfjlWP8ROMeyxmkeUAlut1VCI3T4uKe4N
	L7DsGGjZ5R+BNAXRuUc331RPQTdZMS0SnZIPLBBrMy7uwBqN1yrNStBZAKfkbjrwqS8=
X-Gm-Gg: AfdE7ckbGpjIfFStBcQMm9EYDJrOEMeQZqDKZrIw7ww3ZcamNkBwyKQ0Kr/VGs+lAkH
	Y+N/YXjnmlZRvHIoYWkX7csJsn8QLE5MehuogNrlc1ZdhMk9g5Pk/v0jAYRJhJLVl+jjmn7z14m
	EUjrSa4KDoo+JXhV2Y1QR4xJ/i2nKp3tpNrTGFT3D8u+JPqUK6cU+XvFn3ye6z5BecNF5902q5p
	Vi6zI7w1+l84hGopHMVD+Dl3jhJy+GtTHoTQJJBzo/uKQWZrPplSXSn7Bc6HAG4DTm8EgY+p2St
	/QWHvUn6Y8ig8MSflI4j40UF9Emy72Sh1Ha2G+9MkGV49DP8Ky1h8F04Vd+KQ12VLCHJb3HX4yB
	uV8icINL8xYq5tJ7ldN57l8GpY+n/Q48bKCXVjDPeSGyu1vnQdPz9mVYW+0o0b7zqwS7sTlkIz1
	VjpaZHk7ipR97zJw2QtmwR/FtLksr4EpR8HvdGiqG3mBB9gZw88tJjDy13Ua73K77LinSE
X-Received: by 2002:a05:620a:d8e:b0:92e:9d63:a6f2 with SMTP id af79cd13be357-92ef2c1ab7bmr45629785a.70.1783709846741;
        Fri, 10 Jul 2026 11:57:26 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92ee5cfdf6fsm275995385a.24.2026.07.10.11.57.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 11:57:26 -0700 (PDT)
Date: Fri, 10 Jul 2026 14:57:21 -0400
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
Subject: Re: [PATCH 23/30] mm/vma: make vma_set_range() static, drop
 insert_vm_struct() decl
Message-ID: <alFAkWCnkYv--Us0@gourry-fedora-PF4VCD3F>
References: <cover.1782735110.git.ljs@kernel.org>
 <62efd70f9f39570724c9552cc7f2aeb5c322b2ff.1782735110.git.ljs@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <62efd70f9f39570724c9552cc7f2aeb5c322b2ff.1782735110.git.ljs@kernel.org>
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
	TAGGED_FROM(0.00)[bounces-118357-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gourry-fedora-PF4VCD3F:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,gourry.net:from_mime,gourry.net:email,gourry.net:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4E52973D7A2

On Mon, Jun 29, 2026 at 01:23:34PM +0100, Lorenzo Stoakes wrote:
> With __install_special_mapping() moved to vma.c, vma_set_range() can be
> made into a static function there and is now completely isolated from the
> rest of mm.
> 
> While we're here, we can also remove the insert_vm_struct() declaration
> from mm.h - the function is implemented in vma.c and already declared in
> vma.h, and has no users outside of mm.
> 
> Also update the VMA userland tests to reflect this change.
> 
> No functional change intended.
> 
> Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>
> ---
>  5 files changed, 8 insertions(+), 24 deletions(-)

Net negative lines of code, the best kind of commit

Reviewed-by: Gregory Price <gourry@gourry.net>

