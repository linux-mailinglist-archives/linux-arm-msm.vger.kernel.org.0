Return-Path: <linux-arm-msm+bounces-42521-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 365649F498A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 12:05:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 475B57A26DB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 11:05:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAAFB1DFE0C;
	Tue, 17 Dec 2024 11:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ffwprWTe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0427D13CFB6;
	Tue, 17 Dec 2024 11:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734433538; cv=none; b=Y5Nwf8NarNNtS4sc5EpmpH3TgScI76oLytiqzbp0jM8C/es+lXsvMtPFC2PrpPjBfPTSBkJWwTmVZqRyrDfDh2V2DaSaaBy5tHzSIx9tkzMoWTs99LeH6+IzkF09bELJ/fF0c3XGc7IZVnevgMMYfGp4fWEk7k7ImKIlI+1MJco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734433538; c=relaxed/simple;
	bh=dMEVdtEk/vvX96breW0rUJnUNEuJHqVN+3kUzXYr3XY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=meJmJxg1z5ITp+Ge5lkTceXcLBsdPy+T5oS/NT0pISGPQXFyaFh3fEeoVO3IvI7qNA/vTy4eCkjRiuoh8CFOFBz85P3dFVgvwmlVHUjY66yGyBBg51wFEsVa2tWA80p0ex0r2Zsnq3GY25yM3+00oHq8X9DhOIN30klUQcgnwXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ffwprWTe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BH7siLt002322;
	Tue, 17 Dec 2024 11:05:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/UXKDXVDX1Jr3lbD6ieJ253sAb0OMF93Ugn30UZBS30=; b=ffwprWTe1PhbIQVY
	aac7Asw8SSMcAoJ50ZNq87Am2RwIOru6MR5KIeRT2J/5i90EvuBTocYH1e+ZkoKT
	BYqfha8QQNHYHg0El4TfZ2ySI87izPECWbOjrdhRZ5/wxdSTYWO2ZYBwuZYbzTfS
	cD9yVYi9MZqDATvYqTw9HG14Fzp9usUL+ZoC9RfIV84beL3PovXGkTHVpMhR9GD2
	Sqxxc2hlDuHc6M9wgOaGFF43Wy4MR276ODckrpuqaSn56mM1W/1UwM0ymPqg67u9
	sNdLL7VJsPdsFPGkGHjBAndPO4Unjgs0AxeFMMFY7We9wh0qXMTy5lbCyMEBgcu2
	kK3R3w==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43k5aw8gn6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 11:05:24 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BHB5N0r020092
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 11:05:23 GMT
Received: from [10.190.163.187] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 17 Dec
 2024 03:05:17 -0800
Message-ID: <d2d95756-c51d-17bb-ce12-d8ae390a3bac@quicinc.com>
Date: Tue, 17 Dec 2024 16:35:15 +0530
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
 <1f5258f4-7c20-5343-dec6-0847449c821b@quicinc.com>
 <CAA8EJpoN3QSi72UUDV+=YkqySgXkiODUFJvwpBYfSmnkSotuZA@mail.gmail.com>
 <4399f7da-9478-57c0-7405-e51dc35d90ba@quicinc.com>
 <uwwiz2o6brn5zczbpaiajdq7yva2qpcpgzwdr26lhg4jvlwvvj@w5bkiuhdalze>
From: Sibi Sankar <quic_sibis@quicinc.com>
In-Reply-To: <uwwiz2o6brn5zczbpaiajdq7yva2qpcpgzwdr26lhg4jvlwvvj@w5bkiuhdalze>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: HWL7CnOmVvV-Xc3fGs1jW_pYC-xN7X_w
X-Proofpoint-GUID: HWL7CnOmVvV-Xc3fGs1jW_pYC-xN7X_w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 priorityscore=1501 mlxscore=0 mlxlogscore=999 lowpriorityscore=0
 adultscore=0 clxscore=1015 suspectscore=0 malwarescore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412170091



On 12/17/24 16:16, Dmitry Baryshkov wrote:
> On Tue, Dec 17, 2024 at 03:46:24PM +0530, Sibi Sankar wrote:
>>
>>
>> On 12/5/24 17:00, Dmitry Baryshkov wrote:
>>> On Thu, 5 Dec 2024 at 12:53, Sibi Sankar <quic_sibis@quicinc.com> wrote:
>>>>
>>>>
>>>>
>>>> On 11/14/24 18:02, Dmitry Baryshkov wrote:
>>>>> On Thu, Nov 14, 2024 at 09:43:53AM +0530, Sibi Sankar wrote:
>>>>>>
>>>>>>
>>>>>> On 10/26/24 23:46, Dmitry Baryshkov wrote:
>>>>>>> On Tue, Oct 22, 2024 at 01:48:25PM +0530, Sibi Sankar wrote:
>>>>>>>>
>>>>>>>>
>>>>>>>> On 10/7/24 23:27, Dmitry Baryshkov wrote:
>>>>>>>>> On Mon, Oct 07, 2024 at 11:40:22AM GMT, Sibi Sankar wrote:
>>>>>
>>>>>>>>>
>>>>>>>>>> +};
>>>>>>>>>> +
>>>>>>>>>> +struct map_param_msg {
>>>>>>>>>> +        u32 hw_type;
>>>>>>>>>> +        u32 mon_idx;
>>>>>>>>>> +        u32 nr_rows;
>>>>>>>>>> +        struct map_table tbl[MAX_MAP_ENTRIES];
>>>>>>>>>> +} __packed;
>>>>>>>>>> +
>>>>>>>>>> +struct node_msg {
>>>>>>>>>> +        u32 cpumask;
>>>>>>>>>> +        u32 hw_type;
>>>>>>>>>> +        u32 mon_type;
>>>>>>>>>> +        u32 mon_idx;
>>>>>>>>>> +        char mon_name[MAX_NAME_LEN];
>>>>>>>>>> +};
>>>>>>>>>> +
>>>>>>>>>> +struct scalar_param_msg {
>>>>>>>>>> +        u32 hw_type;
>>>>>>>>>> +        u32 mon_idx;
>>>>>>>>>> +        u32 val;
>>>>>>>>>> +};
>>>>>>>>>> +
>>>>>>>>>> +enum common_ev_idx {
>>>>>>>>>> +        INST_IDX,
>>>>>>>>>> +        CYC_IDX,
>>>>>>>>>> +        CONST_CYC_IDX,
>>>>>>>>>> +        FE_STALL_IDX,
>>>>>>>>>> +        BE_STALL_IDX,
>>>>>>>>>> +        NUM_COMMON_EVS
>>>>>>>>>> +};
>>>>>>>>>> +
>>>>>>>>>> +enum grp_ev_idx {
>>>>>>>>>> +        MISS_IDX,
>>>>>>>>>> +        WB_IDX,
>>>>>>>>>> +        ACC_IDX,
>>>>>>>>>> +        NUM_GRP_EVS
>>>>>>>>>> +};
>>>>>>>>>> +
>>>>>>>>>> +#define EV_CPU_CYCLES           0
>>>>>>>>>> +#define EV_INST_RETIRED         2
>>>>>>>>>> +#define EV_L2_D_RFILL           5
>>>>>>>>>> +
>>>>>>>>>> +struct ev_map_msg {
>>>>>>>>>> +        u32 num_evs;
>>>>>>>>>> +        u32 hw_type;
>>>>>>>>>> +        u32 cid[NUM_COMMON_EVS];
>>>>>>>>>> +};
>>>>>>>>>> +
>>>>>>>>>> +struct cpufreq_memfreq_map {
>>>>>>>>>> +        unsigned int cpufreq_mhz;
>>>>>>>>>> +        unsigned int memfreq_khz;
>>>>>>>>>> +};
>>>>>>>>>> +
>>>>>>>>>> +struct scmi_monitor_info {
>>>>>>>>>> +        struct cpufreq_memfreq_map *freq_map;
>>>>>>>>>> +        char mon_name[MAX_NAME_LEN];
>>>>>>>>>> +        u32 mon_idx;
>>>>>>>>>> +        u32 mon_type;
>>>>>>>>>> +        u32 ipm_ceil;
>>>>>>>>>> +        u32 mask;
>>>>>>>>>> +        u32 freq_map_len;
>>>>>>>>>> +};
>>>>>>>>>> +
>>>>>>>>>> +struct scmi_memory_info {
>>>>>>>>>> +        struct scmi_monitor_info *monitor[MAX_MONITOR_CNT];
>>>>>>>>>> +        u32 hw_type;
>>>>>>>>>> +        int monitor_cnt;
>>>>>>>>>> +        u32 min_freq;
>>>>>>>>>> +        u32 max_freq;
>>>>>>>>>> +};
>>>>>>>>>> +
>>>>>>>>>> +struct scmi_memlat_info {
>>>>>>>>>> +        struct scmi_protocol_handle *ph;
>>>>>>>>>> +        const struct qcom_generic_ext_ops *ops;
>>>>>>>>>> +        struct scmi_memory_info *memory[MAX_MEMORY_TYPES];
>>>>>>>>>> +        u32 cluster_info[NR_CPUS];
>>>>>>>>>> +        int memory_cnt;
>>>>>>>>>> +};
>>>>>>>>>> +
>>>>>>>>>> +static int populate_cluster_info(u32 *cluster_info)
>>>>>>>>>> +{
>>>>>>>>>> +        char name[MAX_NAME_LEN];
>>>>>>>>>> +        int i = 0;
>>>>>>>>>> +
>>>>>>>>>> +        struct device_node *cn __free(device_node) = of_find_node_by_path("/cpus");
>>>>>>>>>> +        if (!cn)
>>>>>>>>>> +                return -ENODEV;
>>>>>>>>>> +
>>>>>>>>>> +        struct device_node *map __free(device_node) = of_get_child_by_name(cn, "cpu-map");
>>>>>>>>>> +        if (!map)
>>>>>>>>>> +                return -ENODEV;
>>>>>>>>>> +
>>>>>>>>>> +        do {
>>>>>>>>>> +                snprintf(name, sizeof(name), "cluster%d", i);
>>>>>>>>>> +                struct device_node *c __free(device_node) = of_get_child_by_name(map, name);
>>>>>>>>>> +                if (!c)
>>>>>>>>>> +                        break;
>>>>>>>>>> +
>>>>>>>>>> +                *(cluster_info + i) = of_get_child_count(c);
>>>>>>>>>> +                i++;
>>>>>>>>>> +        } while (1);
>>>>>>>>>
>>>>>>>>> Can you use existing API from drivers/base/arch_topology.c? If not, can
>>>>>>>>> it be extended to support your usecase?
>>>>>>>>
>>>>>>>> ack. But I'm pretty sure it's going to take a while for reaching such
>>>>>>>> an agreement so I'll drop this feature during the next re-spin.
>>>>>>>
>>>>>>> Why? What kind of API do you actually need? The arch_topology.c simply
>>>>>>> exports a table of struct cpu_topology. Is it somehow different from
>>>>>>> what you are parsing manually?
>>>>>>
>>>>>> yup, we had to figure out the physical id of the cpu
>>>>>> since cpus can be disabled by the bootloader using
>>>>>> status = "failed" property and we have to pass this
>>>>>> onto the cpucp memlat algorithm.
>>>>>
>>>>> Isn't it equal to the index in the cpu_topology table?
>>>>
>>>> from what I see cpu_topology indexes remain unpopulated
>>>> for cpus that are disabled since get_cpu_for_node
>>>> ignores those?
>>>
>>> Why do you need cpu_topology for disabled aka non-existing CPU devices?
>>
>> sorry was out sick couldn't back earlier. We need the know
>> what cpus are disbled to pass on the correct mask of cpus
>> enabled to the SCP.
> 
> Yes. So isn't it enough to know only the enabled CPUs?

yes just knowing the physical index of the enabled cpus
should be enough.

> 
> 

