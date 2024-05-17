Return-Path: <linux-arm-msm+bounces-20005-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F26ED8C8AEF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 May 2024 19:26:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 699C91F2101D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 May 2024 17:26:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 847F413DBBF;
	Fri, 17 May 2024 17:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Kd0yH2xr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E437038DD6;
	Fri, 17 May 2024 17:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715966776; cv=none; b=no9d+u5u9aww1YiaBAGEANgAcgppkcLfa5aHC/lvX9u2KPfGckGhOq6NE0IyZODcYhBVpKXYNRHW9YwkQp88QlriGs8lIp+ojUNqnwPpScISxs22pj4YuZt2ETlXuqvJO8zGZiZ4hS+e9Ai02cF8D8S7QyL3sF38j5LEbzPQ0o4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715966776; c=relaxed/simple;
	bh=0M3HYSdEmubxOzs/jcX7oAnPF/iNS8AiC7WXi8DwIRA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=fpumou0DLaxTSj3P4FVrLLjt0cWdEwWXW7r16U88q24mt3si3ZvX4IR8g+dirYjYTH0t7pBuhRgMx5Iq8dkjYYnz/BL2hP7qwcNRU6aLylvg0vigkcoe07MXjdkXvZ9xaY/Vz0+Q/ZNKnF+04hb8ZERI0orz41TIPi2SezHz03U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Kd0yH2xr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44H887hm007325;
	Fri, 17 May 2024 17:25:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=gLVVj3IpTMDOAfQJiNsX9fmZxMsVPG8Kxu10qlV2sjY=; b=Kd
	0yH2xrdS7mqMMysI3ADZYa8rRXZdNSY5mbAn4DrvuIngbUa9FS/98CqDqHshw8Ee
	cQzTeilZ7/HuT9O8OlG83JKw6bidRJnWPDwwK2B0y1LJibh8iN9bjMaIrkWlIVsb
	ACjj1ck65ByXm4pB0zIo7eigOg7UyIY9QqrqfawBSfcb3fU/8oAB7+XZV9EZEc0h
	GhXFWcHLUtSjLTQo+/xQWAnwif0BRVD675S6TOzqRHvNfRpqd6aepbsiYA1U0wvM
	KQZIp/OEu4blXaGHGSQFMVy4KRrmUeuTA9z29zHS78XzNKRMj/bmTRRJfzrOFA3I
	asf3q13i1tG8//uYYKOg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y51tunesg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 May 2024 17:25:58 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44HHPvSn025836
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 May 2024 17:25:57 GMT
Received: from [10.110.27.85] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 17 May
 2024 10:25:56 -0700
Message-ID: <87e2a55c-4b8c-40e0-b371-aaae40e5e876@quicinc.com>
Date: Fri, 17 May 2024 10:25:55 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] remoteproc: qcom_q6v5_pas: Add hwspinlock bust on
 stop
To: Mukesh Ojha <quic_mojha@quicinc.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        "Peter
 Zijlstra" <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, Will Deacon
	<will@kernel.org>,
        Waiman Long <longman@redhat.com>, Boqun Feng
	<boqun.feng@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Richard Maina <quic_rmaina@quicinc.com>
References: <20240516-hwspinlock-bust-v1-0-47a90a859238@quicinc.com>
 <20240516-hwspinlock-bust-v1-6-47a90a859238@quicinc.com>
 <1238fa39-f0da-fb4c-0668-caa946505373@quicinc.com>
Content-Language: en-US
From: Chris Lew <quic_clew@quicinc.com>
In-Reply-To: <1238fa39-f0da-fb4c-0668-caa946505373@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: hUOpJDWfPmO--lYc7lk1l-UrlwupcZOQ
X-Proofpoint-GUID: hUOpJDWfPmO--lYc7lk1l-UrlwupcZOQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-17_07,2024-05-17_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 mlxscore=0 lowpriorityscore=0 mlxlogscore=999 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405170136



On 5/17/2024 12:21 AM, Mukesh Ojha wrote:
> 
> 
> On 5/17/2024 4:28 AM, Chris Lew wrote:
>> From: Richard Maina <quic_rmaina@quicinc.com>
>>
>> When remoteproc goes down unexpectedly this results in a state where any
>> acquired hwspinlocks will remain locked possibly resulting in deadlock.
>> In order to ensure all locks are freed we include a call to
>> hwspin_lock_bust() during remoteproc shutdown.
>>
>> For qcom_q6v5_pas remoteprocs, each remoteproc has an assigned id that
>> is used to take the hwspinlock. Remoteproc should use this id to try and
>> bust the lock on remoteproc stop.
>>
>> This edge case only occurs with q6v5_pas watchdog crashes. The error
>> fatal case has handling to clear the hwspinlock before the error fatal
>> interrupt is triggered.
>>
>> Signed-off-by: Richard Maina <quic_rmaina@quicinc.com>
>> Signed-off-by: Chris Lew <quic_clew@quicinc.com>
>> ---
>>   drivers/remoteproc/qcom_q6v5_pas.c | 28 ++++++++++++++++++++++++++++
>>   1 file changed, 28 insertions(+)
>>
>> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c 
>> b/drivers/remoteproc/qcom_q6v5_pas.c
>> index 54d8005d40a3..57178fcb9aa3 100644
>> --- a/drivers/remoteproc/qcom_q6v5_pas.c
>> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
>> @@ -10,6 +10,7 @@
>>   #include <linux/clk.h>
>>   #include <linux/delay.h>
>>   #include <linux/firmware.h>
>> +#include <linux/hwspinlock.h>
>>   #include <linux/interrupt.h>
>>   #include <linux/kernel.h>
>>   #include <linux/module.h>
>> @@ -52,6 +53,7 @@ struct adsp_data {
>>       const char *ssr_name;
>>       const char *sysmon_name;
>>       int ssctl_id;
>> +    int hwlock_id;
>>       int region_assign_idx;
>>       int region_assign_count;
>> @@ -84,6 +86,9 @@ struct qcom_adsp {
>>       bool decrypt_shutdown;
>>       const char *info_name;
>> +    struct hwspinlock *hwlock;
>> +    int hwlock_id;
>> +
>>       const struct firmware *firmware;
>>       const struct firmware *dtb_firmware;
>> @@ -399,6 +404,12 @@ static int adsp_stop(struct rproc *rproc)
>>       if (handover)
>>           qcom_pas_handover(&adsp->q6v5);
>> +    if (adsp->hwlock) {
>> +        ret = hwspin_lock_bust(adsp->hwlock, adsp->hwlock_id);
>> +        if (ret)
>> +            dev_info(adsp->dev, "failed to bust hwspinlock\n");
>> +    }
>> +
> 
> As you said above, you seem to cover only wdog case and fatal cases
> are already handled at remote;
> 
> You are clearing here for both ? is this right understanding ?
> 

Yes that is correct. While the firmware is able to handle error fatal 
cases, I think it is still the responsibility of the remoteproc driver 
to try and bust the lock on behalf of the rproc in both cases.

The bust will only clear the spinlock if it has the token (specific id 
for that rproc) that is passed into hwspin_lock_bust, so it is safe to 
attempt this even if the value has been cleared by the rproc in the 
error fatal case.

> -Mukesh

