Return-Path: <linux-arm-msm+bounces-88499-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3F0D1176F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 10:22:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DA42F3093B3A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 09:19:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3907329C53;
	Mon, 12 Jan 2026 09:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hc9xytzD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dgm2E5/Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18489347FC0
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 09:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768209571; cv=none; b=KCBp8irfHkhZGaSS7ORgU5xvaTGql9uZ73CcyQXQm/qhcNEQpCYBkDo85m3d4u8Dpc6P45ek8aw33j6SR6/GRebAbyi0sk51a78LjxExDdP6yI8t2fbPWAeqFUoGeY+8nqnVjd2dDyqhr7uLfnFsiUwEwlzFB639+iqyBalV1RE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768209571; c=relaxed/simple;
	bh=r5sYsG522o0JGrWePhV3XbdTMH8uLEyoWKmdNq7IV6o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rU6q+ZqWc8XGw0Z01UzC9UOuO8yidCRwGIgXuM1lxZsIIQaCQc0lCaKgYXtJsShfTp3QdQqWUmRKyjtNBFqeUHuLCu00XimfIF8kBxkE/zL5Wjeb4waE6n8Nn1F72R+6d6oA7r9wmeTgy1bcdPqCWq9+E9VnojVE1Hk9hMxbnSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hc9xytzD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dgm2E5/Q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C8sIJf676410
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 09:19:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iE5I7iaezzE9aXAUoqN6SHeOzvRvmQyoGbsbC7o536Y=; b=Hc9xytzDn0qPbBKq
	x3CHQ3C9cDwUWjCFo3evaCnuZlqTLwrMSxs9kJJbJ2KeKRZYITbu9A5PWY76J/3T
	aw294CPMQM5m8Ww1p/dPNQd32F7j35TCJXKSNzlYzeKQtUOu9Ptc9heK8gg2/Hk3
	u0/JnYL3LMnPnLMh3o5lLeJl/cgXCRLfLxFNs0+pcy38YvNNxPyJ2I25BR7DcbeX
	99PaBnEGPJ8jXz6M9uPE34bLRZmOx7xXhOUNLYOslReoWqhhpuGfdPRbsVqDkTys
	48BXpCT6gMOK5Q9XLjB6g3KQhvT3KVPfpnpMdQ6rljYxsa6UaUGwXR5ZeoRUYbvt
	d5R3OQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bmwur82u3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 09:19:28 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a31087af17so84135605ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 01:19:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768209568; x=1768814368; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iE5I7iaezzE9aXAUoqN6SHeOzvRvmQyoGbsbC7o536Y=;
        b=Dgm2E5/Q0q4T3u9dXQqX9tBhZoxC7C0VNkwWAyBE5Q70t2o01gH5T7JHtvjM1bOI7z
         0qWXMf3PtzcbdK6e7C+yODjCVqGmauklwOOrZ100Yyo4Z0WoMhFZQDSjQngTrOQxy6fC
         p9ADdFRvca7j0VlfHjRjTekSAOxy2imcH/Y6YdH1fLVa4EWPBALtH1Ht9N51VTbC11Eq
         FriuQkSr4VLX2YC9jjbpsv5l3olcp2/cfqD4oiCRgRuBYmXA3esHqhPXQuReh3q0YEmy
         ee2jKGuGWAriEBjTEfIcZbO9Sp6fE4xIuNz9x7o75IeixTy2zdYw/425eq/YkSAptZVn
         57Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768209568; x=1768814368;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iE5I7iaezzE9aXAUoqN6SHeOzvRvmQyoGbsbC7o536Y=;
        b=XB/OTV+XTtWsye3bxf5hqUnJ/nF/NNzzj4HoN8E3O+Tuo6M8565nwdQjG33faIbQDM
         WtKsONipE+tAvZmd6Xz7qKlmIWDoflhPXA3L4ONcGlgcUNfXjnsp8n5hDCSR+HW4uuZE
         DDHRnfA3SNRwm1BBaVG6qlEOve7ksCbmWvXOHQW+Wjlvcx25INQ7MwJCZp+APdIrw6ja
         lN3Lb1grpl62N3nzzT/W0XQ4jfwNH8qRHFC02GdCKAjUKdvk2aRSBdKzO9YLDwDBInxB
         5zlUvFi54775P9ysTBp5JTbnZunlqILSTKjC4fBIWxI0VH18RIroRPPNCqIRBZi10mAV
         mQPw==
X-Forwarded-Encrypted: i=1; AJvYcCUwDCNqbX/TYUVqCgBNF8Os0o1fEM4buYFIhlMaz38C/1K/2TeR6XA7O2ayBPUM5ewF+Mdd9xBnZt+hP2NN@vger.kernel.org
X-Gm-Message-State: AOJu0Yzk16m95zPw3DIQQ7Aj+lR7YI8W/M/AxIID7YoJxkwVOKZ+ayYE
	COUSbAxJiBoWLJXEkg2hpsNLCKgqbYpWvQ7jV6PEpZN8kn1IZvpBYIYSrJfxl+YOioCgnH7/Xxg
	KkayBOESRfo7oK61fvmIfyNOMozAhbOjFx3y7v2xelVuYd2a30I6Gfc9c0OOOzF411/JI
X-Gm-Gg: AY/fxX4OaF3p7ZjO9tlythbeTuiMZL3OkfEahz9H2v3FYfQuXREsd1YT7P5PAh95+v9
	8AnkAS59p1nuLXPekrQ7X5rQPFF02EFRZSoM+rZc9uZemm+UnJV0h3tBlznug4CCGOGoevBOyfR
	i2cTDitqbMS+g7KTpH3jF4qQE3YhD7/fb6yTXDpLWZr7YXYGPIAWGPu1kcc39BGK/BM9mIoWoCs
	0UhJ1lY/wxHDMnxsKfnwWBGmXFLpGbJ7Z5tGDtjGi8kcQPrnsccxQ27vAzuUm82lUMLYLx7V1lD
	fffgWnOk9AOSgEyxjEIhinQA9FK+QSz1gckIFee7sz4pbLy/ORmclkOntBtDbOetYCHTelYokYj
	zzpOsueB9+uz6Bqx14AwA1VtV9SUuyoiQ6o69RnJi7Fti91tREvwh/uiYw5jgpp7EdZpsgQwDBc
	6Rft/0
X-Received: by 2002:a17:903:2309:b0:2a0:d46d:f990 with SMTP id d9443c01a7336-2a3ee4e81c6mr173925805ad.31.1768209567632;
        Mon, 12 Jan 2026 01:19:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEr63rTSU6mNKwEH2p/9lr8Yw3V9YiW8z4Df6TR0gET2yAmIZpynylnfKMGk+StpeE+EEAUIA==
X-Received: by 2002:a17:903:2309:b0:2a0:d46d:f990 with SMTP id d9443c01a7336-2a3ee4e81c6mr173925535ad.31.1768209566996;
        Mon, 12 Jan 2026 01:19:26 -0800 (PST)
Received: from [10.133.33.22] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c4795fsm171834885ad.33.2026.01.12.01.19.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 01:19:26 -0800 (PST)
Message-ID: <114f7305-de33-4360-82d2-4d61e14934ec@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 09:41:57 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 2/7] qcom-tgu: Add TGU driver
To: Jie Gan <jie.gan@oss.qualcomm.com>, andersson@kernel.org,
        alexander.shishkin@linux.intel.com, mike.leach@linaro.org,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        devicetree@vger.kernel.org, gregkh@linuxfoundation.org
References: <20260109021141.3778421-1-songwei.chai@oss.qualcomm.com>
 <20260109021141.3778421-3-songwei.chai@oss.qualcomm.com>
 <069e2fb4-b4cc-474c-867c-2dd410ea80a4@oss.qualcomm.com>
Content-Language: en-US
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
In-Reply-To: <069e2fb4-b4cc-474c-867c-2dd410ea80a4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA3MiBTYWx0ZWRfX3HVnF2BbHjsx
 VK4be4bC54d3A9ZsJrkKXXEMdo8vDhzJxxoGPyVN3IX7T4X5sdmldf9+lQqjQVgmcCIJyQ8fyb6
 mOAiKR71WXyjZSXHNcw/Lx8+tdvmVZ2swYKMKccVQ8YgYpdd/e8zCklcc+TtwJgdr5ffIfFBgrs
 l+lmbBjXD/HDw27ZMIb6zxQdvbYWro0wycgi7ad+iqaXmdzuQ7OwNzmMy3pkWhTF2GmK4lQHb4e
 lvrF8sJ8OPOou9IrqXK+StlRUgvvFtSt1cO5kLdFySTjYRhlbbA/oE4yaKuURMTQlffSSRCG0Lb
 sxPZZz1rBu6k0lQpkJHOnhPhO5pQBFTrgZSg/LK+XQTwniadXLrJQ3zh3HOsX6LJS4mQIlYkT+E
 Be3McEXgq2kuDGSqud+7/6OiIMs62Mg3+jTnuZrd3ypkBqtsqpvl46wdUbK0l0/xhYJopMyAWqh
 OPz0NULABXCDBIfkkWg==
X-Authority-Analysis: v=2.4 cv=HrJ72kTS c=1 sm=1 tr=0 ts=6964bca0 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=QtmeBwCpv1JMxDmLrj4A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: 4u-5uwbNcIj4g1eLkND30nEBGRSzNX6H
X-Proofpoint-ORIG-GUID: 4u-5uwbNcIj4g1eLkND30nEBGRSzNX6H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0
 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120072



On 1/9/2026 7:28 PM, Jie Gan wrote:
> 
> 
> On 1/9/2026 10:11 AM, Songwei Chai wrote:
>> Add driver to support device TGU (Trigger Generation Unit).
>> TGU is a Data Engine which can be utilized to sense a plurality of
>> signals and create a trigger into the CTI or generate interrupts to
>> processors. Add probe/enable/disable functions for tgu.
>>
>> Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
>> ---
>>   .../ABI/testing/sysfs-bus-amba-devices-tgu    |   9 +
>>   drivers/Makefile                              |   1 +
>>   drivers/hwtracing/Kconfig                     |   2 +
>>   drivers/hwtracing/qcom/Kconfig                |  18 ++
>>   drivers/hwtracing/qcom/Makefile               |   3 +
>>   drivers/hwtracing/qcom/tgu.c                  | 176 ++++++++++++++++++
>>   drivers/hwtracing/qcom/tgu.h                  |  51 +++++
> 
> drivers/hwtracing/qcom is a new dir, I suppose this patch series will go 
> through QCOM tree? If Yes, I think it's better to update the MAINTAINER 
> file to add QCOM maintainers for maintaining this dir. Otherwise the 
> get_maintainer script can not obtain proper reviewer&maintainer for 
> reviewing.
thanks Jie, will update further.>
> Thanks,
> Jie
> 
>>   7 files changed, 260 insertions(+)
>>   create mode 100644 Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
>>   create mode 100644 drivers/hwtracing/qcom/Kconfig
>>   create mode 100644 drivers/hwtracing/qcom/Makefile
>>   create mode 100644 drivers/hwtracing/qcom/tgu.c
>>   create mode 100644 drivers/hwtracing/qcom/tgu.h
>>
>> diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/ 
>> Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
>> new file mode 100644
>> index 000000000000..56ec3f5ab5d6
>> --- /dev/null
>> +++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
>> @@ -0,0 +1,9 @@
>> +What:        /sys/bus/amba/devices/<tgu-name>/enable_tgu
>> +Date:        January 2026
>> +KernelVersion    6.19
>> +Contact:    Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai 
>> <songwei.chai@oss.qualcomm.com>
>> +Description:
>> +        (RW) Set/Get the enable/disable status of TGU
>> +        Accepts only one of the 2 values -  0 or 1.
>> +        0 : disable TGU.
>> +        1 : enable TGU.
>> diff --git a/drivers/Makefile b/drivers/Makefile
>> index ccc05f1eae3e..9608a3debb1f 100644
>> --- a/drivers/Makefile
>> +++ b/drivers/Makefile
>> @@ -177,6 +177,7 @@ obj-$(CONFIG_RAS)        += ras/
>>   obj-$(CONFIG_USB4)        += thunderbolt/
>>   obj-$(CONFIG_CORESIGHT)        += hwtracing/coresight/
>>   obj-y                += hwtracing/intel_th/
>> +obj-y                += hwtracing/qcom/
>>   obj-$(CONFIG_STM)        += hwtracing/stm/
>>   obj-$(CONFIG_HISI_PTT)        += hwtracing/ptt/
>>   obj-y                += android/
>> diff --git a/drivers/hwtracing/Kconfig b/drivers/hwtracing/Kconfig
>> index 911ee977103c..8a640218eed8 100644
>> --- a/drivers/hwtracing/Kconfig
>> +++ b/drivers/hwtracing/Kconfig
>> @@ -7,4 +7,6 @@ source "drivers/hwtracing/intel_th/Kconfig"
>>   source "drivers/hwtracing/ptt/Kconfig"
>> +source "drivers/hwtracing/qcom/Kconfig"
>> +
>>   endmenu
>> diff --git a/drivers/hwtracing/qcom/Kconfig b/drivers/hwtracing/qcom/ 
>> Kconfig
>> new file mode 100644
>> index 000000000000..d6f6d4b0f28e
>> --- /dev/null
>> +++ b/drivers/hwtracing/qcom/Kconfig
>> @@ -0,0 +1,18 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
>> +#
>> +# QCOM specific hwtracing drivers
>> +#
>> +menu "Qualcomm specific hwtracing drivers"
>> +
>> +config QCOM_TGU
>> +    tristate "QCOM Trigger Generation Unit driver"
>> +    help
>> +      This driver provides support for Trigger Generation Unit that is
>> +      used to detect patterns or sequences on a given set of signals.
>> +      TGU is used to monitor a particular bus within a given region to
>> +      detect illegal transaction sequences or slave responses. It is 
>> also
>> +      used to monitor a data stream to detect protocol violations and to
>> +      provide a trigger point for centering data around a specific event
>> +      within the trace data buffer.
>> +
>> +endmenu
>> diff --git a/drivers/hwtracing/qcom/Makefile b/drivers/hwtracing/qcom/ 
>> Makefile
>> new file mode 100644
>> index 000000000000..5a0a868c1ea0
>> --- /dev/null
>> +++ b/drivers/hwtracing/qcom/Makefile
>> @@ -0,0 +1,3 @@
>> +# SPDX-License-Identifier: GPL-2.0
>> +
>> +obj-$(CONFIG_QCOM_TGU) += tgu.o
>> diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
>> new file mode 100644
>> index 000000000000..c5b2b384e6ae
>> --- /dev/null
>> +++ b/drivers/hwtracing/qcom/tgu.c
>> @@ -0,0 +1,176 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#include <linux/amba/bus.h>
>> +#include <linux/device.h>
>> +#include <linux/err.h>
>> +#include <linux/io.h>
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
>> +#include <linux/pm_runtime.h>
>> +
>> +#include "tgu.h"
>> +
>> +static void tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
>> +{
>> +    TGU_UNLOCK(drvdata->base);
>> +    /* Enable TGU to program the triggers */
>> +    writel(1, drvdata->base + TGU_CONTROL);
>> +    TGU_LOCK(drvdata->base);
>> +}
>> +
>> +static int tgu_enable(struct device *dev)
>> +{
>> +    struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
>> +
>> +    guard(spinlock)(&drvdata->lock);
>> +    if (drvdata->enable)
>> +        return -EBUSY;
>> +
>> +    tgu_write_all_hw_regs(drvdata);
>> +    drvdata->enable = true;
>> +
>> +    return 0;
>> +}
>> +
>> +static void tgu_disable(struct device *dev)
>> +{
>> +    struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
>> +
>> +    guard(spinlock)(&drvdata->lock);
>> +    if (drvdata->enable) {
>> +        TGU_UNLOCK(drvdata->base);
>> +        writel(0, drvdata->base + TGU_CONTROL);
>> +        TGU_LOCK(drvdata->base);
>> +
>> +        drvdata->enable = false;
>> +    }
>> +}
>> +
>> +static ssize_t enable_tgu_show(struct device *dev,
>> +                struct device_attribute *attr, char *buf)
>> +{
>> +    struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
>> +    bool enabled;
>> +
>> +    guard(spinlock)(&drvdata->lock);
>> +    enabled = drvdata->enable;
>> +
>> +    return sysfs_emit(buf, "%d\n", enabled ? 1 : 0);
>> +}
>> +
>> +/* enable_tgu_store - Configure Trace and Gating Unit (TGU) triggers. */
>> +static ssize_t enable_tgu_store(struct device *dev,
>> +                struct device_attribute *attr,
>> +                const char *buf,
>> +                size_t size)
>> +{
>> +    unsigned long val;
>> +    int ret = 0;
>> +
>> +    ret = kstrtoul(buf, 0, &val);
>> +    if (ret)
>> +        return ret;
>> +
>> +    if (val) {
>> +        ret = pm_runtime_resume_and_get(dev);
>> +        if (ret)
>> +            return ret;
>> +        ret = tgu_enable(dev);
>> +        if (ret) {
>> +            pm_runtime_put(dev);
>> +            return ret;
>> +        }
>> +    } else {
>> +        tgu_disable(dev);
>> +        pm_runtime_put(dev);
>> +    }
>> +
>> +    return size;
>> +}
>> +static DEVICE_ATTR_RW(enable_tgu);
>> +
>> +static struct attribute *tgu_common_attrs[] = {
>> +    &dev_attr_enable_tgu.attr,
>> +    NULL,
>> +};
>> +
>> +static const struct attribute_group tgu_common_grp = {
>> +    .attrs = tgu_common_attrs,
>> +    NULL,
>> +};
>> +
>> +static const struct attribute_group *tgu_attr_groups[] = {
>> +    &tgu_common_grp,
>> +    NULL,
>> +};
>> +
>> +static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
>> +{
>> +    struct device *dev = &adev->dev;
>> +    struct tgu_drvdata *drvdata;
>> +    int ret;
>> +
>> +    drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
>> +    if (!drvdata)
>> +        return -ENOMEM;
>> +
>> +    drvdata->dev = &adev->dev;
>> +    dev_set_drvdata(dev, drvdata);
>> +
>> +    drvdata->base = devm_ioremap_resource(dev, &adev->res);
>> +    if (IS_ERR(drvdata->base))
>> +        return PTR_ERR(drvdata->base);
>> +
>> +    spin_lock_init(&drvdata->lock);
>> +
>> +    ret = sysfs_create_groups(&dev->kobj, tgu_attr_groups);
>> +    if (ret) {
>> +        dev_err(dev, "failed to create sysfs groups: %d\n", ret);
>> +        return ret;
>> +    }
>> +
>> +    drvdata->enable = false;
>> +
>> +    pm_runtime_put(&adev->dev);
>> +    return 0;
>> +}
>> +
>> +static void tgu_remove(struct amba_device *adev)
>> +{
>> +    struct device *dev = &adev->dev;
>> +
>> +    sysfs_remove_groups(&dev->kobj, tgu_attr_groups);
>> +
>> +    tgu_disable(dev);
>> +}
>> +
>> +static const struct amba_id tgu_ids[] = {
>> +    {
>> +        .id = 0x000f0e00,
>> +        .mask = 0x000fffff,
>> +    },
>> +    { 0, 0, NULL },
>> +};
>> +
>> +MODULE_DEVICE_TABLE(amba, tgu_ids);
>> +
>> +static struct amba_driver tgu_driver = {
>> +    .drv = {
>> +        .name = "qcom-tgu",
>> +        .suppress_bind_attrs = true,
>> +    },
>> +    .probe = tgu_probe,
>> +    .remove = tgu_remove,
>> +    .id_table = tgu_ids,
>> +};
>> +
>> +module_amba_driver(tgu_driver);
>> +
>> +MODULE_AUTHOR("Songwei Chai <songwei.chai@oss.qualcomm.com>");
>> +MODULE_AUTHOR("Jinlong Mao <jinlong.mao@oss.qualcomm.com>");
>> +MODULE_DESCRIPTION("Qualcomm Trigger Generation Unit driver");
>> +MODULE_LICENSE("GPL");
>> diff --git a/drivers/hwtracing/qcom/tgu.h b/drivers/hwtracing/qcom/tgu.h
>> new file mode 100644
>> index 000000000000..b11cfb28261d
>> --- /dev/null
>> +++ b/drivers/hwtracing/qcom/tgu.h
>> @@ -0,0 +1,51 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#ifndef _QCOM_TGU_H
>> +#define _QCOM_TGU_H
>> +
>> +/* Register addresses */
>> +#define TGU_CONTROL 0x0000
>> +#define TGU_LAR        0xfb0
>> +#define TGU_UNLOCK_OFFSET    0xc5acce55
>> +
>> +static inline void TGU_LOCK(void __iomem *addr)
>> +{
>> +    do {
>> +        /* Wait for things to settle */
>> +        mb();
>> +        writel_relaxed(0x0, addr + TGU_LAR);
>> +    } while (0);
>> +}
>> +
>> +static inline void TGU_UNLOCK(void __iomem *addr)
>> +{
>> +    do {
>> +        writel_relaxed(TGU_UNLOCK_OFFSET, addr + TGU_LAR);
>> +        /* Make sure everyone has seen this */
>> +        mb();
>> +    } while (0);
>> +}
>> +
>> +/**
>> + * struct tgu_drvdata - Data structure for a TGU (Trigger Generator 
>> Unit)
>> + * @base: Memory-mapped base address of the TGU device
>> + * @dev: Pointer to the associated device structure
>> + * @lock: Spinlock for handling concurrent access
>> + * @enable: Flag indicating whether the TGU device is enabled
>> + *
>> + * This structure defines the data associated with a TGU device,
>> + * including its base address, device pointers, clock, spinlock for
>> + * synchronization, trigger data pointers, maximum limits for various
>> + * trigger-related parameters, and enable status.
>> + */
>> +struct tgu_drvdata {
>> +    void __iomem *base;
>> +    struct device *dev;
>> +    spinlock_t lock;
>> +    bool enable;
>> +};
>> +
>> +#endif
> 



