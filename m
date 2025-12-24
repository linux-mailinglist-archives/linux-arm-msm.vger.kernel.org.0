Return-Path: <linux-arm-msm+bounces-86496-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 70CE9CDBA7D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 09:20:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A1A6E300161F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 08:20:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 533F42DF128;
	Wed, 24 Dec 2025 08:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MKRqgpye";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eL1U4Xb+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7812322D7B1
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 08:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766564412; cv=none; b=LjIc3v2ZwPiAHBPtdxk6Ga3otHrI/Zb5vzM0PfAqcVJzHuYKyoLShfgJKTP0glT8/Jw8Imn3vXin0vYN6EQfybuOzkHVwXxkhrdUX/S5A+xVyXYqbPdsh6c+s/cFvVdk+MPEi2uJrm9s9TaEm+fsevm3l6uoTp2O2Si5VRM5sn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766564412; c=relaxed/simple;
	bh=4tiG7mYYhrJHtMUu2zLkSlC44E+ts0dw44yrBndIklY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R8Gxb6RBGORTbq6nksY2YsuCkKY/dSl5I3fTEJNbkAizgd0vTy0La3/wDYh+++pYhWaz+O+kotfaUqMwRh4R8DgkcGub3bKDdy6twk43TMbdR9qS/ajHolR/sBjcHG28KYF19H9UfkWZaVnCO1Qp94esfSSlcBh75IcgjJxuqpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MKRqgpye; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eL1U4Xb+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO3f3aw4134142
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 08:20:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v1aTFRmwjiHABmaYA3Tkt3n6HdoFNrXtqlDsLqKqL88=; b=MKRqgpye7LYOlypK
	/VD7Uv7lG0ZQ1Hq5I24L50SOiPZgUlUyOyyUGkFtM2Ru8eew8OpNcvP3udCUZ3YT
	Eham8SaB6tz0U+n83a+1p7eQcPprLnMCW3DxoKdIDp4GkdvNbUcZFvoaSZNXuIXQ
	MfMbhp51khNDukff921A5W9fYBg9R4ou3nVZK291dPaNg60cO/qMTy5T+4fL2jM3
	mPwBIYTWsTRwyJWpkzQzUKkERVlbC/vuxM9+J4acFGHJYD2+AOm/R94puUjAke8O
	RMTSYj+nztSXOeTtuRYXOZiN+H6bt7iXdmmabiF0FQeeIWwZBwgaIF58bvpzIpPw
	d/heQg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7x46te8c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 08:20:09 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-34e5a9f0d6aso5834772a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 00:20:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766564409; x=1767169209; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v1aTFRmwjiHABmaYA3Tkt3n6HdoFNrXtqlDsLqKqL88=;
        b=eL1U4Xb+hnF2up/MOEGgIx3VDvPFOXyHF+aS+RL2J4kmEDTuLTuIhA9dCeY30ahWO8
         IDjD4iZSNENYV0OJwh1yeOIwVJXl/hDXbnpf/v4FAKYJy00mR+S4X9i9+vXJ1gLy2k65
         srfIMnR2DHujDUXeqPgfWHqCgv+12M6LQWpKXGU+P3dRiMYLNjoQJfubNzBVW2OXoP4G
         JOX8jHIIGxmd55vWMfqBIEznfb/3nwtnq6lbCXRSdTSxeeyPA17wqOSJSzL8haxo1NUt
         h+b7Z1WC5dPZBzgp0Ql9oo3kx/+isSGj4WW7CkHsQNuSulVtRf96hTBqSHcJ97xXrkyb
         6wmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766564409; x=1767169209;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v1aTFRmwjiHABmaYA3Tkt3n6HdoFNrXtqlDsLqKqL88=;
        b=WMojFJ8gIZ0jF8NIa/yGRZe7i9f8YQXJdJCvwD9OUb0WTefRI1SaStlC3wqkKSGgl3
         FnYlaqjxUAJrlY0jTJ/7yNqQB3qCdJRO4CIYwXE3mknySvgESZlTOBUjL6fr/jz71PAU
         dRxZZx5sXRWiI1+5PArio/yDm4+0Vf3pNLC2iEuQXvWHog20hOTKNEVonLfDB4LLWWLv
         aRnOBR8v15pfae1urm5KyMc7b2nwrT7GFUeTCQ0or3G+RX/HqIcDHIUw+oPkq/ag0ROX
         Na1ofZBqy6aAyxAymJlaji4OAcyQAsPal743TyQfn7CniuUtRvG4kjJ+Ex8riwuPqBTo
         0q6A==
X-Forwarded-Encrypted: i=1; AJvYcCXVVzIvYV6D9RsOBKrmacKHfJwfYSFRukDSgNlfzTvIteW0pkMq0EEwsQYTc6t1YhzX1HrjYCFT4vT6VTs9@vger.kernel.org
X-Gm-Message-State: AOJu0Ywo2ieeu7+3vuwHpJxEkTFxUC23ed+Bnaz5KevX5h1nOwEacc1M
	kj6kKC9tqNqMKMyIKuNuokGm8Xpff1cm+HeW2p1yEPJRd3XjInhfJjRFUNFfGqzYX38SALK9dvr
	qkhWaBN6u0LcsdnLvvu2J3ahgIo4edOn8AsLJ9bTnFIPa3HiCMvJpu515vDG81xPs+3j4
X-Gm-Gg: AY/fxX4+3V7qiiUltlmPJ3AkBFFaVbWw7hzdwndelSiaTvtDlZPSU5rbawV4Ee353r0
	UBXpdVqb651CSvsf6uFLZhiKvkCIS+RAHlnsDLdPouvnEkMH8Lfr5Uhj5OURZnG0SfgGygD2b5y
	805wXzqFUhyAURA9EoeekoH+ZNh9PmQWaxtChEfk6d/4h3S73yCljfg9VreYOx6qUKEhJr3Rudf
	NLOGrvLLMdB4g6EyiD36y7Lf7jfUJvM3q94M8r1/yvD9pySjRx0aK8KBeXnreE9qFNpXLjsm4oh
	IdzBbhVwhMYaurCcWT9nER0qZvMlQoSZJJeXhCokp1Qgb1Uj4jhe1P84K95pTiw0wHPT+Qls9Ov
	tilKQklRBztUaq6h6MaaODZvDVjGDHNDshDC4K5DDWQ==
X-Received: by 2002:a17:90b:4b0b:b0:340:c094:fbff with SMTP id 98e67ed59e1d1-34e71e09fecmr17011437a91.10.1766564408667;
        Wed, 24 Dec 2025 00:20:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGivsG+N5RJkX5fsHsrnoYYjv8t3uRuyakLXbUPqE1tarR4/F9wX1tOx5Dxy7dfZiDukn6lng==
X-Received: by 2002:a17:90b:4b0b:b0:340:c094:fbff with SMTP id 98e67ed59e1d1-34e71e09fecmr17011402a91.10.1766564408100;
        Wed, 24 Dec 2025 00:20:08 -0800 (PST)
Received: from [192.168.1.11] ([106.222.232.236])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e77285111sm9006585a91.5.2025.12.24.00.20.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Dec 2025 00:20:07 -0800 (PST)
Message-ID: <611b87db-9226-4c99-a07d-03351dd10546@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 13:50:00 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/8] thermal: Add Remote Proc cooling driver
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, rafael@kernel.org,
        daniel.lezcano@linaro.org, rui.zhang@intel.com, lukasz.luba@arm.com,
        konradybcio@kernel.org, amitk@kernel.org, mani@kernel.org,
        casey.connolly@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>
References: <20251223123227.1317244-1-gaurav.kohli@oss.qualcomm.com>
 <20251223123227.1317244-2-gaurav.kohli@oss.qualcomm.com>
 <iz3e2ojepgjo4c36ibl5sfpw2oidkj7sao6o2jint4midgsynm@adhsfkukk2ba>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <iz3e2ojepgjo4c36ibl5sfpw2oidkj7sao6o2jint4midgsynm@adhsfkukk2ba>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: RUZe5LOAtsC2OgVKTLE6kCbayOPzM4KT
X-Proofpoint-GUID: RUZe5LOAtsC2OgVKTLE6kCbayOPzM4KT
X-Authority-Analysis: v=2.4 cv=aOf9aL9m c=1 sm=1 tr=0 ts=694ba239 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=pk+8NuH2X28N4C0eta/h1Q==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8
 a=a4_5xkhM6FseDPdgHKsA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA3MSBTYWx0ZWRfX/4EOPzPJDfRK
 ybt/3MFib3FxohxtQlW4gySnRudIv8Py2c5tgM63tqqnrJcizemD7YTEWx4C15d7f7p3eZDOAtB
 h/qXeLO7RW/Wmkn04zmlIfG04abQY8zyVJYJHMaB6E2cZ+C9Ng6bgSmBhy3eyYSDM6hDd1E5Jne
 YQ46ayKnvXeMtfK7dlH6riw7ekoalePV/FS2K2k1X2/nr1dfvgpQDJHVrRtSGCONceTm/AVqnBQ
 1+msjXk07M7aNtDWHZIuWKQ9Vk5/kREEs1bZUTttK2j7U++2Zrctm9m/SYtd+tRV5HIsLQ3UyFc
 aeGII7cJlN8AuDVpL6C6x1VJbnQYywk/LlGRzPKg1kwaMr2g9WdAZ4waQpnU2YGrgPk5Ch5yyRQ
 cAiUJLEBPRq9OgsjsIevddTZvjGHqmuXFSDM017w+JC/8Aufwizb5JZDKfNUdVnTjG51mdQ4NMf
 JMFNwlXLHo41cIfTRDA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240071


On 12/24/2025 12:53 AM, Dmitry Baryshkov wrote:
> On Tue, Dec 23, 2025 at 06:02:20PM +0530, Gaurav Kohli wrote:
>> Add a new generic driver for thermal cooling devices that control
>> remote processors (modem, DSP, etc.) through various communication
>> channels.
>>
>> This driver provides an abstraction layer between the thermal
>> subsystem and vendor-specific remote processor communication
>> mechanisms.
> This driver simply wraps 3 callbacks. Please explain in the commit
> message, why do we need it? Why can't the consumer of this API simply
> provide those callbacks directly?


thanks for review, sure i will update in next post.


>> Suggested-by: Amit Kucheria <amit.kucheria@oss.qualcomm.com>
>> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
>> ---
>>   MAINTAINERS                          |   8 ++
>>   drivers/thermal/Kconfig              |  11 ++
>>   drivers/thermal/Makefile             |   2 +
>>   drivers/thermal/remoteproc_cooling.c | 154 +++++++++++++++++++++++++++
>>   include/linux/remoteproc_cooling.h   |  52 +++++++++
>>   5 files changed, 227 insertions(+)
>>   create mode 100644 drivers/thermal/remoteproc_cooling.c
>>   create mode 100644 include/linux/remoteproc_cooling.h
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 679e5f11e672..c1ba87315cdf 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -25935,6 +25935,14 @@ F:	drivers/thermal/cpufreq_cooling.c
>>   F:	drivers/thermal/cpuidle_cooling.c
>>   F:	include/linux/cpu_cooling.h
>>   
>> +THERMAL/REMOTEPROC_COOLING
>> +M:	Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
>> +L:	linux-pm@vger.kernel.org
>> +S:	Supported
>> +F:	drivers/thermal/remoteproc_cooling.c
>> +F:	include/linux/remoteproc_cooling.h
>> +
>> +
>>   THERMAL/POWER_ALLOCATOR
>>   M:	Lukasz Luba <lukasz.luba@arm.com>
>>   L:	linux-pm@vger.kernel.org
>> diff --git a/drivers/thermal/Kconfig b/drivers/thermal/Kconfig
>> index b10080d61860..31e92be34387 100644
>> --- a/drivers/thermal/Kconfig
>> +++ b/drivers/thermal/Kconfig
>> @@ -229,6 +229,17 @@ config PCIE_THERMAL
>>   
>>   	  If you want this support, you should say Y here.
>>   
>> +
>> +config REMOTEPROC_THERMAL
>> +	bool "Remote processor cooling support"
> Why this is 'bool' rather than 'tristate'?


tristate will be fine, will update this.


>
>> +	help
>> +	  This implements a generic cooling mechanism for remote processors
>> +	  (modem, DSP, etc.) that allows vendor-specific implementations to
>> +	  register thermal cooling devices and provide callbacks for thermal
>> +	  mitigation.
>> +
>> +	  If you want this support, you should say Y here.
>> +
>>   config THERMAL_EMULATION
>>   	bool "Thermal emulation mode support"
>>   	help
>> diff --git a/drivers/thermal/Makefile b/drivers/thermal/Makefile
>> index bb21e7ea7fc6..ae747dde54fe 100644
>> --- a/drivers/thermal/Makefile
>> +++ b/drivers/thermal/Makefile
>> @@ -34,6 +34,8 @@ thermal_sys-$(CONFIG_DEVFREQ_THERMAL) += devfreq_cooling.o
>>   
>>   thermal_sys-$(CONFIG_PCIE_THERMAL) += pcie_cooling.o
>>   
>> +thermal_sys-$(CONFIG_REMOTEPROC_THERMAL) += remoteproc_cooling.o
>> +
>>   obj-$(CONFIG_K3_THERMAL)	+= k3_bandgap.o k3_j72xx_bandgap.o
>>   # platform thermal drivers
>>   obj-y				+= broadcom/
>> diff --git a/drivers/thermal/remoteproc_cooling.c b/drivers/thermal/remoteproc_cooling.c
>> new file mode 100644
>> index 000000000000..a1f948cbde0f
>> --- /dev/null
>> +++ b/drivers/thermal/remoteproc_cooling.c
>> @@ -0,0 +1,154 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Remote Processor Cooling Device
>> + *
>> + * Copyright (c) 2025, Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +
>> +#include <linux/err.h>
>> +#include <linux/export.h>
>> +#include <linux/module.h>
>> +#include <linux/mutex.h>
>> +#include <linux/of.h>
>> +#include <linux/slab.h>
>> +#include <linux/thermal.h>
>> +
>> +#define REMOTEPROC_PREFIX		"rproc_"
>> +
>> +struct remoteproc_cooling_ops {
>> +	int (*get_max_level)(void *devdata, unsigned long *level);
>> +	int (*get_cur_level)(void *devdata, unsigned long *level);
>> +	int (*set_cur_level)(void *devdata, unsigned long level);
>> +};
>> +
>> +/**
>> + * struct remoteproc_cdev - Remote processor cooling device
>> + * @cdev: Thermal cooling device handle
>> + * @ops: Vendor-specific operation callbacks
>> + * @devdata: Private data for vendor implementation
>> + * @np: Device tree node associated with this cooling device
>> + * @lock: Mutex to protect cooling device operations
>> + */
>> +struct remoteproc_cdev {
>> +	struct thermal_cooling_device *cdev;
>> +	const struct remoteproc_cooling_ops *ops;
>> +	void *devdata;
>> +	struct device_node *np;
>> +	struct mutex lock;
>> +};
>> +
>> +
>> +/* Thermal cooling device callbacks */
>> +
>> +static int remoteproc_get_max_state(struct thermal_cooling_device *cdev,
>> +				    unsigned long *state)
>> +{
>> +	struct remoteproc_cdev *rproc_cdev = cdev->devdata;
>> +	int ret;
>> +
>> +	if (!rproc_cdev || !rproc_cdev->ops)
>> +		return -EINVAL;
>> +
>> +	mutex_lock(&rproc_cdev->lock);
>> +	ret = rproc_cdev->ops->get_max_level(rproc_cdev->devdata, state);
>> +	mutex_unlock(&rproc_cdev->lock);
>> +
>> +	return ret;
>> +}
>> +
>> +static int remoteproc_get_cur_state(struct thermal_cooling_device *cdev,
>> +				    unsigned long *state)
>> +{
>> +	struct remoteproc_cdev *rproc_cdev = cdev->devdata;
>> +	int ret;
>> +
>> +	if (!rproc_cdev || !rproc_cdev->ops)
>> +		return -EINVAL;
>> +
>> +	mutex_lock(&rproc_cdev->lock);
>> +	ret = rproc_cdev->ops->get_cur_level(rproc_cdev->devdata, state);
>> +	mutex_unlock(&rproc_cdev->lock);
>> +
>> +	return ret;
>> +}
>> +
>> +static int remoteproc_set_cur_state(struct thermal_cooling_device *cdev,
>> +				    unsigned long state)
>> +{
>> +	struct remoteproc_cdev *rproc_cdev = cdev->devdata;
>> +	int ret;
>> +
>> +	if (!rproc_cdev || !rproc_cdev->ops)
>> +		return -EINVAL;
>> +
>> +	mutex_lock(&rproc_cdev->lock);
>> +	ret = rproc_cdev->ops->set_cur_level(rproc_cdev->devdata, state);
>> +	mutex_unlock(&rproc_cdev->lock);
>> +
>> +	return ret;
>> +}
>> +
>> +static const struct thermal_cooling_device_ops remoteproc_cooling_ops = {
>> +	.get_max_state = remoteproc_get_max_state,
>> +	.get_cur_state = remoteproc_get_cur_state,
>> +	.set_cur_state = remoteproc_set_cur_state,
>> +};
>> +
>> +struct remoteproc_cdev *
>> +remoteproc_cooling_register(struct device_node *np,
>> +			     const char *name, const struct remoteproc_cooling_ops *ops,
>> +			     void *devdata)
>> +{
>> +	struct remoteproc_cdev *rproc_cdev;
>> +	struct thermal_cooling_device *cdev;
>> +	int ret;
>> +
>> +	if (!name || !ops) {
>> +		return ERR_PTR(-EINVAL);
>> +	}
>> +
>> +	rproc_cdev = kzalloc(sizeof(*rproc_cdev), GFP_KERNEL);
>> +	if (!rproc_cdev)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	rproc_cdev->ops = ops;
>> +	rproc_cdev->devdata = devdata;
>> +	rproc_cdev->np = np;
>> +	mutex_init(&rproc_cdev->lock);
>> +
>> +	char *rproc_name __free(kfree) =
>> +		kasprintf(GFP_KERNEL, REMOTEPROC_PREFIX "%s", name);
>> +	/* Register with thermal framework */
>> +	if (np) {
>> +		cdev = thermal_of_cooling_device_register(np, rproc_name, rproc_cdev,
>> +							  &remoteproc_cooling_ops);
>> +	}
>> +
>> +	if (IS_ERR(cdev)) {
>> +		ret = PTR_ERR(cdev);
>> +		goto free_rproc_cdev;
>> +	}
> So, if np == NULL, we register nothing, but still return 0 (aka no
> error). Why?
>
>> +
>> +	rproc_cdev->cdev = cdev;
>> +
>> +	return rproc_cdev;
>> +
>> +free_rproc_cdev:
>> +	kfree(rproc_cdev);
>> +	return ERR_PTR(ret);
>> +}
>> +EXPORT_SYMBOL_GPL(remoteproc_cooling_register);
>> +
>> +void remoteproc_cooling_unregister(struct remoteproc_cdev *rproc_cdev)
>> +{
>> +	if (!rproc_cdev)
>> +		return;
>> +
>> +	thermal_cooling_device_unregister(rproc_cdev->cdev);
>> +	mutex_destroy(&rproc_cdev->lock);
>> +	kfree(rproc_cdev);
>> +}
>> +EXPORT_SYMBOL_GPL(remoteproc_cooling_unregister);
>> +
>> +MODULE_LICENSE("GPL");
>> +MODULE_DESCRIPTION("Remote Processor Cooling Device");
>> diff --git a/include/linux/remoteproc_cooling.h b/include/linux/remoteproc_cooling.h
>> new file mode 100644
>> index 000000000000..ef94019d220d
>> --- /dev/null
>> +++ b/include/linux/remoteproc_cooling.h
>> @@ -0,0 +1,52 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * Remote Processor Cooling Device
>> + *
>> + * Copyright (c) 2025, Qualcomm Innovation Center
>> + */
>> +
>> +#ifndef __REMOTEPROC_COOLING_H__
>> +#define __REMOTEPROC_COOLING_H__
>> +
>> +#include <linux/thermal.h>
>> +
>> +struct device;
>> +struct device_node;
>> +
>> +struct remoteproc_cooling_ops {
>> +	int (*get_max_level)(void *devdata, unsigned long *level);
>> +	int (*get_cur_level)(void *devdata, unsigned long *level);
>> +	int (*set_cur_level)(void *devdata, unsigned long level);
>> +};
>> +
>> +struct remoteproc_cdev;
>> +
>> +#ifdef CONFIG_REMOTEPROC_THERMAL
>> +
>> +struct remoteproc_cdev *
>> +remoteproc_cooling_register(struct device_node *np,
>> +			     const char *name,
>> +			     const struct remoteproc_cooling_ops *ops,
>> +			     void *devdata);
>> +
>> +void remoteproc_cooling_unregister(struct remoteproc_cdev *rproc_cdev);
>> +
>> +#else /* !CONFIG_REMOTEPROC_THERMAL */
>> +
>> +static inline struct remoteproc_cdev *
>> +remoteproc_cooling_register(struct device_node *np,
>> +			     const char *name,
>> +			     const struct remoteproc_cooling_ops *ops,
>> +			     void *devdata)
>> +{
>> +	return ERR_PTR(-EINVAL);
>> +}
>> +
>> +static inline void
>> +remoteproc_cooling_unregister(struct remoteproc_cdev *rproc_cdev)
>> +{
>> +}
>> +
>> +#endif /* CONFIG_REMOTEPROC_THERMAL */
>> +
>> +#endif /* __REMOTEPROC_COOLING_H__ */
>> -- 
>> 2.34.1
>>

