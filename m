Return-Path: <linux-arm-msm+bounces-29316-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA7695C177
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Aug 2024 01:15:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8F64E283904
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Aug 2024 23:15:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DA2E18306C;
	Thu, 22 Aug 2024 23:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kMtgMG+y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C8A4687;
	Thu, 22 Aug 2024 23:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724368541; cv=none; b=IQXUjdzPIZAVrfVRnH0LvpHlkPvSTi6GXnbljj33xXVdzia5QHQgA3FxyF9DW3jMDwqQUbKAKNNCvEa51u8DU3Pb2V7gghV0quyAbk7vU7OAHP0VI+DDN39djCvbkt3xy1O9Y4INnKUwdMJtLWe6oFny4+JjoThgsL6d9qR59sU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724368541; c=relaxed/simple;
	bh=FmOH4VCHQ7RRV3os04x39johr6N30/iNrwZAk4GnNfo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QcW5sB1rLQRulXgAdKACWHnRSMp5YnacDkF3TY1zNMduTRqjI5+NrcaOkkS0RzLGxCea2yeYoq1UfyZJI4XwFTbU+Yed8oscJSXF2LYbEGq4hPefuT+vTW4/ZplBzhexDqVemtp2D/y0w2sWVBrbF0XsAvTb8d5RhQQeCaA6sw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kMtgMG+y; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5bf009cf4c0so1668447a12.1;
        Thu, 22 Aug 2024 16:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724368538; x=1724973338; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WlY1SNCKTKo0ttR05+nbVrXCxk2tU/xwtzki62FkZqk=;
        b=kMtgMG+y372I3hF1wpG/NL9i/vL0G2XvMopNMEtDUeG65ARqRGdMtO70Qbt1DylbTg
         joadLRuQg+t8RvSGuEKdedd9O1KTfNKlKdQZFSFmFjRqscJ0+UdK8mLItKxjsGXVZapV
         +EeV+6R1oHv2rtKe9s1lfjYDnx+JY2vujXgnkKOhLzamIvgjdJtfyC9+T+9UHcTQv3K7
         Pxhj/fh29S++3PUKm2kskxR1H0XbK+v15xSg1hgXKAnapqJ+EAkaZAkjfSCivbuHCBia
         ySp/SrNJbEmrDiFPxhWICBnzglH6SMByP6l1csLmkY4gmY03bAYQkkMvEgbs7GDJUMCl
         UTng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724368538; x=1724973338;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WlY1SNCKTKo0ttR05+nbVrXCxk2tU/xwtzki62FkZqk=;
        b=FtPs6xo8Rute0FAS5F+gyXWMRNz15tCztE5noXPoB/eva09Pw+7+qoTHRocehnhFA/
         OKcufCzLV5LPvNId++ix80lV4muVmXwWo9PoQYBw1f2Ggc0Mfm0G+lV9uYYXpR3XS2Yc
         mXcrgzmcdUor4vmorSu4+M/bbImU1SMtjwe4Qcdf2GNEs9a7zKVaUx+0i3uVnBcuNLD0
         HHk2KALAiW7Qx4/jNbLKtfJNHDDDKLkdMxAw8/d+T0+I1Og+E5/mOxVUhFreljGhsonW
         2QwgPd68mRbO3xf2bniVo6/debgIxuaOl3QljXl7SLxwZEXGkD3zQo4I+YHWvHHymZvD
         +F/A==
X-Forwarded-Encrypted: i=1; AJvYcCXI8DGVUvRkTqGjzvnKnxzcq9ZsodcQ561rDemS4WtKriVQCBFPnOEKUHQ3P/P+tK/zFbQtNuBxXjAGHdLC@vger.kernel.org, AJvYcCXy9/iM4okz+1GPQJZNtPd+c/OlY/SsjwZmHLHy1qzys2lontSYHkoQDrTp5PYWX07y0UEgVEkv4n+KZCb3@vger.kernel.org
X-Gm-Message-State: AOJu0YwlwjiGwossKwjXeSUdRBLUw3FXWCKqdbsFxjoD7Se3uQcxlA7Y
	qz67ZRBTFVW7PZB+iVvg3nUm2F78zl2hPv4eR4aTiXlGF+TscHjmPZ3/uwnEQRaq/SkqlJi8Y5H
	Snff1s2CQaOTvg9Aa2GyCFK1usGpmdw==
X-Google-Smtp-Source: AGHT+IHnSJYv0lPhOFFX0bl0T7rDppf3ajTMjwwg0WAsK4RjyNO+BvVGm1/RFj3FQoF0uV7st09q2ymgIkwION7q1MA=
X-Received: by 2002:a05:6402:40c5:b0:57c:9d54:67db with SMTP id
 4fb4d7f45d1cf-5c08916a094mr117351a12.9.1724368537311; Thu, 22 Aug 2024
 16:15:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240820171652.145673-1-robdclark@gmail.com> <20240820171652.145673-5-robdclark@gmail.com>
 <20240822203401.odfmdlqto6lsqefz@hu-akhilpo-hyd.qualcomm.com>
In-Reply-To: <20240822203401.odfmdlqto6lsqefz@hu-akhilpo-hyd.qualcomm.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 22 Aug 2024 16:15:24 -0700
Message-ID: <CAF6AEGtGCT=TSp2XRmPaqb23dk42V_ic06OCB+JLEp6f5Y4tNg@mail.gmail.com>
Subject: Re: [PATCH v7 4/4] drm/msm: Extend gpu devcore dumps with pgtbl info
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org, Mostafa Saleh <smostafa@google.com>, 
	Will Deacon <will@kernel.org>, Rob Clark <robdclark@chromium.org>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, 
	"open list:DRM DRIVER for Qualcomm Adreno GPUs" <dri-devel@lists.freedesktop.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 22, 2024 at 1:34=E2=80=AFPM Akhil P Oommen <quic_akhilpo@quicin=
c.com> wrote:
>
> On Tue, Aug 20, 2024 at 10:16:47AM -0700, Rob Clark wrote: > From: Rob Cl=
ark <robdclark@chromium.org>
> >
> > In the case of iova fault triggered devcore dumps, include additional
> > debug information based on what we think is the current page tables,
> > including the TTBR0 value (which should match what we have in
> > adreno_smmu_fault_info unless things have gone horribly wrong), and
> > the pagetable entries traversed in the process of resolving the
> > faulting iova.
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 10 ++++++++++
> >  drivers/gpu/drm/msm/msm_gpu.c           |  9 +++++++++
> >  drivers/gpu/drm/msm/msm_gpu.h           |  8 ++++++++
> >  drivers/gpu/drm/msm/msm_iommu.c         | 22 ++++++++++++++++++++++
> >  drivers/gpu/drm/msm/msm_mmu.h           |  3 ++-
> >  5 files changed, 51 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/=
msm/adreno/adreno_gpu.c
> > index 1c6626747b98..3848b5a64351 100644
> > --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > @@ -864,6 +864,16 @@ void adreno_show(struct msm_gpu *gpu, struct msm_g=
pu_state *state,
> >               drm_printf(p, "  - dir=3D%s\n", info->flags & IOMMU_FAULT=
_WRITE ? "WRITE" : "READ");
> >               drm_printf(p, "  - type=3D%s\n", info->type);
> >               drm_printf(p, "  - source=3D%s\n", info->block);
> > +
> > +             /* Information extracted from what we think are the curre=
nt
> > +              * pgtables.  Hopefully the TTBR0 matches what we've extr=
acted
> > +              * from the SMMU registers in smmu_info!
> > +              */
> > +             drm_puts(p, "pgtable-fault-info:\n");
> > +             drm_printf(p, "  - ttbr0: %.16llx\n", (u64)info->pgtbl_tt=
br0);
>
> "0x" prefix? Otherwise, it is a bit confusing when the below one is
> decimal.

mixed feelings, the extra 0x is annoying when pasting into calc which
is a simple way to get binary decoding

OTOH none of this is machine decoded so I guess we could change it

> > +             drm_printf(p, "  - asid: %d\n", info->asid);
> > +             drm_printf(p, "  - ptes: %.16llx %.16llx %.16llx %.16llx\=
n",
> > +                        info->ptes[0], info->ptes[1], info->ptes[2], i=
nfo->ptes[3]);
>
> Does crashdec decodes this?

No, it just passed thru for human eyeballs

crashdec _does_ have some logic to flag buffers that are "near" the
faulting iova to help identify if the fault is an underflow/overflow
(which has been, along with the pte trail, useful to debug some
issues)

BR,
-R

> -Akhil.
>
> >       }
> >
> >       drm_printf(p, "rbbm-status: 0x%08x\n", state->rbbm_status);
> > diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gp=
u.c
> > index 3666b42b4ecd..bf2f8b2a7ccc 100644
> > --- a/drivers/gpu/drm/msm/msm_gpu.c
> > +++ b/drivers/gpu/drm/msm/msm_gpu.c
> > @@ -281,6 +281,15 @@ static void msm_gpu_crashstate_capture(struct msm_=
gpu *gpu,
> >       if (submit) {
> >               int i;
> >
> > +             if (state->fault_info.ttbr0) {
> > +                     struct msm_gpu_fault_info *info =3D &state->fault=
_info;
> > +                     struct msm_mmu *mmu =3D submit->aspace->mmu;
> > +
> > +                     msm_iommu_pagetable_params(mmu, &info->pgtbl_ttbr=
0,
> > +                                                &info->asid);
> > +                     msm_iommu_pagetable_walk(mmu, info->iova, info->p=
tes);
> > +             }
> > +
> >               state->bos =3D kcalloc(submit->nr_bos,
> >                       sizeof(struct msm_gpu_state_bo), GFP_KERNEL);
> >
> > diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gp=
u.h
> > index 1f02bb9956be..82e838ba8c80 100644
> > --- a/drivers/gpu/drm/msm/msm_gpu.h
> > +++ b/drivers/gpu/drm/msm/msm_gpu.h
> > @@ -101,6 +101,14 @@ struct msm_gpu_fault_info {
> >       int flags;
> >       const char *type;
> >       const char *block;
> > +
> > +     /* Information about what we think/expect is the current SMMU sta=
te,
> > +      * for example expected_ttbr0 should match smmu_info.ttbr0 which
> > +      * was read back from SMMU registers.
> > +      */
> > +     phys_addr_t pgtbl_ttbr0;
> > +     u64 ptes[4];
> > +     int asid;
> >  };
> >
> >  /**
> > diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_=
iommu.c
> > index 2a94e82316f9..3e692818ba1f 100644
> > --- a/drivers/gpu/drm/msm/msm_iommu.c
> > +++ b/drivers/gpu/drm/msm/msm_iommu.c
> > @@ -195,6 +195,28 @@ struct iommu_domain_geometry *msm_iommu_get_geomet=
ry(struct msm_mmu *mmu)
> >       return &iommu->domain->geometry;
> >  }
> >
> > +int
> > +msm_iommu_pagetable_walk(struct msm_mmu *mmu, unsigned long iova, uint=
64_t ptes[4])
> > +{
> > +     struct msm_iommu_pagetable *pagetable;
> > +     struct arm_lpae_io_pgtable_walk_data wd =3D {};
> > +
> > +     if (mmu->type !=3D MSM_MMU_IOMMU_PAGETABLE)
> > +             return -EINVAL;
> > +
> > +     pagetable =3D to_pagetable(mmu);
> > +
> > +     if (!pagetable->pgtbl_ops->pgtable_walk)
> > +             return -EINVAL;
> > +
> > +     pagetable->pgtbl_ops->pgtable_walk(pagetable->pgtbl_ops, iova, &w=
d);
> > +
> > +     for (int i =3D 0; i < ARRAY_SIZE(wd.ptes); i++)
> > +             ptes[i] =3D wd.ptes[i];
> > +
> > +     return 0;
> > +}
> > +
> >  static const struct msm_mmu_funcs pagetable_funcs =3D {
> >               .map =3D msm_iommu_pagetable_map,
> >               .unmap =3D msm_iommu_pagetable_unmap,
> > diff --git a/drivers/gpu/drm/msm/msm_mmu.h b/drivers/gpu/drm/msm/msm_mm=
u.h
> > index 88af4f490881..96e509bd96a6 100644
> > --- a/drivers/gpu/drm/msm/msm_mmu.h
> > +++ b/drivers/gpu/drm/msm/msm_mmu.h
> > @@ -53,7 +53,8 @@ static inline void msm_mmu_set_fault_handler(struct m=
sm_mmu *mmu, void *arg,
> >  struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent);
> >
> >  int msm_iommu_pagetable_params(struct msm_mmu *mmu, phys_addr_t *ttbr,
> > -             int *asid);
> > +                            int *asid);
> > +int msm_iommu_pagetable_walk(struct msm_mmu *mmu, unsigned long iova, =
uint64_t ptes[4]);
> >  struct iommu_domain_geometry *msm_iommu_get_geometry(struct msm_mmu *m=
mu);
> >
> >  #endif /* __MSM_MMU_H__ */
> > --
> > 2.46.0
> >

