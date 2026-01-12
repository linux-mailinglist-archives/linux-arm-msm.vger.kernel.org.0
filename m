Return-Path: <linux-arm-msm+bounces-88500-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CAF6D11778
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 10:23:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C250730C9027
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 09:19:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93F32346FB7;
	Mon, 12 Jan 2026 09:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N33y9VbK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dHcp/CJI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC44C344053
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 09:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768209575; cv=none; b=kwJUHC1La9f8HFkykoM4HjjBB0E8SxyxyibArFXYFBfE3mkpoxcR95hF+lsFrMHeEsantRmcHXKYEQNjXrLpDTB1+0786rGndCKpCbODNjw26KIbotY7sHwDGGREgMweyrT04XrL5dljjGDghMJjZ8wVVjayG6fosZ5BhSPMkUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768209575; c=relaxed/simple;
	bh=KdIPy4xb+q7vKFaHxAtOc0jGl+l2m7egzI/me4deV/M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s01kyHCQOvnJdq2rOlQ7oMR4yHq2AN3EjgZVCqP8OFEy6LIzJ0YqoB5uKV+zkck68SzbFapzU38qA5scbmtu4JzSnT+B4O1BTHUzaXH2hI+pom2X5rpJVqd2vvBzWMPU7s0R8tjR5GP0hjab2+nzfwsq+WRph2AyuKiZ8NBNEHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N33y9VbK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dHcp/CJI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C83iWw3124249
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 09:19:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bHY+tKzUmgy9uWt5L9UYoQLb1S8eaKCQeqzXRt/ZQl0=; b=N33y9VbK5RL/osjh
	dsOdnclFKUQoJVZ2sPilkIPWXoKuWG65KC1zGl/tvym5isoaNdKTyDD9P5QBslSM
	VH1pBsawvH2jcd1wQK5tvnoE3RE4rUOpcyun8mHJWFJDWsNaH5ylhWbi5r9okEW7
	0MVuP2D3uUEU+CIOTjxoUco0nw/5j34IlU62H0AOfYYnN2mjOy6WseMiewY32Vb7
	YYp0YZCK01hZitzSnpiLHP1Jo2MCDcL1yOmKsceieZK+4M0X/J969csdkhYqP65Q
	BDJ55/FwHja+0z/kOn82s3GLuEzysDYqyp+0MJQsFIyNEpXjuBnN4NSnpYjRO8Kw
	EtzBag==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkntukse7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 09:19:33 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a0a4b748a0so16600695ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 01:19:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768209572; x=1768814372; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bHY+tKzUmgy9uWt5L9UYoQLb1S8eaKCQeqzXRt/ZQl0=;
        b=dHcp/CJIVP49MqjkXVMRWAa4KSAFmfyJYMkheqjOv3BVUYTjVSRk4mHVDzlLq+3CR2
         NKDT2UEURN/N1fFaO5U1U78NUtTil8vKI6CqSoeywWbYerw+wkgpn75+gW9a0Jbzk7de
         CJFaGM/hfby6dZqRACp2obt1KlFVkRtq6d5rerb7G5pLRlhRUi6YcQ7zwi1kyW5zS+66
         Il//m4E+vfsmf9spogpJWudqNizkf2S+TV04Ly0yWrhYtXfbfgBnF3MyPDUdVPn/A1GN
         TkSIrB8EKcSGwI2qP+oAGPZ1/stLJQtsEdsnobLxOKaPjd258HhRLzm0UlDNUb+ndUnZ
         5wTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768209572; x=1768814372;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bHY+tKzUmgy9uWt5L9UYoQLb1S8eaKCQeqzXRt/ZQl0=;
        b=vuYtZhY8i1C/18tojM4tpYxwfcmAYE4msKlZRSlmffjkqTY/Jxzay6DnQhu+c/DGH4
         cI9XQcb7A28//L/dLy+4Rip3EX+kuLdpFnbh+Gwc2zqhK5GaGUxDejnIurqfwMOZLoWp
         UHUvtwr6aDy1PtflXw2dxP/7oiIGfxTqoMM9kvtX1+lhOPoCHr6kx4Xl5m7jdZ0Ec1kY
         WE3LE7jKMzG00xAZIL0JO5tBlwdSdMvwJoZGPUH9uayt9lm1dlgdmDY2+Z2KKQDIIu+n
         RN4tzP9zlUXG9y/DP3uLZWKtsXSLxIeCs8fx6lLEBhxE39Sq1+1fJAZBYx8OxVQdKcHG
         p4+g==
X-Forwarded-Encrypted: i=1; AJvYcCVrbYbY8xaQ4WQJvBeuKqIejiFh+GREeoT/s6jSjarzeMS8FXfRmHY5aoNyef7l1nZ/5yvc9fksO2QJdD7g@vger.kernel.org
X-Gm-Message-State: AOJu0Yxy3yTxCuQYCGXtFDov9FRGUPhXp3nG0qUbveQtTmer/TMsJ2nT
	JreFceuySUFUV+kxylFh8NKbEbmvh+MKeEz30lTpClgs/OtaG+m199MhaGOeGN3oXgWvha9Z+eU
	LfdOxRJfrvfouibmn0x+BVAcm2BUGsc4/bP/NtRJ+k27OVFPlyns8ZVfWrCX8nKSDJkzy
X-Gm-Gg: AY/fxX5qol5uh9Q4UhCFlAGSQzXlbHw6PsV8ZpoN9n1H2QP6CUgPaCZ9jfTpdAEiXFa
	+gX7d6cZSwufsKJnIU9us7RAB2iFPVZM3Kynk5wiXdO5RLti7twlNnZfRp/hNGriZGl7NVXF9jI
	BqWYCG37p5GLgtJ4/SQhRZWn+3wetGCUBrzY3OZWGlyb6qvnoFScGNqlUdY+pZkjp+sOd+7TBz/
	wVL/UUvOpHwpng3YLrv+MxIaz4xoxE2G3D2y+N+S7XdTC3zOvg6Yb+kAVP+yDoX+stRaf+DjoAs
	KqpmkAR2O4Fdggd3gajO9YlCa08erJFGNUmr0wKDm/jtvum+Pf8MFoIF+cbqMh/sSJ3moUQ9IP0
	etVPOfBcsJpTtUDihaAfY+qjsL5+0B/UvEvT5sS9v58I4k0RjZSH8tLbKy7mtaavrfwPdMAlMN5
	Gi/e9d
X-Received: by 2002:a17:902:cf06:b0:2a3:e7aa:dd6e with SMTP id d9443c01a7336-2a3ee48ac0fmr165969435ad.38.1768209572449;
        Mon, 12 Jan 2026 01:19:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEgf4xslxapHoyTuvdbdIw6M15C4XO7MaAq1GW+4q/hUzcMV9eD4Yeo/C22qwbZVgTiujnicQ==
X-Received: by 2002:a17:902:cf06:b0:2a3:e7aa:dd6e with SMTP id d9443c01a7336-2a3ee48ac0fmr165969205ad.38.1768209571928;
        Mon, 12 Jan 2026 01:19:31 -0800 (PST)
Received: from [10.133.33.22] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c4795fsm171834885ad.33.2026.01.12.01.19.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 01:19:31 -0800 (PST)
Message-ID: <22584f94-fd4a-4d28-8eb6-0d2639b39fd3@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 09:43:18 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 2/7] qcom-tgu: Add TGU driver
To: Suzuki K Poulose <suzuki.poulose@arm.com>, andersson@kernel.org,
        alexander.shishkin@linux.intel.com, mike.leach@linaro.org,
        james.clark@arm.com, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        devicetree@vger.kernel.org, gregkh@linuxfoundation.org
References: <20260109021141.3778421-1-songwei.chai@oss.qualcomm.com>
 <20260109021141.3778421-3-songwei.chai@oss.qualcomm.com>
 <6c70f7e3-9a98-4a84-9391-8d83df1c3818@arm.com>
Content-Language: en-US
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
In-Reply-To: <6c70f7e3-9a98-4a84-9391-8d83df1c3818@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA3MiBTYWx0ZWRfX/5+GI5zKE4Hz
 vbOxmktfuk63NFvdQCzfSSQe8rZv80YN0lAKXpUcFNF6c2lHodJfIpGDcKd/sIok5jqxjYD7biX
 dJyhEp3c4h782BEeiYhnLA634BaLC457VHS874RwxMKSL+VzEKi4bczZiTmeEVHQBmxCmCYjR76
 eabaxfXvkJi7vBVwrY+erbUOzlAUpzvq1c1xW+Vs1evzMnsyWGkI4c7kLP9N2snfWZtZmfWFhEz
 o1B/w/cJxy2LZHDyNd9RxsPioWhH9k71tvv7Q5hkMPvUX7r3o45dLK6Hg1LJvxTaIxhSXrz0fFO
 9qqJGmMtLjzLjQsFYiIdcg11KgaRgyJzsa5N/g7WgE6sQKqYXWwc7rMkJE2igC2e17xoXb6eukg
 nP59zcUs5VUNe332Doc4zAg5HZJJ1wjXAe9hNZuYXHP/9BrE2dvmu3TB9g+htDkyJ7p/EK/GGu3
 u6ZYu61eDQ9W/2LmiUg==
X-Authority-Analysis: v=2.4 cv=R6AO2NRX c=1 sm=1 tr=0 ts=6964bca5 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=QtmeBwCpv1JMxDmLrj4A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: L32lMzO1zh2uN2iCW4pZYJqxZQbp2qba
X-Proofpoint-GUID: L32lMzO1zh2uN2iCW4pZYJqxZQbp2qba
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120072



On 1/9/2026 6:27 PM, Suzuki K Poulose wrote:
> On 09/01/2026 02:11, Songwei Chai wrote:
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
> 
> It's a bit too late for v6.19, this should rather be 6.20/7.0
Sure, Suzuki. Thanks for comment.>
> Suzuki
> 
> 
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


