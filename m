Return-Path: <linux-arm-msm+bounces-25132-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F288925EB3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 13:39:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 058951F26403
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 11:39:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7395F178CE4;
	Wed,  3 Jul 2024 11:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="FwSxIfF8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 658481428F8;
	Wed,  3 Jul 2024 11:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720006467; cv=none; b=uYXyr8FsnTagw5Du2DU/4BaIOHODAFoX4v3tmdT33r9QzWVIXjQroXmicLDYGeTCdKb/UQ3kWtmylsq5/8BG/mTWMBTgVN3P0P7u7+jwxJpg3Fnp3rN/jamcpLF7FB5raujPQnAJTQkpYT+sMe6etUBOA9W/C6/CleXZkODAf0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720006467; c=relaxed/simple;
	bh=+VQihXo80QnqSzDvSNrqJzZrPVkhrvqzTf1AA3isGB8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=scsGmiyvUxc3xC/idzsZbCwy920NrOVcUwNbBM54mDInq2kaXxIHDy4sIgspWxW/jEgmhKRT61O+HUbLHZxxCbwmSJNWzUxJpnX2B6DCaLY99hRxxuGsZpcavwOG9kw45ePisc1n2t/xqguI2JDGzlmH1FwUeVy9ZV1yqWYeaOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=FwSxIfF8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4634MZir026759;
	Wed, 3 Jul 2024 11:34:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wFTp1f926IGc/3arNUlQ4xkkpA/Inij6QnEd6kHIGXY=; b=FwSxIfF8fBRvXsx1
	/tNQ/POk0sCFWZF3nVTrx/NB2zCer+kNYdJNc90sMFcx9PCC6wg01We6PDXQ+atu
	D2ssqgL91XpxD/yyAi1704GSPiQWHenaoy9i6YxPXyYNf9lKvJIvcQL8dV22Z3k6
	pXNLbxg8PGJf3SDchzUKdLlLBi5otAVcuwJWlHe3wJmGhOIBR4a5oSZEaBjASqXI
	9ZkKOcHrpXuZnqK453pIoEAhgtZFmpC8eY+748thKWtCiT4VahzLCORT3dsvM9H3
	FZjIflqHRaZRcIJ7aInpHlgCqwzxvWeS/X/dOeeLjMDzbVQhCenIzD//nwIZerqa
	Iksokw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 404yjhry4u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Jul 2024 11:34:17 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 463BYG0O022053
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 3 Jul 2024 11:34:16 GMT
Received: from [10.131.33.37] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 3 Jul 2024
 04:34:11 -0700
Message-ID: <11dee606-9c8a-7e6e-4514-d03979c118bd@quicinc.com>
Date: Wed, 3 Jul 2024 17:04:07 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RFC V3 3/4] soc: qcom: Introduce SCMI based Memlat (Memory
 Latency) governor
Content-Language: en-US
To: Shivnandan Kumar <quic_kshivnan@quicinc.com>, <sudeep.holla@arm.com>,
        <cristian.marussi@arm.com>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <quic_rgottimu@quicinc.com>, <conor+dt@kernel.org>,
        Amir Vajid
	<avajid@quicinc.com>
References: <20240702191440.2161623-1-quic_sibis@quicinc.com>
 <20240702191440.2161623-4-quic_sibis@quicinc.com>
 <4731cfa1-60d6-4f2b-9740-88e546edbd6b@quicinc.com>
From: Sibi Sankar <quic_sibis@quicinc.com>
In-Reply-To: <4731cfa1-60d6-4f2b-9740-88e546edbd6b@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: WswzxV_rxHNZZqw8f0uV3lOCmoJoSSo-
X-Proofpoint-ORIG-GUID: WswzxV_rxHNZZqw8f0uV3lOCmoJoSSo-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-03_06,2024-07-03_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 mlxlogscore=999 clxscore=1015 lowpriorityscore=0 suspectscore=0
 malwarescore=0 mlxscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407030084



On 7/3/24 14:14, Shivnandan Kumar wrote:
> 
> 
> On 7/3/2024 12:44 AM, Sibi Sankar wrote:
>> Introduce a client driver that uses the memlat algorithm string hosted
>> on ARM SCMI QCOM Vendor Protocol to detect memory latency workloads and
>> control frequency/level of the various memory buses (DDR/LLCC/DDR_QOS).
>>

Hey Shiv,

Thanks for taking time to review the series :)

>> Co-developed-by: Shivnandan Kumar <quic_kshivnan@quicinc.com>
>> Signed-off-by: Shivnandan Kumar <quic_kshivnan@quicinc.com>
>> Co-developed-by: Ramakrishna Gottimukkula <quic_rgottimu@quicinc.com>
>> Signed-off-by: Ramakrishna Gottimukkula <quic_rgottimu@quicinc.com>
>> Co-developed-by: Amir Vajid <avajid@quicinc.com>
>> Signed-off-by: Amir Vajid <avajid@quicinc.com>
>> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
>> ---
>>
>> V2:
>> * Make driver changes to the accommodate bindings changes. [Rob]
>> * Replace explicit of_node_put with _free.
>>
>>   drivers/soc/qcom/Kconfig            |  12 +
>>   drivers/soc/qcom/Makefile           |   1 +
>>   drivers/soc/qcom/qcom_scmi_client.c | 583 ++++++++++++++++++++++++++++
>>   3 files changed, 596 insertions(+)
>>   create mode 100644 drivers/soc/qcom/qcom_scmi_client.c
>>
>> diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
>> index 432c85bd8ad4..b253504bd386 100644
>> --- a/drivers/soc/qcom/Kconfig
>> +++ b/drivers/soc/qcom/Kconfig
>> @@ -294,4 +294,16 @@ config QCOM_PBS
>>         This module provides the APIs to the client drivers that wants 
>> to send the
>>         PBS trigger event to the PBS RAM.
>> +config QCOM_SCMI_CLIENT
>> +    tristate "Qualcomm Technologies Inc. SCMI client driver"
>> +    depends on ARM_SCMI_PROTOCOL_VENDOR_QCOM || COMPILE_TEST
>> +    default n
>> +    help
>> +      This driver uses the memlat algorithm string hosted on QCOM SCMI
>> +      Vendor Protocol to detect memory latency workloads and control
>> +      frequency/level of the various memory buses (DDR/LLCC/DDR_QOS).
>> +
>> +      This driver defines/documents the parameter IDs used while 
>> configuring
>> +      the memory buses.
>> +
>>   endmenu
>> diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
>> index d3560f861085..8a2e832d1d5d 100644
>> --- a/drivers/soc/qcom/Makefile
>> +++ b/drivers/soc/qcom/Makefile
>> @@ -35,6 +35,7 @@ obj-$(CONFIG_QCOM_APR) += apr.o
>>   obj-$(CONFIG_QCOM_LLCC) += llcc-qcom.o
>>   obj-$(CONFIG_QCOM_KRYO_L2_ACCESSORS) +=    kryo-l2-accessors.o
>>   obj-$(CONFIG_QCOM_ICC_BWMON)    += icc-bwmon.o
>> +obj-$(CONFIG_QCOM_SCMI_CLIENT)    += qcom_scmi_client.o
>>   qcom_ice-objs            += ice.o
>>   obj-$(CONFIG_QCOM_INLINE_CRYPTO_ENGINE)    += qcom_ice.o
>>   obj-$(CONFIG_QCOM_PBS) +=    qcom-pbs.o
>> diff --git a/drivers/soc/qcom/qcom_scmi_client.c 
>> b/drivers/soc/qcom/qcom_scmi_client.c
>> new file mode 100644
>> index 000000000000..8369b415c0ab
>> --- /dev/null
>> +++ b/drivers/soc/qcom/qcom_scmi_client.c
>> @@ -0,0 +1,583 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights 
>> reserved.
>> + */
>> +
>> +#include <linux/cpu.h>
>> +#include <linux/err.h>
>> +#include <linux/errno.h>
>> +#include <linux/init.h>
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/qcom_scmi_vendor.h>
>> +#include <linux/scmi_protocol.h>
>> +#include <linux/units.h>
>> +#include <dt-bindings/soc/qcom,scmi-vendor.h>
>> +
>> +#define MEMLAT_ALGO_STR                0x4D454D4C4154 /* MEMLAT */
>> +#define INVALID_IDX                0xff
>> +#define MAX_MEMORY_TYPES            3
>> +#define MAX_MONITOR_CNT                4
>> +#define MAX_NAME_LEN                20
>> +#define MAX_MAP_ENTRIES                7
>> +#define CPUCP_DEFAULT_SAMPLING_PERIOD_MS    4
>> +#define CPUCP_DEFAULT_FREQ_METHOD        1
>> +
>> +/**
>> + * scmi_memlat_protocol_cmd - parameter_ids supported by the "MEMLAT" 
>> algo_str hosted
>> + *                            by the Qualcomm SCMI Vendor Protocol on 
>> the SCMI controller.
>> + *
>> + * MEMLAT (Memory Latency) monitors the counters to detect memory 
>> latency bound workloads
>> + * and scales the frequency/levels of the memory buses accordingly.
>> + *
>> + * @MEMLAT_SET_MEM_GROUP: initializes the frequency/level scaling 
>> functions for the memory bus.
>> + * @MEMLAT_SET_MONITOR: configures the monitor to work on a specific 
>> memory bus.
>> + * @MEMLAT_SET_COMMON_EV_MAP: set up common counters used to monitor 
>> the cpu frequency.
>> + * @MEMLAT_SET_GRP_EV_MAP: set up any specific counters used to 
>> monitor the memory bus.
>> + * @MEMLAT_IPM_CEIL: set the IPM (Instruction Per Misses) ceiling per 
>> monitor.
>> + * @MEMLAT_SAMPLE_MS: set the sampling period for all the monitors.
>> + * MEMLAT_MON_FREQ_MAP: setup the cpufreq to memfreq map.
>> + * MEMLAT_SET_MIN_FREQ: set the max frequency of the memory bus.
>> + * MEMLAT_SET_MAX_FREQ: set the min frequency of the memory bus.
>> + * MEMLAT_START_TIMER: start all the monitors with the requested 
>> sampling period.
>> + * MEMLAT_START_TIMER: stop all the running monitors.
> 
> Typo above, it should be MEMLAT_STOP_TIMER

ack, thanks for catching this.

> 
>> + * MEMLAT_SET_EFFECTIVE_FREQ_METHOD: set the method used to determine 
>> cpu frequency.
>> + */
>> +enum scmi_memlat_protocol_cmd {
>> +    MEMLAT_SET_MEM_GROUP = 16,
>> +    MEMLAT_SET_MONITOR,
>> +    MEMLAT_SET_COMMON_EV_MAP,
>> +    MEMLAT_SET_GRP_EV_MAP,
>> +    MEMLAT_IPM_CEIL = 23,
>> +    MEMLAT_SAMPLE_MS = 31,
>> +    MEMLAT_MON_FREQ_MAP,
>> +    MEMLAT_SET_MIN_FREQ,
>> +    MEMLAT_SET_MAX_FREQ,
>> +    MEMLAT_START_TIMER = 36,
>> +    MEMLAT_STOP_TIMER,
>> +    MEMLAT_SET_EFFECTIVE_FREQ_METHOD = 39,
>> +};
>> +
>> +struct map_table {

[...]

>> +
>> +static int populate_physical_mask(struct device_node *np, u32 *mask, 
>> u32 *cluster_info)
>> +{
>> +    struct device_node *dev_phandle;
>> +    int cpu, i = 0, physical_id;
>> +
>> +    do {
>> +        dev_phandle = of_parse_phandle(np, "cpus", i++);
>> +        cpu = of_cpu_node_to_id(dev_phandle);
>> +        if (cpu != -ENODEV) {
>> +            physical_id = topology_core_id(cpu);
>> +            for (int j = 0; j < topology_cluster_id(cpu); j++)
>> +                physical_id += *(cluster_info + j);
>> +            *mask |= BIT(physical_id);
>> +        }
>> +    } while (dev_phandle);
>> +
>> +    return 0;
>> +}
>> +
>> +static struct cpufreq_memfreq_map *init_cpufreq_memfreq_map(struct 
>> device *dev,
>> +                                struct scmi_memory_info *memory,
>> +                                struct device_node *of_node,
>> +                                u32 *cnt)
>> +{
>> +    struct device_node *tbl_np, *opp_np;
>> +    struct cpufreq_memfreq_map *tbl;
>> +    int ret, i = 0;
>> +    u32 level, len;
>> +    u64 rate;
>> +
>> +    tbl_np = of_parse_phandle(of_node, "operating-points-v2", 0);
>> +    if (!tbl_np)
>> +        return ERR_PTR(-ENODEV);
>> +
>> +    len = min(of_get_available_child_count(tbl_np), MAX_MAP_ENTRIES);
>> +    if (len == 0)
>> +        return ERR_PTR(-ENODEV);
>> +
>> +    tbl = devm_kzalloc(dev, (len + 1) * sizeof(struct 
>> cpufreq_memfreq_map),
>> +               GFP_KERNEL);
>> +    if (!tbl)
>> +        return ERR_PTR(-ENOMEM);
>> +
>> +    for_each_available_child_of_node(tbl_np, opp_np) {
>> +        ret = of_property_read_u64_index(opp_np, "opp-hz", 0, &rate);
>> +        if (ret < 0)
>> +            return ERR_PTR(ret);
>> +
>> +        tbl[i].cpufreq_mhz = rate / HZ_PER_MHZ;
>> +
>> +        if (memory->hw_type != QCOM_MEM_TYPE_DDR_QOS) {
>> +            ret = of_property_read_u64_index(opp_np, "opp-hz", 1, 
>> &rate);
>> +            if (ret < 0)
>> +                return ERR_PTR(ret);
>> +
>> +            tbl[i].memfreq_khz = rate / HZ_PER_KHZ;
>> +        } else {
>> +            ret = of_property_read_u32(opp_np, "opp-level", &level);
>> +            if (ret < 0)
>> +                return ERR_PTR(ret);
>> +
>> +            tbl[i].memfreq_khz = level;
>> +        }
>> +
>> +        dev_dbg(dev, "Entry%d CPU:%u, Mem:%u\n", i, 
>> tbl[i].cpufreq_mhz, tbl[i].memfreq_khz);
>> +        i++;
>> +    }
>> +    *cnt = len;
>> +    tbl[i].cpufreq_mhz = 0;
> 
> This is not needed as for allocating memory, devm_kzalloc is used.

ack

> 
>> +
>> +    return tbl;
>> +}
>> +
>> +static int process_scmi_memlat_of_node(struct scmi_device *sdev, 
>> struct scmi_memlat_info *info)
>> +{
>> +    struct scmi_monitor_info *monitor;
>> +    struct scmi_memory_info *memory;
>> +    char name[MAX_NAME_LEN];
>> +    u64 memfreq[2];
>> +    int ret;
>> +
>> +    ret = populate_cluster_info(info->cluster_info);
>> +    if (ret < 0) {
>> +        dev_err_probe(&sdev->dev, ret, "failed to populate cluster 
>> info\n");
>> +        goto err;
>> +    }
>> +
>> +    of_node_get(sdev->handle->dev->of_node);
>> +    do {
>> +        snprintf(name, sizeof(name), "memory-%d", info->memory_cnt);
>> +        struct device_node *memory_np __free(device_node) =
>> +            of_find_node_by_name(sdev->handle->dev->of_node, name);
>> +
>> +        if (!memory_np)
>> +            break;
>> +
>> +        memory = devm_kzalloc(&sdev->dev, sizeof(*memory), GFP_KERNEL);
>> +        if (!memory) {
>> +            ret = -ENOMEM;
>> +            goto err;
>> +        }
>> +
>> +        ret = of_property_read_u32(memory_np, "qcom,memory-type", 
>> &memory->hw_type);
>> +        if (ret) {
>> +            dev_err_probe(&sdev->dev, ret, "failed to read memory 
>> type\n");
>> +            goto err;
>> +        }
>> +
>> +        ret = of_property_read_u64_array(memory_np, "freq-table-hz", 
>> memfreq, 2);
>> +        if (ret && (ret != -EINVAL)) {
>> +            dev_err_probe(&sdev->dev, ret, "failed to read min/max 
>> freq\n");
>> +            goto err;
>> +        }
>> +
>> +        if (memory->hw_type != QCOM_MEM_TYPE_DDR_QOS) {
>> +            memory->min_freq = memfreq[0] / HZ_PER_KHZ;
>> +            memory->max_freq = memfreq[1] / HZ_PER_KHZ;
>> +        } else {
>> +            memory->min_freq = memfreq[0];
>> +            memory->max_freq = memfreq[1];
>> +        }
>> +        info->memory[info->memory_cnt++] = memory;
>> +
>> +        do {
>> +            snprintf(name, sizeof(name), "monitor-%d", 
>> memory->monitor_cnt);
>> +            struct device_node *monitor_np __free(device_node) =
>> +                of_get_child_by_name(memory_np, name);
>> +
>> +            if (!monitor_np)
>> +                break;
>> +
>> +            monitor = devm_kzalloc(&sdev->dev, sizeof(*monitor), 
>> GFP_KERNEL);
>> +            if (!monitor) {
>> +                ret = -ENOMEM;
>> +                goto err;
>> +            }
>> +
>> +            monitor->mon_type = of_property_read_bool(monitor_np, 
>> "qcom,compute-type");
>> +            if (!monitor->mon_type) {
>> +                ret = of_property_read_u32(monitor_np, "qcom,ipm-ceil",
>> +                               &monitor->ipm_ceil);
>> +                if (ret) {
>> +                    dev_err_probe(&sdev->dev, ret,
>> +                              "failed to read IPM ceiling\n");
>> +                    goto err;
>> +                }
>> +            }
>> +
>> +            /*
>> +             * Variants of the SoC having reduced number of cpus operate
>> +             * with the same number of logical cpus but the physical
>> +             * cpu disabled will differ between parts. Calculate the
>> +             * physical cpu number using cluster information instead.
>> +             */
>> +            ret = populate_physical_mask(monitor_np, &monitor->mask,
>> +                             info->cluster_info);
>> +            if (ret < 0) {
>> +                dev_err_probe(&sdev->dev, ret, "failed to populate 
>> cpu mask\n");
>> +                goto err;
>> +            }
>> +
> 
> Above error check is not needed as populate_physical_mask always return 0.

ack, will fix this in the next re-spin.

> 
> 
>> +            monitor->freq_map = init_cpufreq_memfreq_map(&sdev->dev, 
>> memory, monitor_np,
>> +                                     &monitor->freq_map_len);
>> +            if (IS_ERR(monitor->freq_map)) {
>> +                dev_err_probe(&sdev->dev, PTR_ERR(monitor->freq_map),
>> +                          "failed to populate cpufreq-memfreq map\n");
>> +                goto err;
>> +            }
>> +
>> +            strscpy(monitor->mon_name, name, sizeof(monitor->mon_name));
>> +            monitor->mon_idx = memory->monitor_cnt;
>> +
>> +            memory->monitor[memory->monitor_cnt++] = monitor;
> 
> If from dt, more than 4 monitor are passed then this may lead to 
> overflow, adding a check and giving warning in case number of monitor 
> exceeds MAX_MONITOR_CNT will be better idea.

I'll make sure to account for ^^ by either switching to dynamic
allocation or by using MAX_MONITOR_CNT.

> 
> 
>> +        } while (1);
>> +

[...]

>> +MODULE_DESCRIPTION("QTI SCMI client driver");
>> +MODULE_LICENSE("GPL");

