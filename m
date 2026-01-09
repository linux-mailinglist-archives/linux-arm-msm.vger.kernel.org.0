Return-Path: <linux-arm-msm+bounces-88266-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 463E1D08E49
	for <lists+linux-arm-msm@lfdr.de>; Fri, 09 Jan 2026 12:30:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5C2CD3032A8E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jan 2026 11:28:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C014332E124;
	Fri,  9 Jan 2026 11:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ikOy7S9d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EhRennRD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E9A630CD9E
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jan 2026 11:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767958126; cv=none; b=cNSc+xikiDEFMlFhp0NBza9WTuIjBUJiCnhlGvzmkRNbrWEe0Bh8/pvo5q34Ap46CO8mIYKCJFNY45nXJRkyh/ABufcAyg38pKBC/lbY8LqECZLN0YRrHJzbcsqYr12msCLh6qYcAGzs7QuBFpNg9UdMdktaKgIzKBK1lvHAJ7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767958126; c=relaxed/simple;
	bh=RyPtMQ23AElf9e63ayNjxmnBya/d3ZZ+Uo6NeW6+EtU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EdrMBXRzuhe9zmzRjf2S5VNke+Uaj307sXGeOOENv+9j+vAnXkrIScK6EpVfcjmd6YmLQEBS0lzGtpNfmTUAhCe3qFFHUQyH1RP9h0bbZm/A1wh0N3QXdzeaEvZp4nzPfPgJ2JuM0zCnKfaaKRjTNOJocvHAvS/9U3LwXf0Zx24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ikOy7S9d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EhRennRD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6099Xh361048219
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Jan 2026 11:28:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FGN5OGrvh/x38joNYPZBYpzrIyLezSMcAcL6/Hj2ygo=; b=ikOy7S9dofpnkYZo
	sSn6rBp89ChrG6PQekeLao9fU8+Hr+4UfpRImfQr1x1jXFmj1E9FWDageRbz9Qb2
	13ADnFbnkRCXztpL9Ipj+V1RzU09818ZmcMer2QtlnXPBtyRbPUcn2NtWdEn6q7T
	sFihpMXEjoU7HHg7yvSyNtAteHniqYxqqppsVh0PExIhqBQ75E4PigkB47ltOIfs
	28BmBln4Kcf7PsmYPvuaJsBLg5Gi9rYltmilU8apfa73XNUmXInoWlp7+s5nyVqI
	1olAfika42qQf8z/mCupei6vrQH9xBHRVaAwEZ5S3ZGrkh7/QsZcqbDRqt7KveQ8
	O/Pl+w==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjy5b8an6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 11:28:40 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-81eef665b49so90799b3a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 03:28:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767958120; x=1768562920; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FGN5OGrvh/x38joNYPZBYpzrIyLezSMcAcL6/Hj2ygo=;
        b=EhRennRDpplGYc9KNp0/m+pm7gJCVYHqpZqSA1lm5fLgzRpMtg8IhVbn7cQbt5EX7c
         EKC5U7hZCRFqguEHjHRKOQjSKISWadXp0rHM/k0BfLxQ/hRY6+/TkV6fRILoGjjFf6T5
         5nExF/3/JQ8x6UDAkhF6/WnCVc+ZdhFRpHEjU+KCoL+NOW8U6P3lqvWrG3kYGSxvkJdc
         b7p0M9cbuADxExaiviXOJyc7XOC0df4DZoUB84RLtn+yEwuSqZ7/V5ZHMAoSAqt6lZzo
         9GlqWH1k7W39YoayfTIseHtqJw7q/+ANGXXyMvdn2Y93GRuYlz9X4RYWPjmj2ibNkBoe
         OVFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767958120; x=1768562920;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FGN5OGrvh/x38joNYPZBYpzrIyLezSMcAcL6/Hj2ygo=;
        b=Sj+9H0Mj886mIKf2zwINSuDiXTLU0/Q98R4fzs/nJrpKFPchnuABtPyj9dT+G3Nm2V
         x++oE41q8+rXgGum8Fo14WJlje8KrnK7epFcLlXIm4Oj5BSxbgbwAMuvtLNKgDHEZvuW
         D+JATSbODTqeuf3hqJmR4PSFPVoM9pHfDzTlZIEWoUKJr78ZtYsS/+fKd5Fh9KGkrRhO
         vLJ+Ttc+zNBX8XQ6mU68QozWqO3QL2PO3cvfvhki8Fi6fxF4iZYpBuCvSRVaI6388TVQ
         WxI4OroY1vEFL2xbkzDRDR/iofzQelQ20gVyQdCQX9LPJ3tpT+7T2mwzleox9TFAyKUE
         tRqw==
X-Forwarded-Encrypted: i=1; AJvYcCU2EeArpPR5bJRtQJGKdCtwmJoOFH4CtV9M2zIDCgiVM3PKV0ebZ3v2J4E3degAXmNaFUFm/Dlg4iNQcKtw@vger.kernel.org
X-Gm-Message-State: AOJu0YzaKvKhJ97K+QVTQKAzoQWaP83dd3EF/5qjAgFoGDNzlxuAVHy1
	fTjonoYEj5qzJyR/amNOGYdnhBR8XTPWQfr2T2FdbXp51DjnwlUx2crmRlgkfpQk3tfhdqkTe0E
	qTuDmguFytHjaAXG6Jd4azaR6yz9zod3YTbR6YgbXzMzaMwVu1Li7uPENvh1fLCjgww5E
X-Gm-Gg: AY/fxX6sZ3xNUaazjfS507tyfGVwISjwKiAwJXJwSODYKJaiqQZOQkd0PbQWFbr0ogM
	Wt5XvZl8bcC7NUr3428Y5JmffXogxJrlcT3dm+yH02K4wHfsYJ25PdGO/rreNZjQAhnf/sxVDlc
	wMUoHAUHg/8iEUSkl8FrBckWf7IfMM2aZSc8dPOiQERpFRC0XEQ70vVZBbObzGed7n4LQQHI6mT
	6KGrglCAIAerVgjTjnQDLzYRw7YwlgTT2c+Nte4Nvr2ih4JWClR8Jovrv4IMDZTsmpWZTzO+Y4w
	RvmUS82SMeXBB7ITfYvlxEsi+g8uEeek9PLAFXVUgLB7gF09sDp4esEloTqL5dIS+HGHPZTyjDZ
	jSy5kTWW1E8DNw4+zpNZAXnjFA1BxX+vMD115n+My4LZ3JUPTR8Y0lSuu6m6Bw1uDLk6NJibW9m
	U=
X-Received: by 2002:a05:6a00:4215:b0:81e:8e66:38d9 with SMTP id d2e1a72fcca58-81e8e66552cmr1144833b3a.17.1767958119664;
        Fri, 09 Jan 2026 03:28:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEqT+wWvTO35GE1P2/uMCVst+d9L4F96AD9pHzfgd0wBp6IWQozaZdZsHTX3taobFXEvgIktQ==
X-Received: by 2002:a05:6a00:4215:b0:81e:8e66:38d9 with SMTP id d2e1a72fcca58-81e8e66552cmr1144805b3a.17.1767958119175;
        Fri, 09 Jan 2026 03:28:39 -0800 (PST)
Received: from [10.133.33.228] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81e5d129d41sm1567195b3a.67.2026.01.09.03.28.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jan 2026 03:28:38 -0800 (PST)
Message-ID: <069e2fb4-b4cc-474c-867c-2dd410ea80a4@oss.qualcomm.com>
Date: Fri, 9 Jan 2026 19:28:32 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 2/7] qcom-tgu: Add TGU driver
To: Songwei Chai <songwei.chai@oss.qualcomm.com>, andersson@kernel.org,
        alexander.shishkin@linux.intel.com, mike.leach@linaro.org,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        devicetree@vger.kernel.org, gregkh@linuxfoundation.org
References: <20260109021141.3778421-1-songwei.chai@oss.qualcomm.com>
 <20260109021141.3778421-3-songwei.chai@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260109021141.3778421-3-songwei.chai@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: KHhb8iSDYcI-n1CxugoaxxHkVSHgBXgM
X-Authority-Analysis: v=2.4 cv=JP42csKb c=1 sm=1 tr=0 ts=6960e668 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=RlaAdA2wXV2HMp-xn2gA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA4NCBTYWx0ZWRfX7CrnWZ0OuOLF
 CM6QD5z1zQJG9CC0KvW0p5ceqRjxpglKwtmVNGdwqFbpkOchzV40zstDvNnhkFYI4fCV8jqGZD6
 EjzP9Qo4aO4VMShymUauiYqgEByhffnu7riWDD4VbZjNKc0soX4VFXACCe5mGq9nz1BRO+g1Ozc
 jhbvxcPO5NuF1ELmh2bdetF71pXaDOrRU3tOKltkNJE1udC5HWvHK8w+4nlXxeiXhqikiKqeD7I
 4Wkcp63No1nTob32NpjlYxqQ8fM0ZykG+HfooIAIVlapeRPCH25A0Gf9GRQHAwNMBwVc6rR6u+e
 O+9jK62lV+/43VAWg8Uic3MhiwMXVwoZnDoMnFwJP09BuGJKgxt+Cp69s9Upgy/+y9go7r0UMGQ
 y9AAqDNR2Arh1uG7yREpVqB9uizRVrolYpHFzRPYew7LbAjl/u54FatA5FcuPZbiIb0WGGBiWcQ
 tGLBfJh4Fp2P/8iCLAA==
X-Proofpoint-GUID: KHhb8iSDYcI-n1CxugoaxxHkVSHgBXgM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_03,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090084



On 1/9/2026 10:11 AM, Songwei Chai wrote:
> Add driver to support device TGU (Trigger Generation Unit).
> TGU is a Data Engine which can be utilized to sense a plurality of
> signals and create a trigger into the CTI or generate interrupts to
> processors. Add probe/enable/disable functions for tgu.
> 
> Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
> ---
>   .../ABI/testing/sysfs-bus-amba-devices-tgu    |   9 +
>   drivers/Makefile                              |   1 +
>   drivers/hwtracing/Kconfig                     |   2 +
>   drivers/hwtracing/qcom/Kconfig                |  18 ++
>   drivers/hwtracing/qcom/Makefile               |   3 +
>   drivers/hwtracing/qcom/tgu.c                  | 176 ++++++++++++++++++
>   drivers/hwtracing/qcom/tgu.h                  |  51 +++++

drivers/hwtracing/qcom is a new dir, I suppose this patch series will go 
through QCOM tree? If Yes, I think it's better to update the MAINTAINER 
file to add QCOM maintainers for maintaining this dir. Otherwise the 
get_maintainer script can not obtain proper reviewer&maintainer for 
reviewing.

Thanks,
Jie

>   7 files changed, 260 insertions(+)
>   create mode 100644 Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
>   create mode 100644 drivers/hwtracing/qcom/Kconfig
>   create mode 100644 drivers/hwtracing/qcom/Makefile
>   create mode 100644 drivers/hwtracing/qcom/tgu.c
>   create mode 100644 drivers/hwtracing/qcom/tgu.h
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
> new file mode 100644
> index 000000000000..56ec3f5ab5d6
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
> @@ -0,0 +1,9 @@
> +What:		/sys/bus/amba/devices/<tgu-name>/enable_tgu
> +Date:		January 2026
> +KernelVersion	6.19
> +Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
> +Description:
> +		(RW) Set/Get the enable/disable status of TGU
> +		Accepts only one of the 2 values -  0 or 1.
> +		0 : disable TGU.
> +		1 : enable TGU.
> diff --git a/drivers/Makefile b/drivers/Makefile
> index ccc05f1eae3e..9608a3debb1f 100644
> --- a/drivers/Makefile
> +++ b/drivers/Makefile
> @@ -177,6 +177,7 @@ obj-$(CONFIG_RAS)		+= ras/
>   obj-$(CONFIG_USB4)		+= thunderbolt/
>   obj-$(CONFIG_CORESIGHT)		+= hwtracing/coresight/
>   obj-y				+= hwtracing/intel_th/
> +obj-y				+= hwtracing/qcom/
>   obj-$(CONFIG_STM)		+= hwtracing/stm/
>   obj-$(CONFIG_HISI_PTT)		+= hwtracing/ptt/
>   obj-y				+= android/
> diff --git a/drivers/hwtracing/Kconfig b/drivers/hwtracing/Kconfig
> index 911ee977103c..8a640218eed8 100644
> --- a/drivers/hwtracing/Kconfig
> +++ b/drivers/hwtracing/Kconfig
> @@ -7,4 +7,6 @@ source "drivers/hwtracing/intel_th/Kconfig"
>   
>   source "drivers/hwtracing/ptt/Kconfig"
>   
> +source "drivers/hwtracing/qcom/Kconfig"
> +
>   endmenu
> diff --git a/drivers/hwtracing/qcom/Kconfig b/drivers/hwtracing/qcom/Kconfig
> new file mode 100644
> index 000000000000..d6f6d4b0f28e
> --- /dev/null
> +++ b/drivers/hwtracing/qcom/Kconfig
> @@ -0,0 +1,18 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# QCOM specific hwtracing drivers
> +#
> +menu "Qualcomm specific hwtracing drivers"
> +
> +config QCOM_TGU
> +	tristate "QCOM Trigger Generation Unit driver"
> +	help
> +	  This driver provides support for Trigger Generation Unit that is
> +	  used to detect patterns or sequences on a given set of signals.
> +	  TGU is used to monitor a particular bus within a given region to
> +	  detect illegal transaction sequences or slave responses. It is also
> +	  used to monitor a data stream to detect protocol violations and to
> +	  provide a trigger point for centering data around a specific event
> +	  within the trace data buffer.
> +
> +endmenu
> diff --git a/drivers/hwtracing/qcom/Makefile b/drivers/hwtracing/qcom/Makefile
> new file mode 100644
> index 000000000000..5a0a868c1ea0
> --- /dev/null
> +++ b/drivers/hwtracing/qcom/Makefile
> @@ -0,0 +1,3 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +obj-$(CONFIG_QCOM_TGU) += tgu.o
> diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
> new file mode 100644
> index 000000000000..c5b2b384e6ae
> --- /dev/null
> +++ b/drivers/hwtracing/qcom/tgu.c
> @@ -0,0 +1,176 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <linux/amba/bus.h>
> +#include <linux/device.h>
> +#include <linux/err.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/pm_runtime.h>
> +
> +#include "tgu.h"
> +
> +static void tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
> +{
> +	TGU_UNLOCK(drvdata->base);
> +	/* Enable TGU to program the triggers */
> +	writel(1, drvdata->base + TGU_CONTROL);
> +	TGU_LOCK(drvdata->base);
> +}
> +
> +static int tgu_enable(struct device *dev)
> +{
> +	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
> +
> +	guard(spinlock)(&drvdata->lock);
> +	if (drvdata->enable)
> +		return -EBUSY;
> +
> +	tgu_write_all_hw_regs(drvdata);
> +	drvdata->enable = true;
> +
> +	return 0;
> +}
> +
> +static void tgu_disable(struct device *dev)
> +{
> +	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
> +
> +	guard(spinlock)(&drvdata->lock);
> +	if (drvdata->enable) {
> +		TGU_UNLOCK(drvdata->base);
> +		writel(0, drvdata->base + TGU_CONTROL);
> +		TGU_LOCK(drvdata->base);
> +
> +		drvdata->enable = false;
> +	}
> +}
> +
> +static ssize_t enable_tgu_show(struct device *dev,
> +				struct device_attribute *attr, char *buf)
> +{
> +	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
> +	bool enabled;
> +
> +	guard(spinlock)(&drvdata->lock);
> +	enabled = drvdata->enable;
> +
> +	return sysfs_emit(buf, "%d\n", enabled ? 1 : 0);
> +}
> +
> +/* enable_tgu_store - Configure Trace and Gating Unit (TGU) triggers. */
> +static ssize_t enable_tgu_store(struct device *dev,
> +				struct device_attribute *attr,
> +				const char *buf,
> +				size_t size)
> +{
> +	unsigned long val;
> +	int ret = 0;
> +
> +	ret = kstrtoul(buf, 0, &val);
> +	if (ret)
> +		return ret;
> +
> +	if (val) {
> +		ret = pm_runtime_resume_and_get(dev);
> +		if (ret)
> +			return ret;
> +		ret = tgu_enable(dev);
> +		if (ret) {
> +			pm_runtime_put(dev);
> +			return ret;
> +		}
> +	} else {
> +		tgu_disable(dev);
> +		pm_runtime_put(dev);
> +	}
> +
> +	return size;
> +}
> +static DEVICE_ATTR_RW(enable_tgu);
> +
> +static struct attribute *tgu_common_attrs[] = {
> +	&dev_attr_enable_tgu.attr,
> +	NULL,
> +};
> +
> +static const struct attribute_group tgu_common_grp = {
> +	.attrs = tgu_common_attrs,
> +	NULL,
> +};
> +
> +static const struct attribute_group *tgu_attr_groups[] = {
> +	&tgu_common_grp,
> +	NULL,
> +};
> +
> +static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
> +{
> +	struct device *dev = &adev->dev;
> +	struct tgu_drvdata *drvdata;
> +	int ret;
> +
> +	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
> +	if (!drvdata)
> +		return -ENOMEM;
> +
> +	drvdata->dev = &adev->dev;
> +	dev_set_drvdata(dev, drvdata);
> +
> +	drvdata->base = devm_ioremap_resource(dev, &adev->res);
> +	if (IS_ERR(drvdata->base))
> +		return PTR_ERR(drvdata->base);
> +
> +	spin_lock_init(&drvdata->lock);
> +
> +	ret = sysfs_create_groups(&dev->kobj, tgu_attr_groups);
> +	if (ret) {
> +		dev_err(dev, "failed to create sysfs groups: %d\n", ret);
> +		return ret;
> +	}
> +
> +	drvdata->enable = false;
> +
> +	pm_runtime_put(&adev->dev);
> +	return 0;
> +}
> +
> +static void tgu_remove(struct amba_device *adev)
> +{
> +	struct device *dev = &adev->dev;
> +
> +	sysfs_remove_groups(&dev->kobj, tgu_attr_groups);
> +
> +	tgu_disable(dev);
> +}
> +
> +static const struct amba_id tgu_ids[] = {
> +	{
> +		.id = 0x000f0e00,
> +		.mask = 0x000fffff,
> +	},
> +	{ 0, 0, NULL },
> +};
> +
> +MODULE_DEVICE_TABLE(amba, tgu_ids);
> +
> +static struct amba_driver tgu_driver = {
> +	.drv = {
> +		.name = "qcom-tgu",
> +		.suppress_bind_attrs = true,
> +	},
> +	.probe = tgu_probe,
> +	.remove = tgu_remove,
> +	.id_table = tgu_ids,
> +};
> +
> +module_amba_driver(tgu_driver);
> +
> +MODULE_AUTHOR("Songwei Chai <songwei.chai@oss.qualcomm.com>");
> +MODULE_AUTHOR("Jinlong Mao <jinlong.mao@oss.qualcomm.com>");
> +MODULE_DESCRIPTION("Qualcomm Trigger Generation Unit driver");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/hwtracing/qcom/tgu.h b/drivers/hwtracing/qcom/tgu.h
> new file mode 100644
> index 000000000000..b11cfb28261d
> --- /dev/null
> +++ b/drivers/hwtracing/qcom/tgu.h
> @@ -0,0 +1,51 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#ifndef _QCOM_TGU_H
> +#define _QCOM_TGU_H
> +
> +/* Register addresses */
> +#define TGU_CONTROL 0x0000
> +#define TGU_LAR		0xfb0
> +#define TGU_UNLOCK_OFFSET	0xc5acce55
> +
> +static inline void TGU_LOCK(void __iomem *addr)
> +{
> +	do {
> +		/* Wait for things to settle */
> +		mb();
> +		writel_relaxed(0x0, addr + TGU_LAR);
> +	} while (0);
> +}
> +
> +static inline void TGU_UNLOCK(void __iomem *addr)
> +{
> +	do {
> +		writel_relaxed(TGU_UNLOCK_OFFSET, addr + TGU_LAR);
> +		/* Make sure everyone has seen this */
> +		mb();
> +	} while (0);
> +}
> +
> +/**
> + * struct tgu_drvdata - Data structure for a TGU (Trigger Generator Unit)
> + * @base: Memory-mapped base address of the TGU device
> + * @dev: Pointer to the associated device structure
> + * @lock: Spinlock for handling concurrent access
> + * @enable: Flag indicating whether the TGU device is enabled
> + *
> + * This structure defines the data associated with a TGU device,
> + * including its base address, device pointers, clock, spinlock for
> + * synchronization, trigger data pointers, maximum limits for various
> + * trigger-related parameters, and enable status.
> + */
> +struct tgu_drvdata {
> +	void __iomem *base;
> +	struct device *dev;
> +	spinlock_t lock;
> +	bool enable;
> +};
> +
> +#endif


