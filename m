Return-Path: <linux-arm-msm+bounces-34395-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6FDD99DF38
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Oct 2024 09:23:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EAB94B212BE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Oct 2024 07:23:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B1FB18BB8B;
	Tue, 15 Oct 2024 07:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="pChQ8LZs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E37189474;
	Tue, 15 Oct 2024 07:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728976984; cv=none; b=nyYTbyJFw4kd9gIbZOvkEfONUUif3s3HO6ByPvOGEOAY6bDS1wqZ/uEG6UMmDs++BN4Ef9cBzmiJB+ix+a/3B53f9qv92byDb1WcfaHtk62fGDJGQkz8m+5EpDlnE6Kj9EAghWKUGc7qZ5r31B6XyueDfTsJroQlsizTe8NhqtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728976984; c=relaxed/simple;
	bh=poANdPpvtIRQF56I5CAwEq35+KyKFgIpH5910dkJFso=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=gFWhIqQ5eNeI4VX1LPipy8mibE8kQORRj/sJFAP+KHZMmaYR4LBaC8NeA0vupBudgzWCzfg7z3fI+ciC4XShyivl2VSB6gFUTfSSvsyLx27pOG7xeX2Sd0mNHlfqExWzMSS4Qck2JXN6l1uMkdfDnhayhCx6cf80zDJcVDWx/zY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=pChQ8LZs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49F0wpcn005958;
	Tue, 15 Oct 2024 07:22:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Noeq/Q6PCzpdA62n3cgxt8GWl/mH2ef5XhQLRlw9v0Q=; b=pChQ8LZs/1c3H+iS
	AZoDQRYDAQcYvn1WAndrYb0KpqC/Ck4fywzNyxLwWDQg4qyUu4QQpuaERrM60Yt+
	oPsSRaQexcaKXNJUjBYZQ7h70XxQfIyjw/B+AflR+Yv1WJINmIoXA2ESdHdC8WNN
	yXkwHX1aNij0SX06elJBLd/ASUPOV6GRXyB4ibTwX0Hs+d4N9rzQkd0xlgDbcrkL
	jVnwsLZ3WwxTkwBKXWnvHw0Fmc8eUbI5qinUNsPxyimxAY4hvzTAhklDUIWyhYZL
	CphU5ZIh4Jn0uw2QToySO6kSxExUNrO2H1G2JgRtz+7KSDw+q7y5MZJ0IeE5Puwx
	AI38/Q==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 427g2rprtq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Oct 2024 07:22:50 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49F7Mntg032032
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Oct 2024 07:22:49 GMT
Received: from [10.253.76.164] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 15 Oct
 2024 00:22:43 -0700
Message-ID: <56df7acd-100f-4402-9529-20e0bb825f07@quicinc.com>
Date: Tue, 15 Oct 2024 15:22:41 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] dt-bindings: net: qcom,ethqos: add description for
 qcs8300
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Vinod Koul <vkoul@kernel.org>, "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        "Paolo
 Abeni" <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bhupesh
 Sharma <bhupesh.sharma@linaro.org>,
        Kishon Vijay Abraham I
	<kishon@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        <netdev@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <quic_tingweiz@quicinc.com>,
        <quic_aiquny@quicinc.com>
References: <20241010-schema-v1-0-98b2d0a2f7a2@quicinc.com>
 <20241010-schema-v1-3-98b2d0a2f7a2@quicinc.com>
 <da45vocnwnnnlo6nrxh6x4xwmnsgdp5axfvomzniw5vxlmerer@6ntl3ae4q2ci>
 <b2f027d1-5b4a-4b73-aa26-a332df2a561b@quicinc.com>
 <f96fe4a7-9903-4b15-9994-985004bd6d4c@kernel.org>
Content-Language: en-US
From: Yijie Yang <quic_yijiyang@quicinc.com>
In-Reply-To: <f96fe4a7-9903-4b15-9994-985004bd6d4c@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: _RU-3SY2_i8C-E3F1f95gpIXbU29L_hr
X-Proofpoint-GUID: _RU-3SY2_i8C-E3F1f95gpIXbU29L_hr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0
 clxscore=1015 spamscore=0 adultscore=0 mlxlogscore=853 impostorscore=0
 mlxscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410150049



On 2024-10-15 14:27, Krzysztof Kozlowski wrote:
> On 15/10/2024 08:21, Yijie Yang wrote:
>>
>>
>> On 2024-10-10 14:15, Krzysztof Kozlowski wrote:
>>> On Thu, Oct 10, 2024 at 10:03:45AM +0800, Yijie Yang wrote:
>>>> Add compatible for the MAC controller on qcs8300 platforms.
>>>> Since qcs8300 shares the same EMAC as sa8775p, so it fallback to the
>>>> compatible.
>>>>
>>>> Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
>>>> ---
>>>>    Documentation/devicetree/bindings/net/qcom,ethqos.yaml | 4 ++++
>>>>    1 file changed, 4 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
>>>> index 8cf29493b822..3ee5367bdde1 100644
>>>> --- a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
>>>> +++ b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
>>>> @@ -23,6 +23,10 @@ properties:
>>>>              - enum:
>>>>                  - qcom,qcs615-ethqos
>>>>              - const: qcom,sm8150-ethqos
>>>> +      - items:
>>>> +          - enum:
>>>> +              - qcom,qcs8300-ethqos
>>>> +          - const: qcom,sa8775p-ethqos
>>>
>>> This block should go before earlier qcs615, to keep order by fallback.
> 
> --------------------------------------------------^^^^^^^^^^^^^^^^^^^^^^^
> 
> Here
> 
>>
>> Why this block should positioned before qcs615, given that it comes
>> later in alphabetical order?
> 
> sa < sm

Understood, thanks.

> 
> Best regards,
> Krzysztof
> 

-- 
Best Regards,
Yijie


