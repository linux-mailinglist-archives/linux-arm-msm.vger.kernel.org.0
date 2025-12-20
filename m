Return-Path: <linux-arm-msm+bounces-86015-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E1CCD2CF3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Dec 2025 11:06:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0C212300BB83
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Dec 2025 10:05:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8317A3009F7;
	Sat, 20 Dec 2025 10:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="p/uP8rnm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com [209.85.218.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B862F5A35
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Dec 2025 10:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766225140; cv=none; b=UAf11OBLL//zaHBw5kz+HgPsVv+qlyfySq8Dfc63xI+rToHk2eyJwmAwg64sQMsNZ3R536OYDomN3nwv+WUDjL9tFtwEqAHzs5kibta6eLdAf3SmrqbdRl6dVIlxdbFJDO6u2KnLLaidzwfvlHPV0ZDvSWXaiCqEb4z4iAw2JAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766225140; c=relaxed/simple;
	bh=AeXXtz/xKBbgkU0M2gnK6yJRe3S7izp9ryLM1833MBs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=YRAqR+r1KOTK4zddOmq4Yvdxe2aYe1/l7oTAOflJuYrEA9FsB5L6tn/TSXVuKrmZHIJTGSDIQrQF8G3+bpa9fLEW0PhQbxJVWmCnzLM07EmMlnd/sInRz4PpuLM4SwnGSdNRBLIjvzQV/5sfNmwFs7oK15ZzSgi8qrp3PmUf8o0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=p/uP8rnm; arc=none smtp.client-ip=209.85.218.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-ej1-f73.google.com with SMTP id a640c23a62f3a-b7a29e6f9a0so332284666b.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 20 Dec 2025 02:05:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766225137; x=1766829937; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+5We+jBO0+cCD3c++ROAWKy2uW8li7ctcnKyzh7ve8o=;
        b=p/uP8rnmekDhufC1a0igzGUxb9fqqBOmkxoNOnvqJgmb04K7j7mgED7YoOF7Mnqj/G
         fZ+yrefWHb9Aagy+gdvP6t4MmZw01AQGCzf1SaRc7/0A94ng733yr7LTNEL2BYdv9lsr
         Vp4bjlCauOTih4q51gLykZtGPnPHupohHlS0F+rwLoOKPD9F2A1vruXTUFHfDBj59bZ6
         cNPE8i9blM32Fh15pN6SIiROpDL3ufp67bPbAPZlhmQ04tLLlG7P14ID19g7lqqdYajK
         Qld6cM1Ho+XfNd5HY2EA1+aVlGJeY3EwpcQi39NdxdFq+iZVAPTLP0iWSpiAMcWp2sAr
         utpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766225137; x=1766829937;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+5We+jBO0+cCD3c++ROAWKy2uW8li7ctcnKyzh7ve8o=;
        b=B1ilL4l/SQGOLXLkjPmm0mcZaeTojqkyfWFjY5uru2Vk6nW8/MvkE/qZjFZht31iWO
         DWWbz/57ca5mokiO/Hv4olUX6i3BdQfunbBwCeSAnRr0EXgoW2U41+cnuY/rvdZOSAY0
         VJjgEWBYELI9R/30xmvEj+LZ8A3nZr37y3lWP5b6PXxp5IvG/GhRORDyyy+hOM3scbPz
         65X/0JVODNgDnYX52TGPZsctdUYaqghjwEJ7mqjwzEAxIGVSztRVfxiNtTyP4AxfJpqf
         +wUr7ywfkQPHBjwIQjAZqchMh0TveHPsteFL/yhoOMXixRYxckNk7PbUN0MPVSFLveoT
         AB/w==
X-Forwarded-Encrypted: i=1; AJvYcCWp0kBRFgNcyQ7w/qopG9pUryL92hZs8DC4Hw0Y9h93BQGCoMFpICNQGQq9XcBOjCj6wdrcuJmxY1gjEcfI@vger.kernel.org
X-Gm-Message-State: AOJu0YyiMKgd5q5OmfOOwm+3dXsaKelv77nD3/vSNK73QDg/ypza7Mcv
	4RRCj4h3TKvBXEwpS37WrXYdIeUTGvAqHTgwMqfJLga9cwzasUdDNey+i32BQSiAA+APAS/E+N3
	TshHU5QvMlutsaf4k4Q==
X-Google-Smtp-Source: AGHT+IH+qbCL3E4KlR/xCuII76jDF4Kk0p12le+sQrE5wjNjdmbXoR9Ff184WWDRAFxJ6twYy7w7Nft4HG28DGY=
X-Received: from edtn6.prod.google.com ([2002:aa7:db46:0:b0:64b:a192:b5])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:7814:b0:b80:4141:a470 with SMTP id a640c23a62f3a-b804141a5d5mr252551866b.6.1766225136958;
 Sat, 20 Dec 2025 02:05:36 -0800 (PST)
Date: Sat, 20 Dec 2025 10:05:35 +0000
In-Reply-To: <aUZw4fpWRUWFsb9r@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251128-gpuvm-rust-v1-0-ebf66bf234e0@google.com>
 <20251128-gpuvm-rust-v1-4-ebf66bf234e0@google.com> <DF2AXQ67412G.33JOX2CF0VFCK@kernel.org>
 <aUZw4fpWRUWFsb9r@google.com>
Message-ID: <aUZ07zYew7Mfwc_C@google.com>
Subject: Re: [PATCH 4/4] rust: drm: add GPUVM immediate mode abstraction
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, Matthew Brost <matthew.brost@intel.com>, 
	"Thomas =?utf-8?Q?Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Boris Brezillon <boris.brezillon@collabora.com>, Steven Price <steven.price@arm.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Lyude Paul <lyude@redhat.com>, 
	Lucas De Marchi <lucas.demarchi@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, 
	"Christian =?utf-8?B?S8O2bmln?=" <christian.koenig@amd.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	intel-xe@lists.freedesktop.org, linux-media@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org, Asahi Lina <lina+kernel@asahilina.net>
Content-Type: text/plain; charset="utf-8"

On Sat, Dec 20, 2025 at 09:48:17AM +0000, Alice Ryhl wrote:
> On Fri, Dec 19, 2025 at 04:35:00PM +0100, Danilo Krummrich wrote:
> > On Fri Nov 28, 2025 at 3:14 PM CET, Alice Ryhl wrote:
> > > +    /// Returns a [`GpuVmBoObtain`] for the provided GEM object.
> > > +    #[inline]
> > > +    pub fn obtain(
> > > +        &self,
> > > +        obj: &T::Object,
> > > +        data: impl PinInit<T::VmBoData>,
> > > +    ) -> Result<GpuVmBoObtain<T>, AllocError> {
> > > +        Ok(GpuVmBoAlloc::new(self, obj, data)?.obtain())
> > > +    }
> > 
> > Does this method make sense? We usually preallocate a VM_BO, then enter the
> > fence signalling critical path and then obtain the VM_BO.
> 
> Hmm, but there is something tricky here. When do we add it to the extobj
> list, then? If we add it before starting the critical path, then we must
> also call drm_gpuvm_bo_obtain_prealloc() before starting the critical
> path because obtain must happen before drm_gpuvm_bo_extobj_add(). And
> adding it to extobj after signalling the fence seems error prone.
> 
> And besides, adding it to the extobj list before the critical path
> means that we can have drm_gpuvm_exec_lock() lock the new BO without
> having to do anything special - it's simply in the extobj list by the
> time we call drm_gpuvm_exec_lock().
> 
> > > +impl<T: DriverGpuVm> DerefMut for GpuVmCore<T> {
> > > +    #[inline]
> > > +    fn deref_mut(&mut self) -> &mut T {
> > > +        // SAFETY: By the type invariants we may access `core`.
> > > +        unsafe { &mut *self.0.core.get() }
> > > +    }
> > > +}
> > 
> > Hm..it seems more natural to me to deref to &GpuVm<T> and provide data() and
> > data_mut().
> 
> That's fair.
> 
> > > +impl<T: DriverGpuVm> Drop for GpuVmBoAlloc<T> {
> > > +    #[inline]
> > > +    fn drop(&mut self) {
> > > +        // SAFETY: It's safe to perform a deferred put in any context.
> > > +        unsafe { bindings::drm_gpuvm_bo_put_deferred(self.as_raw()) };
> > 
> > This does not need to be deferred, no?
> 
> I think what I *actually* want to call here is
> 
> 	kref_put(&self->kref, drm_gpuvm_bo_destroy_not_in_lists_kref);
> 
> like what drm_gpuvm_bo_obtain_prealloc() does as of the first patch in
> this series.
> 
> > > +    }
> > > +}
> > > +
> > > +/// A [`GpuVmBo`] object in the GEM list.
> > > +///
> > > +/// # Invariants
> > > +///
> > > +/// Points at a `drm_gpuvm_bo` that contains a valid `T::VmBoData` and is present in the gem list.
> > > +pub struct GpuVmBoObtain<T: DriverGpuVm>(NonNull<GpuVmBo<T>>);
> > 
> > How is this different from GpuVmBo? The only object that is not in the GEM list
> > should be GpuVmBoAlloc, i.e. the preallocated one.
> 
> The difference is whether there is pointer indirection or not.
> 
> This type is morally an ARef<GpuVm<T>>, except I don't expose any way
> to increment the refcount.
> 
> Alice

