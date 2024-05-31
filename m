Return-Path: <linux-arm-msm+bounces-21225-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 734048D5E3A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 11:28:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2F24828717C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 09:28:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1503479945;
	Fri, 31 May 2024 09:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="iNy2pgJ6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E537710F;
	Fri, 31 May 2024 09:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717147734; cv=none; b=Wzl/gVZxsu0QhokeYJ/ZQPanj9nscVKZJRmNOfo3B376Y5TznbYzjKWb1jJhp71PPYrm7PKxio0vmGZ4mlEpNN7ecaeiCViQaJ39wXzw04LqKwvHJLfg3J/5pu1HPdm443SzP4PK4wV75Lj4uz+jmxnlkNY+KvzrJ57UDF8OK2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717147734; c=relaxed/simple;
	bh=kwImjdse1mZhW7DoFJ7ZUMIRINFQPVXqHwRakinZky0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=PhknVEbJtGI7ydmO44BGIvsjY9l0AK/ojGVr6Ur6AIW2ZgrA9XZu+YrDWHpMl6ebeaAguda8leeQI0QseMj1BWYZA3X6h+vo6u6HqOSQdHk/ne3IgLS0C2ZWPmaa2Ng5uve14evDJgKSL/c+FiWNQnNUnM8807NtnrCS3zJNllM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=iNy2pgJ6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44UMJ8ev015725;
	Fri, 31 May 2024 09:28:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DrkJ8VGp0AIj0xrO8UdAlwyPqrhHczKNhYKiCx3vpSg=; b=iNy2pgJ61W4dDfci
	PRRdZ8CMBijFf4Qzb4TgpRKXigWPhwKWVY1+Se3jtCoI1D6npJofbVegUghz3nHB
	HchQDxmUPSH0jKXftRQLov47rxaNR5bo1Fyg/Vw2WBZdhkPS+1GbzpqDM8uAggSY
	h9phvwyunAYN8mOnwooRn5wUcIl3R//hLbyYvAy1r2Mdx7mNyR056emYwEuRQ4r1
	viSrLzV8oHU3FPVuZf51Suyi65YKzuC2oxVBhJltFB7dgJDTq5FuysysGATLxRWz
	rbT3djWOtpJtaqugU5VdqPZA19Ggj+LBGpUABmDh7FBAJHMg69kB/s+RVlHNQXJP
	mru3+g==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yba0qpfjb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 09:28:47 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44V9SkWp005057
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 09:28:46 GMT
Received: from [10.217.216.152] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 31 May
 2024 02:28:41 -0700
Message-ID: <d66ed568-8264-4430-a070-f353879f6b65@quicinc.com>
Date: Fri, 31 May 2024 14:58:38 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/8] dt-bindings: clock: qcom: Add compatible for
 QCM6490 boards
To: Luca Weiss <luca.weiss@fairphone.com>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring
	<robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <20240318053555.20405-1-quic_tdas@quicinc.com>
 <20240318053555.20405-2-quic_tdas@quicinc.com>
 <CZWOT0K3AE2F.1BUND7M9Q5RXO@fairphone.com>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <CZWOT0K3AE2F.1BUND7M9Q5RXO@fairphone.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ecrxHHs6mvSRBALYkbwQDCQB02OHrjV0
X-Proofpoint-ORIG-GUID: ecrxHHs6mvSRBALYkbwQDCQB02OHrjV0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-31_05,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1011 mlxscore=0
 mlxlogscore=999 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405310069



On 3/18/2024 12:41 PM, Luca Weiss wrote:
> On Mon Mar 18, 2024 at 6:35 AM CET, Taniya Das wrote:
>> Add the new QCM6490 compatible to support the reset functionality for
>> Low Power Audio subsystem.
>>
>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>> ---
>>   .../devicetree/bindings/clock/qcom,sc7280-lpasscorecc.yaml       | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscorecc.yaml b/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscorecc.yaml
>> index deee5423d66e..861b41933525 100644
>> --- a/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscorecc.yaml
>> +++ b/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscorecc.yaml
>> @@ -30,6 +30,7 @@ properties:
>>         - qcom,sc7280-lpassaudiocc
>>         - qcom,sc7280-lpasscorecc
>>         - qcom,sc7280-lpasshm
>> +      - qcom,qcm6490-lpassaudiocc
> 
> So QCM6490 and SM7325 and SC7280 with non-CrOS firmware (maybe some WoA
> devices?) are supposed to use qcom,qcm6490-lpassaudiocc then? Is this
> what is intended?
> 

Sorry for the very late response on this thread, On QCM6490-IPD and 
QCS690-RB3Gen2 boards, will require only reset functionality for Low 
Power Audio subsystem and other clock controller functionality is not 
supported from HLOS, as LPASS firmware takes care of it.
Hence added new compatible to support only resets.

> Regards
> Luca
> 
>>
>>     power-domains:
>>       maxItems: 1
>> --
>> 2.17.1
> 

-- 
Thanks & Regards,
Taniya Das.

