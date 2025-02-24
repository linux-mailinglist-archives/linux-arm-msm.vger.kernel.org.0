Return-Path: <linux-arm-msm+bounces-49173-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B26AA42090
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 14:28:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D885B161BB8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 13:25:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 049E023BD0B;
	Mon, 24 Feb 2025 13:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Gv2efhFy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C28A221F12;
	Mon, 24 Feb 2025 13:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740403515; cv=none; b=pRL4N44pjNUkdiuEeepg821f97eyCLahtbsJ8HtdrmvlrQyayKCouN/0v2zwE9DU4tFJqp59bs7osVsYyb6cR6r5L4SUFa9fc9ZkMsnLM7Ds4LDRcZ+r2MB5BasValXliwNp4b22PyZMQp64ZrieFT3qnyID39T7pOu4XtQNvCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740403515; c=relaxed/simple;
	bh=ximZJ42CHdbASaltwg2nH8bR186SAp7QNha5PpOD/UM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=sIgl2as0DJ9s18peiN33/+C/t3KMwISWatm03ButMwKBVByWCj93AqaOEb9oFGzJSRdyzqEMnFeDrhdEEvFcVZpHa7MDhEdtFppeIxW7+0hEDq5talYPfgOmkeG90XIZmaQAOf7OG+L+AckmnZ8W8OWY2+RbAShwlFKTSQWmAMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Gv2efhFy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51O9K8KL025225;
	Mon, 24 Feb 2025 13:25:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ukFyx5KoGDa7IkNJf3I2JvC5n29tBOfoCIP4Dm8p/TY=; b=Gv2efhFynPSXV4r/
	QVdeFXmzVtAL/8Ofn4sEeTmMg7SZjCZtS4sIsccJ8Xr6/qNT30A7rGj7X7bLxRR0
	9wl2VpR4HnsXu1CETEztaBoGC2zJLsVZCJbYBXTmweAf1uklDyXLCqRQiRNPWzNW
	1PmhPDxjwdOtiPxi5AtXOQvR+0LJSXNYlLaAWTeSFRBr5ylOkPFhAUQxQ4026DSw
	c9KvcPR02mLYEGFu7h4UpxXI8ZXKTELD+YM3Wl9ekS0UA+j3b2dfNWTiiyscwlYL
	A7x1RzMBkFqgFN6UVF0J9gCmEEu9cLZGvJaQeAuOiQ+9lEwT+89ual5PrzPzLlXj
	em0m9g==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44y7v9d5vh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Feb 2025 13:25:10 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51ODP9nW025330
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Feb 2025 13:25:09 GMT
Received: from [10.216.19.8] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 24 Feb
 2025 05:25:05 -0800
Message-ID: <428a1384-bc06-4952-a117-d57f5ab6446c@quicinc.com>
Date: Mon, 24 Feb 2025 18:55:02 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] dt-bindings: qcom: geni-se: Rename qcom,geni-se.yaml
 to qcom,geni-se-qup.yaml
To: Krzysztof Kozlowski <krzk@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <quic_msavaliy@quicinc.com>, <quic_anupkulk@quicinc.com>
References: <20250221085439.235821-1-quic_vdadhani@quicinc.com>
 <49fc59ed-9d09-46bd-9ca6-99d3445221f7@kernel.org>
 <f3349d2a-7eba-4865-9b58-0b2e7e57cc92@quicinc.com>
 <ed8f7aee-e5be-453c-b324-e59e90ecee77@kernel.org>
Content-Language: en-US
From: Viken Dadhaniya <quic_vdadhani@quicinc.com>
In-Reply-To: <ed8f7aee-e5be-453c-b324-e59e90ecee77@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: mWPOb30yKBTplRRTEs02xQ7ehA3IxOco
X-Proofpoint-ORIG-GUID: mWPOb30yKBTplRRTEs02xQ7ehA3IxOco
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-24_05,2025-02-24_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 impostorscore=0 bulkscore=0 malwarescore=0 phishscore=0
 spamscore=0 suspectscore=0 mlxscore=0 mlxlogscore=441 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502240097



On 2/24/2025 3:48 PM, Krzysztof Kozlowski wrote:
> On 24/02/2025 09:47, Viken Dadhaniya wrote:
>>
>>
>> On 2/21/2025 5:05 PM, Krzysztof Kozlowski wrote:
>>> On 21/02/2025 09:54, Viken Dadhaniya wrote:
>>>> The qcom,geni-se.yaml file describes the Qualcomm Universal Peripheral
>>>> (QUP) wrapper and the common entities required by QUP to run any Serial
>>>> Engine (SE) as I2C, SPI, UART, or I3C protocol.
>>>>
>>>> Rename qcom,geni-se.yaml to qcom,geni-se-qup.yaml to better reflect its
>>>> association with QUP (Qualcomm Universal Peripheral) and the compatible
>>>> string.
>>>>
>>>> Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
>>>> ---
>>>>    .../soc/qcom/{qcom,geni-se.yaml => qcom,geni-se-qup.yaml}       | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>    rename Documentation/devicetree/bindings/soc/qcom/{qcom,geni-se.yaml => qcom,geni-se-qup.yaml} (98%)
>>>>
>>>
>>> That's just churn for no real gain. Not even tested churn.
>>
>> That's just churn for no real gain.
>>
>> We made this change based on below plan, we think this will be helpful.
>>
>> 1. Rename qcom,geni-se.yaml to qcom,geni-se-qup.yaml. Reason at 2 below.
> 
> There is no reason 2 at this point. You split your patchsets
> incorrectly. At this point this is churn, without gain. No users of this
> rename, no benefits.
> 
>> 2. Create qcom,geni-se.yaml with shared properties for SE-protocol (spi,
>> i2c, uart) nodes. This will be helpful for the shared schema in the
>> ongoing changes
> 
> Then post it, instead of sending something which makes no sense on its own.

Should I include this change in v3 of the following serial patch?

https://lore.kernel.org/linux-arm-msm/f090d637-1ef1-4967-b5bc-6bfce3d7130e@kernel.org/T/

I hope the approach below is fine for you:

1. Rename qcom,geni-se.yaml to qcom,geni-se-qup.yaml.
2. Create qcom,geni-se.yaml with shared properties for SE-protocol (i2c, 
spi, uart) nodes.

if there is anything wrong or missing any validation, please let me know 
so before next patch i can correct my self.

> 
> 
> Best regards,
> Krzysztof

