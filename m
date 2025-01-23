Return-Path: <linux-arm-msm+bounces-45948-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 284F8A1A2AD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 12:11:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 317E9188F17B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 11:11:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6577120E035;
	Thu, 23 Jan 2025 11:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="icwXhJWv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE9A920E31C
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2025 11:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737630673; cv=none; b=UrFy6alCDM1Zc/aeAIX1usfX62SiBBGpVRhTldEQoQGbABlH2q2hX53+qOozqy85MP12kUBmAb6MTJ/8ulNsnAEBcnxfMFlVxOs6jjIulwqKeyGRIqy4UPICuvDg0DPsk2oXuTEJ9YtdUf5r67fsbFy8Miw2LuucMB4M5XWUezw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737630673; c=relaxed/simple;
	bh=GPYd+SOXicBgtHlFCS4lxEfXfYcfwoRlrkG4Pk5aLyU=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UzX+FJWkere4FAnFEhV7N7FmFvFjPhkkYwA/gn+Plx2PqHbSeuE9oYCjXBcS17RufSk6SoMO7z7ZWcrI33vlGpoUCFrZrCSrvzTPqqOD3m4fpmPzTFJfLnhqf8oLuARuN5ZgZHT8x7YuZdpx3OETiFjI4m+y9s49Ko/0rmgWGjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=icwXhJWv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50NB6mWx020763;
	Thu, 23 Jan 2025 11:10:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UT3j3qSIkXMcC9Q30eMDBmk8
	xJmqOafhvDidnYdAr8A=; b=icwXhJWvNm7O470+3AF2Wgfng+0hkasev+8czbvf
	fJ0F3KtLYlcNbwh7dFJ5Y9O3Idnpgk0Qw6Tb8C5S9CdhJ9xuQiDeOnYKOp1eDmus
	L55BPa5Owe5wG87ORijBdUfY/mOnOsjEjdOlOrvIbUOtuSBArxlYg7+dvDbEssho
	usUxhe/bD9PaB4Ce3Vdkug3o0mKwWEljoBy0h3sYkalUepIKk3d3GDvDQSn9SWBv
	AqCrwC61MxxMy/0ya+NePh7Hqx8MG2FI6IR3jKrCv51L7J6ipSYbHEvM7SpKfZgG
	QYElZ7SJeK8FIuqCN7GzwMjwu9UWAlGExIydef2XcB4npQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44bmm100a1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jan 2025 11:10:51 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50NBAoS3025420
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jan 2025 11:10:50 GMT
Received: from hu-guptap-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 23 Jan 2025 03:10:46 -0800
Date: Thu, 23 Jan 2025 16:40:42 +0530
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
Message-ID: <Z5IjsqQ6vTdUXiGt@hu-guptap-hyd.qualcomm.com>
References: <20250122-msm-gpu-fault-fixes-next-v3-0-0afa00158521@gmail.com>
 <20250122-msm-gpu-fault-fixes-next-v3-1-0afa00158521@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250122-msm-gpu-fault-fixes-next-v3-1-0afa00158521@gmail.com>
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Lt27H7KZofmV_4BR5CfTaMMx6Gnw6lyi
X-Proofpoint-GUID: Lt27H7KZofmV_4BR5CfTaMMx6Gnw6lyi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-23_04,2025-01-22_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1011 mlxlogscore=426 impostorscore=0 spamscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501230084

On Wed, Jan 22, 2025 at 03:00:58PM -0500, Connor Abbott wrote:
 
> @@ -125,12 +125,25 @@ static void qcom_adreno_smmu_resume_translation(const void *cookie, bool termina
>  	struct arm_smmu_domain *smmu_domain = (void *)cookie;
>  	struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
>  	struct arm_smmu_device *smmu = smmu_domain->smmu;
> -	u32 reg = 0;
> +	u32 reg = 0, sctlr;
> +	unsigned long flags;
>  
>  	if (terminate)
>  		reg |= ARM_SMMU_RESUME_TERMINATE;
>  
> +	spin_lock_irqsave(&smmu_domain->cb_lock, flags);
> +
>  	arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_RESUME, reg);
> +
At this point further transaction can be processed but SCTLR.CFIE is
cleared so subequent context fault will not generate interrupt till
SCTLR.CFIE is set.

> +	/*
> +	 * Re-enable interrupts after they were disabled by
> +	 * arm_smmu_context_fault().
> +	 */
> +	sctlr = arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_SCTLR);
> +	sctlr |= ARM_SMMU_SCTLR_CFIE;
> +	arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_SCTLR, sctlr);
> +
> +	spin_unlock_irqrestore(&smmu_domain->cb_lock, flags);
>  }
>  
>  static void qcom_adreno_smmu_set_prr_bit(const void *cookie, bool set)
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> index 79afc92e1d8b984dd35c469a3f283ad0c78f3d26..ca1ff59015a63912f0f9c5256452b2b2efa928f1 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> @@ -463,13 +463,52 @@ static irqreturn_t arm_smmu_context_fault(int irq, void *dev)
>  	if (!(cfi.fsr & ARM_SMMU_CB_FSR_FAULT))
>  		return IRQ_NONE;
>  
> +	/*
> +	 * On some implementations FSR.SS asserts a context fault
> +	 * interrupt. We do not want this behavior, because resolving the
> +	 * original context fault typically requires operations that cannot be
> +	 * performed in IRQ context but leaving the stall unacknowledged will
> +	 * immediately lead to another spurious interrupt as FSR.SS is still
> +	 * set. Work around this by disabling interrupts for this context bank.
> +	 * It's expected that interrupts are re-enabled after resuming the
> +	 * translation.
> +	 *
> +	 * We have to do this before report_iommu_fault() so that we don't
> +	 * leave interrupts disabled in case the downstream user decides the
> +	 * fault can be resolved inside its fault handler.
> +	 *
> +	 * There is a possible race if there are multiple context banks sharing
> +	 * the same interrupt and both signal an interrupt in between writing
> +	 * RESUME and SCTLR. We could disable interrupts here before we
> +	 * re-enable them in the resume handler, leaving interrupts enabled.
> +	 * Lock the write to serialize it with the resume handler.
> +	 */
> +	if (cfi.fsr & ARM_SMMU_CB_FSR_SS) {
> +		u32 val;
> +
> +		spin_lock(&smmu_domain->cb_lock);
> +		val = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_SCTLR);
> +		val &= ~ARM_SMMU_SCTLR_CFIE;
> +		arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_SCTLR, val);
> +		spin_unlock(&smmu_domain->cb_lock);
> +	}
> +
> +	/*
> +	 * The SMMUv2 architecture specification says that if stall-on-fault is
> +	 * enabled the correct sequence is to write to SMMU_CBn_FSR to clear
> +	 * the fault and then write to SMMU_CBn_RESUME. Clear the interrupt
> +	 * first before running the user's fault handler to make sure we follow
> +	 * this sequence. It should be ok if there is another fault in the
> +	 * meantime because we have already read the fault info.
> +	 */
The context would remain stalled till we write to CBn_RESUME. Which is done
in qcom_adreno_smmu_resume_translation(). For a stalled context further
transactions are not processed and we shouldn't see further faults and
or fault inerrupts. Do you observe faults with stalled context?

> +	arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_FSR, cfi.fsr);
> +
>  	ret = report_iommu_fault(&smmu_domain->domain, NULL, cfi.iova,
>  		cfi.fsynr & ARM_SMMU_CB_FSYNR0_WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
>  
>  	if (ret == -ENOSYS && __ratelimit(&rs))
>  		arm_smmu_print_context_fault_info(smmu, idx, &cfi);
>  
> -	arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_FSR, cfi.fsr);
>  	return IRQ_HANDLED;
>  }
>  
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> index 2dbf3243b5ad2db01e17fb26c26c838942a491be..789c64ff3eb9944c8af37426e005241a8288da20 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> @@ -216,7 +216,6 @@ enum arm_smmu_cbar_type {
>  					 ARM_SMMU_CB_FSR_TLBLKF)
>  
>  #define ARM_SMMU_CB_FSR_FAULT		(ARM_SMMU_CB_FSR_MULTI |	\
> -					 ARM_SMMU_CB_FSR_SS |		\
Given writing to FSR.SS doesn't clear this bit but write to CBn_RESUME
does, this seems right. This but can be taken as separate patch.

>  					 ARM_SMMU_CB_FSR_UUT |		\
>  					 ARM_SMMU_CB_FSR_EF |		\
>  					 ARM_SMMU_CB_FSR_PF |		\
> 
> -- 
> 2.47.1
> 

