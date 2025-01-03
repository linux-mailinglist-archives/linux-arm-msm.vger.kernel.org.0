Return-Path: <linux-arm-msm+bounces-43872-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 753B2A00908
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 13:08:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 423CF1622F2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 12:08:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30EEE1F9A88;
	Fri,  3 Jan 2025 12:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VTAwSwA0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1673B1B4148;
	Fri,  3 Jan 2025 12:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735906124; cv=none; b=bfNSJjskxAPXsDLU2gb4M5Kot9bITkuwaWe+RHQI+MdwDwoRJ5t4bwWUPvZCeENIqTl++OWDNIo5XddKqT8LSqWP6Eh8YBP+7kL0GHQTauiteaoFg97kO2+mCBRsfyARPyirbGFxIS+h7q99QUegd5PXGQy/N0vfZL1+QFlJZtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735906124; c=relaxed/simple;
	bh=DLvTlawbI29aI9EARLfTMJuQFoegcoRpote+0W+X6yY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=upNAQd6KAe3DJdFQxMhp30DRdpb5DODdEoD8K3otF7THBtZZa6bQljmVtjlRGjavjMSNo+1MgaSQEWtcTAwgjI1nHOCvakuL97laidn2eDvsjYobhsYjxAvCQ3cUVbHDAsa2dqrxDK2kWAyajhgX1DCINsGazoWShlvyYuQ/pbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VTAwSwA0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5037NcBY022884;
	Fri, 3 Jan 2025 12:08:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hzS+mpOucS+bnT+sKtg3Nu3m7DgjrQIoPXqLYbaFYyM=; b=VTAwSwA0+4UFBz8G
	V1QcJyhYrh0gmigTUc1woaE9Oe59URVOywSBrrukr6MmRntFbINlVpbl/z/kz3MS
	Bl7bOgJPUSCbJMdcTbKyH+P6DMjEiHH/WhUzQIcpf8LHhp34O3Gw1LKoiFmfq0di
	ncjwja5ZZap7myZkj11myT00PfXdTvIzRLsbG/ksEZU+BoVb7/ZwsCPJK3O/W7ym
	+J15dXidVs6MtlCU0Ln6ifG2dOPujFkBRKO2/7xNN9cDHMb6syaL4Pg7pPJBsS69
	Vdg+5DZvg844k2VJ/DWMyeanEfO5Hee7MaAjfxKATTb12ZXN+0fwgDt1Q1PuCYqp
	+1YWNg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43xbfe8knj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 03 Jan 2025 12:08:36 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 503C8ZBJ008700
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 3 Jan 2025 12:08:35 GMT
Received: from [10.216.50.175] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 3 Jan 2025
 04:08:30 -0800
Message-ID: <7597cab6-292c-4e15-a277-62a9ef252850@quicinc.com>
Date: Fri, 3 Jan 2025 17:38:25 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 2/4] remoteproc: qcom: add hexagon based WCSS secure
 PIL driver
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <andersson@kernel.org>, <krzk+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_viswanat@quicinc.com>, <quic_mmanikan@quicinc.com>,
        <quic_varada@quicinc.com>, <quic_srichara@quicinc.com>,
        <quic_gokulsri@quiconc.com>
References: <20240829134021.1452711-1-quic_gokulsri@quicinc.com>
 <20240829134021.1452711-3-quic_gokulsri@quicinc.com>
 <4x5z4zj6dwesb3fu3xkti4qygiuseegqmxp3lu4vfwrfmyrrpk@dlj4vbmp7pt6>
Content-Language: en-US
From: Gokul Sriram P <quic_gokulsri@quicinc.com>
In-Reply-To: <4x5z4zj6dwesb3fu3xkti4qygiuseegqmxp3lu4vfwrfmyrrpk@dlj4vbmp7pt6>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: hp9qzfKpKDg9Vrpr96wLZzizK_yG9ZOB
X-Proofpoint-ORIG-GUID: hp9qzfKpKDg9Vrpr96wLZzizK_yG9ZOB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 mlxscore=0 malwarescore=0 adultscore=0 suspectscore=0
 phishscore=0 spamscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501030107


On 8/30/2024 1:11 PM, Dmitry Baryshkov wrote:
> On Thu, Aug 29, 2024 at 07:10:19PM GMT, Gokul Sriram Palanisamy wrote:
>> From: Vignesh Viswanathan <quic_viswanat@quicinc.com>
>>
>> Add support to bring up hexagon based WCSS secure PIL remoteproc.
>> IPQ5332, IPQ9574 supports secure PIL remoteproc.
> Could you please clarify, why this can't be handled by the qcom_q6v5_pas
> driver.
Hi Dmitry,
Apologies for this delayed response. Currently we came with this secure 
PIL driver is based on Bjon's suggestion [1] for not to bloat the 
existing non-secure wcss PIL driver with secure-pil and to write a 
separate wcss-secire-pil driver. The PAS driver already looked bloated 
with several MSM platform.  Also it has a required clock field which is 
already taken care by TrustZone for IPQ chipsets.

The recent development is to add mailbox driver that will take care of 
handling secure call with both TMELCOM used by recent IPQ5424 based 
platform and TrustZone SCM for older IPQ platforms. This will mean, the 
current wcss-sec-pil driver will only need to use mbox_send_message to 
handle secure calls.

[1] 
https://patchwork.kernel.org/project/linux-arm-msm/patch/1611984013-10201-3-git-send-email-gokulsri@codeaurora.org/


Regards,

Gokul

>> Signed-off-by: Vignesh Viswanathan <quic_viswanat@quicinc.com>
>> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
>> Signed-off-by: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
>> ---
>> changes since v1: Addressed comments by Krzysztof
>> 	- moved of_node_put( ) before return value check to avoid
>> 	  leaking refcount.
>> 	- simplified if/else for error handling.
>> 	- implemented 'devm_clk_get_enabled' instead of using
>> 	  'devm_clk_get' and 'clk_prepare_enable' conscutively.
>> 	- implemented 'dev_err_probe' for error handling.
>>
>>   drivers/remoteproc/Kconfig              |  22 ++
>>   drivers/remoteproc/Makefile             |   1 +
>>   drivers/remoteproc/qcom_q6v5_wcss_sec.c | 354 ++++++++++++++++++++++++
>>   3 files changed, 377 insertions(+)
>>   create mode 100644 drivers/remoteproc/qcom_q6v5_wcss_sec.c
>>
>> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
>> index 0f0862e20a93..3e7c6fc62ca1 100644
>> --- a/drivers/remoteproc/Kconfig
>> +++ b/drivers/remoteproc/Kconfig
>> @@ -255,6 +255,28 @@ config QCOM_Q6V5_WCSS
>>   	  Hexagon V5 based WCSS remote processors on e.g. IPQ8074.  This is
>>   	  a non-TrustZone wireless subsystem.
>>   
>> +config QCOM_Q6V5_WCSS_SEC
>> +	tristate "Qualcomm Hexagon based WCSS Secure Peripheral Image Loader"
>> +	depends on OF && ARCH_QCOM
>> +	depends on QCOM_SMEM
>> +	depends on RPMSG_QCOM_SMD || RPMSG_QCOM_SMD=n
>> +	depends on RPMSG_QCOM_GLINK_SMEM || RPMSG_QCOM_GLINK_SMEM=n
>> +	depends on QCOM_SYSMON || QCOM_SYSMON=n
>> +	depends on RPMSG_QCOM_GLINK || RPMSG_QCOM_GLINK=n
>> +	depends on QCOM_AOSS_QMP || QCOM_AOSS_QMP=n
>> +	select QCOM_MDT_LOADER
>> +	select QCOM_PIL_INFO
>> +	select QCOM_Q6V5_COMMON
>> +	select QCOM_RPROC_COMMON
>> +	select QCOM_SCM
>> +	help
>> +	  Say y here to support the Qualcomm Secure Peripheral Image Loader
>> +	  for the Hexagon based remote processors on e.g. IPQ5332.
>> +
>> +	  This is TrustZone wireless subsystem. The firmware is
>> +	  verified and booted with the help of the Peripheral Authentication
>> +	  System (PAS) in TrustZone.
>> +
>>   config QCOM_SYSMON
>>   	tristate "Qualcomm sysmon driver"
>>   	depends on RPMSG
>> diff --git a/drivers/remoteproc/Makefile b/drivers/remoteproc/Makefile
>> index 5ff4e2fee4ab..d4971b672812 100644
>> --- a/drivers/remoteproc/Makefile
>> +++ b/drivers/remoteproc/Makefile
>> @@ -28,6 +28,7 @@ obj-$(CONFIG_QCOM_Q6V5_ADSP)		+= qcom_q6v5_adsp.o
>>   obj-$(CONFIG_QCOM_Q6V5_MSS)		+= qcom_q6v5_mss.o
>>   obj-$(CONFIG_QCOM_Q6V5_PAS)		+= qcom_q6v5_pas.o
>>   obj-$(CONFIG_QCOM_Q6V5_WCSS)		+= qcom_q6v5_wcss.o
>> +obj-$(CONFIG_QCOM_Q6V5_WCSS_SEC)	+= qcom_q6v5_wcss_sec.o
>>   obj-$(CONFIG_QCOM_SYSMON)		+= qcom_sysmon.o
>>   obj-$(CONFIG_QCOM_WCNSS_PIL)		+= qcom_wcnss_pil.o
>>   qcom_wcnss_pil-y			+= qcom_wcnss.o
>> diff --git a/drivers/remoteproc/qcom_q6v5_wcss_sec.c b/drivers/remoteproc/qcom_q6v5_wcss_sec.c
>> new file mode 100644
>> index 000000000000..3c8bb2639567
>> --- /dev/null
>> +++ b/drivers/remoteproc/qcom_q6v5_wcss_sec.c
>> @@ -0,0 +1,354 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (C) 2016-2018 Linaro Ltd.
>> + * Copyright (C) 2014 Sony Mobile Communications AB
>> + * Copyright (c) 2012-2018, 2024 The Linux Foundation. All rights reserved.
>> + */
>> +#include <linux/clk.h>
>> +#include <linux/delay.h>
>> +#include <linux/firmware/qcom/qcom_scm.h>
>> +#include <linux/interrupt.h>
>> +#include <linux/io.h>
>> +#include <linux/iopoll.h>
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
>> +#include <linux/of_address.h>
>> +#include <linux/of_device.h>
>> +#include <linux/of_reserved_mem.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/reset.h>
>> +#include <linux/soc/qcom/mdt_loader.h>
>> +#include <linux/soc/qcom/smem.h>
>> +#include <linux/soc/qcom/smem_state.h>
>> +#include "qcom_common.h"
>> +#include "qcom_q6v5.h"
>> +
>> +#include "remoteproc_internal.h"
>> +
>> +#define WCSS_CRASH_REASON		421
>> +
>> +#define WCSS_PAS_ID			0x6
>> +#define MPD_WCSS_PAS_ID			0xD
>> +
>> +struct wcss_sec {
>> +	struct device *dev;
>> +	struct qcom_rproc_glink glink_subdev;
>> +	struct qcom_rproc_ssr ssr_subdev;
>> +	struct qcom_q6v5 q6;
>> +	phys_addr_t mem_phys;
>> +	phys_addr_t mem_reloc;
>> +	void *mem_region;
>> +	size_t mem_size;
>> +	const struct wcss_data *desc;
>> +	const char *fw_name;
>> +
>> +	struct clk *sleep_clk;
>> +};
>> +
>> +struct wcss_data {
>> +	u32 pasid;
>> +	const struct rproc_ops *ops;
>> +	bool need_auto_boot;
> This isn't set anywere, drop it
>
>> +	u8 bootargs_version;
> Not used, drop it
>
>> +	int (*init_clk)(struct wcss_sec *wcss);
>> +};
>> +
>> +static int wcss_sec_start(struct rproc *rproc)
>> +{
>> +	struct wcss_sec *wcss = rproc->priv;
>> +	struct device *dev = wcss->dev;
>> +	const struct wcss_data *desc = of_device_get_match_data(dev);
>> +	int ret;
>> +
>> +	qcom_q6v5_prepare(&wcss->q6);
>> +
>> +	ret = qcom_scm_pas_auth_and_reset(desc->pasid);
>> +	if (ret) {
>> +		dev_err(dev, "wcss_reset failed\n");
>> +		return ret;
>> +	}
>> +
>> +	ret = qcom_q6v5_wait_for_start(&wcss->q6, 5 * HZ);
>> +	if (ret == -ETIMEDOUT)
>> +		dev_err(dev, "start timed out\n");
>> +
>> +	return ret;
>> +}
>> +
>> +static int wcss_sec_stop(struct rproc *rproc)
>> +{
>> +	struct wcss_sec *wcss = rproc->priv;
>> +	struct device *dev = wcss->dev;
>> +	const struct wcss_data *desc = of_device_get_match_data(dev);
>> +	int ret;
>> +
>> +	ret = qcom_scm_pas_shutdown(desc->pasid);
>> +	if (ret) {
>> +		dev_err(dev, "not able to shutdown\n");
>> +		return ret;
>> +	}
>> +	qcom_q6v5_unprepare(&wcss->q6);
>> +
>> +	return 0;
>> +}
>> +
>> +static void *wcss_sec_da_to_va(struct rproc *rproc, u64 da, size_t len,
>> +			       bool *is_iomem)
>> +{
>> +	struct wcss_sec *wcss = rproc->priv;
>> +	int offset;
>> +
>> +	offset = da - wcss->mem_reloc;
>> +	if (offset < 0 || offset + len > wcss->mem_size)
>> +		return NULL;
>> +
>> +	return wcss->mem_region + offset;
>> +}
>> +
>> +static int wcss_sec_load(struct rproc *rproc, const struct firmware *fw)
>> +{
>> +	struct wcss_sec *wcss = rproc->priv;
>> +	struct device *dev = wcss->dev;
>> +	const struct wcss_data *desc = of_device_get_match_data(dev);
>> +
>> +	return qcom_mdt_load(dev, fw, rproc->firmware, desc->pasid,
>> +			     wcss->mem_region, wcss->mem_phys, wcss->mem_size,
>> +			     &wcss->mem_reloc);
> No qcom_pil_info_store() ?
>
>> +}
>> +
>> +static unsigned long wcss_sec_panic(struct rproc *rproc)
>> +{
>> +	struct wcss_sec *wcss = rproc->priv;
>> +
>> +	return qcom_q6v5_panic(&wcss->q6);
>> +}
>> +
>> +static void wcss_sec_copy_segment(struct rproc *rproc,
>> +				  struct rproc_dump_segment *segment,
>> +				  void *dest, size_t offset, size_t size)
>> +{
>> +	struct wcss_sec *wcss = rproc->priv;
>> +	struct device *dev = wcss->dev;
>> +	void *ptr;
>> +
>> +	ptr = devm_ioremap_wc(dev, segment->da, segment->size);
> Please don't use devm_ioremap if you are going to unmap it several lines
> below. There is no need to burden devres with it.
>
>> +	if (!ptr) {
>> +		dev_err(dev, "Failed to ioremap segment %pad size %zx\n",
>> +			&segment->da, segment->size);
>> +		return;
>> +	}
>> +
>> +	if (size <= segment->size - offset)
>> +		memcpy(dest, ptr + offset, size);
>> +	else
>> +		dev_err(dev, "Copy size greater than segment size. Skipping\n");
>> +	devm_iounmap(dev, ptr);
>> +}
>> +
>> +static int wcss_sec_dump_segments(struct rproc *rproc,
>> +				  const struct firmware *fw)
>> +{
>> +	struct device *dev = rproc->dev.parent;
>> +	struct reserved_mem *rmem = NULL;
>> +	struct device_node *node;
>> +	int num_segs, index = 0;
>> +	int ret;
>> +
>> +	/* Parse through additional reserved memory regions for the rproc
>> +	 * and add them to the coredump segments
>> +	 */
>> +	num_segs = of_count_phandle_with_args(dev->of_node,
>> +					      "memory-region", NULL);
>> +	while (index < num_segs) {
>> +		node = of_parse_phandle(dev->of_node,
>> +					"memory-region", index);
>> +		if (!node)
>> +			return -EINVAL;
>> +
>> +		rmem = of_reserved_mem_lookup(node);
>> +		of_node_put(node);
>> +		if (!rmem) {
>> +			dev_err(dev, "unable to acquire memory-region index %d num_segs %d\n",
>> +				index, num_segs);
>> +			return -EINVAL;
>> +		}
>> +
>> +		dev_dbg(dev, "Adding segment 0x%pa size 0x%pa",
>> +			&rmem->base, &rmem->size);
>> +		ret = rproc_coredump_add_custom_segment(rproc,
>> +							rmem->base,
>> +							rmem->size,
>> +							wcss_sec_copy_segment,
>> +							NULL);
>> +		if (ret)
>> +			return ret;
>> +
>> +		index++;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct rproc_ops wcss_sec_ops = {
>> +	.start = wcss_sec_start,
>> +	.stop = wcss_sec_stop,
>> +	.da_to_va = wcss_sec_da_to_va,
>> +	.load = wcss_sec_load,
>> +	.get_boot_addr = rproc_elf_get_boot_addr,
>> +	.panic = wcss_sec_panic,
>> +	.parse_fw = wcss_sec_dump_segments,
>> +};
>> +
>> +static int wcss_sec_alloc_memory_region(struct wcss_sec *wcss)
>> +{
>> +	struct reserved_mem *rmem = NULL;
>> +	struct device_node *node;
>> +	struct device *dev = wcss->dev;
>> +
>> +	node = of_parse_phandle(dev->of_node, "memory-region", 0);
>> +	if (!node) {
>> +		dev_err(dev, "can't find phandle memory-region\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	rmem = of_reserved_mem_lookup(node);
>> +	of_node_put(node);
>> +
>> +	if (!rmem) {
>> +		dev_err(dev, "unable to acquire memory-region\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	wcss->mem_phys = rmem->base;
>> +	wcss->mem_reloc = rmem->base;
>> +	wcss->mem_size = rmem->size;
>> +	wcss->mem_region = devm_ioremap_wc(dev, wcss->mem_phys, wcss->mem_size);
>> +	if (!wcss->mem_region) {
>> +		dev_err(dev, "unable to map memory region: %pa+%pa\n",
>> +			&rmem->base, &rmem->size);
>> +		return -ENOMEM;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int wcss_sec_probe(struct platform_device *pdev)
>> +{
>> +	struct wcss_sec *wcss;
>> +	struct rproc *rproc;
>> +	const char *fw_name = NULL;
>> +	const struct wcss_data *desc = of_device_get_match_data(&pdev->dev);
>> +	int ret;
>> +
>> +	if (!desc)
>> +		return -EINVAL;
>> +
>> +	ret = of_property_read_string(pdev->dev.of_node, "firmware-name",
>> +				      &fw_name);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	rproc = rproc_alloc(&pdev->dev, pdev->name, desc->ops, fw_name,
>> +			    sizeof(*wcss));
>> +	if (!rproc) {
>> +		dev_err(&pdev->dev, "failed to allocate rproc\n");
>> +		return -ENOMEM;
>> +	}
>> +
>> +	wcss = rproc->priv;
>> +	wcss->dev = &pdev->dev;
>> +	wcss->desc = desc;
>> +	wcss->fw_name = fw_name;
>> +
>> +	ret = wcss_sec_alloc_memory_region(wcss);
>> +	if (ret)
>> +		goto free_rproc;
>> +
>> +	if (desc->init_clk) {
> Just use devm_clk_get_optional_enabled() instead of an optional
> callback.
>
>> +		ret = desc->init_clk(wcss);
>> +		if (ret)
>> +			goto free_rproc;
>> +	}
>> +
>> +	ret = qcom_q6v5_init(&wcss->q6, pdev, rproc,
>> +			     WCSS_CRASH_REASON, NULL, NULL);
>> +	if (ret)
>> +		goto free_rproc;
>> +
>> +	qcom_add_glink_subdev(rproc, &wcss->glink_subdev, "q6wcss");
>> +	qcom_add_ssr_subdev(rproc, &wcss->ssr_subdev, pdev->name);
>> +
>> +	rproc->auto_boot = desc->need_auto_boot;
>> +	rproc->dump_conf = RPROC_COREDUMP_INLINE;
>> +	rproc_coredump_set_elf_info(rproc, ELFCLASS32, EM_NONE);
>> +
>> +	ret = rproc_add(rproc);
>> +	if (ret)
>> +		goto free_rproc;
>> +
>> +	platform_set_drvdata(pdev, rproc);
>> +
>> +	return 0;
>> +
>> +free_rproc:
>> +	rproc_free(rproc);
>> +
>> +	return ret;
>> +}
>> +
>> +static void wcss_sec_remove(struct platform_device *pdev)
>> +{
>> +	struct rproc *rproc = platform_get_drvdata(pdev);
>> +	struct wcss_sec *wcss = rproc->priv;
>> +
>> +	qcom_q6v5_deinit(&wcss->q6);
>> +
>> +	rproc_del(rproc);
>> +	rproc_free(rproc);
>> +}
>> +
>> +static int wcss_sec_ipq5332_init_clk(struct wcss_sec *wcss)
>> +{
>> +	int ret;
>> +	struct device *dev = wcss->dev;
>> +
>> +	wcss->sleep_clk = devm_clk_get_enabled(dev, "sleep");
>> +	if (IS_ERR(wcss->sleep_clk)) {
>> +		return dev_err_probe(dev, PTR_ERR(wcss->sleep_clk),
>> +				     "Could not get sleep clock\n");
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct wcss_data wcss_sec_ipq5332_res_init = {
>> +	.pasid = MPD_WCSS_PAS_ID,
>> +	.ops = &wcss_sec_ops,
>> +	.bootargs_version = 2,
>> +	.init_clk = wcss_sec_ipq5332_init_clk,
>> +};
>> +
>> +static const struct wcss_data wcss_sec_ipq9574_res_init = {
>> +	.pasid = WCSS_PAS_ID,
>> +	.ops = &wcss_sec_ops,
>> +};
>> +
>> +static const struct of_device_id wcss_sec_of_match[] = {
>> +	{ .compatible = "qcom,ipq5332-wcss-sec-pil", .data = &wcss_sec_ipq5332_res_init },
>> +	{ .compatible = "qcom,ipq9574-wcss-sec-pil", .data = &wcss_sec_ipq9574_res_init },
>> +	{ },
>> +};
>> +MODULE_DEVICE_TABLE(of, wcss_sec_of_match);
>> +
>> +static struct platform_driver wcss_sec_driver = {
>> +	.probe = wcss_sec_probe,
>> +	.remove = wcss_sec_remove,
>> +	.driver = {
>> +		.name = "qcom-wcss-secure-pil",
>> +		.of_match_table = wcss_sec_of_match,
>> +	},
>> +};
>> +module_platform_driver(wcss_sec_driver);
>> +
>> +MODULE_DESCRIPTION("Hexagon WCSS Secure Peripheral Image Loader");
>> +MODULE_LICENSE("GPL");
>> -- 
>> 2.34.1
>>

