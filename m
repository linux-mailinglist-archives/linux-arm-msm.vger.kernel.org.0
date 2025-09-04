Return-Path: <linux-arm-msm+bounces-71991-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BC64EB4350F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 10:12:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7730A1C26ED7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 08:11:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 508452BEFE0;
	Thu,  4 Sep 2025 08:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="o3fLYgWe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6554D284686;
	Thu,  4 Sep 2025 08:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756973480; cv=none; b=Arkrtr8fkgi6BeQZP6NkBieDpT+Xc5YXhrA7WqitPPIyWx/Iz24VgACKAnDsiuKEY3JdXYjM/fj0+S9G7ESx8rcg+lTJx8DN5TLEzabuMx4D1o4Ob+jow+oaxTiCICAy3MNwfpBCAIw99/8tg6IqaB8Slk+AkDKQbSxQEQ/yJd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756973480; c=relaxed/simple;
	bh=iy8a/gP02izhQZSTf3+2KVLactRD7YubRUT8C25fQ8Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=h6Op9yrEnWvfDwmtj9d4U4JBgc+SQXqzuRC4EF4+3Wyasvfhe0ad3W1JH3cEoLc4w/RJtMhpGMrxEgkrirpseAppI+6lM8iPx10tjuTmHnCEeAiNLeuHpyS4jFHm9CNM0CI3thiGeDvHtuM61Lx5Qsiq7FcsK10ndZhYR2hmw4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=o3fLYgWe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5840lrYP005012;
	Thu, 4 Sep 2025 08:11:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fbFDEiAofDxzzQ+CkPlehQCIQyAnfDQaUdpJC0/UytI=; b=o3fLYgWeRBdrFUj3
	LuX+Pdh/BLjya7TfEzq4xYCJDkmwfaULjC7TN0mKdUDl0Ky88aMw9it3tHkSc9JU
	Fw9LKhUjWlMLiug+jPgAQNoCdx+N6ZA8MHEJ4A9lAe2tggPtFhOeM9VKjrBbp3wC
	E9zJ5RoDO4E4EEHByLyGhT/GP5WAUN7A7Q9PjN9agf95vULOEVzLch7tdEaIyzRg
	XnNdLwp5zjuDpsyvnCbD1JJOGjnEuUZH89YO5fNn+12N864IBztH8v3JcSQQGrEr
	h4qz0Dv3bL47uUGwOnmw/ZZReQ74pBoRF8gI6catIh9eor8EQ1HB4cbWwLuqzM4M
	fyP2RA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ur8s6sd9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Sep 2025 08:11:13 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5848B6Dw013542
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 4 Sep 2025 08:11:11 GMT
Received: from [10.218.0.120] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Thu, 4 Sep
 2025 01:07:39 -0700
Message-ID: <295e36e0-0fba-4ccc-bcbe-e7bb5ef95be2@quicinc.com>
Date: Thu, 4 Sep 2025 13:37:35 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V5 2/4] dt-bindings: mmc: controller: Add
 max-sd-hs-frequency property
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Ulf Hansson
	<ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Adrian Hunter
	<adrian.hunter@intel.com>
CC: <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <quic_nguyenb@quicinc.com>, <quic_rampraka@quicinc.com>,
        <quic_pragalla@quicinc.com>, <quic_sayalil@quicinc.com>,
        <quic_nitirawa@quicinc.com>, <quic_bhaskarv@quicinc.com>,
        <kernel@oss.qualcomm.com>
References: <20250903080404.3260135-1-quic_sartgarg@quicinc.com>
 <20250903080404.3260135-3-quic_sartgarg@quicinc.com>
 <8ab42fc2-8a41-458a-92b4-9bcf3842f0e6@kernel.org>
Content-Language: en-US
From: Sarthak Garg <quic_sartgarg@quicinc.com>
In-Reply-To: <8ab42fc2-8a41-458a-92b4-9bcf3842f0e6@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAxOSBTYWx0ZWRfX7sSMyHthyW/w
 wnXjSOjnyPN/09ONyUuMvyfCmzOaIazVRxIFHXfQVBlGZ6VWGXlq9qG6Js4IMA9PeGJrgOUE4FG
 qRbY+1gqL7Xua2REIoDaW4eNBCQ1BxuWv6Fz1pWrNSbfabhrtUYHNSgjyGx31+7VY4JWa9tUS8Z
 OH+coUrjVAWrHIyyYIO4q1Ojlj1RllUtc1AopbGl2ilWN0X+BpBRBYxUBVpuYrqlhPPSGhSSZWe
 M7U5zS67nlj6XZejbTOmF3R3eGGUpxO1mxSWUv+czG6ytBy9njC/MPAXvtW1+eK+HK3w3K7xg56
 nqVU5HIVsyjT5w0y3ojkEqEyf47Y7trSgLK+LR3Zg0TcNEvrbLTBV4RRLnep2G/U2oG1YWG0tP4
 YSsOEF+F
X-Proofpoint-GUID: FUA0_YzqzxBHvWFLUEW6npXKhkDP1VZo
X-Proofpoint-ORIG-GUID: FUA0_YzqzxBHvWFLUEW6npXKhkDP1VZo
X-Authority-Analysis: v=2.4 cv=PNkP+eqC c=1 sm=1 tr=0 ts=68b949a1 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8
 a=w-5Jxv2rGpHsfHC85QcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_02,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300019



On 9/3/2025 1:52 PM, Krzysztof Kozlowski wrote:
> On 03/09/2025 10:04, Sarthak Garg wrote:
>> Some platforms may require limiting the maximum frequency used in SD
>> High-Speed (HS) mode due to board-level hardware constraints. For
>> example, certain boards may include level shifters or other components
>> that cannot reliably operate at the default 50 MHz HS frequency.
>>
>> Introduce a new optional device tree property max-sd-hs-frequency to
>> limit the maximum frequency (in Hz) used for SD cards operating in
>> High-Speed (HS) mode.
>>
>> Signed-off-by: Sarthak Garg <quic_sartgarg@quicinc.com>
>> ---
>>   .../devicetree/bindings/mmc/mmc-controller-common.yaml    | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml b/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
>> index 9a7235439759..d6b785cb2bd9 100644
>> --- a/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
>> +++ b/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
>> @@ -93,6 +93,14 @@ properties:
>>       minimum: 400000
>>       maximum: 384000000
>>   
>> +  max-sd-hs-hz:
>> +    description: |
>> +      Maximum frequency (in Hz) to be used for SD cards operating in
>> +      High-Speed (HS) mode. This is useful for board-specific limitations,
>> +      such as level shifters or others where the card cannot reliably
>> +      operate at the default 50 MHz HS frequency.
>> +    default: 50000000
> 
> no minimum/maximum? If 50 MHz is default, isn't it also an actual max?
> 
> Best regards,
> Krzysztof

I realized I had misinterpreted your earlier comment, which led to the
removal of min/max. I’ll reintroduce them with the following values:

+    minimum: 400000
+    maximum: 50000000
+    default: 50000000

Regarding your comment on V4 — "Don't repeat constraints in free form
text" — just to clarify: are you suggesting that I remove the sentence:

"This is useful for board-specific limitations, such as level shifters
or others where the card cannot reliably operate at the default 50 MHz
HS frequency."

If so, I’ll go ahead and remove it from the bindings.

Best regards,
Sarthak

