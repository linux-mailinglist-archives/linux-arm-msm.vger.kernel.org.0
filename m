Return-Path: <linux-arm-msm+bounces-33330-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B4339992603
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 09:23:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2518D1F20FF1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 07:23:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 513C81741C6;
	Mon,  7 Oct 2024 07:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YmbS4Nod"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96ACD433BE;
	Mon,  7 Oct 2024 07:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728285801; cv=none; b=G6KY5/uYNnQcgYC0Xu8M7Hbmm+KwLePWHbWlj+SN/k9BlrxM+86Dsyxp2AtY0HPdVDFIxDYE1ZYdO+OayeE0lfSjLq8y9nkO621r60y7pVHcLXrT/tF63+jNMxSbt0/+wboCdR76kfMtcnFHm2TpD6KfEdZx5+QxD4gzvOsSP4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728285801; c=relaxed/simple;
	bh=GvBpSQzOXESGhV/x8XEJU5Qy8f9yp1IITFgLl0Bmdcw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=A6F9an9VLDzDWao9TLccmIFhnPw0ZJD7DBmkSncyFIntijgzvOuibQUN0Thlq7zcccR+nHeIxf0dBCcgjX84xiVXbitsgMclFQLdRWyn5sGAmKJFOWFYmIHwF5aT0OyVbauvHCsy2deRdGIbOGWguDQdNVrd7oEITEQYoJoj+f4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YmbS4Nod; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4974Sncb015089;
	Mon, 7 Oct 2024 07:22:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0JDJt5Q0je4jRf2z5Cuz81cI/CF+kYh0LlkwUpsDRVE=; b=YmbS4NodnHSXJyiq
	G6nKvNQr9sHmUY1KvAqJ9fp9r0+GwTLDI3i+hsDZFc3kHcYYV5RrhsW7ilcRg22u
	gpG2Gh+RO997jA+Ca18zAy7DWNKpgz88H7ziQsKsyAs21xySWVUMVq1agiYGXyHP
	J0oOFY91yzEECM28ycMK6AyaF8iQWitSHpJTdcq9DkTPGzZNKT8beVuPNr65z8Pg
	6RhnkFj9eLViiQ+Uk5Miqrm7fycbe/eXA9GoPnxuoPe6IzwlBmaGucvNAvsSkVTW
	b3bqXqpKcmboTaw/X6HzBmtAkIXmidPv4oWiKKfHJl6zf5+99sDhZbz5gBlWCqFN
	lngEMg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 422xs73a72-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Oct 2024 07:22:54 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4977MrVm000394
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 7 Oct 2024 07:22:53 GMT
Received: from [10.131.33.37] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 7 Oct 2024
 00:22:49 -0700
Message-ID: <32904576-e048-6858-a213-f00f92e9e434@quicinc.com>
Date: Mon, 7 Oct 2024 12:52:46 +0530
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
To: Konrad Dybcio <konrad.dybcio@linaro.org>, <sudeep.holla@arm.com>,
        <cristian.marussi@arm.com>, <andersson@kernel.org>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <quic_rgottimu@quicinc.com>, <quic_kshivnan@quicinc.com>,
        <conor+dt@kernel.org>, Amir Vajid <avajid@quicinc.com>
References: <20240702191440.2161623-1-quic_sibis@quicinc.com>
 <20240702191440.2161623-4-quic_sibis@quicinc.com>
 <54219ac8-45e2-49ea-b49d-d5304b8b7d94@linaro.org>
From: Sibi Sankar <quic_sibis@quicinc.com>
In-Reply-To: <54219ac8-45e2-49ea-b49d-d5304b8b7d94@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: xOczqBz53ILhNzQ-oWJ7WXG1pKJfExWX
X-Proofpoint-GUID: xOczqBz53ILhNzQ-oWJ7WXG1pKJfExWX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 mlxlogscore=999
 clxscore=1015 malwarescore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410070051



On 7/9/24 16:21, Konrad Dybcio wrote:
> On 2.07.2024 9:14 PM, Sibi Sankar wrote:
>> Introduce a client driver that uses the memlat algorithm string hosted
>> on ARM SCMI QCOM Vendor Protocol to detect memory latency workloads and
>> control frequency/level of the various memory buses (DDR/LLCC/DDR_QOS).
>>
>> Co-developed-by: Shivnandan Kumar <quic_kshivnan@quicinc.com>
>> Signed-off-by: Shivnandan Kumar <quic_kshivnan@quicinc.com>
>> Co-developed-by: Ramakrishna Gottimukkula <quic_rgottimu@quicinc.com>
>> Signed-off-by: Ramakrishna Gottimukkula <quic_rgottimu@quicinc.com>
>> Co-developed-by: Amir Vajid <avajid@quicinc.com>
>> Signed-off-by: Amir Vajid <avajid@quicinc.com>
>> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
>> ---
> 
> [...]
> 
>> +/**
>> + * scmi_memlat_protocol_cmd - parameter_ids supported by the "MEMLAT" algo_str hosted
>> + *                            by the Qualcomm SCMI Vendor Protocol on the SCMI controller.
> 
> 'enum scmi_mem..'
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
>> +		snprintf(name, sizeof(name), "cluster%d", i);
>> +		struct device_node *c __free(device_node) = of_get_child_by_name(map, name);
>> +		if (!c)
>> +			break;
>> +
>> +		*(cluster_info + i) = of_get_child_count(c);
>> +		i++;
>> +	} while (1);
> 
> of_cpu_device_node_get(0) + of_get_next_cpu_node() +
> of_get_cpu_hwid() & MPIDR_EL1.Aff2 [1]
> 
> [...]
> 
>> +static struct cpufreq_memfreq_map *init_cpufreq_memfreq_map(struct device *dev,
>> +							    struct scmi_memory_info *memory,
>> +							    struct device_node *of_node,
>> +							    u32 *cnt)
>> +{
>> +	struct device_node *tbl_np, *opp_np;
>> +	struct cpufreq_memfreq_map *tbl;
>> +	int ret, i = 0;
>> +	u32 level, len;
>> +	u64 rate;
>> +
>> +	tbl_np = of_parse_phandle(of_node, "operating-points-v2", 0);
>> +	if (!tbl_np)
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
>> +	tbl[i].cpufreq_mhz = 0;
> 
> missing of_node_put, or even better __free(device_node)
> 
> [...]
> 
>> +			/*
>> +			 * Variants of the SoC having reduced number of cpus operate
>> +			 * with the same number of logical cpus but the physical
>> +			 * cpu disabled will differ between parts. Calculate the
>> +			 * physical cpu number using cluster information instead.
>> +			 */
>> +			ret = populate_physical_mask(monitor_np, &monitor->mask,
>> +						     info->cluster_info);
>> +			if (ret < 0) {
>> +				dev_err_probe(&sdev->dev, ret, "failed to populate cpu mask\n");
>> +				goto err;
>> +			}
> 
> err.. the same number of logical CPUs? as in, PSCI will happily report that
> the inexistent cores have been booted? or some cores start doing some sort
> of hyperthreading to make up for the missing ones? this sounds sketchy..

Hey Konrad,

The problem we are describing here is about a scenario where the
bootloaders disable faulty cpus after reading fuse values by fixing
up the cpu node in the device tree by marking them as "failed". In
this case the logical cpu number of the cpus that booted up never
align with the physical numbers. Hence relying on any logical
number for this calculation doesn't work. Will address all your
other comments in v4.

-Sibi

> 
> Konrad

