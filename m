Return-Path: <linux-arm-msm+bounces-115193-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7+BaFiiTQmoM+AkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115193-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 17:45:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CA90C6DCE19
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 17:45:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gourry.net header.s=google header.b=WCLcnhWp;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115193-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115193-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3064B31ED359
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 15:31:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3CDC4071CD;
	Mon, 29 Jun 2026 15:31:19 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68CEC3EA96F
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 15:31:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782747079; cv=none; b=srVBzOCK1SdSVq03E1pjwbSvSFxquksQTylz81D9bHxzET0Xl+/kXwS9KMbN/yH5ahzlNLocSswUIIDsPqcre90Rw2wNeK4dEQNDnBrLpB97PCeSTwkDJ5uBi36RKbG5HC1Kj2C2ms+bbwL8PNv308Pq4jphdYMEKOhgu9+afI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782747079; c=relaxed/simple;
	bh=eSLebA2K6K0JqwA20gSpIaLBxceDZU1DyvE+HEyhHoc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GWpnJPy3whFOtKkyaiYBQStLngnLWUD1VlyUwEbGWz4IzRgHmoTNBK+S5jJLSRQhy5nuIhRyq0tHMHUJamc1ZbrbW3R+Q2Nb1le6bkJjAor8krPUhDf/FCoppZbRgRuSNRw85vjdq6teA2tg0L8OVHry4cZ0zAeAFhxRm1u+yEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=WCLcnhWp; arc=none smtp.client-ip=209.85.161.54
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-6a145935764so1133600eaf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 08:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1782747077; x=1783351877; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TtnRVAeDbe2jCD/DHkmGFKsvQqrt7nLFRBhYCay7qN4=;
        b=WCLcnhWpf7I8vxLvaDK13rqwV768hOMWQx3Cs32tapStGxKFc5PSkHyyxm/qd0f6um
         hu9z6uLVCdwWPfSVWBd2TJUc6UfaxIlfe8FZ9RXCykQLTO2692OQNDVBnsKuM4B1JJQE
         6W/lhFZSfUONNP1pQhwFgEsnZv/pL5LkqssPv9R8nifaUbtdHTpvu6P81zd5uRAqhz+c
         6B6CjwGuwLBmIMMYDBuGLnuU8LUKUrHil+Rlw1R8kg9Z35oW+08106oj/zjCblQvsZI1
         dvZcq8/m69vYHm+wc665i4ljxxQU5aew6njTJlPlnMt56WjzD8bl0Lc2nGD3S5+wFILM
         8IpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782747077; x=1783351877;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TtnRVAeDbe2jCD/DHkmGFKsvQqrt7nLFRBhYCay7qN4=;
        b=DyfLPWYklv47+sH4mCIgmAac4vMPmO415TqK/Jmo+Pc5ScNqpcFm23RUzthzBi3d9R
         Ux2zRuF+OC/Y8XEJkJpKO5eMva8W1fzFjDFX8R8skssTePFA/rZ8V+5VG4GnjU1fabWm
         RVId6d/zcs5A1MNQOn4wUcFApIQOrRfGFByxA2AkmoyRrylXnfbHMAwsIvEgkLlqsm6o
         W/Pu3TZuUL6Z0+XvQDutwaK3U/SG/fNJesDMylcTky0zm7V1KmoLjXwKocLQm+rai+Tg
         +BXhnJ/iBNlS3m7wqTFPwzAldPy9cqfbFLsNTuK6nOcz+IbjBnT9J7URmuQbKYpJUJ7f
         nZYQ==
X-Forwarded-Encrypted: i=1; AFNElJ98wuQz10p6nNm0YoQKJSaH0yiurY38HEMPiXRP6avroJdEiCB/qsvi8qkvGiSKp33rQEWRqIaS41xa1mZG@vger.kernel.org
X-Gm-Message-State: AOJu0YybirEq930oRGRs1bwAx826VP7LuF/FVsLslKg3LdbuL8AEx2fx
	u6tkolVeKMCsZUWFnI0NX4VVN+9xMQyEaqFeMfZ/aSkq2HfEGuoQ5Ykt/oD2w++G6t0=
X-Gm-Gg: AfdE7cno4BxlTHG1wbS2y8zCyAINOTcB3xvu8XltdzQ2BcEPFyFs/RpxpE5AjdwPQWZ
	QBRnzcb5qyrm7KgA/bYSk59qJmfSh/dmv09OK2upB08uBhKMJ8hH/PtjnSKBL1iRhoaAjdL4he+
	UfHNHk7K4kiZ9B55/vAZjlRF/SpfPvT2wwub+zwKRC+LVdg0POTjEB3tCa21HrdGT7cPOvtnchN
	uCPkVCo4TSntMyWOPiXIC0mCyl9buwZHbFg0U+h89KcmJZgC/ixZ4Q72sd+z1pXBmJvXym2EgZR
	EwlMXBQIiC94fDlh2Ci+fE2jDT2Fre17u5+tPWrTxRl1vvGKA40eTUlc/MJLkC/R0MsLrKVgjMZ
	bpZ5mVLGHlkeqOydepy05G+fSK597R9VvUwAk5aYK6aPlbXG3mVZC+ERuH9z3Wkp+a9b6zZI614
	8pS+/A4ozDcSIbqUu5MqJQN1XfZTchdpSk2kzmgfnQfkj2SMQKrBHSDYNAyyjwB6JD7HC12ObKA
	kvLqU0=
X-Received: by 2002:a4a:e914:0:b0:6a1:524b:1f5 with SMTP id 006d021491bc7-6a1891b6f09mr98038eaf.42.1782747077395;
        Mon, 29 Jun 2026 08:31:17 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e6213b95esm9184285a.5.2026.06.29.08.31.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 08:31:16 -0700 (PDT)
Date: Mon, 29 Jun 2026 11:31:11 -0400
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
Subject: Re: [PATCH 02/30] mm: add kdoc comments for vma_start/last_pgoff()
Message-ID: <akKPvwYs-4TwYwKO@gourry-fedora-PF4VCD3F>
References: <cover.1782735110.git.ljs@kernel.org>
 <8c618dfd7de419e3b797b8bd1cd921d4c5b8878b.1782735110.git.ljs@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8c618dfd7de419e3b797b8bd1cd921d4c5b8878b.1782735110.git.ljs@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gourry.net:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115193-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gourry.net:dkim,gourry.net:email,gourry.net:from_mime,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,gourry-fedora-PF4VCD3F:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CA90C6DCE19

On Mon, Jun 29, 2026 at 01:23:13PM +0100, Lorenzo Stoakes wrote:
> Describe what vma_start_pgoff() and vma_last_pgoff() actually provide in
> detail.
> 
> This is in order that we can differentiate this between functions that will
> be added in a subsequent patch which provide a different page offset.
> 
> No functional change intended.
> 
> Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>

Reviewed-by: Gregory Price <gourry@gourry.net>


