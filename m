Return-Path: <linux-arm-msm+bounces-88118-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 15094D046FA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 08 Jan 2026 17:37:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B95CB3122C68
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jan 2026 16:16:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CDD327510B;
	Thu,  8 Jan 2026 16:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4vqhKXAq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30980261595
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jan 2026 16:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767888970; cv=none; b=GqZJ3dHicdPlNzHnbtI6nkD4fq9RaszKeL1mWOnzh97ZDvTGBgtHSK+w4IOvQcz7a77UTEhGiRKPi6LFp0Y6AbpWB2l0z2MBmyOI9KlYT2K4l5n6lVTQ90eR/nvw078RT5CMnzjysVm0Pt2b9XWvuVL2BA+SsIx5zrewhd8SBqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767888970; c=relaxed/simple;
	bh=TA+QLflUns7II5KQbvYtt2HJkyxBZXngDopxGt1IPPQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SZH5Z5POfERrPdO6wOZu7I/2dN4vg1LoMpfNWVniKK7lGHrDqvuLUc+6zpN3yfQid5Hj1Yle26EqbUrUFrPZbxqBb9lAWjm9nB2yNNqQiwUUKNMa+rgkg8JZneRp5Iyx9s8Fm0pfF5uQ1tlFQGJWs3U0oGWIvqXwKQ6ehHPH3HE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4vqhKXAq; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-432d28870ddso432188f8f.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 08:16:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767888965; x=1768493765; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6vW3/P/N4+paGKM071bgG2imOi6n7IKDgUKqaIxzm8s=;
        b=4vqhKXAq3EMrUj1uoQR4GzhsQY0GFFjWdxgwjToVHhfYoKVzSHtgCGPvOWBBQwSfQI
         Yi9wPUDSi724Uy+uDLyN7BUPgWNtOahpIZvsHbocLsSNobI9sO8uhBFj+4RrLgrBC/57
         s748nldU6vRMqqRn8Map/kjU8AVTl6whAuRs+2/YdM7Sk8E3edS0AOhy4cpGCcDOw4Ev
         DMojL5cuNV6EEJFgtxgffMrTtGLJSQfZSLMn6xOzdWeIyPLjQ4fHMl1o3AzsTkH20edY
         D9DS1hGPdeGrvcaaU/ZPnWBI9Cuw2T1SG6cxGpFRrTJ2ylYWXqWHUSszU1V3CrSeG89H
         LpOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767888965; x=1768493765;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6vW3/P/N4+paGKM071bgG2imOi6n7IKDgUKqaIxzm8s=;
        b=cZK6VYZ7UkbzJFZp0bdpbw2P4NtV1nAODokh8x7Sr3umCaJGdjsigr2alBh4HVEe2s
         75EgCU8slO1aIKl2wILrbuQXU85HqYPZOCmhVt6O4mATDDTd6BVomMFtWv7G4CPQ32BD
         pdce8xccil/CwHxYefX+DGezoiaXoanRjnkXJx3SfTxC2tzFRmpO0JFrOxTxB5DIWQo8
         6GCEWJvlemO0J0LPjLki94PcvHOP6ZBmXB6DdCgEJD6S6DC/8RHBTisg8AtJLXePZiFb
         niDsvrmNYHEoWy47bMv8UcdHoraFq+fcqJmLgO7bMfuooCUw86EVzPWU7bnbWRK1Dwek
         Aokg==
X-Forwarded-Encrypted: i=1; AJvYcCXS/hwfIGogNM57g0cewfBkKSAAlaRIKNkwo8igSiqXq95ykZtqk+UVniG/KnD3pe/ymJNjtgNwTDQxlkvq@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2ldCNFtJ1YSwxfqSUeSqwkYzGu5Jjysn97lDnkruQlpA+bNoW
	4jjFEqDKzfb0XRd91RBZGCnbPAIBt8TDO1KPxipv0eOdqMha8h/Q1/yy9yoKzVfd1adhmbC2uEU
	0Ipnj3IpwMk8LUwo1X3lzwl9iq+zRB1k5HaAbylMv
X-Gm-Gg: AY/fxX7Il+luKsNyklDt6GUr8rkzQAbgUM86D3fc69/sPeiFoAqh5dEqYDuQct7AwKt
	VCWou0NG3p4VZ1Nw0OJLksfZnds4U7tpptRgZ4CiCi9qqOJvaVStR7zpqxl4ud7QH2LwLDu/z6D
	p7TaBpJ9SqBwkOOr9zjvq1JW+oJvf/KjmemsVlMg42GxXc3/nEkuF7IeVTZ9zzFMnRKtdH/wbf4
	YSJJ2tJVklUHW3jbtHhjOLFness3XMSX5gddg8U9Qwp5pYofoBuTBGrwqrnf9+SU/Je+j/J5L1s
	kvh5bnq1vjexzJxtjPPmXJZB0E7iHh4B4BPE5Ksx+KdaotGGXusWgm5hlw==
X-Google-Smtp-Source: AGHT+IFlwj7HPJoXMHh8QpN1Ab7H/UDknjidGuhXb0xbkpRQOk6X4xFeRXquaMOfNkP2YrRvaqkzOLHouDmVZwg+94c=
X-Received: by 2002:a05:6000:2311:b0:432:aa61:a06e with SMTP id
 ffacd0b85a97d-432c374fc59mr8831012f8f.32.1767888965176; Thu, 08 Jan 2026
 08:16:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260108-gpuvm-rust-v2-0-dbd014005a0b@google.com>
In-Reply-To: <20260108-gpuvm-rust-v2-0-dbd014005a0b@google.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 8 Jan 2026 17:15:52 +0100
X-Gm-Features: AQt7F2pLnnImtkMgl2KE50d4CB3AXYote1UE4JeFi6pzxph4V_uj8MRfBo1vVss
Message-ID: <CAH5fLgg36qSD7jCarKwipxTSUz4W2uiDDmL_Thqv-+8jBe5DTw@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Rust GPUVM prerequisites
To: Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>
Cc: Matthew Brost <matthew.brost@intel.com>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Boris Brezillon <boris.brezillon@collabora.com>, Steven Price <steven.price@arm.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Frank Binns <frank.binns@imgtec.com>, 
	Matt Coster <matt.coster@imgtec.com>, Rob Clark <robin.clark@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Lyude Paul <lyude@redhat.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
	intel-xe@lists.freedesktop.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 8, 2026 at 5:07=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> wr=
ote:
>
> See v1 for the Rust code that uses these C changes.
>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
> Changes in v2:
> - For this version, only the C prerequisites are included. Rust will be
>   sent as follow-up.

I forgot to fill out the changelog. Here it is:

Changes in v2:
- For this version, only the C prerequisites are included. Rust will be
  sent as follow-up.
- Add comment to drm_gpuvm_bo_destroy_not_in_lists()
- Add Fixes: tag.
- Pick up Reviewed-by tags.

> - Link to v1: https://lore.kernel.org/r/20251128-gpuvm-rust-v1-0-ebf66bf2=
34e0@google.com
>
> ---
> Alice Ryhl (3):
>       drm/gpuvm: take GEM lock inside drm_gpuvm_bo_obtain_prealloc()
>       drm/gpuvm: drm_gpuvm_bo_obtain() requires lock and staged mode
>       drm/gpuvm: use const for drm_gpuva_op_* ptrs
>
>  drivers/gpu/drm/drm_gpuvm.c            | 91 ++++++++++++++++++++++++----=
------
>  drivers/gpu/drm/imagination/pvr_vm.c   |  2 +-
>  drivers/gpu/drm/msm/msm_gem.h          |  2 +-
>  drivers/gpu/drm/msm/msm_gem_vma.c      |  2 +-
>  drivers/gpu/drm/nouveau/nouveau_uvmm.c |  2 +-
>  drivers/gpu/drm/panthor/panthor_mmu.c  | 10 ----
>  drivers/gpu/drm/xe/xe_vm.c             |  4 +-
>  include/drm/drm_gpuvm.h                | 12 ++---
>  8 files changed, 76 insertions(+), 49 deletions(-)
> ---
> base-commit: 44e4c88951fa9c73bfbde8269e443ea5343dd2af
> change-id: 20251128-gpuvm-rust-b719cac27ad6
>
> Best regards,
> --
> Alice Ryhl <aliceryhl@google.com>
>

