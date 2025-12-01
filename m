Return-Path: <linux-arm-msm+bounces-83942-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F1FC96806
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Dec 2025 10:56:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 486FD3A2551
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Dec 2025 09:56:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3552E301710;
	Mon,  1 Dec 2025 09:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ahXOM0cQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CC843002DF
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Dec 2025 09:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764582905; cv=none; b=hPDRpP1AdywEXyep/17SGlnTjaA5dgX/2rUCxiI2E8HGdAjLuUVg/XImEVD00cDzh/CA+x42vAxJsCx108VBsq61ovE7bwB+OzMxDFhcZ6fOeTMSjwTK//ooQBhISoxioHLy+EgsFBeX3RBc49GkGiBpK8qnEuAcY8AIuGYHf3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764582905; c=relaxed/simple;
	bh=qQliQQ50xmA8nSOzImbhq3Vz4boRpMYBIDIh6ji/bLQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=TTV5r/6wN3RUbLBnhOoTSG+EPfeccz2tRK46dTOZzXYLLj8UMLoKzsG4v1nQ28jmMbM+QNI5EZ6nXJrbYAMjCOczzU4UZGYi8GgRk+HJeFnbED4g8I7RO15Rt6i9xUQc4tc+lrtX1KNm9pDuSLyZLUhxCEgax7BW7/6Ndf1l5ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ahXOM0cQ; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4779edba8f3so27896155e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Dec 2025 01:55:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764582902; x=1765187702; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=72s8cxP8m32nLOQlBnrTppnRNNSnWx6bZ8vmeua9AuM=;
        b=ahXOM0cQBjRw3muTL6UFcCsTa8oh+L5YBJRK1MXdw1G74secpZ+F34f6W2eDPXb/42
         2FiHc5vvQRzGFh6Bdh4T3R+cnk7yy4agX2huQRfv9BYbCfpm/ySfFKBauVmZA8m43veM
         YWR5NPoqn4Up0MGGqeleFcBk1veENSPl0ZkBPjh5kuqW6wkNVWt1tAjFnc4GBIZmBuU4
         5c2B+Xnmu3lIevTsQVtkXFe8+QkO/gN/JnEYGJUTdlmpsau0+yNaP8nPw7bAUJBXr0aw
         HiPwqCsGSqnYcdqlJ5H7bxEI1I7ydSkvB+/r720ljCRWr+iO4ekkPaVLR/hCMK/JstBN
         jDXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764582902; x=1765187702;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=72s8cxP8m32nLOQlBnrTppnRNNSnWx6bZ8vmeua9AuM=;
        b=Q1EHQofc1DF/yseH6/l7FqA63hdt9AL7NuSj8WGZMXJuj/fGS0fF6U5JA43rXLMJ7C
         Pf9fYVW0IWxyzLdCiorPQjrfbns5zTY2evvhe4hesMgS4Of8d67Y0VfOIWzfW5uSZHAf
         qk9D+stm5HxLAWuqCEkMzGM2FvujomMpiKMxuQ72HwgKXDtZFUCZgUCBvB35IAfU7MBn
         A8DmVSOE3JPNY/dO2bRbDvuXvSPTEY3t7/IszuyqeOQqIFCZ6iJBU8jRiiUAz0KTY8cE
         HuH5zCKIY2BZS+FHG6dE7FuCONjSptMyHd9Ihft4dSFftVLGidvB419fXyYzLLHjzTnM
         JYJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhvqdt9eNlte867+1eEVGOMBJLiDj35nOcOlH3IWqf2CAnYhhUL3iyqCphqojYFCjqTUkOipU1GDsd3hcA@vger.kernel.org
X-Gm-Message-State: AOJu0YxHO3S1u0oi3Zr2zqkMbZUdxXrlXCHnD7mXl3oBnvkI0+prYyxD
	+HFd20kg/Ys09K/uVzZYPGX/sYUAoyMP0I1CYdGF9QlTc5K8Pa9GOvz8en67lZ5Vdaz4KQFaWAy
	+qP9z22Jm0qTKRgOeKg==
X-Google-Smtp-Source: AGHT+IHR/gzeFh7+KeD1MsGLOFVqoY8R7VwUnjkirrmR28Kdsu+0Qy8DFoIl1J3N86VCTwEGoZO2EDfdb0ODTEY=
X-Received: from wmba22.prod.google.com ([2002:a05:600c:6dd6:b0:477:7ad9:2aa])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4f4c:b0:475:da1a:53f9 with SMTP id 5b1f17b1804b1-477c0184b1emr414720285e9.14.1764582901820;
 Mon, 01 Dec 2025 01:55:01 -0800 (PST)
Date: Mon, 1 Dec 2025 09:55:00 +0000
In-Reply-To: <20251128152403.72aedafa@fedora>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251128-gpuvm-rust-v1-0-ebf66bf234e0@google.com>
 <20251128-gpuvm-rust-v1-1-ebf66bf234e0@google.com> <20251128152403.72aedafa@fedora>
Message-ID: <aS1l9Mm9smUzAJ3A@google.com>
Subject: Re: [PATCH 1/4] drm/gpuvm: take GEM lock inside drm_gpuvm_bo_obtain_prealloc()
From: Alice Ryhl <aliceryhl@google.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Matthew Brost <matthew.brost@intel.com>, 
	"Thomas =?utf-8?Q?Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Lyude Paul <lyude@redhat.com>, Lucas De Marchi <lucas.demarchi@intel.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	"Christian =?utf-8?B?S8O2bmln?=" <christian.koenig@amd.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	nouveau@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="utf-8"

On Fri, Nov 28, 2025 at 03:24:03PM +0100, Boris Brezillon wrote:
> On Fri, 28 Nov 2025 14:14:15 +0000
> Alice Ryhl <aliceryhl@google.com> wrote:
> 
> > When calling drm_gpuvm_bo_obtain_prealloc() and using immediate mode,
> > this may result in a call to ops->vm_bo_free(vm_bo) while holding the
> > GEMs gpuva mutex. This is a problem if ops->vm_bo_free(vm_bo) performs
> > any operations that are not safe in the fence signalling critical path,
> > and it turns out that Panthor (the only current user of the method)
> > calls drm_gem_shmem_unpin() which takes a resv lock internally.
> > 
> > This constitutes both a violation of signalling safety and lock
> > inversion. To fix this, we modify the method to internally take the GEMs
> > gpuva mutex so that the mutex can be unlocked before freeing the
> > preallocated vm_bo.
> > 
> > Note that this modification introduces a requirement that the driver
> > uses immediate mode to call drm_gpuvm_bo_obtain_prealloc() as it would
> > otherwise take the wrong lock.
> > 
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> 
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> 
> Should we add a Fixes tag?

Yeah, let's add:

Fixes: 63e919a31625 ("panthor: use drm_gpuva_unlink_defer()")

Alice

