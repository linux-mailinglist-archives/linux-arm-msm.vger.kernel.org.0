Return-Path: <linux-arm-msm+bounces-28081-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D120C94A68D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Aug 2024 13:04:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0C6341C20C80
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Aug 2024 11:04:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E664F1DF675;
	Wed,  7 Aug 2024 11:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Z6xVnjFL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5130D1C9DC9;
	Wed,  7 Aug 2024 11:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723028658; cv=none; b=PvoTgYVFtbSshjKKlPjbHEwngCo3aMrFL1ApBSfztJJOuf36IqQTrPiSX0JqvcLEqXLreVI94ln3BNqBfG9itOWlYQ3+3qO4Dilhq8MpKxUWYPGDyE14lKyUGwqCoz8Az87/B2P6s20rVVY7uJZtyqQX9PzNX+zXRlJBvndoObc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723028658; c=relaxed/simple;
	bh=tZE9A7D7Qc4ABjafw02Q7U4Ejv1hoeHBVy7EEIcPMgY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=iRq2Jz+A6reXvi9RLz2nBdnar0ncR+n7PFNjEeH70g9K8MSSPXwYomI6lqjUL/o5LP5ztI/yr1wneni3I11maBO/B7h3HoshE8VA+mMrySQkAQgqhNcggaZTYdqyJ8An+vPmx+ikDmMLyOuhEFNJSWftjNO3gpOoO7wtFE0PUeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Z6xVnjFL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47789J2J019008;
	Wed, 7 Aug 2024 11:04:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5M2BR5QCUJ11BZbRjroJPti0NNlzXAvb/0+of+zkg58=; b=Z6xVnjFLZQK8AbyJ
	nc9iA87fgjkxxfAzsr2BqNYQmNogyFPW78h2mXL6i5tLuIIkOY4u+UdvEJ/ziG+B
	hqD30k2jF4Prh5mX7NZdYY0rSP3H4UuH0UpwpSBH0+n5fAUp/yKhKFMfjuE9YMZB
	jfmmbzWUILJ3Cq4MiiAUPJ5F9qT8c30YeFyqT+Q1NZzT6SQTvZMqIUD4ZDEkSz7d
	kn7rBZY2RxV682fBAk/1Tu2AL/hoFdjT+3GfvYXx6BGQ7HQ7veoloQrzbpUjrIBX
	xoqPZKklgVZ+wSFuUZQP9v3AuakKxQs+wwVkLOawxf0zTCGjyxhbPuH2yk9YF5ys
	sEy70A==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40u4cpne4h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 Aug 2024 11:04:13 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 477B4CF8016792
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 7 Aug 2024 11:04:12 GMT
Received: from [10.233.17.145] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 7 Aug 2024
 04:04:07 -0700
Message-ID: <ace5b3e1-f4a2-4c04-821a-e797d0f55cae@quicinc.com>
Date: Wed, 7 Aug 2024 19:04:04 +0800
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
From: Tingwei Zhang <quic_tingweiz@quicinc.com>
In-Reply-To: <14ec06bd-0c27-4930-8bce-d3f5b68067ed@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Vh9F86zSzFUruli9oGhjnINPSZ6NccLQ
X-Proofpoint-GUID: Vh9F86zSzFUruli9oGhjnINPSZ6NccLQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-07_08,2024-08-06_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 phishscore=0 malwarescore=0 bulkscore=0 spamscore=0
 lowpriorityscore=0 mlxscore=0 clxscore=1011 adultscore=0
 priorityscore=1501 mlxlogscore=619 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2407110000 definitions=main-2408070077

On 8/7/2024 5:35 PM, Krzysztof Kozlowski wrote:
> On 07/08/2024 11:17, Tengfei Fan wrote:
>>
>>
>> On 8/7/2024 3:28 PM, Krzysztof Kozlowski wrote:
>>> On 06/08/2024 06:19, Tengfei Fan wrote:
>>>> Add QCS9100 compatible in sa8775p ride and sa8775p ride r3 board DTS.
>>>> QCS9100 references SA8775p, they share the same SoC DTSI and board DTS.
>>>>
>>>
>>> I don't understand this. You claim here that QCS9100 references SA8775p
>>> but your diff says other way: SA8775p references QCS9100.
>>>
>>> Sorry, that's confusing.
>>>
>>> Best regards,
>>> Krzysztof
>>>
>>
>> I will update the compatible as follows to indicate that QCS9100
>> references SA8775p.
>>
>> compatible = "qcom,sa8775p-ride", "qcom,qcs9100", "qcom,sa8775p";
> 
> Is this still correct, though? sa8775p won't come with qcs9100 SoC.
We have a new board. Hardware is same as sa877p-ride except sa8775p is 
replaced with qcs9100. We add qcs9100 SoC compatible to sa8775p-ride 
device tree to indicate this board can support both sa8775p SoC and 
qcs9100 SoC.
> 
> Best regards,
> Krzysztof
> 

-- 
Thanks,
Tingwei


