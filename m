Return-Path: <linux-arm-msm+bounces-50808-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1369BA590F2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 11:20:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AC4137A462D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 10:19:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90EE2225A59;
	Mon, 10 Mar 2025 10:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LxHS36tT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C099A2253A5;
	Mon, 10 Mar 2025 10:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741602008; cv=none; b=OKa6PJ5zgDhV4sXTxMg/1ggI9SxQyXkgXwW2dBruNXR1IkWl3OxL/Qpq1cl5JA3y6hx7LyWhwLYlWtG3kXAg67gTHxleiXpVVHJXJMB862eCabYqgXzx1hy10dSvlrS/XoeLQDPCcr/5QDHlIHgbvXMwsg/W2L6v55ldMvqch0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741602008; c=relaxed/simple;
	bh=8qM1aVMmeGgCsR7IRGnjZZf9UubaZgxvBRXuVoJZQ18=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=HRXAxCst/rwd1Dl5hsP/52EOcQ4eW72O50Jw2Y772ISa5Jmfw8aPoIcbY8ZWq5bPi5P5VU8q8EK4WVDu3VVHLkM2QznRc8rhDecwZ7gjB2uva/2lEZWq4fUvdlD93dTXdWEAnLAe2LZfCiiiaTMA6CD5W+6y2hlE9RBVad0NlP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LxHS36tT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52A9dkt2022356;
	Mon, 10 Mar 2025 10:19:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hl+H8c0VN2y3MHqhFSWjgt5uhq3MRlviyoIT8w9wikY=; b=LxHS36tTTwZkJeYc
	odgeJYMl6ajG0uY1C68s2eFXH5HT5EpAMRps51OfPSBk5o7w08orWB8MnkbYck7h
	HtNQIEJ5gWhk2V7joG4ws+rfL6YA5Z0HIeYejcjVId7X/kncS+Yn8mul7JHQY6wp
	IRc2tgyZuVLPUXkIiuoEFGIRoYkUgrtXDhfrShWyZxYv/ylBwit3kTZoQI/Qx/DR
	kLn4kgLBTCwNnrBqKX9/hA2e0MTq4m/I72vdmToIvYZIKLpa2G5FMQ4P+Ue0UjgY
	fbUFhtGqBEtGhD4MKarpptkXa8uo9LjtcN2ve03HseWW0VnA3FE8NTCX0NSRe78l
	+kYxYA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 458eyucffy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Mar 2025 10:19:57 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52AAJuke028140
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Mar 2025 10:19:56 GMT
Received: from [10.64.68.153] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 10 Mar
 2025 03:19:53 -0700
Message-ID: <3fcbf259-aea5-4170-b988-1c23a3472a00@quicinc.com>
Date: Mon, 10 Mar 2025 18:19:51 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: add verification process for
 coresight_etm_get_trace_id
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>
CC: Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Jinlong Mao
	<quic_jinlmao@quicinc.com>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>
References: <20250310022348.1654501-1-quic_jiegan@quicinc.com>
 <23943463-94d0-4e37-b5fa-5efb20015063@arm.com>
Content-Language: en-US
From: Jie Gan <quic_jiegan@quicinc.com>
In-Reply-To: <23943463-94d0-4e37-b5fa-5efb20015063@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=cbIormDM c=1 sm=1 tr=0 ts=67cebccd cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=sWKEhP36mHoA:10 a=COk6AnOGAAAA:8 a=Z-hf14rMMggIjEe8M9kA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: j3XkgYo3YQJ347maH5L7Z7l8rzPymOpt
X-Proofpoint-GUID: j3XkgYo3YQJ347maH5L7Z7l8rzPymOpt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-10_04,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 impostorscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0 mlxlogscore=999
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503100081



On 3/10/2025 6:17 PM, Suzuki K Poulose wrote:
> On 10/03/2025 02:23, Jie Gan wrote:
>> The coresight_etm_get_trace_id function is a global function. The
>> verification process for 'csdev' is required prior to its usage.
>>
>> Fixes: c367a89dec26 ("Coresight: Add trace_id function to retrieving 
>> the trace ID")
>> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
>> ---
>>   drivers/hwtracing/coresight/coresight-core.c | 7 +++++--
>>   1 file changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/ 
>> hwtracing/coresight/coresight-core.c
>> index bd0a7edd38c9..5a7cd2376e2d 100644
>> --- a/drivers/hwtracing/coresight/coresight-core.c
>> +++ b/drivers/hwtracing/coresight/coresight-core.c
>> @@ -1616,9 +1616,12 @@ EXPORT_SYMBOL_GPL(coresight_remove_driver);
>>   int coresight_etm_get_trace_id(struct coresight_device *csdev, enum 
>> cs_mode mode,
>>                      struct coresight_device *sink)
>>   {
>> -    int trace_id;
>> -    int cpu = source_ops(csdev)->cpu_id(csdev);
>> +    int cpu, trace_id;
>> +
>> +    if (csdev->type != CORESIGHT_DEV_TYPE_SOURCE && ! 
>> source_ops(csdev)->cpu_id)
> 
> That must be :
> 
>      csdev->type != CORESIGHT_DEV_TYPE_SOURCE || !source_ops(csdev)- 
>  >cpu_id)
> 
> 
> Suzuki

Hi Suzuki,

Yes, you are right. I made a big mistake. It should return an error 
number if one of the conditions failed.

Sorry about that, will send another patch to fix it.

Thanks,
Jie

> 
> 
>> +        return -EINVAL;
>> +    cpu = source_ops(csdev)->cpu_id(csdev);
>>       switch (mode) {
>>       case CS_MODE_SYSFS:
>>           trace_id = coresight_trace_id_get_cpu_id(cpu);
> 


