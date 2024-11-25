Return-Path: <linux-arm-msm+bounces-39142-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE009D8DB9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2024 22:15:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 23F4F2864A6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2024 21:15:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2367418E368;
	Mon, 25 Nov 2024 21:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="FP97FTA6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C7E029CF0;
	Mon, 25 Nov 2024 21:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732569348; cv=none; b=hv2e9UoQ67ANdoj8z3ZEtnZY3pr91f2JQ/xOq2X2zJZAOTPTC0OsXUcG+wKdUF06LFy1CZ+xGySc5/niXh0WUthYvZzCjuftXaX3/EZNjEJQvZZ+zNRDZdYhinMDRHlE7JZBmwFOuJTeHB2luskolQDU5ejVWU9gk8Mpfk6+Djk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732569348; c=relaxed/simple;
	bh=gZUSQSvzc5YB54ywrjqYGNjPec8n8bTjZdHFTF+U4ZQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=FNf06gCxuyLqFnLkKuCUm9zvBjg3uuc2Lb8gzedoxYvyIBGoknuBKesEfe22B+Nl86FxSpc5Wd5QdFvH+7vFzhmsuyu6liDxtZOoQmN3HcwAgnSIlCpXRNHicCZMn3rmKvmb61Srq0bx7UItkjdDqL+y6BSVUB6GXMRkLmkGzjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=FP97FTA6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4APElRuv010591;
	Mon, 25 Nov 2024 21:15:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aRy7i9uA1euDkAdBW7ircoYxa+MN9A0sO7imEMW1MRs=; b=FP97FTA6tVsbL+e8
	N2N9koDUg/N8D51CEBTxavLCzam3xpGOugoTwfhe39+/F57Gy/+tXE3kr/WtGaOP
	zspKC3/urcUIMb0nmDUl+b+tq3nejc9Exo5RFqv8NY35SDw7cGYChNV/jT65VsSF
	/Yakx4VaiyZcNyZGROFERachBRKp/FTjcPLoJW/ikD+/VGyCgU+GGkEwl5+0KwyO
	ii4wE77yyRWsay+Ehy1q//k+jJ7pqx3XQ41/RafwZ+ThRwQ39qqLHmtp5haGY5JM
	Pgrh8j3WR/1Qxf34/qXEDJyfREZTbD7iTrNQItH3cPLeiWj/6wSne4JXwP74zuVR
	qNlb+g==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 434mx729v4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 21:15:41 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4APLFemB029058
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 21:15:40 GMT
Received: from [10.71.111.113] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 25 Nov
 2024 13:15:40 -0800
Message-ID: <a76a8f0e-9710-4312-b399-2ab907c08a57@quicinc.com>
Date: Mon, 25 Nov 2024 13:15:40 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] dt-bindings: clock: qcom: Add SM8750 GCC
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Trilok Soni
	<quic_tsoni@quicinc.com>,
        Satya Durga Srinivasu Prabhala
	<quic_satyap@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20241112002807.2804021-1-quic_molvera@quicinc.com>
 <20241112002807.2804021-5-quic_molvera@quicinc.com>
 <vzu23hoou5rbcucrsnauq4ygxmqzuonyvxvnarsgxycc7wrnro@vpxauk6zmq36>
Content-Language: en-US
From: Melody Olvera <quic_molvera@quicinc.com>
In-Reply-To: <vzu23hoou5rbcucrsnauq4ygxmqzuonyvxvnarsgxycc7wrnro@vpxauk6zmq36>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: W1FQ7tyF1K3GLgFS5QbMEhJ6HH8kSSgr
X-Proofpoint-ORIG-GUID: W1FQ7tyF1K3GLgFS5QbMEhJ6HH8kSSgr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 mlxlogscore=992 malwarescore=0 adultscore=0 spamscore=0 mlxscore=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411250176



On 11/20/2024 12:17 AM, Krzysztof Kozlowski wrote:
> On Mon, Nov 11, 2024 at 04:28:04PM -0800, Melody Olvera wrote:
>> From: Taniya Das <quic_tdas@quicinc.com>
>>
>> Add bindings documentation for the SM8750 General Clock Controller.
> Subject prefix - use proper file prefix:
> dt-bindings: clock: qcom,sm8650-gcc:
>
>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
>> ---
>>   .../bindings/clock/qcom,sm8650-gcc.yaml       |   8 +-
>>   include/dt-bindings/clock/qcom,sm8750-gcc.h   | 226 ++++++++++++++++++
>>   2 files changed, 232 insertions(+), 2 deletions(-)
>>   create mode 100644 include/dt-bindings/clock/qcom,sm8750-gcc.h
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8650-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8650-gcc.yaml
>> index 976f29cce809..e50b5f1cad75 100644
>> --- a/Documentation/devicetree/bindings/clock/qcom,sm8650-gcc.yaml
>> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8650-gcc.yaml
>> @@ -13,11 +13,15 @@ description: |
>>     Qualcomm global clock control module provides the clocks, resets and power
>>     domains on SM8650
>>   
>> -  See also:: include/dt-bindings/clock/qcom,sm8650-gcc.h
>> +  See also: include/dt-bindings/clock/qcom,sm8650-gcc.h
>> +            include/dt-bindings/reset/qcom,sm8750-gcc.h
>>   
>>   properties:
>>     compatible:
>> -    const: qcom,sm8650-gcc
>> +    items:
> No need for items, simpler is just enum.
>
>> +      - enum:
>> +          - qcom,sm8650-gcc
>> +          - qcom,sm8750-gcc
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Hey Krzysztof; I want to draw you attention to the discussion on patch 
v2 5/7 of this series;
We realized these bindings don't match with the driver; notably SM8750 
doesn't have the
pcie1 clocks available on SM8650. To this end, it seems prudent to bring 
back the separate
bindings file from ps 1.

Thanks,
Melody

