Return-Path: <linux-arm-msm+bounces-118054-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XSFLGkvET2pMoAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118054-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 17:54:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C7281733292
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 17:54:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gourry.net header.s=google header.b=MkQCpSd2;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118054-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118054-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6EC9730F1C4F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 15:49:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B95633121E;
	Thu,  9 Jul 2026 15:49:29 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C9AE42643E
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 15:49:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783612169; cv=none; b=LSOj+JnEbU7GG1cXhYfo5gPm1EluOWZf34u58WsrElGV5Lz/BwSC9UsWj9cLn05PkO8IpHESFZFxmMXVHY5rhmg2XSRuJVFwfBASVxhsieS7/o+IuB3ZE0pl/Sm4U9XbiC0ywonWFbsvMNQH/fpjkzS3tz/Cqa1WgcafM8xfVV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783612169; c=relaxed/simple;
	bh=0qkqAHRaBHgpB2UR0C6dAMPOVUmsbtzeoEt8MNK67Xo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q36yZ3StuIXiXxLqV85jHaVBxzqMFO4QOG2Od6PMmCgN2Jo6f3mn1xVOs+MGUuDyNCu9vMf368c5SUlhHN0VX1P+hnqXORLEWw1z1AXL4bOtkp3DjrOubK0jZPUmUrP0VT5HRwxte9PROvV1RoVbw8aZ29zNl7Gz7y3osE1vhDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=MkQCpSd2; arc=none smtp.client-ip=209.85.219.48
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-8f1a8e914a9so450536d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 08:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1783612166; x=1784216966; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hryUWYzOZzjuIh9gJx+Hzg+n+E360+tJZh4R7BZGeLA=;
        b=MkQCpSd2m04untsXU1nx9KbvtduhWS0cCQoIcza8A3pVIhVf9PRW/CsEN/DZAtCuls
         p7RoVeKsjloxBKU2AfxnCCAN8lhXWQBNDMfPG7gVZRfQmXhyKackY8MGGcFAEPPVy0Fv
         SDU2e8AQxkDk3sY44SjU+DAZTvcrqgnaYjF6Y4p8tOSybH+22dFesBK1qZJowyT//dMI
         6ZToGGs97IuDvRPOGP/+9UTODYx8cfsPo8904OY1zAoe+0Q0w2DVPfcKw8nstjaGRKyi
         ELgcN2ve0gKuNONy45AfjzXvUlPyOrsp6pJgUy/3Xnn2gf7Puzf5UJmIyCvxOjIpgVPr
         CZNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783612166; x=1784216966;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hryUWYzOZzjuIh9gJx+Hzg+n+E360+tJZh4R7BZGeLA=;
        b=eGdFn/jON5YwbOVaqGPOmdVZ3t6d+gn2R+efwsGKJhiaX16/bvxI2iugZS43K4E0nS
         co/DRRmk/KlFq0HiO0qVeb+QppPWG45kK/+FqEa45h1hvcYktjikNSfz6gE4BkWRymfg
         2sqsgCHw/UCN1atpSXaq/4zssxJRgxfH1oNTF4DygGd4GmC16UdrdwYZGsv6JgvBeiHG
         qJl6zskLdn6U5Ng/x0sIKObjZVoCLa2h8rdxCRbVY37CP48DMWht83zIk3qNUg4mw3wG
         1ZZ6x0IHgYL0yOve8k34YsaEaJSSrvjn16MyLKNEh4SDdaTpWq2QTVbz51ASA+RG2V29
         ONqw==
X-Forwarded-Encrypted: i=1; AHgh+Rp7aHBXOEllTXrAyBKPekeRYEmRnG2wePXsmP3c3jCxOByzSKSQnTMV+LK9oUT3KYzAOvIXkJThAx2271+i@vger.kernel.org
X-Gm-Message-State: AOJu0YwGJUMclRlhQpTO5l5ov/tDp3wZ1SwNMgC61y7doAtuq4zs/2dB
	FaR1aY5U4Xp2qk8aG+o8SSDIfP1+mbzUdDbe8eOFFhr7pqZsrIBp4GQ2h9BNDIVBIGA=
X-Gm-Gg: AfdE7cn7P24eIKirnNzQQ2qu561lCDxsvwkjE3Oyc8zp+roB0aOqKqH4Ik7nl4A+CxC
	cTYsbbfaTLLMmlYz61hwzEMUKA1j9AIUVEeeyL/1hvuxqAOk1OyekoIB5tWoJYxllNJaa4PXdue
	0LOjnQEgqXT2Q7Hc46AEhijm/N/ipFFHszgxpoaxN+Y659ZsbB6PCZhNd5UrhOiYLCseF3JxBFZ
	FGPOImKayKSnZlyWdv0vgFORiLQthcmGP5OIW+8ttj6va2UYKkn2uQtq9Rshqcz5pHaoTH24pWv
	MgtEm7hB6uzGvfn/9qgRvRsBpePWUeAErB4nZdsffEg1KTQUMk5EAy7wt2Ytsl+VRlRr5QE0+sg
	ukZ4ccSzno/MC0v4m93NaVcWs+tx49zoGq7ds7NhjCb5wqBCaSmRt7LYT2h2NgaJPgQz/r45JAY
	fPKJccg1obDgnC2OLmO39xWfDCQT3zLV7jfAzAv4lH+iMqHTzd4w92rog5bO0dKKPnizKE
X-Received: by 2002:ad4:5c8a:0:b0:8cc:2a92:48e4 with SMTP id 6a1803df08f44-8fec217b8bfmr87997286d6.32.1783612165998;
        Thu, 09 Jul 2026 08:49:25 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd7c1d9f6sm20164456d6.23.2026.07.09.08.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 08:49:24 -0700 (PDT)
Date: Thu, 9 Jul 2026 11:49:18 -0400
From: Gregory Price <gourry@gourry.net>
To: Lorenzo Stoakes <ljs@kernel.org>
Cc: Pedro Falcato <pfalcato@suse.de>,
	Andrew Morton <akpm@linux-foundation.org>,
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
	damon@lists.linux.dev, Rik van Riel <riel@surriel.com>,
	Harry Yoo <harry@kernel.org>, Jann Horn <jannh@google.com>
Subject: Re: [PATCH 17/30] mm: prefer vma_[start,end]_pgoff() to
 vma->vm_pgoff in kernel/
Message-ID: <ak_C_o2ehS17Q5HV@gourry-fedora-PF4VCD3F>
References: <cover.1782735110.git.ljs@kernel.org>
 <ea87349d63205bf4c26ea79854f179a9bf8cfb0b.1782735110.git.ljs@kernel.org>
 <akZCg73F-oGzDp1a@pedro-suse.lan>
 <akZGqclqQ6gS12Vv@lucifer>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akZGqclqQ6gS12Vv@lucifer>
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
	TAGGED_FROM(0.00)[bounces-118054-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ljs@kernel.org,m:pfalcato@suse.de,m:akpm@linux-foundation.org,m:linux@armlinux.org.uk,m:dinguyen@kernel.org,m:schuster.simon@siemens-energy.com,m:James.Bottomley@hansenpartnership.com,m:deller@gmx.de,m:jarkko@kernel.org,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:abbotti@mev.co.uk,m:hsweeten@visionengravers.com,m:l.stach@pengutronix.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:patrik.r.jakobsson@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:tomi.valkeinen@ideasonboard.com,m:thierry.reding@kernel.org,m:mperttunen@nvidia.com,m:jonathanh@nvidia.com,m:christian.koenig@amd.com,m:ray.huang@amd.com,m:ankita@nvidia.com,m:alex@shazbot.org,m:viro@zeniv.linux.org.uk,m:brauner@kernel.org,m:djbw@kernel.org,m:muchun.song@linux.dev,m:osalvador@suse.de,m:david@kernel.org,m:surenb@google.com,m:liam@infradead.org,m:willy@infrad
 ead.org,m:m.szyprowski@samsung.com,m:peterz@infradead.org,m:acme@kernel.org,m:namhyung@kernel.org,m:mhiramat@kernel.org,m:oleg@redhat.com,m:rostedt@goodmis.org,m:sj@kernel.org,m:linmiaohe@huawei.com,m:hughd@google.com,m:rppt@kernel.org,m:kees@kernel.org,m:pbonzini@redhat.com,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-parisc@vger.kernel.org,m:linux-sgx@vger.kernel.org,m:etnaviv@lists.freedesktop.org,m:dri-devel@lists.freedesktop.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-tegra@vger.kernel.org,m:kvm@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:nvdimm@lists.linux.dev,m:linux-mm@kvack.org,m:iommu@lists.linux.dev,m:linux-perf-users@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:kasan-dev@googlegroups.com,m:damon@lists.linux.dev,m:riel@surriel.com,m:harry@kernel.org,m:jannh@google.com,m:patrikrjakobsson@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[suse.de,linux-foundation.org,armlinux.org.uk,kernel.org,siemens-energy.com,hansenpartnership.com,gmx.de,redhat.com,alien8.de,linux.intel.com,mev.co.uk,visionengravers.com,pengutronix.de,gmail.com,ffwll.ch,oss.qualcomm.com,ideasonboard.com,nvidia.com,amd.com,shazbot.org,zeniv.linux.org.uk,linux.dev,google.com,infradead.org,samsung.com,goodmis.org,huawei.com,vger.kernel.org,lists.infradead.org,lists.freedesktop.org,lists.linux.dev,kvack.org,googlegroups.com,surriel.com];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,gourry-fedora-PF4VCD3F:mid,gourry.net:from_mime,gourry.net:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C7281733292

On Thu, Jul 02, 2026 at 12:30:59PM +0100, Lorenzo Stoakes wrote:
> 
...
> static inline unsigned long vma_offset(const struct vm_area_struct *vma,
> 				       const unsigned long address)
> {
> 	/* Retains page offset and tags. */
> 	return address - vma->vm_start;
> }
> 
...
> And I'm not sure it's really all that useful. Perhaps retaining vma_offset()
> would be though.
> 

Silly question:

   What's the purpose of retaining tags in a non-address value?

That sounds like there's fragility just waiting to be broken.

(I presume you are talking about things like ARM MTE and such, right?)

> This is one that I think makes more sense.
> 
> But in general, I'd rather hold off from yet more churn here.
> 
> I'm making these changes to establish a basis for virtual page offsets
> introduced in [0], rather than just cleaning up in general.
> 

I agree with this.  If the refactors here suddenly have to think about
corner cases on things like tags, that's better resolved separately.

~Gregory

