Return-Path: <linux-arm-msm+bounces-43287-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C0ED9FC44C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Dec 2024 09:59:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AD4007A15A7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Dec 2024 08:59:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28C10153BE4;
	Wed, 25 Dec 2024 08:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VsTdLU8E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04F5F14375D;
	Wed, 25 Dec 2024 08:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735117139; cv=none; b=d0A4Nm+9npCXXRL3nFPbiaaABrN0IntLydbOUK4nPpiE2EVwII41FqUFlXSUxU9oisZwUMjrC9sGa0JWVeKAkHBbYAbb5BcR88IGuSx0EXz5TY2hzduK68G4Lh/b1v2WwWm34Ju8kcNjHIWVPiZVezT5vlYy/KMPcz0U7lT/iYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735117139; c=relaxed/simple;
	bh=Zt5drrb8UXVl8I3E41RTAwx84QcpD4ng9X2NRmssKGA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Rvxd/aTiXOUKXF87OpbAo0ZzrPuxoufChan63YRXgaNVid5naZ7HwAA4CN0eAfsSK4kv0LeZHNadHwF0DMdXtQZYJeNJegwQoQ5CxFiONMo8OIPOJxOTHK1fQuXi613F8ow0gMOD2kbBmYSjBxBQBiaGBZXa9PPUD+2Q/+i6Dzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VsTdLU8E; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BP3nK3V018158;
	Wed, 25 Dec 2024 08:58:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+84ak5BMOs6fQ03Y5n5T+59bI7OqN2ndVO++05hIb5Q=; b=VsTdLU8E/qgPevzO
	7IxPY04pADCwHxwJ+28ZkDJ2eHejXgc3wJeL6pBiXgRWETDqSWuOQCuKvoQldmww
	NEPCakAR1jaQfHJsHRVExOB/4kSFs9AkPAlZm9qU40Ih6rav02FMPldacpOjutow
	eNbrfzydSc952JlGXUVcltCTaHDlfQaTSdfXBo+qELzMSWp/QA+cKI5wixV7wZtu
	bILYZBpojS7mpaEnKY5uDOiOacZ0gUhhjA0dPI5brWUhOzr6URA0+pOFY7qyyVqa
	hOkwzuID/3oRFccY0mHPfvsxW29qfnA5+J5kHD7mz98hhbvhTJxlp/F3KOGB/Bj4
	js5SBw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43rafqhep9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Dec 2024 08:58:29 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BP8wS50017673
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Dec 2024 08:58:28 GMT
Received: from [10.253.36.144] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 25 Dec
 2024 00:58:23 -0800
Message-ID: <f68524de-7a56-4cc6-a9ab-13dbae0ee0e5@quicinc.com>
Date: Wed, 25 Dec 2024 16:58:20 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: net: qcom,ethqos: Drop fallback
 compatible for qcom,qcs615-ethqos
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Vinod Koul
	<vkoul@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
	<davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Alexandre
 Torgue <alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro
	<peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>
CC: <netdev@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
References: <20241224-schema-v2-0-000ea9044c49@quicinc.com>
 <20241224-schema-v2-1-000ea9044c49@quicinc.com>
 <7813f2b0-e76a-463c-91f9-c0bd50da1f0a@linaro.org>
Content-Language: en-US
From: Yijie Yang <quic_yijiyang@quicinc.com>
In-Reply-To: <7813f2b0-e76a-463c-91f9-c0bd50da1f0a@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: IVHVoiiAqplRni58Im16n0lJMU1912ZT
X-Proofpoint-GUID: IVHVoiiAqplRni58Im16n0lJMU1912ZT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 malwarescore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412250078



On 2024-12-24 17:02, Krzysztof Kozlowski wrote:
> On 24/12/2024 04:07, Yijie Yang wrote:
>> The core version of EMAC on qcs615 has minor differences compared to that
>> on sm8150. During the bring-up routine, the loopback bit needs to be set,
>> and the Power-On Reset (POR) status of the registers isn't entirely
>> consistent with sm8150 either.
>> Therefore, it should be treated as a separate entity rather than a
>> fallback option.
> 
> ... and explanation of ABI impact? You were asked about this last time,
> so this is supposed to end up here.

I actually replied to this query last time, but maybe it wasn't clear. 
Firstly, no one is using Ethernet on this platform yet. Secondly, the 
previous fallback to sm8150 is incorrect and causes packet loss. 
Instead, it should fall back to qcs404.

> 
>>
>> Fixes: 32535b9410b8 ("dt-bindings: net: qcom,ethqos: add description for qcs615")
>> Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
>> ---
>>   Documentation/devicetree/bindings/net/qcom,ethqos.yaml | 5 +----
>>   1 file changed, 1 insertion(+), 4 deletions(-)
> Best regards,
> Krzysztof

-- 
Best Regards,
Yijie


