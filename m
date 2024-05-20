Return-Path: <linux-arm-msm+bounces-20044-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A7C8C98E2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 May 2024 08:03:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA28F2816BB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 May 2024 06:03:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08E1C14AA0;
	Mon, 20 May 2024 06:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HCKYU7qv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 571E25235;
	Mon, 20 May 2024 06:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716185015; cv=none; b=KH3NUKTeL0M8+ft7EtrHttJl/Ft/h2sh1YXqAq3FsEYd+EYdHlzEKjIBtsYuPSTF2Hx3q0tHt+CWuuj/Asuw4kFFed27yZImGSru6J+7gPZUvNSnBnbMWa+u9wQUu6aSbORUeiNmMOpnNAnojzePdiCLkbIkXqGF+ZETFSdm1VY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716185015; c=relaxed/simple;
	bh=lcQqFbNbAFUASrJQYd4w8RSuUl/+eoj52Fv1h/OPLt0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=LJ8zHOTBDxgAjk3aOXqduTvvzp85mX7AIavqUQPNVGkl/jHbwIOut0WSjS/R18nB0SeIaV4+t1STCPs6XdSTlvu5qyFyZLjKWJvRegtqCvrfirSGHFRfZKGP2GupaiwYb/TkdasjFggI7ZT4jilM98lACXaBI+NoG4pF4VypjCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HCKYU7qv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44K0TUps015532;
	Mon, 20 May 2024 06:03:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=lDBuu7LCHd0NEAg63SpAT2KL2mhr63y6ufXQni6afcg=; b=HC
	KYU7qvxT55L9i6i4jF5NEetc5lIrW8wZv/UBmAHbTD9FvXFgD1gnfcMlgvZ5f3JA
	tI3QVYWhxabs3Jkl9LNQwh8drFfUdG2FTzeXoIyjvL59F8uJudM5jvxLF+OGBKUR
	AXmq0HhMd38HD5xV/oqnzY/4ry/+bhjYXbaJg2/eJLrCP4hCEFdr95qCk0vchrci
	yI9camma1l5IvVh5NdRrI+7jlC3652T9yIlB2qwOLrUzBd+0grpb9qdgT10AlFDs
	O1S4BJttw0JUHvNNvDtWauStILl97p1rcw2dqT60R1YHUZvLxm4ALPCdCpwibTBD
	35UGGK/GyvT0SSHFjRww==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y6psnae8q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 May 2024 06:03:18 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44K63HrZ032530
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 May 2024 06:03:17 GMT
Received: from [10.239.133.49] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 19 May
 2024 23:03:13 -0700
Message-ID: <7d5c21af-3488-4c8e-aa64-ba15ee3c581c@quicinc.com>
Date: Mon, 20 May 2024 14:03:11 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] coresight: Add reserve trace id support
To: James Clark <james.clark@arm.com>
CC: <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>,
        Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>,
        Tao Zhang
	<quic_taozha@quicinc.com>,
        songchai <quic_songchai@quicinc.com>,
        "Suzuki K
 Poulose" <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>, "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Alexander Shishkin
	<alexander.shishkin@linux.intel.com>
References: <20240516025644.4383-1-quic_jinlmao@quicinc.com>
 <20240516025644.4383-3-quic_jinlmao@quicinc.com>
 <34e8c1b9-e351-46c9-abbc-2cef9d0a71db@arm.com>
Content-Language: en-US
From: Jinlong Mao <quic_jinlmao@quicinc.com>
In-Reply-To: <34e8c1b9-e351-46c9-abbc-2cef9d0a71db@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: XGbkI97BP-_yIVkumc80i-QyyYpHYd2K
X-Proofpoint-ORIG-GUID: XGbkI97BP-_yIVkumc80i-QyyYpHYd2K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-20_03,2024-05-17_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 phishscore=0 impostorscore=0 adultscore=0
 mlxlogscore=999 clxscore=1015 priorityscore=1501 suspectscore=0
 spamscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405200049

Hi James,

On 2024/5/16 21:23, James Clark wrote:
> 
> 
> On 16/05/2024 04:56, Mao Jinlong wrote:
>> Dynamic trace id was introduced in coresight subsystem so trace id is
>> allocated dynamically. However, some hardware ATB source has static trace
>> id and it cannot be changed via software programming. Reserve trace id
>> for this kind of hardware source.
>>
>> Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
>> ---
>>   .../hwtracing/coresight/coresight-platform.c  | 26 +++++++++++++++++++
>>   .../hwtracing/coresight/coresight-trace-id.c  | 24 +++++++++++++++++
>>   .../hwtracing/coresight/coresight-trace-id.h  | 11 ++++++++
>>   include/linux/coresight.h                     |  1 +
>>   4 files changed, 62 insertions(+)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-platform.c b/drivers/hwtracing/coresight/coresight-platform.c
>> index 9d550f5697fa..d3e22a2608df 100644
>> --- a/drivers/hwtracing/coresight/coresight-platform.c
>> +++ b/drivers/hwtracing/coresight/coresight-platform.c
>> @@ -183,6 +183,17 @@ static int of_coresight_get_cpu(struct device *dev)
>>   	return cpu;
>>   }
>>   
>> +/*
>> + * of_coresight_get_trace_id: Get the atid of a source device.
>> + *
>> + * Returns 0 on success.
>> + */
>> +static int of_coresight_get_trace_id(struct device *dev, u32 *id)
>> +{
>> +
>> +	return of_property_read_u32(dev->of_node, "trace-id", id);
>> +}
>> +
>>   /*
>>    * of_coresight_parse_endpoint : Parse the given output endpoint @ep
>>    * and fill the connection information in @pdata->out_conns
>> @@ -315,6 +326,12 @@ static inline int of_coresight_get_cpu(struct device *dev)
>>   {
>>   	return -ENODEV;
>>   }
>> +
>> +static int of_coresight_get_trace_id(struct device *dev, u32 *id)
>> +{
>> +	return -ENODEV;
>> +}
>> +
>>   #endif
>>   
>>   #ifdef CONFIG_ACPI
>> @@ -794,6 +811,15 @@ int coresight_get_cpu(struct device *dev)
>>   }
>>   EXPORT_SYMBOL_GPL(coresight_get_cpu);
>>   
>> +int coresight_get_trace_id(struct device *dev, u32 *id)
>> +{
>> +	if (!is_of_node(dev->fwnode))
>> +		return -EINVAL;
>> +
>> +	return of_coresight_get_trace_id(dev, id);
>> +}
>> +EXPORT_SYMBOL_GPL(coresight_get_trace_id);
>> +
>>   struct coresight_platform_data *
>>   coresight_get_platform_data(struct device *dev)
>>   {
>> diff --git a/drivers/hwtracing/coresight/coresight-trace-id.c b/drivers/hwtracing/coresight/coresight-trace-id.c
>> index af5b4ef59cea..536a34e9de6f 100644
>> --- a/drivers/hwtracing/coresight/coresight-trace-id.c
>> +++ b/drivers/hwtracing/coresight/coresight-trace-id.c
>> @@ -110,6 +110,24 @@ static int coresight_trace_id_alloc_new_id(struct coresight_trace_id_map *id_map
>>   	return id;
>>   }
>>   
>> +static int coresight_trace_id_set(int id, struct coresight_trace_id_map *id_map)
>> +{
>> +	unsigned long flags;
>> +
>> +	spin_lock_irqsave(&id_map_lock, flags);
>> +
>> +	if (WARN(!IS_VALID_CS_TRACE_ID(id), "Invalid Trace ID %d\n", id))
>> +		return -EINVAL;
>> +	if (WARN(test_bit(id, id_map->used_ids), "ID is already used: %d\n", id))
>> +		return -EINVAL;
> 
> Do these returns not skip unlocking the spinlock?

Yes. Missing the unlocking the spinlock here.

> 
> It might be slightly fewer changes if we update the existing
> coresight_trace_id_alloc_new_id() to add a new "only_preferred" option.
> 
> Then use the existing system id allocator which already handles the lock
> and unlock properly:
> 
>    static int coresight_trace_id_map_get_system_id(struct
>                               coresight_trace_id_map *id_map, int id,
> 
>                               bool only_preferred)
>    {
>    ...
> 	spin_lock_irqsave(&id_map_lock, flags);
> 	/* prefer odd IDs for system components to avoid legacy CPU IDS
> 	id = coresight_trace_id_alloc_new_id(id_map, id, true,
>                                               only_preferred);
>          spin_unlock_irqrestore(&id_map_lock, flags);
>    ...
> 
> I suppose the end result is the same as your implementation, but it
> trades making one existing function slightly more complicated instead of
> adding some new ones.
yes. Your suggestion looks better. I will think carefully.

