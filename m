Return-Path: <linux-arm-msm+bounces-34909-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 34BE59A38ED
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 10:43:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E4795282130
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 08:43:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF28418FDDF;
	Fri, 18 Oct 2024 08:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="iJy7JzdG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BBE018EFCD;
	Fri, 18 Oct 2024 08:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729240975; cv=none; b=Xp+28VqiEL5RphhPoJimmiFrc6dIObmyLS27qMP/DYQbWu0PFjkzuao4VpgKCMGB3Px+zdsxUmhzJiO/R+sRwPlV0odvmVTGxIDWbTS0Tpo4Pf2WCnaDzZlgYaCPp0nbDUI3/yrhilA3jYNqpFWyaRPjO6Mj6SrWChjyWZPpjMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729240975; c=relaxed/simple;
	bh=BdMBaQxYzDCh9oXXcvEW+MhoR9zeas/rRDhUK7erWFQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=GORuWDRFYzvcZ7tBhK7tbdeuR1GsFR2lzGMwOvn7lCyZjkypRB/CTc0UHUP+77xubbXHNIAw8nkTRPWOiXy7XJrf9aPqinjwx/ziEbGryWXn8e7wYhUr5C/b937drQwqyOmRT7QOtxSSRf/T3gVftyAdZBZmmQUdGaqJJcyLa0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=iJy7JzdG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49I8JqaY004780;
	Fri, 18 Oct 2024 08:42:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LUdS08Y80LEpjHk98+eNL2cvVZW7E88UWfB0dPfndeY=; b=iJy7JzdGtzQAVdPf
	xBxdaAwkAIrgWgrDlD8bzZzsl5fEuElWPLyb7ztxz+bbjk1GCpYhpq/BweKuTgcy
	QeiiwkTfgWxomDjZFlOHUyr/DDAnUpphxrBorqQMcm6owLsq1M1GvDIYzGJfXhx6
	L+n9ecthIyAQP4v+yCw1gjkjsgcCzi8axTERjK8a5kzVdaFfG0FOG29/9EDq63+o
	+SdILe3jPYfd6bx2OpnOc3KXjFv35qe5pNW3fRLwL2E1q8PSY2h0piruZgAD/02J
	OGIMPxCxC3hErXyDTOAD+hMdps9HTJUv7u/yAn677Dz5vTf394G8OTIHu0yDNWnX
	nzhfQw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42ajm5dfwr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 08:42:41 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49I8ge3n030109
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 08:42:40 GMT
Received: from [10.239.133.49] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 18 Oct
 2024 01:42:36 -0700
Message-ID: <5dcce78a-d7e5-4a61-a165-05b9efe11052@quicinc.com>
Date: Fri, 18 Oct 2024 16:42:33 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] coresight: core: Add device name support
To: Mike Leach <mike.leach@linaro.org>
CC: Suzuki K Poulose <suzuki.poulose@arm.com>,
        James Clark
	<james.clark@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexander Shishkin
	<alexander.shishkin@linux.intel.com>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>,
        "Tingwei
 Zhang" <quic_tingweiz@quicinc.com>,
        Yuanfang Zhang
	<quic_yuanfang@quicinc.com>,
        Tao Zhang <quic_taozha@quicinc.com>,
        songchai
	<quic_songchai@quicinc.com>,
        Jie Gan <quic_jiegan@quicinc.com>
References: <20240703122340.26864-1-quic_jinlmao@quicinc.com>
 <CAJ9a7VhwD6kFHPTgrfs+7fNx4nXZPqXTLK0ObmJM3A6mQfmuyQ@mail.gmail.com>
Content-Language: en-US
From: Jinlong Mao <quic_jinlmao@quicinc.com>
In-Reply-To: <CAJ9a7VhwD6kFHPTgrfs+7fNx4nXZPqXTLK0ObmJM3A6mQfmuyQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Qpb_kxROQKkP6KfY8rf_PM-C7Q6Wcuao
X-Proofpoint-ORIG-GUID: Qpb_kxROQKkP6KfY8rf_PM-C7Q6Wcuao
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 mlxscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 suspectscore=0 clxscore=1015 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410180055



On 2024/7/31 23:15, Mike Leach wrote:
> Hi,
> 
> 1) As per Krzysztof comment - use the standard "label" property
> 
> 2) Do not use the label string as the node name - there is no
> guarantee of uniqueness which will cause issues. Please add the label
> as a sysfs file to the standard node.
> This uses the existing standard names, allowing any scripting based on
> this to continue to work, and will not cause issues with uniqueness
> 
> e.g.
> This will allow :
> 
> cat cti_cpu0/label
> 
> to extract the additional hardware context information that you need.
> 
> Thanks
> 
> Mike

Hi Mike,

I tried to get the label in the driver code. But I don't find any
function for it. Do you know the function to get the label of the device
tree node ?

label: node_name@node_address

Thanks
Jinlong Mao

> 
> 
> On Wed, 3 Jul 2024 at 13:24, Mao Jinlong <quic_jinlmao@quicinc.com> wrote:
>>
>> With current design, the name of the non-cpu bounded coresight
>> component is the device type with the number. And with 'ls' command
>> we can get the register address of the component. But from these
>> information, we can't know what the HW or system the component belongs
>> to. Add device-name in DT to support it.
>>
>> cti_sys0 -> ../../../devices/platform/soc@0/138f0000.cti/cti_sys0
>> cti_sys1 -> ../../../devices/platform/soc@0/13900000.cti/cti_sys1
>> tpdm0 -> ../../../devices/platform/soc@0/10b0d000.tpdm/tpdm0
>> tpdm1 -> ../../../devices/platform/soc@0/10c28000.tpdm/tpdm1
>> tpdm2 -> ../../../devices/platform/soc@0/10c29000.tpdm/tpdm2
>>
>> Change since V3:
>> 1. Change device-name to arm,cs-dev-name.
>> 2. Add arm,cs-dev-name to only CTI and sources' dt-binding.
>>
>> Change since V2:
>> 1. Fix the error in coresight core.
>> drivers/hwtracing/coresight/coresight-core.c:1775:7: error: assigning to 'char *' from 'const char *' discards qualifiers
>>
>> 2. Fix the warning when run dtbinding check.
>> Documentation/devicetree/bindings/arm/arm,coresight-cpu-debug.yaml: device-name: missing type definition
>>
>> Change since V1:
>> 1. Change coresight-name to device name.
>> 2. Add the device-name in coresight dt bindings.
>>
>>
>> Mao Jinlong (2):
>>    coresight: core: Add device name support
>>    dt-bindings: arm: Add device-name in the coresight components
>>
>>   .../bindings/arm/arm,coresight-catu.yaml      |  6 +++
>>   .../bindings/arm/arm,coresight-cpu-debug.yaml |  6 +++
>>   .../bindings/arm/arm,coresight-cti.yaml       |  6 +++
>>   .../arm/arm,coresight-dummy-sink.yaml         |  6 +++
>>   .../arm/arm,coresight-dummy-source.yaml       |  6 +++
>>   .../arm/arm,coresight-dynamic-funnel.yaml     |  6 +++
>>   .../arm/arm,coresight-dynamic-replicator.yaml |  6 +++
>>   .../bindings/arm/arm,coresight-etb10.yaml     |  6 +++
>>   .../bindings/arm/arm,coresight-etm.yaml       |  6 +++
>>   .../arm/arm,coresight-static-funnel.yaml      |  6 +++
>>   .../arm/arm,coresight-static-replicator.yaml  |  6 +++
>>   .../bindings/arm/arm,coresight-stm.yaml       |  6 +++
>>   .../bindings/arm/arm,coresight-tmc.yaml       |  6 +++
>>   .../bindings/arm/arm,coresight-tpiu.yaml      |  6 +++
>>   .../bindings/arm/qcom,coresight-tpda.yaml     |  6 +++
>>   .../bindings/arm/qcom,coresight-tpdm.yaml     |  6 +++
>>   drivers/hwtracing/coresight/coresight-core.c  | 37 ++++++++++---------
>>   .../hwtracing/coresight/coresight-platform.c  | 31 ++++++++++++++++
>>   include/linux/coresight.h                     |  3 +-
>>   19 files changed, 149 insertions(+), 18 deletions(-)
>>
>> Mao Jinlong (2):
>>    dt-bindings: arm: Add device-name in the coresight components
>>    coresight: core: Add device name support
>>
>>   .../bindings/arm/arm,coresight-cti.yaml       |  6 +++
>>   .../arm/arm,coresight-dummy-source.yaml       |  6 +++
>>   .../bindings/arm/arm,coresight-stm.yaml       |  6 +++
>>   .../bindings/arm/qcom,coresight-tpdm.yaml     |  6 +++
>>   drivers/hwtracing/coresight/coresight-core.c  | 37 ++++++++++---------
>>   .../hwtracing/coresight/coresight-platform.c  | 30 +++++++++++++++
>>   include/linux/coresight.h                     |  3 +-
>>   7 files changed, 76 insertions(+), 18 deletions(-)
>>
>> --
>> 2.41.0
>>
> 
> 
> --
> Mike Leach
> Principal Engineer, ARM Ltd.
> Manchester Design Centre. UK


