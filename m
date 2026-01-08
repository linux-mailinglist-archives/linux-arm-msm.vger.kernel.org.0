Return-Path: <linux-arm-msm+bounces-87997-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A6161D01586
	for <lists+linux-arm-msm@lfdr.de>; Thu, 08 Jan 2026 08:08:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8DA2D30046DE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jan 2026 07:07:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B884313264;
	Thu,  8 Jan 2026 07:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BmGgNpOU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hfSQwCYD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A0E1E1C02
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jan 2026 07:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767856065; cv=none; b=J5pzVlP9Yd5gKnPw/MR04Z7/Ad4nJAsxffTK5JwBlPl8XaUX1XsFxXL+NFRMTxChLFCDjCSysLLURkSrfp8vSdjqMpJAD3KjCxH6EhMV558qvajJrncJZTBzxkDcMfj6c/Y0wUSqthhUkPLJuj0gvkG7kfHqyHzpmQ3h0nE2a0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767856065; c=relaxed/simple;
	bh=EW9ZJEx/Y4DrtxgKA1ui14J9T68gvpdN1tRau3pG9UA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hC7wF8KmRNJwTT9Ou5pLW3ohDt8nYygTPs/L90aTXDE0NsdPqEFvo90UUP0Yh1cnKgwW0DhZsPh7SSoIOmnK3CVRINXq88drM4mLzxNqPntehZK0FdZPFSrurMZbvP32NGj6dtZvVztS3rI7FPDS9CK393qjdm44K2wgYfuxPws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BmGgNpOU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hfSQwCYD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6086MZjI3152888
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Jan 2026 07:07:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H291/GDYLdo15JZXgl9p7LmvmkDeNjcIbx8C1kz8ufo=; b=BmGgNpOUAyxTBare
	jOKALGcWGeOGt4H4LTXZgD1dRwnRCRdgko3d119xm0awMVpEbJvUqJ2ArFcVwhdf
	k8Q09bFU+uT4Jb4QHTb+QNQeDYeYLbA7QM56p9C9B26eKNsV9LQDVvMVDwzXtzlp
	6NGUtyDqS64grERh+tuXndzbpJrPiq4in/t0X93bbIb+t16sh4B76XztffFkcK/B
	LBvUlUzehjRJ9Y67RboJ0y6MaXOwBKGghG05TeWvthi8msYT3bgCc1kOsrUVj/rh
	UQj0sYLA0nFK15piu3vOy5M4ObqKH4fhFdYra2u89KaostRbtBd7XqaBNJPwAh43
	YeXfwQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhpjaucvr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 07:07:43 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-29f25e494c2so20189505ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 23:07:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767856062; x=1768460862; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H291/GDYLdo15JZXgl9p7LmvmkDeNjcIbx8C1kz8ufo=;
        b=hfSQwCYDJMVEu/ohG92ZwZ+tabH11MuLGBv4vx8qASME6LaSaIAhqLa/ESJ2m9Ln0G
         tBAAhgzvkMeFHl9eeM8vkTG2KOqQmno+9JXo0pvtvJNQW6BaX6ooY7xoz0WkixcRssbX
         X3NCUiQouVRFDBOaNt9PBjmF+TAppTwkE2a9hs77x8tHSnQbzaaooDDywGFfgvJy9CL3
         3uKVmZX5n5m7aIoIIXGSmCxQbGLe7vsodmZJHZVDM2PM5eqaGcYSU9ChjcFnGKHHBw5l
         lnfeilUaOXylqMvAEPhJk3Wviiw9BbQ2tfckgiIBlZPHcEglKueTSFh3qQxMPxr+hBGt
         z+Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767856062; x=1768460862;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H291/GDYLdo15JZXgl9p7LmvmkDeNjcIbx8C1kz8ufo=;
        b=lQbbBNPkoTYSOy9ULBqFH+xRYlPTeiZg2ZCsz+STzYWPfJA493Lmpq93bEcXO1U2Pb
         n5zThPn9/a4MVwF/b2X6wm7zY6NYdvUG6JR6akrONnsUlcH3lEWWq+ww2pehRCDkfwD7
         TnJfVdgNyflC3HqzHwcU6zedB3Sl9EBiNeBBMdcEexrdRBZV8A1UtJl6HPqBsy8uTrYx
         v8KcwZsCJpuUgHhpsudf+1HUuRN8ZmQPq94WFQ/QqSy05dpOt1iMIDemVu4wAllqXOm/
         rjdsEoB5zaXAANG7tTBuMNXX08T2hUISLpi3Wm+244ghwWK5biMOpQ3YcfGJmQ8Q0HiI
         be/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVSClS2nmhkwrcWcl2At8XmBSLeuYTLsb5Zux+KOh71tQzqnrKRScnNJ04fNDr5ANdOqiw2xuP1vL+80vKa@vger.kernel.org
X-Gm-Message-State: AOJu0YzW4RU+kNvG2Su9Nns64aAS/WXUWzi0IsKNQtdzfA1GCyzxujuZ
	RmrqGsJSQyBEO8tPnamswwLLHNguGsi4/WHrVqwrsc6tLFKdvUXJK6Lcp2gaJ3yDSOBq3JsmKcp
	5IwPfeAYsNyji0Ud4wvzLYLGOcUNvY9nMuPHA1PU6QRKOrxJ+YWYoS9U+X8QpFFWDAQ/6
X-Gm-Gg: AY/fxX6KKTw7mCbTsxDJMpA7EaRCLTynleoM/NmMZuqtnUml3+YmdatOc92FqgLhB/A
	ePbJeyf+GdIGd6tYYcAIHLYroo7ztyO52oz4Zu23wi73b/6mNJjd+aGXWIhkhKqR64/8hWxSfrP
	EdWzhHhmxjHMlMQspTpKN7PIz/79kswpdYMH/mCh2wjYYQCCEId8MjZXXlxUas4hvapWT5y3tca
	Yyf5OgIEv1gTPIGKNY+qCQHkXpCzgyd8suYvZ1n198+0DrUZ74J//kTW2b3TQv9lf2UKKCgm8pw
	WlUdTNuQdTJRe1U/+sZ2AcjIPFoQJ+Y9UAfVYmT6/QNLTdY8WgSiWaEZ8/Mtbyy6DxShVLNfEDB
	ygDegi+CJQg4bU+P7T+P+ii1b+sOnIp4HKHI5/Ss=
X-Received: by 2002:a17:903:90d:b0:2a0:acdb:ce0c with SMTP id d9443c01a7336-2a3edbaeef5mr57580325ad.29.1767856062234;
        Wed, 07 Jan 2026 23:07:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFQGy72i55Bln+OLLaW6HT8jBVTsf/2UpcbyKR6ZxubyT8/7OrZRDENs7bDh4FSn4TvSrc3ZQ==
X-Received: by 2002:a17:903:90d:b0:2a0:acdb:ce0c with SMTP id d9443c01a7336-2a3edbaeef5mr57579775ad.29.1767856061288;
        Wed, 07 Jan 2026 23:07:41 -0800 (PST)
Received: from [10.218.27.120] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c3a560sm68034105ad.21.2026.01.07.23.07.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 23:07:40 -0800 (PST)
Message-ID: <cb5430c8-12d6-4439-b1ae-c2f36f29a9f8@oss.qualcomm.com>
Date: Thu, 8 Jan 2026 12:37:35 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/8] remoteproc: qcom: probe all child devices
To: Bjorn Andersson <andersson@kernel.org>
Cc: mathieu.poirier@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, rafael@kernel.org, daniel.lezcano@linaro.org,
        rui.zhang@intel.com, lukasz.luba@arm.com, konradybcio@kernel.org,
        amitk@kernel.org, mani@kernel.org, casey.connolly@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
References: <20251223123227.1317244-1-gaurav.kohli@oss.qualcomm.com>
 <20251223123227.1317244-3-gaurav.kohli@oss.qualcomm.com>
 <evb5tn2cht7wk76fuc2wpsyxepknigfw37633n6ypuapstbceh@tn5glmi65bdv>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <evb5tn2cht7wk76fuc2wpsyxepknigfw37633n6ypuapstbceh@tn5glmi65bdv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=efMwvrEH c=1 sm=1 tr=0 ts=695f57bf cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=87LZ4QhyrNmesvD_9F8A:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: LY0LPdM_fCha4tR_P8SaeSLVwZ4llvpZ
X-Proofpoint-GUID: LY0LPdM_fCha4tR_P8SaeSLVwZ4llvpZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA0NiBTYWx0ZWRfX69slkOfzX/hw
 mXkyiK/ZoCNttI3qU9XtQw4DT47alR+3nbFf/nxafdsdRwdEZSXdM+EXMJcrvUnF69PcKV+53q9
 72o7cqGYckXALA6HzjqxJgV53yTxHfyP6GW4zzxwvQRZJS8AJuyYrl4FwTTBfMfEIbm/EL6dBpO
 4NQzZcdjcalUy+um6vskMt2scXyguUm7e4tVY4VzILgFQTKh8pYgqcSepMBbmQ1ZFSb3H1Y0C2I
 kfpsr/OQ/6jbPNNgU0B+i3Lk89VxNRLXobmgmGFDGJNaQnG4w6bWXBh+jzZRzMKYhFUJXXRv9gW
 Un3rEOG6Hy2mp3hZp+dV+lYl0+2sTypniNtP4Qbsf+wplz26n9DLxkCjExGjqY35lBbVo9vZ59K
 S+Atwnm8Da4whf90eK80qXkgRo0sZV+xMD/l6J8hyRZfkbIuyNxKqC/rcohhAa7UUtflnjU1IA1
 zsKQQ8+JHBTS9HNjJsw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_01,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 adultscore=0 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601080046


On 1/3/2026 8:26 PM, Bjorn Andersson wrote:
> On Tue, Dec 23, 2025 at 06:02:21PM +0530, Gaurav Kohli wrote:
>> From: Casey Connolly <casey.connolly@linaro.org>
>>
>> Generalise the qcom,bam-dmux child node support by probing all
>> remoteproc children with of_platform_populate(). This will be used to
>> enable support for devices which are best represented as subnodes of the
>> remoteproc, such as those representing QMI clients.
> Please flip this around, start with the description of the problem
> you're trying to solve.
>
>> Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
> This must have your signed-off-by, where you certifies the origin of
> this patch.
>
>> ---
>>   drivers/remoteproc/qcom_q6v5.c     | 4 ++++
>>   drivers/remoteproc/qcom_q6v5_mss.c | 8 --------
>>   2 files changed, 4 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/remoteproc/qcom_q6v5.c b/drivers/remoteproc/qcom_q6v5.c
>> index 58d5b85e58cd..a02839c7ed8c 100644
>> --- a/drivers/remoteproc/qcom_q6v5.c
>> +++ b/drivers/remoteproc/qcom_q6v5.c
>> @@ -6,6 +6,7 @@
>>    * Copyright (C) 2014 Sony Mobile Communications AB
>>    * Copyright (c) 2012-2013, The Linux Foundation. All rights reserved.
>>    */
>> +#include <linux/of_platform.h>
>>   #include <linux/kernel.h>
>>   #include <linux/platform_device.h>
>>   #include <linux/interconnect.h>
>> @@ -351,6 +352,8 @@ int qcom_q6v5_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev,
>>   		return dev_err_probe(&pdev->dev, PTR_ERR(q6v5->path),
>>   				     "failed to acquire interconnect path\n");
>>   
>> +	of_platform_populate(q6v5->dev->of_node, NULL, NULL, q6v5->dev);
> There are other child nodes here, in particular the GLINK and SMD edges.
> Do we really want platform_devices registered for them?
>
> Regards,
> Bjorn


thanks for pointing this, can you please suggest the right approach.

This should not impact glink, as that is registering as rproc sub node, 
And we need rproc cooling as child node

of remote proc subsytem to create probe dependency only.


Can we do platform populate for specific child, would that be right 
approach. or we should create rproc cooling as independent of parent ?


>> +
>>   	return 0;
>>   }
>>   EXPORT_SYMBOL_GPL(qcom_q6v5_init);
>> @@ -361,6 +364,7 @@ EXPORT_SYMBOL_GPL(qcom_q6v5_init);
>>    */
>>   void qcom_q6v5_deinit(struct qcom_q6v5 *q6v5)
>>   {
>> +	of_platform_depopulate(q6v5->dev);
>>   	qmp_put(q6v5->qmp);
>>   }
>>   EXPORT_SYMBOL_GPL(qcom_q6v5_deinit);
>> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
>> index 91940977ca89..d40565c1cc62 100644
>> --- a/drivers/remoteproc/qcom_q6v5_mss.c
>> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
>> @@ -238,7 +238,6 @@ struct q6v5 {
>>   	struct qcom_rproc_pdm pdm_subdev;
>>   	struct qcom_rproc_ssr ssr_subdev;
>>   	struct qcom_sysmon *sysmon;
>> -	struct platform_device *bam_dmux;
>>   	bool need_mem_protection;
>>   	bool has_alt_reset;
>>   	bool has_mba_logs;
>> @@ -2029,7 +2028,6 @@ static int q6v5_alloc_memory_region(struct q6v5 *qproc)
>>   static int q6v5_probe(struct platform_device *pdev)
>>   {
>>   	const struct rproc_hexagon_res *desc;
>> -	struct device_node *node;
>>   	struct q6v5 *qproc;
>>   	struct rproc *rproc;
>>   	const char *mba_image;
>> @@ -2163,10 +2161,6 @@ static int q6v5_probe(struct platform_device *pdev)
>>   	if (ret)
>>   		goto remove_sysmon_subdev;
>>   
>> -	node = of_get_compatible_child(pdev->dev.of_node, "qcom,bam-dmux");
>> -	qproc->bam_dmux = of_platform_device_create(node, NULL, &pdev->dev);
>> -	of_node_put(node);
>> -
>>   	return 0;
>>   
>>   remove_sysmon_subdev:
>> @@ -2186,8 +2180,6 @@ static void q6v5_remove(struct platform_device *pdev)
>>   	struct q6v5 *qproc = platform_get_drvdata(pdev);
>>   	struct rproc *rproc = qproc->rproc;
>>   
>> -	if (qproc->bam_dmux)
>> -		of_platform_device_destroy(&qproc->bam_dmux->dev, NULL);
>>   	rproc_del(rproc);
>>   
>>   	qcom_q6v5_deinit(&qproc->q6v5);
>> -- 
>> 2.34.1
>>

