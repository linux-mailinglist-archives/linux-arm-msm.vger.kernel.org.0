Return-Path: <linux-arm-msm+bounces-86610-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F770CDD582
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Dec 2025 06:56:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DDF2B3009809
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Dec 2025 05:56:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C14C2D46A2;
	Thu, 25 Dec 2025 05:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="auOw+fTV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JQRE6vX+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C748210F59
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Dec 2025 05:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766642208; cv=none; b=Yyb6cYQD+uKmjGR8zsUgzHahYbEfMVkNvcclA+koxHb5eRYaXDVCyRQ6myGQEp7o3Uo4XK6V/yvnVAEoyp0Hl5utMN0wJ/L//lrFeJ6T5aDGbi3KiDjqnRb9iVIfRxEldT/y4NQaLT11XM9TAP1GBJ7PsFg6xhWURYuNRJ4A2vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766642208; c=relaxed/simple;
	bh=hzCvYAE5TeK3hWD00vyN6iYg4TpQY+xHKkrkvbW/iU4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AHXd9yXu45Gmj1fqs+9WE6HgRPFHLSY4ufe+ZOoS47qgVzV6BIIu6OwzjTANYORdSOZAfiJnAZA4DWe+oKQnxv7x+tSSAdzAv7YzMoaGCT08+tN92FRBIUgrP+MdBVjXzXjrGYuxjg0kwnlOV4AuAiRt/FVGdG963xKwGSGr1OY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=auOw+fTV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JQRE6vX+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BP4rrQK845290
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Dec 2025 05:56:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BfuB7eoTY30N8EW1JW7i3nY4wQW0+TIT2sa3QpXTDuc=; b=auOw+fTVvkEoNTdG
	Fl/cx6fON9zhqMMb4KKVsXuRMJIZgKQPFF2S/Rg0ROgfRpIzMzXxqQL7LNiPflnl
	qAczousgYRljsS08/9xVfKe+aOqUcalsEH+RtiG73jYxo9P1iRJfksVaIbpdsun7
	iNy2rwze3VecmRjOWGG2VjrvQFHDyYZknjaE/XBZdVaPI/ItlKkdBYyY8vvB/4hm
	pKbq4lfEK4myDDkP+zElLWn0GbKUvWLs9QvH8U0iaS+0tvAth6nhmSg1IxsYz+rF
	Wec7Q4K+Vk+KZY9f6qai/5DSl8Sw+mjW82o+1smJYbqeEAdbkiNYWS0szS7aZU7f
	G7R5Eg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b8xn282jm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Dec 2025 05:56:45 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a0e952f153so201897165ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 21:56:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766642205; x=1767247005; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BfuB7eoTY30N8EW1JW7i3nY4wQW0+TIT2sa3QpXTDuc=;
        b=JQRE6vX+hN8ON6TbKXE4sPjFh4qQdRh4yYTjY6Hf+zlFDiASWpOlE9qOzCV4fxhDS5
         DuOVLlLWPp+LMLKiPd8UAZZcdz77/TusEMqlDANrfl2t8ch3hbCfwt2ZHyyGb4TlJ6BS
         G7r9rbfFW2JLjG0Fpdkl8OO/SkY9sn4xReRlC9DtCO/2WU/1lnkWruUVE+X3OBH/J9mC
         HxHplNtg2RQhmp/fY9xzQlP/aJXxRBWqLbgULbwLfQiwtrS7E/lHbNgy+6IlGJwQ76IE
         G3a4eR6eadB/xaG1STWYlW5IgGk8DpikPuZWuu77CXvxdraVSgh8uefcs9A0qDErTzv9
         nh7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766642205; x=1767247005;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BfuB7eoTY30N8EW1JW7i3nY4wQW0+TIT2sa3QpXTDuc=;
        b=cL+1ZjG+uTo8SN2DlmqL+TH45mspWWnQ5yxMWqlrIWkV1ySVxBN/qV8v2a0tq85vv7
         7YNhiOUcDnK6qcokw7bP/N367Pq4GI1xrACgO2BJU6iBSxEVEAob9LVE2OBhAWv14yX7
         ymhH4ooM6FHmp5UcN73dbT0X30cXTqD5Y6m/hR6Xjc81XjrMCPbk58ViCNV1abCaVNJq
         Rsrf2UEEUuTlOTMYhPyqmEGZ1xgVC7rdGLDfOKQBQgwt/hHT6iEzsEOUM5xXgSL0TbD0
         2/Ws/x1LQks7tbz0kESaVskv0duG/ivRDOs0xLSeMSQIIznhKIzk0SmJhiIvMaPSuX2j
         ozcw==
X-Forwarded-Encrypted: i=1; AJvYcCUjv6Jji2s0JujkwyiwODwkSEcuJOGmNnM+427TUwAcDeOkytHzPGUddTVE4FCfDn3MDl7kIv9BHRkBE0b9@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7gDcmnIJCAba5sSZ1r1WYlmjBW3eqGQn20z/5eilubQc4gt96
	d+HcBZQq448js60ifzrqvroVWdaK0dwb7BU752Mr174TVvlhuUsVoDt3AfQH0F2wmT0KRdtuSLH
	5U41OGkyt1VYg7tOtjaEUpm0VFfuaBGpaAq3HvZ1eDD7ZQV5Ch6Umg8ZSk7yuFTqny8ZC
X-Gm-Gg: AY/fxX6lfWtnqbNaMylUrWAPHD2is4pfJzDY0CLRby0bOBaNSWT9bcUN0m5/8jDMOhE
	Fue8RetNaIE6qSCgIxS3dM6fDFok0YSibbJ1gXXc1W9JVicWSnOvyWQ+CQAPTDae9zcTuWRtoGn
	5mTgY+zXyNzMCLeIJ3o8ftWM7av2IWn0EMUjR8WE/WxjebfFMIqzuRE31lJIEYbgdYBbKEUzFNa
	4NlZbU8XO+ZTAt0HQlIkjv5rPVMST26hCZ9lJ9TsBo4nJTAiex1wc3s3NSF+jR9SJCJYY+STTj+
	l5q5ypCsoOW59mEs6tbKW8Jd9OXqxZcL991Tg8luJ+KqR8MemJchuu/XbUwiokfPgvouHnkR5mI
	nLXUL3q6Nyq0HSZ3Uww1J5/RGsfbopxri9RkhcxmIzgb3O0aPFyx8C7XfdKKY13Em0YGLparhQL
	U=
X-Received: by 2002:a17:902:ec90:b0:297:e59c:63cc with SMTP id d9443c01a7336-2a2f2737be9mr202743195ad.35.1766642204675;
        Wed, 24 Dec 2025 21:56:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEOpd3ErX7V5aJYRRI5TL4DpQGZJpZBgxbrQWzYR4JqWoT65p5BJeiqgHuYn/z8G3K4or7vgw==
X-Received: by 2002:a17:902:ec90:b0:297:e59c:63cc with SMTP id d9443c01a7336-2a2f2737be9mr202743005ad.35.1766642204191;
        Wed, 24 Dec 2025 21:56:44 -0800 (PST)
Received: from [10.133.33.250] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e70dccd14sm20085890a91.16.2025.12.24.21.56.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Dec 2025 21:56:43 -0800 (PST)
Message-ID: <aa3ee735-8ef1-4f44-9528-e93ebec2a215@oss.qualcomm.com>
Date: Thu, 25 Dec 2025 13:56:37 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 7/7] qcom-tgu: Add reset node to initialize
To: Songwei Chai <songwei.chai@oss.qualcomm.com>, andersson@kernel.org,
        alexander.shishkin@linux.intel.com, mike.leach@linaro.org,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        devicetree@vger.kernel.org, gregkh@linuxfoundation.org
References: <20251219065902.2296896-1-songwei.chai@oss.qualcomm.com>
 <20251219065902.2296896-8-songwei.chai@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20251219065902.2296896-8-songwei.chai@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI1MDA1NSBTYWx0ZWRfXzC0o8rJqPJg6
 4lu2IPs7kKvyXSjIvtUoqk981CqK0iDBW+4kt20LGfAg0b/WuRUjJM2YFWmmK0UTdJfYTC7Ca1S
 oTbPWZnab+T/tsuR3IhuumVteO7F8zanXcUMenjfZgJvkyoO+VpSeK37kwksTISzg7kI/zLXAb6
 Cy7paZkLVwhSLVwhhpFHbCfwvncsaHB1jfaerLdd/7pWETclv2HsrHW+8EH5B3urh6xtUwQEAtv
 tRPtDgSIskliAwiO2Nefx91P9aJ4pFc/p8X8LjZybow2srbGQCZyotp67QSCKbuHorBeG5SSu7r
 /jXv5eE0mnS8o1g5j9EvpyPOxaQ98kLaxHvmUkBKVVWELzeUr0Zk1VzUbVY0x5IanbQ+zcTLnLR
 XmDBKAlE8CEgzvlZjPyvAlNU3AOq/O6+5rEdc0fxuWDExOLGRgvXLGoxI4juJyRnB22+JesbQb/
 RdjXb5ldKj3bwR4ADMw==
X-Proofpoint-GUID: Mq8RmfkT8LatKxJOAeNoCqLXbELe4Hkm
X-Authority-Analysis: v=2.4 cv=Cp+ys34D c=1 sm=1 tr=0 ts=694cd21d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=JNGEfTUsO65A5MKw78gA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: Mq8RmfkT8LatKxJOAeNoCqLXbELe4Hkm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512250055



On 12/19/2025 2:59 PM, Songwei Chai wrote:
> Add reset node to initialize the value of
> priority/condition_decode/condition_select/timer/counter nodes.
> 
> Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
> ---
>   .../ABI/testing/sysfs-bus-amba-devices-tgu    |  7 ++
>   drivers/hwtracing/qcom/tgu.c                  | 74 +++++++++++++++++++
>   2 files changed, 81 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
> index 010eade0a1c5..0733b3e07b45 100644
> --- a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
> +++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
> @@ -42,3 +42,10 @@ KernelVersion	6.19
>   Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
>   Description:
>   		(RW) Set/Get the counter value with specific step for TGU.
> +
> +What:		/sys/bus/amba/devices/<tgu-name>/reset_tgu
> +Date:		December 2025
> +KernelVersion	6.19
> +Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
> +Description:
> +		(Write) Write 1 to reset the dataset for TGU.
> diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
> index d4210869556e..5a8c6af9b719 100644
> --- a/drivers/hwtracing/qcom/tgu.c
> +++ b/drivers/hwtracing/qcom/tgu.c
> @@ -425,8 +425,82 @@ static ssize_t enable_tgu_store(struct device *dev,
>   }
>   static DEVICE_ATTR_RW(enable_tgu);
>   
> +/* reset_tgu_store - Reset Trace and Gating Unit (TGU) configuration. */
> +static ssize_t reset_tgu_store(struct device *dev,
> +			       struct device_attribute *attr, const char *buf,
> +			       size_t size)
> +{
> +	unsigned long value;
> +	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
> +	int i, j, ret;
> +
> +	if (kstrtoul(buf, 0, &value) || value == 0)
> +		return -EINVAL;
> +
> +	if (!drvdata->enable) {
> +		ret = pm_runtime_get_sync(drvdata->dev);
> +		if (ret < 0) {
> +			pm_runtime_put(drvdata->dev);
> +			return ret;
> +		}
> +	}
> +
> +	guard(spinlock)(&drvdata->lock);
> +	TGU_UNLOCK(drvdata->base);
> +
> +	writel(0, drvdata->base + TGU_CONTROL);

Better move TGU_LOCK(drvdata->base) here

Thanks,
Jie

> +
> +	if (drvdata->value_table->priority)
> +		memset(drvdata->value_table->priority, 0,
> +			    MAX_PRIORITY * drvdata->max_step *
> +				drvdata->max_reg * sizeof(unsigned int));
> +
> +	if (drvdata->value_table->condition_decode)
> +		memset(drvdata->value_table->condition_decode, 0,
> +			    drvdata->max_condition_decode * drvdata->max_step *
> +				sizeof(unsigned int));
> +
> +		/* Initialize all condition registers to NOT(value=0x1000000) */
> +	for (i = 0; i < drvdata->max_step; i++) {
> +		for (j = 0; j < drvdata->max_condition_decode; j++) {
> +			drvdata->value_table
> +			->condition_decode[calculate_array_location(
> +			drvdata, i, TGU_CONDITION_DECODE, j)] =
> +			0x1000000;
> +		}
> +	}
> +
> +	if (drvdata->value_table->condition_select)
> +		memset(drvdata->value_table->condition_select, 0,
> +				drvdata->max_condition_select * drvdata->max_step *
> +				sizeof(unsigned int));
> +
> +	if (drvdata->value_table->timer)
> +		memset(drvdata->value_table->timer, 0,
> +			    (drvdata->max_step) *
> +				(drvdata->max_timer) *
> +				sizeof(unsigned int));
> +
> +	if (drvdata->value_table->counter)
> +		memset(drvdata->value_table->counter, 0,
> +			    (drvdata->max_step) *
> +				(drvdata->max_counter) *
> +				sizeof(unsigned int));
> +
> +	dev_dbg(dev, "Coresight-TGU reset complete\n");
> +
> +	TGU_LOCK(drvdata->base);
> +
> +	drvdata->enable = false;
> +	pm_runtime_put(drvdata->dev);
> +
> +	return size;
> +}
> +static DEVICE_ATTR_WO(reset_tgu);
> +
>   static struct attribute *tgu_common_attrs[] = {
>   	&dev_attr_enable_tgu.attr,
> +	&dev_attr_reset_tgu.attr,
>   	NULL,
>   };
>   


