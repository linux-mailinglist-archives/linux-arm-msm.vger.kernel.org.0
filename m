Return-Path: <linux-arm-msm+bounces-46003-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE88A1A8FA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 18:35:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 01B723ACBA4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 17:35:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E99C113D882;
	Thu, 23 Jan 2025 17:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CnWxtVDZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25884EC5
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2025 17:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737653740; cv=none; b=YkdH1hRY63yF6JzYikrS/osOYZJYw0K9rHWfUh18m3snOtI41sS3D3TiOlH7JtJDU4L/e1dApFNJY3fs1TNj69Qm24g2QcfHZ0TJhXa1V8DZQPXoAz6WwHJEyN8bGlUdbxgXv8OIbpwdHOqBgst5vvMRUwNP/NS0VTD3Y7DL2yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737653740; c=relaxed/simple;
	bh=OOBTytmDaQ6UJzTPi1jox3V/5m4DQwpCEO0KPegpU2s=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=usOjujYKtvlQdfcnQ4CWI19GhF66Ze+hpvFLxpNB/4+Sf4RYKlPrm2RTsJP6EoYff6wFiq7c65MTqjNds/FJbvI9jYT+O7ZorohQo8wmr8haDWqNlDA2+hnajsNNYcYkrtYjbb8TZJeBeSvpWmNHSeaqpXKDN99A00HKe0jNniU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CnWxtVDZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50NFr2iw031618;
	Thu, 23 Jan 2025 17:35:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3sAObRTPJYOicvuINKNxbQAM
	Lh+X34dr0zItcLyQyQ8=; b=CnWxtVDZsoW06382hhUrxkUCZN6PsICjBsshSBM7
	Dky1GYeFZ3yh3IkoNzfbUprCb/UjdidwYmFrtKByGeHBcXM1zd8aTaO3AHbMbxy8
	qLbOCjWGiiYCs5qAjIDDbmgj80IV/DnYvsou60wwA8KeWuFhsFvwyvFy4reQgn0R
	OjPXipHokqwj2jID6Qn0/1uqI20Z3RSVjTIo/iE/4xpfgecx8dYJBmtLapgxwQIN
	Mt3RkIXH569SnzKV9Mt4XZJIBDZFo/hhyiJOCKtK5hVkCtEzaaqZL0R6G4JDbtIF
	BRrWyRkKgqt61qoaJSMo6UochB36Z0NXUhFFIz//OLmvMw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44brsyg93v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jan 2025 17:35:17 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50NHZGA4031330
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jan 2025 17:35:16 GMT
Received: from hu-guptap-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 23 Jan 2025 09:35:12 -0800
Date: Thu, 23 Jan 2025 23:04:58 +0530
From: Prakash Gupta <quic_guptap@quicinc.com>
To: Robin Murphy <robin.murphy@arm.com>
CC: Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@gmail.com>,
        "Will Deacon" <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
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
Message-ID: <Z5J9wpooIH5/Ccrt@hu-guptap-hyd.qualcomm.com>
References: <20250122-msm-gpu-fault-fixes-next-v3-0-0afa00158521@gmail.com>
 <20250122-msm-gpu-fault-fixes-next-v3-1-0afa00158521@gmail.com>
 <Z5IjsqQ6vTdUXiGt@hu-guptap-hyd.qualcomm.com>
 <b593ac5e-cb29-473a-af1b-214168968679@arm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <b593ac5e-cb29-473a-af1b-214168968679@arm.com>
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: QM4dPC_sVTC_fOBkeECY6Kk1472-TJ67
X-Proofpoint-ORIG-GUID: QM4dPC_sVTC_fOBkeECY6Kk1472-TJ67
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-23_07,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 mlxlogscore=494 spamscore=0 mlxscore=0 clxscore=1015
 impostorscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501230129

On Thu, Jan 23, 2025 at 11:51:27AM +0000, Robin Murphy wrote:
> On 2025-01-23 11:10 am, Prakash Gupta wrote:
> > On Wed, Jan 22, 2025 at 03:00:58PM -0500, Connor Abbott wrote:
> > > +	/*
> > > +	 * The SMMUv2 architecture specification says that if stall-on-fault is
> > > +	 * enabled the correct sequence is to write to SMMU_CBn_FSR to clear
> > > +	 * the fault and then write to SMMU_CBn_RESUME. Clear the interrupt
> > > +	 * first before running the user's fault handler to make sure we follow
> > > +	 * this sequence. It should be ok if there is another fault in the
> > > +	 * meantime because we have already read the fault info.
> > > +	 */
> > The context would remain stalled till we write to CBn_RESUME. Which is done
> > in qcom_adreno_smmu_resume_translation(). For a stalled context further
> > transactions are not processed and we shouldn't see further faults and
> > or fault inerrupts. Do you observe faults with stalled context?
> 
> This aspect isn't exclusive to stalled contexts though - even for "normal"
> terminated faults, clearing the FSR as soon as we've sampled all the
> associated fault registers is no bad thing, since if a second fault does
> occur while we're still reporting the first, we're then more likely to get a
> full syndrome rather than just the FSR.MULTI bit.
> 
ARM SMMUv2 spec recommends, in case of reported fault sw should first
correct the condition which casued the fault, I would interpret this as
reporting fault to client using callback, and then write CBn_FSR and
CBn_RESUME in this order. Even in case of reported fault where context is
not stalled, the first step, IMO, I see no reason why should be any
different.  I agree that delaying fault clearance can result in FSR.MULTI
being set, but clearning fault before  prevent clients to use SCTLR.HUPCF
on subsequent transactions while they take any debug action. The client
should be reported fault in the same state it occured. Please refer
qcom_smmu_context_fault() for this sequence.

> > > +	arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_FSR, cfi.fsr);
> > > +
> > >   	ret = report_iommu_fault(&smmu_domain->domain, NULL, cfi.iova,
> > >   		cfi.fsynr & ARM_SMMU_CB_FSYNR0_WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
> > >   	if (ret == -ENOSYS && __ratelimit(&rs))
> > >   		arm_smmu_print_context_fault_info(smmu, idx, &cfi);
> > > -	arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_FSR, cfi.fsr);
> > >   	return IRQ_HANDLED;
> > >   }
> > > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> > > index 2dbf3243b5ad2db01e17fb26c26c838942a491be..789c64ff3eb9944c8af37426e005241a8288da20 100644
> > > --- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
> > > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> > > @@ -216,7 +216,6 @@ enum arm_smmu_cbar_type {
> > >   					 ARM_SMMU_CB_FSR_TLBLKF)
> > >   #define ARM_SMMU_CB_FSR_FAULT		(ARM_SMMU_CB_FSR_MULTI |	\
> > > -					 ARM_SMMU_CB_FSR_SS |		\
> > Given writing to FSR.SS doesn't clear this bit but write to CBn_RESUME
> > does, this seems right. This but can be taken as separate patch.
> 
> This change on its own isn't really useful - all that would achieve is that
> instead of constantly re-reporting the FSR.SS "fault", the interrupt goes
> unhandled and the IRQ core ends up disabling it permanently. If anything
> that's arguably worse, since the storm of context fault reports does at
> least give a fairly clear indication of what's gone wrong, rather than
> having to deduce the cause of an "irq n: nobody cared" message entirely by
> code inspection.
> 
Does spec allow or do we see reported fault with just FSR.SS bit. If answer
is no then Keeping FSR_SS would be misleading. Here ARM_SMMU_CB_FSR_FAULT
is used to clear fault bits or check valid faults. Also validity of this
is not based on rest of the change. 

Thanks,
Prakash
 
> > 
> > >   					 ARM_SMMU_CB_FSR_UUT |		\
> > >   					 ARM_SMMU_CB_FSR_EF |		\
> > >   					 ARM_SMMU_CB_FSR_PF |		\
> > > 
> > > -- 
> > > 2.47.1
> > > 
> 

