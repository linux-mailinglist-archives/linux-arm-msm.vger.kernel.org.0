Return-Path: <linux-arm-msm+bounces-55238-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3F9A99BEF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 01:20:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B08F3188C111
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 23:20:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 008F221E0B7;
	Wed, 23 Apr 2025 23:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WWtxJWd3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB7322F16E
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 23:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745450408; cv=none; b=K5d1LzDnoPJj2rBdFnS5zl8xOnQUprx3/IXqy/NU39YFle6CaZf7u5dXJu/rMJIq9HowOfgwn/wA5xt42LUaNLJkERpKahbspOFQOhC8NxbATn9IHV9lrKMZDCYI/KBOIbOu0X9kvpG3grKBdYNxrHUAliLS16Qcd8V6wstrQpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745450408; c=relaxed/simple;
	bh=GxZMqnYuxay3VCptew8dlY7FkRAzEVQXjKJd8DhvsBY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u4/hGef7fbp9sURfidR+UpZ2gGK1kDeNHLINCjHfbyZsmRhyogcmB8tryoJHclshpN2e1yFoZN81tziCT2x08hH+hMyuz3IkZv4jccr611/CrE2z8R5kD8P4qAKl5/3wxY74Cy/NY+jZd4+pfZOU/fVhBt7Ze2bhYeOVWguUTuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WWtxJWd3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NLsWrS014435
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 23:20:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HRyddFgEaNgMLLlYJv03Ma5/jy5fT/40JXHI+meT7zI=; b=WWtxJWd36j8NYqvI
	XBhvzejX93bevRBIFj37WA/CGSjNRS9VRGVDhluyJPDXIDoHVJMb6IFGLrHGv6I6
	izIaQWF29lH8ic8VpmuM/KNSg/NReEl6sXXX4cNZ9k7g0TBRSyjr6BPfpp2ARV0K
	AJOupnCVAqk2HwZHcm0MLE8pO8bmMeBRiKbCjAZN4FjD4BZ0vA+12UDGZr7Hs8Mn
	vIlgWMzeNe+ObmZe/8Y0Z4KHqLXFepLHC/7sSEfGw+Onyqaroeoyl+QExrqKN9bL
	jXBSaTYufKYCbohJY9QnfESo9xHsL7qkJgr9FLoaZMNF9faxn2JrEQ7CBkNuvR78
	ZF2dWg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3bmwc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 23:20:05 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3011bee1751so375274a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 16:20:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745450405; x=1746055205;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HRyddFgEaNgMLLlYJv03Ma5/jy5fT/40JXHI+meT7zI=;
        b=FLXDG2WtBX4j9XWJU7uO7qT1qnx5hAJuzZhY1QFrc16Z+MNl7iTmWx7pKEBdeu/MVI
         g4CUupopL50vXZr6LpJYk8IDCYsMQZNbcMtB8MFRD4Qn5G3BNgTSa8fy6eP/YHoVHPmQ
         fH68/6zwiDgzg/FonnEMBeiezWSoUVijBzYd5cVvZolDc8LIHkYl8fAVigeF+VoB173Q
         VrdJ+eTR6nY32sOT3cPcjePzfyOnym3eb8mYxtH34cbHp5p3mXhzjbbTXeLjS8up/hu/
         h9NcMBq2oNvpSy9llCNixubrYwrBwYx0know0Ssh0mA+HdzXrIP4i7iHn9btvNSxoK+l
         QP/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXJB0qjadZljQZ+S5aDO44bPCOfc36PQS3iMdox4cfAt+PxvwoH8QA9Gd6ezxIIE1JqPpqAv6S16jULLK8K@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+sTtnLWiaz1rbKw6sdy0/aKfmNHkNqnh3qPcYDG2LjfDx793k
	3Cxh6PV1sqHEeCygN0Jt/ayJ43BZBMBrptNVXxvDsMfB4a2s2PziYu4oDLwhnse4FbnUrgd/oir
	IhBrvqVYkyO6RlNGF4eyhfg/kCQQOoaxWpuFpR8DKYOi/HNdeycmXrlhNXgM11mvQ
X-Gm-Gg: ASbGncv2/5a7I6MjmzXfMjRWkAAjDfokW7p5z9eqKAK12nVFF4x+2v3BYSyOOSB8K80
	GfWALxLHgx/ACateAOKRXgUVgkJUz3rdf1CGKGnAIiOhU7z2Xi9XEvJvK3EpbftNIs8OB01icMN
	QeHUZSNm5MzBKzpAXPt1HO8yElZTrO4Hl3InOsYZPQEJSJaRBle9cQGGd59ansvpKWnf/P1970J
	4fxAGg718P2BDkHFXoWwlZphAvuVnX24vKlmWCyw3tDe7Eb7guQ/cDgkeCbV9Hg2RtThlh0d4Zb
	+Y6zLJh9Vc0zJmoKGf6vpxGGLLjNzMGGqA2b+8Jdz5FxJ/G4NHYJqTb7sbVv1ylJxgl+zILMmYx
	E
X-Received: by 2002:a17:90b:274e:b0:2ff:7b28:a51a with SMTP id 98e67ed59e1d1-309ed298e18mr890138a91.17.1745450405045;
        Wed, 23 Apr 2025 16:20:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHMksh6QUEkA2VrQQYoNS0ljT/n3zsIGL0Yxw9gOlz/DfDxwsL6Jb3yx2E7fX9kIDGRh12+cQ==
X-Received: by 2002:a17:90b:274e:b0:2ff:7b28:a51a with SMTP id 98e67ed59e1d1-309ed298e18mr890093a91.17.1745450404453;
        Wed, 23 Apr 2025 16:20:04 -0700 (PDT)
Received: from [10.71.112.43] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309dfa27059sm2258925a91.26.2025.04.23.16.20.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 16:20:04 -0700 (PDT)
Message-ID: <d622e3b7-3f62-4009-85fc-8f1d79fbb925@oss.qualcomm.com>
Date: Wed, 23 Apr 2025 16:20:02 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5 RESEND] thermal: qcom-spmi-temp-alarm: Prepare to
 support additional Temp Alarm subtypes
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: amitk@kernel.org, thara.gopinath@gmail.com, rafael@kernel.org,
        rui.zhang@intel.com, lukasz.luba@arm.com,
        david.collins@oss.qualcomm.com, srinivas.kandagatla@linaro.org,
        stefan.schmidt@linaro.org, quic_tsoni@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dmitry.baryshkov@linaro.org
References: <20250320202408.3940777-1-anjelique.melendez@oss.qualcomm.com>
 <20250320202408.3940777-4-anjelique.melendez@oss.qualcomm.com>
 <aAI0Zm5M9ba9ehyI@mai.linaro.org>
Content-Language: en-US
From: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
In-Reply-To: <aAI0Zm5M9ba9ehyI@mai.linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDE1NSBTYWx0ZWRfX3/V6/juS3QoA t+EuEcfFmdR7jDfs1L3kTPY1T67t9fkcZllcisAsOiZwERCzv3NukD15UEJQS3V8u/IgxFCVgAL qnXU5OzNl8fIVqHkeZ8HlTEXbQUkyuE+TmjBV+nARkfDr9Dy6YfVaT1FGTCFQFT+wkrJ2lgSu5r
 u9cRIlN8dOCNj3WR0CYL3h0rZ3OF9Tn9kAUPon9B74EYmMmCcyCzDive5fQSjkco5lXQ5RKKIka mJV6ku6F8uKP3r8aL2klGidhXMrKt1ldPsvAeSpNaeHE4yB+8k5EKsatvDIC48fIWWT0I4Vy+Ss AgZVfMhKc9Y/F3XtigH7YxphDMCQ4Hvzf3QQAeYeGsEFG1e5dPH1FIqYuFkGvH+v4egu7ZtNM/w
 0YlAE+YRlWwIFEkGZnvTzn8OxlZ+1foDZUWLwLkHuJyBqh3KB7KRCc3bRDzAJHuWp+wesLoJ
X-Authority-Analysis: v=2.4 cv=bs1MBFai c=1 sm=1 tr=0 ts=680975a6 cx=c_pps a=0uOsjrqzRL749jD1oC5vDA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=IMXF3EE_1CwuGGpSq0QA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: pE5IzIKHVYBkhQ7Xk4T_r87_V27DGY89
X-Proofpoint-GUID: pE5IzIKHVYBkhQ7Xk4T_r87_V27DGY89
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_12,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 mlxscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 malwarescore=0
 clxscore=1011 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230155



On 4/18/2025 4:15 AM, Daniel Lezcano wrote:
> On Thu, Mar 20, 2025 at 01:24:06PM -0700, Anjelique Melendez wrote:
>> In preparation to support newer temp alarm subtypes, add the "ops" and
>> "configure_trip_temps" references to spmi_temp_alarm_data. This will
>> allow for each Temp Alarm subtype to define its own
>> thermal_zone_device_ops and properly configure thermal trip temperature.
>>
>> Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
>> ---
>>   drivers/thermal/qcom/qcom-spmi-temp-alarm.c | 38 ++++++++++++++-------
>>   1 file changed, 26 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/thermal/qcom/qcom-spmi-temp-alarm.c b/drivers/thermal/qcom/qcom-spmi-temp-alarm.c
>> index 1cc9369ca9e1..514772e94a28 100644
>> --- a/drivers/thermal/qcom/qcom-spmi-temp-alarm.c
>> +++ b/drivers/thermal/qcom/qcom-spmi-temp-alarm.c
>> @@ -1,7 +1,7 @@
>>   // SPDX-License-Identifier: GPL-2.0-only
>>   /*
>>    * Copyright (c) 2011-2015, 2017, 2020, The Linux Foundation. All rights reserved.
>> - * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
>> + * Copyright (c) 2024-2025, Qualcomm Innovation Center, Inc. All rights reserved.
>>    */
>>   
>>   #include <linux/bitfield.h>
>> @@ -71,8 +71,10 @@ static const long temp_map_gen2_v1[THRESH_COUNT][STAGE_COUNT] = {
>>   struct qpnp_tm_chip;
>>   
>>   struct spmi_temp_alarm_data {
>> +	const struct thermal_zone_device_ops *ops;
>>   	const long (*temp_map)[THRESH_COUNT][STAGE_COUNT];
>>   	int (*get_temp_stage)(struct qpnp_tm_chip *chip);
>> +	int (*configure_trip_temps)(struct qpnp_tm_chip *chip);
>>   };
>>   
>>   struct qpnp_tm_chip {
>> @@ -312,18 +314,39 @@ static irqreturn_t qpnp_tm_isr(int irq, void *data)
>>   	return IRQ_HANDLED;
>>   }
>>   
>> +static int qpnp_tm_configure_trip_temp(struct qpnp_tm_chip *chip)
>> +{
>> +	int crit_temp, ret;
>> +
>> +	mutex_unlock(&chip->lock);
>> +
>> +	ret = thermal_zone_get_crit_temp(chip->tz_dev, &crit_temp);
>> +	if (ret)
>> +		crit_temp = THERMAL_TEMP_INVALID;
>> +
>> +	mutex_lock(&chip->lock);
>> +
>> +	return qpnp_tm_update_critical_trip_temp(chip, crit_temp);
>> +}
> 
> The qpnp_tm_configure_trip_temp() is called with the lock held which is really
> unusual to have this assymetry when dealing with the locks.
> 
This change is simply moving these lines from init() into their own 
configure_trip_temp() function. configure_trip_temp() is only called 
from within init() so functionally this is the same as what the driver 
was doing before. As new temp_alarm types are introduced (like in patch 
4&5) they may need to configure trip temps differently.

Specifically the mutex_unlock() and mutex_lock() guards were added in 
this change: 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/thermal/qcom/qcom-spmi-temp-alarm.c?h=v6.15-rc3&id=59edcd91d852f88ef7d208029503f9b5310d0603

> In the other side, this code assume it is ok the userspace can change the
> critical temperature of the board. Is it really a good idea ?

Sorry, I think I might be a little confused on what you mean from this 
comment. This driver has supported setting critical temperature from 
userspace for many years now.. 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/thermal/qcom/qcom-spmi-temp-alarm.c?h=v6.15-rc3#n264. 
This patch is just reworking driver, there are no functional/behavioral 
changes.

Thanks,
Anjelique

