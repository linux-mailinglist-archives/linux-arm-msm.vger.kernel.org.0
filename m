Return-Path: <linux-arm-msm+bounces-118047-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /ytWGBK+T2qongIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118047-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 17:28:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B63DF732E2D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 17:28:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gourry.net header.s=google header.b=RcHNg+Ts;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118047-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118047-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8DD873044297
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 15:20:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1DEB351C27;
	Thu,  9 Jul 2026 15:20:55 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B96AC366DA5
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 15:20:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783610455; cv=none; b=Yk3+zCM18ik8lnVQqbss6Lx2qVSnRIto2W+gMFiADZyFWGJ2YZ1IDZnuCKPsHuX9yphSwW0GBS6bQ1dxXwyjTuQX1E4vrVOPOm2hh980BVoNNQR0RNUL4zZK46wV5O4iD1ciB7+PcQW/k0kB8489Ep8p7whO3ojX1peekJjWmqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783610455; c=relaxed/simple;
	bh=bI1J+cBiMa2SCkpHmKrJG+azHdWZ7mPEOFo5aU/4c1s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mpZflH4UuqgbxRsCqStEjWw9ZPCjHjR+5kLHa2EPRP+np4RHScJSys4LcczxCvhQASiJW0X5NMfSWD4Ctf+L4r1rrVs5yL15q2H3e+CN2TTIWzaqCujBJ0x/oUmN4cMZMu9KprZfFeTl2SeEh+8faommwUBUp3FIyF/6l6gX+HM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=RcHNg+Ts; arc=none smtp.client-ip=209.85.222.182
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-92ed19f4d60so67130485a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 08:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1783610452; x=1784215252; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3aG5hxu0JYH7EcM/cq6JX5Yef1RoVI9XARU/q8dKmL4=;
        b=RcHNg+TswvftK0rg4pdx5hqB/98t8hg3+kCvMaP3Wvj32IUEgQZ9DN6uIqXYkrZSWA
         1Eu5dZ6dcjNig8HJNvE+HrO3uN3YkcDCXU37P3fJdj3k9VCdvMTFR7yu9VDftTB5iRqA
         K8SDg1lchFzNdcbcs3f9FNQDV5/hxAjH8ASDXRrDVmRioSlH/e6Cr/Z6a8I4QbteOIIC
         HvDkHSwlINZylnxe4+hrpcd6PFlecb7POo21Ozhg6IB09pfT0HXX7rLljq1wRn9Pbbcd
         1U2ZSUGtyb2krIIqADL9WnNTQZIShhSl1bsfu2qXF5pL0rNCLyyOu7Cy0nkMjbppGyxx
         /9Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783610452; x=1784215252;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3aG5hxu0JYH7EcM/cq6JX5Yef1RoVI9XARU/q8dKmL4=;
        b=H3Eiu4PQyTEeNEPrj3UNIh3mUKGWemhQBvpKqqnQwWq0p6mJDr6VQbQ9prRLQR6UNH
         9eBqx6T6AGxqb1fcrUKPC3BROjP3tkO+CUsDSlpUBdffBDqKN1yy0FOXXNzgjrDrkp2E
         KJR1/tizCKZq/nZLvAE8714UP0Hd4yF151jb4y85YHU5mqSgfJ3Ph5NgjQGQt0qmpm/k
         UcCEqnn+1IwQumuLnYe68tGtV7D5B/dDbmFkYZGNsHq1O8YYfjmJ6I0iFIdeAh5/51PV
         w+MViAcHsiAeJqG2LdmVvi6AoCHw6VvvTv+Hqw53tj3PTRWxYc3FtDG601yor9f1VIOC
         9ONg==
X-Forwarded-Encrypted: i=1; AHgh+RrF6NN/3CFMG9f2l80P5e/dVfMif/7e0VimYol6TWY51FtWRA05Jvsthxu7RAZ8emN4n4ArTpEKJUArHV3i@vger.kernel.org
X-Gm-Message-State: AOJu0YwSz5KUX1gaZXzwRZ4TEVTBV1PatefTkOMhVfc0GAT/jKUstj1s
	W5XX775ok8wUP0uBAsrXWWepRQ7+VTg7oUdT5RqqWStm+Uw4trvH6b2fFXZQhDHFr+U=
X-Gm-Gg: AfdE7ckfdZ9w4eUsfkSCADMdimNFqy23mhpOr7fN8HMz3kIjqXD+0/XGBjZoEasTtyZ
	9D3w5+JOCzS88sl3Mx4Ff3LXqoiuRx3tR+oiwm85D1tkjl1UdH40286fi8wXvGHssONFk9BE9sr
	fEVU0j7l+OEdiHYlWpSMxRbbibaWBFhDvGsYTYx+xJPuCxHOB0xYkwic4nhd79PIHoycUMI6HgP
	g7OIB6eSdC1ZMlSnIyTbGmV//kczX4jkbE+zheeDX6Nur+IgQUMeU18qiYa156iDrfwPBNQxanL
	juu6jWKbnf2pSF0PkEajmmm/Qd8Q5ABjEFJaESTfpDPXn27pnr6Vc4EvASF02EEctEA9xJIFKYm
	e1TSP+9gyYQjv9pkYiAkuJeeLSzy+P8P6XGH+/ODVpYNK51Q8iapjGhjRv6kDTrue8d1ZTlpwZR
	QDT9UzeNJUlyK9L3bv/2uFivc7tBxy5oYwZjqiqWifCJbSd69WJYsaZmWFxMRuP12ORt+T
X-Received: by 2002:a05:620a:179e:b0:92a:f74f:904 with SMTP id af79cd13be357-92edab23ef2mr337298385a.1.1783610451142;
        Thu, 09 Jul 2026 08:20:51 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e90ca90a5sm1652288685a.32.2026.07.09.08.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 08:20:49 -0700 (PDT)
Date: Thu, 9 Jul 2026 11:20:44 -0400
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
Subject: Re: [PATCH 14/30] mm/vma: minor cleanup of expand_[upwards,
 downwards]()
Message-ID: <ak-8TKDC1GBOeMOM@gourry-fedora-PF4VCD3F>
References: <cover.1782735110.git.ljs@kernel.org>
 <b24f70b72f0a9e2a37b904e5b59d80b88bd42e4a.1782735110.git.ljs@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b24f70b72f0a9e2a37b904e5b59d80b88bd42e4a.1782735110.git.ljs@kernel.org>
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
	TAGGED_FROM(0.00)[bounces-118047-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gourry-fedora-PF4VCD3F:mid,gourry.net:from_mime,gourry.net:email,gourry.net:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B63DF732E2D

On Mon, Jun 29, 2026 at 01:23:25PM +0100, Lorenzo Stoakes wrote:
> Adjust the stack expansion functions expand_upwards() and
> expand_downwards() such that they are expressed in terms of named constant
> values, and make use of vma_start_pgoff().
> 
> This clearly documents that we are referencing the page offset of the start
> of the VMA.
> 
> Additionally this cleans up the overflow check in expand_upwards().
> 
> No functional change intended.
> 
> Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>

Reviewed-by: Gregory Price <gourry@gourry.net>


