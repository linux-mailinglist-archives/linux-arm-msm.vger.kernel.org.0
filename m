Return-Path: <linux-arm-msm+bounces-25264-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C6D9273EA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jul 2024 12:22:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3FDEC1F210D0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jul 2024 10:22:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E5C71AB8FC;
	Thu,  4 Jul 2024 10:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="p1MfI5Sj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A50A41;
	Thu,  4 Jul 2024 10:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720088558; cv=none; b=GfX6vLsTjldUVPyvrfEAkmE1iEcArPSoYkBvbXNukEeJnmKQNDZPPLMkKlsgcLINMJLVUxKkeZ2KDV/lDqMJx4HMDKRUjQQA74QfEwL6kbsHhSHDXIYc0sht/18DFIE8s3XPeLgrmvkp0qux531kRj6+RHBys521LJBUr3o1OyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720088558; c=relaxed/simple;
	bh=RrseeKsIw4zTkLal4NO5ir7XI5QFiSYTEFrSIo6M9BQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=H8hMU1xiWOMwAkvPvLlif3swMJpAn/BmSLL+qP8m+pc24q50XAOGBl0JN5FFTC/DWaXzOnzpxvF6iEoQhPQ3AHLxJ6OcuoACDtFqZFxaxmv8wCJJ9F0tSA1ZATuQ9pI60P7E/Fi54k2tUY9eISHTMERO9J4gEuhhEjjZsNu0gIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=p1MfI5Sj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4645jbXH023219;
	Thu, 4 Jul 2024 10:22:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9cggr0TA87Qww/pVCkSy8RIFZHHrOSFsCB8KjZ4LaSw=; b=p1MfI5Sjpuxh6qvm
	n5C5jf4rkOxCNkzdjfKjFf+/Ki6P2ezZlNWC6m/TmzUKr7sOpk95jH7fpONx4uR6
	Rex9C3NeA3X6i9kP/6S6Ef9esRDvRqwkG7bbkaxN+9tayhCYMIXeZis6b/qPyTau
	yRwJI8KASfxb+PK/7K3k0LFc9evNDLudMlQvcPYkq1w3CjT8xWbWbgQd52BJJZZc
	jI1NNrYz5kdewiZe47FOsXkDjcngRQsVFNH5rhhxbS457xhcBIpLxAnNn9myguG8
	GlnZ7MR/eLbMUCYv512tIdon2rEh8/ud8w49yse0nfwV1Dg5sDswotw+TjYNFyUE
	iwRKxw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4050cybd1d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Jul 2024 10:22:20 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 464AMJ4o027188
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 4 Jul 2024 10:22:19 GMT
Received: from [10.131.33.37] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 4 Jul 2024
 03:22:13 -0700
Message-ID: <e647ae63-2f30-c55f-7124-ecef1d0d74d3@quicinc.com>
Date: Thu, 4 Jul 2024 15:52:10 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH V6 5/5] arm64: dts: qcom: x1e80100: Enable cpufreq
Content-Language: en-US
To: Nikunj Kela <quic_nkela@quicinc.com>, Johan Hovold <johan@kernel.org>
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
 <0f94978c-dad7-418b-b911-edf7e81d7460@quicinc.com>
From: Sibi Sankar <quic_sibis@quicinc.com>
In-Reply-To: <0f94978c-dad7-418b-b911-edf7e81d7460@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: R77jCa3RnW-CSyz4PketkcN7Pd0I10S2
X-Proofpoint-ORIG-GUID: R77jCa3RnW-CSyz4PketkcN7Pd0I10S2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-04_06,2024-07-03_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 mlxlogscore=999 priorityscore=1501 adultscore=0 mlxscore=0 impostorscore=0
 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2406140001
 definitions=main-2407040072



On 7/3/24 19:35, Nikunj Kela wrote:
> 
> On 7/3/2024 4:23 AM, Sibi Sankar wrote:
>>
>>
>> On 7/3/24 01:43, Nikunj Kela wrote:
>>>
>>> On 7/2/2024 12:59 PM, Sibi Sankar wrote:
>>>>
>>>>
>>>> On 7/2/24 21:25, Johan Hovold wrote:
>>>>> On Wed, Jun 12, 2024 at 06:10:56PM +0530, Sibi Sankar wrote:
>>>>>> Enable cpufreq on X1E80100 SoCs through the SCMI perf protocol node.
>>>>>>
>>>>>> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
>>>>>> ---
>>>>>>     arch/arm64/boot/dts/qcom/x1e80100.dtsi | 63
>>>>>> ++++++++++++++++----------
>>>>>>     1 file changed, 39 insertions(+), 24 deletions(-)
>>>>>>
>>>>>> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
>>>>>> b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
>>>>>> index 7b619db07694..d134dc4c7425 100644
>>>>>> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
>>>>>> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
>>>>>> @@ -69,8 +69,8 @@ CPU0: cpu@0 {
>>>>>>                 reg = <0x0 0x0>;
>>>>>>                 enable-method = "psci";
>>>>>>                 next-level-cache = <&L2_0>;
>>>>>> -            power-domains = <&CPU_PD0>;
>>>>>> -            power-domain-names = "psci";
>>>>>> +            power-domains = <&CPU_PD0>, <&scmi_dvfs 0>;
>>>>>> +            power-domain-names = "psci", "perf";
>>>>>>                 cpu-idle-states = <&CLUSTER_C4>;
>>>>>
>>>>>> +        scmi {
>>>>>> +            compatible = "arm,scmi";
>>>>>> +            mboxes = <&cpucp_mbox 0>, <&cpucp_mbox 2>;
>>>>>> +            mbox-names = "tx", "rx";
>>>>>> +            shmem = <&cpu_scp_lpri0>, <&cpu_scp_lpri1>;
>>>>>> +
>>>>>> +            #address-cells = <1>;
>>>>>> +            #size-cells = <0>;
>>>>>> +
>>>>>> +            scmi_dvfs: protocol@13 {
>>>>>> +                reg = <0x13>;
>>>>>> +                #power-domain-cells = <1>;
>>>>>> +            };
>>>>>> +        };
>>>>>>         };
>>>>>
>>>>
>>>> Hey Johan,
>>>>
>>>> Thanks for trying out the series.
>>>>
>>>>> This series gives a nice performance boost on the x1e80100 CRD, but
>>>>> I'm
>>>>> seeing a bunch of warnings and errors that need to be addressed:
>>>>>
>>>>> [    9.533053] arm-scmi firmware:scmi: Failed to get FC for protocol
>>>>> 13 [MSG_ID:6 / RES_ID:0] - ret:-95. Using regular messaging.
>>>>> [    9.549458] arm-scmi firmware:scmi: Failed to add opps_by_lvl at
>>>>> 3417600 for NCC - ret:-16
>>>>> [    9.563925] arm-scmi firmware:scmi: Failed to add opps_by_lvl at
>>>>> 3417600 for NCC - ret:-16
>>>>> [    9.572835] arm-scmi firmware:scmi: Failed to get FC for protocol
>>>>> 13 [MSG_ID:6 / RES_ID:1] - ret:-95. Using regular messaging.
>>>>> [    9.609471] arm-scmi firmware:scmi: Failed to add opps_by_lvl at
>>>>> 3417600 for NCC - ret:-16
>>>>> [    9.633341] arm-scmi firmware:scmi: Failed to add opps_by_lvl at
>>>>> 3417600 for NCC - ret:-16
>>>>> [    9.650000] arm-scmi firmware:scmi: Failed to get FC for protocol
>>>>> 13 [MSG_ID:6 / RES_ID:2] - ret:-95. Using regular messaging.
>>>>
>>>> X1E uses fast channels only for message-id: 7 (level set) and regular
>>>> channels for all the other messages. The spec doesn't mandate fast
>>>> channels for any of the supported message ids for the perf protocol.
>>>> So nothing to fix here.
>>>>
>>>>> [    9.727098] cpu cpu4: _opp_is_duplicate: duplicate OPPs detected.
>>>>> Existing: freq: 3417600000, volt: 0, enabled: 1. New: freq:
>>>>> 3417600000, volt: 0, enabled: 1
>>>>> [    9.737157] cpu cpu4: _opp_is_duplicate: duplicate OPPs detected.
>>>>> Existing: freq: 3417600000, volt: 0, enabled: 1. New: freq:
>>>>> 3417600000, volt: 0, enabled: 1
>>>>> [    9.875039] cpu cpu8: _opp_is_duplicate: duplicate OPPs detected.
>>>>> Existing: freq: 3417600000, volt: 0, enabled: 1. New: freq:
>>>>> 3417600000, volt: 0, enabled: 1
>>>>> [    9.888428] cpu cpu8: _opp_is_duplicate: duplicate OPPs detected.
>>>>> Existing: freq: 3417600000, volt: 0, enabled: 1. New: freq:
>>>>> 3417600000, volt: 0, enabled: 1
>>>>
>>>> The duplicate entries reported by the perf protocol come directly from
>>>> the speed bins. I was told the duplicate entry with volt 0 is meant to
>>>> indicate a lower power way of achieving the said frequency at a lower
>>>> core count. We have no way of using it in the kernel and it gets safely
>>>> discarded. So again nothing to fix in the kernel.
>>>
>>> Hi Sibi,
>>>
>>> Can you try increasing the max_msg_size to 256 bytes in mailbox
>>> transport? We saw the same issue but got resolved by increasing the
>>> max_msg_size for the transport(obviously, I reduced the max_msg to 10 to
>>> keep the total shmem size same). Even the opps_by_lvl warning went away
>>> with this for us.
>>
>> Nikunj,
>> Thanks for taking time to review the series :)
>>
>> Not sure if we are talking about the same things here, are you
>> suggesting that tweaking with the max_msg size will stop the SCMI
>> controller from reporting duplicate OPPs? Even if it does go away
>> magically wouldn't it mean you are dropping messages? Also opps_by_lvl
>> failing with -16 and duplicate opps detected in the opp core have the
>> same root cause i.e. duplicate entries reported by the controller.
> 
> 
> Sibi,
> 
> My observation was that only 12 OPPs could fit it 128bytes msg_size and
> our platform was sending 16 OPPs in one go. OPPs above 12 were getting
> clobbered so the duplicate warning/error were not genuine. You may need
> to tweak platform to send only 12(or less) OPPs in one go.

Nikunj,

The platform we are talking abt in this thread is X1E and the number
of performance levels returned by the PERFORMANCE_DESCRIBE_LEVELS
is just one. I relies on the skip_index and iterator ops to get
all the available levels. So the clobbering you are talking abt
in whatever platform you are referring to does not apply here.
Please find the logs below for Domain 1. Hope this clears up
whatever misunderstanding you had about X1E.

Logs Domain -1:
arm-scmi: iter_perf_levels_update_state num_returned: 1 num_remaining: 15
arm-scmi firmware:scmi: Level 710400 Power 23243 Latency 30us Ifreq 
710400 Index 0
...
[snip]
...
arm-scmi: iter_perf_levels_update_state num_returned: 1 num_remaining: 3
arm-scmi firmware:scmi: Level 3417600 Power 307141 Latency 30us Ifreq 
3417600 Index 12
arm-scmi: iter_perf_levels_update_state num_returned: 1 num_remaining: 2
arm-scmi firmware:scmi: Failed to add opps_by_lvl at 3417600 for NCC - 
ret:-16
arm-scmi firmware:scmi: Level 3417600 Power 307141 Latency 30us Ifreq 
3417600 Index 13
arm-scmi: iter_perf_levels_update_state num_returned: 1 num_remaining: 1
arm-scmi firmware:scmi: Failed to add opps_by_lvl at 3417600 for NCC - 
ret:-16
arm-scmi firmware:scmi: Level 3417600 Power 307141 Latency 30us Ifreq 
3417600 Index 14
arm-scmi: iter_perf_levels_update_state num_returned: 1 num_remaining: 0
arm-scmi firmware:scmi: Level 4012800 Power 539962 Latency 30us Ifreq 
4012800 Index 15


-Sibi

> 
> 
>>
>>>
>>> Thanks,
>>>
>>> -Nikunj
>>>
>>>>
>>>>> [    9.913506] debugfs: Directory 'NCC' with parent 'pm_genpd'
>>>>> already present!
>>>>> [    9.922198] debugfs: Directory 'NCC' with parent 'pm_genpd'
>>>>> already present!
>>>>
>>>> Yeah I did notice ^^ during dev, the series isn't the one
>>>> introducing it
>>>> so it shouldn't block the series acceptance. Meanwhile I'll spend some
>>>> cycles to get this warn fixed.
>>
>> Johan,
>>
>> https://lore.kernel.org/lkml/20240703110741.2668800-1-quic_sibis@quicinc.com/
>>
>>
>> Posted a fix for the warn ^^
>>
>>>>
>>>> -Sibi
>>>>
>>>>>
>>>>> Johan
>>>>>

