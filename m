Return-Path: <linux-arm-msm+bounces-48839-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B9FC7A3F022
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 10:25:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B959219C6038
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 09:24:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26FE02045A3;
	Fri, 21 Feb 2025 09:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="aBJl9f+Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A70200BBF;
	Fri, 21 Feb 2025 09:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740129786; cv=none; b=lJC3mpXnZbCmyCA4HAfaix1WxDS0H6mlSi6PU8lu6K/0U/snNU2+C3WxXRGAE9koIxaDsUKktfvaHaE4WtWTLmr0LMncKGxE3vyRso9BcoOkgO/X1Vqta9OExdUlCIl9VEfnWd2t9AF8dALaYMMKFoW/Liq9orIQBvVl6Xb3jLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740129786; c=relaxed/simple;
	bh=xBKnQrbFq+DZ81DeESCjTS/8FxFGSDzN45oZZOj+6XU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ULuIMS1QGPE7NoNzgnXTxscxZ9jMQDrr8io1SIxrJaHQ5rEJ8DaNWZ4ybA3YfOWze3pSJ4ajqSNMXoN+isP73ZyXvjOov5BfQggogJoA7kVIeCQPUr2b1+m496JH1ogXEouXpsRe8Omt9PmJAQ8nklTEZpGMH4HV415Ta8AjGQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=aBJl9f+Y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51L8pGeL011936;
	Fri, 21 Feb 2025 09:23:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FIGvqXYsEca9hsO6i4pUmiiXqNZHW9zFCMAy+11jNx4=; b=aBJl9f+Y8+E0Y5Lk
	8dTprqz6Arnwq/xmzdUlYaFz0xcdzO1B8PQ8Jl9rqdAQiGfu/qFvJbAFiFLC8bOv
	gNDlG30UyRqTWHTC9/5OmKzYjtbzCWRo0ey853UBxMVMC8Ar3zrGF6CUyrKpLvfD
	RrZ/MmiBn27iCKza85cdKpICZt/cnJvXruWzpjrZgoOO+1I31j96rBTBAJFKTtPZ
	7iDQPwy26oCyimHnEWQLleyuMLqQY73ZZPZkQ2DPhi3aSAIXAEgpMU9zR5G7yzzx
	EMv2RDVAwpPLrEOAC/wx/POH8QQIg1rV/iV2higCIzxz2bs+CfKP+bbXg/utpuzn
	gtjUwg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44x2xbbm54-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Feb 2025 09:23:00 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51L9N0P1017344
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Feb 2025 09:23:00 GMT
Received: from [10.217.216.53] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 21 Feb
 2025 01:22:55 -0800
Message-ID: <cc72420c-65f1-4ea7-a702-60188c89aa64@quicinc.com>
Date: Fri, 21 Feb 2025 14:52:52 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] dt-bindings: clock: qcom: Add compatible for
 QCM6490 boards
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey
	<quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        "Jagadeesh Kona" <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250220-lpass_qcm6490_resets-v4-0-68dbed85c485@quicinc.com>
 <20250220-lpass_qcm6490_resets-v4-1-68dbed85c485@quicinc.com>
 <20250221-rainbow-goldfish-of-masquerade-7d7627@krzk-bin>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <20250221-rainbow-goldfish-of-masquerade-7d7627@krzk-bin>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: B3slYTwysz-VbHc3mgaBmrIGPFpl7txn
X-Proofpoint-ORIG-GUID: B3slYTwysz-VbHc3mgaBmrIGPFpl7txn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-21_01,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 spamscore=0
 mlxlogscore=999 clxscore=1015 priorityscore=1501 adultscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2502210071



On 2/21/2025 2:50 PM, Krzysztof Kozlowski wrote:
> On Thu, Feb 20, 2025 at 09:52:50AM +0530, Taniya Das wrote:
>> Add the new QCM6490 compatible to support the reset functionality for
>> Low Power Audio subsystem.
>>
>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>> ---
>>  Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscorecc.yaml | 5 ++++-
>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscorecc.yaml b/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscorecc.yaml
>> index 488d63959424088ede67835eb4dcf3feef6d0848..64efb2c533d1e71a9bdc3bf0d245b00cec00841a 100644
>> --- a/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscorecc.yaml
>> +++ b/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscorecc.yaml
>> @@ -20,6 +20,7 @@ description: |
>>  properties:
>>    compatible:
>>      enum:
>> +      - qcom,qcm6490-lpassaudiocc
>>        - qcom,sc7280-lpassaoncc
>>        - qcom,sc7280-lpassaudiocc
>>        - qcom,sc7280-lpasscorecc
>> @@ -68,7 +69,9 @@ allOf:
>>        properties:
>>          compatible:
>>            contains:
>> -            const: qcom,sc7280-lpassaudiocc
>> +            enum:
>> +              - qcom,sc7280-lpassaudiocc
>> +              - qcom,qcm6490-lpassaudiocc
> 
> Alphabetical order... although now I question whether these are
> compatible. Nothing in commit msg explains this, but it should.
> 

Sure, I will add the details of why we need this in the commit.

> Best regards,
> Krzysztof
> 


