Return-Path: <linux-arm-msm+bounces-35412-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EFCD9AA199
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 14:00:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 51C982830B8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 12:00:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59B7319D881;
	Tue, 22 Oct 2024 12:00:27 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA98419D071;
	Tue, 22 Oct 2024 12:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729598427; cv=none; b=etFdxhX/+1UKguvpFxK42OpmKE5LdJ2d6RhfiFBThbj11U24FM4o8WVFVFvzm1ryzOZ4TPr2rB4eJhh+JSQuigRn+ghaFj08W9T1C/50oa6fvQeHc9MaScZbRUXa+ieXKzZS1Im3zcXO5Im1Fr0tt8Y7tWucfppDtPyMOL/Mre4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729598427; c=relaxed/simple;
	bh=yxCUM6k+87wouGcLePOkGCF/ax0FIEz1VxC8bZNB3QA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eJNdd9w4o/py+C/Ndk1OWgwLeXnvh0PMpMT8yCt+0gjutY358dLwvkfAc8CuQIO/fpCztH8U6qEFxc2tPslP4NHyq/R+4RZzxNLAfA6zAeYYfe8/unTNe+pvN2f6SloyM2jsmy67egG2mVWN2xWVTgONGu7ZXdiRPSQssWaHPtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B8ED7497;
	Tue, 22 Oct 2024 05:00:52 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ADA303F71E;
	Tue, 22 Oct 2024 05:00:20 -0700 (PDT)
Date: Tue, 22 Oct 2024 13:00:18 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com, andersson@kernel.org,
	konrad.dybcio@linaro.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, quic_rgottimu@quicinc.com,
	quic_kshivnan@quicinc.com, conor+dt@kernel.org,
	arm-scmi@vger.kernel.org, Amir Vajid <avajid@quicinc.com>
Subject: Re: [PATCH V4 4/5] soc: qcom: Introduce SCMI based Memlat (Memory
 Latency) governor
Message-ID: <ZxeT0rl4LJP17LiE@pluto>
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

On Mon, Oct 07, 2024 at 11:40:22AM +0530, Sibi Sankar wrote:
> Introduce a client driver that uses the memlat algorithm string
> hosted on QCOM SCMI Generic Extension Protocol to detect memory
> latency workloads and control frequency/level of the various
> memory buses (DDR/LLCC/DDR_QOS).
> 

Hi,

a few small remarks, down below.

> Co-developed-by: Shivnandan Kumar <quic_kshivnan@quicinc.com>
> Signed-off-by: Shivnandan Kumar <quic_kshivnan@quicinc.com>
> Co-developed-by: Ramakrishna Gottimukkula <quic_rgottimu@quicinc.com>
> Signed-off-by: Ramakrishna Gottimukkula <quic_rgottimu@quicinc.com>
> Co-developed-by: Amir Vajid <avajid@quicinc.com>
> Signed-off-by: Amir Vajid <avajid@quicinc.com>
> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
> ---

[snip]

> +static int populate_cluster_info(u32 *cluster_info)
> +{
> +	char name[MAX_NAME_LEN];
> +	int i = 0;
> +
> +	struct device_node *cn __free(device_node) = of_find_node_by_path("/cpus");
> +	if (!cn)
> +		return -ENODEV;

Not sure if this is some new coding style accepted for the new cleanup.h
fancy stuff (sincere question/doubt...so please take this with a grain of salt),
BUT, if not, you should consider grouping this definition/initialization to
the start of the block whose scope they are in...like:


	struct device_node *cn __free(device_node) = of_find_node_by_path("/cpus");
	struct device_node *map __free(device_node) = NULL;
	char name[MAX_NAME_LEN];
	int i = 0;

	if (!cn)
		return -ENODEV;

	map = of_get_child_by_name(cn, "cpu-map");
	if (!map)
		return -ENODEV;

> +
> +	struct device_node *map __free(device_node) = of_get_child_by_name(cn, "cpu-map");
> +	if (!map)
> +		return -ENODEV;
> +

As said...

> +	do {
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
> +static void populate_physical_mask(struct device_node *np, u32 *mask, u32 *cluster_info)
> +{
> +	struct device_node *dev_phandle __free(device_node);

...so this cleanups on return....

> +	int cpu, i = 0, physical_id;
> +
> +	do {
> +		dev_phandle = of_parse_phandle(np, "cpus", i++);

BUT wont this be needed to be of_put, between calls to of_parse_phandle
inside this loop ? ... so cannot this be done like

	int cpu, i = 0, physical_id;

	while (1) {
		struct device_node *dev_phandle __free(device_node) = of_parse_phandle(np, "cpus", i++);
	
		if (!dev_phandle)
			break;

		cpu = of_cpu_node_to_id(dev_phandle);
		if (cpu != -ENODEV) {
			....
	}

...not even build tested ... ah... :P


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

This seems to lack a of+node_put at the end but possibly the scoped
version  for_each_available_child_of_node_scoped() will do it for you...

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

cant you use cleanup.h magic also for this and get rid of a few gotos down below ?
...this function seems the ideal case fot that...

> +	do {
> +		snprintf(name, sizeof(name), "memory-%d", info->memory_cnt);
> +		struct device_node *memory_np __free(device_node) =
> +			of_find_node_by_name(sdev->dev.of_node, name);
> +
> +		if (!memory_np)
> +			break;
> +
> +		if (info->memory_cnt >= MAX_MEMORY_TYPES)

Shouldn't the MAX_MEMORY_TYPES something discoverable at runtime through
some command of your vendor protocol ? for better future scalability I
mean...maybe I am overthinking... 

> +			return dev_err_probe(&sdev->dev, -EINVAL,
> +					     "failed to parse unsupported memory type\n");
> +
> +		memory = devm_kzalloc(&sdev->dev, sizeof(*memory), GFP_KERNEL);
> +		if (!memory) {
> +			ret = -ENOMEM;
> +			goto err;
> +		}
> +

Thanks,
Cristian

