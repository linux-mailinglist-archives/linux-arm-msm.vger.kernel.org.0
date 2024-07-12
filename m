Return-Path: <linux-arm-msm+bounces-26005-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D804092F51C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jul 2024 07:40:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9490928387A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jul 2024 05:40:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A3D918039;
	Fri, 12 Jul 2024 05:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fK4qrFH+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B15AEFC12;
	Fri, 12 Jul 2024 05:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720762830; cv=none; b=SaKPjZWtKbUkUl7A8GWKzirgHJH87I3KxHN6k6zvutDYGiYmxCHkvLmIP4W+zJWMmqI3KnibjCWiX8SpRDc8aR9ZI0QwAjcNrVAXZ6qkUEoNPDL2eaS2225yqnql3MjBmmqn0RMvfJPmbbPHtW4rHdZx4GvK0ILqCxgoE9sKH7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720762830; c=relaxed/simple;
	bh=hvyFx3I4Ha1qkqZiA0VG/4TdPG0Oy8Q8M9MNYd24II4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=gOuVLJqXwEC1c0cHE1793oB9cdTEpQSp/1/UuLjpJ4M058oOcjSfBEwWMn4aRi3WxuXCff/AbUl04gmiffoedCFB2JqfZeq4injGwlb9WMZU5nj56Q7YtPgl87NKYbihde6bnFvkdA5ys9ZSeARyWy378bfsn2ZQ0Ym9/9XDigA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fK4qrFH+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46C2eofX008746;
	Fri, 12 Jul 2024 05:40:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S+lQpm2m3jaaBULrxGFN2wLiGoIoLBtU+dUdkmZdDK4=; b=fK4qrFH+7aywWD6S
	DGMS4440AsziEWMn+oUvITgxViF+mzLu9gekwL2pDW//seGzL+vbNW+Blcxl/km3
	c5c9ItlWcY7aY0Hcn22Uy12PwClh6WB6U/fdJbviYlVD3Dd+2jlvUF7BbdXtXXc0
	+6f60JQz0LbpMKLXiWnjL9owweXbVxx48cYzgCGeorVsBimTNsVS0fEXktpneaRl
	ZGKjXHY9WIwh64nYRasfXFMmXdUluOPQLshOpLKTarpAuzcOldfcaR/Y6DA88Hui
	zeElgSEXHTUDT9nW5K5/MMDBfl6s/CJUTZaTG1J+MUQbtY4IzUNoqIgX9aDTg0Oa
	iCaQoA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 406x51ef86-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Jul 2024 05:40:24 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46C5eI33002900
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Jul 2024 05:40:18 GMT
Received: from [10.239.132.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 11 Jul
 2024 22:40:13 -0700
Message-ID: <072da4b0-2d6c-4342-a1f4-451f4ff791fc@quicinc.com>
Date: Fri, 12 Jul 2024 13:40:11 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: soc: qcom,aoss-qmp: Document the QCS9100
 AOSS channel
To: Chris Lew <quic_clew@quicinc.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20240709-document_qcs9100_aoss_qmp_compatible-v2-1-6c7f35bc9ec3@quicinc.com>
 <24302005-d9a5-400e-a28c-40276a3f7250@quicinc.com>
From: Tengfei Fan <quic_tengfan@quicinc.com>
In-Reply-To: <24302005-d9a5-400e-a28c-40276a3f7250@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 7kv-dtF8Y_UZ0R4dBTVod6M61i7tHQDU
X-Proofpoint-ORIG-GUID: 7kv-dtF8Y_UZ0R4dBTVod6M61i7tHQDU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-12_03,2024-07-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 suspectscore=0 impostorscore=0 mlxlogscore=999 mlxscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407120037



On 7/11/2024 3:58 AM, Chris Lew wrote:
> Hi Tengfei,
> 
> On 7/9/2024 7:24 AM, Tengfei Fan wrote:
>> Document the Always-On Subsystem side channel on the QCS9100 Platform.
>> QCS9100 is drived from SA8775p. Currently, both the QCS9100 and SA8775p
> 
> /s/drived/derived/

ACK.

> 
>> platform use non-SCMI resource. In the future, the SA8775p platform will
>> move to use SCMI resources and it will have new sa8775p-related device
>> tree. Consequently, introduce "qcom,qcs9100-aoss-qmp" to describe
>> non-SCMI based AOSS channel.
>>
> 
> Were there any differences between non-SCMI and SCMI based platforms 
> specifically for the qcom_aoss.com driver?
> 
> 
>> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
>> ---
>> Introduce support for the QCS9100 SoC device tree (DTSI) and the
>> QCS9100 RIDE board DTS. The QCS9100 is a variant of the SA8775p.
>> While the QCS9100 platform is still in the early design stage, the
>> QCS9100 RIDE board is identical to the SA8775p RIDE board, except it
>> mounts the QCS9100 SoC instead of the SA8775p SoC.
>>
>> The QCS9100 SoC DTSI is directly renamed from the SA8775p SoC DTSI, and
>> all the compatible strings will be updated from "SA8775p" to "QCS9100".
>> The QCS9100 device tree patches will be pushed after all the device tree
>> bindings and device driver patches are reviewed.
>>
>> The final dtsi will like:
>> https://lore.kernel.org/linux-arm-msm/20240703025850.2172008-3-quic_tengfan@quicinc.com/
>>
>> The detailed cover letter reference:
>> https://lore.kernel.org/linux-arm-msm/20240703025850.2172008-1-quic_tengfan@quicinc.com/
>> ---
>> Changes in v2:
>>    - Split huge patch series into different patch series according to
>>      subsytems
>>    - Update patch commit message
>>
>> prevous disscussion here:
>> [1] v1: 
>> https://lore.kernel.org/linux-arm-msm/20240703025850.2172008-1-quic_tengfan@quicinc.com/
>> ---
>>   Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git 
>> a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml 
>> b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
>> index 7afdb60edb22..80e1a8b43586 100644
>> --- a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
>> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
>> @@ -25,6 +25,7 @@ properties:
>>     compatible:
>>       items:
>>         - enum:
>> +          - qcom,qcs9100-aoss-qmp
>>             - qcom,qdu1000-aoss-qmp
>>             - qcom,sa8775p-aoss-qmp
>>             - qcom,sc7180-aoss-qmp
>>
>> ---
>> base-commit: 0b58e108042b0ed28a71cd7edf5175999955b233
>> change-id: 20240709-document_qcs9100_aoss_qmp_compatible-a7376629ea6c
>>
>> Best regards,

-- 
Thx and BRs,
Tengfei Fan

