Return-Path: <linux-arm-msm+bounces-60431-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D4391ACFB66
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jun 2025 04:53:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 31B69189974B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jun 2025 02:53:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61F3E1DDC2B;
	Fri,  6 Jun 2025 02:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ZlvN/ilf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 968221DB92A;
	Fri,  6 Jun 2025 02:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749178409; cv=none; b=nOHg2HYaZ9okao9rV0fuTG8kg6M26ZbClKNC9qTr/iXSD5mYzivPLIqCCOQndlo9YVPd70yAoumf9O2227/NYiOZk813wV0dpqluxtiZz4y1hmkCB3KFpfqRJPCpF07vw8PnmX01znI9x07RQ++cObuCEquHlTddVmw3QTEyhEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749178409; c=relaxed/simple;
	bh=oKXHt2xNElvdrwLbvuH8zXl/Pm0/yADbiOBihvnREdw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=OHJ+l4InRgn7LWIo5cQinkac0xdQo4UaM1jTDpvOPAxpw5NR50b1KB7J7xaAXNbjQD4h/iIHyRsLyYBiKbEZON7Us8QCVk09A7psHn4d0uiMgM7McFNordKQO1pSZ4jAZH/Be4VFSuIyrDoa5re7IvNzN64tqljeGYy+3N3BvtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ZlvN/ilf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 555LxXou015941;
	Fri, 6 Jun 2025 02:53:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p4aqS1EcZlPmCBknfbQUQSApoc5YWVK39jjHlnyhtj8=; b=ZlvN/ilfNsgtwLpx
	tqiyXfmpN40w0IDrvh41FqU+VK4iPMtvSNv1AjQhWl1xwGnz7NtTilulwFoo8D51
	yfofa6TwzEl6gFU6+pR8TsRNNGiz04Fspirz2Gf92HLTUeKzJg7Y+1aU7Q3nRUA/
	lPbER7Ylm01P1kHHO9UyPccJOGHYey8grFvwNqOQYe66Fk14GG974tz+tUbe82Ln
	1+Tsyy54EFs/uN6R/BjFy1R3qoZzD6CcgjuekiNCgSbNIjMW0GnOKv2Mssjfq5fl
	bXfAF89l2jKibFvlc+ghWmVeaI4N7FpNPdA8nVKa8MaocWtkCuH808UFxzRzPcWW
	pOu0TA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471sfv25k2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Jun 2025 02:53:05 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5562r4IA003336
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Jun 2025 02:53:04 GMT
Received: from [10.239.133.242] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 5 Jun 2025
 19:53:00 -0700
Message-ID: <4560b19f-f2af-46b5-b49b-50b76853b5aa@quicinc.com>
Date: Fri, 6 Jun 2025 10:52:30 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/7] coresight-tgu: Add signal priority support
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
CC: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>, James Clark <james.clark@arm.com>,
        Alexander
 Shishkin <alexander.shishkin@linux.intel.com>,
        Andy Gross
	<agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring
	<robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, <linux-kernel@vger.kernel.org>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>
References: <20250529081949.26493-1-quic_songchai@quicinc.com>
 <20250529081949.26493-4-quic_songchai@quicinc.com>
 <20250529122950.00001fe6@huawei.com>
Content-Language: en-US
From: songchai <quic_songchai@quicinc.com>
In-Reply-To: <20250529122950.00001fe6@huawei.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=CY8I5Krl c=1 sm=1 tr=0 ts=68425811 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8
 a=X4TdNiw41qlh8ADdsPYA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: QUUh3cJdNgfQZ4Kz2CjdfCbtrmDPho3c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDAyNiBTYWx0ZWRfX0P+dFMbD+4Ra
 dynD/rBSJ1XrH7+/tcATqoVPhULSy4eYBgTamX1Xcra35pyQjALYxvOosXq512t/w8FI6YBiGE3
 4tPTPdFpmr6lly1AlZjesfhfsxr6EGKf7gakFyXBrDPIZd7Zn+yaD9UA6jxzCwiMP3s5nAOhcoI
 0bq0VW79IcXLi2hK08BzdC+NtNjXNIV+t/7ZN93TlxCn2/tAKwqfFhGayL39u+AVo4plsKESGLX
 a27l7s77tPZEcM+E7qVBVFbMf70XKys+PZqHCc6OHZh3WVr6hJ+QMH/erhTomr6j0Nr5IcIn5io
 VPjPlcQHEVykpsP58QgXl7RI5NcOXZNT4Xe8z5nNtqe2aSX9sHHFKXRAKAxLLOuRLiByMPR/Oak
 8/DvDJizuvKM/yIlUmc+mILZ3cLuUTzephVMuo3l1HXBsX8VfR3r7ed2hDtkrzQFB7sIQiwe
X-Proofpoint-GUID: QUUh3cJdNgfQZ4Kz2CjdfCbtrmDPho3c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-06_01,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0 adultscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 impostorscore=0
 phishscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506060026


On 5/29/2025 7:29 PM, Jonathan Cameron wrote:
> On Thu, 29 May 2025 16:19:44 +0800
> Songwei Chai <quic_songchai@quicinc.com> wrote:
>
>> Like circuit of a Logic analyzer, in TGU, the requirement could be
>> configured in each step and the trigger will be created once the
>> requirements are met. Add priority functionality here to sort the
>> signals into different priorities. The signal which is wanted could
>> be configured in each step's priority node, the larger number means
>> the higher priority and the signal with higher priority will be sensed
>> more preferentially.
>>
>> Signed-off-by: Songwei Chai <quic_songchai@quicinc.com>
>
>> diff --git a/drivers/hwtracing/coresight/coresight-tgu.h b/drivers/hwtracing/coresight/coresight-tgu.h
>> index 6c849a2f78fa..f07ead505365 100644
>> --- a/drivers/hwtracing/coresight/coresight-tgu.h
>> +++ b/drivers/hwtracing/coresight/coresight-tgu.h
>> @@ -13,6 +13,112 @@
>> +enum operation_index {
>> +	TGU_PRIORITY0,
>> +	TGU_PRIORITY1,
>> +	TGU_PRIORITY2,
>> +	TGU_PRIORITY3
> No blank line.  Also convention on anything other than a terminating entry
> is to leave the trailing ,
It will be adopted in the next version.
>> +
>> +};
>> +
>>   /**
>>    * struct tgu_drvdata - Data structure for a TGU (Trigger Generator Unit)
>>    * @base: Memory-mapped base address of the TGU device
>> @@ -20,6 +126,9 @@
>>    * @csdev: Pointer to the associated coresight device
>>    * @spinlock: Spinlock for handling concurrent access
>>    * @enable: Flag indicating whether the TGU device is enabled
>> + * @value_table: Store given value based on relevant parameters.
>> + * @max_reg: Maximum number of registers
>> + * @max_step: Maximum step size
>>    *
>>    * This structure defines the data associated with a TGU device,
>>    * including its base address, device pointers, clock, spinlock for
>> @@ -32,6 +141,9 @@ struct tgu_drvdata {
>>   	struct coresight_device *csdev;
>>   	spinlock_t spinlock;
>>   	bool enable;
>> +	struct value_table *value_table;
>> +	int max_reg;
>> +	int max_step;
> Ah. Here some of the bits missing in previous patch that make
> the description make more sense.  Fair enough.
Thanks.
>
>>   };
>>   
>>   #endif
>>
>>

