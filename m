Return-Path: <linux-arm-msm+bounces-51065-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 48ACEA5CFA1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 20:43:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6C6597A3CEA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 19:41:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 985B42641F5;
	Tue, 11 Mar 2025 19:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BkWW6cmK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E64D263881
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Mar 2025 19:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741722173; cv=none; b=o/pTt+ENb/Z6dDGcHv8VdA2mgFkaNL6J2WG/LdXRVPT68MNfDZtHE3vJVi3l1w2MVKvZ+wPF+drZEh3GyAxxpTpyoLuMHpQAyGVkLjTR9PEqgkCWZ4ASF3Gltn8nZvE7O9849pw1LBL+K2KpxD0RhPuRzsjMcrICZmkecIdKvLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741722173; c=relaxed/simple;
	bh=1KA72Lm2RCHKFh/p6H4nke2mfI5zVmemdmoVecWMp2g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GTFCuiO3YxQJaMeKK9b/+pjT1lw+bfr/GT/vA4TGtNKUOOrEGiwEtRUBLzdo6mytRVWFEicwhDXhLdSveLqyMwP14gIXAf2VnVIOX3sTBa1Vdo9YG42u5OmHd7P1H6gPsXKIAYcWU9gZk3VFmRJ7XW/gBOsnfzGiltVHgpZFpWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BkWW6cmK; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-301001bc6a8so331292a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Mar 2025 12:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741722171; x=1742326971; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8N/4+Bu0y09vjMihB3VFFSKzM9LtDAemE75jVPYGVnw=;
        b=BkWW6cmKD24GlgziYP+QYLNJRGpEmAvPic7M+rEvltWKhfa0FwhqqNN8d3+VT0xyck
         hfF0XJ4i1p5QqngMWAeGjyIuXDSKQ1695en6IvDNXWBMXhqoLVIc9wRCE3y9dvdVcdH4
         e6Oj95Y/r8XFrjOtqO1dsD+t+z7+1oVFMw6d3irxZtYG9vdf0pg9oMcWav6YDMuxvMTy
         xXx1W5kdL4iB0zUhFR3DJJAL6oBVZ17SXcAGbv0RGLV7u0kueXYEUn40x53Srd7bbKWM
         KUMkESx/7bLxAZud3i0dBPIIPovtkQYqkE3kv5WZV5zxkNdsIMdMgiRHgFFU9UcfNBVZ
         lXNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741722171; x=1742326971;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8N/4+Bu0y09vjMihB3VFFSKzM9LtDAemE75jVPYGVnw=;
        b=Y5+MKqr2OHkbhzRIbaN4BJzz+OyqW30Fvwws1zYiH5ov7PIAscftaLDiVsPAq3JSgw
         X5h6SJSnWlok1Z22wHE7ic7qnzImE81j6JLBDIRTAtzlxTpHYWxP8L893RIeZ5M0f6Q2
         5F0HIXWsgQ7LYxoVQDdbrLH4pqReO/Fgz9cBUylGwqM1L+ZfkIovkNBaDShG/tLM0+Tc
         u01XHUrmS8bpNsVPdT6yJx277OKsl0pkletsnYK5fXttxS2W90ASCg9CuiZAT9p4R5L9
         nbqXetfrmbOb2JiAHDut24TJzpp+GoOc/vyDvsLCmKY2Dj4n9EqFhBx/7F1Z5hPdAJvO
         JSdA==
X-Forwarded-Encrypted: i=1; AJvYcCWAwy9jmTK3tHwd8sf6vKA6S1HO62aBG4yFDl0iyopF/noSRyhvRtLtwmTJOnEBN0RTDTrwaNM4tHNEIyv1@vger.kernel.org
X-Gm-Message-State: AOJu0YwzJNh+LXG64j4myTPfkWMKiBQqibc+zoE/HOJRQ7iOQdHFkZBS
	nuRyh7QtMDUMKWynMhhjpfUSdTsYPRjHcbl3e0Kse4P1bO7Eau/b6SXai9VdHXi/FFTK7qHEL1C
	ntb1cwDf44Y9laKP6s2W0smJbhdU=
X-Gm-Gg: ASbGncv8OE7fzCLHAkEnMSGPHiaFknjDmCchKUHjP2hTAaHpshhaAM/m/RoMynv9L12
	X6mAvzIC3j1ecaKKKihTG84ac03IsCJgLTK1MVb+XpGbdkBTDCowPO5RYySxdIpxRc2teQLXUBC
	k4RKkNEGfWAAjZDG0OP6Yr2NgC/PA2Q59yOOce
X-Google-Smtp-Source: AGHT+IFUV+t76koSVwvfP0DiZwzaDgX4TU97m1RDJMgX9rF6Maeao/NZF5n1twVNajoiVfnFuWNdcIiFIJEURljqxUQ=
X-Received: by 2002:a05:6a00:3e04:b0:730:9989:d2d4 with SMTP id
 d2e1a72fcca58-736eba65be7mr2466708b3a.3.1741722171206; Tue, 11 Mar 2025
 12:42:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250304-msm-gpu-fault-fixes-next-v4-0-be14be37f4c3@gmail.com>
 <20250304-msm-gpu-fault-fixes-next-v4-2-be14be37f4c3@gmail.com> <20250311180807.GC5216@willie-the-truck>
In-Reply-To: <20250311180807.GC5216@willie-the-truck>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Tue, 11 Mar 2025 15:42:38 -0400
X-Gm-Features: AQ5f1Jpiv6Ky6TiyCXBXNy8BjxnsE1wP6MKIErri1CZPIQdm5BNmyqGHT0u49Nw
Message-ID: <CACu1E7Hw6vGbTQ7t-Hj3ziycZhPxtOGSDkt7o4fNUx91KDcXfg@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] iommu/arm-smmu-qcom: Don't read fault registers directly
To: Will Deacon <will@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>, Robin Murphy <robin.murphy@arm.com>, 
	Joerg Roedel <joro@8bytes.org>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, iommu@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 11, 2025 at 2:08=E2=80=AFPM Will Deacon <will@kernel.org> wrote=
:
>
> On Tue, Mar 04, 2025 at 11:56:48AM -0500, Connor Abbott wrote:
> > In some cases drm/msm has to resume a stalled transaction directly in
> > its fault handler. Experimentally this doesn't work on SMMU500 if the
> > fault hasn't already been acknowledged by clearing FSR. Rather than
> > trying to clear FSR in msm's fault handler and implementing a
> > tricky handshake to avoid accidentally clearing FSR twice, we want to
> > clear FSR before calling the fault handlers, but this means that the
> > contents of registers can change underneath us in the fault handler and
> > msm currently uses a private function to read the register contents for
> > its own purposes in its fault handler, such as using the
> > implementation-defined FSYNR1 to determine which block caused the fault=
.
> > Fix this by making msm use the register values already read by arm-smmu
> > itself before clearing FSR rather than messing around with reading
> > registers directly.
> >
> > Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
> > ---
> >  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 19 +++++++++----------
> >  drivers/iommu/arm/arm-smmu/arm-smmu.c      | 14 +++++++-------
> >  drivers/iommu/arm/arm-smmu/arm-smmu.h      | 21 +++++++++++----------
> >  3 files changed, 27 insertions(+), 27 deletions(-)
>
> [...]
>
> > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/=
arm-smmu/arm-smmu.h
> > index d3bc77dcd4d40f25bc70f3289616fb866649b022..411d807e0a7033833716635=
efb3968a0bd3ff237 100644
> > --- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
> > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> > @@ -373,6 +373,16 @@ enum arm_smmu_domain_stage {
> >       ARM_SMMU_DOMAIN_NESTED,
> >  };
> >
> > +struct arm_smmu_context_fault_info {
> > +     unsigned long iova;
> > +     u64 ttbr0;
> > +     u32 fsr;
> > +     u32 fsynr0;
> > +     u32 fsynr1;
> > +     u32 cbfrsynra;
> > +     u32 contextidr;
> > +};
> > +
> >  struct arm_smmu_domain {
> >       struct arm_smmu_device          *smmu;
> >       struct io_pgtable_ops           *pgtbl_ops;
> > @@ -380,6 +390,7 @@ struct arm_smmu_domain {
> >       const struct iommu_flush_ops    *flush_ops;
> >       struct arm_smmu_cfg             cfg;
> >       enum arm_smmu_domain_stage      stage;
> > +     struct arm_smmu_context_fault_info cfi;
>
> Does this mean we have to serialise all faults for a given domain? That
> can't be right...
>
> Will

They are already serialized? There's only one of each register per
context bank, so you can only have one context fault at a time per
context bank, and AFAIK a context bank is 1:1 with a domain. Also this
struct is only written and then read inside the context bank's
interrupt handler, and you can only have one interrupt at a time, no?

Connor

