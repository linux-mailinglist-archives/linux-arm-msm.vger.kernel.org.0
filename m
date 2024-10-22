Return-Path: <linux-arm-msm+bounces-35353-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 226A69A9B16
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 09:32:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A792E1F235F9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 07:32:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26EDA149C41;
	Tue, 22 Oct 2024 07:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="kO8k24to"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DCFE13AD0;
	Tue, 22 Oct 2024 07:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729582323; cv=none; b=iKzZfuE/qlkax1mumtyXGsUuC6mCsxazVNXRUUXyCNpWKC0CfswxopI7C+Jl3huuSgthLIi2bfAA72+DV19zieETfsg9vYqBQSN4EfQn9ofz/r59cW9GRM7JwHNoIpMtZrXq2nOZxKMWbl0rjhCiwuBP31XzwaOMuAjHWFg8TYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729582323; c=relaxed/simple;
	bh=/SOKiUxvhkFFzKb8lRJJtcOEWzsipI2bOCLNBLZCWWM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=QYx8yoipjTAn5xwuXPrcii267oJ2E5sPEsmbKN1FR4Pz9KZRGy4ZwaLyxcfBLwUU566gyMa4gwyxaFHJ4IGeVLkT4DUH0HeWfkI7Zuy+XLbAm2mNaQA6bu/pLB8Gib7HCBnqx14Tp1cP7l8T6wjqDKypciCj/4b5aKWsyi4zkEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=kO8k24to; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49LM7660002608;
	Tue, 22 Oct 2024 07:31:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O6vp5IphGSqC+dJNh2eGkFs8j8pWNxY1beFW91hPfWE=; b=kO8k24to7nCK0xgv
	AefHliyvJuBcwLosNaBhPiLUvwTQdrdBFiH055v/3hhksy6q9LaKeGP5aAjhwr7r
	ox4DP/s40VDvcm2D9Nq1Q5wULv/0XAhUAe3baGClP5hW0jmiWBgHwb8PuqcOR1OG
	F47sfJwP3A0QvExlSJHJC+5HSuPZ9/0oU2JLbnaTbbAXsuAA+MJh9jn7AYcD+qoe
	+Bdd1ja0mCQVM7rFGqRm5S9isETfdxKBOEQ+ORYMLPb2XsN2N6uiaXFytQec5tbY
	o8s1VyzN/s6OfAEMMD6hPSyGRdhwKM8OjdOoiwVjGLh5kQRWlKC0s6pbJulu8zsL
	EfLh3w==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42c6vxyc4y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Oct 2024 07:31:43 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49M7Vheb023967
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Oct 2024 07:31:43 GMT
Received: from [10.131.33.37] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 22 Oct
 2024 00:31:38 -0700
Message-ID: <99369331-bdb4-e714-aeb6-54e2d2c68dda@quicinc.com>
Date: Tue, 22 Oct 2024 13:01:35 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH V4 4/5] soc: qcom: Introduce SCMI based Memlat (Memory
 Latency) governor
Content-Language: en-US
To: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
CC: <sudeep.holla@arm.com>, <cristian.marussi@arm.com>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <quic_rgottimu@quicinc.com>,
        <quic_kshivnan@quicinc.com>, <conor+dt@kernel.org>,
        <arm-scmi@vger.kernel.org>, Amir Vajid <avajid@quicinc.com>
References: <20241007061023.1978380-1-quic_sibis@quicinc.com>
 <20241007061023.1978380-5-quic_sibis@quicinc.com>
 <20241010131812.0000566b@Huawei.com>
From: Sibi Sankar <quic_sibis@quicinc.com>
In-Reply-To: <20241010131812.0000566b@Huawei.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: sVvX1Hy00pGlqSOALTt2tqd4j0M-zcS8
X-Proofpoint-GUID: sVvX1Hy00pGlqSOALTt2tqd4j0M-zcS8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 clxscore=1011 malwarescore=0 mlxlogscore=999 bulkscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410220048



On 10/10/24 17:48, Jonathan Cameron wrote:
> On Mon, 7 Oct 2024 11:40:22 +0530
> Sibi Sankar <quic_sibis@quicinc.com> wrote:
> 
>> Introduce a client driver that uses the memlat algorithm string
>> hosted on QCOM SCMI Generic Extension Protocol to detect memory
>> latency workloads and control frequency/level of the various
>> memory buses (DDR/LLCC/DDR_QOS).
>>
>> Co-developed-by: Shivnandan Kumar <quic_kshivnan@quicinc.com>
>> Signed-off-by: Shivnandan Kumar <quic_kshivnan@quicinc.com>
>> Co-developed-by: Ramakrishna Gottimukkula <quic_rgottimu@quicinc.com>
>> Signed-off-by: Ramakrishna Gottimukkula <quic_rgottimu@quicinc.com>
>> Co-developed-by: Amir Vajid <avajid@quicinc.com>
>> Signed-off-by: Amir Vajid <avajid@quicinc.com>
>> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
> I was curious. A few comments from a quick read through.
> 
> Jonathan

Hey Jonathan,

Thanks for taking time to review the series!

Will get them all addressed in the next re-spin.

-Sibi

> 
>> diff --git a/drivers/soc/qcom/qcom_scmi_memlat_client.c b/drivers/soc/qcom/qcom_scmi_memlat_client.c
>> new file mode 100644
>> index 000000000000..05198bf1f7ec
>> --- /dev/null
>> +++ b/drivers/soc/qcom/qcom_scmi_memlat_client.c
> 
>> +static int populate_cluster_info(u32 *cluster_info)
>> +{
>> +	char name[MAX_NAME_LEN];
>> +	int i = 0;
>> +
>> +	struct device_node *cn __free(device_node) = of_find_node_by_path("/cpus");
>> +	if (!cn)
>> +		return -ENODEV;
>> +
>> +	struct device_node *map __free(device_node) = of_get_child_by_name(cn, "cpu-map");
>> +	if (!map)
>> +		return -ENODEV;
>> +
>> +	do {
> while(1) {
> } >> +		snprintf(name, sizeof(name), "cluster%d", i);
>> +		struct device_node *c __free(device_node) = of_get_child_by_name(map, name);
>> +		if (!c)
>> +			break;
>> +
>> +		*(cluster_info + i) = of_get_child_count(c);
>> +		i++;
>> +	} while (1);
>> +
>> +	return 0;
>> +}
>> +
> tic struct cpufreq_memfreq_map *init_cpufreq_memfreq_map(struct device *dev,
>> +							    struct scmi_memory_info *memory,
>> +							    struct device_node *of_node,
>> +							    u32 *cnt)
>> +{
>> +	struct device_node *tbl_np __free(device_node), *opp_np __free(device_node);
>> +	struct cpufreq_memfreq_map *tbl;
>> +	int ret, i = 0;
>> +	u32 level, len;
>> +	u64 rate;
>> +
>> +	tbl_np = of_parse_phandle(of_node, "operating-points-v2", 0);
>> +	if (!tbl_np)
> 
> This will call the free on the uninitialzed opp_np above.
> Note this sort of path is why the constructor and destructor should always
> be together in the code.
> 
>> +		return ERR_PTR(-ENODEV);
>> +
>> +	len = min(of_get_available_child_count(tbl_np), MAX_MAP_ENTRIES);
>> +	if (len == 0)
>> +		return ERR_PTR(-ENODEV);
>> +
>> +	tbl = devm_kzalloc(dev, (len + 1) * sizeof(struct cpufreq_memfreq_map),
>> +			   GFP_KERNEL);
>> +	if (!tbl)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	for_each_available_child_of_node(tbl_np, opp_np) {
> 
> Why not scoped variant which will also solve the lifetime issue above.
> 
>> +		ret = of_property_read_u64_index(opp_np, "opp-hz", 0, &rate);
>> +		if (ret < 0)
>> +			return ERR_PTR(ret);
>> +
>> +		tbl[i].cpufreq_mhz = rate / HZ_PER_MHZ;
>> +
>> +		if (memory->hw_type != QCOM_MEM_TYPE_DDR_QOS) {
>> +			ret = of_property_read_u64_index(opp_np, "opp-hz", 1, &rate);
>> +			if (ret < 0)
>> +				return ERR_PTR(ret);
>> +
>> +			tbl[i].memfreq_khz = rate / HZ_PER_KHZ;
>> +		} else {
>> +			ret = of_property_read_u32(opp_np, "opp-level", &level);
>> +			if (ret < 0)
>> +				return ERR_PTR(ret);
>> +
>> +			tbl[i].memfreq_khz = level;
>> +		}
>> +
>> +		dev_dbg(dev, "Entry%d CPU:%u, Mem:%u\n", i, tbl[i].cpufreq_mhz, tbl[i].memfreq_khz);
>> +		i++;
>> +	}
>> +	*cnt = len;
>> +
>> +	return tbl;
>> +}
>> +
>> +static int process_scmi_memlat_of_node(struct scmi_device *sdev, struct scmi_memlat_info *info)
>> +{
>> +	struct scmi_monitor_info *monitor;
>> +	struct scmi_memory_info *memory;
>> +	char name[MAX_NAME_LEN];
>> +	u64 memfreq[2];
>> +	int ret;
>> +
>> +	ret = populate_cluster_info(info->cluster_info);
>> +	if (ret < 0) {
>> +		dev_err_probe(&sdev->dev, ret, "failed to populate cluster info\n");
>> +		goto err;
> putting a node you never got?
> 		return dev_err_probe()
> 
> 
>> +	}
>> +
>> +	of_node_get(sdev->dev.of_node);
> Maybe use __free(device_node) here so you can do early returns on error.
> Will need a local variable for the return of of_node_get, but that would
> be nice anyway to simplify some parameters belwo.
> 
>> +	do {
> Might as well do while(1) {
> }
>> +		snprintf(name, sizeof(name), "memory-%d", info->memory_cnt);
>> +		struct device_node *memory_np __free(device_node) =
>> +			of_find_node_by_name(sdev->dev.of_node, name);
>> +
>> +		if (!memory_np)
>> +			break;
>> +
>> +		if (info->memory_cnt >= MAX_MEMORY_TYPES)
>> +			return dev_err_probe(&sdev->dev, -EINVAL,
>> +					     "failed to parse unsupported memory type\n");
>> +
>> +		memory = devm_kzalloc(&sdev->dev, sizeof(*memory), GFP_KERNEL);
>> +		if (!memory) {
>> +			ret = -ENOMEM;
>> +			goto err;
>> +		}
>> +
>> +		ret = of_property_read_u32(memory_np, "qcom,memory-type", &memory->hw_type);
>> +		if (ret) {
>> +			dev_err_probe(&sdev->dev, ret, "failed to read memory type\n");
>> +			goto err;
>> +		}
>> +
>> +		ret = of_property_read_u64_array(memory_np, "freq-table-hz", memfreq, 2);
>> +		if (ret && (ret != -EINVAL)) {
>> +			dev_err_probe(&sdev->dev, ret, "failed to read min/max freq\n");
>> +			goto err;
>> +		}
>> +
>> +		if (memory->hw_type != QCOM_MEM_TYPE_DDR_QOS) {
>> +			memory->min_freq = memfreq[0] / HZ_PER_KHZ;
>> +			memory->max_freq = memfreq[1] / HZ_PER_KHZ;
>> +		} else {
>> +			memory->min_freq = memfreq[0];
>> +			memory->max_freq = memfreq[1];
>> +		}
>> +		info->memory[info->memory_cnt++] = memory;
>> +
>> +		do {
>> +			snprintf(name, sizeof(name), "monitor-%d", memory->monitor_cnt);
>> +			struct device_node *monitor_np __free(device_node) =
>> +				of_get_child_by_name(memory_np, name);
>> +
>> +			if (!monitor_np)
>> +				break;
>> +
>> +			if (memory->monitor_cnt >= MAX_MONITOR_CNT)
>> +				return dev_err_probe(&sdev->dev, -EINVAL,
>> +						     "failed to parse unsupported monitor\n");
>> +
>> +			monitor = devm_kzalloc(&sdev->dev, sizeof(*monitor), GFP_KERNEL);
>> +			if (!monitor) {
>> +				ret = -ENOMEM;
>> +				goto err;
>> +			}
>> +
>> +			monitor->mon_type = of_property_read_bool(monitor_np, "qcom,compute-type");
>> +			if (!monitor->mon_type) {
>> +				ret = of_property_read_u32(monitor_np, "qcom,ipm-ceil",
>> +							   &monitor->ipm_ceil);
>> +				if (ret) {
>> +					dev_err_probe(&sdev->dev, ret,
>> +						      "failed to read IPM ceiling\n");
>> +					goto err;
>> +				}
>> +			}
>> +
>> +			/*
>> +			 * Variants of the SoC having reduced number of cpus operate
>> +			 * with the same number of logical cpus but the physical
>> +			 * cpu disabled will differ between parts. Calculate the
>> +			 * physical cpu number using cluster information instead.
>> +			 */
>> +			populate_physical_mask(monitor_np, &monitor->mask, info->cluster_info);
>> +
>> +			monitor->freq_map = init_cpufreq_memfreq_map(&sdev->dev, memory, monitor_np,
>> +								     &monitor->freq_map_len);
>> +			if (IS_ERR(monitor->freq_map)) {
>> +				dev_err_probe(&sdev->dev, PTR_ERR(monitor->freq_map),
>> +					      "failed to populate cpufreq-memfreq map\n");
>> +				goto err;
>> +			}
>> +
>> +			strscpy(monitor->mon_name, name, sizeof(monitor->mon_name));
>> +			monitor->mon_idx = memory->monitor_cnt;
>> +
>> +			memory->monitor[memory->monitor_cnt++] = monitor;
>> +		} while (1);
>> +
>> +		if (!memory->monitor_cnt) {
>> +			ret = -EINVAL;
>> +			dev_err_probe(&sdev->dev, ret, "failed to find monitor nodes\n");
>> +			goto err;
>> +		}
>> +	} while (1);
>> +
>> +	if (!info->memory_cnt) {
>> +		ret = -EINVAL;
>> +		dev_err_probe(&sdev->dev, ret, "failed to find memory nodes\n");
>> +	}
>> +
>> +err:
>> +	of_node_put(sdev->dev.of_node);
>> +
>> +	return ret;
>> +}
> 
> 
>> +
>> +static int cpucp_memlat_init(struct scmi_device *sdev)
>> +{
>> +	const struct scmi_handle *handle = sdev->handle;
>> +	const struct qcom_generic_ext_ops *ops;
>> +	struct scmi_protocol_handle *ph;
>> +	struct scmi_memlat_info *info;
>> +	u32 cpucp_freq_method = CPUCP_DEFAULT_FREQ_METHOD;
>> +	u32 cpucp_sample_ms = CPUCP_DEFAULT_SAMPLING_PERIOD_MS;
>> +	int ret, i, j;
>> +
>> +	if (!handle)
>> +		return -ENODEV;
>> +
>> +	ops = handle->devm_protocol_get(sdev, SCMI_PROTOCOL_QCOM_GENERIC, &ph);
>> +	if (IS_ERR(ops))
>> +		return PTR_ERR(ops);
>> +
>> +	info = devm_kzalloc(&sdev->dev, sizeof(*info), GFP_KERNEL);
> 
> I'd add a local variable
> 
> 	struct device *dev = &sdev->dev;
> given how many uses of this you have in this function.
> 
>> +	if (!info)
>> +		return -ENOMEM;
>> +
>> +	ret = process_scmi_memlat_of_node(sdev, info);
>> +	if (ret)
>> +		return ret;
>> +
>> +	info->ph = ph;
>> +	info->ops = ops;
>> +
>> +	/* Configure common events ids */
> As below.
>> +	ret = configure_cpucp_common_events(info);
>> +	if (ret < 0)
>> +		return dev_err_probe(&sdev->dev, ret, "failed to configure common events\n");
>> +
>> +	for (i = 0; i < info->memory_cnt; i++) {
>> +		/* Configure per group parameters */
> As below.
>> +		ret = configure_cpucp_grp(&sdev->dev, info, i);
>> +		if (ret < 0)
>> +			return ret;
>> +
>> +		for (j = 0; j < info->memory[i]->monitor_cnt; j++) {
>> +			/* Configure per monitor parameters */
> 
> I'd argue this and the above comment are clear from the function names
> so add no benefit, but not that important if you want to keep them anyway.
> Reasoning is that if a comment isn't providing more information it
> is an opportunity for bit rot in the longer run and bloats the code.
> Keep them for where they add more value.
> 
>> +			ret = configure_cpucp_mon(&sdev->dev, info, i, j);
>> +			if (ret < 0)
>> +				return ret;
>> +		}
>> +	}
> ...
> 
>> +}
>> +
>> +static int scmi_client_probe(struct scmi_device *sdev)
>> +{
>> +	return cpucp_memlat_init(sdev);
> What is benefit of this wrapper? I'd just use cpucp_memlat_init as the probe
> function.
> 
>> +}
>> +
>> +static const struct scmi_device_id scmi_id_table[] = {
> 
> Probably name this in a fashion related to the driver given
> maybe we'll have a namespace clash in future with such
> a generic name.
> 
>> +	{ SCMI_PROTOCOL_QCOM_GENERIC, "qcom-generic-ext" },
>> +	{ },
> No point in comma after a 'NULL' terminator like this.
> 
>> +};
>> +MODULE_DEVICE_TABLE(scmi, scmi_id_table);
>> +
>> +static struct scmi_driver qcom_scmi_client_drv = {
>> +	.name		= "scmi-qcom-generic-ext-memlat",
>> +	.probe		= scmi_client_probe,
>> +	.id_table	= scmi_id_table,
>> +};
>> +module_scmi_driver(qcom_scmi_client_drv);
>> +
>> +MODULE_DESCRIPTION("QTI SCMI client driver");
>> +MODULE_LICENSE("GPL");
> 

