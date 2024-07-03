Return-Path: <linux-arm-msm+bounces-25169-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B01AB9262CF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 16:06:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 37D341F233EE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 14:06:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54D7217BB0D;
	Wed,  3 Jul 2024 14:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="D5rgJv8p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DCD41DA318;
	Wed,  3 Jul 2024 14:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720015552; cv=none; b=ahDXKy+99ebVvL3cv+1HrKg6ringF8Oxtg2FcJtgEeI3nFmxtSqkClmdeCAkyJlOmUueaZePafRbO0u1iuCDdsO53EgmRR6/rQtKCE6c6oMRHA6eB7eS6ZoTSAul7rIAyxZL6Ze2iiLa0nZXwBbWpOPdxNSWU6qoQstDW2wCSbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720015552; c=relaxed/simple;
	bh=IWJA0xbv5LS0UA48wEPz9qgicV9yG36KqfKbR7zT/+Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=RRA/SLOh4vd2T5yFXDjgb3janhnBL9Rh4iwSZkQFYvV+wGh7DwIpw5iPD9gmIdy4Hbh5TwOIQZX/txy3g3rpnCO3s7j9tB48ATCyxVQYbkXAGOMJJR7OAMWTntuaQ/hSpG/o9RZgCObe+gpMSlqr5jS0Hgd1NaKVX9uOU5l1zI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=D5rgJv8p; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 463Cn8w1026744;
	Wed, 3 Jul 2024 14:05:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IWJA0xbv5LS0UA48wEPz9qgicV9yG36KqfKbR7zT/+Y=; b=D5rgJv8p8G147a1n
	q9YMjPajXWlZjrtOX/q7nEgT1Ff81wREgtyLY7Xcm+ueYXrkIShqKcndhUdg2lxP
	OExzZzu0o+QYOuvJ1Lmrt1vG9QOryVex2bkUQd7rxSY9uL4M3kUq/nKHzYEVPhSL
	qRLtadb6+HqwtxgjYTl7yRZWmrNumROyZwrlWYcg7Rvz51sXR37Otr+nUUQtJ7VC
	Obe2NhNTj3geUWqW6tFte0oGOKjgR2PxiKC8kE0Ksf3wKAlCQlfKREuo54YCbFXP
	60LKGP3580jxAOunfKkBTGCPnbagfaPbX7EhjIMqsWLspHWj3qsgdOSjxFSfncfk
	xKAHRw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 404yjhs9fm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Jul 2024 14:05:31 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 463E5UWZ008477
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 3 Jul 2024 14:05:30 GMT
Received: from [10.110.36.143] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 3 Jul 2024
 07:05:30 -0700
Message-ID: <0f94978c-dad7-418b-b911-edf7e81d7460@quicinc.com>
Date: Wed, 3 Jul 2024 07:05:29 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V6 5/5] arm64: dts: qcom: x1e80100: Enable cpufreq
To: Sibi Sankar <quic_sibis@quicinc.com>, Johan Hovold <johan@kernel.org>
CC: <sudeep.holla@arm.com>, <cristian.marussi@arm.com>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <jassisinghbrar@gmail.com>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <dmitry.baryshkov@linaro.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <quic_rgottimu@quicinc.com>, <quic_kshivnan@quicinc.com>,
        <conor+dt@kernel.org>, <quic_psodagud@quicinc.com>,
        <abel.vesa@linaro.org>
References: <20240612124056.39230-1-quic_sibis@quicinc.com>
 <20240612124056.39230-6-quic_sibis@quicinc.com>
 <ZoQjAWse2YxwyRJv@hovoldconsulting.com>
 <f53bc00f-8217-1dc8-5203-1a83c24d353d@quicinc.com>
 <1fcea728-6ee6-4361-b3c5-63d8a2facd74@quicinc.com>
 <65ce72e1-7106-0872-88f7-bfdfcef7a24b@quicinc.com>
Content-Language: en-US
From: Nikunj Kela <quic_nkela@quicinc.com>
In-Reply-To: <65ce72e1-7106-0872-88f7-bfdfcef7a24b@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: CwS6XI-x3LlntE0yQ5PZpWbX0Qq0b9KG
X-Proofpoint-ORIG-GUID: CwS6XI-x3LlntE0yQ5PZpWbX0Qq0b9KG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-03_09,2024-07-03_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 mlxlogscore=999 clxscore=1015 lowpriorityscore=0 suspectscore=0
 malwarescore=0 mlxscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407030104


On 7/3/2024 4:23 AM, Sibi Sankar wrote:
>
>
> On 7/3/24 01:43, Nikunj Kela wrote:
>>
>> On 7/2/2024 12:59 PM, Sibi Sankar wrote:
>>>
>>>
>>> On 7/2/24 21:25, Johan Hovold wrote:
>>>> On Wed, Jun 12, 2024 at 06:10:56PM +0530, Sibi Sankar wrote:
>>>>> Enable cpufreq on X1E80100 SoCs through the SCMI perf protocol node.
>>>>>
>>>>> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
>>>>> ---
>>>>>    arch/arm64/boot/dts/qcom/x1e80100.dtsi | 63
>>>>> ++++++++++++++++----------
>>>>>    1 file changed, 39 insertions(+), 24 deletions(-)
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
>>>>> b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
>>>>> index 7b619db07694..d134dc4c7425 100644
>>>>> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
>>>>> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
>>>>> @@ -69,8 +69,8 @@ CPU0: cpu@0 {
>>>>>                reg = <0x0 0x0>;
>>>>>                enable-method = "psci";
>>>>>                next-level-cache = <&L2_0>;
>>>>> -            power-domains = <&CPU_PD0>;
>>>>> -            power-domain-names = "psci";
>>>>> +            power-domains = <&CPU_PD0>, <&scmi_dvfs 0>;
>>>>> +            power-domain-names = "psci", "perf";
>>>>>                cpu-idle-states = <&CLUSTER_C4>;
>>>>
>>>>> +        scmi {
>>>>> +            compatible = "arm,scmi";
>>>>> +            mboxes = <&cpucp_mbox 0>, <&cpucp_mbox 2>;
>>>>> +            mbox-names = "tx", "rx";
>>>>> +            shmem = <&cpu_scp_lpri0>, <&cpu_scp_lpri1>;
>>>>> +
>>>>> +            #address-cells = <1>;
>>>>> +            #size-cells = <0>;
>>>>> +
>>>>> +            scmi_dvfs: protocol@13 {
>>>>> +                reg = <0x13>;
>>>>> +                #power-domain-cells = <1>;
>>>>> +            };
>>>>> +        };
>>>>>        };
>>>>
>>>
>>> Hey Johan,
>>>
>>> Thanks for trying out the series.
>>>
>>>> This series gives a nice performance boost on the x1e80100 CRD, but
>>>> I'm
>>>> seeing a bunch of warnings and errors that need to be addressed:
>>>>
>>>> [    9.533053] arm-scmi firmware:scmi: Failed to get FC for protocol
>>>> 13 [MSG_ID:6 / RES_ID:0] - ret:-95. Using regular messaging.
>>>> [    9.549458] arm-scmi firmware:scmi: Failed to add opps_by_lvl at
>>>> 3417600 for NCC - ret:-16
>>>> [    9.563925] arm-scmi firmware:scmi: Failed to add opps_by_lvl at
>>>> 3417600 for NCC - ret:-16
>>>> [    9.572835] arm-scmi firmware:scmi: Failed to get FC for protocol
>>>> 13 [MSG_ID:6 / RES_ID:1] - ret:-95. Using regular messaging.
>>>> [    9.609471] arm-scmi firmware:scmi: Failed to add opps_by_lvl at
>>>> 3417600 for NCC - ret:-16
>>>> [    9.633341] arm-scmi firmware:scmi: Failed to add opps_by_lvl at
>>>> 3417600 for NCC - ret:-16
>>>> [    9.650000] arm-scmi firmware:scmi: Failed to get FC for protocol
>>>> 13 [MSG_ID:6 / RES_ID:2] - ret:-95. Using regular messaging.
>>>
>>> X1E uses fast channels only for message-id: 7 (level set) and regular
>>> channels for all the other messages. The spec doesn't mandate fast
>>> channels for any of the supported message ids for the perf protocol.
>>> So nothing to fix here.
>>>
>>>> [    9.727098] cpu cpu4: _opp_is_duplicate: duplicate OPPs detected.
>>>> Existing: freq: 3417600000, volt: 0, enabled: 1. New: freq:
>>>> 3417600000, volt: 0, enabled: 1
>>>> [    9.737157] cpu cpu4: _opp_is_duplicate: duplicate OPPs detected.
>>>> Existing: freq: 3417600000, volt: 0, enabled: 1. New: freq:
>>>> 3417600000, volt: 0, enabled: 1
>>>> [    9.875039] cpu cpu8: _opp_is_duplicate: duplicate OPPs detected.
>>>> Existing: freq: 3417600000, volt: 0, enabled: 1. New: freq:
>>>> 3417600000, volt: 0, enabled: 1
>>>> [    9.888428] cpu cpu8: _opp_is_duplicate: duplicate OPPs detected.
>>>> Existing: freq: 3417600000, volt: 0, enabled: 1. New: freq:
>>>> 3417600000, volt: 0, enabled: 1
>>>
>>> The duplicate entries reported by the perf protocol come directly from
>>> the speed bins. I was told the duplicate entry with volt 0 is meant to
>>> indicate a lower power way of achieving the said frequency at a lower
>>> core count. We have no way of using it in the kernel and it gets safely
>>> discarded. So again nothing to fix in the kernel.
>>
>> Hi Sibi,
>>
>> Can you try increasing the max_msg_size to 256 bytes in mailbox
>> transport? We saw the same issue but got resolved by increasing the
>> max_msg_size for the transport(obviously, I reduced the max_msg to 10 to
>> keep the total shmem size same). Even the opps_by_lvl warning went away
>> with this for us.
>
> Nikunj,
> Thanks for taking time to review the series :)
>
> Not sure if we are talking about the same things here, are you
> suggesting that tweaking with the max_msg size will stop the SCMI
> controller from reporting duplicate OPPs? Even if it does go away
> magically wouldn't it mean you are dropping messages? Also opps_by_lvl
> failing with -16 and duplicate opps detected in the opp core have the
> same root cause i.e. duplicate entries reported by the controller.


Sibi,

My observation was that only 12 OPPs could fit it 128bytes msg_size and
our platform was sending 16 OPPs in one go. OPPs above 12 were getting
clobbered so the duplicate warning/error were not genuine. You may need
to tweak platform to send only 12(or less) OPPs in one go.


>
>>
>> Thanks,
>>
>> -Nikunj
>>
>>>
>>>> [    9.913506] debugfs: Directory 'NCC' with parent 'pm_genpd'
>>>> already present!
>>>> [    9.922198] debugfs: Directory 'NCC' with parent 'pm_genpd'
>>>> already present!
>>>
>>> Yeah I did notice ^^ during dev, the series isn't the one
>>> introducing it
>>> so it shouldn't block the series acceptance. Meanwhile I'll spend some
>>> cycles to get this warn fixed.
>
> Johan,
>
> https://lore.kernel.org/lkml/20240703110741.2668800-1-quic_sibis@quicinc.com/
>
>
> Posted a fix for the warn ^^
>
>>>
>>> -Sibi
>>>
>>>>
>>>> Johan
>>>>

