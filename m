Return-Path: <linux-arm-msm+bounces-46507-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 967ADA21D7C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 14:02:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E9E31162493
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 13:02:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57AC3D517;
	Wed, 29 Jan 2025 13:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ZP5dGRTb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 463668479;
	Wed, 29 Jan 2025 13:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738155777; cv=none; b=at7791Y1XkjpK5UFO/2EJJGfsQYGjgZ6+Q3NAqvTFcgUN3iO72GJx1ZNyzaZ4lNYT3QwH1LAQshdM18nmHD6/48flM0TDm1jsUn5PV5PP9WzeRh7GlsihWdYq0ypZoDW9Mc8hj49VzbSyYeVDiZW23UsVJC1moer+AibU9N0wh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738155777; c=relaxed/simple;
	bh=nei847z82ZvA5YDY9HBxfC05+SnORikp8oHJF/fm2G8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=nvPkqSikoS2UYw9QKMZRqsgcYQFm/nM40ZAONZmqPCK2lGZhikjzDc5FV8pJq7PFLOgYXnmRyDwpR9N1kDseXOr8geNsUY1XNEtFxRT1TfTCzAc4sPzIYTyf8/ZyvlG89mAe3F7HCIbVBz3GSTGXLUQ8y97wivQ21/l/ySNQq9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ZP5dGRTb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50T4WeQd018791;
	Wed, 29 Jan 2025 13:02:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ftSzZxQWxFuySK8miUP6zEBfv5FfrAKGgH7tosFe5+Q=; b=ZP5dGRTbHvz+1l1a
	EIyfBpPA1uW8K9Yz8EKj1eXcqGmyxga6HnYaFPlImzMoJlbufWM+HOl972zOdbSJ
	fOi052peQIgEhFUealWbyvN6N/WmgQRJO8LOYFsz1kKILaHgAs0z4yQduDaeTJ/7
	qc4FlJupmGqdZ9wdqbwfIJSiIvkSAWrPGDOo5t1VGeXkWXFNxfwUBRArjSLwWEBz
	qu8k2iirP75NBl0ivX4Amwu4z2CLVKkjoXAcGdaUYJM7tpLNN9eFBqVjqlLWXSVJ
	A9DErxJ/dCSo6KIO0DNVWTY9ay+lDeKdPmoNvpIYIbo3SOXWfJTk7VbE/GCBeUAu
	4cVpUQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44fdd8ru64-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Jan 2025 13:02:32 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50TD2VPj004680
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Jan 2025 13:02:31 GMT
Received: from [10.133.33.43] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 29 Jan
 2025 05:02:25 -0800
Message-ID: <29bbb602-61fd-44e1-afb5-f158c8d61c97@quicinc.com>
Date: Wed, 29 Jan 2025 21:02:22 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 5/6] Coresight: Add Coresight TMC Control Unit driver
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
References: <20250124072537.1801030-1-quic_jiegan@quicinc.com>
 <20250124072537.1801030-6-quic_jiegan@quicinc.com>
 <44bd0d5e-a232-49c3-ba2f-e63e2f2c99be@linaro.org>
 <b3d9e4f0-cca8-45a5-a5b7-239cdeed2751@quicinc.com>
 <070c70ac-c76b-4d1a-acb6-d29cc85967b9@linaro.org>
Content-Language: en-US
From: Jie Gan <quic_jiegan@quicinc.com>
In-Reply-To: <070c70ac-c76b-4d1a-acb6-d29cc85967b9@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: RO6md8-g_kwg4T9YiqP0oydXCedLsqFP
X-Proofpoint-GUID: RO6md8-g_kwg4T9YiqP0oydXCedLsqFP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-29_01,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 clxscore=1015 spamscore=0 phishscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 mlxlogscore=999 priorityscore=1501 impostorscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501290106



On 1/29/2025 6:35 PM, James Clark wrote:
> 
> 
> On 29/01/2025 12:46 am, Jie Gan wrote:
>>
>>
>> On 1/28/2025 7:55 PM, James Clark wrote:
>>>
>>>
>>> On 24/01/2025 7:25 am, Jie Gan wrote:
>>>> The Coresight TMC Control Unit hosts miscellaneous configuration 
>>>> registers
>>>> which control various features related to TMC ETR sink.
>>>>
>>>> Based on the trace ID, which is programmed in the related CTCU ATID
>>>> register of a specific ETR, trace data with that trace ID gets into
>>>> the ETR buffer, while other trace data gets dropped.
>>>>
>>>> Enabling source device sets one bit of the ATID register based on
>>>> source device's trace ID.
>>>> Disabling source device resets the bit according to the source
>>>> device's trace ID.
>>>>
>>>> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
>>>> ---
>>>>   drivers/hwtracing/coresight/Kconfig          |  12 +
>>>>   drivers/hwtracing/coresight/Makefile         |   1 +
>>>>   drivers/hwtracing/coresight/coresight-ctcu.c | 276 +++++++++++++++ 
>>>> ++++
>>>>   drivers/hwtracing/coresight/coresight-ctcu.h |  30 ++
>>>>   include/linux/coresight.h                    |   3 +-
>>>>   5 files changed, 321 insertions(+), 1 deletion(-)
>>>>   create mode 100644 drivers/hwtracing/coresight/coresight-ctcu.c
>>>>   create mode 100644 drivers/hwtracing/coresight/coresight-ctcu.h
>>>  >
>>>
>>> [...]
>>>
>>>> +/*
>>>> + * ctcu_set_etr_traceid: Retrieve the ATID offset and trace ID.
>>>> + *
>>>> + * Returns 0 indicates success. None-zero result means failure.
>>>> + */
>>>> +static int ctcu_set_etr_traceid(struct coresight_device *csdev, 
>>>> struct coresight_path *cs_path,
>>>> +                bool enable)
>>>> +{
>>>> +    struct coresight_device *sink = coresight_get_sink(cs_path->path);
>>>> +    struct ctcu_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
>>>> +    u8 trace_id = cs_path->trace_id;
>>>> +    int port_num;
>>>> +
>>>> +    if ((sink == NULL) || !IS_VALID_CS_TRACE_ID(trace_id) || 
>>>> IS_ERR_OR_NULL(drvdata)) {
>>>> +        dev_err(&csdev->dev, "Invalid parameters\n");
>>>> +        return -EINVAL;
>>>> +    }
>>>> +
>>>> +    port_num = ctcu_get_active_port(sink, csdev);
>>>> +    if (port_num < 0)
>>>> +        return -EINVAL;
>>>> +
>>>> +    /*
>>>> +     * Skip the disable session if more than one TPDM device that
>>>> +     * connected to the same TPDA device has been enabled.
>>>> +     */
>>>> +    if (enable)
>>>> +        atomic_inc(&drvdata->traceid_refcnt[port_num][trace_id]);
>>>> +    else {
>>>> +        if (atomic_dec_return(&drvdata->traceid_refcnt[port_num] 
>>>> [trace_id]) > 0) {
>>>> +            dev_dbg(&csdev->dev, "Skip the disable session\n");
>>>> +            return 0;
>>>> +        }
>>>> +    }
>>>> +
>>>> +    dev_dbg(&csdev->dev, "traceid is %d\n", cs_path->trace_id);
>>>> +
>>>> +    return __ctcu_set_etr_traceid(csdev, trace_id, port_num, enable);
>>>
>>> Hi Jie,
>>>
>>> Using atomic_dec_return() here doesn't prevent 
>>> __ctcu_set_etr_traceid() from running concurrent enable and disables. 
>>> Once you pass the atomic_dec_return() a second call to enable it will 
>>> mess it up.
>>>
>>> I think you need a spinlock around the whole thing and then the 
>>> refcounts don't need to be atomics.
>>>
>> Hi, James
>> Thanks for comment. I may not fully tested my codes here. What I was 
>> thinking is there's no way the refcnt could become a negative number 
>> under current framework. So I just added spinlock in 
>> __ctcu_set_etr_traceid() to ensure concurrent sessions correctly 
>> manipulate the register.
>>
>> As the trace_id related to the bit of the ATID register, I think the 
>> concurrent processes are working fine with spinlock around read/write 
>> register.
>>
>> I may not fully got your point here. Please help me to correct it.
>>
>> Thanks,
>> Jie
>>
>>
> 
> No it can't become negative, but the refcount can be a different state 
> to the one that was actually written:
> 
> 
>    CPU0                             CPU1
>    ----                             ----
>    ctcu_set_etr_traceid(enable)
>                                     ctcu_set_etr_traceid(disable)
>    atomic_inc()
>    recount == 1
>                                     atomic_dec()
>                                     recount == 0
> 
>                                     __ctcu_set_etr_traceid(disable)
>                                     Lock and write disable state to
>                                     device
> 
>    __ctcu_set_etr_traceid(enable)
>    Lock and write enable state to
>    device
> 
> 
> As you can see this leaves the device in an enabled state but the 
> refcount is 0.
Yes, you are right. I didnt consider this scenario. We definitely need 
spinlock here.

> 
> This is also quite large if you use atomic types:
> 
>   /* refcnt for each traceid of each sink */
>   atomic_t traceid_refcnt[ATID_MAX_NUM][CORESIGHT_TRACE_ID_RES_TOP];
> 
> Presumably you can't have the refcount for each ID be higher than the 
> max number of TPDMs connected? If you make the locked area a bit wider 
> you don't need atomic types and also solve the above problem. So you 
> could do u8, or DECLARE_BITMAP() and bitmap_read() etc to read 3 bit 
> values. Or however wide it needs to be.
The original purpose of using atomic here is trying to narrow the locked 
area.

I think u8 is ok here.
u8 traceid_refcnt[ATID_MAX_NUM][CORESIGHT_TRACE_ID_RES_TOP] will cost 
224 bytes, I think it's acceptable here.

Thanks,
Jie

> 


