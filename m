Return-Path: <linux-arm-msm+bounces-48135-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA86A3796F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 02:15:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B1515188E660
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 01:15:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0398D528;
	Mon, 17 Feb 2025 01:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="iyT66gWy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A223FF1;
	Mon, 17 Feb 2025 01:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739754937; cv=none; b=aXMCQOnlHQFHJb7AKmhJE3apDYb9eOlEnIs3ScbtepZL6Q+EQXQmR1hMohRHzIWID7XxyOXUzE/O6+f0BJ6PFvTUBI2IDefd4o1IPFj6IQr8VC/PyA1lkVf/k98SsEnOcU2ulMv5r1b/rZLrKMPEf7M1oGnEP/QY3cMGId0KwCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739754937; c=relaxed/simple;
	bh=5P08xLcOpAO3kfg5pPvJsQqW2bZsqQ0jUbu3vxmaH5A=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=bkqv56hdgSe0y4fkp4CiBNGr9jZ3AEIRKKZhdz4plYX6YIa1ajhxPnS59UyGsPGUk21O3jXq7lSHnMbui9EVUzA5LBRHbwYyV6MbRiDFxhn4QUt1rFCTDN9yFMCgEi/8HHfh0mfX1FE7E2qG+aUKfOsN+jYXvSUQ26N9APgAMuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=iyT66gWy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51H03ATu003101;
	Mon, 17 Feb 2025 01:15:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QEWtjHoNU9NHeQt4i7TL5SjyB4mbjcKUSANV4HeIacY=; b=iyT66gWyEWb+iNmP
	W0DOspffSWoDU+ma/fpk4gHVCpQWKKqngH/NAJQdvnsZ9eVuKwRBmaA1uw9e27/l
	sptmnes6vjQejj9mb66SntVkNIR4FdlhbfpH1GqM4bsbBhyhgL7qMzGMS+5xw3gm
	KaxIQpKn6ClN3IUrNDn/oVfctl6HeOu/iFsKgoTAREhgw3b753z8GjICBaE0VVUB
	M7Ap0WOq2+mW4Tvibpi4kjOfcgxo7URn3eXDHt3eTWF21tPgIJrTQpL+qLFaUJ8A
	M2aAN4U5L4bO+zvG4bSkus78SEqD/wsWh8kkGykXdRbkzdAclKx0sVlDBgxSOWHj
	42sbTw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44ut7v839a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Feb 2025 01:14:59 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51H1EwWC029430
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Feb 2025 01:14:58 GMT
Received: from [10.133.33.23] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 16 Feb
 2025 17:14:54 -0800
Message-ID: <5e6edfce-ef2e-48d2-ad0c-0120606394fb@quicinc.com>
Date: Mon, 17 Feb 2025 09:14:51 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 4/7] Coresight: Introduce a new struct coresight_path
To: James Clark <james.clark@linaro.org>
CC: Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Jinlong Mao
	<quic_jinlmao@quicinc.com>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        Suzuki K Poulose
	<suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
References: <20250207064213.2314482-1-quic_jiegan@quicinc.com>
 <20250207064213.2314482-5-quic_jiegan@quicinc.com>
 <a633f52c-81e8-4c0d-aca7-cc18360866eb@linaro.org>
 <4b521b49-7104-4f25-82cb-4f9be7b235f4@quicinc.com>
 <b61af324-7488-4a4f-9f9e-2ecb004fc4c7@linaro.org>
Content-Language: en-US
From: Jie Gan <quic_jiegan@quicinc.com>
In-Reply-To: <b61af324-7488-4a4f-9f9e-2ecb004fc4c7@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ncpn-UUadyPb6vXM7jc6XjlAZmOQIyol
X-Proofpoint-GUID: ncpn-UUadyPb6vXM7jc6XjlAZmOQIyol
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-17_01,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 suspectscore=0 mlxscore=0 mlxlogscore=908 priorityscore=1501
 impostorscore=0 spamscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502170007



On 2/14/2025 7:09 PM, James Clark wrote:
> 
> 
> On 14/02/2025 1:34 am, Jie Gan wrote:
>>
>>
>> On 2/14/2025 12:00 AM, James Clark wrote:
>>>
>>>
>>> On 07/02/2025 6:42 am, Jie Gan wrote:
>>>> Add 'struct coresight_path' to store the data that is needed by
>>>> coresight_enable_path/coresight_disable_path. The structure will be
>>>> transmitted to any required devices to enable related funcationalities.
>>>>
>>>> The trace_id will be allocated after the path is built. Consequently,
>>>> The ETM3x and ETM4x devices will directly read the trace_id from path
>>>> which result in etm_read_alloc_trace_id and etm4_read_alloc_trace_id
>>>> being deleted.
>>>>
>>>> Co-developed-by: James Clark <james.clark@linaro.org>
>>>> Signed-off-by: James Clark <james.clark@linaro.org>
>>>> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
>>>> ---
>>>>   drivers/hwtracing/coresight/coresight-core.c  | 106 ++++++++++++ 
>>>> +-----
>>>>   drivers/hwtracing/coresight/coresight-dummy.c |   5 +-
>>>>   .../hwtracing/coresight/coresight-etm-perf.c  |  30 +++--
>>>>   .../hwtracing/coresight/coresight-etm-perf.h  |   2 +-
>>>>   drivers/hwtracing/coresight/coresight-etm.h   |   1 -
>>>>   .../coresight/coresight-etm3x-core.c          |  54 ++-------
>>>>   .../coresight/coresight-etm4x-core.c          |  54 ++-------
>>>>   drivers/hwtracing/coresight/coresight-etm4x.h |   1 -
>>>>   drivers/hwtracing/coresight/coresight-priv.h  |  12 +-
>>>>   drivers/hwtracing/coresight/coresight-stm.c   |   3 +-
>>>>   drivers/hwtracing/coresight/coresight-sysfs.c |  17 ++-
>>>>   drivers/hwtracing/coresight/coresight-tpdm.c  |   3 +-
>>>>   include/linux/coresight.h                     |  12 +-
>>>>   13 files changed, 143 insertions(+), 157 deletions(-)
>>>>
>>> [...]
>>>> @@ -352,7 +352,7 @@ static void *etm_setup_aux(struct perf_event 
>>>> *event, void **pages,
>>>>        * CPUs, we can handle it and fail the session.
>>>>        */
>>>>       for_each_cpu(cpu, mask) {
>>>> -        struct list_head *path;
>>>> +        struct coresight_path *path;
>>>>           struct coresight_device *csdev;
>>>>           csdev = per_cpu(csdev_src, cpu);
>>>> @@ -405,15 +405,15 @@ static void *etm_setup_aux(struct perf_event 
>>>> *event, void **pages,
>>>>               cpumask_clear_cpu(cpu, mask);
>>>>               continue;
>>>>           }
>>>> -
>>>>           /* ensure we can allocate a trace ID for this CPU */
>>>> -        trace_id = coresight_trace_id_get_cpu_id_map(cpu, &sink- 
>>>> >perf_sink_id_map);
>>>> -        if (!IS_VALID_CS_TRACE_ID(trace_id)) {
>>>> +        trace_id = coresight_path_assign_trace_id(path, CS_MODE_PERF);
>>>> +
>>>> +        /* Can be 0 and valid, ETE doesn't need an ID */
>>>> +        if (trace_id < 0) {
>>>
>>> Not sure why I wrote it like this, but I think we should leave it as 
>>> it was with !IS_VALID_CS_TRACE_ID(). Even with ETE it calls the trace 
>>> ID allocator, so nothing has changed here.
>>>
>> Sure, Will restore. For ETE or ETM, we dont need traverse the path, 
>> just directly allocate the trace id based on cpu id.
>>
>> Jie
>>
>>
> 
> Sorry I meant to only keep the !IS_VALID_CS_TRACE_ID() bit. We still 
> need to call the new coresight_path_assign_trace_id() otherwise it 
> doesn't get assigned to the path. I saw that got removed in v11.
> 
> 
Sorry for the misunderstanding, I was focused on "nothing has changed 
here", lol.

I got your point here.
So the updated codes should be:
...
                 /* ensure we can allocate a trace ID for this CPU */
                 trace_id = coresight_path_assign_trace_id(path, 
CS_MODE_PERF);
                 if (!IS_VALID_CS_TRACE_ID(trace_id)) {
                         cpumask_clear_cpu(cpu, mask);
                         coresight_release_path(path);
                         continue;
                 }
...


Thanks,
Jie

