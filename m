Return-Path: <linux-arm-msm+bounces-40492-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A579E53F5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 12:30:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E366B281942
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 11:30:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 269EC206F1B;
	Thu,  5 Dec 2024 11:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lG2jh8NS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0277C1F6691
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Dec 2024 11:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733398217; cv=none; b=LHvxx+VVZn0tNQlszqJHYusK1LsZfB07Unr0h0C3zYYN4EvlcG40QVuQwiEPnGkZMeOT4GA9+al+VjXeeHIMYu3tFbfxMYHIxSJ12veHGicEHMS6AN6Gpp3Zieyy1tqIK9wHfMMQOc7DeNL+it041OS99hi4MoxhFQVeFL9WKlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733398217; c=relaxed/simple;
	bh=jeTKzdmYkilyTFoOEAxMUskq7MxwXiH7gjpJ/1Zabt4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K9bwzVziGsO0UVHKZ50oUAqBD2OhBiL7RbGn+moyWfdHSl4A9ok8D9EGNR//HZg/JZghvtgENTtuECHrsMtdh7ndPVVbN34Yx5VkZGNnh7IXD3d9VzAEZrbpvWYyAqfTQOdo8lFTXiAh4L848bpVJGTkz2txRClhhqRdxUVYlKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lG2jh8NS; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6efa5bf5202so5318217b3.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Dec 2024 03:30:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733398213; x=1734003013; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1PBZdFEBzaZ+86KebsS6lzY/GJI+OO4XCTdS3Z57qs8=;
        b=lG2jh8NSLyE1m+6xoVgTOYyB1xJAQXr0CsVEHdALSZxjjpeGgjOEsOr8Mujq6gZXJt
         giKRvhJ+698svsgD0gUOVQkLVYrCeyFFa/85AcHNDj97ZDFV9mtUd7gys8Zc3+FWsYQq
         SfDlHuuHpu7IcCPM5Pq3XkSTGvr+PJKJQ7ReWQ7J7yvDlFk1x+zQXXBTiRuAy0QgR1En
         0ihkt1ddXTUiCA+M00ovBrF6BO23zaHohpis7RR//UEuPJMMRkZh0B1cnHsybT5rSXmv
         cASijaSgTbkRvk+yPg3qc2jg2FltSBX6cKW7PJgNRAJX6aKldKFWa/FxarrVrAxznhbf
         yyFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733398213; x=1734003013;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1PBZdFEBzaZ+86KebsS6lzY/GJI+OO4XCTdS3Z57qs8=;
        b=Xs56a+dP5EXCy1agG9Nv1jGWRZ/ie9QFVR671Qjb+DZtG2ItMOO0bVyInuolZIBbTs
         RMHey88CdWKi4gu62Q9OXsO4Xbi6tzKYYOvUrMnoO928KZDFFsKuFq85xJ3YbcdjXVmW
         bSxLsO77Aonf8fZre3V0LJA/YBEnb462Jr+OL+gBKFAHUW1nFRekeLudkWRgCBT/SA2z
         tvVxpZQMPT67oqvleN4uAJ56JNS0g68bK64418K6680jTvDOv9evZA76fVgnFokMvBhO
         gP7x5JjVNhRztjNqSHpHQ+ryB7SzGrfgUy04jXEMCm1VSOGXEz/MkpVUP5x2gjxqylk3
         Qe5w==
X-Forwarded-Encrypted: i=1; AJvYcCVLeJxaQeEFDACZzsue/jd9CEkVqL1einQh6shTo8yfaCZD5S67sQjElNm2RgiR/f5pw7ow8qqAPIUrW/vT@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6uJuXBtuLRrGMuMmn5W5ZDqhm741teJHmJuW8a36oPp0EyWSo
	h7oLBdaRUhk7OACHhinHUkUZ505mKGVXMRB0HShhVmJLYA7Gea+Eea1/tFdpvNnyVwxfNLWzKnG
	aJYeikMr/ri3wts5G0ZdxWFOICijacxFl35Sg+A==
X-Gm-Gg: ASbGncsR8J1ziLYn0TuV/PVh4es0Mi/nSQ12jRj7EtCKpn0k2QE7wCDuT1gJWC3KygA
	e4LSBpiMMLETyDTT3uAztF3wPxn6EcCQIIkiq2DMgKFktwQ==
X-Google-Smtp-Source: AGHT+IFyk9mGiQxC8aF+FZAMDeiNmpThDNstH+u+pjjfHblFmIQOPiDFwt6hPv5UsiCot0+OwCkwR9tNNaHjkIF9scs=
X-Received: by 2002:a05:6902:150d:b0:e39:772b:4bae with SMTP id
 3f1490d57ef6-e39d39ee384mr10000359276.6.1733398212873; Thu, 05 Dec 2024
 03:30:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241007061023.1978380-1-quic_sibis@quicinc.com>
 <20241007061023.1978380-5-quic_sibis@quicinc.com> <2aycrvnvivcrqctqmweadcgenwugafdr6ub3bzkscterpenz32@bzabln2hkral>
 <29eef87e-96f6-5105-6f7a-a8e01efcb4a3@quicinc.com> <k4lpzxtrq3x6riyv6etxiobn7nbpczf2bp3m4oc752nhjknlit@uo53kbppzim7>
 <ac655bdc-5ccf-c6c6-3203-659f1916c53c@quicinc.com> <34p27za5hcpubaxjuddsir2vqnqrvwyesnclu2cocvm3yhbv3r@ak7rcnp67gyd>
 <1f5258f4-7c20-5343-dec6-0847449c821b@quicinc.com>
In-Reply-To: <1f5258f4-7c20-5343-dec6-0847449c821b@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 5 Dec 2024 13:30:02 +0200
Message-ID: <CAA8EJpoN3QSi72UUDV+=YkqySgXkiODUFJvwpBYfSmnkSotuZA@mail.gmail.com>
Subject: Re: [PATCH V4 4/5] soc: qcom: Introduce SCMI based Memlat (Memory
 Latency) governor
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: myungjoo.ham@samsung.com, Kyungmin.park@samsung.com, cw00.choi@samsung.com, 
	Viresh Kumar <viresh.kumar@linaro.org>, sudeep.holla@arm.com, cristian.marussi@arm.com, 
	andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, quic_rgottimu@quicinc.com, 
	quic_kshivnan@quicinc.com, conor+dt@kernel.org, arm-scmi@vger.kernel.org, 
	Amir Vajid <avajid@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 5 Dec 2024 at 12:53, Sibi Sankar <quic_sibis@quicinc.com> wrote:
>
>
>
> On 11/14/24 18:02, Dmitry Baryshkov wrote:
> > On Thu, Nov 14, 2024 at 09:43:53AM +0530, Sibi Sankar wrote:
> >>
> >>
> >> On 10/26/24 23:46, Dmitry Baryshkov wrote:
> >>> On Tue, Oct 22, 2024 at 01:48:25PM +0530, Sibi Sankar wrote:
> >>>>
> >>>>
> >>>> On 10/7/24 23:27, Dmitry Baryshkov wrote:
> >>>>> On Mon, Oct 07, 2024 at 11:40:22AM GMT, Sibi Sankar wrote:
> >
> >>>>>
> >>>>>> +};
> >>>>>> +
> >>>>>> +struct map_param_msg {
> >>>>>> +        u32 hw_type;
> >>>>>> +        u32 mon_idx;
> >>>>>> +        u32 nr_rows;
> >>>>>> +        struct map_table tbl[MAX_MAP_ENTRIES];
> >>>>>> +} __packed;
> >>>>>> +
> >>>>>> +struct node_msg {
> >>>>>> +        u32 cpumask;
> >>>>>> +        u32 hw_type;
> >>>>>> +        u32 mon_type;
> >>>>>> +        u32 mon_idx;
> >>>>>> +        char mon_name[MAX_NAME_LEN];
> >>>>>> +};
> >>>>>> +
> >>>>>> +struct scalar_param_msg {
> >>>>>> +        u32 hw_type;
> >>>>>> +        u32 mon_idx;
> >>>>>> +        u32 val;
> >>>>>> +};
> >>>>>> +
> >>>>>> +enum common_ev_idx {
> >>>>>> +        INST_IDX,
> >>>>>> +        CYC_IDX,
> >>>>>> +        CONST_CYC_IDX,
> >>>>>> +        FE_STALL_IDX,
> >>>>>> +        BE_STALL_IDX,
> >>>>>> +        NUM_COMMON_EVS
> >>>>>> +};
> >>>>>> +
> >>>>>> +enum grp_ev_idx {
> >>>>>> +        MISS_IDX,
> >>>>>> +        WB_IDX,
> >>>>>> +        ACC_IDX,
> >>>>>> +        NUM_GRP_EVS
> >>>>>> +};
> >>>>>> +
> >>>>>> +#define EV_CPU_CYCLES           0
> >>>>>> +#define EV_INST_RETIRED         2
> >>>>>> +#define EV_L2_D_RFILL           5
> >>>>>> +
> >>>>>> +struct ev_map_msg {
> >>>>>> +        u32 num_evs;
> >>>>>> +        u32 hw_type;
> >>>>>> +        u32 cid[NUM_COMMON_EVS];
> >>>>>> +};
> >>>>>> +
> >>>>>> +struct cpufreq_memfreq_map {
> >>>>>> +        unsigned int cpufreq_mhz;
> >>>>>> +        unsigned int memfreq_khz;
> >>>>>> +};
> >>>>>> +
> >>>>>> +struct scmi_monitor_info {
> >>>>>> +        struct cpufreq_memfreq_map *freq_map;
> >>>>>> +        char mon_name[MAX_NAME_LEN];
> >>>>>> +        u32 mon_idx;
> >>>>>> +        u32 mon_type;
> >>>>>> +        u32 ipm_ceil;
> >>>>>> +        u32 mask;
> >>>>>> +        u32 freq_map_len;
> >>>>>> +};
> >>>>>> +
> >>>>>> +struct scmi_memory_info {
> >>>>>> +        struct scmi_monitor_info *monitor[MAX_MONITOR_CNT];
> >>>>>> +        u32 hw_type;
> >>>>>> +        int monitor_cnt;
> >>>>>> +        u32 min_freq;
> >>>>>> +        u32 max_freq;
> >>>>>> +};
> >>>>>> +
> >>>>>> +struct scmi_memlat_info {
> >>>>>> +        struct scmi_protocol_handle *ph;
> >>>>>> +        const struct qcom_generic_ext_ops *ops;
> >>>>>> +        struct scmi_memory_info *memory[MAX_MEMORY_TYPES];
> >>>>>> +        u32 cluster_info[NR_CPUS];
> >>>>>> +        int memory_cnt;
> >>>>>> +};
> >>>>>> +
> >>>>>> +static int populate_cluster_info(u32 *cluster_info)
> >>>>>> +{
> >>>>>> +        char name[MAX_NAME_LEN];
> >>>>>> +        int i = 0;
> >>>>>> +
> >>>>>> +        struct device_node *cn __free(device_node) = of_find_node_by_path("/cpus");
> >>>>>> +        if (!cn)
> >>>>>> +                return -ENODEV;
> >>>>>> +
> >>>>>> +        struct device_node *map __free(device_node) = of_get_child_by_name(cn, "cpu-map");
> >>>>>> +        if (!map)
> >>>>>> +                return -ENODEV;
> >>>>>> +
> >>>>>> +        do {
> >>>>>> +                snprintf(name, sizeof(name), "cluster%d", i);
> >>>>>> +                struct device_node *c __free(device_node) = of_get_child_by_name(map, name);
> >>>>>> +                if (!c)
> >>>>>> +                        break;
> >>>>>> +
> >>>>>> +                *(cluster_info + i) = of_get_child_count(c);
> >>>>>> +                i++;
> >>>>>> +        } while (1);
> >>>>>
> >>>>> Can you use existing API from drivers/base/arch_topology.c? If not, can
> >>>>> it be extended to support your usecase?
> >>>>
> >>>> ack. But I'm pretty sure it's going to take a while for reaching such
> >>>> an agreement so I'll drop this feature during the next re-spin.
> >>>
> >>> Why? What kind of API do you actually need? The arch_topology.c simply
> >>> exports a table of struct cpu_topology. Is it somehow different from
> >>> what you are parsing manually?
> >>
> >> yup, we had to figure out the physical id of the cpu
> >> since cpus can be disabled by the bootloader using
> >> status = "failed" property and we have to pass this
> >> onto the cpucp memlat algorithm.
> >
> > Isn't it equal to the index in the cpu_topology table?
>
> from what I see cpu_topology indexes remain unpopulated
> for cpus that are disabled since get_cpu_for_node
> ignores those?

Why do you need cpu_topology for disabled aka non-existing CPU devices?

>
> >
> >>
> >>>
> >>>>
> >>>>>
> >>>>>> +
> >>>>>> +        return 0;
> >>>>>> +}
> >>>>>> +
> >>>>>> +static void populate_physical_mask(struct device_node *np, u32 *mask, u32 *cluster_info)
> >>>>>> +{
> >>>>>> +        struct device_node *dev_phandle __free(device_node);
> >>>>>> +        int cpu, i = 0, physical_id;
> >>>>>> +
> >>>>>> +        do {
> >>>>>> +                dev_phandle = of_parse_phandle(np, "cpus", i++);
> >>>>>> +                cpu = of_cpu_node_to_id(dev_phandle);
> >>>>>> +                if (cpu != -ENODEV) {
> >>>>>> +                        physical_id = topology_core_id(cpu);
> >>>>>> +                        for (int j = 0; j < topology_cluster_id(cpu); j++)
> >>>>>> +                                physical_id += *(cluster_info + j);
> >>>>>> +                        *mask |= BIT(physical_id);
> >>>>>> +                }
> >>>>>> +        } while (dev_phandle);
> >>>>>> +}
> >>>>>> +
> >>>>>> +static struct cpufreq_memfreq_map *init_cpufreq_memfreq_map(struct device *dev,
> >>>>>> +                                                            struct scmi_memory_info *memory,
> >>>>>> +                                                            struct device_node *of_node,
> >>>>>> +                                                            u32 *cnt)
> >>>>>> +{
> >>>>>> +        struct device_node *tbl_np __free(device_node), *opp_np __free(device_node);
> >>>>>> +        struct cpufreq_memfreq_map *tbl;
> >>>>>> +        int ret, i = 0;
> >>>>>> +        u32 level, len;
> >>>>>> +        u64 rate;
> >>>>>> +
> >>>>>> +        tbl_np = of_parse_phandle(of_node, "operating-points-v2", 0);
> >>>>>
> >>>>> Please use existing API to parse OPP tables or document a reason why it
> >>>>> can't be used.
> >>>>
> >>>> Thanks, I had them documented as opens in the coverletter. Dropped them
> >>>> since no one had any comments on it during V3. Will add them as comments
> >>>> to this driver instead.
> >>>>
> >>>> https://lore.kernel.org/lkml/20240702191440.2161623-1-quic_sibis@quicinc.com/
> >>>>
> >>>> re-copying things again:
> >>>> opp-tables are used but they don't get to be added to the scmi device
> >>>> (thus we rely on a lot of manual parsing) because the memlat client driver
> >>>> doesn't vote on these resources clocks/interconnects/power-domain
> >>>> from the kernel and some of the resources aren't modeled in the first
> >>>> place like DDR_QOS.
> >>>
> >>> As discussed offline, please consider extending the OPP to be able to
> >>> get the struct opp_table for the particular phandle. Another option
> >>> might be to change the memlat driver by having a separate device for
> >>> each monitor. This way you can use existing API to parse OPP tables and
> >>> to get necessary data from those tables.
> >>
> >> + Viresh
> >>
> >> Spoke with Viresh offline and he had stricter requirements
> >> than what you proposed. He definitely wanted the opp-tables
> >> to be assoiciated with devices at the very least and have
> >> all opp parsing logic within the opp-framework. Given that
> >> we have to model all these dummy devices just to add the
> >> tables I'll re-check the feasibility of movign the tables
> >> into the driver itself. Will move the patch series back
> >> into RFC and re-post just the vendor protocol since that's
> >> close to merge
> >
> > I don't think it's sensible to move the tables to the driver. Instead
> > adding a device per monitor sounds like a better idea.
>
> yeah, I would like to keep this in dt as well. But in order
> to be able to do that through the opp core we would need
> to put in a clock and interconnect paths so that the framework
> is able to add the table to the device.
> I should be able
> to list the scmi perf domain as the clock phandle but inorder
> to be able to convert the kbps values for the interconnect I
> would need to store the bus width and so on which is currently
> abstracted by the interconnect framework. Also in the future
> we may have to model dummy devices just to get the table parsed
> if the devices aren't modelled and controlled in the kernel.
> All of these seems to indicate that having the tables in the
> driver is a better alternative, lol.

Or fix the OPP API. I don't think that having monitor tables for the
SCMI-based platforms in the driver code is going to scale.

>
> -Sibi
>
> >
> >>>>>> +        if (!tbl_np)
> >>>>>> +                return ERR_PTR(-ENODEV);
> >>>>>> +
> >>>>>> +        len = min(of_get_available_child_count(tbl_np), MAX_MAP_ENTRIES);
> >>>>>> +        if (len == 0)
> >>>>>> +                return ERR_PTR(-ENODEV);
> >>>>>> +
> >>>>>> +        tbl = devm_kzalloc(dev, (len + 1) * sizeof(struct cpufreq_memfreq_map),
> >>>>>> +                           GFP_KERNEL);
> >>>>>> +        if (!tbl)
> >>>>>> +                return ERR_PTR(-ENOMEM);
> >>>>>> +
> >>>>>> +        for_each_available_child_of_node(tbl_np, opp_np) {
> >>>>>> +                ret = of_property_read_u64_index(opp_np, "opp-hz", 0, &rate);
> >>>>>> +                if (ret < 0)
> >>>>>> +                        return ERR_PTR(ret);
> >>>>>> +
> >>>>>> +                tbl[i].cpufreq_mhz = rate / HZ_PER_MHZ;
> >>>>>> +
> >>>>>> +                if (memory->hw_type != QCOM_MEM_TYPE_DDR_QOS) {
> >>>>>> +                        ret = of_property_read_u64_index(opp_np, "opp-hz", 1, &rate);
> >>>>>> +                        if (ret < 0)
> >>>>>> +                                return ERR_PTR(ret);
> >>>>>> +
> >>>>>> +                        tbl[i].memfreq_khz = rate / HZ_PER_KHZ;
> >>>>>> +                } else {
> >>>>>> +                        ret = of_property_read_u32(opp_np, "opp-level", &level);
> >>>>>> +                        if (ret < 0)
> >>>>>> +                                return ERR_PTR(ret);
> >>>>>> +
> >>>>>> +                        tbl[i].memfreq_khz = level;
> >>>>>> +                }
> >>>>>> +
> >>>>>> +                dev_dbg(dev, "Entry%d CPU:%u, Mem:%u\n", i, tbl[i].cpufreq_mhz, tbl[i].memfreq_khz);
> >>>>>> +                i++;
> >>>>>> +        }
> >>>>>> +        *cnt = len;
> >>>>>> +
> >>>>>> +        return tbl;
> >>>>>> +}
> >>>>>> +
> >>>>>> +static int process_scmi_memlat_of_node(struct scmi_device *sdev, struct scmi_memlat_info *info)
> >>>>>> +{
> >>>>>> +        struct scmi_monitor_info *monitor;
> >>>>>> +        struct scmi_memory_info *memory;
> >>>>>> +        char name[MAX_NAME_LEN];
> >>>>>> +        u64 memfreq[2];
> >>>>>> +        int ret;
> >>>>>> +
> >>>>>> +        ret = populate_cluster_info(info->cluster_info);
> >>>>>> +        if (ret < 0) {
> >>>>>> +                dev_err_probe(&sdev->dev, ret, "failed to populate cluster info\n");
> >>>>>> +                goto err;
> >>>>>> +        }
> >>>>>> +
> >>>>>> +        of_node_get(sdev->dev.of_node);
> >>>>>> +        do {
> >>>>>> +                snprintf(name, sizeof(name), "memory-%d", info->memory_cnt);
> >>>>>> +                struct device_node *memory_np __free(device_node) =
> >>>>>> +                        of_find_node_by_name(sdev->dev.of_node, name);
> >>>>>> +
> >>>>>> +                if (!memory_np)
> >>>>>> +                        break;
> >>>>>> +
> >>>>>> +                if (info->memory_cnt >= MAX_MEMORY_TYPES)
> >>>>>> +                        return dev_err_probe(&sdev->dev, -EINVAL,
> >>>>>> +                                             "failed to parse unsupported memory type\n");
> >>>>>> +
> >>>>>> +                memory = devm_kzalloc(&sdev->dev, sizeof(*memory), GFP_KERNEL);
> >>>>>> +                if (!memory) {
> >>>>>> +                        ret = -ENOMEM;
> >>>>>> +                        goto err;
> >>>>>> +                }
> >>>>>> +
> >>>>>> +                ret = of_property_read_u32(memory_np, "qcom,memory-type", &memory->hw_type);
> >>>>>> +                if (ret) {
> >>>>>> +                        dev_err_probe(&sdev->dev, ret, "failed to read memory type\n");
> >>>>>> +                        goto err;
> >>>>>> +                }
> >>>>>> +
> >>>>>> +                ret = of_property_read_u64_array(memory_np, "freq-table-hz", memfreq, 2);
> >>>>>> +                if (ret && (ret != -EINVAL)) {
> >>>>>> +                        dev_err_probe(&sdev->dev, ret, "failed to read min/max freq\n");
> >>>>>> +                        goto err;
> >>>>>> +                }
> >>>>>
> >>>>> Can we get this information from the OPP table instead?
> >>>>
> >>>> we don't list all the available ddr/llcc freqs in the opp-table
> >>>> so that we can keep the table constant across platforms.
> >>>
> >>> NO. Use opp-supported-hw to limit data to a particular platform. There
> >>> is no reason to keep min/max out of the OPP table.
> >>
> >> if we are movign the opp-tables into driver data for the reasons
> >> described above, this can probably stay?
> >
> > No. They duplicate the information that can be a part of the tables. It
> > doesn't matter if the tables are in the driver or in DT.
> >
> >



-- 
With best wishes
Dmitry

