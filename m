Return-Path: <linux-arm-msm+bounces-86603-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8786CCDD3B2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Dec 2025 03:44:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 39AFC30142C9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Dec 2025 02:44:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C9301D7E42;
	Thu, 25 Dec 2025 02:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GSo9+3zi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bKchsVz6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0B34268690
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Dec 2025 02:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766630659; cv=none; b=QpnQqyvgD39cK6Ed5pxIirSnuV/i43Uauyt3r47nLCiO3aBL6XRTIA06wf+G/LvfRnsBNrxRdSMlPp/r+VYPkLaJcJ7MIFrcLuGhqukS1VBODnsNBGwBLyXp8FUMFxfqebLkVXEtwNl7H3FOrKJvRXG6CvuCZY1dqIgARghfrXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766630659; c=relaxed/simple;
	bh=zS1KKOKOimDEO1kclG+LiZcn7RPLfxuDBOk9W6qZU/s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qJMZjWFwD3O4IaWjjnHSTRN19CApbgNJ2vujVxtR+6glco40NRhCtqMLyNu+YPCZ/+aYqzfcmWkYnnYPGi1f2wAfEknnikcyCdgXsuwNF63do1vI38lnmi4saB/9MhsuUzmjf4sFW2Re+GXA2XuX0oShu5o2pSKvPlpnDnzABv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GSo9+3zi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bKchsVz6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BP1IJd0525205
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Dec 2025 02:44:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q1wb5xT+3SX74fD7XcHG6ZfgZRlhTQTgEASipYKevpc=; b=GSo9+3ziG69nWN3J
	PGYWDiUG4XC3VhmlIhFw7qQsaCaSSnq+GogB3MRRVFhpoDx8y+KXsrmq0ayG/MdU
	AfypdBGk2LQecm6wRbzrRJSoTbQncRDZWfKklKsa1nMs3nDiDJg2myMItgSlqPu6
	jYPgk2WmtFWrlzIOtJqnArYyCDmxO5DnWBf43q3p17e5N5oZTXhZlE/sj7/j+LyV
	ctH3ZZ2HfuU2tiDjVaZuw9TVLDiNZYqIlwEU4LB/sOSbBWSndi6K6dMdAqpQ48wZ
	eSZgwg7SvEvrcftjGwO1yoC2CV8JShzKjiSvxA5iGS7nGr8IP3SKsaC/4cIiyJwN
	RPvjyA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b827r3e9n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Dec 2025 02:44:15 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a09845b7faso93453445ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 18:44:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766630655; x=1767235455; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q1wb5xT+3SX74fD7XcHG6ZfgZRlhTQTgEASipYKevpc=;
        b=bKchsVz6Psi1yK8LGobpNgwyC/YtPwuXow2m2bAouE91bN/slUnTIOn2NPcy9zsJw+
         uFAyS4YLEEpdq+SqBPO5x23SNSsgT28nKRzApDSRvdaWjoI6M/z8JfmRoDnb0LaTc8Wu
         eJajnPAfNk0b7HG7l/JgAX+rR9pPYjhUry1Vpsu40tYSDBO8efWcrQgXIBPoAF1H62S7
         TDIdUjtUpVqVM6aA4BnQz0BxF2r+yc1hTVY8pY4bD/ynuOYjssn9unPRrfj7FMXRKpcA
         Wx+4lhRIYkCgt5yb5gfwm+21+hGod0rRkFcho5cyl+uOjAp2E0/O9dQjb1ZLaP1WsTli
         G8/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766630655; x=1767235455;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q1wb5xT+3SX74fD7XcHG6ZfgZRlhTQTgEASipYKevpc=;
        b=PeYgvyAMUY/Sin9x3xW9aMhFilwMc7wFrfc5cXIlQMinEhNOC7TPBlNINYDJTwDzmg
         Cc6yeXTXntanPc49TVX26vyA4yW4Tb4rXj+6dyMQX07g67Spz1bsQnK8mRF02LaD2LLH
         rr1YJKzIDOb9F6e2QsCQJucKzGG/gn5Xy2XJAk2lBpJknYpBWX5DcvhKxH2dM0sF8DAm
         TVO3vAYKWVY1nKQC1iVXH69okGRXy5DCclVGWU1TGaysleRE9TYklTFmEv6tNCKknDyt
         4VyzgrwU8QvCMEweuoL4PDhyTzkPm4KsQXMNwFsYRWL3MEXohuKQoXWaoeEN98nbacKi
         2Z7g==
X-Forwarded-Encrypted: i=1; AJvYcCU9pvRZl/Zprzxqe/3cO4igaVSzIXzO0jdscL+zhw80nKk5qDe2vqN35ooy3sK64FYaKI8Rwef47B2W3VxX@vger.kernel.org
X-Gm-Message-State: AOJu0YwVedPalQIrEhtjSz0+cb8kA4L+d7U5UY6zfntTRkllRwius2qO
	tEgfyO0QV2cXpdf3rwTx27tXsxfKgQPqbSnYs4zJ6GJTh1ubciykdlGHQtrHOkIduhRwJ8rXJUy
	zmdOmQbYc1nn39Ayt/+S+BCu+gxQYIrf/kqHhCH22JXe1mDCrpYXyvSYT0tkbAVp4A73V
X-Gm-Gg: AY/fxX5rXQemvEqV40vGwvQxSzStKZ2n55OfZbnt5IiRdcWca/sFNigOa484tals0VG
	U6SF+DTR9/BpH/lvaNPBZAh0KXh/k7z35ZtAmiDIp2BqWL3/fkeoynro8nA4FQ4fssXTYBZqPMc
	TRQml+KcVtxzLQLttrIqyr3QUW3wJ1ktZ+iIDsn/MbMmsfWd5yqHLeWYyorgaK/xUUZu9ffi7sk
	lP5Wvnj3w+xYSt28lk/BC6CP+HnqcD1vhY3DLHhzen0hYyaDfhoctHm52y7BzpRPdcG9YlY+SJV
	HXLAzcwN2qoDRO2SBXqphZt7oCFmyFSCHMN/KdRnH5R6/2Gxd87LSMFmA101FFcdTS5xHnmT5G3
	kirsjcq0yl8xE1jk1YcxJpD2Byl+Fu0pKCm6Em2neDLVUkAUxVNorsEdL9CrGxnyCtq1UPbWZEZ
	U=
X-Received: by 2002:a17:903:3b86:b0:2a1:1f28:d7ee with SMTP id d9443c01a7336-2a2f293e0d0mr191947005ad.57.1766630654630;
        Wed, 24 Dec 2025 18:44:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF3Kz2Egs+ye+uWCT6V6dCDuaQ2pGQyY+N+0McTP3jCXraZVMNAL2nLC2nrTjuFo6zvZiagfw==
X-Received: by 2002:a17:903:3b86:b0:2a1:1f28:d7ee with SMTP id d9443c01a7336-2a2f293e0d0mr191946755ad.57.1766630654094;
        Wed, 24 Dec 2025 18:44:14 -0800 (PST)
Received: from [10.133.33.250] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c74490sm166275095ad.5.2025.12.24.18.44.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Dec 2025 18:44:13 -0800 (PST)
Message-ID: <458b3404-ca67-43fe-8610-f33c875b2de1@oss.qualcomm.com>
Date: Thu, 25 Dec 2025 10:44:07 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/7] qcom-tgu: Add TGU driver
To: Songwei Chai <songwei.chai@oss.qualcomm.com>, andersson@kernel.org,
        alexander.shishkin@linux.intel.com, mike.leach@linaro.org,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        devicetree@vger.kernel.org, gregkh@linuxfoundation.org
References: <20251219065902.2296896-1-songwei.chai@oss.qualcomm.com>
 <20251219065902.2296896-3-songwei.chai@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20251219065902.2296896-3-songwei.chai@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: FM2_IJwBAN-zLBQcXJe3pbIyhtHzdQvD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI1MDAyMyBTYWx0ZWRfX+7jXVgxvkjuu
 AU02unWlS6XDO7wFu+obRrXsBFNHRzfDTOfsVYzB9irZUhv//w6LUnVOhZpKbE6oLkAKTUSpmkl
 nVhnoTdhc+zSe4aGxOMDP1Kvlh9ei3VDTuuQdH+hB9aYwtgikZzZmXCDwTwZ6RrYwmysBDDB0ge
 NXkUHNqSKHEiXxOatZF6idGShIau5Iploik9FDjTylJIDE9S1+vmIFuzcEpzvymtUv1+9vM2Q3I
 Y/GcYWJgHPiECHUfjSaIB7bxcMo0d/fG4Ie2UeY00I3FsH4t4/8XoemL76IajSsHwxF4hQiu8IX
 LutH1OfJ+HxcFPf6YIJ1Jh67tstSyFUTvcc0ZbgFosiDnXrQjiCbNqbnk7DC962yZej2pVqvVm7
 pxuil4Vz2yNHupNPjxxPnhp1P7JZCYH30BsB0vt+T4KrVm9llt8Iop0KD6bgZf/D2A2xdMmeV5o
 QzOC45qb49fToKZ6Riw==
X-Proofpoint-GUID: FM2_IJwBAN-zLBQcXJe3pbIyhtHzdQvD
X-Authority-Analysis: v=2.4 cv=RbSdyltv c=1 sm=1 tr=0 ts=694ca4ff cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=RlaAdA2wXV2HMp-xn2gA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512250023



On 12/19/2025 2:58 PM, Songwei Chai wrote:
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
>   drivers/hwtracing/qcom/tgu.c                  | 178 ++++++++++++++++++
>   drivers/hwtracing/qcom/tgu.h                  |  51 +++++
>   7 files changed, 262 insertions(+)
>   create mode 100644 Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
>   create mode 100644 drivers/hwtracing/qcom/Kconfig
>   create mode 100644 drivers/hwtracing/qcom/Makefile
>   create mode 100644 drivers/hwtracing/qcom/tgu.c
>   create mode 100644 drivers/hwtracing/qcom/tgu.h
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
> new file mode 100644
> index 000000000000..24dcdf1d70cc
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
> @@ -0,0 +1,9 @@
> +What:		/sys/bus/amba/devices/<tgu-name>/enable_tgu
> +Date:		December 2025
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

TGU is working as the helper device of the TPDM, can we say:

select CORESIGHT_TPDM


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
> index 000000000000..dbd1acbd2fa5
> --- /dev/null
> +++ b/drivers/hwtracing/qcom/tgu.c
> @@ -0,0 +1,178 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2024-2025 Qualcomm Innovation Center, Inc. All rights reserved.

Please update the copyright.
Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.

same for other new created files.

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
> +static int tgu_disable(struct device *dev)

void is better as the return value always 0?

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
> +	return 0;
> +}
> +
> +static ssize_t enable_tgu_show(struct device *dev,
> +				struct device_attribute *attr, char *buf)
> +{
> +	bool enabled;
> +	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
> +
> +	guard(spinlock)(&drvdata->lock);
> +	enabled = drvdata->enable;
> +
> +	return sysfs_emit(buf, "%d\n", enabled);

Remove enabled with below:

return sysfs_emit(buf, "%d\n", (int)drvdata->enable);

It may suffer a warning during compile without cast?

> +}
> +
> +/* enable_tgu_store - Configure Trace and Gating Unit (TGU) triggers. */
> +static ssize_t enable_tgu_store(struct device *dev,
> +				struct device_attribute *attr,
> +				const char *buf,
> +				size_t size)
> +{
> +	int ret = 0;
> +	unsigned long val;

Prefer inverse christmas tree order

> +
> +	ret = kstrtoul(buf, 0, &val);
> +	if (ret)
> +		return ret;

if (kstrtoul(buf, 0, &val)
	return -EINVAL;

> +
> +	if (val) {
> +		ret = pm_runtime_resume_and_get(dev);
> +		if (ret)
> +			return ret;
> +		ret = tgu_enable(dev);
> +		if (ret)
> +			pm_runtime_put(dev);

		if (ret) {
			pm_runtime_put(dev);
			return ret;
		}


> +	} else {
> +		ret = tgu_disable(dev);

the return value here is 0, we can just ignore it, see previous comment.

> +		pm_runtime_put(dev);
> +	}
> +
> +	if (ret)
> +		return ret;

Remove if here.

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

default false, no need.

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
> +	dev_set_drvdata(dev, NULL);

no need. remove will release the allocated memory.

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
> index 000000000000..abc732f91dfc
> --- /dev/null
> +++ b/drivers/hwtracing/qcom/tgu.h
> @@ -0,0 +1,51 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2024-2025 Qualcomm Innovation Center, Inc. All rights reserved.

Please update the copyright.
Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.

> + */
> +
> +#ifndef _QCOM_TGU_H
> +#define _QCOM_TGU_H
> +
> +/* Register addresses */
> +#define TGU_CONTROL 0x0000

#define TGU_CONTROL 0

Thanks,
Jie

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


