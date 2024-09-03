Return-Path: <linux-arm-msm+bounces-30454-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9759692E9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 06:37:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9A1DD1C21956
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 04:37:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E31C1A3032;
	Tue,  3 Sep 2024 04:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="RDSnVzlY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B665195;
	Tue,  3 Sep 2024 04:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725338258; cv=none; b=qwWNfnyQp9Qu0o6pQ2abz5IQI2Q3F/GgX/iayZhdcsLUQZymufQz5iJ74aPB7DfVVwsG/Cve2ik0TEO1UPw/ZKdoIuM5Ns+KZ9vPDA/MJpm1COUC9sNJWqVxxG4mbDVSHsYhBKQt2BHHVrGnCzBn+BeyleYczHaO+8N5Z9gg9WA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725338258; c=relaxed/simple;
	bh=wt8IHimSNO5Tc3MbS5IzTVDn4NVuBGUFTp+KjpQUD14=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=gqsW10arDgGmNIFj35J1Pdq19FpkoSJ3MLE2pe3IAl/TfDfG3H8BWxBl0kV0qpWvHPswtdj3TaoOx1W+U3tQi+re2U/KMvGrAN7QFSqDz2r9E2BhdGo1XDQyTinfLCRvyjCKYAAUKCsF/sZA3C3NhBzYG5Uad595asbLFk/qX3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=RDSnVzlY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 482MxXpO013444;
	Tue, 3 Sep 2024 04:37:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	blhYZYJv7t41Y8tQDYnVUacAlh+koHF6mAR+D1dz7Rw=; b=RDSnVzlY2JwZuTTG
	PeY7wrIDmd2cGoa6Pr+OFy1rVfAb3kzPShSUks0x1RuwkJjDOuPKtEWMAbTBphv8
	e6wQ1KrBuzpxRJE/DT5qZNQPN4sf8otmvNsPd7BPpS+P4GTAgkCvpR6QfISzgsgq
	1UEeCNuN/sO0F6vewRMP4so3eWR9BS5IQmBy/wkpZghGubmhbBXgy8woDcvOT2Vz
	agWVza5+gU0O7dlojuXF/nvoFRgGS/oGFLRmihp351Oa+2oMf/vXp8KzKyCoXxlM
	DE2rem3Vc7kXYZuC8vd4gDCgaAmXWMFhdvqUlu7ieetvdSfS59lzr2YHf0YMsDRL
	L5iGsQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41btrxp40q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Sep 2024 04:37:31 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4834bU5d019342
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 3 Sep 2024 04:37:30 GMT
Received: from [10.151.37.217] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 2 Sep 2024
 21:37:26 -0700
Message-ID: <f08380f7-eb39-46b2-a9bc-47486deca18d@quicinc.com>
Date: Tue, 3 Sep 2024 10:07:23 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 2/4] remoteproc: qcom: add hexagon based WCSS secure
 PIL driver
To: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>,
        <andersson@kernel.org>, <krzk+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <quic_viswanat@quicinc.com>, <quic_mmanikan@quicinc.com>,
        <quic_varada@quicinc.com>, <quic_srichara@quicinc.com>,
        <quic_gokulsri@quiconc.com>
References: <20240829134021.1452711-1-quic_gokulsri@quicinc.com>
 <20240829134021.1452711-3-quic_gokulsri@quicinc.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>
In-Reply-To: <20240829134021.1452711-3-quic_gokulsri@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: wMmowzemOBbj9dPavcd_ecjhGuYSKepd
X-Proofpoint-ORIG-GUID: wMmowzemOBbj9dPavcd_ecjhGuYSKepd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-02_06,2024-09-02_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 clxscore=1011 suspectscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 mlxscore=0 mlxlogscore=999 spamscore=0
 lowpriorityscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2407110000 definitions=main-2409030033



On 8/29/2024 7:10 PM, Gokul Sriram Palanisamy wrote:
> From: Vignesh Viswanathan <quic_viswanat@quicinc.com>
> 
> Add support to bring up hexagon based WCSS secure PIL remoteproc.
> IPQ5332, IPQ9574 supports secure PIL remoteproc.
> 
> Signed-off-by: Vignesh Viswanathan <quic_viswanat@quicinc.com>
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> Signed-off-by: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
> ---
> changes since v1: Addressed comments by Krzysztof
> 	- moved of_node_put( ) before return value check to avoid
> 	  leaking refcount.
> 	- simplified if/else for error handling.
> 	- implemented 'devm_clk_get_enabled' instead of using
> 	  'devm_clk_get' and 'clk_prepare_enable' conscutively.
> 	- implemented 'dev_err_probe' for error handling.
> 
>   drivers/remoteproc/Kconfig              |  22 ++
>   drivers/remoteproc/Makefile             |   1 +
>   drivers/remoteproc/qcom_q6v5_wcss_sec.c | 354 ++++++++++++++++++++++++
>   3 files changed, 377 insertions(+)
>   create mode 100644 drivers/remoteproc/qcom_q6v5_wcss_sec.c
> 
> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> index 0f0862e20a93..3e7c6fc62ca1 100644
> --- a/drivers/remoteproc/Kconfig
> +++ b/drivers/remoteproc/Kconfig
> @@ -255,6 +255,28 @@ config QCOM_Q6V5_WCSS
>   	  Hexagon V5 based WCSS remote processors on e.g. IPQ8074.  This is
>   	  a non-TrustZone wireless subsystem.
>   
> +config QCOM_Q6V5_WCSS_SEC
> +	tristate "Qualcomm Hexagon based WCSS Secure Peripheral Image Loader"
> +	depends on OF && ARCH_QCOM
> +	depends on QCOM_SMEM
> +	depends on RPMSG_QCOM_SMD || RPMSG_QCOM_SMD=n
> +	depends on RPMSG_QCOM_GLINK_SMEM || RPMSG_QCOM_GLINK_SMEM=n
> +	depends on QCOM_SYSMON || QCOM_SYSMON=n
> +	depends on RPMSG_QCOM_GLINK || RPMSG_QCOM_GLINK=n
> +	depends on QCOM_AOSS_QMP || QCOM_AOSS_QMP=n
> +	select QCOM_MDT_LOADER
> +	select QCOM_PIL_INFO
> +	select QCOM_Q6V5_COMMON
> +	select QCOM_RPROC_COMMON
> +	select QCOM_SCM
> +	help
> +	  Say y here to support the Qualcomm Secure Peripheral Image Loader
> +	  for the Hexagon based remote processors on e.g. IPQ5332.
> +
> +	  This is TrustZone wireless subsystem. The firmware is
> +	  verified and booted with the help of the Peripheral Authentication
> +	  System (PAS) in TrustZone.
> +
>   config QCOM_SYSMON
>   	tristate "Qualcomm sysmon driver"
>   	depends on RPMSG
> diff --git a/drivers/remoteproc/Makefile b/drivers/remoteproc/Makefile
> index 5ff4e2fee4ab..d4971b672812 100644
> --- a/drivers/remoteproc/Makefile
> +++ b/drivers/remoteproc/Makefile
> @@ -28,6 +28,7 @@ obj-$(CONFIG_QCOM_Q6V5_ADSP)		+= qcom_q6v5_adsp.o
>   obj-$(CONFIG_QCOM_Q6V5_MSS)		+= qcom_q6v5_mss.o
>   obj-$(CONFIG_QCOM_Q6V5_PAS)		+= qcom_q6v5_pas.o
>   obj-$(CONFIG_QCOM_Q6V5_WCSS)		+= qcom_q6v5_wcss.o
> +obj-$(CONFIG_QCOM_Q6V5_WCSS_SEC)	+= qcom_q6v5_wcss_sec.o
>   obj-$(CONFIG_QCOM_SYSMON)		+= qcom_sysmon.o
>   obj-$(CONFIG_QCOM_WCNSS_PIL)		+= qcom_wcnss_pil.o
>   qcom_wcnss_pil-y			+= qcom_wcnss.o
> diff --git a/drivers/remoteproc/qcom_q6v5_wcss_sec.c b/drivers/remoteproc/qcom_q6v5_wcss_sec.c
> new file mode 100644
> index 000000000000..3c8bb2639567
> --- /dev/null
> +++ b/drivers/remoteproc/qcom_q6v5_wcss_sec.c
> @@ -0,0 +1,354 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2016-2018 Linaro Ltd.
> + * Copyright (C) 2014 Sony Mobile Communications AB
> + * Copyright (c) 2012-2018, 2024 The Linux Foundation. All rights reserved.
> + */
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/firmware/qcom/qcom_scm.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of_address.h>
> +#include <linux/of_device.h>
> +#include <linux/of_reserved_mem.h>
> +#include <linux/platform_device.h>
> +#include <linux/reset.h>
> +#include <linux/soc/qcom/mdt_loader.h>
> +#include <linux/soc/qcom/smem.h>
> +#include <linux/soc/qcom/smem_state.h>
> +#include "qcom_common.h"
> +#include "qcom_q6v5.h"
> +
> +#include "remoteproc_internal.h"
> +
> +#define WCSS_CRASH_REASON		421
> +
> +#define WCSS_PAS_ID			0x6
> +#define MPD_WCSS_PAS_ID			0xD
> +
> +struct wcss_sec {
> +	struct device *dev;
> +	struct qcom_rproc_glink glink_subdev;
> +	struct qcom_rproc_ssr ssr_subdev;
> +	struct qcom_q6v5 q6;
> +	phys_addr_t mem_phys;
> +	phys_addr_t mem_reloc;
> +	void *mem_region;
> +	size_t mem_size;
> +	const struct wcss_data *desc;
> +	const char *fw_name;
> +
> +	struct clk *sleep_clk;
> +};
> +
> +struct wcss_data {
> +	u32 pasid;
> +	const struct rproc_ops *ops;
> +	bool need_auto_boot;
> +	u8 bootargs_version;
> +	int (*init_clk)(struct wcss_sec *wcss);
> +};
> +
> +static int wcss_sec_start(struct rproc *rproc)
> +{
> +	struct wcss_sec *wcss = rproc->priv;
> +	struct device *dev = wcss->dev;
> +	const struct wcss_data *desc = of_device_get_match_data(dev);
> +	int ret;
> +
> +	qcom_q6v5_prepare(&wcss->q6);
> +
> +	ret = qcom_scm_pas_auth_and_reset(desc->pasid);
> +	if (ret) {
> +		dev_err(dev, "wcss_reset failed\n");
> +		return ret;
> +	}
> +
> +	ret = qcom_q6v5_wait_for_start(&wcss->q6, 5 * HZ);
> +	if (ret == -ETIMEDOUT)
> +		dev_err(dev, "start timed out\n");
> +
> +	return ret;
> +}
> +
> +static int wcss_sec_stop(struct rproc *rproc)
> +{
> +	struct wcss_sec *wcss = rproc->priv;
> +	struct device *dev = wcss->dev;
> +	const struct wcss_data *desc = of_device_get_match_data(dev);
> +	int ret;
> +
> +	ret = qcom_scm_pas_shutdown(desc->pasid);
> +	if (ret) {
> +		dev_err(dev, "not able to shutdown\n");
> +		return ret;
> +	}
> +	qcom_q6v5_unprepare(&wcss->q6);
> +
> +	return 0;
> +}
> +
> +static void *wcss_sec_da_to_va(struct rproc *rproc, u64 da, size_t len,
> +			       bool *is_iomem)
> +{
> +	struct wcss_sec *wcss = rproc->priv;
> +	int offset;
> +
> +	offset = da - wcss->mem_reloc;
> +	if (offset < 0 || offset + len > wcss->mem_size)
> +		return NULL;
> +
> +	return wcss->mem_region + offset;
> +}
> +
> +static int wcss_sec_load(struct rproc *rproc, const struct firmware *fw)
> +{
> +	struct wcss_sec *wcss = rproc->priv;
> +	struct device *dev = wcss->dev;
> +	const struct wcss_data *desc = of_device_get_match_data(dev);
> +
> +	return qcom_mdt_load(dev, fw, rproc->firmware, desc->pasid,
> +			     wcss->mem_region, wcss->mem_phys, wcss->mem_size,
> +			     &wcss->mem_reloc);
> +}
> +
> +static unsigned long wcss_sec_panic(struct rproc *rproc)
> +{
> +	struct wcss_sec *wcss = rproc->priv;
> +
> +	return qcom_q6v5_panic(&wcss->q6);
> +}
> +
> +static void wcss_sec_copy_segment(struct rproc *rproc,
> +				  struct rproc_dump_segment *segment,
> +				  void *dest, size_t offset, size_t size)
> +{
> +	struct wcss_sec *wcss = rproc->priv;
> +	struct device *dev = wcss->dev;
> +	void *ptr;
> +
> +	ptr = devm_ioremap_wc(dev, segment->da, segment->size);
> +	if (!ptr) {
> +		dev_err(dev, "Failed to ioremap segment %pad size %zx\n",
> +			&segment->da, segment->size);
> +		return;
> +	}
> +
> +	if (size <= segment->size - offset)
> +		memcpy(dest, ptr + offset, size);
> +	else
> +		dev_err(dev, "Copy size greater than segment size. Skipping\n");
> +	devm_iounmap(dev, ptr);
> +}
> +
> +static int wcss_sec_dump_segments(struct rproc *rproc,
> +				  const struct firmware *fw)
> +{
> +	struct device *dev = rproc->dev.parent;
> +	struct reserved_mem *rmem = NULL;
> +	struct device_node *node;
> +	int num_segs, index = 0;
> +	int ret;
> +
> +	/* Parse through additional reserved memory regions for the rproc
> +	 * and add them to the coredump segments
> +	 */
> +	num_segs = of_count_phandle_with_args(dev->of_node,
> +					      "memory-region", NULL);
> +	while (index < num_segs) {
> +		node = of_parse_phandle(dev->of_node,
> +					"memory-region", index);
> +		if (!node)
> +			return -EINVAL;
> +
> +		rmem = of_reserved_mem_lookup(node);
> +		of_node_put(node);
> +		if (!rmem) {
> +			dev_err(dev, "unable to acquire memory-region index %d num_segs %d\n",
> +				index, num_segs);
> +			return -EINVAL;
> +		}
> +
> +		dev_dbg(dev, "Adding segment 0x%pa size 0x%pa",
> +			&rmem->base, &rmem->size);
> +		ret = rproc_coredump_add_custom_segment(rproc,
> +							rmem->base,
> +							rmem->size,
> +							wcss_sec_copy_segment,
> +							NULL);
> +		if (ret)
> +			return ret;
> +
> +		index++;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct rproc_ops wcss_sec_ops = {
> +	.start = wcss_sec_start,
> +	.stop = wcss_sec_stop,
> +	.da_to_va = wcss_sec_da_to_va,
> +	.load = wcss_sec_load,
> +	.get_boot_addr = rproc_elf_get_boot_addr,
> +	.panic = wcss_sec_panic,
> +	.parse_fw = wcss_sec_dump_segments,
> +};
> +
> +static int wcss_sec_alloc_memory_region(struct wcss_sec *wcss)
> +{
> +	struct reserved_mem *rmem = NULL;
> +	struct device_node *node;
> +	struct device *dev = wcss->dev;
> +
> +	node = of_parse_phandle(dev->of_node, "memory-region", 0);
> +	if (!node) {
> +		dev_err(dev, "can't find phandle memory-region\n");
> +		return -EINVAL;
> +	}
> +
> +	rmem = of_reserved_mem_lookup(node);
> +	of_node_put(node);
> +
> +	if (!rmem) {
> +		dev_err(dev, "unable to acquire memory-region\n");
> +		return -EINVAL;
> +	}
> +
> +	wcss->mem_phys = rmem->base;
> +	wcss->mem_reloc = rmem->base;
> +	wcss->mem_size = rmem->size;
> +	wcss->mem_region = devm_ioremap_wc(dev, wcss->mem_phys, wcss->mem_size);
> +	if (!wcss->mem_region) {
> +		dev_err(dev, "unable to map memory region: %pa+%pa\n",
> +			&rmem->base, &rmem->size);
> +		return -ENOMEM;
> +	}
> +
> +	return 0;
> +}
> +
> +static int wcss_sec_probe(struct platform_device *pdev)
> +{
> +	struct wcss_sec *wcss;
> +	struct rproc *rproc;
> +	const char *fw_name = NULL;
> +	const struct wcss_data *desc = of_device_get_match_data(&pdev->dev);
> +	int ret;
> +
> +	if (!desc)
> +		return -EINVAL;
> +
> +	ret = of_property_read_string(pdev->dev.of_node, "firmware-name",
> +				      &fw_name);
> +	if (ret < 0)
> +		return ret;
> +
> +	rproc = rproc_alloc(&pdev->dev, pdev->name, desc->ops, fw_name,
> +			    sizeof(*wcss));


devm_rproc_alloc?


> +	if (!rproc) {
> +		dev_err(&pdev->dev, "failed to allocate rproc\n");
> +		return -ENOMEM;
> +	}
> +
> +	wcss = rproc->priv;
> +	wcss->dev = &pdev->dev;
> +	wcss->desc = desc;
> +	wcss->fw_name = fw_name;
> +
> +	ret = wcss_sec_alloc_memory_region(wcss);
> +	if (ret)
> +		goto free_rproc;
> +
> +	if (desc->init_clk) {
> +		ret = desc->init_clk(wcss);
> +		if (ret)
> +			goto free_rproc;
> +	}
> +
> +	ret = qcom_q6v5_init(&wcss->q6, pdev, rproc,
> +			     WCSS_CRASH_REASON, NULL, NULL);
> +	if (ret)
> +		goto free_rproc;
> +
> +	qcom_add_glink_subdev(rproc, &wcss->glink_subdev, "q6wcss");
> +	qcom_add_ssr_subdev(rproc, &wcss->ssr_subdev, pdev->name);
> +
> +	rproc->auto_boot = desc->need_auto_boot;
> +	rproc->dump_conf = RPROC_COREDUMP_INLINE;
> +	rproc_coredump_set_elf_info(rproc, ELFCLASS32, EM_NONE);
> +
> +	ret = rproc_add(rproc);
> +	if (ret)
> +		goto free_rproc;
> +
> +	platform_set_drvdata(pdev, rproc);
> +
> +	return 0;
> +
> +free_rproc:
> +	rproc_free(rproc);
> +
> +	return ret;
> +}
> +
> +static void wcss_sec_remove(struct platform_device *pdev)
> +{
> +	struct rproc *rproc = platform_get_drvdata(pdev);
> +	struct wcss_sec *wcss = rproc->priv;
> +
> +	qcom_q6v5_deinit(&wcss->q6);
> +
> +	rproc_del(rproc);
> +	rproc_free(rproc);
> +}
> +
> +static int wcss_sec_ipq5332_init_clk(struct wcss_sec *wcss)
> +{
> +	int ret;
> +	struct device *dev = wcss->dev;
> +
> +	wcss->sleep_clk = devm_clk_get_enabled(dev, "sleep");
> +	if (IS_ERR(wcss->sleep_clk)) {
> +		return dev_err_probe(dev, PTR_ERR(wcss->sleep_clk),
> +				     "Could not get sleep clock\n");
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct wcss_data wcss_sec_ipq5332_res_init = {
> +	.pasid = MPD_WCSS_PAS_ID,
> +	.ops = &wcss_sec_ops,
> +	.bootargs_version = 2,
> +	.init_clk = wcss_sec_ipq5332_init_clk,
> +};
> +
> +static const struct wcss_data wcss_sec_ipq9574_res_init = {
> +	.pasid = WCSS_PAS_ID,
> +	.ops = &wcss_sec_ops,
> +};
> +
> +static const struct of_device_id wcss_sec_of_match[] = {
> +	{ .compatible = "qcom,ipq5332-wcss-sec-pil", .data = &wcss_sec_ipq5332_res_init },
> +	{ .compatible = "qcom,ipq9574-wcss-sec-pil", .data = &wcss_sec_ipq9574_res_init },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, wcss_sec_of_match);
> +
> +static struct platform_driver wcss_sec_driver = {
> +	.probe = wcss_sec_probe,
> +	.remove = wcss_sec_remove,
> +	.driver = {
> +		.name = "qcom-wcss-secure-pil",
> +		.of_match_table = wcss_sec_of_match,
> +	},
> +};
> +module_platform_driver(wcss_sec_driver);
> +
> +MODULE_DESCRIPTION("Hexagon WCSS Secure Peripheral Image Loader");
> +MODULE_LICENSE("GPL");

