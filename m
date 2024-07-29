Return-Path: <linux-arm-msm+bounces-27220-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0F493F259
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 12:15:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8E56E280E60
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 10:15:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4554886AE9;
	Mon, 29 Jul 2024 10:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="geyAXrGs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D05387711B;
	Mon, 29 Jul 2024 10:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722248146; cv=none; b=FPh20nm6ydb18xoqF8lJte/dU+Go3TJLHS9V4YTnNxkEn4C9JPEfhv3g2b5gNWahRy7E7Wrosm9QuhCOleKDu+JbUcRfgMk1HpbL17fc3m2/DyIU0dsm9/drEHbHyy3xQaqzQ7V/RthMvtiIXK/mNaijzkgRTCsrkzZKV3rHDCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722248146; c=relaxed/simple;
	bh=m1mdXrN0rsWBBU+5tgDsmUJXLlfBP60JfuP38NVbv3Q=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=BhtLAJq/VWlfBL6qjAhOJXJ1XievzByo2ePzrNybeyTJgTkBshUPWvdIV+BtIr6kDfXBTGTGdprbEohdU+ow4Plih1hhDSIfKBfmmxoGsz5Zm09eKeK24DPMkXoozJ0AfXzSGpUJ4CzC+W4rpqhKPhdypP/nmzaD1HmGk9hpDZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=geyAXrGs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46T0MCRB019111;
	Mon, 29 Jul 2024 10:15:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SSbuT4P6jm0pI8g8wt80Oyx6aUf3ootM41bQHhn1RjQ=; b=geyAXrGsGp8IBdCX
	MnOiWYHl4+lvFB8+8OypZSCehaUwwLJ3l5OiJ3ix1+ObekWxoAFh7lxy/SjDnlQc
	wkp42ySBAbijBzQX5cZdd0c86RVuTVVWIZNx90rnEzwu8938dvDkH/t8mFZ3e2zF
	VbGUNjWXyCorGA2aQckLeNif3AUIS39MYSZkP7pIV28ta/yZZIihZE3cU6D/qBQU
	6UCaa8rHIInTuzv34oy8/XLsqpKoyByS1MjmsBSVSFjKsv353Gn3C9IRTmhlwoMJ
	f+N4ctkYtgHt2yCF0qIjCJXixNcQ7YT5l7aDfxlsBpxxMU6GYoxKkDCYfuzXDr7L
	nrQCzg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40msne3rnr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jul 2024 10:15:41 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46TAFePT030460
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jul 2024 10:15:40 GMT
Received: from [10.239.132.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 29 Jul
 2024 03:15:36 -0700
Message-ID: <6dc608e0-2892-4d09-a54e-9341d3ea8227@quicinc.com>
Date: Mon, 29 Jul 2024 18:15:34 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: soc: qcom,aoss-qmp: Document the QCS9100
 AOSS channel
From: Tengfei Fan <quic_tengfan@quicinc.com>
To: Chris Lew <quic_clew@quicinc.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20240709-document_qcs9100_aoss_qmp_compatible-v2-1-6c7f35bc9ec3@quicinc.com>
 <24302005-d9a5-400e-a28c-40276a3f7250@quicinc.com>
 <072da4b0-2d6c-4342-a1f4-451f4ff791fc@quicinc.com>
In-Reply-To: <072da4b0-2d6c-4342-a1f4-451f4ff791fc@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: _rN3kO8XS-FUQQaFVics3cFRS4pHoTFI
X-Proofpoint-ORIG-GUID: _rN3kO8XS-FUQQaFVics3cFRS4pHoTFI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-29_08,2024-07-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=999 priorityscore=1501 clxscore=1015
 spamscore=0 mlxscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407290069



On 7/12/2024 1:40 PM, Tengfei Fan wrote:
> 
> 
> On 7/11/2024 3:58 AM, Chris Lew wrote:
>> Hi Tengfei,
>>
>> On 7/9/2024 7:24 AM, Tengfei Fan wrote:
>>> Document the Always-On Subsystem side channel on the QCS9100 Platform.
>>> QCS9100 is drived from SA8775p. Currently, both the QCS9100 and SA8775p
>>
>> /s/drived/derived/
> 
> ACK.

After considering the feedback provided on the subject, We have decided
to keep current SA8775p compatible and ABI compatibility in drivers.
Let's close this session and ignore all the current patches here.
Thank you for your input.

> 
>>
>>> platform use non-SCMI resource. In the future, the SA8775p platform will
>>> move to use SCMI resources and it will have new sa8775p-related device
>>> tree. Consequently, introduce "qcom,qcs9100-aoss-qmp" to describe
>>> non-SCMI based AOSS channel.
>>>
>>
>> Were there any differences between non-SCMI and SCMI based platforms 
>> specifically for the qcom_aoss.com driver?
>>
>>
>>> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
>>> ---
>>> Introduce support for the QCS9100 SoC device tree (DTSI) and the
>>> QCS9100 RIDE board DTS. The QCS9100 is a variant of the SA8775p.
>>> While the QCS9100 platform is still in the early design stage, the
>>> QCS9100 RIDE board is identical to the SA8775p RIDE board, except it
>>> mounts the QCS9100 SoC instead of the SA8775p SoC.
>>>
>>> The QCS9100 SoC DTSI is directly renamed from the SA8775p SoC DTSI, and
>>> all the compatible strings will be updated from "SA8775p" to "QCS9100".
>>> The QCS9100 device tree patches will be pushed after all the device tree
>>> bindings and device driver patches are reviewed.
>>>
>>> The final dtsi will like:
>>> https://lore.kernel.org/linux-arm-msm/20240703025850.2172008-3-quic_tengfan@quicinc.com/
>>>
>>> The detailed cover letter reference:
>>> https://lore.kernel.org/linux-arm-msm/20240703025850.2172008-1-quic_tengfan@quicinc.com/
>>> ---
>>> Changes in v2:
>>>    - Split huge patch series into different patch series according to
>>>      subsytems
>>>    - Update patch commit message
>>>
>>> prevous disscussion here:
>>> [1] v1: 
>>> https://lore.kernel.org/linux-arm-msm/20240703025850.2172008-1-quic_tengfan@quicinc.com/
>>> ---
>>>   Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git 
>>> a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml 
>>> b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
>>> index 7afdb60edb22..80e1a8b43586 100644
>>> --- a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
>>> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
>>> @@ -25,6 +25,7 @@ properties:
>>>     compatible:
>>>       items:
>>>         - enum:
>>> +          - qcom,qcs9100-aoss-qmp
>>>             - qcom,qdu1000-aoss-qmp
>>>             - qcom,sa8775p-aoss-qmp
>>>             - qcom,sc7180-aoss-qmp
>>>
>>> ---
>>> base-commit: 0b58e108042b0ed28a71cd7edf5175999955b233
>>> change-id: 20240709-document_qcs9100_aoss_qmp_compatible-a7376629ea6c
>>>
>>> Best regards,
> 

-- 
Thx and BRs,
Tengfei Fan

