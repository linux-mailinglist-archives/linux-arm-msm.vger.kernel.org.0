Return-Path: <linux-arm-msm+bounces-50300-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E01E9A4F3DE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Mar 2025 02:35:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2E4EB18908CF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Mar 2025 01:35:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E43A14A4FF;
	Wed,  5 Mar 2025 01:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mpNBfjRJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB9461428E7;
	Wed,  5 Mar 2025 01:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741138528; cv=none; b=iYYKOj4F41jFMA9PFn50MXs41FLM45CwnwY2NmxijBiYaO8jvPQpGVQVucdaV0FQNnr+Ly5cV4ijtiMO60sEXs7+AG0RZsu+7Ld8ulwNtPsCZ+cianNJXQDnYaG6m8Xa0g/HQvi9HNySEAttIRcSssHx+/zreb9aJtjdtQ7aZOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741138528; c=relaxed/simple;
	bh=1mxRshSolbkoaIKsAkJCRRgE3etEr8qaYvLAZNdMO/8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=PVmyLFAt15jtW/oenmkmgUgU+x29dE79V+o2qDAuxQgBPKOln9NnBNL/6umV7CUPjvccsFdjH+nPL8U2kLUTxqW8rlH3cKKPRsRyAkwkqs8MUmQ4LqGiZA2V0FpQIde0NR+nsGhjrqvRwsgv4Nd8FhW0P6Ga/XeSwiy5HqXJOzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mpNBfjRJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 524NADJ9025365;
	Wed, 5 Mar 2025 01:35:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nLs+5SLZJ4qjajbg8dAv5Pp89mRUdsV9Rqw/s+IwB34=; b=mpNBfjRJri4AhMhC
	CMDTZzya5nC8OwRGnHt8JCnDV3zYqX67KpoeVRLDh29Kj9zjBPJAWaA+1aUA1EfZ
	hXhDY6j80xJDYxEqHWlDYbt0CbVh41rdednZ22U4pqPfXXscQsYiDPLMnvCiRH7U
	rVPzPpu2czdSgihoqVOpJ6euUOuPhik7fG0lGjaP9jMrxQkQsftty3a7+L+4+mJ4
	+7/esdeAA7M3EaeuEyttv8bwUn4/Y/8mMb5jURgWJ5p1pxl4o+YpkW4BRF+dPfr2
	3WbP2vxHtlcsk49s1RqhuV1giYkgBFWquMnw0y8gSJhwapQOvu9iknyR1jlmVHea
	Lru1RQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 455p933q6f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Mar 2025 01:35:03 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5251Z3fZ020582
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 5 Mar 2025 01:35:03 GMT
Received: from [10.64.68.153] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 4 Mar 2025
 17:34:58 -0800
Message-ID: <bb2f4a5d-1a93-4637-908d-316516213061@quicinc.com>
Date: Wed, 5 Mar 2025 09:34:56 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 04/10] Coresight: Introduce a new struct
 coresight_path
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
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
CC: Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Jinlong Mao
	<quic_jinlmao@quicinc.com>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
References: <20250303032931.2500935-1-quic_jiegan@quicinc.com>
 <20250303032931.2500935-5-quic_jiegan@quicinc.com>
 <4e0959e7-cb66-41f1-b686-a274b6cbfd2e@arm.com>
Content-Language: en-US
From: Jie Gan <quic_jiegan@quicinc.com>
In-Reply-To: <4e0959e7-cb66-41f1-b686-a274b6cbfd2e@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=Me2Wu4/f c=1 sm=1 tr=0 ts=67c7aa48 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=BNzsuDOjKBzrTUwNBxAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: O5Xb635ZTtY1EM7RJ_0yyvJwNWqU69Zj
X-Proofpoint-ORIG-GUID: O5Xb635ZTtY1EM7RJ_0yyvJwNWqU69Zj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-05_01,2025-03-04_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1015
 suspectscore=0 mlxscore=0 malwarescore=0 phishscore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 mlxlogscore=999 priorityscore=1501
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503050010



On 3/5/2025 12:10 AM, Suzuki K Poulose wrote:
> On 03/03/2025 03:29, Jie Gan wrote:
>> Introduce a new strcuture, 'struct coresight_path', to store the data 
>> that
>> utilized by the devices in the path. The coresight_path will be built/ 
>> released
>> by coresight_build_path/coresight_release_path functions.
>>
>> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
>> ---
>>   drivers/hwtracing/coresight/coresight-core.c  | 16 +++++-----
>>   .../hwtracing/coresight/coresight-etm-perf.c  | 30 ++++++++++---------
>>   .../hwtracing/coresight/coresight-etm-perf.h  |  2 +-
>>   drivers/hwtracing/coresight/coresight-priv.h  |  6 ++--
>>   drivers/hwtracing/coresight/coresight-sysfs.c | 12 ++++----
>>   include/linux/coresight.h                     | 10 +++++++
>>   6 files changed, 44 insertions(+), 32 deletions(-)
>>
> 
> ...
> 
>> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
>> index ce9a5e71b261..67cf8bdbe5c0 100644
>> --- a/include/linux/coresight.h
>> +++ b/include/linux/coresight.h
>> @@ -329,6 +329,16 @@ static struct coresight_dev_list (var) = 
>> {                \
>>   #define to_coresight_device(d) container_of(d, struct 
>> coresight_device, dev)
>> +/**
>> + * struct coresight_path - data needed by enable/disable path
>> + * @path:              path from source to sink.
> 
> This doesn't match the actual variable below.

Hi Suzuki,

Very sorry for the mistake. I should spot it in advance. I will take 
care and enhance the self-checking process in the future.

Jie

> 
>> + * @trace_id:          trace_id of the whole path.
>> + */
>> +struct coresight_path {
>> +    struct list_head    path_list;
>> +    u8            trace_id;
>> +};
>> +
>>   enum cs_mode {
>>       CS_MODE_DISABLED,
>>       CS_MODE_SYSFS,
> 
> Suzuki


