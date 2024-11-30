Return-Path: <linux-arm-msm+bounces-39682-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8689DEED2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Nov 2024 04:16:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3635BB2158D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Nov 2024 03:16:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59890335D3;
	Sat, 30 Nov 2024 03:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NKudz865"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D883C2F3B;
	Sat, 30 Nov 2024 03:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732936612; cv=none; b=jhNcQNT+ejd0I8TjLWVzR/a+daFALYZCkJYtbiaRoqJBBPfSJHrI0JfcQp4yvDUM1ZJsdQNRpjbWvJiKj0GjYz/+h1om2JMBQIcU+js3UYbEKwhtbRxlw2B/qm29wqNDJ12J8hFG+4uomAo9aFQQIEaUr3GJM7ynyx7jU550Ls0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732936612; c=relaxed/simple;
	bh=2l3KfqoOvZDkJTmLIM0ptsydik6v8ezmtCOy/dYLd3I=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=W+uftp8v+xik9gA2gy+7mRByIb3o0ZfI6ZzNLg9Im9fDAUHCFDxOmP0fMKJJs1UiJVDqPNZbQ6JMbO3tEduuAg9sEWj3ZNg2N+p3Judk3Ob55DJZ/eP/Vn2UvGMRmGM8YX2dtG/Wad8N2imAYuphdy2HyTwFejEZB9o1LxtwIXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NKudz865; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AU0q3nQ020987;
	Sat, 30 Nov 2024 03:16:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LxpVgLo3JnamRIJ/XC6YKJPsC09k5vJCje9OieMiSLM=; b=NKudz865BFm5Ik07
	uvx7TtMz2PMmWOZirimcJpEGW+pkhcV6WleILclDuLTgbKIIr4y21QU1EZS9tcIJ
	o8P+xzqOQuekAKBcgj6qvKYDtVw2Ct9mgJev/5vih0GSzdT0lDwmC2cdgrh29Mx3
	+IXOpnxMHPp0gCXw9sghoIVZ5vWMri005nS+0GwAa4/6kUzIVR8AxbEutonEuVjC
	kN7+q4hXvxWTjf7uxDch/qGmW78FspBa03Zss000DoeruKj7pzYVPEmtxNt9ohZL
	xD9ZeymCfM5y/svxskuAaw+nXeQuI+GLosF+bY+CMoWi8xWqeJxdQXmqipLOFxuZ
	FI7/lQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43671eexg1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 30 Nov 2024 03:16:42 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AU3Gf7u028597
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 30 Nov 2024 03:16:41 GMT
Received: from [10.253.74.19] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 29 Nov
 2024 19:16:36 -0800
Message-ID: <a82af64b-da8f-40c5-bd8c-9ea7621c4556@quicinc.com>
Date: Sat, 30 Nov 2024 11:16:33 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] dt-bindings: net: Add QCA6698 Bluetooth
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz
	<luiz.dentz@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Balakrishna
 Godavarthi" <quic_bgodavar@quicinc.com>,
        Rocky Liao
	<quic_rjliao@quicinc.com>,
        <linux-bluetooth@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <quic_mohamull@quicinc.com>, <quic_zijuhu@quicinc.com>,
        <quic_jiaymao@quicinc.com>
References: <20241128120922.3518582-1-quic_chejiang@quicinc.com>
 <20241128120922.3518582-3-quic_chejiang@quicinc.com>
 <jaq7tjdq4srboo7m4byfofdbigy5hyeeqwyrgh72t23xgwb65m@lz5yivskxbwd>
 <cd82ea16-7c37-41cf-bfb1-7cc6d743d8e9@quicinc.com>
 <vlmdm5yfekmx5miv5twjpukwhudcpjoijk3jxoobhzvecpsb54@her62ghhpruy>
Content-Language: en-US
From: "Cheng Jiang (IOE)" <quic_chejiang@quicinc.com>
In-Reply-To: <vlmdm5yfekmx5miv5twjpukwhudcpjoijk3jxoobhzvecpsb54@her62ghhpruy>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: NJw95Kfa6I3jPVzKxJ82UHrJkm85GjHt
X-Proofpoint-GUID: NJw95Kfa6I3jPVzKxJ82UHrJkm85GjHt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 impostorscore=0 mlxscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2411300025

Hi Dmitry,

On 11/30/2024 1:13 AM, Dmitry Baryshkov wrote:
> On Fri, Nov 29, 2024 at 10:30:00AM +0800, Cheng Jiang (IOE) wrote:
>> Hi Dmitry,
>>
>> On 11/28/2024 8:58 PM, Dmitry Baryshkov wrote:
>>> On Thu, Nov 28, 2024 at 08:09:21PM +0800, Cheng Jiang wrote:
>>>> Add the compatible for the Bluetooth part of the Qualcomm QCA6698 chipset.
>>>
>>> ... 
>>> And you have misssed to explain why do you need to add it and how it is
>>> different from WCN6855.
>>>
>> Got it. I just explain in the dts/driver change, forget to explain here. 
>>
>> If use the firmware-name solution, do we still need add the new compatible
>> string for qcom,qca6698-bt here? The driver may not use this string.   
> 
> DT describes the hardware. If you want, you can still add new string
> _and_ use old one as a fallback compatible: "qcom,qca6698-bt",
> "qcom,wcn6855-bt".
Got it. Thanks! 
> 
>>>>
>>>> Signed-off-by: Cheng Jiang <quic_chejiang@quicinc.com>
>>>> ---
>>>>  .../devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml   | 2 ++
>>>>  1 file changed, 2 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml b/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
>>>> index 7bb68311c..82105382a 100644
>>>> --- a/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
>>>> +++ b/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
>>>> @@ -18,6 +18,7 @@ properties:
>>>>      enum:
>>>>        - qcom,qca2066-bt
>>>>        - qcom,qca6174-bt
>>>> +      - qcom,qca6698-bt
>>>>        - qcom,qca9377-bt
>>>>        - qcom,wcn3988-bt
>>>>        - qcom,wcn3990-bt
>>>> @@ -170,6 +171,7 @@ allOf:
>>>>            contains:
>>>>              enum:
>>>>                - qcom,wcn6855-bt
>>>> +              - qcom,qca6698-bt
>>>>      then:
>>>>        required:
>>>>          - vddrfacmn-supply
>>>> -- 
>>>> 2.25.1
>>>>
>>>
>>
> 


