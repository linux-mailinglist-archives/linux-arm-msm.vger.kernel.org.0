Return-Path: <linux-arm-msm+bounces-118058-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dt6jKujHT2oioQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118058-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 18:10:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 964CA7334F2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 18:10:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gourry.net header.s=google header.b=sMpYtpBL;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118058-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118058-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 78E0F3004D2C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 15:56:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9638C42DA3C;
	Thu,  9 Jul 2026 15:56:04 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F402F42CAF1
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 15:56:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783612564; cv=none; b=eELF4/lyJhb07Dub546zF2F6d8fTOkU+BROvucc/uMeADJmXT5rSn4e+vHsz50t7gMiIZVpH8fgpT07j0tLwbwtfTbliA11w5WYOXGDlxtYEZ+Pu1wdXBZ2njahHO7/qql3DRCkuWvfIHRY4VlA+W7zLPr/MRnVIau9/hA3yxWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783612564; c=relaxed/simple;
	bh=GOt99IJ7fgZPI8QmxyNzz1MEgzG9KnOmLnnihrfLrQE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=INg3p4c4SDxrEgW/VA9vXrLVCGjSoYt4HKqa/E0hQx9V7uN69Bu3YBKPZDYPkZcCi/yRGMJDIP1+ReZUJ6rK25ofXydqikkyxmC6Ar+EwHF7wfHyEpkMSo26Mu02KFNApFdo/6Dg7H2/iUmPyl8/kZnj1+4H8vY+YGbhG0yBqwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=sMpYtpBL; arc=none smtp.client-ip=209.85.160.174
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-51c04bf4711so16775261cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 08:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1783612560; x=1784217360; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QupnWz0oLATZw6wM2bylQaqDWCRhZF5lJVU8oFwJF/g=;
        b=sMpYtpBLCayfT80R4wzbFZw9l7ecn/vectK5E5n8YBo3056+zypO+Cc5p+yKRJvgIH
         D/H6T9Xrdz6iMSYSYJvVieLq3byHbILjhri9t9JTeNg3KDdjrBUV59FOiPGxnwtT9VLy
         HF1d3IK7IocXO7FJq05gOC0dLYoa87K4H1Npkig9QMat1/arxBuPsjrF4STTmp+4SQnQ
         Vd1Ce49g4dasiNP2aD+fvBhZQJshbx6AC4CXzbMk76CVDp6xBP46+fI2JhSkG6d84zie
         Pt83KOr106cJz+pCklgtC47DW1rTZUKmoVq5ykQpYsi9pRg2A/xacQcZB/ubsxgpernK
         7WxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783612560; x=1784217360;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QupnWz0oLATZw6wM2bylQaqDWCRhZF5lJVU8oFwJF/g=;
        b=neIRiEj93eMFC1dUSsGKNSn8NcFwC/IQoYMQES1C8KVXcuVYSsNwg3SB+YgS7d9l1v
         YDP3kSgxzpmBebjIw/7dITOYMYtICHndKr2E4LF4cKgGOjsOcV+MFsGPRQKZTs/KzFv5
         WQKfyXjYrz/nq6V5RWx+O9EKH5eeQwD34B5CdGB7YUKXtmUD+yytvZALGoWh+GjzVkwK
         6mBYbYzi/hKF+PH9PNG/pBwfA8x/9Hq7JXdwIKyIAHInztBRVsOpfanbgjyUSG0TYAbr
         5iB18v3xDD/oxTlu1Vv9+2kltdmwWI5+VdEMKsKFzhqin1x3fv3pHWItv9cRpwABNWSM
         S7Bw==
X-Forwarded-Encrypted: i=1; AHgh+Rr0a0H73A/SZvzUih3GKIWvC1xSdXs+whbCI2D6FaOWbPX9LFWeDi6KSMUUG6eS78DOrDJLhmFLdzqSTSJY@vger.kernel.org
X-Gm-Message-State: AOJu0YxlD9epfv/8EXLXmhbt43cPOVyOWjdh4T/ebgRZyBESTqw5NBk6
	4Mwku17OvymgSyF17bv5YaMgTNccBGmxrWNPULbxaSbJmKDhCEP6mT5g616s28rCbIU=
X-Gm-Gg: AfdE7cnqc3zOvTX1khq4/V8PPzDV0jIX5pEv5p1Z2ImuI5oLScGrJO/T8jusI9woSvw
	4tFEpqbiAG5cYYJg2T6NL+5YjY7OjhQDf4QE20slbGTvv0McByBS07hYhzLaFhrJ+mLRs17/ztO
	LHCpaVtsj0lM0x+RZtl3KJ912RmcsK3VzgdMZHxVXaA9KYg+kL21HgfQNOyXqeg6KV6+Px4EpjE
	nIMrBunSpJvLkldjpwxupaMDP5Zcz4WRhwd1h2+/A6pOFEBP24+m7p/cga3VD4Vtcfs5m6yn5MR
	GTLD5pBF5VUnO9kgOHxa0SdLmjvypBMpu5oAuh1J4i5P5A29BXvpTktzyCY/NrTYAYynub11LZ4
	gaBdAWW5SNuy6fugXq4Xuh+uxfAquTmm2jFdLQxUYBROjL/9BnNQuiMcGD8IoJtBtzHYAcs+/1j
	x2m2TXjguhVwjuv36+QOAKbfkDP0QjUd90/PGLIqfPdMGWePUC49BVexmMC18wNeMo10eO
X-Received: by 2002:a05:622a:311:b0:51c:185b:29e0 with SMTP id d75a77b69052e-51c8b2ae67bmr82998651cf.10.1783612559586;
        Thu, 09 Jul 2026 08:55:59 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51c41d2d688sm169684691cf.17.2026.07.09.08.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 08:55:59 -0700 (PDT)
Date: Thu, 9 Jul 2026 11:55:54 -0400
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
Subject: Re: [PATCH 19/30] mm: use linear_page_[index, delta]() consistently
Message-ID: <ak_EivwcDDdn1Xvp@gourry-fedora-PF4VCD3F>
References: <cover.1782735110.git.ljs@kernel.org>
 <bf56e2e98b512962a2fb88900d535a0e9e6769d8.1782735110.git.ljs@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bf56e2e98b512962a2fb88900d535a0e9e6769d8.1782735110.git.ljs@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	R_DKIM_ALLOW(-0.20)[gourry.net:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118058-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gourry-fedora-PF4VCD3F:mid,vger.kernel.org:from_smtp,gourry.net:from_mime,gourry.net:email,gourry.net:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 964CA7334F2

On Mon, Jun 29, 2026 at 01:23:30PM +0100, Lorenzo Stoakes wrote:
> There are a number of places where we open code what linear_page_index()
> and linear_page_delta() calculate.
> 
> Replace this code with the appropriate functions for consistency.
> 
> No functional change intended.
> 
> Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>

one nit

Reviewed-by: Gregory Price <gourry@gourry.net>

...
> diff --git a/drivers/comedi/comedi_fops.c b/drivers/comedi/comedi_fops.c
> index c09bbe04be6c..536c25d8dcee 100644
> --- a/drivers/comedi/comedi_fops.c
> +++ b/drivers/comedi/comedi_fops.c
> @@ -25,6 +25,7 @@
>  #include <linux/fs.h>
>  #include <linux/comedi/comedidev.h>
>  #include <linux/cdev.h>
> +#include <linux/pagemap.h>
>  
>  #include <linux/io.h>
>  #include <linux/uaccess.h>
> @@ -2462,7 +2463,7 @@ static int comedi_vm_access(struct vm_area_struct *vma, unsigned long addr,
>  {
>  	struct comedi_buf_map *bm = vma->vm_private_data;
>  	unsigned long offset =
> -	    addr - vma->vm_start + (vma->vm_pgoff << PAGE_SHIFT);
> +	    addr - vma->vm_start + (vma_start_pgoff(vma) << PAGE_SHIFT);
>  

Obviously correct, but was this intended for a different patch?

~Gregory

