Return-Path: <linux-arm-msm+bounces-29514-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6746C95F8F9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Aug 2024 20:30:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BDBA32833EF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Aug 2024 18:30:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55D26824BB;
	Mon, 26 Aug 2024 18:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QV6HdLMx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E2FB677;
	Mon, 26 Aug 2024 18:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724696990; cv=none; b=Ogvu4t5TjCpISnNc2UPMBvqOaayJt/3w9b6TbENMd5V5kc7JtUmmpXWyIV/R4m37tQtBJ7VBUFBjsPYHoP/mXhvC5CWkzLLApJN+7BudEJ+7WdPqyuWFjAT0FFMqkEyeFNyOwjR4uxJidRAdtAltLt7pjr+yjKD/8Lyj2CTU7wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724696990; c=relaxed/simple;
	bh=DoqSWBVRDMY9nAZiN+3zetnRbsIkRgSSX511Rab4zDk=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sWHC3FRJTsPcObBImCBcApddxxKTn+52TJZsNx54gYAmk62x5+x3oGKc6j6+LDK84WrvJs3CmVqMO8/35sZgUPoX585BiLFzx38WsHWx7czC2fYKxqiF6k21VSgE6WwtevJprvyt5NJcljIIj0WGG/iZGZNyVR92F5wEMjbj03A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QV6HdLMx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47QGjvZX014445;
	Mon, 26 Aug 2024 18:29:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	msHYl9Xj4RS1OPrJlrsccFKr/fThyPbI4ZRc5QLXCo4=; b=QV6HdLMxyIctrgGR
	7lz7VoZEatuUThWWBnELhCuNFL74btoCP0O+2SknJ8rfgU3Z40s0BXaVQi4WC5Tg
	e1FbDzGcH8zuLDRLfrP4+VjfudCjn9aqW8myrqRUD7ak3V01DF6Njn11ZXZ7ig2R
	AR9Eegc4hPSgeU73mfvXOWYhVRg40f3BwnlOsmtMxsRrVwi70wI4Tqc3Yp4Z2HMQ
	Ik9tX2CHmj4cLoAgJWCO22fOBcJx8ScSPvJTtBWzv16jz03KdqDyoqARY85Tf+hK
	EPSvEwxsMyE+zrAFQJVUK7F1lRlFSTv6dBuYNKoqVV7eSrlWDFq13OKkmDo5I0jg
	PecNsg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 417993mgan-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Aug 2024 18:29:32 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47QITVRS029932
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Aug 2024 18:29:31 GMT
Received: from hu-akhilpo-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 26 Aug 2024 11:29:26 -0700
Date: Mon, 26 Aug 2024 23:59:22 +0530
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: Rob Clark <robdclark@gmail.com>
CC: <iommu@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
        <freedreno@lists.freedesktop.org>, Mostafa Saleh <smostafa@google.com>,
        "Will
 Deacon" <will@kernel.org>, Rob Clark <robdclark@chromium.org>,
        Sean Paul
	<sean@poorly.run>, Konrad Dybcio <konrad.dybcio@linaro.org>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie
	<airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        "open list:DRM DRIVER
 for Qualcomm Adreno GPUs" <dri-devel@lists.freedesktop.org>,
        open list
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 4/4] drm/msm: Extend gpu devcore dumps with pgtbl info
Message-ID: <20240826182922.wxxx3bwflxga2dlr@hu-akhilpo-hyd.qualcomm.com>
References: <20240820171652.145673-1-robdclark@gmail.com>
 <20240820171652.145673-5-robdclark@gmail.com>
 <20240822203401.odfmdlqto6lsqefz@hu-akhilpo-hyd.qualcomm.com>
 <CAF6AEGtGCT=TSp2XRmPaqb23dk42V_ic06OCB+JLEp6f5Y4tNg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF6AEGtGCT=TSp2XRmPaqb23dk42V_ic06OCB+JLEp6f5Y4tNg@mail.gmail.com>
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 4iY9OrKCU8OH8cKCTPCe6d5xiAVpZivz
X-Proofpoint-ORIG-GUID: 4iY9OrKCU8OH8cKCTPCe6d5xiAVpZivz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-26_13,2024-08-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 mlxscore=0 clxscore=1015
 phishscore=0 mlxlogscore=999 spamscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2407110000 definitions=main-2408260140

On Thu, Aug 22, 2024 at 04:15:24PM -0700, Rob Clark wrote:
> On Thu, Aug 22, 2024 at 1:34 PM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
> >
> > On Tue, Aug 20, 2024 at 10:16:47AM -0700, Rob Clark wrote: > From: Rob Clark <robdclark@chromium.org>
> > >
> > > In the case of iova fault triggered devcore dumps, include additional
> > > debug information based on what we think is the current page tables,
> > > including the TTBR0 value (which should match what we have in
> > > adreno_smmu_fault_info unless things have gone horribly wrong), and
> > > the pagetable entries traversed in the process of resolving the
> > > faulting iova.
> > >
> > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > ---
> > >  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 10 ++++++++++
> > >  drivers/gpu/drm/msm/msm_gpu.c           |  9 +++++++++
> > >  drivers/gpu/drm/msm/msm_gpu.h           |  8 ++++++++
> > >  drivers/gpu/drm/msm/msm_iommu.c         | 22 ++++++++++++++++++++++
> > >  drivers/gpu/drm/msm/msm_mmu.h           |  3 ++-
> > >  5 files changed, 51 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > > index 1c6626747b98..3848b5a64351 100644
> > > --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > > +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > > @@ -864,6 +864,16 @@ void adreno_show(struct msm_gpu *gpu, struct msm_gpu_state *state,
> > >               drm_printf(p, "  - dir=%s\n", info->flags & IOMMU_FAULT_WRITE ? "WRITE" : "READ");
> > >               drm_printf(p, "  - type=%s\n", info->type);
> > >               drm_printf(p, "  - source=%s\n", info->block);
> > > +
> > > +             /* Information extracted from what we think are the current
> > > +              * pgtables.  Hopefully the TTBR0 matches what we've extracted
> > > +              * from the SMMU registers in smmu_info!
> > > +              */
> > > +             drm_puts(p, "pgtable-fault-info:\n");
> > > +             drm_printf(p, "  - ttbr0: %.16llx\n", (u64)info->pgtbl_ttbr0);
> >
> > "0x" prefix? Otherwise, it is a bit confusing when the below one is
> > decimal.
> 
> mixed feelings, the extra 0x is annoying when pasting into calc which
> is a simple way to get binary decoding
> 
> OTOH none of this is machine decoded so I guess we could change it

On second thought, I think it is fine as this is an address. Probably,
it is helpful for the pte values below.

> 
> > > +             drm_printf(p, "  - asid: %d\n", info->asid);
> > > +             drm_printf(p, "  - ptes: %.16llx %.16llx %.16llx %.16llx\n",
> > > +                        info->ptes[0], info->ptes[1], info->ptes[2], info->ptes[3]);
> >
> > Does crashdec decodes this?
> 
> No, it just passed thru for human eyeballs
> 
> crashdec _does_ have some logic to flag buffers that are "near" the
> faulting iova to help identify if the fault is an underflow/overflow
> (which has been, along with the pte trail, useful to debug some
> issues)

Alright.

Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>

-Akhil.
> 
> BR,
> -R
> 
> > -Akhil.
> >
> > >       }
> > >
> > >       drm_printf(p, "rbbm-status: 0x%08x\n", state->rbbm_status);
> > > diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> > > index 3666b42b4ecd..bf2f8b2a7ccc 100644
> > > --- a/drivers/gpu/drm/msm/msm_gpu.c
> > > +++ b/drivers/gpu/drm/msm/msm_gpu.c
> > > @@ -281,6 +281,15 @@ static void msm_gpu_crashstate_capture(struct msm_gpu *gpu,
> > >       if (submit) {
> > >               int i;
> > >
> > > +             if (state->fault_info.ttbr0) {
> > > +                     struct msm_gpu_fault_info *info = &state->fault_info;
> > > +                     struct msm_mmu *mmu = submit->aspace->mmu;
> > > +
> > > +                     msm_iommu_pagetable_params(mmu, &info->pgtbl_ttbr0,
> > > +                                                &info->asid);
> > > +                     msm_iommu_pagetable_walk(mmu, info->iova, info->ptes);
> > > +             }
> > > +
> > >               state->bos = kcalloc(submit->nr_bos,
> > >                       sizeof(struct msm_gpu_state_bo), GFP_KERNEL);
> > >
> > > diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
> > > index 1f02bb9956be..82e838ba8c80 100644
> > > --- a/drivers/gpu/drm/msm/msm_gpu.h
> > > +++ b/drivers/gpu/drm/msm/msm_gpu.h
> > > @@ -101,6 +101,14 @@ struct msm_gpu_fault_info {
> > >       int flags;
> > >       const char *type;
> > >       const char *block;
> > > +
> > > +     /* Information about what we think/expect is the current SMMU state,
> > > +      * for example expected_ttbr0 should match smmu_info.ttbr0 which
> > > +      * was read back from SMMU registers.
> > > +      */
> > > +     phys_addr_t pgtbl_ttbr0;
> > > +     u64 ptes[4];
> > > +     int asid;
> > >  };
> > >
> > >  /**
> > > diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
> > > index 2a94e82316f9..3e692818ba1f 100644
> > > --- a/drivers/gpu/drm/msm/msm_iommu.c
> > > +++ b/drivers/gpu/drm/msm/msm_iommu.c
> > > @@ -195,6 +195,28 @@ struct iommu_domain_geometry *msm_iommu_get_geometry(struct msm_mmu *mmu)
> > >       return &iommu->domain->geometry;
> > >  }
> > >
> > > +int
> > > +msm_iommu_pagetable_walk(struct msm_mmu *mmu, unsigned long iova, uint64_t ptes[4])
> > > +{
> > > +     struct msm_iommu_pagetable *pagetable;
> > > +     struct arm_lpae_io_pgtable_walk_data wd = {};
> > > +
> > > +     if (mmu->type != MSM_MMU_IOMMU_PAGETABLE)
> > > +             return -EINVAL;
> > > +
> > > +     pagetable = to_pagetable(mmu);
> > > +
> > > +     if (!pagetable->pgtbl_ops->pgtable_walk)
> > > +             return -EINVAL;
> > > +
> > > +     pagetable->pgtbl_ops->pgtable_walk(pagetable->pgtbl_ops, iova, &wd);
> > > +
> > > +     for (int i = 0; i < ARRAY_SIZE(wd.ptes); i++)
> > > +             ptes[i] = wd.ptes[i];
> > > +
> > > +     return 0;
> > > +}
> > > +
> > >  static const struct msm_mmu_funcs pagetable_funcs = {
> > >               .map = msm_iommu_pagetable_map,
> > >               .unmap = msm_iommu_pagetable_unmap,
> > > diff --git a/drivers/gpu/drm/msm/msm_mmu.h b/drivers/gpu/drm/msm/msm_mmu.h
> > > index 88af4f490881..96e509bd96a6 100644
> > > --- a/drivers/gpu/drm/msm/msm_mmu.h
> > > +++ b/drivers/gpu/drm/msm/msm_mmu.h
> > > @@ -53,7 +53,8 @@ static inline void msm_mmu_set_fault_handler(struct msm_mmu *mmu, void *arg,
> > >  struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent);
> > >
> > >  int msm_iommu_pagetable_params(struct msm_mmu *mmu, phys_addr_t *ttbr,
> > > -             int *asid);
> > > +                            int *asid);
> > > +int msm_iommu_pagetable_walk(struct msm_mmu *mmu, unsigned long iova, uint64_t ptes[4]);
> > >  struct iommu_domain_geometry *msm_iommu_get_geometry(struct msm_mmu *mmu);
> > >
> > >  #endif /* __MSM_MMU_H__ */
> > > --
> > > 2.46.0
> > >

