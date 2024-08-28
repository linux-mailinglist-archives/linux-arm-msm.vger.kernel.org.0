Return-Path: <linux-arm-msm+bounces-29745-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A262962370
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 11:32:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AF422B21803
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 09:32:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E028161321;
	Wed, 28 Aug 2024 09:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="d7l8LJNt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92EA0A48;
	Wed, 28 Aug 2024 09:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724837522; cv=none; b=luw7T7PLpxpX3XAbW7SQ5D4j5Pwxs4r87f/nysDn8o3O5kYuvp9HqyGRrtXA+ai++6i1fWK7gXTIUFJLakUDdM40x/CpHt0reHXaGSE7IrQEuMJCqcZONVFr/ycfo+zYYaO8TjQvjKX9CzSS7o95UFufjkgYqeVAzHSyGILuwmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724837522; c=relaxed/simple;
	bh=Fz+MJlm9XmkSxkthWC0yUWERzBavDw/sEz8nWlDKjQY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Kh5aEKRYaSGZRy2nOOPSKBYVM1FKugIGCXn5MqiHL1z7eLKutgppin7regQCyk8RHuoal64bAo1lkcRTh7hIW3CJQbyajj/rzre7XSFEUDRzHAcvGjT4Ot2Q/6Xsy69I+cSyQYbMhDgOBx8BZ6SW9tg+CH9mS+nZiVsa1I3w7FA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=d7l8LJNt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47RLaQqc003164;
	Wed, 28 Aug 2024 09:31:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wihi571xK+UGgb+RM0S/82Qcm+ipI7Jb7T+cJjKRB+A=; b=d7l8LJNtDgSr7J5A
	N7pTRE5LdaL+n8/sOFqqsV66fep0hUzc/q75Tw1xq1c8W4bCepJ0JA9+FV5f61nS
	aW/sT5OPyVy0zAAOuWjJMUuiWDz18Z1ao73fQ2gRBV/h0LIEycpIQ/4DZl8LbrLg
	b1qA/yTOkJBoqIqtS4yiz5jauzJDIXk1IheISOEP4LhoS/4AkhOfMV+ktvskmDvB
	rYBDJEPH4MFUJyjl6XFkN0OujOiXP20GFVK/Zjc0F4EeWFGoVJiZHamX+vAGmOn0
	9761gMg1cS0KlEvCWQfwJj7zAaC3wiHYZCxdVImE51ZQ6r6+/fN7Q97mnp4blVr3
	Kz88qg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 419puu9aj7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Aug 2024 09:31:55 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47S9Vsdv027169
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Aug 2024 09:31:54 GMT
Received: from [10.239.132.205] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 28 Aug
 2024 02:31:49 -0700
Message-ID: <148451f2-6b1b-4616-b703-fd52e7afa2be@quicinc.com>
Date: Wed, 28 Aug 2024 17:31:46 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] arm64: dts: qcom: add base QCS615 RIDE dts
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, <kernel@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <20240828-add_initial_support_for_qcs615-v1-0-5599869ea10f@quicinc.com>
 <20240828-add_initial_support_for_qcs615-v1-6-5599869ea10f@quicinc.com>
 <22qkvfravm6sxiq3xfavahg2u6b2pwlyzqbqvd55zym5zef3gi@m4bsqkdvggty>
 <17d0017e-b55d-4b32-9fd3-1a1a84e5ebf9@quicinc.com>
 <0ec92d59-0648-40ed-a522-307152b5c37d@kernel.org>
From: Lijuan Gao <quic_lijuang@quicinc.com>
In-Reply-To: <0ec92d59-0648-40ed-a522-307152b5c37d@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: umurXFGdi-WOQN79eSibZz3mTJOXInt0
X-Proofpoint-ORIG-GUID: umurXFGdi-WOQN79eSibZz3mTJOXInt0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-28_03,2024-08-27_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 adultscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 clxscore=1015 mlxlogscore=999 mlxscore=0 phishscore=0 lowpriorityscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408280068



在 8/28/2024 5:11 PM, Krzysztof Kozlowski 写道:
> On 28/08/2024 09:54, Lijuan Gao wrote:
>>
>>
>> 在 8/28/2024 2:25 PM, Krzysztof Kozlowski 写道:
>>> On Wed, Aug 28, 2024 at 10:02:16AM +0800, Lijuan Gao wrote:
>>>> Add initial support for Qualcomm QCS615 RIDE board and enable
>>>> the QCS615 RIDE board to shell with dcc console.
>>>>
>>>> Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
>>>> ---
>>>>    arch/arm64/boot/dts/qcom/Makefile        |  1 +
>>>>    arch/arm64/boot/dts/qcom/qcs615-ride.dts | 15 +++++++++++++++
>>>>    2 files changed, 16 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
>>>> index 197ab325c0b9..c5503f189847 100644
>>>> --- a/arch/arm64/boot/dts/qcom/Makefile
>>>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>>>> @@ -110,6 +110,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qcm6490-idp.dtb
>>>>    dtb-$(CONFIG_ARCH_QCOM)	+= qcm6490-shift-otter.dtb
>>>>    dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-1000.dtb
>>>>    dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-4000.dtb
>>>> +dtb-$(CONFIG_ARCH_QCOM)	+= qcs615-ride.dtb
>>>>    dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2.dtb
>>>>    dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-aim300-aiot.dtb
>>>>    dtb-$(CONFIG_ARCH_QCOM)	+= qdu1000-idp.dtb
>>>> diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>>>> new file mode 100644
>>>> index 000000000000..31d32ad951b5
>>>> --- /dev/null
>>>> +++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>>>> @@ -0,0 +1,15 @@
>>>> +// SPDX-License-Identifier: BSD-3-Clause
>>>> +/*
>>>> + * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
>>>> + */
>>>> +/dts-v1/;
>>>> +
>>>> +#include "qcs615.dtsi"
>>>> +/ {
>>>> +	model = "Qualcomm Technologies, Inc. QCS615 Ride";
>>>> +	compatible = "qcom,qcs615-ride", "qcom,qcs615";
>>>> +
>>>> +	chosen {
>>>> +		bootargs = "console=hvc0";
>>>
>>> Noooo, last time I agreed on this, you told me later it is different.
>>>
>> In the early stages, enabling HVC is to more easily verify clock and
>> PMIC related functions, as it’s difficult to debug without the console
>> log. After the clock and PMIC are ready, we will enable the UART console.
> 
> Working serial is supposed to be part of the early submission.
> 
Okay, I will remove it in the next patch.
> Best regards,
> Krzysztof
> 
> 

-- 
Thx and BRs
Lijuan Gao

