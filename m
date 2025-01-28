Return-Path: <linux-arm-msm+bounces-46364-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A31A2093D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2025 12:08:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C27991887ECA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2025 11:08:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AFC419B3EE;
	Tue, 28 Jan 2025 11:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ZZFJtr7i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF8EDEED6
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 11:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738062524; cv=none; b=jU2Z4r2Mgy9p4nnsr/wS9CcvzOvplEvyVNgn4Y/NPparj461B6DWCvCg3vvQ2ur+aHUYhxuEUsQOu6L2QV3qS0adVHHHxfwMUWFiQKXvsjXgTNP+DfwuMJmZavX+KKYtkjs+NTL9MVF2uspsRLMRnMLuLoXI6r0XGPRiYANg3W0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738062524; c=relaxed/simple;
	bh=1PAlU4202PMErFrgW0CMZf1LAQcEcfqWASbwbJWtcoA=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b9Zu1eJ0KmKggSEQbifyEYI67UKPa6OvF8Aobsh5p2SNywxHS/vdQfeEId2waQa0FuPCF+YmLXnEKeuNU/8pgXmBK0Tl0KMMuw5BYWVRUMv/Fti6efyqP0rJPKrlAtcUm899RrCB8mi0y3tPahb+sr35wm5iQpcqaHhwnCGRwuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ZZFJtr7i; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50SACkJr025292;
	Tue, 28 Jan 2025 11:08:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HpXhjxy8FK90HGA5mfYSFxDnd1NzEZOUKZXCQxoSaqw=; b=ZZFJtr7iEd+F/tRH
	u2cwgWya6VG51QwP/Q6ZNnkHw/cDMSYCqx8O77VNr7CmKqGJwmUg7VfMB5yEnxHw
	jldVyF12Ggve8pmoavXYNhSI7iq5o7cSu699SLlGDI5in+5jcydGn97txU/Y7Ycn
	GMLMVQU6PVQ+o6jbXL6lTqU7mMAtwnc1WJCKWYQHXd6K3jUAskm8WPqq7zMtlFzY
	O/yx9BxCxIO1Yna5NiRRfWnR/2fs3ep/Vy2C/LdPrAN+YlanTs5ByCnWNwXz05bQ
	Ay7Hl6gAK8p/cxHKBDrvYayQqIST9jHJ51hz+ocoqX8uGwcRK+Le96rlPnzc275E
	OhYAHw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44ew9n84q4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Jan 2025 11:08:17 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50SB8GYq013745
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Jan 2025 11:08:16 GMT
Received: from hu-guptap-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 28 Jan 2025 03:08:12 -0800
Date: Tue, 28 Jan 2025 16:37:59 +0530
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
Message-ID: <Z5i6GQDd5apN+a10@hu-guptap-hyd.qualcomm.com>
References: <20250122-msm-gpu-fault-fixes-next-v3-0-0afa00158521@gmail.com>
 <20250122-msm-gpu-fault-fixes-next-v3-1-0afa00158521@gmail.com>
 <Z5IjsqQ6vTdUXiGt@hu-guptap-hyd.qualcomm.com>
 <CACu1E7H5X2EfY9AG=xceaoZJkbumwnrsU4QvNbxd_A2wgVVOaQ@mail.gmail.com>
 <Z5KXwNPrdirVUn8Z@hu-guptap-hyd.qualcomm.com>
 <CACu1E7GOS+_biN=AuQwYK47ApRPFGygyD+U5X9d_4ReXKrzbfw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACu1E7GOS+_biN=AuQwYK47ApRPFGygyD+U5X9d_4ReXKrzbfw@mail.gmail.com>
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: O5OzzwV6RozAHM5MY_D8K1NnFZrtlya_
X-Proofpoint-ORIG-GUID: O5OzzwV6RozAHM5MY_D8K1NnFZrtlya_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_04,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 mlxscore=0 priorityscore=1501
 mlxlogscore=617 adultscore=0 malwarescore=0 phishscore=0 suspectscore=0
 impostorscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2501280086

On Thu, Jan 23, 2025 at 03:14:16PM -0500, Connor Abbott wrote:
> On Thu, Jan 23, 2025 at 2:26 PM Prakash Gupta <quic_guptap@quicinc.com> wrote:
> >
> > On Thu, Jan 23, 2025 at 09:00:17AM -0500, Connor Abbott wrote:
> > > On Thu, Jan 23, 2025 at 6:10 AM Prakash Gupta <quic_guptap@quicinc.com> wrote:
> > > >
> > > > On Wed, Jan 22, 2025 at 03:00:58PM -0500, Connor Abbott wrote:
> > > > The context would remain stalled till we write to CBn_RESUME. Which is done
> > > > in qcom_adreno_smmu_resume_translation(). For a stalled context further
> > > > transactions are not processed and we shouldn't see further faults and
> > > > or fault inerrupts. Do you observe faults with stalled context?
> > >
> > > Yes. I've observed that on MMU-500 writing RESUME before the interrupt
> > > has been cleared doesn't clear SS. This happened with v2 in the case
> > > where there was already a devcoredump and drm/msm called
> > > qcom_adreno_smmu_resume_translation() immediately from its fault
> > > handler, and we'd get a storm of unhandled interrupts until it was
> > > disabled. Given that the architecture spec says we're supposed to
> > > clear the interrupt first this may have been an attempt to "help"
> > > developers.
> > >
> >
> > Just to clarify, present sequence is:
> > 1. context fault with stall enable. FSR.SS set.
> > 2. Report fault to client
> > 3. resume/terminate stalled transaction
> > 4. clear FSR
> >
> > At what point when you try #2->#3->#4 or #4->#2->#3 sequence, is FSR.SS
> > cleared and interrupt storm is observed.
> 
> With #2->#3->#4 FSR.SS is *not* cleared and there is a subsequent
> interrupt storm with only FSR.SS asserted. With #4->#2->#3 there is no
> interrupt storm. From this we conclude that MMU-500 does not clear
> FSR.SS unless #4 happens before #3.
> 
Thanks Connor for clarification. I get your point now. I think it's
expected interrupt storm with #2->#3->#4 sequence is expected.  With
CONFIG_ARM_SMMU_QCOM_DEBUG enabled, context fault follows the sequence of
#1->#2->#4->#3, which is spec recommended.

so, common fault handler can be modified to follow the same sequence, but I
have concern regarding clearing FSR before reporting fault to client.
qcom_adreno_smmu_get_fault_info() is an example I gave but other client
handler may have similar expecation of fault register not changed before
client fault handler is called.

> > The way CFIE disable is helping
> > with current patch indicates write FSR is unstalling context and subsequent
> > transactions are faulted.
> 
> No, it does not indicate that. The interrupt storm happens even when
> there is exactly one context fault, and when the interrupt storm
> happens *only* FSR.SS is asserted. I've verified this with debug
> prints. Once more, MMU-500 will assert an interrupt when only FSR.SS
> is asserted. This has nothing to do with subsequent transactions.
> 
> > Do you stop getting interrupt storm after write
> > RESUME.
> 
> Yes, as long as the write to RESUME happens after all other bits in
> FSR are cleared.
> 
> > If you can mention your SCTLR configuration and FSR state in test
> > sequence, it would be clearer.
> 
> SCTLR has both HUPCF and CFCFG enabled.
> 
> >
> > An aside, If reducing delay between FSR and RESUME write helps then both
> > can be done as part of qcom_adreno_smmu_resume_translation(). This will
> > follow spec recommendation and also make sure fault registers are not
> > cleared before reporting fault to client.
I think this sequence should address the issue you are observing.

> >
> > Thanks,
> > Prakash

