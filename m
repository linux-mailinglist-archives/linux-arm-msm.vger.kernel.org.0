Return-Path: <linux-arm-msm+bounces-33851-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B259985BF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 14:18:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DFA0A1C21C9E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 12:18:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09FE71C3F2F;
	Thu, 10 Oct 2024 12:18:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA371C1757;
	Thu, 10 Oct 2024 12:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728562702; cv=none; b=fx/7d/ijnBAS6sWV+e6KixHOYExPRlH1llDhFBtv3b2q1LC0NW5GU4SS+FAWhXxyckqIlyIN0/ScL6CxnJtBvlThir9pX9xuT1qKkLmgYQmW9NPl994vScLgU4jegQTmILznUMEW/COP5lBMZngJQm7opBajase/CigR7PeJLfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728562702; c=relaxed/simple;
	bh=JNVB4kkruHlTAxVnW0w15975h+UfHocUYfQCALgwWeU=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BKk2kB0UHDGqT3MYmwekRXdUbs1F2JktPM73duk06usS5A/jt6+SebgmhwHCOoJ9D6glFe09l2Md5UQ6Mp9gIAX96CpcKtBpNXnggnnCWoMhrmq9zfm8mpGQgGxu69tiZJCnqOw/eFa4Tb/bTuTVZA2G7un65nXwHNg1irkWQl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4XPTJl30zvz67GZ3;
	Thu, 10 Oct 2024 20:16:55 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 3D1F7140B3C;
	Thu, 10 Oct 2024 20:18:16 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Thu, 10 Oct
 2024 14:18:15 +0200
Date: Thu, 10 Oct 2024 13:18:12 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Sibi Sankar <quic_sibis@quicinc.com>
CC: <sudeep.holla@arm.com>, <cristian.marussi@arm.com>,
	<andersson@kernel.org>, <konrad.dybcio@linaro.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <quic_rgottimu@quicinc.com>,
	<quic_kshivnan@quicinc.com>, <conor+dt@kernel.org>,
	<arm-scmi@vger.kernel.org>, Amir Vajid <avajid@quicinc.com>
Subject: Re: [PATCH V4 4/5] soc: qcom: Introduce SCMI based Memlat (Memory
 Latency) governor
Message-ID: <20241010131812.0000566b@Huawei.com>
In-Reply-To: <20241007061023.1978380-5-quic_sibis@quicinc.com>
References: <20241007061023.1978380-1-quic_sibis@quicinc.com>
	<20241007061023.1978380-5-quic_sibis@quicinc.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: lhrpeml500004.china.huawei.com (7.191.163.9) To
 frapeml500008.china.huawei.com (7.182.85.71)

On Mon, 7 Oct 2024 11:40:22 +0530
Sibi Sankar <quic_sibis@quicinc.com> wrote:

> Introduce a client driver that uses the memlat algorithm string
> hosted on QCOM SCMI Generic Extension Protocol to detect memory
> latency workloads and control frequency/level of the various
> memory buses (DDR/LLCC/DDR_QOS).
> 
> Co-developed-by: Shivnandan Kumar <quic_kshivnan@quicinc.com>
> Signed-off-by: Shivnandan Kumar <quic_kshivnan@quicinc.com>
> Co-developed-by: Ramakrishna Gottimukkula <quic_rgottimu@quicinc.com>
> Signed-off-by: Ramakrishna Gottimukkula <quic_rgottimu@quicinc.com>
> Co-developed-by: Amir Vajid <avajid@quicinc.com>
> Signed-off-by: Amir Vajid <avajid@quicinc.com>
> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
I was curious. A few comments from a quick read through.

Jonathan

> diff --git a/drivers/soc/qcom/qcom_scmi_memlat_client.c b/drivers/soc/qcom/qcom_scmi_memlat_client.c
> new file mode 100644
> index 000000000000..05198bf1f7ec
> --- /dev/null
> +++ b/drivers/soc/qcom/qcom_scmi_memlat_client.c

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
while(1) {
}
> +		snprintf(name, sizeof(name), "cluster%d", i);
> +		struct device_node *c __free(device_node) = of_get_child_by_name(map, name);
> +		if (!c)
> +			break;
> +
> +		*(cluster_info + i) = of_get_child_count(c);
> +		i++;
> +	} while (1);
> +
> +	return 0;
> +}
> +
tic struct cpufreq_memfreq_map *init_cpufreq_memfreq_map(struct device *dev,
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
> +	if (!tbl_np)

This will call the free on the uninitialzed opp_np above.
Note this sort of path is why the constructor and destructor should always
be together in the code.

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

Why not scoped variant which will also solve the lifetime issue above.

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
putting a node you never got?
		return dev_err_probe()


> +	}
> +
> +	of_node_get(sdev->dev.of_node);
Maybe use __free(device_node) here so you can do early returns on error.
Will need a local variable for the return of of_node_get, but that would
be nice anyway to simplify some parameters belwo.

> +	do {
Might as well do while(1) {
}
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
> +
> +		if (memory->hw_type != QCOM_MEM_TYPE_DDR_QOS) {
> +			memory->min_freq = memfreq[0] / HZ_PER_KHZ;
> +			memory->max_freq = memfreq[1] / HZ_PER_KHZ;
> +		} else {
> +			memory->min_freq = memfreq[0];
> +			memory->max_freq = memfreq[1];
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

I'd add a local variable

	struct device *dev = &sdev->dev;
given how many uses of this you have in this function.

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
As below.
> +	ret = configure_cpucp_common_events(info);
> +	if (ret < 0)
> +		return dev_err_probe(&sdev->dev, ret, "failed to configure common events\n");
> +
> +	for (i = 0; i < info->memory_cnt; i++) {
> +		/* Configure per group parameters */
As below.
> +		ret = configure_cpucp_grp(&sdev->dev, info, i);
> +		if (ret < 0)
> +			return ret;
> +
> +		for (j = 0; j < info->memory[i]->monitor_cnt; j++) {
> +			/* Configure per monitor parameters */

I'd argue this and the above comment are clear from the function names
so add no benefit, but not that important if you want to keep them anyway.
Reasoning is that if a comment isn't providing more information it
is an opportunity for bit rot in the longer run and bloats the code.
Keep them for where they add more value.

> +			ret = configure_cpucp_mon(&sdev->dev, info, i, j);
> +			if (ret < 0)
> +				return ret;
> +		}
> +	}
...

> +}
> +
> +static int scmi_client_probe(struct scmi_device *sdev)
> +{
> +	return cpucp_memlat_init(sdev);
What is benefit of this wrapper? I'd just use cpucp_memlat_init as the probe
function.

> +}
> +
> +static const struct scmi_device_id scmi_id_table[] = {

Probably name this in a fashion related to the driver given
maybe we'll have a namespace clash in future with such
a generic name.

> +	{ SCMI_PROTOCOL_QCOM_GENERIC, "qcom-generic-ext" },
> +	{ },
No point in comma after a 'NULL' terminator like this.

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


