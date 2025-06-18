Return-Path: <linux-arm-msm+bounces-61778-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EE0A2ADF8B0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 23:23:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3FFDC1BC3ACF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 21:24:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EC5A27B4EB;
	Wed, 18 Jun 2025 21:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GB40cQNO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B75EA27A451
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jun 2025 21:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750281823; cv=none; b=cLTxAQfSscg8nVvy2L2yRfRmwbaUEaZBog0aXlqjXd5JiJA7i9HFHNERmRBeqbKltnsgOcnd498iSgZ+PUrSM2C/omKLWm5LdjVZI+VXeP54e/orZXFP68UTVw+ssk9hoFKFTeRDkrutBfsKzUWqxxiw2YK0vtwKwedtYxi2bKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750281823; c=relaxed/simple;
	bh=aHYEXv9FQ4+lXnPUOk4K21uuvfRIkU3kbTOPJEGl6Zc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gUOLSzH5rP1AJUWwo9a7W2QCqcdpwaAg5ZBwu5VoiCQdxNZakLOcznMABdxsWtEEnj4kJaLvVjwYlwVLAiOaABGEcGpWvgWJkSEw7JNG6LcRUOjW5EtyhW/HP26M4VxhVFOYxa4EqW2cZ+S1llmJiRIRtPmREX0l4yUUFMxqMHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GB40cQNO; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750281820;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lD3zh9LSKFVLiBeGdrP5eT4T6VTWKD7Got03vgBF8Pk=;
	b=GB40cQNOblbY2o3qcszXeN/510fUoUs7/awKM7JOhpGLcz4bG83bMb9sC3ywiYw9fhQBXB
	vRe00QFeXVxRkBMjMqU+2bfd2awcOlDqhkSd+XjFxkmGwXU9/Q4SGq2JF5ZVvdDrALSpFe
	raGNZ1sB6qHDvZVDzkrUajYPJyjZJaA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-656-Kik3iejUOAKLVP1WM-_z5g-1; Wed, 18 Jun 2025 17:23:39 -0400
X-MC-Unique: Kik3iejUOAKLVP1WM-_z5g-1
X-Mimecast-MFC-AGG-ID: Kik3iejUOAKLVP1WM-_z5g_1750281818
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a503f28b09so30828f8f.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jun 2025 14:23:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750281818; x=1750886618;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lD3zh9LSKFVLiBeGdrP5eT4T6VTWKD7Got03vgBF8Pk=;
        b=lB5uqbsTlvtgPyis1Pp5jiuekgECu+lcw2AgJkXv2vdYrBBRUxR8IGuj3EEyca3QAT
         kH1Z0e3meS8Bh7w+EcZlsMwdGesTX0OnnDMyVcJ29fXeBd5EkWij3o/yU+HmNUL8pAV2
         BoubX/QJbspKPPx8tHhWX0sWi90ZbK+FxMYxnz+7jZ6T2p8Ori4Z6gpSNcr0BDM5u2Kh
         Sj0TQOeIqfZyYBMWRJDvQFsyKT1hOZitz0CvaqwKNCZyi2ryMozSIV2jMEEfB08X4ciA
         T7auJmpWa86hiBbo6OZx98iwHBvX7VS9dTgfDeuZUDTccNQUa6xdnOQGPBoZgude5XIb
         tjSg==
X-Forwarded-Encrypted: i=1; AJvYcCXJ1dPAKRM0ZwFqrdPu38ERbHsoDD9gqOwb9/ORi5E0EG0CWajrDJcc+Z6bueUlPjT558yyzHyrG0cV80Vb@vger.kernel.org
X-Gm-Message-State: AOJu0Yxsa+CLywvemOq38mXg9YvxUGmV4YGT961K+QmJjCBOE2H9gDCB
	Pk6jFqRPUJOzwiCLXZ1kt8uw33qg02VecfHol3rHYCbS95qQV9Ek6GS3vIYL0d8c2iICVsgzGMg
	NP0vwFBCcRnxvvUddya2UPnNF99dkTUNcuAVselVFQ4aWpB77kNuvceE/HPR0+fPhoJI=
X-Gm-Gg: ASbGnctbA9PlFi9DHpre+GlAmlkaq5Tagxf49Mq7FWhOB3RIoyZgKVTbZ4Jm3+E0p0U
	3j+SXgzfp3+1xSZ8xhj+G9v+FbsUbwxiJMkqUOW+PJWU8SBkqEVGcB0vSE6Y1v9noPwew9YiWCr
	RsbV7uZGpyDI36NAd31faSUpHj4hGR5KwH3MaWOIhmV/Atu2Hz5ufStxyB4JIdmLGK5wNv4mtxu
	gTn2RCogDlM6OKRo6snPWieC+QbvayuwkhmSTGI1EJ9FVcRYVcVjtzwKIWmCUnBOnKd6LOc6KAr
	t84zJm8y4Ps=
X-Received: by 2002:a05:6000:2a04:b0:3a5:5130:1c71 with SMTP id ffacd0b85a97d-3a6c962b2d8mr700657f8f.0.1750281818002;
        Wed, 18 Jun 2025 14:23:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHu4QU3bk7dkTV8y21m8O4yJStIuE5s16gVEUTckk6g/n5f2Lm6JEA/tzq7cPIYOVYMNwo42A==
X-Received: by 2002:a05:6000:2a04:b0:3a5:5130:1c71 with SMTP id ffacd0b85a97d-3a6c962b2d8mr700648f8f.0.1750281817462;
        Wed, 18 Jun 2025 14:23:37 -0700 (PDT)
Received: from pollux ([2a00:79c0:6b9:ae00:abf:b8ff:feee:998b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a5780c5004sm14370775f8f.56.2025.06.18.14.23.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 14:23:36 -0700 (PDT)
Date: Wed, 18 Jun 2025 23:23:35 +0200
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
Message-ID: <aFMuV7PNfSZVWb-b@pollux>
References: <20250613235705.28006-1-robin.clark@oss.qualcomm.com>
 <20250613235705.28006-3-robin.clark@oss.qualcomm.com>
 <aE1RPZ_-oFyM4COy@pollux>
 <CACSVV00uwmuAC4eMi-4QiF4sOu4r9u8eXxyAgt83YS8Yfgoemg@mail.gmail.com>
 <aFCO7_RHuAaGyq1Q@pollux>
 <CACSVV03WboQp_A1bzQ+xpX5DDkfaoXmbTuo9RfZ9bMaVTqdU+A@mail.gmail.com>
 <aFE6pq8l33NXfFdT@pollux>
 <CACSVV00VzOfTDh2sKst+POzkZ-5MH+0BDY-GVB2WKTyONRrHjw@mail.gmail.com>
 <CACSVV00cng4PzHzqydGw_L34_f+6KiZTyCRdggNfHaDePGzFOA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACSVV00cng4PzHzqydGw_L34_f+6KiZTyCRdggNfHaDePGzFOA@mail.gmail.com>

On Tue, Jun 17, 2025 at 06:43:21AM -0700, Rob Clark wrote:
> On Tue, Jun 17, 2025 at 5:48 AM Rob Clark <rob.clark@oss.qualcomm.com> wrote:
> >
> > On Tue, Jun 17, 2025 at 2:51 AM Danilo Krummrich <dakr@redhat.com> wrote:
> > >
> > > On Mon, Jun 16, 2025 at 03:25:08PM -0700, Rob Clark wrote:
> > > > On Mon, Jun 16, 2025 at 2:39 PM Danilo Krummrich <dakr@redhat.com> wrote:
> > > > >
> > > > > On Sat, Jun 14, 2025 at 08:03:20AM -0700, Rob Clark wrote:
> > > > > > On Sat, Jun 14, 2025 at 3:39 AM Danilo Krummrich <dakr@redhat.com> wrote:
> > > > > > >
> > > > > > > On Fri, Jun 13, 2025 at 04:57:03PM -0700, Rob Clark wrote:
> > > > > > > > For UNMAP/REMAP steps we could be needing to lock objects that are not
> > > > > > > > explicitly listed in the VM_BIND ioctl in order to tear-down unmapped
> > > > > > > > VAs.  These helpers handle locking/preparing the needed objects.
> > > > > > >
> > > > > > > Yes, that's a common use-case. I think drivers typically iterate through their
> > > > > > > drm_gpuva_ops to lock those objects.
> > > > > > >
> > > > > > > I had a look at you link [1] and it seems that you keep a list of ops as well by
> > > > > > > calling vm_op_enqueue() with a new struct msm_vm_op from the callbacks.
> > > > > > >
> > > > > > > Please note that for exactly this case there is the op_alloc callback in
> > > > > > > struct drm_gpuvm_ops, such that you can allocate a custom op type (i.e. struct
> > > > > > > msm_vm_op) that embedds a struct drm_gpuva_op.
> > > > > >
> > > > > > I did use drm_gpuvm_sm_xyz_ops_create() in an earlier iteration of my
> > > > > > VM_BIND series, but it wasn't quite what I was after.  I wanted to
> > > > > > apply the VM updates immediately to avoid issues with a later
> > > > > > map/unmap overlapping an earlier map, which
> > > > > > drm_gpuvm_sm_xyz_ops_create() doesn't really handle.  I'm not even
> > > > > > sure why this isn't a problem for other drivers unless userspace is
> > > > > > providing some guarantees.
> > > > >
> > > > > The drm_gpuva_ops are usually used in a pattern like this.
> > > > >
> > > > >         vm_bind {
> > > > >                 for_each_vm_bind_operation {
> > >                             drm_gpuvm_sm_xyz_ops_create();
> > > > >                         drm_gpuva_for_each_op {
> > > > >                                 // modify drm_gpuvm's interval tree
> > > > >                                 // pre-allocate memory
> > > > >                                 // lock and prepare objects
> > > > >                         }
> > > > >                 }
> > > > >
> > > > >                 drm_sched_entity_push_job();
> > > > >         }
> > > > >
> > > > >         run_job {
> > > > >                 for_each_vm_bind_operation {
> > > > >                         drm_gpuva_for_each_op {
> > > > >                                 // modify page tables
> > > > >                         }
> > > > >                 }
> > > > >         }
> > > > >
> > > > >         run_job {
> > > > >                 for_each_vm_bind_operation {
> > > > >                         drm_gpuva_for_each_op {
> > > > >                                 // free page table structures, if any
> > > > >                                 // free unused pre-allocated memory
> > > > >                         }
> > > > >                 }
> > > > >         }
> > > > >
> > > > > What did you do instead to get map/unmap overlapping? Even more interesting,
> > > > > what are you doing now?
> > > >
> > > > From what I can tell, the drivers using drm_gpva_for_each_op()/etc are
> > > > doing drm_gpuva_remove() while iterating the ops list..
> > > > drm_gpuvm_sm_xyz_ops_create() itself does not modify the VM.  So this
> > > > can only really work if you perform one MAP or UNMAP at a time.  Or at
> > > > least if you process the VM modifying part of the ops list before
> > > > proceeding to the next op.
> > >
> > > (Added the drm_gpuvm_sm_xyz_ops_create() step above.)
> > >
> > > I went through the code you posted [1] and conceptually you're implementing
> > > exactly the pattern I described above, i.e. you do:
> > >
> > >         vm_bind {
> > >                 for_each_vm_bind_operation {
> > >                         drm_gpuvm_sm_xyz_exec_lock();
> > >                 }
> > >
> > >                 for_each_vm_bind_operation {
> > >                         drm_gpuvm_sm_xyz() {
> > >                                 // modify drm_gpuvm's interval tree
> > >                                 // create custom ops
> > >                         }
> > >                 }
> > >
> > >                 drm_sched_entity_push_job();
> > >         }
> > >
> > >         run_job {
> > >                 for_each_vm_bind_operation {
> > >                         for_each_custom_op() {
> > >                                 // do stuff
> > >                         }
> > >                 }
> > >         }
> >
> > Close, but by the time we get to run_job there is just a single list
> > of ops covering all the vm_bind operations:
> >
> >         run_job {
> >                 for_each_custom_op() {
> >                         // do stuff
> >                 }
> >         }
> >
> > rather than a list of va ops per vm_bind op.
> >
> > > However, GPUVM intends to solve your use-case with the following, semantically
> > > identical, approach.
> > >
> > >         vm_bind {
> > >                 for_each_vm_bind_operation {
> > >                         drm_gpuvm_sm_xyz_ops_create();
> > >
> > >                         drm_gpuva_for_each_op {
> > >                                 // modify drm_gpuvm's interval tree
> > >                                 // lock and prepare objects (1)
> >
> > I currently decouple lock+pin from VM modification to avoid an error
> > path that leaves the VM partially modified.  Once you add this back
> > in, the va-ops approach isn't simpler, IMHO.
> 
> Oh, actually scratch that.. using va-ops, it is not even possible to
> decouple locking/prepare from VM modifications.  So using
> DRM_EXEC_INTERRUPTIBLE_WAIT, for ex, with va-ops list would be an
> actively bad idea.

Well, you would need to unwind the VM modifications. I think so far this hasn't
been an issue for drivers, since they have to unwind VM modifications for other
reasons anyways.

Do you never need to unwind for other reasons than locking dma_resv and
preparing GEM objects? Are you really sure there's nothing else in the critical
path?

If there really isn't anything, I agree that those helpers have value and we
should add them. So, if we do so, please document in detail the conditions under
which drm_gpuvm_sm_{map,unmap}_exec_lock() can be called for multiple VM_BIND
ops *without* updating GPUVM's interval tree intermediately, including an
example.


