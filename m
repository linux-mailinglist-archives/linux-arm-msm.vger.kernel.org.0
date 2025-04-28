Return-Path: <linux-arm-msm+bounces-55846-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 55044A9E5DA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 03:37:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7FB31176228
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 01:37:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB7A22BD04;
	Mon, 28 Apr 2025 01:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BwhaYSeQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B028BF8;
	Mon, 28 Apr 2025 01:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745804261; cv=none; b=A/O3jtn6QE84A355/q4Z2mJYMHv16zN8BYYIqcOpiNZVGQhFB5GgygHKAIsgTlRoKL1UhULKZunJblkk/e+r3q+WmfXyHr45oJqimhIaQISGVwJPJbnpzHy7Uvm6cqDrNrGfB6vvVQAhjgloA1FyB7WKW/16qprNTnc13tG1j80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745804261; c=relaxed/simple;
	bh=avBvMnvDyZ3uriiPvQYLBVnwT4Ez2HaMIV2JJmJDuDI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ucu1PWsYy3xQUW2ZHRRFe5QBX4viuh44csRt1bRvKeDmrXLESLx/Y98BJEPAFgC07xkiAd8+ugE4W55mgh+/To2VIAaBHupNzWpOE269HCCi6rxJ72ZGVe5AVfuETuGegFRyt2qV+78AQdDSbMYiG/wySxHSgIewsUCPZqVat14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=BwhaYSeQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53RBNPkP012247;
	Mon, 28 Apr 2025 01:37:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HpIlMV2NZd0L0ibMOZPde5o3ecyelVHg/C1IW6CF5wA=; b=BwhaYSeQlpReF3eL
	RQvLs9JdAFBWu3eQhnDN1zgCre8wgKDs/S0HH2NDXdv6TNw2NrovD//iOO4xtI23
	FD0Hyc32V92GyqnubwNPBz2/GCkwm/SwZmPW8y69uW+8RZaZWPx8H5yvKqgWLesq
	qyhiwXY8H0gpucQ73T9tlJpNRXy4kVoU6K+jTWSNOs9ckVGBmLA0BBjyRids55A5
	zEiZ1o7MqcidDJca6GhBySfgkTnHZ1/QIWsfUN+B2KjxAQ1hM/KnFouETZlfsOui
	WEIL9012p8BeAvLPBNESk+fIm9jUKtwH7Oqu2LLeA+qvUlyiVuNIvWK7bwCJyJJw
	w/YJug==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468r8hn63c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 01:37:37 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53S1bavm013543
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 01:37:36 GMT
Received: from [10.231.195.67] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 27 Apr
 2025 18:37:34 -0700
Message-ID: <3d162e4f-a15f-4943-8639-ac8c47a77b93@quicinc.com>
Date: Mon, 28 Apr 2025 09:37:31 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] bus: mhi: host: Allocate entire MHI control config once
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Manivannan Sadhasivam
	<manivannan.sadhasivam@linaro.org>
CC: <quic_carlv@quicinc.com>, <quic_thanson@quicinc.com>,
        <mhi@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
        "Pranjal Ramajor Asha
 Kanojiya" <quic_pkanojiy@quicinc.com>
References: <20250328165913.3380933-1-jeff.hugo@oss.qualcomm.com>
 <pgr6u3onrlf4mvldqn7cxlqkh3krduv542jqgjcy5c535ys6hm@dujbvax4b56s>
 <07cc4ee2-4a13-495c-bc4d-8837d6b54414@oss.qualcomm.com>
Content-Language: en-US
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <07cc4ee2-4a13-495c-bc4d-8837d6b54414@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: gJ4jyK5Wx8LB_U4d2D0VPGyjGAeDT6WB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDAxMiBTYWx0ZWRfX6AUb0n0ExHBb wa5kYoaMNOOsgSrrTYj6uhLVUUCp7fUqhp1wAn/2fIDiIRHY0CrLzmXCn3dvKYw0yNf/b4n16a6 7CEECxKi1Yyk2fXhG+8doRYfGyVtOERhwaN7UVKc08kZ850I1YD6QMQ2VoPoEnEtpctHW5smLrd
 bo2AUkqsIr5ZpvBESjyTjXQffQ7su0Y713qItcfYLwVtLUalNYSE2HBitbe+MknQRPxab3ixMEZ XlIpXZzMSDsuy+Pn+lKX0ZQUGjic5srmT8hLYETvW6btNi5PHvCpOoTfz43mkFgcjXsq9C9THbd qDkPQMJsdBnGiQE8dwudcjRNkKvUodQdeEuz+jz+Q6XFK9XDKjIbAxdjIEl+VeTScHVpbIhhEpv
 A/Sq5kc0gAyaEPieXBgwV2xquUNy0Z4wov1Re7GtvILBM48wCEGN9ZIB8NTi/xYh20aWiCu4
X-Authority-Analysis: v=2.4 cv=cfzSrmDM c=1 sm=1 tr=0 ts=680edbe1 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=L4R8Of4Wrm5XspGrm_IA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: gJ4jyK5Wx8LB_U4d2D0VPGyjGAeDT6WB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=999 adultscore=0
 clxscore=1011 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504280012



On 4/8/2025 10:56 PM, Jeff Hugo wrote:
> On 4/8/2025 1:01 AM, Manivannan Sadhasivam wrote:
>> On Fri, Mar 28, 2025 at 10:59:13AM -0600, Jeff Hugo wrote:
>>> From: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
>>>
>>> MHI control configurations such as channel context, event context, command
>>> context and rings, are currently allocated individually. During MHI
>>> initialization MHI bus driver needs to configure the address space in
>>> which this control configuration resides. Since different component of the
>>> config is being allocated separately, only logical solution is to give the
>>> entire RAM address space, as they could be anywhere.
>>>
>>
>> This is fine...
> 
> We tripped over this when experimenting with an automotive market product. The FW for that
> product had a rather strict interpretation of the spec, which we confirmed with the spec
> owner.
> 
> In the specific FW implementation, the device maps the entire MHI space of shared
> structures in a single ATU entry. The device cannot map an entire 64-bit address space,
> and it expects all of the shared structures in a single compact range.
> 
> This applies to the control structures, not the data buffers per the device implementation.
> 
> This restriction seems backed by the spec.  I can't find a reason why the device is
> invalid, if limited.  I don't think this should break anything, but more on that below.
> 
>>
>>> As per MHI specification the MHI control configuration address space should
>>> not be more them 4GB.
>>>
>>
>> Where exactly this limitation is specified in the spec? The spec supports full
>> 64 bit address space for the MHI control/data structures. But due to the device
>> DMA limitations, MHI controller drivers often use 32 bit address space. But
>> that's not a spec limitation.
> 
> Its not the clearest thing, sadly.
> 
> Document 80-NF223-11 Rev AB "MHI spec v1.2" Section 6.2 "MHI Registers" table 6-19 (page
> 106) -
> 
> Describing MHICTRLLIMIT: "The most significant 32 bits of MHICTRLBASE and MHICTRLLIMIT
> registers must be equal."
> 
> This means we have a 4GB range (32-bit) to play with in a 64-bit address space.  If the
> upper 32-bits of the 64-bit address for both the base and the limit must be the same, then
> the range of addresses from the base to the limit can only vary the lower 32-bits.
> 
> Invalid:
> BASE: 0x0
> LIMIT: 0xffffffff_ffffffff
> 
> Valid:
> BASE: 0x0f_00000000
> LIMIT: 0x0f_ffffffff

as an MHI controller driver, ath11k is doing

		mhi_ctrl->iova_start = 0;
		mhi_ctrl->iova_stop = ab_pci->dma_mask;

where ab_pci->dma_mask is defined as

		ab_pci->dma_mask = DMA_BIT_MASK(36)

clearly this does not align with the 32bit requirement above, however there is no issue hit.

What happens if the most significant 32 bits of MHICTRLBASE and MHICTRLLIMIT is not equal?
SYS_ERR or RDDM?


> 
>>> Since the current implementation is in violation of MHI specification.
> 
> For example mhi_init_dev_ctxt()
> 
> We allocate the chan_ctxt with dma_alloc_coherent() as an individual allocation.  In the
> case of AIC100, the device can access the full 64-bit address space, but the DMA engine is
> limited to a 32-bit transfer size.  The chan_ctxt probably won't be larger than 4GB, so
> the size is rather irrelevant.  Can be allocated anywhere.  Lets say that it gets put in
> the lower 32-bit address space - 0x0_XXXXXXXX
> 
> Then a little bit later we allocate er_ctxt with a different dma_alloc_coherent()
> instance.  Being a unique allocation, it is not tied to the chan_ctxt and can exist
> anywhere.  Lets assume that it gets put somewhere in the non-lower 32-bits - 0x1000_XXXXXXXX
> 
> Now we have a problem because we cannot describe a single range covering both of these
> allocations via MHICTRLBASE/MHICTRLLIMIT where the upper 32-bits of both registers is the
> same.
> 
>>> Allocate a single giant DMA buffer for MHI control configurations and
>>> limit the configuration address space to that buffer.
>>>
>>
>> I don't think this could work for all devices. For instance, some ath11k devices
>> use a fixed reserved region in host address space for MHICTRL/BASE.
> 
> Why would we be unable to allocate all of the control structures in a single allocation
> out of that reserved region?  Is it larger than 4GB in size?
> 
> -Jeff
> 
> 


