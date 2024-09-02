Return-Path: <linux-arm-msm+bounces-30378-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9D2968083
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Sep 2024 09:24:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0B9BC1F2644C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Sep 2024 07:24:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECD1D15FA92;
	Mon,  2 Sep 2024 07:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="S9Q3Ipk6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C9114E2D8;
	Mon,  2 Sep 2024 07:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725261895; cv=none; b=HFc0ycM39oGQoBV0aOFZi+GC3eqTVxEeMDtW/sNGm4OEu5HLNvx+9ZbcAeKWDI+xVTa0fVtDt9wjoHgue+v7hGLCSWckFdh4Rd/eHzWBmwQPwoQzVpYaBXK0O5BIEWxxiGVnoJHC9bcsed+JpYb3uaYXjTJCQjNtkJQy7AcYrIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725261895; c=relaxed/simple;
	bh=3XNv8uTDcbQxkqOvVul+sTpiKtzUSWMPC2RrduGsN0Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=KmRuMK5rm0cjIOyx0ngvCO4HsQdv9PrpQ5O9Y26AtWmLLbJyPYwEuNAngxxGQh0f0weMxeBDDBp376zsFAyCAiZIWPKvO4sk+DB4Q4Ei0LebHr9u8Z5wNu5ih7xPqi5rUjU7eC784f5VoG5V/944SCL7FmumJ+pv2lekTIyGJLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=S9Q3Ipk6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 481Nex7R011142;
	Mon, 2 Sep 2024 07:24:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NeSqrGEdYmu408J1mtHUKuJQVjJvjcCOrgVyiCZV1KQ=; b=S9Q3Ipk6mTCg5RtC
	x3io53WN3W8huW0QzVKOKVYROOIZCfPhRB4++pofxp32pL9su3VPX68hrneRrnlU
	lQaHr6dVLN1KcIFaxT5VJqb1NMy9pgbwUsIqU9IgKaxHaYEyoiFkRgbzOU8lwZzE
	6fsDaLOhWJrKzaxTYzLxQeB0+1rnyYC1CE/rPba4olNADcn3eTayqUh6QL2BpqLw
	R7cpIzhx9bZP7MubNZZMqekAOYM00omEgNHT+kFFiztHkOqTRkEZMYmRxKgQM5R3
	OvrX/UkxTBttlQwywswWaEtDWqbCc5B1ESg7YrQcmEUoHBg0mflPa8TePE4GcasZ
	kvJ3AQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41brhnc1f9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 02 Sep 2024 07:24:20 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4827OIIB032617
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 2 Sep 2024 07:24:18 GMT
Received: from [10.239.133.242] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 2 Sep 2024
 00:24:15 -0700
Message-ID: <aef09e24-bdd0-4638-8ddc-55c4d39e37ec@quicinc.com>
Date: Mon, 2 Sep 2024 15:24:13 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/7] dt-bindings: arm: Add support for Coresight TGU
 trace
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Suzuki K Poulose
	<suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>, James Clark
	<james.clark@arm.com>,
        Alexander Shishkin
	<alexander.shishkin@linux.intel.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn
 Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>
References: <20240830092311.14400-1-quic_songchai@quicinc.com>
 <20240830092311.14400-2-quic_songchai@quicinc.com>
 <0a79b9df-4ca4-4dc8-9930-3fa1dc7d3174@kernel.org>
 <65732921-988f-41f7-886e-94415b07608e@quicinc.com>
 <d4e424f0-5485-4ccc-83e1-d1eb3008af9f@kernel.org>
Content-Language: en-US
From: songchai <quic_songchai@quicinc.com>
In-Reply-To: <d4e424f0-5485-4ccc-83e1-d1eb3008af9f@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: bp2m_hFYMZ2_uBvHKLGYyn5UjYqk803H
X-Proofpoint-ORIG-GUID: bp2m_hFYMZ2_uBvHKLGYyn5UjYqk803H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-09-01_06,2024-08-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 spamscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 adultscore=0 priorityscore=1501 clxscore=1015 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2409020060


On 9/2/2024 3:02 PM, Krzysztof Kozlowski wrote:
> On 02/09/2024 05:14, songchai wrote:
>> On 8/30/2024 6:11 PM, Krzysztof Kozlowski wrote:
>>> On 30/08/2024 11:23, songchai wrote:
>>>> The Trigger Generation Unit (TGU) is designed to detect patterns or
>>>> sequences within a specific region of the System on Chip (SoC). Once
>>>> configured and activated, it monitors sense inputs and can detect a
>>>> pre-programmed state or sequence across clock cycles, subsequently
>>>> producing a trigger.
>>>>
>>>>      TGU configuration space
>>>>           offset table
>>>>    x-------------------------x
>>>>    |                         |
>>>>    |                         |
>>>>    |                         |                           Step configuration
>>>>    |                         |                             space layout
>>>>    |   coresight management  |                           x-------------x
>>>>    |        registers        |                     |---> |             |
>>>>    |                         |                     |     |  reserve    |
>>>>    |                         |                     |     |             |
>>>>    |-------------------------|                     |     |-------------|
>>>>    |                         |                     |     | prioroty[3] |
>>>>    |         step[7]         |<--                  |     |-------------|
>>>>    |-------------------------|   |                 |     | prioroty[2] |
>>>>    |                         |   |                 |     |-------------|
>>>>    |           ...           |   |Steps region     |     | prioroty[1] |
>>>>    |                         |   |                 |     |-------------|
>>>>    |-------------------------|   |                 |     | prioroty[0] |
>>>>    |                         |<--                  |     |-------------|
>>>>    |         step[0]         |-------------------->      |             |
>>>>    |-------------------------|                           |  condition  |
>>>>    |                         |                           |             |
>>>>    |     control and status  |                           x-------------x
>>>>    |           space         |                           |             |
>>>>    x-------------------------x                           |Timer/Counter|
>>>>                                                          |             |
>>>> 						       x-------------x
>>>> TGU Configuration in Hardware
>>>>
>>>> The TGU provides a step region for user configuration, similar
>>>> to a flow chart. Each step region consists of three register clusters:
>>>>
>>>> 1.Priority Region: Sets the required signals with priority.
>>>> 2.Condition Region: Defines specific requirements (e.g., signal A
>>>> reaches three times) and the subsequent action once the requirement is
>>>> met.
>>>> 3.Timer/Counter (Optional): Provides timing or counting functionality.
>>>>
>>>> Add a new coresight-tgu.yaml file to describe the bindings required to
>>>> define the TGU in the device trees.
>>>>
>>>> Signed-off-by: songchai<quic_songchai@quicinc.com>
>>> It feels like you are using login name as real name. Please investigate
>>> this and confirm whether latin transcription/transliteration of your
>>> name is like above.
>> yes.. it's my login name. Will use my real name in next version.
>>>> ---
>>>>    .../bindings/arm/qcom,coresight-tgu.yaml      | 136 ++++++++++++++++++
>>>>    1 file changed, 136 insertions(+)
>>>>    create mode 100644 Documentation/devicetree/bindings/arm/qcom,coresight-tgu.yaml
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-tgu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-tgu.yaml
>>>> new file mode 100644
>>>> index 000000000000..c261252e33e0
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-tgu.yaml
>>>> @@ -0,0 +1,136 @@
>>>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>>>> +# Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
>>>> +%YAML 1.2
>>>> +---
>>>> +$id:http://devicetree.org/schemas/arm/qcom,coresight-tgu.yaml#
>>>> +$schema:http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: Trigger Generation Unit - TGU
>>>> +
>>>> +description: |
>>>> +  The Trigger Generation Unit (TGU) is a Data Engine which can be utilized
>>>> +  to sense a plurality of signals and create a trigger into the CTI or
>>>> +  generate interrupts to processors. The TGU is like the trigger circuit
>>>> +  of a Logic Analyzer.The corresponding trigger logic can be realized by
>>>> +  configuring the conditions for each step after sensing the signal.
>>>> +  Once setup and enabled, it will observe sense inputs and based upon
>>>> +  the activity of those inputs, even over clock cycles, may detect a
>>>> +  preprogrammed state/sequence and then produce a trigger or interrupt.
>>>> +
>>>> +  The primary use case of the TGU is to detect patterns or sequences on a
>>>> +  given set of signals within some region of the SoC.
>>>> +
>>>> +maintainers:
>>>> +  - Mao Jinlong<quic_jinlmao@quicinc.com>
>>>> +  - Sam Chai<quic_songchai@quicinc.com>
>>>> +
>>>> +# Need a custom select here or 'arm,primecell' will match on lots of nodes
>>>> +select:
>>>> +  properties:
>>>> +    compatible:
>>>> +      contains:
>>>> +        enum:
>>>> +          - qcom,coresight-tgu
>>>> +  required:
>>>> +    - compatible
>>>> +
>>>> +properties:
>>>> +  $nodename:
>>>> +    pattern: "^tgu(@[0-9a-f]+)$"
>>> Drop the pattern (and anyway @ is not optional).
>> There will be several TGUs in the SoC, and we want to use the address of
>> each to distinguish them.
> How is this related?
>
>> This is why we added the nodename pattern here.
> How is this related?
>
>> Additionally, I noticed that both TPDM and CTI also use this format to
>> define the nodename.
>>
>> Could you please share any concerns you have about using this pattern?
> I don't get why you insist, but sure:
> The name does not follow DT spec recommendation, plus child schema is
> not really supposed to define the names.
Thanks for you clarification, will drop in the next version.
>
>>>> +  compatible:
>>>> +    items:
>>>> +      - const: qcom,coresight-tgu
>>>> +      - const: arm,primecell
>>>> +
>>>> +  reg:
>>>> +    maxItems: 1
>>>> +
>>>> +  clocks:
>>>> +    maxItems: 1
>>>> +
>>>> +  clock-names:
>>>> +    items:
>>>> +      - const: apb_pclk
>>>> +
>>>> +  qcom,tgu-steps:
>>>> +    description:
>>>> +      The trigger logic is realized by configuring each step after sensing
>>>> +      the signal. The parameter here is used to describe the maximum of steps
>>>> +      that could be configured in the current TGU.
>>> Why this is board or SoC level property? All below also feel like
>>> unnecessary stuff from downstream.
>> There are actually four properties used to describe the number of
>> registers with different functionality for TGUs at the SoC level.
>>
>> Each TGU may have a different number of registers, so we need to add
>> these four properties to describe each TGU’s hardware design.
> Each TGU on the same SoC?
yes, in other words, there will be several TGUs in the SoC.
>
>
>
> Best regards,
> Krzysztof
>

