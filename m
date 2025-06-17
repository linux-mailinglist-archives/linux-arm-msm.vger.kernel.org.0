Return-Path: <linux-arm-msm+bounces-61575-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 48105ADC747
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 11:57:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 776D51884847
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 09:56:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00AEF2D12E4;
	Tue, 17 Jun 2025 09:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Fi+E+HZy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 456612DBF73
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jun 2025 09:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750153902; cv=none; b=Q+sJTmzj97v/52Zv7fcKFnfXuqyYkdguT7PNiMnSb7YisIWYzjfSDvYC1gOsG+AqVDiWxYyOn3p1KPquBW/WWjMfrecsLYK3ntwffQ5k5pKnl/lHdYWvKu/1J97XLiuQhjg1jRDAR4tC7a1E3JpCAnvuCqVLFFb0pE6VCnwrRx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750153902; c=relaxed/simple;
	bh=8vtl0Cdt6DXG6me1m4jejmsCOnOuNWgjjHF8FIGQbP4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fVOPi5LU5pMJmWwu6kGAxZ+0md9LmdPz1MOs692cLFSb4+KkxyQ5nGnhJtaAgHCFCzE/UkjQVvHGBl38J7v9iUjMFLF/HLuQRq6N7CUpxsUD9Q0eVYGVdUqJZhOvtQhsLPKX+W3OJ5nkhlyfgn55P0FBQ//6Za3kjCOCeUEd8jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Fi+E+HZy; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750153900;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z1J9EKk4I7H6WmvI/18gnTD4j7ClTvJrTACRAA21oo8=;
	b=Fi+E+HZyG2DSpJyknBLdGzyRwsTrsD1u4Oajq+GpYyCK1j3Kf/PUhuphPdRhGtq4RUkIEP
	tmWLZjSzC+9gnxRFVhOEZmKM1+nI6zVOGQzQHHpVTcjIl2vbdWu5aaR+8I0ghEcQDagT8o
	KBQowGyF5LNtPfGVqivVX5nnMW2ftJc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-355-jJBCmur_N2OEEuE0f4SoGA-1; Tue, 17 Jun 2025 05:51:38 -0400
X-MC-Unique: jJBCmur_N2OEEuE0f4SoGA-1
X-Mimecast-MFC-AGG-ID: jJBCmur_N2OEEuE0f4SoGA_1750153897
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-450df53d461so45189175e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jun 2025 02:51:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750153897; x=1750758697;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z1J9EKk4I7H6WmvI/18gnTD4j7ClTvJrTACRAA21oo8=;
        b=v2i/3Z3/s259dPdCNWeb2nl4idplklSVaQc6sENRGdR2KhlXor9IBhrLhpnmtghgja
         aDiFsRMp/faBFjlp2bmYgiGVcWF/FEKqGwrdfEtgd4QKboRA5zmdZ1vgy4WPCSjkZLnL
         ZIARGNpzxdtcd6QcPwrYfmp9lmCnKzO7GWY/UduK3SEIGPkcNH3MwWt/Gc2RVXn+yXxI
         EQMy5nIz4dXApEI9VUFdc9MXygdkFlqjewna7PnrU3rCQMEgqj/g7hUqWardiynf4byX
         SFUOT/2dapZCWYYKn6Jm7J6hAROJItnaAPXvecGi+9Qtf3n5VDNfyFFCDTDQBEHTKy3x
         yXiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXlxB6uN7U5zLGmGW3ieJTTxOHYA3Yu00EuwLn1mxJyZjO7Yri3VcZNjS2XUXCUlFBuUlxBcXEux/i9gcq/@vger.kernel.org
X-Gm-Message-State: AOJu0YxZVKKzhqW4JxhbyfNdDnwocC3DfUfVQ9wxV1TI6A1LZq2bAWGJ
	pUnZjDVa0GnSxGkpkUhmFI204Ns69bhCE7X6+rr85JM1vBmZ2snlKoe99VJVI4TAcafQ57TDsis
	fgEYeFgaKV2zT7SfoZARydnz4F4r/CZqK73KpYGX9TA9D/7JKpUFex8JFfdL0zCuJ7A8=
X-Gm-Gg: ASbGncu8j70YkRX8oraWNfwPXehtB31/+AhCr5pWOQRsMdrOAuWJo3lqr9HQfWm//Cy
	JpDW5t6z4dRf+SytIDDFTivaCnlA+kshq9JP55/Kp0A9VI9It4W5FeMK7tZX1ktIx4cKuIBblXl
	QqyD6LXq40c2wznXMz+ZDjumbrXU4KxVdb7Mt/FNvEtCZe6U2W/nNCQR29k9ZpPBGjebFku1F48
	UPMrjR8gWNmXgT2duoXB+IyurVTSSJ1dyFDOBV2wm9Xet+pOHw0dt8MftaJasCFKGZ5ck7pWgX3
	CZRkyL23+BA=
X-Received: by 2002:a05:600c:8b01:b0:441:d437:e3b8 with SMTP id 5b1f17b1804b1-4533cac9179mr105803345e9.23.1750153897087;
        Tue, 17 Jun 2025 02:51:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFldMEnuo9yC084iP1KvhWhShNC4LmtmIc7iidP4b8onqmO+ZGv8akFrhh6Cvt1pfxb1j8zTw==
X-Received: by 2002:a05:600c:8b01:b0:441:d437:e3b8 with SMTP id 5b1f17b1804b1-4533cac9179mr105803085e9.23.1750153896629;
        Tue, 17 Jun 2025 02:51:36 -0700 (PDT)
Received: from pollux ([2a00:79c0:62e:9200:abf:b8ff:feee:998b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e224600sm171952695e9.8.2025.06.17.02.51.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 02:51:36 -0700 (PDT)
Date: Tue, 17 Jun 2025 11:51:34 +0200
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
Message-ID: <aFE6pq8l33NXfFdT@pollux>
References: <20250613235705.28006-1-robin.clark@oss.qualcomm.com>
 <20250613235705.28006-3-robin.clark@oss.qualcomm.com>
 <aE1RPZ_-oFyM4COy@pollux>
 <CACSVV00uwmuAC4eMi-4QiF4sOu4r9u8eXxyAgt83YS8Yfgoemg@mail.gmail.com>
 <aFCO7_RHuAaGyq1Q@pollux>
 <CACSVV03WboQp_A1bzQ+xpX5DDkfaoXmbTuo9RfZ9bMaVTqdU+A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACSVV03WboQp_A1bzQ+xpX5DDkfaoXmbTuo9RfZ9bMaVTqdU+A@mail.gmail.com>

On Mon, Jun 16, 2025 at 03:25:08PM -0700, Rob Clark wrote:
> On Mon, Jun 16, 2025 at 2:39 PM Danilo Krummrich <dakr@redhat.com> wrote:
> >
> > On Sat, Jun 14, 2025 at 08:03:20AM -0700, Rob Clark wrote:
> > > On Sat, Jun 14, 2025 at 3:39 AM Danilo Krummrich <dakr@redhat.com> wrote:
> > > >
> > > > On Fri, Jun 13, 2025 at 04:57:03PM -0700, Rob Clark wrote:
> > > > > For UNMAP/REMAP steps we could be needing to lock objects that are not
> > > > > explicitly listed in the VM_BIND ioctl in order to tear-down unmapped
> > > > > VAs.  These helpers handle locking/preparing the needed objects.
> > > >
> > > > Yes, that's a common use-case. I think drivers typically iterate through their
> > > > drm_gpuva_ops to lock those objects.
> > > >
> > > > I had a look at you link [1] and it seems that you keep a list of ops as well by
> > > > calling vm_op_enqueue() with a new struct msm_vm_op from the callbacks.
> > > >
> > > > Please note that for exactly this case there is the op_alloc callback in
> > > > struct drm_gpuvm_ops, such that you can allocate a custom op type (i.e. struct
> > > > msm_vm_op) that embedds a struct drm_gpuva_op.
> > >
> > > I did use drm_gpuvm_sm_xyz_ops_create() in an earlier iteration of my
> > > VM_BIND series, but it wasn't quite what I was after.  I wanted to
> > > apply the VM updates immediately to avoid issues with a later
> > > map/unmap overlapping an earlier map, which
> > > drm_gpuvm_sm_xyz_ops_create() doesn't really handle.  I'm not even
> > > sure why this isn't a problem for other drivers unless userspace is
> > > providing some guarantees.
> >
> > The drm_gpuva_ops are usually used in a pattern like this.
> >
> >         vm_bind {
> >                 for_each_vm_bind_operation {
			    drm_gpuvm_sm_xyz_ops_create();
> >                         drm_gpuva_for_each_op {
> >                                 // modify drm_gpuvm's interval tree
> >                                 // pre-allocate memory
> >                                 // lock and prepare objects
> >                         }
> >                 }
> >
> >                 drm_sched_entity_push_job();
> >         }
> >
> >         run_job {
> >                 for_each_vm_bind_operation {
> >                         drm_gpuva_for_each_op {
> >                                 // modify page tables
> >                         }
> >                 }
> >         }
> >
> >         run_job {
> >                 for_each_vm_bind_operation {
> >                         drm_gpuva_for_each_op {
> >                                 // free page table structures, if any
> >                                 // free unused pre-allocated memory
> >                         }
> >                 }
> >         }
> >
> > What did you do instead to get map/unmap overlapping? Even more interesting,
> > what are you doing now?
> 
> From what I can tell, the drivers using drm_gpva_for_each_op()/etc are
> doing drm_gpuva_remove() while iterating the ops list..
> drm_gpuvm_sm_xyz_ops_create() itself does not modify the VM.  So this
> can only really work if you perform one MAP or UNMAP at a time.  Or at
> least if you process the VM modifying part of the ops list before
> proceeding to the next op.

(Added the drm_gpuvm_sm_xyz_ops_create() step above.)

I went through the code you posted [1] and conceptually you're implementing
exactly the pattern I described above, i.e. you do:

	vm_bind {
		for_each_vm_bind_operation {
			drm_gpuvm_sm_xyz_exec_lock();
		}

		for_each_vm_bind_operation {
			drm_gpuvm_sm_xyz() {
				// modify drm_gpuvm's interval tree
				// create custom ops
			}
		}

		drm_sched_entity_push_job();
	}

	run_job {
		for_each_vm_bind_operation {
			for_each_custom_op() {
				// do stuff
			}
		}
	}

However, GPUVM intends to solve your use-case with the following, semantically
identical, approach.

	vm_bind {
		for_each_vm_bind_operation {
			drm_gpuvm_sm_xyz_ops_create();

			drm_gpuva_for_each_op {
				// modify drm_gpuvm's interval tree
				// lock and prepare objects (1)
			}
		}

		drm_sched_entity_push_job();
	}

	run_job {
		for_each_vm_bind_operation {
			drm_gpuva_for_each_op() {
				// do stuff
			}
		}
	}

(Note that GPUVM already supports to extend the existing OP structures; you
should take advantage of that.)

Hence, the helper we really want is to lock and prepare the objects at (1). I.e.
a helper that takes a pointer to a struct drm_gpuva_op and locks / validates the
corresponding objects.

[1] https://gitlab.freedesktop.org/robclark/msm/-/blob/sparse-newer/drivers/gpu/drm/msm/msm_gem_vma.c


