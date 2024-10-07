Return-Path: <linux-arm-msm+bounces-33431-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0170399357E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 19:58:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 247581C23331
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 17:58:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D37AE1DDA3F;
	Mon,  7 Oct 2024 17:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jMcXEYaL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5243B1DD866
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Oct 2024 17:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728323874; cv=none; b=O+SZpSh8/2l02rBiPICWCoQq8avlQ5oE70vkzgCRVVaGc6P3Ds/9gCx6ZhKQIiPaoE/0Xc5wip/mwA59IAvYGTEvJUKnmzj7HCWPKdwbCwX7Htpe4mfYTB/PYYbfoTaBCynj8meIfyQx+eYCatSadMZm0hai0u8WwivR0aaMLQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728323874; c=relaxed/simple;
	bh=J73i3yOMyrSqxWRxMMAOcGLuXuxyM1u+P2IWCCnl2z8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L3aKJya8v7RcVgOXDMusnCW/PeD4G5U4vuLht0pHKw90UFqKmbYvjLwYJZQCBsHb/U6ULPsv9EI4c5/OizxKBZ/nkkrB/xPFnmPG7ooit9imP6NXM1MDT5SbYjC4/L7WX8eD8kcCQSgeCvcxNxVq9fjqYZDwFjxhbLuJSdQSiwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jMcXEYaL; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5398cc2fcb7so5333740e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Oct 2024 10:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728323869; x=1728928669; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IkSK1rSeXNMiqR5ifsPP73sBZJGzTaN8QsPHz/tpJkQ=;
        b=jMcXEYaL0svitJi/UmUHW5wOp5zu1TFYwWOJEhMu9B8ehlyqHakHHJPl5ynGcpGReX
         WTac4DpVKG/jG1BXk3X7NYSMlGJt1QISWJtMlWwOKpL0Oq0KaMDA7i53kDH1ZFc2vtG8
         StBq2m5E6ZJhLKy06smLTNOhTHwEnxN4ZE64rjpRw2xh7U+rXHMQokf84JKOuwxefwzv
         wKzoBqBIIJS3yPiPEeRRDpYlXpIf97l79GtERvs7Cnb3Hn9IHOUxzUcEgCoblsW50gzd
         O6kmAM6D+UdDclZPfDSX3zCvvAShHTBZ/PUAT2cdXgniWznToBufVU8zFcScolJtvdjY
         laEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728323869; x=1728928669;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IkSK1rSeXNMiqR5ifsPP73sBZJGzTaN8QsPHz/tpJkQ=;
        b=rViIoTsLkVeWlFyxxmJsyReswpib+A/5nImV4AUstHrwc8wvVjrysF6tW5bAaUvdyc
         PIHGg5Qw4hhCb9QGVWeR2ceZp67gQMYa2i09BUxLO0Q058CZ5M+zze2mOnJrjZm2zaiS
         0PX2fCL+OWiNVXoOEnWElP8FC7MG8JfE7DIrwyJpl/DS+rjhruFm92IgpSbOnP4d76Rg
         ZpT7Rt65PKybRar+wNq8izPhjeH7E1oEwFEHGpl5F/uJHda61tFoBwOJaxTup6MZaYHF
         cyzp1TRlThIAzgmGWbDrDnxl7ett9c0QB/qVOEOrhpgCPF3ETrmeDZwdTle/bQimr+FN
         2bZw==
X-Forwarded-Encrypted: i=1; AJvYcCUhv9lDPPIZXETdmaFv3xe7FL5V5QU5s63ff7nycXnqNhflGPKZ/CKHd971Qd5AaNa8nICyYIUrdOm2/RKm@vger.kernel.org
X-Gm-Message-State: AOJu0YzYIdtxSpk3aSYIrwllPy+4hvfLudt74Nk9VE1ubUBUJ3BILSk8
	Fuj8FH2CLlUUAnlGvGiSyt/csDXtWHreJoF2vm4lHDFCWi8hg+PGLJjSo6Xbrb64UM0gFdhNt04
	sjVRLFBXP
X-Google-Smtp-Source: AGHT+IEZkcUSVU4UshKKaIyKPIYE+Iz/N2YDhv/UF/H85QbStu4JaMYEpTQcVSXrj9+E99zztVUaiA==
X-Received: by 2002:a05:6512:31c4:b0:530:ae0a:ab7a with SMTP id 2adb3069b0e04-539ab85839dmr5633061e87.17.1728323869202;
        Mon, 07 Oct 2024 10:57:49 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00-89ea-67f6-92cd-b49.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:89ea:67f6:92cd:b49])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539aff234e2sm883502e87.223.2024.10.07.10.57.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 10:57:48 -0700 (PDT)
Date: Mon, 7 Oct 2024 20:57:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com, andersson@kernel.org, 
	konrad.dybcio@linaro.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, quic_rgottimu@quicinc.com, quic_kshivnan@quicinc.com, 
	conor+dt@kernel.org, arm-scmi@vger.kernel.org, Amir Vajid <avajid@quicinc.com>
Subject: Re: [PATCH V4 4/5] soc: qcom: Introduce SCMI based Memlat (Memory
 Latency) governor
Message-ID: <2aycrvnvivcrqctqmweadcgenwugafdr6ub3bzkscterpenz32@bzabln2hkral>
References: <20241007061023.1978380-1-quic_sibis@quicinc.com>
 <20241007061023.1978380-5-quic_sibis@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241007061023.1978380-5-quic_sibis@quicinc.com>

On Mon, Oct 07, 2024 at 11:40:22AM GMT, Sibi Sankar wrote:
> Introduce a client driver that uses the memlat algorithm string
> hosted on QCOM SCMI Generic Extension Protocol to detect memory
> latency workloads and control frequency/level of the various
> memory buses (DDR/LLCC/DDR_QOS).

This sounds like a devfreq implementation. Please provide a reason why
it doesn't use existing API (even if to export the information to the
userspace).

> 
> Co-developed-by: Shivnandan Kumar <quic_kshivnan@quicinc.com>
> Signed-off-by: Shivnandan Kumar <quic_kshivnan@quicinc.com>
> Co-developed-by: Ramakrishna Gottimukkula <quic_rgottimu@quicinc.com>
> Signed-off-by: Ramakrishna Gottimukkula <quic_rgottimu@quicinc.com>
> Co-developed-by: Amir Vajid <avajid@quicinc.com>
> Signed-off-by: Amir Vajid <avajid@quicinc.com>
> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
> ---
> 
> v3:
> * Add missing enum in the scmi memlat driver and fix documentation [Konrad]
> * Add checks for max memory and monitor [Shivnandan]
> * Fix typo from START_TIMER -> STOP_TIMER [Shivnandan]
> * Make populate_physical_mask func to void [Shivnandan]
> * Remove unecessary zero set [Shivnandan]
> * Use __free(device node) in init_cpufreq-memfreqmap [Christian/Konrad]
> * Use sdev->dev.of_node directly [Christian]
> * use return dev_err_probe in multiple places [Christian]
> 
>  drivers/soc/qcom/Kconfig                   |  12 +
>  drivers/soc/qcom/Makefile                  |   1 +
>  drivers/soc/qcom/qcom_scmi_memlat_client.c | 569 +++++++++++++++++++++
>  3 files changed, 582 insertions(+)
>  create mode 100644 drivers/soc/qcom/qcom_scmi_memlat_client.c
> 
> diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
> index 74b9121240f8..1b6dd40d69ea 100644
> --- a/drivers/soc/qcom/Kconfig
> +++ b/drivers/soc/qcom/Kconfig
> @@ -295,4 +295,16 @@ config QCOM_PBS
>  	  This module provides the APIs to the client drivers that wants to send the
>  	  PBS trigger event to the PBS RAM.
>  
> +config QCOM_SCMI_MEMLAT_CLIENT
> +	tristate "Qualcomm Technologies Inc. SCMI client driver"
> +	depends on QCOM_SCMI_GENERIC_EXT || COMPILE_TEST
> +	help
> +	  This driver uses the MEMLAT (memory latency) algorithm string
> +	  hosted on QCOM SCMI Vendor Protocol to detect memory latency

How can it use the string to detect workloads? Most likely you mean something like "uses memlat extensions".
Also s/QCOM/Qualcomm/ in the help text.

> +	  workloads and control frequency/level of the various memory
> +	  buses (DDR/LLCC/DDR_QOS).
> +
> +	  This driver defines/documents the parameter IDs used while configuring
> +	  the memory buses.
> +
>  endmenu
> diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
> index acbca2ab5cc2..28549bb141bc 100644
> --- a/drivers/soc/qcom/Makefile
> +++ b/drivers/soc/qcom/Makefile
> @@ -36,6 +36,7 @@ obj-$(CONFIG_QCOM_APR) += apr.o
>  obj-$(CONFIG_QCOM_LLCC) += llcc-qcom.o
>  obj-$(CONFIG_QCOM_KRYO_L2_ACCESSORS) +=	kryo-l2-accessors.o
>  obj-$(CONFIG_QCOM_ICC_BWMON)	+= icc-bwmon.o
> +obj-$(CONFIG_QCOM_SCMI_MEMLAT_CLIENT)	+= qcom_scmi_memlat_client.o
>  qcom_ice-objs			+= ice.o
>  obj-$(CONFIG_QCOM_INLINE_CRYPTO_ENGINE)	+= qcom_ice.o
>  obj-$(CONFIG_QCOM_PBS) +=	qcom-pbs.o
> diff --git a/drivers/soc/qcom/qcom_scmi_memlat_client.c b/drivers/soc/qcom/qcom_scmi_memlat_client.c
> new file mode 100644
> index 000000000000..05198bf1f7ec
> --- /dev/null
> +++ b/drivers/soc/qcom/qcom_scmi_memlat_client.c
> @@ -0,0 +1,569 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#include <linux/cpu.h>
> +#include <linux/err.h>
> +#include <linux/errno.h>
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/scmi_protocol.h>
> +#include <linux/scmi_qcom_protocol.h>
> +#include <linux/units.h>
> +#include <dt-bindings/firmware/qcom,scmi-memlat.h>
> +
> +#define MEMLAT_ALGO_STR				0x4D454D4C4154 /* MEMLAT */
> +#define INVALID_IDX				0xff
> +#define MAX_MEMORY_TYPES			3
> +#define MAX_MONITOR_CNT				4
> +#define MAX_NAME_LEN				20
> +#define MAX_MAP_ENTRIES				7
> +#define CPUCP_DEFAULT_SAMPLING_PERIOD_MS	4
> +#define CPUCP_DEFAULT_FREQ_METHOD		1
> +
> +/**
> + * enum scmi_memlat_protocol_cmd - parameter_ids supported by the "MEMLAT" algo_str hosted
> + *                                 by the Qualcomm Generic Vendor Protocol on the SCMI controller.
> + *
> + * MEMLAT (Memory Latency) monitors the counters to detect memory latency bound workloads
> + * and scales the frequency/levels of the memory buses accordingly.
> + *
> + * @MEMLAT_SET_MEM_GROUP: initializes the frequency/level scaling functions for the memory bus.
> + * @MEMLAT_SET_MONITOR: configures the monitor to work on a specific memory bus.
> + * @MEMLAT_SET_COMMON_EV_MAP: set up common counters used to monitor the cpu frequency.
> + * @MEMLAT_SET_GRP_EV_MAP: set up any specific counters used to monitor the memory bus.
> + * @MEMLAT_IPM_CEIL: set the IPM (Instruction Per Misses) ceiling per monitor.
> + * @MEMLAT_SAMPLE_MS: set the sampling period for all the monitors.
> + * @MEMLAT_MON_FREQ_MAP: setup the cpufreq to memfreq map.
> + * @MEMLAT_SET_MIN_FREQ: set the max frequency of the memory bus.
> + * @MEMLAT_SET_MAX_FREQ: set the min frequency of the memory bus.
> + * @MEMLAT_START_TIMER: start all the monitors with the requested sampling period.
> + * @MEMLAT_STOP_TIMER: stop all the running monitors.
> + * @MEMLAT_SET_EFFECTIVE_FREQ_METHOD: set the method used to determine cpu frequency.
> + */
> +enum scmi_memlat_protocol_cmd {
> +	MEMLAT_SET_MEM_GROUP = 16,
> +	MEMLAT_SET_MONITOR,
> +	MEMLAT_SET_COMMON_EV_MAP,
> +	MEMLAT_SET_GRP_EV_MAP,
> +	MEMLAT_IPM_CEIL = 23,
> +	MEMLAT_SAMPLE_MS = 31,
> +	MEMLAT_MON_FREQ_MAP,
> +	MEMLAT_SET_MIN_FREQ,
> +	MEMLAT_SET_MAX_FREQ,
> +	MEMLAT_START_TIMER = 36,
> +	MEMLAT_STOP_TIMER,
> +	MEMLAT_SET_EFFECTIVE_FREQ_METHOD = 39,
> +};
> +
> +struct map_table {
> +	u16 v1;
> +	u16 v2;

Huh? Why can't it be cpufreq and memfreq with some suffix?

> +};
> +
> +struct map_param_msg {
> +	u32 hw_type;
> +	u32 mon_idx;
> +	u32 nr_rows;
> +	struct map_table tbl[MAX_MAP_ENTRIES];
> +} __packed;
> +
> +struct node_msg {
> +	u32 cpumask;
> +	u32 hw_type;
> +	u32 mon_type;
> +	u32 mon_idx;
> +	char mon_name[MAX_NAME_LEN];
> +};
> +
> +struct scalar_param_msg {
> +	u32 hw_type;
> +	u32 mon_idx;
> +	u32 val;
> +};
> +
> +enum common_ev_idx {
> +	INST_IDX,
> +	CYC_IDX,
> +	CONST_CYC_IDX,
> +	FE_STALL_IDX,
> +	BE_STALL_IDX,
> +	NUM_COMMON_EVS
> +};
> +
> +enum grp_ev_idx {
> +	MISS_IDX,
> +	WB_IDX,
> +	ACC_IDX,
> +	NUM_GRP_EVS
> +};
> +
> +#define EV_CPU_CYCLES		0
> +#define EV_INST_RETIRED		2
> +#define EV_L2_D_RFILL		5
> +
> +struct ev_map_msg {
> +	u32 num_evs;
> +	u32 hw_type;
> +	u32 cid[NUM_COMMON_EVS];
> +};
> +
> +struct cpufreq_memfreq_map {
> +	unsigned int cpufreq_mhz;
> +	unsigned int memfreq_khz;
> +};
> +
> +struct scmi_monitor_info {
> +	struct cpufreq_memfreq_map *freq_map;
> +	char mon_name[MAX_NAME_LEN];
> +	u32 mon_idx;
> +	u32 mon_type;
> +	u32 ipm_ceil;
> +	u32 mask;
> +	u32 freq_map_len;
> +};
> +
> +struct scmi_memory_info {
> +	struct scmi_monitor_info *monitor[MAX_MONITOR_CNT];
> +	u32 hw_type;
> +	int monitor_cnt;
> +	u32 min_freq;
> +	u32 max_freq;
> +};
> +
> +struct scmi_memlat_info {
> +	struct scmi_protocol_handle *ph;
> +	const struct qcom_generic_ext_ops *ops;
> +	struct scmi_memory_info *memory[MAX_MEMORY_TYPES];
> +	u32 cluster_info[NR_CPUS];
> +	int memory_cnt;
> +};
> +
> +static int populate_cluster_info(u32 *cluster_info)
> +{
> +	char name[MAX_NAME_LEN];
> +	int i = 0;
> +
> +	struct device_node *cn __free(device_node) = of_find_node_by_path("/cpus");
> +	if (!cn)
> +		return -ENODEV;
> +
> +	struct device_node *map __free(device_node) = of_get_child_by_name(cn, "cpu-map");
> +	if (!map)
> +		return -ENODEV;
> +
> +	do {
> +		snprintf(name, sizeof(name), "cluster%d", i);
> +		struct device_node *c __free(device_node) = of_get_child_by_name(map, name);
> +		if (!c)
> +			break;
> +
> +		*(cluster_info + i) = of_get_child_count(c);
> +		i++;
> +	} while (1);

Can you use existing API from drivers/base/arch_topology.c? If not, can
it be extended to support your usecase?

> +
> +	return 0;
> +}
> +
> +static void populate_physical_mask(struct device_node *np, u32 *mask, u32 *cluster_info)
> +{
> +	struct device_node *dev_phandle __free(device_node);
> +	int cpu, i = 0, physical_id;
> +
> +	do {
> +		dev_phandle = of_parse_phandle(np, "cpus", i++);
> +		cpu = of_cpu_node_to_id(dev_phandle);
> +		if (cpu != -ENODEV) {
> +			physical_id = topology_core_id(cpu);
> +			for (int j = 0; j < topology_cluster_id(cpu); j++)
> +				physical_id += *(cluster_info + j);
> +			*mask |= BIT(physical_id);
> +		}
> +	} while (dev_phandle);
> +}
> +
> +static struct cpufreq_memfreq_map *init_cpufreq_memfreq_map(struct device *dev,
> +							    struct scmi_memory_info *memory,
> +							    struct device_node *of_node,
> +							    u32 *cnt)
> +{
> +	struct device_node *tbl_np __free(device_node), *opp_np __free(device_node);
> +	struct cpufreq_memfreq_map *tbl;
> +	int ret, i = 0;
> +	u32 level, len;
> +	u64 rate;
> +
> +	tbl_np = of_parse_phandle(of_node, "operating-points-v2", 0);

Please use existing API to parse OPP tables or document a reason why it
can't be used.

> +	if (!tbl_np)
> +		return ERR_PTR(-ENODEV);
> +
> +	len = min(of_get_available_child_count(tbl_np), MAX_MAP_ENTRIES);
> +	if (len == 0)
> +		return ERR_PTR(-ENODEV);
> +
> +	tbl = devm_kzalloc(dev, (len + 1) * sizeof(struct cpufreq_memfreq_map),
> +			   GFP_KERNEL);
> +	if (!tbl)
> +		return ERR_PTR(-ENOMEM);
> +
> +	for_each_available_child_of_node(tbl_np, opp_np) {
> +		ret = of_property_read_u64_index(opp_np, "opp-hz", 0, &rate);
> +		if (ret < 0)
> +			return ERR_PTR(ret);
> +
> +		tbl[i].cpufreq_mhz = rate / HZ_PER_MHZ;
> +
> +		if (memory->hw_type != QCOM_MEM_TYPE_DDR_QOS) {
> +			ret = of_property_read_u64_index(opp_np, "opp-hz", 1, &rate);
> +			if (ret < 0)
> +				return ERR_PTR(ret);
> +
> +			tbl[i].memfreq_khz = rate / HZ_PER_KHZ;
> +		} else {
> +			ret = of_property_read_u32(opp_np, "opp-level", &level);
> +			if (ret < 0)
> +				return ERR_PTR(ret);
> +
> +			tbl[i].memfreq_khz = level;
> +		}
> +
> +		dev_dbg(dev, "Entry%d CPU:%u, Mem:%u\n", i, tbl[i].cpufreq_mhz, tbl[i].memfreq_khz);
> +		i++;
> +	}
> +	*cnt = len;
> +
> +	return tbl;
> +}
> +
> +static int process_scmi_memlat_of_node(struct scmi_device *sdev, struct scmi_memlat_info *info)
> +{
> +	struct scmi_monitor_info *monitor;
> +	struct scmi_memory_info *memory;
> +	char name[MAX_NAME_LEN];
> +	u64 memfreq[2];
> +	int ret;
> +
> +	ret = populate_cluster_info(info->cluster_info);
> +	if (ret < 0) {
> +		dev_err_probe(&sdev->dev, ret, "failed to populate cluster info\n");
> +		goto err;
> +	}
> +
> +	of_node_get(sdev->dev.of_node);
> +	do {
> +		snprintf(name, sizeof(name), "memory-%d", info->memory_cnt);
> +		struct device_node *memory_np __free(device_node) =
> +			of_find_node_by_name(sdev->dev.of_node, name);
> +
> +		if (!memory_np)
> +			break;
> +
> +		if (info->memory_cnt >= MAX_MEMORY_TYPES)
> +			return dev_err_probe(&sdev->dev, -EINVAL,
> +					     "failed to parse unsupported memory type\n");
> +
> +		memory = devm_kzalloc(&sdev->dev, sizeof(*memory), GFP_KERNEL);
> +		if (!memory) {
> +			ret = -ENOMEM;
> +			goto err;
> +		}
> +
> +		ret = of_property_read_u32(memory_np, "qcom,memory-type", &memory->hw_type);
> +		if (ret) {
> +			dev_err_probe(&sdev->dev, ret, "failed to read memory type\n");
> +			goto err;
> +		}
> +
> +		ret = of_property_read_u64_array(memory_np, "freq-table-hz", memfreq, 2);
> +		if (ret && (ret != -EINVAL)) {
> +			dev_err_probe(&sdev->dev, ret, "failed to read min/max freq\n");
> +			goto err;
> +		}

Can we get this information from the OPP table instead?

> +
> +		if (memory->hw_type != QCOM_MEM_TYPE_DDR_QOS) {
> +			memory->min_freq = memfreq[0] / HZ_PER_KHZ;
> +			memory->max_freq = memfreq[1] / HZ_PER_KHZ;
> +		} else {
> +			memory->min_freq = memfreq[0];
> +			memory->max_freq = memfreq[1];

Why? At least invert the logic here, please. The DDR_QOS is a special
case, not all other kinds of memory.

> +		}
> +		info->memory[info->memory_cnt++] = memory;
> +
> +		do {
> +			snprintf(name, sizeof(name), "monitor-%d", memory->monitor_cnt);
> +			struct device_node *monitor_np __free(device_node) =
> +				of_get_child_by_name(memory_np, name);
> +
> +			if (!monitor_np)
> +				break;
> +
> +			if (memory->monitor_cnt >= MAX_MONITOR_CNT)

Why do you need to limit it? Is it a protocol limitation or an
artificial driver limitation? Can monitors be allocated dynamically?

> +				return dev_err_probe(&sdev->dev, -EINVAL,
> +						     "failed to parse unsupported monitor\n");
> +
> +			monitor = devm_kzalloc(&sdev->dev, sizeof(*monitor), GFP_KERNEL);
> +			if (!monitor) {
> +				ret = -ENOMEM;
> +				goto err;
> +			}
> +
> +			monitor->mon_type = of_property_read_bool(monitor_np, "qcom,compute-type");
> +			if (!monitor->mon_type) {
> +				ret = of_property_read_u32(monitor_np, "qcom,ipm-ceil",
> +							   &monitor->ipm_ceil);
> +				if (ret) {
> +					dev_err_probe(&sdev->dev, ret,
> +						      "failed to read IPM ceiling\n");
> +					goto err;
> +				}
> +			}
> +
> +			/*
> +			 * Variants of the SoC having reduced number of cpus operate
> +			 * with the same number of logical cpus but the physical
> +			 * cpu disabled will differ between parts. Calculate the
> +			 * physical cpu number using cluster information instead.
> +			 */
> +			populate_physical_mask(monitor_np, &monitor->mask, info->cluster_info);
> +
> +			monitor->freq_map = init_cpufreq_memfreq_map(&sdev->dev, memory, monitor_np,
> +								     &monitor->freq_map_len);
> +			if (IS_ERR(monitor->freq_map)) {
> +				dev_err_probe(&sdev->dev, PTR_ERR(monitor->freq_map),
> +					      "failed to populate cpufreq-memfreq map\n");
> +				goto err;
> +			}
> +
> +			strscpy(monitor->mon_name, name, sizeof(monitor->mon_name));
> +			monitor->mon_idx = memory->monitor_cnt;
> +
> +			memory->monitor[memory->monitor_cnt++] = monitor;
> +		} while (1);
> +
> +		if (!memory->monitor_cnt) {
> +			ret = -EINVAL;
> +			dev_err_probe(&sdev->dev, ret, "failed to find monitor nodes\n");
> +			goto err;
> +		}
> +	} while (1);
> +
> +	if (!info->memory_cnt) {
> +		ret = -EINVAL;
> +		dev_err_probe(&sdev->dev, ret, "failed to find memory nodes\n");
> +	}
> +
> +err:
> +	of_node_put(sdev->dev.of_node);
> +
> +	return ret;
> +}
> +
> +static int configure_cpucp_common_events(struct scmi_memlat_info *info)
> +{
> +	const struct qcom_generic_ext_ops *ops = info->ops;
> +	u8 ev_map[NUM_COMMON_EVS];
> +	struct ev_map_msg msg;
> +
> +	memset(ev_map, 0xFF, NUM_COMMON_EVS);
> +
> +	msg.num_evs = NUM_COMMON_EVS;
> +	msg.hw_type = INVALID_IDX;
> +	msg.cid[INST_IDX] = EV_INST_RETIRED;
> +	msg.cid[CYC_IDX] = EV_CPU_CYCLES;
> +	msg.cid[CONST_CYC_IDX] = INVALID_IDX;
> +	msg.cid[FE_STALL_IDX] = INVALID_IDX;
> +	msg.cid[BE_STALL_IDX] = INVALID_IDX;
> +
> +	return ops->set_param(info->ph, &msg, sizeof(msg), MEMLAT_ALGO_STR,
> +			      MEMLAT_SET_COMMON_EV_MAP);
> +}
> +
> +static int configure_cpucp_grp(struct device *dev, struct scmi_memlat_info *info, int memory_index)
> +{
> +	const struct qcom_generic_ext_ops *ops = info->ops;
> +	struct scmi_memory_info *memory = info->memory[memory_index];
> +	struct ev_map_msg ev_msg;
> +	u8 ev_map[NUM_GRP_EVS];
> +	struct node_msg msg;
> +	int ret;
> +
> +	msg.cpumask = 0;
> +	msg.hw_type = memory->hw_type;
> +	msg.mon_type = 0;
> +	msg.mon_idx = 0;
> +	ret = ops->set_param(info->ph, &msg, sizeof(msg), MEMLAT_ALGO_STR, MEMLAT_SET_MEM_GROUP);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "failed to configure mem type %d\n",
> +				     memory->hw_type);
> +
> +	memset(ev_map, 0xFF, NUM_GRP_EVS);
> +	ev_msg.num_evs = NUM_GRP_EVS;
> +	ev_msg.hw_type = memory->hw_type;
> +	ev_msg.cid[MISS_IDX] = EV_L2_D_RFILL;
> +	ev_msg.cid[WB_IDX] = INVALID_IDX;
> +	ev_msg.cid[ACC_IDX] = INVALID_IDX;
> +	ret = ops->set_param(info->ph, &ev_msg, sizeof(ev_msg), MEMLAT_ALGO_STR,
> +			     MEMLAT_SET_GRP_EV_MAP);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "failed to configure event map for mem type %d\n",
> +				     memory->hw_type);
> +
> +	return ret;
> +}
> +
> +static int configure_cpucp_mon(struct device *dev, struct scmi_memlat_info *info,
> +			       int memory_index, int monitor_index)
> +{
> +	const struct qcom_generic_ext_ops *ops = info->ops;
> +	struct scmi_memory_info *memory = info->memory[memory_index];
> +	struct scmi_monitor_info *monitor = memory->monitor[monitor_index];
> +	struct scalar_param_msg scalar_msg;
> +	struct map_param_msg map_msg;
> +	struct node_msg msg;
> +	int ret;
> +	int i;
> +
> +	msg.cpumask = monitor->mask;
> +	msg.hw_type = memory->hw_type;
> +	msg.mon_type = monitor->mon_type;
> +	msg.mon_idx = monitor->mon_idx;
> +	strscpy(msg.mon_name, monitor->mon_name, sizeof(msg.mon_name));
> +	ret = ops->set_param(info->ph, &msg, sizeof(msg), MEMLAT_ALGO_STR, MEMLAT_SET_MONITOR);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "failed to configure monitor %s\n",
> +				     monitor->mon_name);
> +
> +	scalar_msg.hw_type = memory->hw_type;
> +	scalar_msg.mon_idx = monitor->mon_idx;
> +	scalar_msg.val = monitor->ipm_ceil;
> +	ret = ops->set_param(info->ph, &scalar_msg, sizeof(scalar_msg), MEMLAT_ALGO_STR,
> +			     MEMLAT_IPM_CEIL);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "failed to set ipm ceil for %s\n",
> +				     monitor->mon_name);
> +
> +	map_msg.hw_type = memory->hw_type;
> +	map_msg.mon_idx = monitor->mon_idx;
> +	map_msg.nr_rows = monitor->freq_map_len;
> +	for (i = 0; i < monitor->freq_map_len; i++) {
> +		map_msg.tbl[i].v1 = monitor->freq_map[i].cpufreq_mhz;
> +		map_msg.tbl[i].v2 = monitor->freq_map[i].memfreq_khz;
> +	}
> +	ret = ops->set_param(info->ph, &map_msg, sizeof(map_msg), MEMLAT_ALGO_STR,
> +			     MEMLAT_MON_FREQ_MAP);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "failed to configure freq_map for %s\n",
> +				     monitor->mon_name);
> +
> +	scalar_msg.hw_type = memory->hw_type;
> +	scalar_msg.mon_idx = monitor->mon_idx;
> +	scalar_msg.val = memory->min_freq;
> +	ret = ops->set_param(info->ph, &scalar_msg, sizeof(scalar_msg), MEMLAT_ALGO_STR,
> +			     MEMLAT_SET_MIN_FREQ);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "failed to set min_freq for %s\n",
> +				     monitor->mon_name);
> +
> +	scalar_msg.hw_type = memory->hw_type;
> +	scalar_msg.mon_idx = monitor->mon_idx;
> +	scalar_msg.val = memory->max_freq;
> +	ret = ops->set_param(info->ph, &scalar_msg, sizeof(scalar_msg), MEMLAT_ALGO_STR,
> +			     MEMLAT_SET_MAX_FREQ);
> +	if (ret < 0)
> +		dev_err_probe(dev, ret, "failed to set max_freq for %s\n", monitor->mon_name);
> +
> +	return ret;
> +}
> +
> +static int cpucp_memlat_init(struct scmi_device *sdev)
> +{
> +	const struct scmi_handle *handle = sdev->handle;
> +	const struct qcom_generic_ext_ops *ops;
> +	struct scmi_protocol_handle *ph;
> +	struct scmi_memlat_info *info;
> +	u32 cpucp_freq_method = CPUCP_DEFAULT_FREQ_METHOD;
> +	u32 cpucp_sample_ms = CPUCP_DEFAULT_SAMPLING_PERIOD_MS;
> +	int ret, i, j;
> +
> +	if (!handle)
> +		return -ENODEV;
> +
> +	ops = handle->devm_protocol_get(sdev, SCMI_PROTOCOL_QCOM_GENERIC, &ph);
> +	if (IS_ERR(ops))
> +		return PTR_ERR(ops);
> +
> +	info = devm_kzalloc(&sdev->dev, sizeof(*info), GFP_KERNEL);
> +	if (!info)
> +		return -ENOMEM;
> +
> +	ret = process_scmi_memlat_of_node(sdev, info);
> +	if (ret)
> +		return ret;
> +
> +	info->ph = ph;
> +	info->ops = ops;
> +
> +	/* Configure common events ids */
> +	ret = configure_cpucp_common_events(info);
> +	if (ret < 0)
> +		return dev_err_probe(&sdev->dev, ret, "failed to configure common events\n");
> +
> +	for (i = 0; i < info->memory_cnt; i++) {
> +		/* Configure per group parameters */
> +		ret = configure_cpucp_grp(&sdev->dev, info, i);
> +		if (ret < 0)
> +			return ret;
> +
> +		for (j = 0; j < info->memory[i]->monitor_cnt; j++) {
> +			/* Configure per monitor parameters */
> +			ret = configure_cpucp_mon(&sdev->dev, info, i, j);
> +			if (ret < 0)
> +				return ret;
> +		}
> +	}
> +
> +	/* Set loop sampling time */
> +	ret = ops->set_param(ph, &cpucp_sample_ms, sizeof(cpucp_sample_ms), MEMLAT_ALGO_STR,
> +			     MEMLAT_SAMPLE_MS);
> +	if (ret < 0)
> +		return dev_err_probe(&sdev->dev, ret, "failed to set sample_ms\n");
> +
> +	/* Set the effective cpu frequency calculation method */
> +	ret = ops->set_param(ph, &cpucp_freq_method, sizeof(cpucp_freq_method), MEMLAT_ALGO_STR,
> +			     MEMLAT_SET_EFFECTIVE_FREQ_METHOD);
> +	if (ret < 0)
> +		return dev_err_probe(&sdev->dev, ret,
> +				     "failed to set effective frequency calc method\n");
> +
> +	/* Start sampling and voting timer */
> +	ret = ops->start_activity(ph, NULL, 0, MEMLAT_ALGO_STR, MEMLAT_START_TIMER);
> +	if (ret < 0)
> +		dev_err_probe(&sdev->dev, ret, "failed to start memory group timer\n");
> +
> +	return ret;
> +}
> +
> +static int scmi_client_probe(struct scmi_device *sdev)
> +{
> +	return cpucp_memlat_init(sdev);

Inline it here, please.

> +}
> +
> +static const struct scmi_device_id scmi_id_table[] = {
> +	{ SCMI_PROTOCOL_QCOM_GENERIC, "qcom-generic-ext" },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(scmi, scmi_id_table);
> +
> +static struct scmi_driver qcom_scmi_client_drv = {
> +	.name		= "scmi-qcom-generic-ext-memlat",
> +	.probe		= scmi_client_probe,
> +	.id_table	= scmi_id_table,
> +};
> +module_scmi_driver(qcom_scmi_client_drv);
> +
> +MODULE_DESCRIPTION("QTI SCMI client driver");
> +MODULE_LICENSE("GPL");
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

