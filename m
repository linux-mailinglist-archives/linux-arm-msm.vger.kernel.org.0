Return-Path: <linux-arm-msm+bounces-40484-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8959E5302
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 11:53:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 13832188257E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 10:53:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 724ED1DA605;
	Thu,  5 Dec 2024 10:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="irIcbT4W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59EB41C3F1C;
	Thu,  5 Dec 2024 10:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733396001; cv=none; b=hMvUDFsoc9PFNloJlmBCSavocY7zQ//b6xY22Oq6ALAKGsulskArU/19PFt8G8xLysmR3A6p9HYu87trkjF4GCLzm1bJZtUEfR+gBZFkXS+DKnhEMOitnpAX9/ATfsl8UVicfFZsFOwlKVZVnfsicwcfkcZ4BT6pzgZduIgCFhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733396001; c=relaxed/simple;
	bh=a/Do4E+VV/2p3Ylc8KEslGu0FL6eM+nBzKI5V2wGHfs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=OQM/rMTk/mwnez9y7NRr+hNLvNHjgM8aU7ihubPdu5vZsJYngxy9E9We5JiCfQOllzuGd9dI6CKCkZDS9Foz+iiAZw23pN+IrvNE81QQ5vissMscB5DAfP9e4kVHXL9ClZYzN3dBbkKfW/lnlwO9o48E8r24YjxpSlxQ7jSFWPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=irIcbT4W; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B57G3ua023332;
	Thu, 5 Dec 2024 10:53:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SzzzimWJ69J+Cvt60ogCWs5bF5csH8Giyfksf1VMcpg=; b=irIcbT4WMcl7dxxb
	4bkdT4ztwPFWkshM92pDQd4kDsbsGcR8h9xZlAKB5o7Z14EcSfVTP4/A0x02KrX8
	qui6WiZXuYLo/tSD8708lkL7PC6g4aV3TLSLQPOHUMV8+/9pL+WaNzAGGuAqYEEv
	vG4tWB5wK3TvJ6nJ0cVEiUptayTWpDa84xl1eWrPANJbIt38bmzxgd8tUyAS9hPk
	rcrDugCghCnDchUPW7afwdUKCHnooo6xfNRRKWtpzLkZvuJT0S+Wb7r00uB6FPUc
	Jy+zD/XchPfmz1V0u9S5tieAVrRYAttO4jzZaywifX5Dj1hSik7rfH+w8OGyukm4
	vQWhWw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43aj42bywe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Dec 2024 10:53:03 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B5Ar11f019290
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 5 Dec 2024 10:53:01 GMT
Received: from [10.190.163.187] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 5 Dec 2024
 02:52:56 -0800
Message-ID: <1f5258f4-7c20-5343-dec6-0847449c821b@quicinc.com>
Date: Thu, 5 Dec 2024 16:22:53 +0530
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
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <myungjoo.ham@samsung.com>, <Kyungmin.park@samsung.com>,
        <cw00.choi@samsung.com>, Viresh Kumar <viresh.kumar@linaro.org>,
        <sudeep.holla@arm.com>, <cristian.marussi@arm.com>,
        <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <quic_rgottimu@quicinc.com>, <quic_kshivnan@quicinc.com>,
        <conor+dt@kernel.org>, <arm-scmi@vger.kernel.org>,
        Amir Vajid <avajid@quicinc.com>
References: <20241007061023.1978380-1-quic_sibis@quicinc.com>
 <20241007061023.1978380-5-quic_sibis@quicinc.com>
 <2aycrvnvivcrqctqmweadcgenwugafdr6ub3bzkscterpenz32@bzabln2hkral>
 <29eef87e-96f6-5105-6f7a-a8e01efcb4a3@quicinc.com>
 <k4lpzxtrq3x6riyv6etxiobn7nbpczf2bp3m4oc752nhjknlit@uo53kbppzim7>
 <ac655bdc-5ccf-c6c6-3203-659f1916c53c@quicinc.com>
 <34p27za5hcpubaxjuddsir2vqnqrvwyesnclu2cocvm3yhbv3r@ak7rcnp67gyd>
From: Sibi Sankar <quic_sibis@quicinc.com>
In-Reply-To: <34p27za5hcpubaxjuddsir2vqnqrvwyesnclu2cocvm3yhbv3r@ak7rcnp67gyd>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: WZgUFsTKO_K_A5TcRUkzFyP3z9pUPkky
X-Proofpoint-ORIG-GUID: WZgUFsTKO_K_A5TcRUkzFyP3z9pUPkky
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 mlxscore=0 mlxlogscore=999 lowpriorityscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412050077



On 11/14/24 18:02, Dmitry Baryshkov wrote:
> On Thu, Nov 14, 2024 at 09:43:53AM +0530, Sibi Sankar wrote:
>>
>>
>> On 10/26/24 23:46, Dmitry Baryshkov wrote:
>>> On Tue, Oct 22, 2024 at 01:48:25PM +0530, Sibi Sankar wrote:
>>>>
>>>>
>>>> On 10/7/24 23:27, Dmitry Baryshkov wrote:
>>>>> On Mon, Oct 07, 2024 at 11:40:22AM GMT, Sibi Sankar wrote:
> 
>>>>>
>>>>>> +};
>>>>>> +
>>>>>> +struct map_param_msg {
>>>>>> +	u32 hw_type;
>>>>>> +	u32 mon_idx;
>>>>>> +	u32 nr_rows;
>>>>>> +	struct map_table tbl[MAX_MAP_ENTRIES];
>>>>>> +} __packed;
>>>>>> +
>>>>>> +struct node_msg {
>>>>>> +	u32 cpumask;
>>>>>> +	u32 hw_type;
>>>>>> +	u32 mon_type;
>>>>>> +	u32 mon_idx;
>>>>>> +	char mon_name[MAX_NAME_LEN];
>>>>>> +};
>>>>>> +
>>>>>> +struct scalar_param_msg {
>>>>>> +	u32 hw_type;
>>>>>> +	u32 mon_idx;
>>>>>> +	u32 val;
>>>>>> +};
>>>>>> +
>>>>>> +enum common_ev_idx {
>>>>>> +	INST_IDX,
>>>>>> +	CYC_IDX,
>>>>>> +	CONST_CYC_IDX,
>>>>>> +	FE_STALL_IDX,
>>>>>> +	BE_STALL_IDX,
>>>>>> +	NUM_COMMON_EVS
>>>>>> +};
>>>>>> +
>>>>>> +enum grp_ev_idx {
>>>>>> +	MISS_IDX,
>>>>>> +	WB_IDX,
>>>>>> +	ACC_IDX,
>>>>>> +	NUM_GRP_EVS
>>>>>> +};
>>>>>> +
>>>>>> +#define EV_CPU_CYCLES		0
>>>>>> +#define EV_INST_RETIRED		2
>>>>>> +#define EV_L2_D_RFILL		5
>>>>>> +
>>>>>> +struct ev_map_msg {
>>>>>> +	u32 num_evs;
>>>>>> +	u32 hw_type;
>>>>>> +	u32 cid[NUM_COMMON_EVS];
>>>>>> +};
>>>>>> +
>>>>>> +struct cpufreq_memfreq_map {
>>>>>> +	unsigned int cpufreq_mhz;
>>>>>> +	unsigned int memfreq_khz;
>>>>>> +};
>>>>>> +
>>>>>> +struct scmi_monitor_info {
>>>>>> +	struct cpufreq_memfreq_map *freq_map;
>>>>>> +	char mon_name[MAX_NAME_LEN];
>>>>>> +	u32 mon_idx;
>>>>>> +	u32 mon_type;
>>>>>> +	u32 ipm_ceil;
>>>>>> +	u32 mask;
>>>>>> +	u32 freq_map_len;
>>>>>> +};
>>>>>> +
>>>>>> +struct scmi_memory_info {
>>>>>> +	struct scmi_monitor_info *monitor[MAX_MONITOR_CNT];
>>>>>> +	u32 hw_type;
>>>>>> +	int monitor_cnt;
>>>>>> +	u32 min_freq;
>>>>>> +	u32 max_freq;
>>>>>> +};
>>>>>> +
>>>>>> +struct scmi_memlat_info {
>>>>>> +	struct scmi_protocol_handle *ph;
>>>>>> +	const struct qcom_generic_ext_ops *ops;
>>>>>> +	struct scmi_memory_info *memory[MAX_MEMORY_TYPES];
>>>>>> +	u32 cluster_info[NR_CPUS];
>>>>>> +	int memory_cnt;
>>>>>> +};
>>>>>> +
>>>>>> +static int populate_cluster_info(u32 *cluster_info)
>>>>>> +{
>>>>>> +	char name[MAX_NAME_LEN];
>>>>>> +	int i = 0;
>>>>>> +
>>>>>> +	struct device_node *cn __free(device_node) = of_find_node_by_path("/cpus");
>>>>>> +	if (!cn)
>>>>>> +		return -ENODEV;
>>>>>> +
>>>>>> +	struct device_node *map __free(device_node) = of_get_child_by_name(cn, "cpu-map");
>>>>>> +	if (!map)
>>>>>> +		return -ENODEV;
>>>>>> +
>>>>>> +	do {
>>>>>> +		snprintf(name, sizeof(name), "cluster%d", i);
>>>>>> +		struct device_node *c __free(device_node) = of_get_child_by_name(map, name);
>>>>>> +		if (!c)
>>>>>> +			break;
>>>>>> +
>>>>>> +		*(cluster_info + i) = of_get_child_count(c);
>>>>>> +		i++;
>>>>>> +	} while (1);
>>>>>
>>>>> Can you use existing API from drivers/base/arch_topology.c? If not, can
>>>>> it be extended to support your usecase?
>>>>
>>>> ack. But I'm pretty sure it's going to take a while for reaching such
>>>> an agreement so I'll drop this feature during the next re-spin.
>>>
>>> Why? What kind of API do you actually need? The arch_topology.c simply
>>> exports a table of struct cpu_topology. Is it somehow different from
>>> what you are parsing manually?
>>
>> yup, we had to figure out the physical id of the cpu
>> since cpus can be disabled by the bootloader using
>> status = "failed" property and we have to pass this
>> onto the cpucp memlat algorithm.
> 
> Isn't it equal to the index in the cpu_topology table?

from what I see cpu_topology indexes remain unpopulated
for cpus that are disabled since get_cpu_for_node
ignores those?

> 
>>
>>>
>>>>
>>>>>
>>>>>> +
>>>>>> +	return 0;
>>>>>> +}
>>>>>> +
>>>>>> +static void populate_physical_mask(struct device_node *np, u32 *mask, u32 *cluster_info)
>>>>>> +{
>>>>>> +	struct device_node *dev_phandle __free(device_node);
>>>>>> +	int cpu, i = 0, physical_id;
>>>>>> +
>>>>>> +	do {
>>>>>> +		dev_phandle = of_parse_phandle(np, "cpus", i++);
>>>>>> +		cpu = of_cpu_node_to_id(dev_phandle);
>>>>>> +		if (cpu != -ENODEV) {
>>>>>> +			physical_id = topology_core_id(cpu);
>>>>>> +			for (int j = 0; j < topology_cluster_id(cpu); j++)
>>>>>> +				physical_id += *(cluster_info + j);
>>>>>> +			*mask |= BIT(physical_id);
>>>>>> +		}
>>>>>> +	} while (dev_phandle);
>>>>>> +}
>>>>>> +
>>>>>> +static struct cpufreq_memfreq_map *init_cpufreq_memfreq_map(struct device *dev,
>>>>>> +							    struct scmi_memory_info *memory,
>>>>>> +							    struct device_node *of_node,
>>>>>> +							    u32 *cnt)
>>>>>> +{
>>>>>> +	struct device_node *tbl_np __free(device_node), *opp_np __free(device_node);
>>>>>> +	struct cpufreq_memfreq_map *tbl;
>>>>>> +	int ret, i = 0;
>>>>>> +	u32 level, len;
>>>>>> +	u64 rate;
>>>>>> +
>>>>>> +	tbl_np = of_parse_phandle(of_node, "operating-points-v2", 0);
>>>>>
>>>>> Please use existing API to parse OPP tables or document a reason why it
>>>>> can't be used.
>>>>
>>>> Thanks, I had them documented as opens in the coverletter. Dropped them
>>>> since no one had any comments on it during V3. Will add them as comments
>>>> to this driver instead.
>>>>
>>>> https://lore.kernel.org/lkml/20240702191440.2161623-1-quic_sibis@quicinc.com/
>>>>
>>>> re-copying things again:
>>>> opp-tables are used but they don't get to be added to the scmi device
>>>> (thus we rely on a lot of manual parsing) because the memlat client driver
>>>> doesn't vote on these resources clocks/interconnects/power-domain
>>>> from the kernel and some of the resources aren't modeled in the first
>>>> place like DDR_QOS.
>>>
>>> As discussed offline, please consider extending the OPP to be able to
>>> get the struct opp_table for the particular phandle. Another option
>>> might be to change the memlat driver by having a separate device for
>>> each monitor. This way you can use existing API to parse OPP tables and
>>> to get necessary data from those tables.
>>
>> + Viresh
>>
>> Spoke with Viresh offline and he had stricter requirements
>> than what you proposed. He definitely wanted the opp-tables
>> to be assoiciated with devices at the very least and have
>> all opp parsing logic within the opp-framework. Given that
>> we have to model all these dummy devices just to add the
>> tables I'll re-check the feasibility of movign the tables
>> into the driver itself. Will move the patch series back
>> into RFC and re-post just the vendor protocol since that's
>> close to merge
> 
> I don't think it's sensible to move the tables to the driver. Instead
> adding a device per monitor sounds like a better idea.

yeah, I would like to keep this in dt as well. But in order
to be able to do that through the opp core we would need
to put in a clock and interconnect paths so that the framework
is able to add the table to the device. I should be able
to list the scmi perf domain as the clock phandle but inorder
to be able to convert the kbps values for the interconnect I
would need to store the bus width and so on which is currently
abstracted by the interconnect framework. Also in the future
we may have to model dummy devices just to get the table parsed
if the devices aren't modelled and controlled in the kernel.
All of these seems to indicate that having the tables in the
driver is a better alternative, lol.

-Sibi

> 
>>>>>> +	if (!tbl_np)
>>>>>> +		return ERR_PTR(-ENODEV);
>>>>>> +
>>>>>> +	len = min(of_get_available_child_count(tbl_np), MAX_MAP_ENTRIES);
>>>>>> +	if (len == 0)
>>>>>> +		return ERR_PTR(-ENODEV);
>>>>>> +
>>>>>> +	tbl = devm_kzalloc(dev, (len + 1) * sizeof(struct cpufreq_memfreq_map),
>>>>>> +			   GFP_KERNEL);
>>>>>> +	if (!tbl)
>>>>>> +		return ERR_PTR(-ENOMEM);
>>>>>> +
>>>>>> +	for_each_available_child_of_node(tbl_np, opp_np) {
>>>>>> +		ret = of_property_read_u64_index(opp_np, "opp-hz", 0, &rate);
>>>>>> +		if (ret < 0)
>>>>>> +			return ERR_PTR(ret);
>>>>>> +
>>>>>> +		tbl[i].cpufreq_mhz = rate / HZ_PER_MHZ;
>>>>>> +
>>>>>> +		if (memory->hw_type != QCOM_MEM_TYPE_DDR_QOS) {
>>>>>> +			ret = of_property_read_u64_index(opp_np, "opp-hz", 1, &rate);
>>>>>> +			if (ret < 0)
>>>>>> +				return ERR_PTR(ret);
>>>>>> +
>>>>>> +			tbl[i].memfreq_khz = rate / HZ_PER_KHZ;
>>>>>> +		} else {
>>>>>> +			ret = of_property_read_u32(opp_np, "opp-level", &level);
>>>>>> +			if (ret < 0)
>>>>>> +				return ERR_PTR(ret);
>>>>>> +
>>>>>> +			tbl[i].memfreq_khz = level;
>>>>>> +		}
>>>>>> +
>>>>>> +		dev_dbg(dev, "Entry%d CPU:%u, Mem:%u\n", i, tbl[i].cpufreq_mhz, tbl[i].memfreq_khz);
>>>>>> +		i++;
>>>>>> +	}
>>>>>> +	*cnt = len;
>>>>>> +
>>>>>> +	return tbl;
>>>>>> +}
>>>>>> +
>>>>>> +static int process_scmi_memlat_of_node(struct scmi_device *sdev, struct scmi_memlat_info *info)
>>>>>> +{
>>>>>> +	struct scmi_monitor_info *monitor;
>>>>>> +	struct scmi_memory_info *memory;
>>>>>> +	char name[MAX_NAME_LEN];
>>>>>> +	u64 memfreq[2];
>>>>>> +	int ret;
>>>>>> +
>>>>>> +	ret = populate_cluster_info(info->cluster_info);
>>>>>> +	if (ret < 0) {
>>>>>> +		dev_err_probe(&sdev->dev, ret, "failed to populate cluster info\n");
>>>>>> +		goto err;
>>>>>> +	}
>>>>>> +
>>>>>> +	of_node_get(sdev->dev.of_node);
>>>>>> +	do {
>>>>>> +		snprintf(name, sizeof(name), "memory-%d", info->memory_cnt);
>>>>>> +		struct device_node *memory_np __free(device_node) =
>>>>>> +			of_find_node_by_name(sdev->dev.of_node, name);
>>>>>> +
>>>>>> +		if (!memory_np)
>>>>>> +			break;
>>>>>> +
>>>>>> +		if (info->memory_cnt >= MAX_MEMORY_TYPES)
>>>>>> +			return dev_err_probe(&sdev->dev, -EINVAL,
>>>>>> +					     "failed to parse unsupported memory type\n");
>>>>>> +
>>>>>> +		memory = devm_kzalloc(&sdev->dev, sizeof(*memory), GFP_KERNEL);
>>>>>> +		if (!memory) {
>>>>>> +			ret = -ENOMEM;
>>>>>> +			goto err;
>>>>>> +		}
>>>>>> +
>>>>>> +		ret = of_property_read_u32(memory_np, "qcom,memory-type", &memory->hw_type);
>>>>>> +		if (ret) {
>>>>>> +			dev_err_probe(&sdev->dev, ret, "failed to read memory type\n");
>>>>>> +			goto err;
>>>>>> +		}
>>>>>> +
>>>>>> +		ret = of_property_read_u64_array(memory_np, "freq-table-hz", memfreq, 2);
>>>>>> +		if (ret && (ret != -EINVAL)) {
>>>>>> +			dev_err_probe(&sdev->dev, ret, "failed to read min/max freq\n");
>>>>>> +			goto err;
>>>>>> +		}
>>>>>
>>>>> Can we get this information from the OPP table instead?
>>>>
>>>> we don't list all the available ddr/llcc freqs in the opp-table
>>>> so that we can keep the table constant across platforms.
>>>
>>> NO. Use opp-supported-hw to limit data to a particular platform. There
>>> is no reason to keep min/max out of the OPP table.
>>
>> if we are movign the opp-tables into driver data for the reasons
>> described above, this can probably stay?
> 
> No. They duplicate the information that can be a part of the tables. It
> doesn't matter if the tables are in the driver or in DT.
> 
> 

