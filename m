Return-Path: <linux-arm-msm+bounces-51091-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 189B3A5D720
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 08:15:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 984FA3B81F7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 07:14:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 447941E9B3E;
	Wed, 12 Mar 2025 07:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dFmqcwlN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0ACB1E9B19;
	Wed, 12 Mar 2025 07:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741763706; cv=none; b=mBQYQmskq1yaRyAVoKa0RTkdSSsuehclIkUtOH8HgtMxkqVFVK7UyFrFUkd+bS569USXSWyogP3EFnTtUUeTde5YrENV48yCQKa3WQ1DE8dQ6d6NmIr5UX8vUHUK8q/flOG5eHOSiZFLBf6kejfkBmDelUwLfZsJCgfs7gMJdS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741763706; c=relaxed/simple;
	bh=3UgXwUvS5ovXsvL9suyRaVc7/9nu8hpqEIZchisG56g=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=aLIP6EUCESIefCgFnXdbu3+D1Xjd+6yPfGkBDf3gXCgvAZE6MQpqqZpkfyYTkG/pmMSlV/hluT1htBm7TuW9xjFTyXDWf6sAmN00b3uZUA5qv26UpQ0cq0uIZCKoODRKI0o9HxfdAYfs/JARHmX5A8GgiRSFdrIhhM95IqRq22w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dFmqcwlN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52BMHYBt030595;
	Wed, 12 Mar 2025 07:15:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ej66bK0zaHw7NZa9S5khHiiz2UBHgCUxappUWGxLTq4=; b=dFmqcwlNtLBL3LU1
	sk7w3Op/FIzW1DaqCSEAi1DAL7x4rri6nTJ4w8+4qpJHdhKJZewrs0h9JnPKQ94P
	zYJrpAkbHV6xoG3WC5OJIGxrjyuJdDgyKmuVvlG91t2EX8PN/SmLoOBR9QA3NI9N
	9iRtxBn+INx+u6xzJIq7Ro4M5so+yeuRDS+jGCFiWq+gFlh3pTDXLM0PsAfUchUQ
	tx/rb5/3DQ728//53J3qXrDNWfNF8AEOd16MT1G+fqVRlz2wFqBOi9tdSSlg1ovI
	Rkpe/UO56xjz2oK34O7gWUjUM4LSxUL7lcWsnG+qRDGP37et7BCXIQVLymq1OAgX
	zGn8GQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45au2qhf8h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Mar 2025 07:15:00 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52C7Ex8V019670
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Mar 2025 07:14:59 GMT
Received: from [10.217.216.47] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 12 Mar
 2025 00:14:54 -0700
Message-ID: <ee12d6d8-d9b7-4a8e-add9-3fe43713bd53@quicinc.com>
Date: Wed, 12 Mar 2025 12:44:51 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/8] dt-bindings: clock: qcom,sm8450-videocc: Add MXC
 power domain
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        "Michael Turquette" <mturquette@baylibre.com>,
        Stephen Boyd
	<sboyd@kernel.org>, "Rob Herring" <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        "Conor Dooley" <conor+dt@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        "Satya Priya
 Kakitapalli" <quic_skakitap@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250306-videocc-pll-multi-pd-voting-v2-0-0cd00612bc0e@quicinc.com>
 <lpuuYz9cjRQ3qc_0ZqUQk6SgCgfQ-lSt77HDAxGxNN9oGAQqORCJR2-DVUNcGjyeCqn7QKuLsElBbNDRjGQ1IA==@protonmail.internalid>
 <20250306-videocc-pll-multi-pd-voting-v2-1-0cd00612bc0e@quicinc.com>
 <46b6dbf4-0d2d-4165-8657-7bd8a1329d61@linaro.org>
 <dd68a0f7-6549-476f-acb5-c2d9559950e5@oss.qualcomm.com>
Content-Language: en-US
From: Jagadeesh Kona <quic_jkona@quicinc.com>
In-Reply-To: <dd68a0f7-6549-476f-acb5-c2d9559950e5@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: pAtc8ctmAHizKhacSNoWAdg0uWOxaPte
X-Proofpoint-GUID: pAtc8ctmAHizKhacSNoWAdg0uWOxaPte
X-Authority-Analysis: v=2.4 cv=TIhFS0la c=1 sm=1 tr=0 ts=67d13474 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8
 a=MZmTkVMPX4mW5u8c2wsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-12_02,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 mlxlogscore=999 mlxscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503120047



On 3/11/2025 3:51 PM, Konrad Dybcio wrote:
> On 3/11/25 10:49 AM, Bryan O'Donoghue wrote:
>> On 06/03/2025 08:55, Jagadeesh Kona wrote:
>>> To configure the video PLLs and enable the video GDSCs on SM8450,
>>> SM8475, SM8550 and SM8650 platforms, the MXC rail must be ON along
>>> with MMCX. Therefore, update the videocc bindings to include
>>> the MXC power domain on these platforms.
>>>
>>> Fixes: 1e910b2ba0ed ("dt-bindings: clock: qcom: Add SM8450 video clock controller")
>>> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
>>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>> Acked-by: Rob Herring (Arm) <robh@kernel.org>
>>> ---
>>>   Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml | 9 ++++++---
>>>   1 file changed, 6 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
>>> index 62714fa54db82491a7a108f7f18a253d737f8d61..737efc4b46564c1e475b02873d2dc124329fb775 100644
>>> --- a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
>>> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
>>> @@ -32,9 +32,11 @@ properties:
>>>         - description: Video AHB clock from GCC
>>>
>>>     power-domains:
>>> -    maxItems: 1
>>>       description:
>>> -      MMCX power domain.
>>> +      Power domains required for the clock controller to operate
>>> +    items:
>>> +      - description: MMCX power domain
>>> +      - description: MXC power domain
>>>
>>>     required-opps:
>>>       maxItems: 1
>>> @@ -72,7 +74,8 @@ examples:
>>>         reg = <0x0aaf0000 0x10000>;
>>>         clocks = <&rpmhcc RPMH_CXO_CLK>,
>>>                  <&gcc GCC_VIDEO_AHB_CLK>;
>>> -      power-domains = <&rpmhpd RPMHPD_MMCX>;
>>> +      power-domains = <&rpmhpd RPMHPD_MMCX>,
>>> +                      <&rpmhpd RPMHPD_MXC>;
>>>         required-opps = <&rpmhpd_opp_low_svs>;
>>>         #clock-cells = <1>;
>>>         #reset-cells = <1>;
>>>
>>> -- 
>>> 2.34.1
>>>
>>>
>>
>> The ordering of these patches is a bit weird with this binding first and then the rest of the bindings later.
>>
>> Also switched my linux-arm-msm email recently so only got the first patch with my RB in my Linaro inbox.
>>
>> Suggest as standard practice when you get review feedback to CC previous reviewers on all patches in subsequent series, especially if you are picking up an RB on one of those patches.
>>
>> TL;DR please cc me on V3.
> 
> If you pick up review tags, running b4 prep -c again will CC the folks
> 

Yes, I ran b4 prep --auto-to-cc, but looks like b4 sent the email in CC only if there is an explicit
review tag. For patches that didn't have an explicit review tag, it didn't include in the CC. 

I will ensure to add Bryan in CC for all patches in v3.

Thanks,
Jagadeesh

> Konrad

