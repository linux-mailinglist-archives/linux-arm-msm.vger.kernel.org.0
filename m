Return-Path: <linux-arm-msm+bounces-28269-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3B094E4B3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Aug 2024 04:17:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 95EB7B2162E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Aug 2024 02:17:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A27C6BFC0;
	Mon, 12 Aug 2024 02:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="b51yF12b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8DB54D8D1;
	Mon, 12 Aug 2024 02:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723429038; cv=none; b=anv8vxZukfpOi7AbkDDkE0EWVXhaXxk95FKPBzJ+d3vyI47Q2cyXS8ZKnKxZla3x+cRg52SoJzZL+17WoH73BEEBwCR0zJx9IPKN8AbXT7xs83uMdyOiagM1w3BGtjA/qAA12xbKxLdORc88TTaSu2JTvd1jbloFWBOqOE9FjQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723429038; c=relaxed/simple;
	bh=eNJmkuy473QfputWPuGfbgt/GM+vVkAEV3gKpMsVY8M=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=t3MPSzWWL4PKwt7fvPNdNSTSBJt0fYxeZNrfnqoNTEIMudk6R4TkWglYCUWp6+dq+q0I41IJTMDADR/sDjQBQptLwEh50/+pje/x6Lop61mxwbGrLVetskDde5Y0k5mTJMLToN6tlCEZbsE2UgCF2E1fDYP1NLG/oLHYyjHoNJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=b51yF12b; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47C0roA5020712;
	Mon, 12 Aug 2024 02:17:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EktNzuBr5I0VBlujbZBE6+gNvIG9gnMzHXxJVmvAvfU=; b=b51yF12b8cCQpL6n
	BkkAV0gEa8Yw8DeQBxvJMeaMahZg9veVugsSJPJfeIRcoUXAXwWVjZ+Ojr1yhDpT
	ij4AMS6Wy8Y6hUoPfZpND1d2YBVs0qR8+4y2aTHTGJibhewLiZHFq3qwvcWkI8xq
	HUEu5J3k09LyOf2adHrny3e/+6zWDHFZz/b1ud5SnIUxi9PgflV0Iw6qLhlnJ/Aq
	5rFkH4kM3r8WpP231Aes4KKauaVr4fCanCvWapVFd5CI2at5ArekzKQ6J7Jvp3St
	IUduBC2o/x+qlqPbvXOci6yqYjpM+iWOPDLRHl8N+QfwxXjsaQ1i7TDkcBwCVjZ3
	LUKtSw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40x18dakvx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Aug 2024 02:17:00 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47C2GxgI021978
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Aug 2024 02:16:59 GMT
Received: from [10.233.17.145] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 11 Aug
 2024 19:16:54 -0700
Message-ID: <0d1c44b9-3d5f-4d93-af64-1756e52f4fe3@quicinc.com>
Date: Mon, 12 Aug 2024 10:16:51 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: sa8775p-ride: Add QCS9100
 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Tengfei Fan
	<quic_tengfan@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad
 Dybcio" <konrad.dybcio@linaro.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20240806-add_qcs9100_soc_id-v1-0-04d14081f304@quicinc.com>
 <20240806-add_qcs9100_soc_id-v1-4-04d14081f304@quicinc.com>
 <90eae361-7d5d-440f-a85d-dfd81b384fe7@kernel.org>
 <4a350e94-3c95-48e1-9ea8-ced483c1aa45@quicinc.com>
 <14ec06bd-0c27-4930-8bce-d3f5b68067ed@kernel.org>
 <ace5b3e1-f4a2-4c04-821a-e797d0f55cae@quicinc.com>
 <9323127a-e6b5-4835-afa0-4ce0086fd9d1@kernel.org>
From: Tingwei Zhang <quic_tingweiz@quicinc.com>
In-Reply-To: <9323127a-e6b5-4835-afa0-4ce0086fd9d1@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: toWu91HfSVwBmbyZxksFp58moRO83V8p
X-Proofpoint-ORIG-GUID: toWu91HfSVwBmbyZxksFp58moRO83V8p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-11_25,2024-08-07_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 clxscore=1015 adultscore=0 spamscore=0
 priorityscore=1501 mlxscore=0 malwarescore=0 suspectscore=0
 mlxlogscore=639 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2407110000 definitions=main-2408120015

On 8/8/2024 7:05 PM, Krzysztof Kozlowski wrote:
> On 07/08/2024 13:04, Tingwei Zhang wrote:
>> On 8/7/2024 5:35 PM, Krzysztof Kozlowski wrote:
>>> On 07/08/2024 11:17, Tengfei Fan wrote:
>>>>
>>>>
>>>> On 8/7/2024 3:28 PM, Krzysztof Kozlowski wrote:
>>>>> On 06/08/2024 06:19, Tengfei Fan wrote:
>>>>>> Add QCS9100 compatible in sa8775p ride and sa8775p ride r3 board DTS.
>>>>>> QCS9100 references SA8775p, they share the same SoC DTSI and board DTS.
>>>>>>
>>>>>
>>>>> I don't understand this. You claim here that QCS9100 references SA8775p
>>>>> but your diff says other way: SA8775p references QCS9100.
>>>>>
>>>>> Sorry, that's confusing.
>>>>>
>>>>> Best regards,
>>>>> Krzysztof
>>>>>
>>>>
>>>> I will update the compatible as follows to indicate that QCS9100
>>>> references SA8775p.
>>>>
>>>> compatible = "qcom,sa8775p-ride", "qcom,qcs9100", "qcom,sa8775p";
>>>
>>> Is this still correct, though? sa8775p won't come with qcs9100 SoC.
>> We have a new board. Hardware is same as sa877p-ride except sa8775p is
>> replaced with qcs9100. We add qcs9100 SoC compatible to sa8775p-ride
> 
> Does "new board" mean that "old board" disappears? No users to care
> about it? Or just the existing board is being changed (like new revision)?

We will support both boards. Sa8775p-ride board with sa8775p chipset and 
sa8775p-ride board with qcs9100 chipset. Both of them can be used for 
development.
> 
> Best regards,
> Krzysztof
> 

-- 
Thanks,
Tingwei


