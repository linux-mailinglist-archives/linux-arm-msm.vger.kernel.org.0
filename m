Return-Path: <linux-arm-msm+bounces-61499-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 65541ADBBF9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 23:39:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7ECC7188BC5D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 21:39:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B77F81DF24F;
	Mon, 16 Jun 2025 21:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="N9s0yTSi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C7D2CA6
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 21:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750109944; cv=none; b=ltQHRIlJuUUi3UF+NkUR652dIQIE4cWLLVOhD1rVvzt/m663UObJzXfLmsDBT1X4LxzTNs4JhWX3RTOaq2okQXywegLEjUINxILEfEH8q2qhlQdLw+ANKlDYwpUIzdrXODKU1YcwPhRZn6JnW2e2gPPG/Zhcq1LrEce4A/7S6oM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750109944; c=relaxed/simple;
	bh=QN2i0eqFGWNXPooFbASnWQglHggpPgBSU7wRAUtSHX0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qJRWdi8GsvWRmMi5vq6VgSnAiZkGaR0LdobU+h9OrIGqQeIEkrMb24NQV2JfNSNPPnVZznsIdwCw7XuuP6DO6xoqmR/lTt7V08ju38A9IWMvSt5rejZq/d+IYnthmSSTJ74SENRTQFF7BI37nb98s4Y9Y7re2santh7riAkAuPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=N9s0yTSi; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750109941;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7emt/zNGr/CBhfVNgDPKicHgy2P2Bp4GbdXMzFzaVxk=;
	b=N9s0yTSi2DUgcDMwl2XLDF+1jzncb9KWx1Xk9/E9u6Owqe69wQeJNQozswUu7atK7qQpzt
	ykdGCClt9H5rHwROBU7eKBkbMSI0I2dB8xDaL0/CQUxnKDc74OwIdDkcg4jTMQF9/I3cbQ
	rAE6R/MY2JxfGixoRhgwPtUZz0qJEG0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-404-Wte3RQgxOKWENd4gGucuqw-1; Mon, 16 Jun 2025 17:38:59 -0400
X-MC-Unique: Wte3RQgxOKWENd4gGucuqw-1
X-Mimecast-MFC-AGG-ID: Wte3RQgxOKWENd4gGucuqw_1750109939
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a37a0d1005so2990392f8f.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 14:38:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750109938; x=1750714738;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7emt/zNGr/CBhfVNgDPKicHgy2P2Bp4GbdXMzFzaVxk=;
        b=YFD7q9E/raBY7fWxXnF48XohUZ2oIIDGTVjZUeeyx/MckJfM8EnuxR81Hy4j6JrxF4
         WHSunIgz4j2QCBEUs66B6En6FySr7ILs291kzPz3m4C9GCtBfqhb0e2a7TjbuMiQU8Ij
         mskWKGIyp6R3r4uoSXe9svvSpmEy7MO/bGPmtSEabm1ytbQ+qfswBvPd2G4AH40s51C2
         TYlTdyGxqwH6T7f76qoIGb3iqeqVat1eIQ0lwuHpAqKpCktNWzy9xZzMs4tZZTWiTZdA
         lqJXFwDz6GIMRwXtHANRKY83S5c5gS2Jez+xn4jcRlZbmLF8GLbia+WUpzl5ydRRd02g
         lM+g==
X-Forwarded-Encrypted: i=1; AJvYcCVCNjieR2Q7wnAug9ZdiGSDJ4B5/WWBQIwS8u4wolGMClZ58a3OuO2vF0jzlvlGjKKt6x9z1dCyIPw6VybP@vger.kernel.org
X-Gm-Message-State: AOJu0YxH9H7wNNuIcfW1C5uHVT4GH/n9nkHxZlSCHGzYtStYHp+Ti6Bi
	T/Ti+kygIiLncWv9xY09dAix3Uda3hO11wliLmKK3eec8ETREjxf3C6YONBoXjJwHdx9bnWvann
	U05bTU85EC77x1Q1/mD5lDqNhCGW4kzqwDaST4V8zhQeqB8MXoR1Mp60XEGb+YrqeeEM=
X-Gm-Gg: ASbGnctVGnoJDBXVaIsv6sPA42m9J8ePMiMMgAaAy1jOrh1PnUIkS7QSznWHPHG/Cta
	jLtLdZrQ9qOIDlssaYWMao0bOJpyWFZOgHeYx1aDXY1IoLnUhXaJd9x3ZtJpjI+U6vuJ2ioVYSD
	XQcPQ5l2pHWeoLN4aYdQW91H16C2GX1iBYlLY305pMrq/5PPNZSlyhRexbnM1F8n74Pq6PCYxf0
	Nbu56qe4e7W4XSfabgEgKxktGy/hN+rLejsoVkkasSAIxzc6CAq9Ii+0PNMdrYaSiODWi55A5sV
	eqwshXK2Vt0=
X-Received: by 2002:a05:6000:400a:b0:3a5:2cb5:63fd with SMTP id ffacd0b85a97d-3a57238b522mr9595362f8f.10.1750109938541;
        Mon, 16 Jun 2025 14:38:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEzpDB07Ow6Aq7oaibwATYH2bwGc1v46BbhwhcmxYHu7okQGHS3ELJ0eFf8b83N36p9EgRDvg==
X-Received: by 2002:a05:6000:400a:b0:3a5:2cb5:63fd with SMTP id ffacd0b85a97d-3a57238b522mr9595351f8f.10.1750109938128;
        Mon, 16 Jun 2025 14:38:58 -0700 (PDT)
Received: from pollux ([2a00:79c0:662:b300:abf:b8ff:feee:998b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b089a7sm11887641f8f.49.2025.06.16.14.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 14:38:57 -0700 (PDT)
Date: Mon, 16 Jun 2025 23:38:55 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: Rob Clark <rob.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] drm/gpuvm: Add locking helpers
Message-ID: <aFCO7_RHuAaGyq1Q@pollux>
References: <20250613235705.28006-1-robin.clark@oss.qualcomm.com>
 <20250613235705.28006-3-robin.clark@oss.qualcomm.com>
 <aE1RPZ_-oFyM4COy@pollux>
 <CACSVV00uwmuAC4eMi-4QiF4sOu4r9u8eXxyAgt83YS8Yfgoemg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACSVV00uwmuAC4eMi-4QiF4sOu4r9u8eXxyAgt83YS8Yfgoemg@mail.gmail.com>

On Sat, Jun 14, 2025 at 08:03:20AM -0700, Rob Clark wrote:
> On Sat, Jun 14, 2025 at 3:39 AM Danilo Krummrich <dakr@redhat.com> wrote:
> >
> > On Fri, Jun 13, 2025 at 04:57:03PM -0700, Rob Clark wrote:
> > > For UNMAP/REMAP steps we could be needing to lock objects that are not
> > > explicitly listed in the VM_BIND ioctl in order to tear-down unmapped
> > > VAs.  These helpers handle locking/preparing the needed objects.
> >
> > Yes, that's a common use-case. I think drivers typically iterate through their
> > drm_gpuva_ops to lock those objects.
> >
> > I had a look at you link [1] and it seems that you keep a list of ops as well by
> > calling vm_op_enqueue() with a new struct msm_vm_op from the callbacks.
> >
> > Please note that for exactly this case there is the op_alloc callback in
> > struct drm_gpuvm_ops, such that you can allocate a custom op type (i.e. struct
> > msm_vm_op) that embedds a struct drm_gpuva_op.
> 
> I did use drm_gpuvm_sm_xyz_ops_create() in an earlier iteration of my
> VM_BIND series, but it wasn't quite what I was after.  I wanted to
> apply the VM updates immediately to avoid issues with a later
> map/unmap overlapping an earlier map, which
> drm_gpuvm_sm_xyz_ops_create() doesn't really handle.  I'm not even
> sure why this isn't a problem for other drivers unless userspace is
> providing some guarantees.

The drm_gpuva_ops are usually used in a pattern like this.

	vm_bind {
		for_each_vm_bind_operation {
			drm_gpuva_for_each_op {
				// modify drm_gpuvm's interval tree
				// pre-allocate memory
				// lock and prepare objects
			}
		}
		
		drm_sched_entity_push_job();
	}

	run_job {
		for_each_vm_bind_operation {
			drm_gpuva_for_each_op {
				// modify page tables
			}
		}
	}

	run_job {
		for_each_vm_bind_operation {
			drm_gpuva_for_each_op {
				// free page table structures, if any
				// free unused pre-allocated memory
			}
		}
	}

What did you do instead to get map/unmap overlapping? Even more interesting,
what are you doing now?

> Once I realized I only wanted to defer the
> application of the pgtable changes, but keep all the
> locking/allocation/etc in the synchronous part of the ioctl,
> vm_op_enqueue() was the natural solution.

But vm_op_enqueue() creates exactly this list of operations you would get from
drm_gpuvm_sm_{map,unmap}_ops_create(), just manually, no?

<snip>

> > > Note that these functions do not strictly require the VM changes to be
> > > applied before the next drm_gpuvm_sm_map_lock()/_unmap_lock() call.  In
> > > the case that VM changes from an earlier drm_gpuvm_sm_map()/_unmap()
> > > call result in a differing sequence of steps when the VM changes are
> > > actually applied, it will be the same set of GEM objects involved, so
> > > the locking is still correct.
> >
> > I'm not sure about this part, how can we be sure that's the case?
> 
> I could be not imaginative enough here, so it is certainly worth a
> second opinion.  And why I explicitly called it out in the commit msg.
> But my reasoning is that any new op in the second pass that actually
> applies the VM updates which results from overlapping with a previous
> update in the current VM_BIND will only involve GEM objects from that
> earlier update, which are already locked.

Yeah, it's probably fine, since, as you say, the only additional object can be
the req_obj from the previous iteration.


