Return-Path: <linux-arm-msm+bounces-53749-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55126A836EA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 04:56:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 58C2A463D0D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 02:55:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84AE41E9B29;
	Thu, 10 Apr 2025 02:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="MLTPgqYI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B0E58BEA;
	Thu, 10 Apr 2025 02:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744253738; cv=none; b=RYfHauN9MXN3LD3O116h82kW1+/CEeTuBLSJ65X33podGN+m9HdFmldbHsvE7oa72ZFO5kgXY7cZArYGSOl+ekQkWaz3rd4ja3ObnsPui5bAfsDvQbtmUwsinb2pFDScnSZOD51XwKuJ17MzztgR2FFBfnygyd9mBiOPXgQppMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744253738; c=relaxed/simple;
	bh=ZBfEkK0QepJ1651BkpEjOo5Gzjsfj7TmrB7wlRUruvg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=lU0ufaLrsd+p6hFeAPXmc+pD/3lWJTy3+lk1+Y4ZcBCi6VDBOZpjTyiZAMXk41dhU+z2vMY9ejY6WAgXRCJefqYh8QtZDRk48DAEJXv1wkxAPui0d2mMxSRAa166ILdPF7C/DgagCdemk0QZWLy6cL+AhbEjsCSOplBn4N/T0kY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=MLTPgqYI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 539HD7rj015755;
	Thu, 10 Apr 2025 02:55:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aOUfpzBpEBLqMGdVlNi5mq7PS9MEaRaq9ISi+BCZu2M=; b=MLTPgqYIOfz4h+56
	qBOT8nRabD+vMj1hGdnUHtpTHCuM+EaBwffzqVvSjWxzZosHWj/pSk/XRvJbqINL
	2XrJ7B44BqELBCRboF9VGmOe6+IPcP/xSs5w366IqocpHks3d0qC+TzxhEGA82Ns
	GTkQfkNeeerB704I5SZUg8r6a+VD4OEMT+Sf2kQfVz7S9zQqzctNTIDGUYdycnF/
	J7cDXKq6CkU380LkIZMUiIq2uDwDLyvrCsaCvAtPOog9cFNx7+erOVCHeIzG1RfU
	Orunix6Ekw44u7EZ/J11/SkxA9DqU0JifEpmVjnyRLJpHzNlxPv+nGbuYpXq2Vst
	Y94yog==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twd2wc5q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Apr 2025 02:55:22 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53A2tLFu005847
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Apr 2025 02:55:21 GMT
Received: from [10.239.133.242] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 9 Apr 2025
 19:55:18 -0700
Message-ID: <66688163-90c5-4b8f-a5a4-dfeed6c8428b@quicinc.com>
Date: Thu, 10 Apr 2025 10:55:13 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/7] coresight: Add coresight TGU driver
To: Mike Leach <mike.leach@linaro.org>
CC: Suzuki K Poulose <suzuki.poulose@arm.com>,
        James Clark
	<james.clark@arm.com>,
        Alexander Shishkin
	<alexander.shishkin@linux.intel.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn
 Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <linux-kernel@vger.kernel.org>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>
References: <20250227092640.2666894-1-quic_songchai@quicinc.com>
 <20250227092640.2666894-3-quic_songchai@quicinc.com>
 <CAJ9a7Vip6Dda1q7R_LoQjB4696Yi3iDv6512Vsy6aqdpiPTWgw@mail.gmail.com>
Content-Language: en-US
From: songchai <quic_songchai@quicinc.com>
In-Reply-To: <CAJ9a7Vip6Dda1q7R_LoQjB4696Yi3iDv6512Vsy6aqdpiPTWgw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: XB4LOz8nNDdSsl7ePGZQ90Y7HWbe8Gxw
X-Proofpoint-GUID: XB4LOz8nNDdSsl7ePGZQ90Y7HWbe8Gxw
X-Authority-Analysis: v=2.4 cv=NaLm13D4 c=1 sm=1 tr=0 ts=67f7331a cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=HIV3-2_vrN5VJYCJGFYA:9 a=QEXdDO2ut3YA:10
 a=RVmHIydaz68A:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_06,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 clxscore=1015 phishscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100021


On 3/7/2025 12:57 AM, Mike Leach wrote:
> Hi,
>
> On Thu, 27 Feb 2025 at 09:27, songchai <quic_songchai@quicinc.com> wrote:
>> From: Songwei Chai <quic_songchai@quicinc.com>
>>
>> Add driver to support Coresight device TGU (Trigger Generation Unit).
>> TGU is a Data Engine which can be utilized to sense a plurality of
>> signals and create a trigger into the CTI or generate interrupts to
>> processors. Add probe/enable/disable functions for tgu.
>>
>> Signed-off-by: Songwei Chai <quic_songchai@quicinc.com>
>> Signed-off-by: songchai <quic_songchai@quicinc.com>
>> ---
>>   .../testing/sysfs-bus-coresight-devices-tgu   |   9 +
>>   drivers/hwtracing/coresight/Kconfig           |  11 +
>>   drivers/hwtracing/coresight/Makefile          |   1 +
>>   drivers/hwtracing/coresight/coresight-tgu.c   | 218 ++++++++++++++++++
>>   drivers/hwtracing/coresight/coresight-tgu.h   |  36 +++
>>   5 files changed, 275 insertions(+)
>>   create mode 100644 Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu
>>   create mode 100644 drivers/hwtracing/coresight/coresight-tgu.c
>>   create mode 100644 drivers/hwtracing/coresight/coresight-tgu.h
>>
>> diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu
>> new file mode 100644
>> index 000000000000..741bc9fd9df5
>> --- /dev/null
>> +++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu
>> @@ -0,0 +1,9 @@
>> +What:          /sys/bus/coresight/devices/<tgu-name>/enable_tgu
>> +Date:          February 2025
>> +KernelVersion  6.15
>> +Contact:       Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Sam Chai (QUIC) <quic_songchai@quicinc.com>
>> +Description:
>> +               (RW) Set/Get the enable/disable status of TGU
>> +               Accepts only one of the 2 values -  0 or 1.
>> +               0 : disable TGU.
>> +               1 : enable TGU.
>> diff --git a/drivers/hwtracing/coresight/Kconfig b/drivers/hwtracing/coresight/Kconfig
>> index 06f0a7594169..3fe59c745dd4 100644
>> --- a/drivers/hwtracing/coresight/Kconfig
>> +++ b/drivers/hwtracing/coresight/Kconfig
>> @@ -247,4 +247,15 @@ config CORESIGHT_DUMMY
>>
>>            To compile this driver as a module, choose M here: the module will be
>>            called coresight-dummy.
>> +
>> +config CORESIGHT_TGU
>> +       tristate "CoreSight Trigger Generation Unit driver"
>> +       help
>> +         This driver provides support for Trigger Generation Unit that is
>> +         used to detect patterns or sequences on a given set of signals.
>> +         TGU is used to monitor a particular bus within a given region to
>> +         detect illegal transaction sequences or slave responses. It is also
>> +         used to monitor a data stream to detect protocol violations and to
>> +         provide a trigger point for centering data around a specific event
>> +         within the trace data buffer.
>>   endif
>> diff --git a/drivers/hwtracing/coresight/Makefile b/drivers/hwtracing/coresight/Makefile
>> index 4ba478211b31..7c2b9e9cf1cd 100644
>> --- a/drivers/hwtracing/coresight/Makefile
>> +++ b/drivers/hwtracing/coresight/Makefile
>> @@ -51,3 +51,4 @@ coresight-cti-y := coresight-cti-core.o       coresight-cti-platform.o \
>>                     coresight-cti-sysfs.o
>>   obj-$(CONFIG_ULTRASOC_SMB) += ultrasoc-smb.o
>>   obj-$(CONFIG_CORESIGHT_DUMMY) += coresight-dummy.o
>> +obj-$(CONFIG_CORESIGHT_TGU) += coresight-tgu.o
>> diff --git a/drivers/hwtracing/coresight/coresight-tgu.c b/drivers/hwtracing/coresight/coresight-tgu.c
>> new file mode 100644
>> index 000000000000..da4c04ac1097
>> --- /dev/null
>> +++ b/drivers/hwtracing/coresight/coresight-tgu.c
>> @@ -0,0 +1,218 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (c) 2024-2025 Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +
>> +#include <linux/amba/bus.h>
>> +#include <linux/coresight.h>
>> +#include <linux/device.h>
>> +#include <linux/err.h>
>> +#include <linux/io.h>
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
>> +
>> +#include "coresight-priv.h"
>> +#include "coresight-tgu.h"
>> +
>> +DEFINE_CORESIGHT_DEVLIST(tgu_devs, "tgu");
>> +
>> +static void tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
>> +{
>> +       CS_UNLOCK(drvdata->base);
>> +       /* Enable TGU to program the triggers */
>> +       tgu_writel(drvdata, 1, TGU_CONTROL);
>> +       CS_LOCK(drvdata->base);
>> +}
>> +
>> +static int tgu_enable(struct coresight_device *csdev, enum cs_mode mode,
>> +                     void *data)
>> +{
>> +       struct tgu_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
>> +
>> +       spin_lock(&drvdata->spinlock);
>> +
>> +       if (drvdata->enable) {
>> +               spin_unlock(&drvdata->spinlock);
>> +               return -EBUSY;
>> +       }
>> +       tgu_write_all_hw_regs(drvdata);
>> +       drvdata->enable = true;
>> +
>> +       spin_unlock(&drvdata->spinlock);
>> +       return 0;
>> +}
>> +
>> +static int tgu_disable(struct coresight_device *csdev, void *data)
>> +{
>> +       struct tgu_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
>> +
>> +       spin_lock(&drvdata->spinlock);
>> +
>> +       if (!drvdata->enable) {
> Could simplify by changing logic here -
> if (enable) { do disable stuff }
>
> and have a single return point

Done.

>
>> +               spin_unlock(&drvdata->spinlock);
>> +               return 0;
>> +       }
>> +
>> +       CS_UNLOCK(drvdata->base);
>> +       tgu_writel(drvdata, 0, TGU_CONTROL);
>> +       CS_LOCK(drvdata->base);
>> +
>> +       drvdata->enable = false;
>> +       spin_unlock(&drvdata->spinlock);
>> +       return 0;
>> +}
>> +
>> +static ssize_t enable_tgu_show(struct device *dev,
>> +                              struct device_attribute *attr, char *buf)
>> +{
>> +       bool enabled;
>> +
>> +       struct tgu_drvdata *drvdata = dev_get_drvdata(dev->parent);
>> +
>> +       spin_lock(&drvdata->spinlock);
>> +       enabled = drvdata->enable;
>> +       spin_unlock(&drvdata->spinlock);
>> +
>> +       return sprintf(buf, "%d\n", enabled);
> sysfs_emit() should be used here.
Done.
>
>> +}
>> +
>> +/* enable_tgu_store - Configure Trace and Gating Unit (TGU) triggers. */
>> +static ssize_t enable_tgu_store(struct device *dev,
>> +                               struct device_attribute *attr, const char *buf,
>> +                               size_t size)
>> +{
>> +       int ret = 0;
>> +       unsigned long val;
>> +       struct tgu_drvdata *drvdata = dev_get_drvdata(dev->parent);
>> +
>> +       ret = kstrtoul(buf, 0, &val);
>> +       if (ret)
>> +               return ret;
>> +
>> +       if (val) {
>> +               ret = pm_runtime_resume_and_get(dev->parent);
>> +               if (ret)
>> +                       return ret;
>> +               ret = tgu_enable(drvdata->csdev, CS_MODE_SYSFS, NULL);
>> +               if (ret)
>> +                       pm_runtime_put(dev->parent);
>> +       } else {
>> +               ret = tgu_disable(drvdata->csdev, NULL);
>> +               if (!ret)
>
> redundant - tgu_disable always returns 0.
Done. Remove - "if(!ret)"
>
>> +                       pm_runtime_put(dev->parent);
>> +       }
>> +
>> +       if (ret)
>> +               return ret;
>> +       return size;
>> +}
>> +static DEVICE_ATTR_RW(enable_tgu);
>> +
>> +static const struct coresight_ops_helper tgu_helper_ops = {
>> +       .enable = tgu_enable,
>> +       .disable = tgu_disable,
>> +};
>> +
>> +static const struct coresight_ops tgu_ops = {
>> +       .helper_ops = &tgu_helper_ops,
>> +};
>> +
>> +static struct attribute *tgu_common_attrs[] = {
>> +       &dev_attr_enable_tgu.attr,
>> +       NULL,
>> +};
>> +
>> +static const struct attribute_group tgu_common_grp = {
>> +       .attrs = tgu_common_attrs,
>> +       NULL,
>> +};
>> +
>> +static const struct attribute_group *tgu_attr_groups[] = {
>> +       &tgu_common_grp,
>> +       NULL,
>> +};
>> +
>> +static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
>> +{
>> +       int ret = 0;
>> +       struct device *dev = &adev->dev;
>> +       struct coresight_desc desc = { 0 };
>> +       struct coresight_platform_data *pdata;
>> +       struct tgu_drvdata *drvdata;
>> +
>> +       desc.name = coresight_alloc_device_name(&tgu_devs, dev);
>> +       if (!desc.name)
>> +               return -ENOMEM;
>> +
>> +       pdata = coresight_get_platform_data(dev);
>> +       if (IS_ERR(pdata))
>> +               return PTR_ERR(pdata);
>> +
>> +       adev->dev.platform_data = pdata;
>> +
>> +       drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
>> +       if (!drvdata)
>> +               return -ENOMEM;
>> +
>> +       drvdata->dev = &adev->dev;
>> +       dev_set_drvdata(dev, drvdata);
>> +
>> +       drvdata->base = devm_ioremap_resource(dev, &adev->res);
>> +       if (!drvdata->base)
>> +               return -ENOMEM;
>> +
>> +       spin_lock_init(&drvdata->spinlock);
>> +
>> +       drvdata->enable = false;
>> +       desc.type = CORESIGHT_DEV_TYPE_HELPER;
>> +       desc.pdata = adev->dev.platform_data;
>> +       desc.dev = &adev->dev;
>> +       desc.ops = &tgu_ops;
>> +       desc.groups = tgu_attr_groups;
>> +
>> +       drvdata->csdev = coresight_register(&desc);
>> +       if (IS_ERR(drvdata->csdev)) {
>> +               ret = PTR_ERR(drvdata->csdev);
>> +               goto err;
>> +       }
>> +
>> +       pm_runtime_put(&adev->dev);
>> +       return 0;
>> +err:
>> +       pm_runtime_put(&adev->dev);
>> +       return ret;
>> +}
>> +
>> +static void tgu_remove(struct amba_device *adev)
>> +{
>> +       struct tgu_drvdata *drvdata = dev_get_drvdata(&adev->dev);
>> +
>> +       coresight_unregister(drvdata->csdev);
>> +}
>> +
>> +static const struct amba_id tgu_ids[] = {
>> +       {
>> +               .id = 0x000f0e00,
>> +               .mask = 0x000fffff,
>> +               .data = "TGU",
>> +       },
>> +       { 0, 0, NULL },
>> +};
>> +
>> +MODULE_DEVICE_TABLE(amba, tgu_ids);
>> +
>> +static struct amba_driver tgu_driver = {
>> +       .drv = {
>> +               .name = "coresight-tgu",
>> +               .suppress_bind_attrs = true,
>> +       },
>> +       .probe  = tgu_probe,
>> +       .remove = tgu_remove,
>> +       .id_table       = tgu_ids,
>> +};
>> +
>> +module_amba_driver(tgu_driver);
>> +
>> +MODULE_LICENSE("GPL");
>> +MODULE_DESCRIPTION("CoreSight TGU driver");
>> diff --git a/drivers/hwtracing/coresight/coresight-tgu.h b/drivers/hwtracing/coresight/coresight-tgu.h
>> new file mode 100644
>> index 000000000000..380686f94130
>> --- /dev/null
>> +++ b/drivers/hwtracing/coresight/coresight-tgu.h
>> @@ -0,0 +1,36 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * Copyright (c) 2024-2025 Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +
>> +#ifndef _CORESIGHT_TGU_H
>> +#define _CORESIGHT_TGU_H
>> +
>> +/* Register addresses */
>> +#define TGU_CONTROL 0x0000
>> +
>> +/* Register read/write */
>> +#define tgu_writel(drvdata, val, off) __raw_writel((val), drvdata->base + off)
>> +#define tgu_readl(drvdata, off) __raw_readl(drvdata->base + off)
>> +
>> +/**
>> + * struct tgu_drvdata - Data structure for a TGU (Trigger Generator Unit) device
>> + * @base: Memory-mapped base address of the TGU device
>> + * @dev: Pointer to the associated device structure
>> + * @csdev: Pointer to the associated coresight device
>> + * @spinlock: Spinlock for handling concurrent access
>> + * @enable: Flag indicating whether the TGU device is enabled
>> + *
>> + * This structure defines the data associated with a TGU device, including its base
>> + * address, device pointers, clock, spinlock for synchronization, trigger data pointers,
> I don't see any trigger data pointers or limits here. Comment on what
> is there, if more is added later, expand the comment later.

Setting the trigger generated by TGU(such as when to trigger and what 
trigger to generate) is achieved

by configuring the select/condition/timer/counter registers. Therefor, 
it is not necessary to include trigger

data in the struct.

>
>> + * maximum limits for various trigger-related parameters, and enable status.
>> + */
>> +struct tgu_drvdata {
>> +       void __iomem *base;
>> +       struct device *dev;
>> +       struct coresight_device *csdev;
>> +       spinlock_t spinlock;
>> +       bool enable;
>> +};
>> +
>> +#endif
>>
> Regards
>
> Mike
>

