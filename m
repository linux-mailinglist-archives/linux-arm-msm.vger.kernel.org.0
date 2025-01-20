Return-Path: <linux-arm-msm+bounces-45575-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E72BEA16B19
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jan 2025 11:58:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0F17E3A2CBC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jan 2025 10:58:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C55851B423D;
	Mon, 20 Jan 2025 10:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="nReI8Hkk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4939B187872;
	Mon, 20 Jan 2025 10:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737370693; cv=none; b=YXNF5ZbFs/7B5UzmgvQjc9kSkWF7ZMljT1GJctAeABRtM4YnSBiTZX9fDrThUyVj4IUEMl7ZHc/TfjdIOBvikT5CxwL2Y6PDALPWJOBIIPpksLlc4oeSjK7h9FOKZ4tziUQc2uIWGJtJ5+QCr+vkr7ypL6p6XB8Xsq95oB/JTwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737370693; c=relaxed/simple;
	bh=fCPB+Mktn1Ud/OMdyJqeeOy0uaUVM040DG+fMN7ptcs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=iAuQgPjP1KnxnIABh6I+3BZ6jn7UUZIdBwz03RQnsvemC2fdpl5e7O8arQ+I4OHGOrToxyec3x7NYnqhb/+lgjXriGXsY6I/o0QD3BYQwPAZOO9EaX/wGf6jPqeRiSM/qvjaqNtpmojv8/UZLmyeEPDi2NSlZ+stwM0nUhaXI6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=nReI8Hkk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50KANsSr005145;
	Mon, 20 Jan 2025 10:58:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w5qQrWej8RvvwzJuRhHfB+d4wZAfsn37XDaEUTeP/SA=; b=nReI8HkkJrfXmYg9
	C9EpEaNj7uCL6KwLlRlcxlwTFzgYRcWjQGv2HStGLUUbe/wYTaEMZ1aCZzY89k3M
	n1BWwzKHzUtPafCveJxpixMrlx1QyAEUuPTEbXENu5ZqMMsFlk5x4CEvUvoQt0EC
	YOBhQfCDXeTzxYeREO1PRj85XcZZfU3GwoP9E5kuaqBWiHx66YnPWLXUp1uQjy5X
	uHZaBtNpOMRsU0U7lvtP79ybqAmqgA3I5Z5aGWLiK6FVRjf9ASVfEQZnwlIrK+hr
	YusafN2PLpNCaVNlbAy5Uu/fE8BppHIb/Nw8sHJwWNvPElTDyOBamE9l1G7nv2Sg
	ao35ug==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 449mpsr2mm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Jan 2025 10:58:08 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50KAw7mg010050
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Jan 2025 10:58:07 GMT
Received: from [10.217.217.81] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 20 Jan
 2025 02:58:03 -0800
Message-ID: <608afa23-ca4e-48dd-b929-4466560a7e61@quicinc.com>
Date: Mon, 20 Jan 2025 16:27:59 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: Add cpu scaling clock node
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ajit Pandey
	<quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        "Jagadeesh Kona" <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_manafm@quicinc.com>
References: <20241108-qcs615-mm-dt-nodes-v1-0-b2669cac0624@quicinc.com>
 <20241108-qcs615-mm-dt-nodes-v1-2-b2669cac0624@quicinc.com>
 <cgg3s6f555eb4jl5segz7irwx2kkza7w6zucfyo7myrbjhng3v@2qmyrobzakhd>
 <71635b71-71e4-4c17-add1-bf41ce770632@quicinc.com>
 <scfoxmstfqgvqmxovb7h5gulh6bjhgexs6yxe2n75izc7sawby@djphyr2ilei3>
 <97f5f5b1-b4f9-4d0d-88fb-4c7a0f1c26ac@quicinc.com>
 <CAA8EJppOHw5u_dMW=uXgyp3NSJmv9fwNvEL63NCqOpXUKPz5vA@mail.gmail.com>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <CAA8EJppOHw5u_dMW=uXgyp3NSJmv9fwNvEL63NCqOpXUKPz5vA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: IjIjC_4c4SZLBXqYN2FkF6KAWVZs2YGP
X-Proofpoint-ORIG-GUID: IjIjC_4c4SZLBXqYN2FkF6KAWVZs2YGP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-20_02,2025-01-20_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 mlxscore=0 clxscore=1015 mlxlogscore=949
 lowpriorityscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501200091



On 1/20/2025 4:06 PM, Dmitry Baryshkov wrote:
> On Mon, 20 Jan 2025 at 12:34, Taniya Das <quic_tdas@quicinc.com> wrote:
>>
>>
>>
>> On 1/20/2025 2:16 PM, Dmitry Baryshkov wrote:
>>>>> This doesn't follow the bindings, does it?
>>>> I will add and re-use the closest target compatible.
>>>>
>>>>>> +          reg = <0 0x18323000 0 0x1400>,
>>>>>> +                <0 0x18325800 0 0x1400>;
>>>>>> +          reg-names = "freq-domain0", "freq-domain1";
>>>>>> +
>>>>>> +          clocks = <&rpmhcc RPMH_CXO_CLK>, <&gcc GPLL0>;
>>>>>> +          clock-names = "xo", "alternate";
>>>>> Are the DCVSH interrupts?
>>>>>
>>>> This target does not have DCVSH interrupts directly connected to the
>>>> CPUFREQ-HW.
>>> So, does it require a separate LMH driver, like the one used for sdm845?
>>
>> I will check how it is handled on QCS615 as it is closer to SC7180 and I
>> didn't see any LMH handling there as well.
> 
> At least sm6150-thermal.dtsi declares two LMH blocks.

QCS615 also has 2 LMH blocks, but the handling of interrupts will be 
done from the LMH driver, integration with CPUFREQ-HW driver is still 
under evaluation.

-- 
Thanks & Regards,
Taniya Das.


