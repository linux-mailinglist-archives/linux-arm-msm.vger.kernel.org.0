Return-Path: <linux-arm-msm+bounces-46007-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F47A1AA4E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 20:26:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B89C0188AD00
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 19:26:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C7C2192B69;
	Thu, 23 Jan 2025 19:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="B8NUcHj0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D741BC4E
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2025 19:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737660407; cv=none; b=OTU/OHtVghemGpyLYb0Vn6MRjzzOEDYv9oCPO+quWQDXLNHGlWEaqgAS1wKWKBbZXpE8D4AC+pshWxFdDWd+9GosY/VpSSv3alyzQ6yKYWLk4lSF5gjGaQFoCvd++BM0OmBJj5ncYe5Ds5AFEVuKzIkefyq8ne9myiQVustzAuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737660407; c=relaxed/simple;
	bh=5db58c5dg0ySVECwNpTWJvf8PNP5Uf+onN97MrC/7l4=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AjCc+DJgIjQZEFQdBGOr3c+Scfuz9jzjGArdUN8QOdbLBeGdYjaGzxeK4DolnxYoVJLbh9+bDRZNiK5vDLqx3wS2QhRhxk4ORpeaRrXOeMdreISnYI/w+q8gxc6H0FC97zrVYjPVHB7NZAHVA/1Jeomtdowh5m/ZhY5F8LyZgRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=B8NUcHj0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50NDsI5s029652;
	Thu, 23 Jan 2025 19:26:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xbPxKwFgsEnv6VNL5xU4bAl2nRy0Cg3dN5HZEfeLACc=; b=B8NUcHj0AdZFf6hd
	E+2f5JiMjkEuDXf74j7gu1AvZ3YsxRV79nNnlDFHUt/A2/ReT0JM/f1n9m02vDh6
	oaTIaciBdpbOct9MiWZUevcQqH1MLk+oJKqY7OrU07/k3Ad0iObv64ownWQJD4Vj
	EhmHAsBzbGHM35vV+JVD1Euuic3iCeCmh7q6PDOdl6ud88v1FDu/ru0cxUc39NQJ
	WGI90ZM4OXr+55JcVRAaYSkkwGhKFIIMcTPCfzOu9MGj7wspR/jRQZmGuZ8SUttx
	hJlC1TwBtz6/cDx1ruq+Y0v6iWnMm2Y2nHHQ4yjiHBYcpY1w6jD1MtphAj0zkAsI
	4yyBfw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44bq2crs02-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jan 2025 19:26:18 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50NJQHXJ031213
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jan 2025 19:26:17 GMT
Received: from hu-guptap-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 23 Jan 2025 11:26:13 -0800
Date: Fri, 24 Jan 2025 00:55:52 +0530
From: Prakash Gupta <quic_guptap@quicinc.com>
To: Connor Abbott <cwabbott0@gmail.com>
CC: Rob Clark <robdclark@gmail.com>, Will Deacon <will@kernel.org>,
        "Robin
 Murphy" <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        Sean Paul
	<sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        <iommu@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <freedreno@lists.freedesktop.org>
Subject: Re: [PATCH v3 1/3] iommu/arm-smmu: Fix spurious interrupts with
 stall-on-fault
Message-ID: <Z5KXwNPrdirVUn8Z@hu-guptap-hyd.qualcomm.com>
References: <20250122-msm-gpu-fault-fixes-next-v3-0-0afa00158521@gmail.com>
 <20250122-msm-gpu-fault-fixes-next-v3-1-0afa00158521@gmail.com>
 <Z5IjsqQ6vTdUXiGt@hu-guptap-hyd.qualcomm.com>
 <CACu1E7H5X2EfY9AG=xceaoZJkbumwnrsU4QvNbxd_A2wgVVOaQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACu1E7H5X2EfY9AG=xceaoZJkbumwnrsU4QvNbxd_A2wgVVOaQ@mail.gmail.com>
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: fBRnQJYsHzIeNqRvZGODuPo4dLE3j9Os
X-Proofpoint-ORIG-GUID: fBRnQJYsHzIeNqRvZGODuPo4dLE3j9Os
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-23_08,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=1 impostorscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0 spamscore=1
 lowpriorityscore=0 malwarescore=0 mlxlogscore=222 mlxscore=1 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501230141

On Thu, Jan 23, 2025 at 09:00:17AM -0500, Connor Abbott wrote:
> On Thu, Jan 23, 2025 at 6:10 AM Prakash Gupta <quic_guptap@quicinc.com> wrote:
> >
> > On Wed, Jan 22, 2025 at 03:00:58PM -0500, Connor Abbott wrote:
> >
> > > +     /*
> > > +      * On some implementations FSR.SS asserts a context fault
> > > +      * interrupt. We do not want this behavior, because resolving the
> > > +      * original context fault typically requires operations that cannot be
> > > +      * performed in IRQ context but leaving the stall unacknowledged will
> > > +      * immediately lead to another spurious interrupt as FSR.SS is still
> > > +      * set. Work around this by disabling interrupts for this context bank.
> > > +      * It's expected that interrupts are re-enabled after resuming the
> > > +      * translation.
> > > +      *
> > > +      * We have to do this before report_iommu_fault() so that we don't
> > > +      * leave interrupts disabled in case the downstream user decides the
> > > +      * fault can be resolved inside its fault handler.
> > > +      *
> > > +      * There is a possible race if there are multiple context banks sharing
> > > +      * the same interrupt and both signal an interrupt in between writing
> > > +      * RESUME and SCTLR. We could disable interrupts here before we
Not sure if multiple context bank with shared interrupt supported for
arm-smmu driver, but even if does than context fault handler they would
operate on their respective context register space, so I don't see the race
at context register update. 

> > > +      * re-enable them in the resume handler, leaving interrupts enabled.
> > > +      * Lock the write to serialize it with the resume handler.
> > > +      */
> > > +     if (cfi.fsr & ARM_SMMU_CB_FSR_SS) {
> > > +             u32 val;
> > > +
> > > +             spin_lock(&smmu_domain->cb_lock);
> > > +             val = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_SCTLR);
> > > +             val &= ~ARM_SMMU_SCTLR_CFIE;
> > > +             arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_SCTLR, val);
> > > +             spin_unlock(&smmu_domain->cb_lock);
> > > +     }
> > > +
> > > +     /*
> > > +      * The SMMUv2 architecture specification says that if stall-on-fault is
> > > +      * enabled the correct sequence is to write to SMMU_CBn_FSR to clear
> > > +      * the fault and then write to SMMU_CBn_RESUME. Clear the interrupt
> > > +      * first before running the user's fault handler to make sure we follow
> > > +      * this sequence. It should be ok if there is another fault in the
> > > +      * meantime because we have already read the fault info.
> > > +      */
qcom_adreno_smmu_get_fault_info() reads the fault info as part of client
fault hanlder. So it would not be ok to clear FSR before reporting the
fault to client.

> > The context would remain stalled till we write to CBn_RESUME. Which is done
> > in qcom_adreno_smmu_resume_translation(). For a stalled context further
> > transactions are not processed and we shouldn't see further faults and
> > or fault inerrupts. Do you observe faults with stalled context?
> 
> Yes. I've observed that on MMU-500 writing RESUME before the interrupt
> has been cleared doesn't clear SS. This happened with v2 in the case
> where there was already a devcoredump and drm/msm called
> qcom_adreno_smmu_resume_translation() immediately from its fault
> handler, and we'd get a storm of unhandled interrupts until it was
> disabled. Given that the architecture spec says we're supposed to
> clear the interrupt first this may have been an attempt to "help"
> developers.
> 

Just to clarify, present sequence is:
1. context fault with stall enable. FSR.SS set.
2. Report fault to client
3. resume/terminate stalled transaction
4. clear FSR

At what point when you try #2->#3->#4 or #4->#2->#3 sequence, is FSR.SS
cleared and interrupt storm is observed.  The way CFIE disable is helping
with current patch indicates write FSR is unstalling context and subsequent
transactions are faulted.  Do you stop getting interrupt storm after write
RESUME. If you can mention your SCTLR configuration and FSR state in test
sequence, it would be clearer. 

An aside, If reducing delay between FSR and RESUME write helps then both
can be done as part of qcom_adreno_smmu_resume_translation(). This will
follow spec recommendation and also make sure fault registers are not
cleared before reporting fault to client.

Thanks,
Prakash

