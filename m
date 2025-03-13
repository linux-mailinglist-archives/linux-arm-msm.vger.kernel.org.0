Return-Path: <linux-arm-msm+bounces-51257-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8021AA5EED2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Mar 2025 10:02:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 76BDD3B3353
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Mar 2025 09:02:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E052D263F32;
	Thu, 13 Mar 2025 09:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hhKJv7Ho"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA4C8263C8E;
	Thu, 13 Mar 2025 09:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741856501; cv=none; b=H5LcDjRUyMueBO5tTl3cyP8MSIY0HVMZr6ZXSjCnB/qaiVbOamRcRQYKosmdrf59JfDWMWyvFq2LNiFt2Yd7GYkv9qYCI1k2E01U3uxICMMqKF6EGm0JeDj5/qfVRDQN1vcWv7k1i/PUNcdhS82ZIGPWGO0e23BGKRcl2GDsB2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741856501; c=relaxed/simple;
	bh=MSbPTWJB5FLhFO2Y3TVuLBiYJqAtJ0e/7Yr75T1EE2g=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=tbXI0FcYgUPHGqz7w/88uOJZIX9UBYWwTkFhkLKMk+lOTxjIpkDd/WLBHycFIX6k9ybADpSyb59jqLHFXGgs458yDwTkIQot9xJUbKW37Ms/qoH7gcFKa+L46IZWREMMW6XEZrE9blz/Xg4t7OJUbNRUAJXrLB9+BzhsuwMjLgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hhKJv7Ho; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52CLZ63e014953;
	Thu, 13 Mar 2025 09:00:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B+RImA9HsXlmFhLjXZ0S4o13XSsv8bnsvVJpuJ/5SF0=; b=hhKJv7HoGU8G4+b+
	qglVgkSyU5gSbzj0BELNM/k8uBjcnofkC+K112iODrhaa2KFwEJjUDNUfY+SFLVk
	BBJzhJpsK8kXQcbJTtzmNeuBSIIjGi090Tz1qDGv6zen0C4HRKVjYQj6bAzVfOwm
	MmC390NsH5whpcCKjN6MsvsMgvUgvVO/KHHDYG/LyTtrmmkcmdKofmWmqsuMd5NQ
	LFswgXtkYU8YmpEq4ny130o6jj4jgi50FwBKhx4FBgUyfx7Toeq3wHcHx189YDMx
	Xae/0wu2Uc4OHt8tm38JYTHMoFWse7egUe16vtVxZyNhodOUHAwOh+Qn0dniJ63d
	ugSr0A==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45au2p59rg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Mar 2025 09:00:58 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52D90vrn016505
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Mar 2025 09:00:57 GMT
Received: from [10.64.68.153] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 13 Mar
 2025 02:00:52 -0700
Message-ID: <57b391cc-2ce9-43f5-90b7-51b90cb8abe3@quicinc.com>
Date: Thu, 13 Mar 2025 17:00:50 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/4] coresight: tmc: Introduce new APIs to get the RWP
 offset of ETR buffer
From: Jie Gan <quic_jiegan@quicinc.com>
To: Mike Leach <mike.leach@linaro.org>
CC: Suzuki K Poulose <suzuki.poulose@arm.com>,
        James Clark
	<james.clark@linaro.org>,
        Alexander Shishkin
	<alexander.shishkin@linux.intel.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Tingwei Zhang
	<quic_tingweiz@quicinc.com>,
        Jinlong Mao <quic_jinlmao@quicinc.com>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
References: <20250310090407.2069489-1-quic_jiegan@quicinc.com>
 <20250310090407.2069489-2-quic_jiegan@quicinc.com>
 <CAJ9a7Vh7PmBBbvwnUETfCYrTSiXNzeiWpsz+XAGaUWt1Rq1aZw@mail.gmail.com>
 <cef984d5-f369-4892-b970-a71285c2ebc5@quicinc.com>
 <CAJ9a7VhDD3813LtH_5AYyM-2mhCNP+vRmqXn4RWqg5F8FEe-Mg@mail.gmail.com>
 <51aab2c3-2219-454f-93b1-5820a9c2ced1@quicinc.com>
Content-Language: en-US
In-Reply-To: <51aab2c3-2219-454f-93b1-5820a9c2ced1@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=ePkTjGp1 c=1 sm=1 tr=0 ts=67d29eca cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=vBr3ZPaBVqwuCb-1dNMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: ykVmxC-jvRo7b-BNk7mpZ-nxa3t9aqjS
X-Proofpoint-GUID: ykVmxC-jvRo7b-BNk7mpZ-nxa3t9aqjS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-13_04,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 phishscore=0
 mlxscore=0 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 priorityscore=1501
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503130070



On 3/13/2025 9:32 AM, Jie Gan wrote:
> 
> 
> On 3/12/2025 8:54 PM, Mike Leach wrote:
>> Hi Jie,
>>
>> On Wed, 12 Mar 2025 at 01:21, Jie Gan <quic_jiegan@quicinc.com> wrote:
>>>
>>>
>>>
>>> On 3/12/2025 12:49 AM, Mike Leach wrote:
>>>> Hi,
>>>>
>>>> On Mon, 10 Mar 2025 at 09:04, Jie Gan <quic_jiegan@quicinc.com> wrote:
>>>>>
>>>>> The new functions calculate and return the offset to the write 
>>>>> pointer of
>>>>> the ETR buffer based on whether the memory mode is SG, flat or 
>>>>> reserved.
>>>>> The functions have the RWP offset can directly read data from ETR 
>>>>> buffer,
>>>>> enabling the transfer of data to any required location.
>>>>>
>>>>> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
>>>>> ---
>>>>>    .../hwtracing/coresight/coresight-tmc-etr.c   | 40 +++++++++++++ 
>>>>> ++++++
>>>>>    drivers/hwtracing/coresight/coresight-tmc.h   |  1 +
>>>>>    2 files changed, 41 insertions(+)
>>>>>
>>>>> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/ 
>>>>> drivers/hwtracing/coresight/coresight-tmc-etr.c
>>>>> index eda7cdad0e2b..ec636ab1fd75 100644
>>>>> --- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
>>>>> +++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
>>>>> @@ -267,6 +267,46 @@ void tmc_free_sg_table(struct tmc_sg_table 
>>>>> *sg_table)
>>>>>    }
>>>>>    EXPORT_SYMBOL_GPL(tmc_free_sg_table);
>>>>>
>>>>> +static long tmc_flat_resrv_get_rwp_offset(struct tmc_drvdata 
>>>>> *drvdata)
>>>>> +{
>>>>> +       dma_addr_t paddr = drvdata->sysfs_buf->hwaddr;
>>>>> +       u64 rwp;
>>>>> +
>>>>
>>>> It is not valid to read RWP if the TMC is running. It must be in the
>>>> stopped or disabled state - see the specifications for TMC /ETR
>>>>
>>>> It is likely that CSUNLOCK / CSLOCK are needed here too,  along with
>>>> the spinlock that protects drvdata
>>>>
>>>> See the code in coresight_tmc_etr.c :-
>>>>
>>>> e.g. in
>>>>
>>>> tmc_update_etr_buffer()
>>>>
>>>> ...
>>>> <take spinlock>
>>>> ...
>>>> CS_UNLOCK(drvdata->base);
>>>> tmc_flush_and_stop(drvdata); // this ensures tmc is stopped and
>>>> flushed to memory - essential to ensure full formatted frame is in
>>>> memory.
>>>> tmc_sync_etr_buf(drvdata); // this function reads rwp.
>>>> CS_LOCK(drvdata->base);
>>>> <release spinlokc>
>>>>
>>>> This type of program flow is common to both sysfs and perf handling of
>>>> TMC buffers.
>>>
>>> Hi Mike,
>>>
>>> I am fully understood your point here.
>>>
>>> The function is designed this way to read the w_offset (which may not be
>>> entirely accurate because the etr buffer is not synced) when the
>>
>> Why would you ever base memory access on a pointer that is not
>> entirely accurate?
>>
>> The manuals for TMC/ETR all state that reads to both RWP and RRP when
>> the ETR is running return unknown values. These cannot be used to
>> access the buffer, or determine how much of the buffer has been used
>> on a running ETR.
>>
>> The ETR specification specifically states that it is not permitted to
>> read the buffer data while the ETR is running, when configured in
>> circular buffer mode - which is the mode used in the TMC-ETR linux
>> drivers.
>>
>> Reading the buffer while ETR is running is only permitted if
>> configured in Software FIFO mode 2 - were the ETR will stop on full
>> and stall incoming trace until some data is read out, signalled to the
>> ETR via the RURP.
>>
> 
> Hi Mike,
> 
> I appreciate for your patient explanation.
> 
> I was wrong about read data from etr_buffer. I must follow the 
> specification to design a method to reading buffer while ETR is running.
> 
> How about the following method:
> 
> 1. The byte-cntr interrupt handler will count the IRQ triggered number 
> when byte-cntr file node is opened.
> 2. Read the buffer after the ETR is stopped(full or stopped manually) 
> according to the counted number. we got the etr->offset, etr->size and 
> the counted number, so we can calculate the offset where starts to read.
> 3. Restart the ETR to keep counting the number of IRQ triggers.
> 
> Thanks,
> Jie

Hi Mike,

Please ignore my previous proposal.

Let me clarify the purpose of the byte-cntr function to ensure there are 
no misunderstandings from my previous comments.

First, we definitely need to change the method for reading the rwp 
pointer from the RWP register.The new method ensures that we obtain a 
valid rwp value.

code snippet:
long tmc_get_rwp_offset(struct tmc_drvdata *drvdata)
{
	struct etr_buf *etr_buf;
	unsigned long flags;
	long w_offset;

	if (WARN_ON(!drvdata->sysfs_buf))
		return -EINVAL;

	spin_lock_irqsave(&drvdata->spinlock, flags);
	etr_buf = drvdata->sysfs_buf;
	if (coresight_get_mode(drvdata->csdev) == CS_MODE_SYSFS)
		__tmc_etr_disable_hw(drvdata);

	if (etr_buf->mode == ETR_MODE_ETR_SG)
		w_offset = tmc_sg_get_rwp_offset(drvdata);
	else if (etr_buf->mode == ETR_MODE_FLAT || etr_buf->mode == ETR_MODE_RESRV)
		w_offset = tmc_flat_resrv_get_rwp_offset(drvdata);
	else
		w_offset = -EINVAL;

	if (coresight_get_mode(drvdata->csdev) == CS_MODE_SYSFS)
		__tmc_etr_enable_hw(drvdata);

	spin_unlock_irqrestore(&drvdata->spinlock, flags);

	return w_offset;
}

The rwp offset is necessary because the length of the trace data 
transferred by the byte-cntr depends on the IRQ count number and the rwp 
value is read (as a benchmark to indicate where we start from) when the 
interrupt is enabled.

With a valid rwp value, we can copy trace data from the ETR buffer (The 
trace data in the ETR buffer can still be read using tmc_read) based on 
the IRQ count number.

We need the byte-cntr function to continue transferring data from the 
ETR buffer to userspace (because the etr buffer has some limitations to 
store trace data) while the ETR is running but we just utilize the rwp 
value as a benchmark to copy trace data from etr buffer, is this acceptable?

Please correct me if I am wrong.

Thanks,
Jie

> 
>> I also note that you are reading back the etr_buf data without doing
>> any dma_sync operations that the perf and sysfs methods in the driver
>> do, after stopping the tmc.
>>
>>> byte-cntr devnode is opened, aiming to reduce the length of redundant
>>> trace data. In this case, we cannot ensure the TMC is stopped or
>>> disabled.
>>
>> The specification requires that you must ensure the TMC is stopped to
>> read these registers.
>>
>>
>>> The byte-cntr only requires an offset to know where it can
>>> start before the expected trace data gets into ETR buffer.
>>>
>>> The w_offset is also read when the byte-cntr function stops, which
>>> occurs after the TMC is disabled.
>>>
>>> Maybe this is not a good idea and I should read r_offset upon open?
>>> The primary goal for byte-cntr is trying to transfer useful trace data
>>> from the ETR buffer to the userspace, if we start from r_offset, a large
>>> number of redundant trace data which the user does not expect will be
>>> transferred simultaneously.
>>>
>>>
>>
>> It is difficult to justify adding code to a driver that does not
>> correspond to the specification of the hardware device.
>>
>> Regards
>>
>> Mike
>>
>>>>
>>>>> +       rwp = tmc_read_rwp(drvdata);
>>>>> +       return rwp - paddr;
>>>>> +}
>>>>> +
>>>>> +static long tmc_sg_get_rwp_offset(struct tmc_drvdata *drvdata)
>>>>> +{
>>>>> +       struct etr_buf *etr_buf = drvdata->sysfs_buf;
>>>>> +       struct etr_sg_table *etr_table = etr_buf->private;
>>>>> +       struct tmc_sg_table *table = etr_table->sg_table;
>>>>> +       long w_offset;
>>>>> +       u64 rwp;
>>>>> +
>>>>
>>>> Same comments as above
>>>>
>>>>> +       rwp = tmc_read_rwp(drvdata);
>>>>> +       w_offset = tmc_sg_get_data_page_offset(table, rwp);
>>>>> +
>>>>> +       return w_offset;
>>>>> +}
>>>>> +
>>>>> +/*
>>>>> + * Retrieve the offset to the write pointer of the ETR buffer 
>>>>> based on whether
>>>>> + * the memory mode is SG, flat or reserved.
>>>>> + */
>>>>> +long tmc_get_rwp_offset(struct tmc_drvdata *drvdata)
>>>>> +{
>>>>> +       struct etr_buf *etr_buf = drvdata->sysfs_buf;
>>>>> +
>>>>
>>>> As this is an exported function, please ensure that the inputs are
>>>> valid - check the pointers
>>>
>>> Sure, will do.
>>>
>>> Thanks,
>>> Jie
>>>
>>>>
>>>> Code to ensure TMC is flushed and stopped could be inserted here.
>>>>
>>>> Regards
>>>>
>>>> Mike
>>>>
>>>>> +       if (etr_buf->mode == ETR_MODE_ETR_SG)
>>>>> +               return tmc_sg_get_rwp_offset(drvdata);
>>>>> +       else if (etr_buf->mode == ETR_MODE_FLAT || etr_buf->mode == 
>>>>> ETR_MODE_RESRV)
>>>>> +               return tmc_flat_resrv_get_rwp_offset(drvdata);
>>>>> +       else
>>>>> +               return -EINVAL;
>>>>> +}
>>>>> +EXPORT_SYMBOL_GPL(tmc_get_rwp_offset);
>>>>> +
>>>>>    /*
>>>>>     * Alloc pages for the table. Since this will be used by the 
>>>>> device,
>>>>>     * allocate the pages closer to the device (i.e, dev_to_node(dev)
>>>>> diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/ 
>>>>> hwtracing/coresight/coresight-tmc.h
>>>>> index b48bc9a01cc0..baedb4dcfc3f 100644
>>>>> --- a/drivers/hwtracing/coresight/coresight-tmc.h
>>>>> +++ b/drivers/hwtracing/coresight/coresight-tmc.h
>>>>> @@ -442,5 +442,6 @@ void tmc_etr_remove_catu_ops(void);
>>>>>    struct etr_buf *tmc_etr_get_buffer(struct coresight_device *csdev,
>>>>>                                      enum cs_mode mode, void *data);
>>>>>    extern const struct attribute_group coresight_etr_group;
>>>>> +long tmc_get_rwp_offset(struct tmc_drvdata *drvdata);
>>>>>
>>>>>    #endif
>>>>> -- 
>>>>> 2.34.1
>>>>>
>>>>
>>>>
>>>
>>
>>
>> -- 
>> Mike Leach
>> Principal Engineer, ARM Ltd.
>> Manchester Design Centre. UK
> 
> 


