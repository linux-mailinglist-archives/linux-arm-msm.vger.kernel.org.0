Return-Path: <linux-arm-msm+bounces-35522-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A49529ABE21
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 07:49:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 587A2283A6F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 05:49:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8CF41448C1;
	Wed, 23 Oct 2024 05:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="I8sXDIXe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B058825;
	Wed, 23 Oct 2024 05:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729662552; cv=none; b=VZ3PHaYN9riueDCx9MAe0DC56LHl9yu1k/Te3bdbxn7UJtf8/eXHluVquo3SO6z+agjgxgT+phVcukT3hKdOmUAE71lbaC1wUmdP/wUplLRqe3xHcYbG7pdRybb59Bc+mafKS0n552J0rYfdNt2WE6icRB+6BoOnwjGiH/SDqXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729662552; c=relaxed/simple;
	bh=IrOkKdwgwnuzrdwFl2ugTT/CJ3Mgqiqx6mFH09fEqhA=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=l9vddRAeFs0mx/kzkutwom/0r3fOF7NeY1mWoGbeAmtsEwR1Jvdm2PEIAQMewboA1yz3pM+TTvNq3GzDmguo30gNMvmIC0IoWRw1xYqT14nmSI8jWfMXFTzXEe79bSCebZewrv1+oP+8v/ySCQVJCjX+S+DKpPkSDvFkEZ2NFGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=I8sXDIXe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49MLa1qX029637;
	Wed, 23 Oct 2024 05:49:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9+1DNfDvn2TGnEibmwLTDyqIQvMTt/LxPVTNCzem/0I=; b=I8sXDIXejreScEDE
	nQ+qyyrHzUfUS4mtlz2TFDjYAOUmQrDJpbPrA+dKCXxpZ7pdEy65s6MHkQ+ERaT0
	UU1YSjAJYBBCu6dJXMGmFFo+KeRP75MR8vZxv5YYLGvGASfKOLe4Y0XyWJWiSvzk
	iv/s0lgfn2Eb9tTc3U/+emqwFv62bAVSiKJLYF5xuhcxJBnhXPIyjiZFU3il1k55
	fbx8y8h25x+ardLexTlgbtxvIZBZh6CZOtwFKJn41lCcLP733/gK80Qm7N07RtJ2
	uyPhGIJue7YT9RNIcw8lgwmBf6rvmDXxHY/+YzjHrfsy8D3Elt3eOIUaybyO9zwd
	5BV9gQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em3w10e1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Oct 2024 05:49:01 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49N5n1Tn029613
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Oct 2024 05:49:01 GMT
Received: from [10.239.132.41] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 22 Oct
 2024 22:48:57 -0700
Message-ID: <bc1ab306-903a-4111-a428-8f28d8324207@quicinc.com>
Date: Wed, 23 Oct 2024 13:48:54 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: qcs615: add the APPS SMMU node
From: Qingqing Zhou <quic_qqzhou@quicinc.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <robimarko@gmail.com>, <will@kernel.org>,
        <robin.murphy@arm.com>, <joro@8bytes.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <iommu@lists.linux.dev>
References: <20241015081603.30643-1-quic_qqzhou@quicinc.com>
 <20241015081603.30643-5-quic_qqzhou@quicinc.com>
 <ac5081ce-e2e4-4201-bd7c-eb4ec2cf7e2d@oss.qualcomm.com>
 <ed4209a8-fb37-4354-a717-60dc1b5c29ab@quicinc.com>
In-Reply-To: <ed4209a8-fb37-4354-a717-60dc1b5c29ab@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 8L0WjqWcJitDB143WEK8KmruSMXCMzX8
X-Proofpoint-GUID: 8L0WjqWcJitDB143WEK8KmruSMXCMzX8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 spamscore=0 malwarescore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410230033



在 10/18/2024 2:20 PM, Qingqing Zhou 写道:
> 
> 
> 在 10/18/2024 4:05 AM, Konrad Dybcio 写道:
>> On 15.10.2024 10:16 AM, Qingqing Zhou wrote:
>>> Add the APPS SMMU node for QCS615 platform. Add the dma-ranges
>>> to limit DMA address range to 36bit width to align with system
>>> architecture.
>>>
>>> Signed-off-by: Qingqing Zhou <quic_qqzhou@quicinc.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/qcs615.dtsi | 74 ++++++++++++++++++++++++++++
>>>  1 file changed, 74 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
>>> index 027c5125f36b..fcba83fca7cf 100644
>>> --- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
>>> @@ -379,6 +379,7 @@
>>>  	soc: soc@0 {
>>>  		compatible = "simple-bus";
>>>  		ranges = <0 0 0 0 0x10 0>;
>>> +		dma-ranges = <0 0 0 0 0x10 0>;
>>>  		#address-cells = <2>;
>>>  		#size-cells = <2>;
>>>  
>>> @@ -524,6 +525,79 @@
>>>  			reg = <0x0 0x0c3f0000 0x0 0x400>;
>>>  		};
>>>  
>>> +		apps_smmu: iommu@15000000 {
>>> +			compatible = "qcom,qcs615-smmu-500", "qcom,smmu-500", "arm,mmu-500";
>>> +			reg = <0x0 0x15000000 0x0 0x80000>;
>>> +			#iommu-cells = <2>;
>>> +			#global-interrupts = <1>;
>>> +
>>> +			interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>,
>>> +					<GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>,
>>> +					<GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>,
>>
>> The list seems perfectly sorted, which is suspicious.. if we set
>> i = n - #global-interrupts, interrupt[i] signifies an error in the i-th
>> context bank. If the order is wrong, we'll get bogus reports
> Thanks for the review, the list refers to Qualcomm Interrupts design spec, checking this platform again, the list is right, first line is global interrupt and the others are context interrupts with right order.
Hi Konrad,
Hope above comments explain your question. If no more questions from you, I will post the next version. Thanks.
>>
>> Also, this is not aligned properly ('<' under '<')
> Got it, will update and align the spaces in next version.
>>
>> Konrad
> 
> 


