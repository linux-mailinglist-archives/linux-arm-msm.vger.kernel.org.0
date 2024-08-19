Return-Path: <linux-arm-msm+bounces-29018-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8518B957718
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 00:05:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 05E241F21A42
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Aug 2024 22:05:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EBDA1D54E0;
	Mon, 19 Aug 2024 22:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="omWIeMpK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD6518991C;
	Mon, 19 Aug 2024 22:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724105104; cv=none; b=ou1ZBxMDvKz7Dqn/xwWOUEQ/fN+l3w2+4X1BXBDlBeqx8yKAb9M0CqdURIMuYVx8xdvdFcblk0xPeh8gmflgF+HZPxLfyo+hJvP+D0/2xihYkFbd/3xvct7M6mG0dfEJcsqOwft7EOSw6tLMznEsk9J2wX6OZgUObUxMiDIWIoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724105104; c=relaxed/simple;
	bh=sAO3TUHgVk99Kw9RCvCoijE9MKOG4GkkxLNUBJJOGr4=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L9YkLUlDmGZUloRfyXZWtJzqpLjs5jNmvoUO283PWPwgvxHY9RnuGRqiW2qMZIc72uuNY16N4f60SQYxrByE+9gr9lDla5l7p7J2FS69EW/cUbXxcDSwdKQgNvTGg+ci3ORCLk5S5bo/xhdjMcRRlXmLODr/ou7AEmPPMPya8cQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=omWIeMpK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47JBB38O025706;
	Mon, 19 Aug 2024 22:04:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1Pdl09RIpjSpgpUzeTyvHQSd
	kABHf3jk9ZT3rNx96zc=; b=omWIeMpKE0meovzZGitbpTCmprNlPA9orsKDCkam
	9VpuHHTx0zmVBr5bg+QxKFowsjWSq/IZ1ctz+s3XG3GcsHTNcZlnqR0QVzdPt/q/
	6CSPnCfoBk1gHk9RFioVojHZ2JV1n3OxHHSedr3uPRZJQcKtIMfTFrrcj9khSJnZ
	SmTTD1fSJzz3mNL0IGponQY0p0n3C9s2UZsvPeWTdhs+yjywoO07sehgnI9ngnsP
	aF40+Vfz+25TbhqJHFGemJID9FyguKIbt1CFA2VARCO9oC6jkCrgWH15jAwu5JIS
	U6f1HuEkhNnH93z/HYkxhrfI5A13yi3CEEYsfEXr/faJLQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 412n585hux-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Aug 2024 22:04:43 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47JM4hsp019820
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Aug 2024 22:04:43 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 19 Aug 2024 15:04:42 -0700
Date: Mon, 19 Aug 2024 15:04:41 -0700
From: Bjorn Andersson <quic_bjorande@quicinc.com>
To: Marc Gonzalez <mgonzalez@freebox.fr>
CC: Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Rob
 Clark <robdclark@gmail.com>, Will Deacon <will@kernel.org>,
        Joerg Roedel
	<joro@8bytes.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, <iommu@lists.linux.dev>,
        <linux-arm-msm@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Arnaud Vrac
	<avrac@freebox.fr>,
        Pierre-Hugues Husson <phhusson@freebox.fr>,
        Marijn
 Suijten <marijn.suijten@somainline.org>,
        Caleb Connolly
	<caleb.connolly@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: arm-smmu: Add
 qcom,last-ctx-bank-reserved
Message-ID: <ZsPBeRTqE9o253Gw@hu-bjorande-lv.qualcomm.com>
References: <20240814-smmu-v1-0-3d6c27027d5b@freebox.fr>
 <20240814-smmu-v1-1-3d6c27027d5b@freebox.fr>
 <20240818152515.GA104481-robh@kernel.org>
 <30489eee-075b-461b-ab43-c8807d667630@freebox.fr>
 <17893776-9666-4bbe-b5fc-c3fe977d0337@arm.com>
 <67f9a762-6d14-4557-b1f6-22aabb33f927@freebox.fr>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <67f9a762-6d14-4557-b1f6-22aabb33f927@freebox.fr>
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: zKRsNtyBD-iSNi9VaciL5bMiQXyEBl-I
X-Proofpoint-ORIG-GUID: zKRsNtyBD-iSNi9VaciL5bMiQXyEBl-I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-19_16,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1011 spamscore=0
 mlxlogscore=793 mlxscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408190146

On Mon, Aug 19, 2024 at 05:02:16PM +0200, Marc Gonzalez wrote:
> On 19/08/2024 14:57, Robin Murphy wrote:
> 
> > Luckily, in this case it seems straightforward enough to be able to see 
> > that if we have a "qcom,msm8996-smmu-v2" with 13 context banks then we 
> > should just treat it as if it has 12 - it's also notable that it only 
> > reports NUMSMRG=12, so we couldn't use more than that many S1 context 
> > banks at once anyway.
> 
> This is what the hypervisor reports:
> 
> [    2.550974] arm-smmu 5100000.iommu: probing hardware configuration...
> [    2.557309] arm-smmu 5100000.iommu: SMMUv2 with:
> [    2.563815] arm-smmu 5100000.iommu:  stage 1 translation
> [    2.568494] arm-smmu 5100000.iommu:  address translation ops
> [    2.573791] arm-smmu 5100000.iommu:  non-coherent table walk
> [    2.579434] arm-smmu 5100000.iommu:  (IDR0.CTTW overridden by FW configuration)
> [    2.585088] arm-smmu 5100000.iommu:  stream matching with 12 register groups
> [    2.592132] arm-smmu 5100000.iommu:  13 context banks (0 stage-2 only)
> [    2.619316] arm-smmu 5100000.iommu:  Supported page sizes: 0x63315000
> [    2.626225] arm-smmu 5100000.iommu:  Stage-1: 36-bit VA -> 36-bit IPA
> [    2.632645] arm-smmu 5100000.iommu:  preserved 0 boot mappings
> 
> 
> smmu->num_mapping_groups = 12

Ignore num_mapping_groups, they are used to define which streams should
be mapped to which context bank. But there's no relationship between
these numbers.

> smmu->num_context_banks  = 13
> 
> 
> Are you saying that
> 
> 	smmu->num_context_banks > smmu->num_mapping_groups
> 
> does not make sense?
> 
> 
> Would a well-placed
> 
> 	if (smmu->num_context_banks > smmu->num_mapping_groups)
> 		smmu->num_context_banks = smmu->num_mapping_groups;
> 
> be a proper work-around?

No, something like this would apply your quirk to other targets (and
specifically it would be wrong, per above).

> 
> (Probably in qcom_smmu_cfg_probe() so as to not interfere with other platforms.)
> 
> 
> Maybe to limit the side effects even more:
> 
> 	if (of_device_is_compatible(smmu->dev->of_node, "qcom,msm8998-smmu-v2") &&
> 		smmu->num_context_banks > smmu->num_mapping_groups))
> 		smmu->num_context_banks = smmu->num_mapping_groups;

If we don't want to introduce a more specific compatible for this SMMU
instance, then let's add this to qcom_smmu_cfg_probe():

	/* MSM8998 LPASS SMMU reports 13 context banks, but only 12 are accessible */
 	if (of_device_is_compatible(smmu->dev->of_node, "qcom,msm8998-smmu-v2") && smmu->num_context_banks == 13)
		smmu->num_context_banks = 12;


Regards,
Bjorn

> 
> 
> Neither work-around would require changing the binding.
> 
> Is either work-around acceptable, Robin?
> 
> Regards
> 
> 

