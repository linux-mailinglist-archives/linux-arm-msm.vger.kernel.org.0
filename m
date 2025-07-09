Return-Path: <linux-arm-msm+bounces-64138-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6476AFE2B3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 10:33:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 53FD7486FA1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 08:32:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B82F27511E;
	Wed,  9 Jul 2025 08:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WZSBR7BL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C457276030
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Jul 2025 08:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752049941; cv=none; b=ut+G0yiJUBpLb3fMpOdkjGkoHLYhPD43yhbvrOJ2jLGFAVhMrbu1qf+0fsPrp0vmJ1b5VuC9zmB4C1UVH+3HraMEBNtKHLEZurotcpUdeXUCceXDS2m+zINrYHzgJxI2po97BgU8XAlcco8L5JPdSagNhpUB+XK+JibJTF4OJG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752049941; c=relaxed/simple;
	bh=DzcH7L60UbeOJ9WOUsF8qxsGcS7+hgTpKAgmlponWSI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d6LddJfJ+bGIdh1fbkTtn66vqgXSnSEvne12PQmwUnGptqb54jgcTVjJSxFKO6fuPZ8szCKfN6YTD3/uFhSYIf2+iyyxyESdrt4blFJ3hb64tPbSq9ZzCk1ymEpsIKW+zWhtpbU1mR48KrQREwuqG3htswOtrsxY8KdmQ6ZLFos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WZSBR7BL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5698R9FR029138
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Jul 2025 08:32:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AEc/ZNFmxnMuleR9FhMEb0OULDquczMqvJCfIuUAe8U=; b=WZSBR7BLHEagmRl5
	rwWr0YWWaDnIhlQGDUzVVYTUESQ1ALhOfI8h+wBnANG2Atyh4CZQBk17oBrgZxtr
	bOYbddBy1A8xEFGQl/hZfpKsnet0m5TyggaSgRcI9BPg1RMy+72kZriYoRIEuaba
	/kKwLwa5DycQ2FLAOKndTf3+bpPMJ8QFrHbOZrzmWXM4LLx/G3VS29GtYBsAmBA8
	IaHFHqA8OVgel+o/Mjw2zCCB78uDZKzf+3/64FLCdBhRGke7Z0oABVWnLhd2YY10
	CUAfElFQzBdb6f46IpkNT8D8SPXKGSytf7aZhA0ju8mcjnlvueDLSc2s7mkOwTFF
	WwYQIg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pu2bbg9x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Jul 2025 08:32:18 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b350d850677so3435366a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Jul 2025 01:32:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752049937; x=1752654737;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AEc/ZNFmxnMuleR9FhMEb0OULDquczMqvJCfIuUAe8U=;
        b=XKvKnnDS78QSotvbEfrPSjxz3DM03L97KHdwm06GdwSCeoict8Lpgshgib/s/8mSPm
         WGrvOdR0HgpYMr1ZoxrHkbLPvn77Vmm99PiikBYg6EFAdh+PtJgaKIluooMOIkJf0zY7
         3qMit5tEDDtxXQo1+FuCQ6gBYZTEL9ICqg+M5ttohiF4C1iB+oeDZpm+oDTlFouByv8d
         UCCDwx8qtyUtFC9ad9VdgB+KUbU04EbM4pVs3mVn+d4HktxG3iGLInsWC944aKSUpkrC
         UQzy7QwioDb9zCZKfP6HYLFHQZGTUb9W7mIwBFkPXKgugXJTJi9mz+dRN/ezVO5RT3/m
         w3xA==
X-Forwarded-Encrypted: i=1; AJvYcCXwJ+J/kfkEdsFRP9VhBVWnxxDTd8uvBPrxMQNFSS0eF5MPIxFdDssRZ67x84LHmMisj0qn058G+Xva4hk9@vger.kernel.org
X-Gm-Message-State: AOJu0YxW9NC+G1Sh+BKeINiyusnHwzQanlatdkEpjTxIfWAs3F6fUY4G
	v4MeNI/M6qYbjrMUhV0i6kFn+QC45ulpywMR9hFFfE8Lxuef2PWhiKEu7KR3lUkD1xKX9KNLBhD
	5iPlRpdo+Rjj9AK9H5mkfRD7qRUWz0br/P2WIkfR2qVsZLGp38S3qY83KTEe4SrLYBVpJ
X-Gm-Gg: ASbGncsNQLRFiWoDiQs6aKVJubg5bKkxshQ39KznPTvz5MROACWMgx3JMS9iMEDgXtY
	Kl/xKzir6WvETuQMXbULUvpsLwxHnrDrA7RDBOkTSW1mM+U5TX3TanuH+F3VTVLXCpUJUVwFOEf
	Z9JEujfcQEOxGKZmmTh2FVXPQoHkH03/xLzwyQSFZbo58+UiyEEVGS1x2A47jqrxvYbJ5hV81JM
	k12Fd4yqNmgcMr4LnSbw5tldB9EymfJT1/wcAxA5dHmKvITdOP/L8k9v8uNaI0BLsO4umGYovYk
	vGD71urmulkVivM7ZlZeKz21aYTP3m1Qan+iwUK5qW3qXPo=
X-Received: by 2002:a05:6a21:9995:b0:225:7617:66ff with SMTP id adf61e73a8af0-22cd7487ecfmr2576725637.20.1752049937297;
        Wed, 09 Jul 2025 01:32:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF21ezKBzrGdz4BI6Lzw1JTE2T+1doJUN0UmTgSxYTC/KdMGVYc+82ZfcvVJicGxGSuhavU4Q==
X-Received: by 2002:a05:6a21:9995:b0:225:7617:66ff with SMTP id adf61e73a8af0-22cd7487ecfmr2576700637.20.1752049936822;
        Wed, 09 Jul 2025 01:32:16 -0700 (PDT)
Received: from [10.217.199.21] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce417dd7esm15183345b3a.97.2025.07.09.01.32.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Jul 2025 01:32:16 -0700 (PDT)
Message-ID: <803a7bea-68d6-4973-ad2a-0d8721865831@oss.qualcomm.com>
Date: Wed, 9 Jul 2025 14:02:13 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pmdomain: governor: Consider CPU latency tolerance from
 pm_domain_cpu_gov
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20250708-pmdomain_qos-v1-1-7c502f4c901a@oss.qualcomm.com>
 <CAPDyKFrL63Jv4_cUbrjAaU4UtNNDVMpALt41Mu6NbGcAefmWUA@mail.gmail.com>
Content-Language: en-US
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
In-Reply-To: <CAPDyKFrL63Jv4_cUbrjAaU4UtNNDVMpALt41Mu6NbGcAefmWUA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA5MDA3NSBTYWx0ZWRfX6QKOuBMFTeww
 G3ex5he/Mh232YKnDbhrb7MzjJNgG4iEeeY5r0l4sJvQeB4iin39ylxVkkvbHURTwH3uy0M5QiV
 Jl+Ealhex4DewHnih22ojzSxcECNsD13ra56QjaeYmUSFHfpeYYr0qoeUXiZ0H8NWpvrq5btWT2
 mUd/FhXEDBkcXcc5XXSuXl6mwGZG3NiQZJN31rQk3LRre3s+26JF7CZ9GWkRBIyAjDqfJzWwBHN
 9Xtnj1mUSefiDfaSKeusu6lpQ1kKWQ3igzNLDKuQjHbtty98ebDnooqclUCLoExtNQXuKgZpuYE
 hLDz22WlaiEijmnMCX2wk9G+o+FHskr+FK5/9gBAHixjatGUuq2Ha6Wj2G+dhXwigI4BrIjDYfX
 hW8RE8t5gA+e8GuP17VRJ9n2kmrSwtUqnsDBapcyTUXN8DC0IqjZzI9EzNwi3+8aCbf6A63E
X-Proofpoint-ORIG-GUID: rebrtXj1ZfxVh0YOOKsOh21nmlLO9HQq
X-Proofpoint-GUID: rebrtXj1ZfxVh0YOOKsOh21nmlLO9HQq
X-Authority-Analysis: v=2.4 cv=erTfzppX c=1 sm=1 tr=0 ts=686e2912 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=p3CtfcOl4c16AG3dCFcA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-09_02,2025-07-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 mlxlogscore=999 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507090075



On 7/8/2025 8:11 PM, Ulf Hansson wrote:
> On Tue, 8 Jul 2025 at 07:15, Maulik Shah <maulik.shah@oss.qualcomm.com> wrote:
>>
>>
>> diff --git a/drivers/pmdomain/governor.c b/drivers/pmdomain/governor.c
>> index c1e148657c873a6b5b4d9c0f058d54cb020c56e2..d5ac4c1b5b5a432f0072209d17379e58ec891202 100644
>> --- a/drivers/pmdomain/governor.c
>> +++ b/drivers/pmdomain/governor.c
>> @@ -8,6 +8,7 @@
>>  #include <linux/pm_domain.h>
>>  #include <linux/pm_qos.h>
>>  #include <linux/hrtimer.h>
>> +#include <linux/cpu.h>
>>  #include <linux/cpuidle.h>
>>  #include <linux/cpumask.h>
>>  #include <linux/ktime.h>
>> @@ -349,6 +350,8 @@ static bool cpu_power_down_ok(struct dev_pm_domain *pd)
>>         struct cpuidle_device *dev;
>>         ktime_t domain_wakeup, next_hrtimer;
>>         ktime_t now = ktime_get();
>> +       struct device *device;
> 
> Nitpick: Maybe rename to "cpu_dev" to better distinguish between the
> cpuidle_device *dev, above?

Updated in v2.

> 
>> +       s64 cpu_constraint, global_constraint;
>>         s64 idle_duration_ns;
>>         int cpu, i;
>>
>> @@ -359,6 +362,7 @@ static bool cpu_power_down_ok(struct dev_pm_domain *pd)
>>         if (!(genpd->flags & GENPD_FLAG_CPU_DOMAIN))
>>                 return true;
>>
>> +       global_constraint = cpu_latency_qos_limit();
>>         /*
>>          * Find the next wakeup for any of the online CPUs within the PM domain
>>          * and its subdomains. Note, we only need the genpd->cpus, as it already
>> @@ -372,8 +376,16 @@ static bool cpu_power_down_ok(struct dev_pm_domain *pd)
>>                         if (ktime_before(next_hrtimer, domain_wakeup))
>>                                 domain_wakeup = next_hrtimer;
>>                 }
>> +
>> +               device = get_cpu_device(cpu);
>> +               if (device) {
>> +                       cpu_constraint = dev_pm_qos_read_value(device, DEV_PM_QOS_RESUME_LATENCY);
> 
> We should be able to use dev_pm_qos_raw_resume_latency() here, similar
> to how cpuidle_governor_latency_req() does it. I think it's better as
> it avoids acquiring/releasing the spinlock.

Yes, updated to use dev_pm_qos_raw_resume_latency() in v2.

Thanks,
Maulik

