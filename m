Return-Path: <linux-arm-msm+bounces-118362-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UNsQFEhEUWokBgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118362-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 21:13:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C015373D9CA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 21:13:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gourry.net header.s=google header.b=mUx1VT0P;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118362-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118362-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A9E09302F769
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 19:13:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC108383316;
	Fri, 10 Jul 2026 19:13:05 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB927381AED
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 19:13:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783710785; cv=none; b=MZhH9OV80kGYrhWXQdZMwHjs5NtMFXjIj++cwC+SqI8Q1pJIOOKrnAXLUkP4hKaMoufmY3gKRupgeI8xJvWkh0jtd8355nD+toeorVWLPrAELtXvrwF/BApCDNhXXN6VcW+xUEMHLUumz+Y3AEZOicaH8Y6LSKd8FUktPvAmU+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783710785; c=relaxed/simple;
	bh=mbUpbN9JA5TocILiu7DT262VDuT+uIcfX8rdIywuDIw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p9Ro39ps71ArSPezMVhOq2X8TCz1FpY2LBmY6mJKxxSOiDo4ASs3GDqReD0HOc7w/2ugIP65qiaR2tE42EFe5GDJty4rGv2FhG8x2gCbUhFAqWiG1v9NO7PGQs63NAuNO+uQXMc7VrQOrR7oFma6v7nb983Ica1SQFyibGpX+VM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=mUx1VT0P; arc=none smtp.client-ip=209.85.219.44
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-8ff5d1b0f91so7633796d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 12:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1783710783; x=1784315583; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Zl1BBUQ1SVF8WlDcAjuqmqY9e/JVxV3t5chHRhyKtnA=;
        b=mUx1VT0PIOg/xwhlOTlIJEriNCZxkdBJZVjc9C5uxphAkNM8EEs2imYn5i1hgOnvX4
         xwXlqQICD+cOrqA5hIZZbrZaES3jwUi5ChfT30etJK+PoH8/mA2cDMsBTFHDmhUP0FPt
         z/CMZnu4OqUu+aiDWu+sem1azbKqRtlmsXojxJbFE0lsZeP1Hr3d6/Pr6CVkhwBKqRN5
         ogd26C6iV69u+TuQzA1Fh2frC1svhr669/Z61r8cEK1brwL4XRueu3Ptbu8FgsDJfzXO
         2DGBKApV0OVyOjSpaaYZ0h/o1TqS/+tA7LhRSCDGyE0WzhLeouwLG22YQFz+ZET9fA/U
         n8cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783710783; x=1784315583;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zl1BBUQ1SVF8WlDcAjuqmqY9e/JVxV3t5chHRhyKtnA=;
        b=F4zCTsTXvH9YQUF4kbOq87NmYURAafZyS0USnEj0hjVvHKhJVieADP4yKAkz7Cb8lj
         0sUOu6eFm1SBoukPtE10jVW3+bQzj9ubvYS19zHpP2e4r9YBJ3LO7Trh6xllwsbDRGWn
         jyRfsWawA3ax9Oq5DuEG+xwwCnr7K/U3g+OI2aRuhUEYHFqG/S4MSK1j8eLl36SsAefK
         HjJOuakOYhet/E4CvItRS3yeKEF1AuwYKD6RDfsaFvhyJ53xdVQMZ9WtwurW3lz6Xde6
         Fu6UaBxP12zJbPMtwArz0SM6fhEpRytN9U54rCnc1CU8q3zYO8c1Ah8QJ8ezuJp8Awwj
         3IUw==
X-Forwarded-Encrypted: i=1; AHgh+RrPHWXwSoFoPStKKJjz3qjKgnmuGWZtM2c7vd5YzBwlXBPiPFlYuPpgRG4u4i4I6su+BJO2qLMOkrl6G3V9@vger.kernel.org
X-Gm-Message-State: AOJu0YwiYSI8QGLReBVISuUSPbUSxUapQACC4jTJ+74QoPwSUlmn+cEw
	w3RR49kOOYWspe0jI0STpTAzSSi3BED2DsZgIAh/C4I3WsGgvKlb+kxkLeuLjPRN4Go=
X-Gm-Gg: AfdE7cl+CXdMptI1NoDlNE/MigjK4iQJY79ycgovbZ48uUmWg66LURKcFshFdga89qK
	yD4bYnrm7QXOnHDMdWr7Yyx7HApPKSCapEU8gxpObT8BysEP2qc8l1DjMB0pEJQUKk2D5taQvza
	w/d5wly2Au0ehIPuoKAs4E87H9DuCm+HE5xxU7htX4a0hUQTqhgPge3pd6+Y7dLfvvBhWVO0ysG
	JaITr/t3BeSpOACAZOOm3yjR1kspuTTJ/GVOW8VHf48GFJPT9dhjUvml5WNP+iAkiLIojlq+FRO
	xC7ZeV/Yh3h9CzTX1qBaJCmbPy+bFv05vrSqHrhWAh/oQDDLqnhP4DM8A94szPjPg/7HAZlu20J
	8TVSbzjYPOK9Ox3hcuqZ6NyB0S/Zbh2h2mURDSnNKjfPHpACELrzykQ6dPa4wcSiTEiQYOzGOmS
	pl5D2Uv5dKCpI88/D/S9KHEHO7PT8gzjW/d/AeYLjlnzj4ednoWpNH27PkwtWcyrr+npE9
X-Received: by 2002:a05:6214:450c:b0:8f0:9d9c:52c2 with SMTP id 6a1803df08f44-903fe450e5fmr5228126d6.5.1783710782628;
        Fri, 10 Jul 2026 12:13:02 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd87c9128sm47321526d6.45.2026.07.10.12.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 12:13:02 -0700 (PDT)
Date: Fri, 10 Jul 2026 15:12:57 -0400
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
Subject: Re: [PATCH 25/30] mm/vma: update vmg_adjust_set_range() to offset
 pgoff instead
Message-ID: <alFEOTiJw2g--9F1@gourry-fedora-PF4VCD3F>
References: <cover.1782735110.git.ljs@kernel.org>
 <910f7b5be78232304dc7ca01cd57c6f5ca8f3d13.1782735110.git.ljs@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <910f7b5be78232304dc7ca01cd57c6f5ca8f3d13.1782735110.git.ljs@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gourry.net:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118362-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gourry-fedora-PF4VCD3F:mid,vger.kernel.org:from_smtp,gourry.net:from_mime,gourry.net:email,gourry.net:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C015373D9CA

On Mon, Jun 29, 2026 at 01:23:36PM +0100, Lorenzo Stoakes wrote:
> We are calculating the pgoff as an offset, since we have vma_add_pgoff()
> and vma_sub_pgoff() available, just offset this value directly and use
> __vma_set_range() for vma->vm_[start, end] values.
> 
> We take care to update the range before offsetting the page offset, so the
> adjusted VMA's vm_start and vm_pgoff are mutually consistent at the point
> the page offset helpers operate - this matters once vma_set_pgoff() comes
> to assert invariants which relate the two.
> 

Given the prior code just did it in 3 lines of code with no special
dance, there's a presumption here that this is done in a critical
section and no external actor can see the inconsistent state?

(i.e. range is updated but offset is not)

Just think about this from a bisection/debugging standpoint.

> Doing so lays the foundation for future work which allows for use of
> virtual page offsets for MAP_PRIVATE-file backed mappings.
> 
> No functional change intended.
> 
> Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>

Reviewed-by: Gregory Price <gourry@gourry.net>

