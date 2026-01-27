Return-Path: <linux-arm-msm+bounces-90641-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GCZGCCcseGl7oQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90641-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 04:08:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B533B8F659
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 04:08:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 45CC930715E1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 03:03:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1686E2EAB64;
	Tue, 27 Jan 2026 03:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a8gc2ohD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hMgxIrCk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 864222D7DDE
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 03:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769483018; cv=none; b=YCRg7+33OAZXLI1zDN+LyEY4kACTbasSoO3HO5zwM/zGBlf5LTA/0SVKw7N3RvIDdPfyJeHv56jmp4HU1GuYj1lKWOJ29oBWyjdSZXxk56eo8YcNw4qTkx3M2FMFukObyxkDYXQSJaxGc6i5W5+k2D6Lnk+li8cEET/rv3cB9bI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769483018; c=relaxed/simple;
	bh=syYL5VtEW+c/TcVWBtxlN6YnmRdtpQNmgJWhYxG0Grg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dj7+jWvWJWLCo4lwRp2ehcmz9F3o1XzMlwASZhXiu+wHkOzQmvqwO2D9KMUKA2Q5PUSyAOSvib1RaXd0+ttV4wtTIRvOAYjhqDJO6n9nOtVxEYQhLPlGj6vlsFrsoztDakEDHhhZQXWtw11HmKDJZq0aBOqWLn75Zs+RYcUWq8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a8gc2ohD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hMgxIrCk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60QKgJVP3399299
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 03:03:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QdW4mzL5aTNRFJ61i5C454TjCOALyCkxZNzJk0cSbXQ=; b=a8gc2ohDbTCBWL/y
	fb2amVhZMcgeDXLTtnY0wNOnIg1cBkWk4lwGvXsRi6tglaxj1BY03xKbVKEEdB7+
	4m1jyMzmjtRskH8hpQfyOWHHAQZJWNAPUq/BJyMtDU/uFgjVThnhjqq7DR4lI7wD
	bak8tqIjmDZk2UvM9Sof7A6lMLco+GtDaByVZsVVYweY34UZFwo6AqTNuAbJ3yD/
	UeqQTDZoFDuPg5AFOGRWkZx9y0kXtsvL21+ScGxB3TVJaOJaVmnYhdYbYNjqSOr/
	VT34RUtEgYxIRaBrcx7H+9aYnZzjh+dxgHRPbiaYM/x8EOQZeQrj90Gq62ocusDL
	0M21/A==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxdv9h7br-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 03:03:36 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a863be8508so18974815ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 19:03:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769483015; x=1770087815; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QdW4mzL5aTNRFJ61i5C454TjCOALyCkxZNzJk0cSbXQ=;
        b=hMgxIrCkJ219Rotxt249kDDy5qMAs8jO65S5MNCKhwo4IKTChHmZNVNjQ5zZFXQ9rF
         DCCodBibqdgnqLgO2xHvRrOb3imKQ/NNojKcC2fm5UUr+96pDEr7RcwDkB/JQAb5tGnT
         l+4/tnCp5c48phHjcESL9zQGMTL0SYVUZ/qd+t/rQtiDrHcKurkmETSo0Xtf+yqCiSBa
         C+PDGThk4xmqpBy+6uQgrwEPo5es//1Z2JOgFVginY/LAr9RI83taJ+DJUerLy+ZVGiF
         QtRyjcAPJ5Yi+Bp/c3a35ghJuaPu+8+7geFce3mObUOoEqec6m9wdqu54O1OflR0qGuw
         +rdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769483015; x=1770087815;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QdW4mzL5aTNRFJ61i5C454TjCOALyCkxZNzJk0cSbXQ=;
        b=JsImjjTPCbDFxX5bS1FpF50q15hdQAsYrWMIdV9zP3y0A0c98sTMxuNK4L0hQEtqZc
         bAuwFqipv2oYpLy27F16bsrcutdtmQx7fp0qZ65Y2V5tKcsXdHFKD9s3y8DWBx4OqLWd
         UwekNuSXq+LLYMwUUjUKDJ4gb0C05bNK3+2h/JlOWN0U04PFXHUiY0knmwv65G6XDyVn
         PMICf0vHzl5ZhnUpwiTqhm2FdjE5/IM+pYcv+2Qa/xwNjT+OCOubYIEoVgAzJ9DIB1LH
         tu6g78Dk40goDN9I63riyrH1r/5/0KeeKk0/Hi1DLvyfk1ZUzN9wRQaF80Or/2hJJobd
         uMew==
X-Forwarded-Encrypted: i=1; AJvYcCWMj2YotMzgCkvHUyq7HzPnFrwIDpCsWH4D/xccoS3sR5tNXRxmrn+bFhlP/k8QsOb1HiO7++PKxyTLSEhr@vger.kernel.org
X-Gm-Message-State: AOJu0YyRt7FJrU8xLZ2pIM0BuiyyrjAKSn3/1ELrGeZfiDC8w2bAW2rX
	b9SwG6RQ12c3bicSiEEJYZSt+K/2joVBdjk5DRWQHgAsP6SCfpXQK3zOc0xwlFOhFpDJVQICXtA
	k5ihUB4VV4TztdBaSLa7Cp0zsmxmxXTodTZDkSuCddiPXHlRZzO8V77y8UMJFcbyvHaoQ
X-Gm-Gg: AZuq6aIcgi2/FEvyjcEMdvA0hFDdRY1u67cgaYWbPa3ADyFFp88Tpc/7WLC5g/fTBMi
	hYIHZrJdp2ep0WE7OnNSESZEB4qe+fOdlhbK18R9ow39tbZdc2y6gZefb44Z6cA/TmiYvV8FYg9
	oNaVKlyUQupB2g2d4W9PerefzlURmqF4xgaDxGS/VB5Tf77lxU3Ppln3PXdtqGdCUT2MNZl96AH
	+NpS3GUZ3qLtd2HDdqq2eSLhpoeKJSAkhzCL4KlD7MGUTZq1cdaOw+uQApKYrhVs7zOtV4voIFz
	KW73soyBYKHbMgSWBgCCuPlwe6we6MtyXgzM0EFhAV6TPXu87y2UXdGDOXzeQ/3PUE6ezpwnFAJ
	LJoeQomsqai0VBosY1Ah08v8fliID5NzDSgNj5Qw=
X-Received: by 2002:a05:6a21:1507:b0:350:2251:59f with SMTP id adf61e73a8af0-38ec63ea717mr112691637.38.1769483015091;
        Mon, 26 Jan 2026 19:03:35 -0800 (PST)
X-Received: by 2002:a05:6a21:1507:b0:350:2251:59f with SMTP id adf61e73a8af0-38ec63ea717mr112649637.38.1769483014576;
        Mon, 26 Jan 2026 19:03:34 -0800 (PST)
Received: from [10.239.133.242] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c635a425254sm9558200a12.29.2026.01.26.19.03.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 19:03:34 -0800 (PST)
Message-ID: <c142d3bc-5365-4eab-a613-8f2a06ee9788@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 11:02:30 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 6/7] qcom-tgu: Add timer/counter functionality for TGU
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, andersson@kernel.org,
        alexander.shishkin@linux.intel.com, mike.leach@linaro.org,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        devicetree@vger.kernel.org, gregkh@linuxfoundation.org
References: <20260109021141.3778421-1-songwei.chai@oss.qualcomm.com>
 <20260109021141.3778421-7-songwei.chai@oss.qualcomm.com>
 <05637034-19f0-42cd-9352-3daf80ae4a1d@oss.qualcomm.com>
Content-Language: en-US
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
In-Reply-To: <05637034-19f0-42cd-9352-3daf80ae4a1d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OYOVzxTY c=1 sm=1 tr=0 ts=69782b08 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=5nTtrOYU0cHVv66wLwoA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: icwabqHSHK_T6lDh7BtaGy_dFNtRtMy3
X-Proofpoint-ORIG-GUID: icwabqHSHK_T6lDh7BtaGy_dFNtRtMy3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDAyNCBTYWx0ZWRfX9IYg6QdlU8md
 o9pziugAFNr50wDG769G/58i0QemXcm9VDJCY8UZ9GIKRqv15YtGnnkZxKXirFNuP88+l/UZwvo
 rB4mMZiYzqmgS6oILMVXsxD+cUuuulA4hx6agc3o9Ubj49yVUtr/KT3LLcXDnflUb4xhJrmc84h
 8JT3m4iIfQxXxrUaTtqnCAyFHn3wnPg/dDJDX8guTykuvnowD579obE5GfZ9fRSd1mFvVXumJa4
 nvNQI2jayUXnuLICvq1M9ExCTG5VYr8DUQyB0DIPOk5r8VyVIcVG3Mbbf348gEHkW/CEpZkKqoR
 6w9EUdiJiRdApakKZDP/DJt1amlhxpI0yC9Mf2uI4edMgdEpRpov/2CoE/Q+AEkt0ERtrDjprfk
 f3gPhEYbG+0LEs0fC9EAaVv/52i+chJnUl/b7C2zxVh7kQns4srjtoHYRrCxssvA7Vyl7VtzJDb
 BKafgGz+tw8wlopntaw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_01,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 spamscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270024
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90641-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[songwei.chai@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B533B8F659
X-Rspamd-Action: no action



On 1/13/2026 7:19 PM, Konrad Dybcio wrote:
> On 1/9/26 3:11 AM, Songwei Chai wrote:
>> Add counter and timer node for each step which could be
>> programed if they are to be utilized in trigger event/sequence.
>>
>> Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +static void tgu_set_timer_counter(struct tgu_drvdata *drvdata)
>> +{
>> +	int num_timers, num_counters;
>> +	u32 devid2;
>> +
>> +	devid2 = readl(drvdata->base + CORESIGHT_DEVID2);
>> +
>> +	if (TGU_DEVID2_TIMER0(devid2) && TGU_DEVID2_TIMER1(devid2))
>> +		num_timers = 2;
>> +	else if (TGU_DEVID2_TIMER0(devid2) || TGU_DEVID2_TIMER1(devid2))
>> +		num_timers = 1;
>> +	else
>> +		num_timers = 0;
>> +
>> +	if (TGU_DEVID2_COUNTER0(devid2) && TGU_DEVID2_COUNTER1(devid2))
>> +		num_counters = 2;
>> +	else if (TGU_DEVID2_COUNTER0(devid2) || TGU_DEVID2_COUNTER1(devid2))
>> +		num_counters = 1;
>> +	else
>> +		num_counters = 0;
>> +
>> +	drvdata->max_timer = num_timers;
>> +	drvdata->max_counter = num_counters;
> 
> int num_timers = 0, num_counters = 0
> 
> if (TGU_DEVID2_TIMER0(devid2))
> 	num_timers++
> 
> if (TGU_DEVID2_TIMER1(devid2))
> 	num_timers++
> 
> etc.
> 
> unless you want to guard against a case where TIMER0 reports as absent
> and TIMER1 as present and you consider that invalid (I don't know)

Based on the current documentation and the hardware we have encountered
so far, this case - "TIMER1 present, TIMER0 absent" does not occur.

> 
> [...]
> 
>> +	timer_size = drvdata->max_step * drvdata->max_timer *
>> +		     sizeof(*(drvdata->value_table->timer));
>> +
>> +	timer = devm_kzalloc(dev, timer_size, GFP_KERNEL);
>> +
>> +	if (!timer)
> 
> stray \n
sure.
> 
>> +		return -ENOMEM;
>> +
>> +	drvdata->value_table->timer = timer;
>> +
>> +	counter_size = drvdata->max_step * drvdata->max_counter *
>> +		       sizeof(*(drvdata->value_table->counter));
>> +
>> +	counter = devm_kzalloc(dev, counter_size, GFP_KERNEL);
> 
> devm_kcalloc, perhaps?
Agreed. Using devm_kcalloc() makes the intent clearer and safer here
> 
>> +
>> +	if (!counter)
> 
> stray \n
sure.
> 
>> +		return -ENOMEM;
>> +
>> +	drvdata->value_table->counter = counter;
>> +
>>   	drvdata->enable = false;
>>   
>>   	pm_runtime_put(&adev->dev);
>> diff --git a/drivers/hwtracing/qcom/tgu.h b/drivers/hwtracing/qcom/tgu.h
>> index 8c92e88d7e2c..94708750b02d 100644
>> --- a/drivers/hwtracing/qcom/tgu.h
>> +++ b/drivers/hwtracing/qcom/tgu.h
>> @@ -11,11 +11,17 @@
>>   #define TGU_LAR		0xfb0
>>   #define TGU_UNLOCK_OFFSET	0xc5acce55
>>   #define TGU_DEVID	0xfc8
>> +#define CORESIGHT_DEVID2       0xfc0
>>   
>>   #define BMVAL(val, lsb, msb)	((val & GENMASK(msb, lsb)) >> lsb)
> 
> This is NIH FIELD_GET()
> 
ok, will try to use "FIELD_GET".
> [...]
> 
>>   static inline void TGU_LOCK(void __iomem *addr)
>> @@ -197,6 +247,8 @@ static inline void TGU_UNLOCK(void __iomem *addr)
>>    * @max_step: Maximum step size
>>    * @max_condition_decode: Maximum number of condition_decode
>>    * @max_condition_select: Maximum number of condition_select
>> + * @max_timer: Maximum number of timers
>> + * @max_counter: Maximum number of counters
>>    *
>>    * This structure defines the data associated with a TGU device,
>>    * including its base address, device pointers, clock, spinlock for
>> @@ -213,6 +265,8 @@ struct tgu_drvdata {
>>   	int max_step;
>>   	int max_condition_decode;
>>   	int max_condition_select;
>> +	int max_timer;
>> +	int max_counter;
> 
> num_timers, num_counters definitely fits better here
> 
uhh.. yeah.
> Konrad


