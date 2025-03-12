Return-Path: <linux-arm-msm+bounces-51083-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 418ECA5D3F7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 02:21:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6DABE165E26
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 01:21:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09DD34CB5B;
	Wed, 12 Mar 2025 01:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="MJYsyrSx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DED85684;
	Wed, 12 Mar 2025 01:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741742473; cv=none; b=SC4n0tapUPWrYYK0VqCkR2PptLnx6ERhMSKyp2NsbORH5PpiVmd8W+vzJO+jkyRuQgk5fVHPjo8Gbr4I3gOnY0iv09rXS+dLXv58TEUF43pUJVLNI4KcPMND5z8sV47Jg1c9S5i3Pci/4seq0oI4AJRPBUVoVPCdy+WyCErPXO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741742473; c=relaxed/simple;
	bh=6a5cA9bmg/w9z4v7zievcrpf4I/JzZrTDotNHRzORqo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=MueYfDP/E0/WAin8rAgX+3vAZPllKac8bQXChmLi+knwzkOBNyHJ+wzYip6hqNbKmJ1RmPMD8gfnBCfRrprlRR3DEAX1NzqKe6R19F4wl6O1FysWnGTCFHnUE9GyVJ9G8UpBcVyTuf/EApCjjK9lydTshAjQk1xC8DRDgKFFwss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=MJYsyrSx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52BMH9hj015193;
	Wed, 12 Mar 2025 01:20:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gOAaVlaEm/vfp/T65ZkmYZIul8TnOLOP/BkOedl/Co4=; b=MJYsyrSxqwa72554
	es28Bq8SS2qbWCTxhERCuD/t9iqOL4teB3v+9eHi4LjYMk+Z0zHRy4MGwZjgzbbO
	6zcBadwrW+/DMscFdDPpOZbdwutZLi5mGTcB7rfEJd+/FwdfWTvLqmE+NpVlCv7t
	G8DdDa/Xp2pwfe0k58/1AYOUW85BwnpTJDSB6GscLm82dwUvQMRbUCPkQWsa3V+E
	pwTM0Hu2PIgud+4K0SdoTg2ZMR4xXf/pukGC/k0RclWxkfuBe7d0rnraxG4cq02Q
	srXVWioUM8I1QVgKErfKQ08BvDERjBRDmGQFE5g/KmPkP4zt9sJH8T/l1cxzWIVA
	Cu0qIw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45au2nrq65-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Mar 2025 01:20:51 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52C1Ko4M030795
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Mar 2025 01:20:50 GMT
Received: from [10.64.68.153] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 11 Mar
 2025 18:20:46 -0700
Message-ID: <cef984d5-f369-4892-b970-a71285c2ebc5@quicinc.com>
Date: Wed, 12 Mar 2025 09:20:44 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/4] coresight: tmc: Introduce new APIs to get the RWP
 offset of ETR buffer
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
Content-Language: en-US
From: Jie Gan <quic_jiegan@quicinc.com>
In-Reply-To: <CAJ9a7Vh7PmBBbvwnUETfCYrTSiXNzeiWpsz+XAGaUWt1Rq1aZw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: WX4PUy9R_3aW-j0jtHmsAp8SKORZRZA2
X-Authority-Analysis: v=2.4 cv=ZObXmW7b c=1 sm=1 tr=0 ts=67d0e173 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=V1Y4aJ5uuwzZXcr4G30A:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: WX4PUy9R_3aW-j0jtHmsAp8SKORZRZA2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-12_01,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 mlxscore=0
 suspectscore=0 adultscore=0 impostorscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503120007



On 3/12/2025 12:49 AM, Mike Leach wrote:
> Hi,
> 
> On Mon, 10 Mar 2025 at 09:04, Jie Gan <quic_jiegan@quicinc.com> wrote:
>>
>> The new functions calculate and return the offset to the write pointer of
>> the ETR buffer based on whether the memory mode is SG, flat or reserved.
>> The functions have the RWP offset can directly read data from ETR buffer,
>> enabling the transfer of data to any required location.
>>
>> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
>> ---
>>   .../hwtracing/coresight/coresight-tmc-etr.c   | 40 +++++++++++++++++++
>>   drivers/hwtracing/coresight/coresight-tmc.h   |  1 +
>>   2 files changed, 41 insertions(+)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
>> index eda7cdad0e2b..ec636ab1fd75 100644
>> --- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
>> +++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
>> @@ -267,6 +267,46 @@ void tmc_free_sg_table(struct tmc_sg_table *sg_table)
>>   }
>>   EXPORT_SYMBOL_GPL(tmc_free_sg_table);
>>
>> +static long tmc_flat_resrv_get_rwp_offset(struct tmc_drvdata *drvdata)
>> +{
>> +       dma_addr_t paddr = drvdata->sysfs_buf->hwaddr;
>> +       u64 rwp;
>> +
> 
> It is not valid to read RWP if the TMC is running. It must be in the
> stopped or disabled state - see the specifications for TMC /ETR
> 
> It is likely that CSUNLOCK / CSLOCK are needed here too,  along with
> the spinlock that protects drvdata
> 
> See the code in coresight_tmc_etr.c :-
> 
> e.g. in
> 
> tmc_update_etr_buffer()
> 
> ...
> <take spinlock>
> ...
> CS_UNLOCK(drvdata->base);
> tmc_flush_and_stop(drvdata); // this ensures tmc is stopped and
> flushed to memory - essential to ensure full formatted frame is in
> memory.
> tmc_sync_etr_buf(drvdata); // this function reads rwp.
> CS_LOCK(drvdata->base);
> <release spinlokc>
> 
> This type of program flow is common to both sysfs and perf handling of
> TMC buffers.

Hi Mike,

I am fully understood your point here.

The function is designed this way to read the w_offset (which may not be 
entirely accurate because the etr buffer is not synced) when the 
byte-cntr devnode is opened, aiming to reduce the length of redundant 
trace data. In this case, we cannot ensure the TMC is stopped or 
disabled. The byte-cntr only requires an offset to know where it can 
start before the expected trace data gets into ETR buffer.

The w_offset is also read when the byte-cntr function stops, which 
occurs after the TMC is disabled.

Maybe this is not a good idea and I should read r_offset upon open?
The primary goal for byte-cntr is trying to transfer useful trace data 
from the ETR buffer to the userspace, if we start from r_offset, a large 
number of redundant trace data which the user does not expect will be 
transferred simultaneously.


> 
>> +       rwp = tmc_read_rwp(drvdata);
>> +       return rwp - paddr;
>> +}
>> +
>> +static long tmc_sg_get_rwp_offset(struct tmc_drvdata *drvdata)
>> +{
>> +       struct etr_buf *etr_buf = drvdata->sysfs_buf;
>> +       struct etr_sg_table *etr_table = etr_buf->private;
>> +       struct tmc_sg_table *table = etr_table->sg_table;
>> +       long w_offset;
>> +       u64 rwp;
>> +
> 
> Same comments as above
> 
>> +       rwp = tmc_read_rwp(drvdata);
>> +       w_offset = tmc_sg_get_data_page_offset(table, rwp);
>> +
>> +       return w_offset;
>> +}
>> +
>> +/*
>> + * Retrieve the offset to the write pointer of the ETR buffer based on whether
>> + * the memory mode is SG, flat or reserved.
>> + */
>> +long tmc_get_rwp_offset(struct tmc_drvdata *drvdata)
>> +{
>> +       struct etr_buf *etr_buf = drvdata->sysfs_buf;
>> +
> 
> As this is an exported function, please ensure that the inputs are
> valid - check the pointers

Sure, will do.

Thanks,
Jie

> 
> Code to ensure TMC is flushed and stopped could be inserted here.
> 
> Regards
> 
> Mike
> 
>> +       if (etr_buf->mode == ETR_MODE_ETR_SG)
>> +               return tmc_sg_get_rwp_offset(drvdata);
>> +       else if (etr_buf->mode == ETR_MODE_FLAT || etr_buf->mode == ETR_MODE_RESRV)
>> +               return tmc_flat_resrv_get_rwp_offset(drvdata);
>> +       else
>> +               return -EINVAL;
>> +}
>> +EXPORT_SYMBOL_GPL(tmc_get_rwp_offset);
>> +
>>   /*
>>    * Alloc pages for the table. Since this will be used by the device,
>>    * allocate the pages closer to the device (i.e, dev_to_node(dev)
>> diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
>> index b48bc9a01cc0..baedb4dcfc3f 100644
>> --- a/drivers/hwtracing/coresight/coresight-tmc.h
>> +++ b/drivers/hwtracing/coresight/coresight-tmc.h
>> @@ -442,5 +442,6 @@ void tmc_etr_remove_catu_ops(void);
>>   struct etr_buf *tmc_etr_get_buffer(struct coresight_device *csdev,
>>                                     enum cs_mode mode, void *data);
>>   extern const struct attribute_group coresight_etr_group;
>> +long tmc_get_rwp_offset(struct tmc_drvdata *drvdata);
>>
>>   #endif
>> --
>> 2.34.1
>>
> 
> 


