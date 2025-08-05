Return-Path: <linux-arm-msm+bounces-67811-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF00B1BBC5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Aug 2025 23:32:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 421A518516A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Aug 2025 21:32:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C490243951;
	Tue,  5 Aug 2025 21:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HYt1ESF9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA8D01C8633;
	Tue,  5 Aug 2025 21:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754429537; cv=none; b=f9X6qu+LjQEQeJYwOfBOl9gLWyLpQvyNnqMSrwdEtsGr65m4Puaq8Gz33ySUXgdAG4umbz+WkzC3tMzkpOZSQJN2maECL/cdo3cWcDkXpsqCGr8Gz6uH8g2WrUyg7CFxg1jR/HqlB8dITnPGRyKbJCcXuUyXGm+U0+uywKk0Do0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754429537; c=relaxed/simple;
	bh=+yRR+J5d7PwJm/LH7dB2AD9oTbYVRLhpMGuK7/VNCHc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G5m+Tn7mW1816G6N9bwyazKv1+dhq1vzJn3tEAHvs9ij49al/InNtzV8rB6MA/bW9m1jF6Mxk2EPHAlq/ON/1FYjRviPA2I75g4kqJFR4RYGEAQo6hIBikbyvHOFXQEOdZNSJ3+Ac+x0AAL21Auwhl0WmcQtBga6ihDY7seSX7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HYt1ESF9; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-32130f6cfbbso376665a91.0;
        Tue, 05 Aug 2025 14:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754429535; x=1755034335; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S8XfqBcuUbvXZzlLXlPsAW+gig/cCq9lWEta9lhp7ac=;
        b=HYt1ESF9/g3ANcTA6fJbejV+UGDxcesfL1oicJ9aHw1H0gjNUXwTqs4jHni6WASNjJ
         7fI20ogWEEpiT+VEZNdX2RsUO1AbLkIppka7oskXtreMuITobCVTph3/FaDph8LahioQ
         +qS672sI3GHIiwrxsNXC2vyD0xsIS5kX12QD1rV85nxW0vEEkguGBS6l1d/iwdrM/ZXN
         SQluuC+Dcq7ZRCrurKI719pg0+mXsqFxevubgC68S0S9Nwgf8Oh4IPqOpNA/uPdRAJc2
         6FW529oDValu4tZeC8lQWPpZv5EWq6GNqB8izSSafhM7HFgh9mvgnlr7J/CA8Lg2lEOd
         8JSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754429535; x=1755034335;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S8XfqBcuUbvXZzlLXlPsAW+gig/cCq9lWEta9lhp7ac=;
        b=a/RfW0dw6lYZdwniw9m5ZjoYhiHvdqHZTPPcpX0nf+aWViru7FRq5McDDwLcaTL0r7
         AruYozMRiXc+/fc7SxfiuGhNLxnLkm5h6PRDG3VDVLEAnVPDmVeZkNOcdGqmJK1R7KHc
         Ub217URVCn7c2zd6EitWowX/L3YCJJICuGPczC+Ri0wEv7WxLZIFLUnGfRXyHwevK15t
         /1hEns64zhUxuHhgUIIKYuCKrLVS6zC8hDdzB0+yYsYlBdPvNtkdHogrTDtf+7w6UHnz
         wsNtUZ88Z1Xm027Smr8uJKWWCjaB0RYvpI4LLSUtPM9un194F5vf6YZbA80mtSTub0GO
         BrXg==
X-Forwarded-Encrypted: i=1; AJvYcCWJphmu6d5J54hGb+1rPKYfYOjjj1KaY6+ykqqydoI0kC/OMiqHdYk/2wCJpCoqv3N655OiykU3cwxHKIf3@vger.kernel.org, AJvYcCXs3dv5uZc1DbKWWxpygEdvpS8F9eBvI/sTIyc0UPN5GjzgYYZmjMHe9VuA3BgV6RiYlgI7y/rCxt5aKfmk@vger.kernel.org
X-Gm-Message-State: AOJu0YyEujxWvhaMY7SLN7uRrMwF8kl0HxT5lrAjmgJQ7A03NuAypVWE
	uebz8rYcZwcA1/ZmN3d3+KUMtYEDJe2c7A9yExCKl4wiOHWYoy4yoM0IU7CEWGHyaGsllJVaqb5
	tMw8r4/ujpmtAkyWzBW7/7+1XPJx4hFA=
X-Gm-Gg: ASbGncuBANBUrfz2k7Hj0EwM+tpUvFJguME7NqunL++NzPWB+XfEkCE6B3dj2NrH0bs
	dZkpZRrgC5Pjitvrp+nfPOydw4o3FbMdoCNB+5cC8n7y2a5Q+EQ8YWLSt0LTvHqWS4nzeZBDuRU
	Ka+ouEhg0PkVepBz+lNvqkNQmF8yzyw/73XdMq8u6QRL9adb7M322MZhnyYuqVhAQvxxkGFRNqB
	VrWblk=
X-Google-Smtp-Source: AGHT+IE6VuwB2rMj+eNLHkOFe2PPtB5Evc/htVg7PAq1VwLveklPNKiOwKomITt+xjUHLS9CMHCCKFVpIRDlVZvK68Y=
X-Received: by 2002:a17:90b:1d0f:b0:31f:ea:ca84 with SMTP id
 98e67ed59e1d1-32166c0fc1bmr197960a91.2.1754429534833; Tue, 05 Aug 2025
 14:32:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250805164431.24350-1-robin.clark@oss.qualcomm.com>
In-Reply-To: <20250805164431.24350-1-robin.clark@oss.qualcomm.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Tue, 5 Aug 2025 17:32:02 -0400
X-Gm-Features: Ac12FXwnTTjTLlR6ZiyVs-H5Xibje4MD5VPolzpqvzwQ7PFaf_1DWFcW5Qh9ga4
Message-ID: <CACu1E7FoQ1djuoqmjxJFHMLx1xuqsK4+a63gw34F-K8kca3-MQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm: Handle in-place remaps
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org, Danilo Krummrich <dakr@kernel.org>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 5, 2025 at 12:44=E2=80=AFPM Rob Clark <robin.clark@oss.qualcomm=
.com> wrote:
>
> Detect and handle the special case of a MAP op simply updating the vma
> flags of an existing vma, and skip the pgtable updates.  This allows
> turnip to set the MSM_VMA_DUMP flag on an existing mapping without
> requiring additional synchronization against commands running on the
> GPU.
>
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>

Tested that this fixes the occasional page faults with the zink a618
jobs on Mesa CI with my Mesa MR.

Tested-by: Connor Abbott <cwabbott0@gmail.com>

> ---
>  drivers/gpu/drm/msm/msm_gem_vma.c | 41 ++++++++++++++++++++++++++++---
>  1 file changed, 37 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_=
gem_vma.c
> index d1f5bb2e0a16..00d0f3b7ba32 100644
> --- a/drivers/gpu/drm/msm/msm_gem_vma.c
> +++ b/drivers/gpu/drm/msm/msm_gem_vma.c
> @@ -451,6 +451,8 @@ msm_gem_vm_bo_validate(struct drm_gpuvm_bo *vm_bo, st=
ruct drm_exec *exec)
>  struct op_arg {
>         unsigned flags;
>         struct msm_vm_bind_job *job;
> +       const struct msm_vm_bind_op *op;
> +       bool kept;
>  };
>
>  static void
> @@ -472,14 +474,18 @@ vma_from_op(struct op_arg *arg, struct drm_gpuva_op=
_map *op)
>  }
>
>  static int
> -msm_gem_vm_sm_step_map(struct drm_gpuva_op *op, void *arg)
> +msm_gem_vm_sm_step_map(struct drm_gpuva_op *op, void *_arg)
>  {
> -       struct msm_vm_bind_job *job =3D ((struct op_arg *)arg)->job;
> +       struct op_arg *arg =3D _arg;
> +       struct msm_vm_bind_job *job =3D arg->job;
>         struct drm_gem_object *obj =3D op->map.gem.obj;
>         struct drm_gpuva *vma;
>         struct sg_table *sgt;
>         unsigned prot;
>
> +       if (arg->kept)
> +               return 0;
> +
>         vma =3D vma_from_op(arg, &op->map);
>         if (WARN_ON(IS_ERR(vma)))
>                 return PTR_ERR(vma);
> @@ -599,15 +605,41 @@ msm_gem_vm_sm_step_remap(struct drm_gpuva_op *op, v=
oid *arg)
>  }
>
>  static int
> -msm_gem_vm_sm_step_unmap(struct drm_gpuva_op *op, void *arg)
> +msm_gem_vm_sm_step_unmap(struct drm_gpuva_op *op, void *_arg)
>  {
> -       struct msm_vm_bind_job *job =3D ((struct op_arg *)arg)->job;
> +       struct op_arg *arg =3D _arg;
> +       struct msm_vm_bind_job *job =3D arg->job;
>         struct drm_gpuva *vma =3D op->unmap.va;
>         struct msm_gem_vma *msm_vma =3D to_msm_vma(vma);
>
>         vm_dbg("%p:%p:%p: %016llx %016llx", vma->vm, vma, vma->gem.obj,
>                vma->va.addr, vma->va.range);
>
> +       /*
> +        * Detect in-place remap.  Turnip does this to change the vma fla=
gs,
> +        * in particular MSM_VMA_DUMP.  In this case we want to avoid act=
ually
> +        * touching the page tables, as that would require synchronizatio=
n
> +        * against SUBMIT jobs running on the GPU.
> +        */
> +       if (op->unmap.keep &&
> +           (arg->op->op =3D=3D MSM_VM_BIND_OP_MAP) &&
> +           (vma->gem.obj =3D=3D arg->op->obj) &&
> +           (vma->gem.offset =3D=3D arg->op->obj_offset) &&
> +           (vma->va.addr =3D=3D arg->op->iova) &&
> +           (vma->va.range =3D=3D arg->op->range)) {
> +               /* We are only expecting a single in-place unmap+map cb p=
air: */
> +               WARN_ON(arg->kept);
> +
> +               /* Leave the existing VMA in place, but signal that to th=
e map cb: */
> +               arg->kept =3D true;
> +
> +               /* Only flags are changing, so update that in-place: */
> +               unsigned orig_flags =3D vma->flags & (DRM_GPUVA_USERBITS =
- 1);
> +               vma->flags =3D orig_flags | arg->flags;
> +
> +               return 0;
> +       }
> +
>         if (!msm_vma->mapped)
>                 goto out_close;
>
> @@ -1268,6 +1300,7 @@ vm_bind_job_prepare(struct msm_vm_bind_job *job)
>                 const struct msm_vm_bind_op *op =3D &job->ops[i];
>                 struct op_arg arg =3D {
>                         .job =3D job,
> +                       .op =3D op,
>                 };
>
>                 switch (op->op) {
> --
> 2.50.1
>

