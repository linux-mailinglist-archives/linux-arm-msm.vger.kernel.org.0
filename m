Return-Path: <linux-arm-msm+bounces-52134-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 12026A6B351
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Mar 2025 04:27:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 408283AE229
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Mar 2025 03:26:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7174C1E5B78;
	Fri, 21 Mar 2025 03:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="EdEIMFFi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A9AD78F5B;
	Fri, 21 Mar 2025 03:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742527610; cv=none; b=jt3D3D/pA8IPmmWGCzHZNIi9vNJI/SOEVigWWJFu1ZJyVB0081QJxCbG69c38sCk2j5J3Mo4jKES7N+QMxy2Vj5NOhTMCEzIz9pzdkMO8kVUQ0d6Y5+UJm6Fo60oYZbR/KbkeP7nVI8QIE9dnNJyuDsbA/v3vsJdEsQX94m7+MY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742527610; c=relaxed/simple;
	bh=lad20qHXAktmVmArk4Sp3V9sfYhnlonhSGyq30J/7UQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=nOz/t4ubfTW/9qUheJeGzFxz6jbXTUQ52Byn6Y3uRtN2KWstpRFVZZLgyC1g3HBEUvmMvGJRml63cabgBdyTeEdW10zA+t0o0xdPe3a7UNIBtXRUPQnubCTfBZIYLx6NOdlX8rYFmikXyjh6kE0nwRpCw+G4C1L4OQS3+g9S9m4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=EdEIMFFi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52L1WMuY027181;
	Fri, 21 Mar 2025 03:26:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h0Gb+3M6iE4XME6U4n82WAv7FNqbVZfiKZwB/Oqp+sY=; b=EdEIMFFiF3Z5iNFM
	j3CFoeqfZAcJ1eRGIUUL3k4ZHNWW4xNV1ki1Mazy1Md2U9P65wjgr0FIXvyWIJ7i
	x4wpV4QOugNQBMM1LvWlKp7FlxlV0mGiqqyrKbIcvqCF7/VP1VxCCSJcY8OUPYjz
	S4J0mYwXaTnAYjaadBAB8CkEvsWBMJqLL403WfNcfrVbCsozpSq2U/d9cGcGtMqr
	mTV3SlWvCT/kE9Y7MR27VrxJcFpq/HUHqsi/JwL3P0G6gnbA1bd5z8oY6wHzTq19
	VdArgXALUY4TuE1nxH4d+lPbVACoLwASpsdfgTEwsMUYWqGe/hvSMoA2sNsac+ny
	TM6E/Q==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45gbngkj73-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Mar 2025 03:26:29 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52L3QSmh004457
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Mar 2025 03:26:28 GMT
Received: from [10.239.133.242] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 20 Mar
 2025 20:26:25 -0700
Message-ID: <28001d0d-38cc-4507-91c5-1791c74d11ee@quicinc.com>
Date: Fri, 21 Mar 2025 11:26:18 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/7] Provides support for Trigger Generation Unit
To: Mike Leach <mike.leach@linaro.org>
CC: Suzuki K Poulose <suzuki.poulose@arm.com>,
        James Clark
	<james.clark@arm.com>,
        Alexander Shishkin
	<alexander.shishkin@linux.intel.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn
 Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <linux-kernel@vger.kernel.org>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>
References: <20250227092640.2666894-1-quic_songchai@quicinc.com>
 <CAJ9a7ViFu6tP7wac-6NPOBOCHw2iA+gs6D=D4um-T07Syu-8CA@mail.gmail.com>
Content-Language: en-US
From: songchai <quic_songchai@quicinc.com>
In-Reply-To: <CAJ9a7ViFu6tP7wac-6NPOBOCHw2iA+gs6D=D4um-T07Syu-8CA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: TMztV-WSiklbvsy7wAZjYgMRYS5XBGdK
X-Authority-Analysis: v=2.4 cv=MJ5gmNZl c=1 sm=1 tr=0 ts=67dcdc65 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=YwgqQG5pxFy1MkpK7zgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: TMztV-WSiklbvsy7wAZjYgMRYS5XBGdK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-21_01,2025-03-20_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 clxscore=1015
 spamscore=0 priorityscore=1501 mlxscore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503210022


On 3/7/2025 12:57 AM, Mike Leach wrote:
> Hi,
>
> On Thu, 27 Feb 2025 at 09:27, songchai <quic_songchai@quicinc.com> wrote:
>> Provide support for the TGU (Trigger Generation Unit), which can be
>> utilized to sense a plurality of signals and create a trigger into
>> the CTI or generate interrupts to processors once the input signal
>> meets the conditions. We can treat the TGU’s workflow as a flowsheet,
>> it has some “steps” regions for customization. In each step region,
>> we can set the signals that we want with priority in priority_group, set
>> the conditions in each step via condition_decode, and set the resultant
>> action by condition_select. Meanwhile, some TGUs (not all) also provide
>> timer/counter functionality. Based on the characteristics described
>> above, we consider the TGU as a helper in the CoreSight subsystem.
>> Its master device is the TPDM, which can transmit signals from other
>> subsystems, and we reuse the existing ports mechanism to link the TPDM to
>> the connected TGU.
>>
> I do not believe that his component is part of the Coresight subsystem.
>
> 1) It inputs multiple signals from the SoC to process and create an
> trigger event - however, it can do this irrespective of CoreSight
> trace being operational, especially where generating interrupts for
> processors, or triggers for other non-coresight components. It would
> appear that the TPDM can send output to more than just the TDPA which
> generates coresight trace packets - a previously undisclosed feature.

TGU is a part the QPMDA(Qualcomm Performance Monitoring and

Diagnostics Architecture ) library, and the signals it perceives are 
from TPDM and connected

through hardware. So it  depends on the coresight-tpdm, and will not 
work if the coresight

tpdm is not operational.

>
> 2) The ports mechanism is a generic device tree mechanism, not
> something unique to the Coresight subsystem.

Sure, Mike. As i mentioned above, the signals reach the TGU through 
hardware.So the port

mechanism here is not for the data transmission, but to confirm the 
relationship of the TGU

as a TPDM helper.

>
> 3) The CTI trigger connection will be defined in devicetree under the
> CTI component, as this is the interface between this component and
> coresight.

The TGU is utilized to sense a plurality of signals and create a trigger 
into the CTI.

It should be a trigger in for the targeting CTI. Could we configure the 
targeting CTI's trigger_in

and trigger_out instead of configuring in the devicetree?

>
> As such this seems more like a general performance and debug
> component, with optional inputs to the coresight trigger mechanisms,
> rather than being a coresight component itself. Other SoCs have
> non-coresight component inputs to CTIs. For example the PL011 serial
> device on Juno has a signal into one of the system CTIs.

In addition to above, the TGU also have the coresight management 
registers in its register region

which is a character of coresight component.

Based on these clarification, could we consider it as a coresight 
component？
>
>> Here is a detailed example to explain how to use the TGU:
>>
>> In this example, the TGU is configured to use 2 conditions, 2 steps, and
>> the timer. The goal is to look for one of two patterns which are generated
>> from TPDM, giving priority to one, and then generate a trigger once the
>> timer reaches a certain value. In other words, two conditions are used
>> for the first step to look for the two patterns, where the one with the
>> highest priority is used in the first condition. Then, in the second step,
>> the timer is enabled and set to be compared to the given value at each
>> clock cycle. These steps are better shown below.
>>
>>
>>              |-----------------|
>>              |                 |
>>              |       TPDM      |
>>              |                 |
>>              |-----------------|
>>                       |
>>                       |
>>    --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ------
>>    |                  |                                                 |
>>    |                  |                          |--------------------| |
>>    |    |---- --->    |                          |  Go to next steps  | |
>>    |    |             |                |--- ---> |  Enable timer      | |
>>    |    |             v                |         |                    | |
>>    |    |    |-----------------|       |         |--------------------| |
>>    |    |    |                 |  Yes  |                    |           |
>>    |    |    |   inputs==0xB   | ----->|                    | <-------- |
>>    |    |    |                 |       |                    |      No | |
>>    | No |    |-----------------|       |                    v         | |
>>    |    |             |                |          |-----------------| | |
>>    |    |             |                |          |                 | | |
>>    |    |             |                |          |      timer>=3   |-- |
>>    |    |             v                |          |                 |   |
>>    |    |    |-----------------|       |          |-----------------|   |
>>    |    |    |                 |  Yes  |                    |           |
>>    |    |--- |   inputs==0xA   | ----->|                    | Yes       |
>>    |         |                 |                            |           |
>>    |         |-----------------|                            v           |
>>    |                                              |-----------------|   |
>>    |                                              |                 |   |
>>    |                                              |      Trigger    |   |
>>    |                                              |                 |   |
>>    |                                              |-----------------|   |
>>    |  TGU                                                   |           |
>>    |--- --- --- --- --- --- --- --- --- --- --- --- --- --- |--- --- -- |
>>                                                             |
>>                                                             v
>>                                                    |-----------------|
>>                                                    |The controllers  |
>>                                                    |which will use   |
>>                                                    |triggers further |
>>                                                    |-----------------|
>>
>> steps:
>>         1. Reset TGU /*it will disable tgu and reset dataset*/
>>         - echo 1 > /sys/bus/coresight/devices/<tgu-name>/reset_tgu
>>
>>         2. Set the pattern match for priority0 to 0xA = 0b1010 and for
>>            priority 1 to 0xB = 0b1011.
>>         - echo 0x11113232 > /sys/bus/coresight/devices/<tgu-name>/step0_priority0/reg0
>>         - echo 0x11113233 > /sys/bus/coresight/devices/<tgu-name>/step0_priority1/reg0
>>
>>         Note:
>>              Bit distribution diagram for each priority register
>>      |-------------------------------------------------------------------|
>>      |   Bits          |       Field Nam   |    Description              |
>>      |-------------------------------------------------------------------|
>>      |                 |                   | 00 = bypass for OR output   |
>>      |     29:28       |   SEL_BIT7_TYPE2  | 01 = bypass for AND output  |
>>      |                 |                   | 10 = sense input '0' is true|
>>      |                 |                   | 11 = sense input '1' is true|
>>      |-------------------------------------------------------------------|
>>      |                 |                   | 00 = bypass for OR output   |
>>      |     25:24       |   SEL_BIT6_TYPE2  | 01 = bypass for AND output  |
>>      |                 |                   | 10 = sense input '0' is true|
>>      |                 |                   | 11 = sense input '1' is true|
>>      |-------------------------------------------------------------------|
>>      |                 |                   | 00 = bypass for OR output   |
>>      |     21:20       |   SEL_BIT5_TYPE2  | 01 = bypass for AND output  |
>>      |                 |                   | 10 = sense input '0' is true|
>>      |                 |                   | 11 = sense input '1' is true|
>>      |-------------------------------------------------------------------|
>>      |                 |                   | 00 = bypass for OR output   |
>>      |     17:16       |   SEL_BIT4_TYPE2  | 01 = bypass for AND output  |
>>      |                 |                   | 10 = sense input '0' is true|
>>      |                 |                   | 11 = sense input '1' is true|
>>      |-------------------------------------------------------------------|
>>      |                 |                   | 00 = bypass for OR output   |
>>      |     13:12       |   SEL_BIT3_TYPE2  | 01 = bypass for AND output  |
>>      |                 |                   | 10 = sense input '0' is true|
>>      |                 |                   | 11 = sense input '1' is true|
>>      |-------------------------------------------------------------------|
>>      |                 |                   | 00 = bypass for OR output   |
>>      |      9:8        |   SEL_BIT2_TYPE2  | 01 = bypass for AND output  |
>>      |                 |                   | 10 = sense input '0' is true|
>>      |                 |                   | 11 = sense input '1' is true|
>>      |-------------------------------------------------------------------|
>>      |                 |                   | 00 = bypass for OR output   |
>>      |      5:4        |  SEL_BIT1_TYPE2   | 01 = bypass for AND output  |
>>      |                 |                   | 10 = sense input '0' is true|
>>      |                 |                   | 11 = sense input '1' is true|
>>      |-------------------------------------------------------------------|
>>      |                 |                   | 00 = bypass for OR output   |
>>      |      1:0        |  SEL_BIT0_TYPE2   | 01 = bypass for AND output  |
>>      |                 |                   | 10 = sense input '0' is true|
>>      |                 |                   | 11 = sense input '1' is true|
>>      |-------------------------------------------------------------------|
>>          These bits are used to identify the signals we want to sense, with
>>          a maximum signal number of 140. For example, to sense the signal
>>          0xA (binary 1010), we set the value of bits 0 to 13 to 3232, which
>>          represents 1010. The remaining bits are set to 1, as we want to use
>>          AND gate to summarize all the signals we want to sense here. For
>>          rising or falling edge detection of any input to the priority, set
>>          the remaining bits to 0 to use an OR gate.
>>
>>         3. look for the pattern for priority_i i=0,1.
>>         - echo 0x3 > /sys/bus/coresight/devices/<tgu-name>/step0_condition_decode/reg0
>>         - echo 0x30 > /sys/bus/coresight/devices/<tgu-name>/step0_condition_decode/reg1
>>
>>      |-------------------------------------------------------------------------------|
>>      |   Bits          |    Field Nam        |            Description                |
>>      |-------------------------------------------------------------------------------|
>>      |                 |                     |For each decoded condition, this       |
>>      |      24         |       NOT           |inverts the output. If the condition   |
>>      |                 |                     |decodes to true, and the NOT field     |
>>      |                 |                     |is '1', then the output is NOT true.   |
>>      |-------------------------------------------------------------------------------|
>>      |                 |                     |When '1' the output from the associated|
>>      |      21         |  BC0_COMP_ACTIVE    |comparator will be actively included in|
>>      |                 |                     |the decoding of this particular        |
>>      |                 |                     |condition.                             |
>>      |-------------------------------------------------------------------------------|
>>      |                 |                     |When '1' the output from the associated|
>>      |                 |                     |comparator will need to be 1 to affect |
>>      |      20         |   BC0_COMP_HIGH     |the decoding of this condition.        |
>>      |                 |                     |Conversely, a '0' here requires a '0'  |
>>      |                 |                     |from the comparator                    |
>>      |-------------------------------------------------------------------------------|
>>      |                 |                     |When '1' the output from the associated|
>>      |      17         |                     |comparator will be actively included in|
>>      |                 |  TC0_COMP_ACTIVE    |the decoding of this particular        |
>>      |                 |                     |condition.                             |
>>      |-------------------------------------------------------------------------------|
>>      |                 |                     |When '1' the output from the associated|
>>      |                 |                     |comparator will need to be 1 to affect |
>>      |      16         |  TC0_COMP_HIGH      |the decoding of this particular        |
>>      |                 |                     |condition.Conversely, a 0 here         |
>>      |                 |                     |requires a '0' from the comparator     |
>>      |-------------------------------------------------------------------------------|
>>      |                 |                     |When '1' the output from Priority_n    |
>>      |                 |                     |OR logic will be actively              |
>>      |     4n+3        | Priority_n_OR_ACTIVE|included in the decoding of            |
>>      |                 |    (n=0,1,2,3)      |this particular condition.             |
>>      |                 |                     |                                       |
>>      |-------------------------------------------------------------------------------|
>>      |                 |                     |When '1' the output from Priority_n    |
>>      |                 |                     |will need to be '1' to affect the      |
>>      |     4n+2        |  Priority_n_OR_HIGH |decoding of this particular            |
>>      |                 |    (n=0,1,2,3)      |condition. Conversely, a '0' here      |
>>      |                 |                     |requires a '0' from Priority_n OR logic|
>>      |-------------------------------------------------------------------------------|
>>      |                 |                     |When '1' the output from Priority_n    |
>>      |                 |                     |AND logic will be actively             |
>>      |     4n+1        |Priority_n_AND_ACTIVE|included in the decoding of this       |
>>      |                 |  (n=0,1,2,3)        |particular condition.                  |
>>      |                 |                     |                                       |
>>      |-------------------------------------------------------------------------------|
>>      |                 |                     |When '1' the output from Priority_n    |
>>      |                 |                     |AND logic will need to be '1' to       |
>>      |      4n         | Priority_n_AND_HIGH |affect the decoding of this            |
>>      |                 |   (n=0,1,2,3)       |particular condition. Conversely,      |
>>      |                 |                     |a '0' here requires a '0' from         |
>>      |                 |                     |Priority_n AND logic.                  |
>>      |-------------------------------------------------------------------------------|
>>          Since we use `priority_0` and `priority_1` with an AND output in step 2, we set `0x3`
>>          and `0x30` here to activate them.
>>
>>         4. Set NEXT_STEP = 1 and TC0_ENABLE = 1 so that when the conditions
>>            are met then the next step will be step 1 and the timer will be enabled.
>>         - echo 0x20008 > /sys/bus/coresight/devices/<tgu-name>/step0_condition_select/reg0
>>         - echo 0x20008 > /sys/bus/coresight/devices/<tgu-name>/step0_condition_select/reg1
>>
>>          |-----------------------------------------------------------------------------|
>>          |   Bits          |       Field Nam   |            Description                |
>>          |-----------------------------------------------------------------------------|
>>          |                 |                   |This field defines the next step the   |
>>          |    18:17        |     NEXT_STEP     |TGU will 'goto' for the associated     |
>>          |                 |                   |Condition and Step.                    |
>>          |-----------------------------------------------------------------------------|
>>          |                 |                   |For each possible output trigger       |
>>          |    13           |     TRIGGER       |available, set a '1' if you want       |
>>          |                 |                   |the trigger to go active for the       |
>>          |                 |                   |associated condition and Step.         |
>>          |-----------------------------------------------------------------------------|
>>          |                 |                   |This will cause BC0 to increment if the|
>>          |    9            |     BC0_INC       |associated Condition is decoded for    |
>>          |                 |                   |this step.                             |
>>          |-----------------------------------------------------------------------------|
>>          |                 |                   |This will cause BC0 to decrement if the|
>>          |    8            |     BC0_DEC       |associated Condition is decoded for    |
>>          |                 |                   |this step.                             |
>>          |-----------------------------------------------------------------------------|
>>          |                 |                   |This will clear BC0 count value to 0 if|
>>          |    7            |     BC0_CLEAR     |the associated Condition is decoded    |
>>          |                 |                   |for this step.                         |
>>          |-----------------------------------------------------------------------------|
>>          |                 |                   |This will cause TC0 to increment until |
>>          |    3            |     TC0_ENABLE    |paused or cleared if the associated    |
>>          |                 |                   |Condition is decoded for this step.    |
>>          |-----------------------------------------------------------------------------|
>>          |                 |                   |This will cause TC0 to pause until     |
>>          |    2            |     TC0_PAUSE     |enabled if the associated Condition    |
>>          |                 |                   |is decoded for this step.              |
>>          |-----------------------------------------------------------------------------|
>>          |                 |                   |This will clear TC0 count value to 0   |
>>          |    1            |     TC0_CLEAR     |if the associated Condition is         |
>>          |                 |                   |decoded for this step.                 |
>>          |-----------------------------------------------------------------------------|
>>          |                 |                   |This will set the done signal to the   |
>>          |    0            |     DONE          |TGU FSM if the associated Condition    |
>>          |                 |                   |is decoded for this step.              |
>>          |-----------------------------------------------------------------------------|
>>          Based on the distribution diagram, we set `0x20008` for `priority0` and `priority1` to
>>          achieve "jump to step 1 and enable TC0" once the signal is sensed.
>>
>>         5. activate the timer comparison for this step.
>>         -  echo 0x30000  > /sys/bus/coresight/devices/<tgu-name>/step1_condition_decode/reg0
>>
>>          |-------------------------------------------------------------------------------|
>>          |                 |                     |When '1' the output from the associated|
>>          |      17         |                     |comparator will be actively included in|
>>          |                 |  TC0_COMP_ACTIVE    |the decoding of this particular        |
>>          |                 |                     |condition.                             |
>>          |-------------------------------------------------------------------------------|
>>          |                 |                     |When '1' the output from the associated|
>>          |                 |                     |comparator will need to be 1 to affect |
>>          |      16         |  TC0_COMP_HIGH      |the decoding of this particular        |
>>          |                 |                     |condition.Conversely, a 0 here         |
>>          |                 |                     |requires a '0' from the comparator     |
>>          |-------------------------------------------------------------------------------|
>>          Accroding to the decode distribution diagram , we give 0x30000 here to set 16th&17th bit
>>          to enable timer comparison.
>>
>>         6. Set the NEXT_STEP = 0 and TC0_PAUSE = 1 and TC0_CLEAR = 1 once the timer
>>            has reached the given value.
>>         - echo 0x6 > /sys/bus/coresight/devices/<tgu-name>/step1_condition_select/reg0
>>
>>         7. Enable Trigger 0 for TGU when the condition 0 is met in step1,
>>            i.e. when the timer reaches 3.
>>         - echo 0x2000 > /sys/bus/coresight/devices/<tgu-name>/step1_condition_select/default
>>
>>          Note:
>>              1. 'default' register allows for establishing the resultant action for
>>              the default condition
>>
>>              2. Trigger:For each possible output trigger available from
>>              the Design document, there are three triggers: interrupts, CTI,
>>              and Cross-TGU mapping.All three triggers can occur, but
>>              the choice of which trigger to use depends on the user's
>>              needs.
>>
>>         8. Compare the timer to 3 in step 1.
>>         - echo 0x3 > /sys/bus/coresight/devices/<tgu-name>/step1_timer/reg0
>>
>>         9. enale tgu
>>         - echo 1 > /sys/bus/coresight/devices/<tgu-name>/enable_tgu
>>
> If this is version 3 - where is the list of differences from versions 1 - 2?
My bad. Will add the previous change log in the next version.
>
>> Songwei Chai (7):
>>    dt-bindings: arm: Add support for Coresight TGU trace
>>    coresight: Add coresight TGU driver
>>    coresight-tgu: Add signal priority support
>>    coresight-tgu: Add TGU decode support
>>    coresight-tgu: add support to configure next action
>>    coresight-tgu: add timer/counter functionality for TGU
>>    coresight-tgu: add reset node to initialize
>>
>>   .../testing/sysfs-bus-coresight-devices-tgu   |  51 ++
>>   .../bindings/arm/qcom,coresight-tgu.yaml      | 135 ++++
>>   drivers/hwtracing/coresight/Kconfig           |  11 +
>>   drivers/hwtracing/coresight/Makefile          |   1 +
>>   drivers/hwtracing/coresight/coresight-tgu.c   | 669 ++++++++++++++++++
>>   drivers/hwtracing/coresight/coresight-tgu.h   | 242 +++++++
>>   6 files changed, 1109 insertions(+)
>>   create mode 100644 Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu
>>   create mode 100644 Documentation/devicetree/bindings/arm/qcom,coresight-tgu.yaml
>>   create mode 100644 drivers/hwtracing/coresight/coresight-tgu.c
>>   create mode 100644 drivers/hwtracing/coresight/coresight-tgu.h
>>
> Regards
>
>
> Mike
>
> --
> Mike Leach
> Principal Engineer, ARM Ltd.
> Manchester Design Centre. UK

