Return-Path: <linux-arm-msm+bounces-42530-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 942299F4AAF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 13:11:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B571E1891703
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 12:10:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21A341F37A0;
	Tue, 17 Dec 2024 12:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r7VJYG+9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F141F03DF
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Dec 2024 12:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734437420; cv=none; b=XnzDZVZcz2qvqOx1etRDLuGoUaWdyR9JQncii9Cp+p+WN18RHCJ+5v6B5BVk1TWxOKIjWQ4Qu4D0XdKEiPgus4LkCUFs+gpf8N6fvFox5GElIJNU/+g9b5F6bW2m2bzCkG9OWVmaatoDh4bY3IJhXwHt7QZZkQ6pSOfCRoR7gpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734437420; c=relaxed/simple;
	bh=ZvTDXTytGK4hoEgB+cPKFKuPAhEooAN7ZUuO0aRDvBg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QqD/d31Yt2Kj9joH+D1SMNw1Kf2qyiDJk7yvp8h55ybIp6vhGlVsI6XU0vLehm5V4e2DCehN6g08g9coDZKUlxBcsJ6kZqKRizi/a1sg7qi0K31xzRDb8v68NEOnQWq7h6/HXFn4yW1ipIp5qkCbjSGsIatNERgQLQkCY1dIErw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r7VJYG+9; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3022484d4e4so59110831fa.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Dec 2024 04:10:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734437415; x=1735042215; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SGJtgkW0Nmj+9bOR6wvgP6qiuxfS0r3vmJTy/VNYYyI=;
        b=r7VJYG+9YNW4C2L6sZky5MLIAe1zHbWsU1rUsfu1KOiqKQHIHudBZKppRSPPtq9AK8
         peHnJO58nejz9JbTRsk3neBZQZbUHJI5IkD8u1IfxtZ3amuKomJOeVyPRm7BfrIHLh9g
         /T2s+dJNnxwHyjahffl5htuzfsdHOUO5v9WODptbztTDNKOATcoi+i8tWI9rOgqERdzf
         wGmdVGntIKObD45EQjfAXGCuQCQuvShOsS2cKuQ9bdXUxfN9CsS8RLUcpUMVuORjhF6f
         lNqxYPVzGSj3kuCkbRDuDL9vlGv0GQt5J9ThMZEaY4pN38e3SvI+zIVye0cyJHcmFMX1
         qXJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734437415; x=1735042215;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SGJtgkW0Nmj+9bOR6wvgP6qiuxfS0r3vmJTy/VNYYyI=;
        b=H8eKoXTW3ohHLrzSQkenYYWd35W7JOS3Cv1ipqFFyuIS7MZhNXBrwSM5YOMkIl2Wcy
         ilSKB6oIKxZ/Ux/dqP0U+7H6obQpcmqhafYIA/qXZP1002RwlgVrcUUQaV9uNR7EE6Mn
         GM40gUu23maewW0nFFzk3FBg1nycxSm68D3jPU3S0ZXeETybUZArC0m+3VH9gFYILH8f
         eFf+EsLQPrjxSYbap1h/UQWzKFkHKpXAkyNml8eF1v9Cm6LpmFk1KL7N+lMLae5sL1eX
         NrZ7JxUWkFaX4UOZ1LCSjvzgLGinbPeQAq2x19swX5BRufchnj3FKZMjiu45f4FZRaNz
         MDSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdGIVkfNlo1VGp1kWo4IxuRt/+euWZSmksAhsvaz8bvwKDT5qqt7UgTM7a2dBdO4vlT0IDo/ik0RqKThEI@vger.kernel.org
X-Gm-Message-State: AOJu0YwYSMMkvB+nNXtkoq5jMiCRgHrxaiyAR2FCyKhCdDboPM4bJnlx
	jqe1vrtNKPPbse5WYV7BaMXLCSV265AIRsm1es0wJmKBfOowtbBDeskw5Xwn83o=
X-Gm-Gg: ASbGncvr3kF05FyTuHrTovHVGYW2NkfT5fYYxoHpzO1PRKxGGew9nzrNkIRUcmN2e3W
	2tL4Lca35aUwOVOxSLGdqD1lKHxVRNFN/qCM4XHLx5h3sfobJ6P4RJ1yTGk3bHTV/yNaJCgVyrd
	OfM1y4ZeqIgdSxscUlPGm84iBjsgKh6e36XVLB1i5kYXiDOWUPMEc2f9mOts/kIs7kghG8po9ik
	UrQHzkyBuXgPXkmf+vTRCI3PoFZGGRupsSAf4YcLwjsD/YAKx3aM4zVi/biXXV65mZ4IMjRDTqG
	UzBwYeEWdmSk5aGQpnc6Vvuj8Q6/mNcoUo6T
X-Google-Smtp-Source: AGHT+IGbaAsWRmA6m2AAATXZlP1PqfEe6QwBDePHMk1dARQJ/q4HNRCc/Wnqkc8Q0vklBj+coP542A==
X-Received: by 2002:a05:651c:504:b0:302:360e:a13b with SMTP id 38308e7fff4ca-304435690d3mr13712661fa.30.1734437415091;
        Tue, 17 Dec 2024 04:10:15 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-303441a5a8dsm12382381fa.108.2024.12.17.04.10.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 04:10:14 -0800 (PST)
Date: Tue, 17 Dec 2024 14:10:13 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: myungjoo.ham@samsung.com, Kyungmin.park@samsung.com, 
	cw00.choi@samsung.com, Viresh Kumar <viresh.kumar@linaro.org>, sudeep.holla@arm.com, 
	cristian.marussi@arm.com, andersson@kernel.org, konrad.dybcio@linaro.org, 
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	quic_rgottimu@quicinc.com, quic_kshivnan@quicinc.com, conor+dt@kernel.org, 
	arm-scmi@vger.kernel.org, Amir Vajid <avajid@quicinc.com>
Subject: Re: [PATCH V4 4/5] soc: qcom: Introduce SCMI based Memlat (Memory
 Latency) governor
Message-ID: <7xrvku7wfvrpxx6yvamn7so46k4dvezpebj7ctm56ufp5ajadi@jwzup6vkupvd>
References: <2aycrvnvivcrqctqmweadcgenwugafdr6ub3bzkscterpenz32@bzabln2hkral>
 <29eef87e-96f6-5105-6f7a-a8e01efcb4a3@quicinc.com>
 <k4lpzxtrq3x6riyv6etxiobn7nbpczf2bp3m4oc752nhjknlit@uo53kbppzim7>
 <ac655bdc-5ccf-c6c6-3203-659f1916c53c@quicinc.com>
 <34p27za5hcpubaxjuddsir2vqnqrvwyesnclu2cocvm3yhbv3r@ak7rcnp67gyd>
 <1f5258f4-7c20-5343-dec6-0847449c821b@quicinc.com>
 <CAA8EJpoN3QSi72UUDV+=YkqySgXkiODUFJvwpBYfSmnkSotuZA@mail.gmail.com>
 <4399f7da-9478-57c0-7405-e51dc35d90ba@quicinc.com>
 <uwwiz2o6brn5zczbpaiajdq7yva2qpcpgzwdr26lhg4jvlwvvj@w5bkiuhdalze>
 <d2d95756-c51d-17bb-ce12-d8ae390a3bac@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d2d95756-c51d-17bb-ce12-d8ae390a3bac@quicinc.com>

On Tue, Dec 17, 2024 at 04:35:15PM +0530, Sibi Sankar wrote:
> 
> 
> On 12/17/24 16:16, Dmitry Baryshkov wrote:
> > On Tue, Dec 17, 2024 at 03:46:24PM +0530, Sibi Sankar wrote:
> > > 
> > > 
> > > On 12/5/24 17:00, Dmitry Baryshkov wrote:
> > > > On Thu, 5 Dec 2024 at 12:53, Sibi Sankar <quic_sibis@quicinc.com> wrote:
> > > > > 
> > > > > 
> > > > > 
> > > > > On 11/14/24 18:02, Dmitry Baryshkov wrote:
> > > > > > On Thu, Nov 14, 2024 at 09:43:53AM +0530, Sibi Sankar wrote:
> > > > > > > 
> > > > > > > 
> > > > > > > On 10/26/24 23:46, Dmitry Baryshkov wrote:
> > > > > > > > On Tue, Oct 22, 2024 at 01:48:25PM +0530, Sibi Sankar wrote:
> > > > > > > > > 
> > > > > > > > > 
> > > > > > > > > On 10/7/24 23:27, Dmitry Baryshkov wrote:
> > > > > > > > > > On Mon, Oct 07, 2024 at 11:40:22AM GMT, Sibi Sankar wrote:
> > > > > > 
> > > > > > > > > > 
> > > > > > > > > > > +};
> > > > > > > > > > > +
> > > > > > > > > > > +struct map_param_msg {
> > > > > > > > > > > +        u32 hw_type;
> > > > > > > > > > > +        u32 mon_idx;
> > > > > > > > > > > +        u32 nr_rows;
> > > > > > > > > > > +        struct map_table tbl[MAX_MAP_ENTRIES];
> > > > > > > > > > > +} __packed;
> > > > > > > > > > > +
> > > > > > > > > > > +struct node_msg {
> > > > > > > > > > > +        u32 cpumask;
> > > > > > > > > > > +        u32 hw_type;
> > > > > > > > > > > +        u32 mon_type;
> > > > > > > > > > > +        u32 mon_idx;
> > > > > > > > > > > +        char mon_name[MAX_NAME_LEN];
> > > > > > > > > > > +};
> > > > > > > > > > > +
> > > > > > > > > > > +struct scalar_param_msg {
> > > > > > > > > > > +        u32 hw_type;
> > > > > > > > > > > +        u32 mon_idx;
> > > > > > > > > > > +        u32 val;
> > > > > > > > > > > +};
> > > > > > > > > > > +
> > > > > > > > > > > +enum common_ev_idx {
> > > > > > > > > > > +        INST_IDX,
> > > > > > > > > > > +        CYC_IDX,
> > > > > > > > > > > +        CONST_CYC_IDX,
> > > > > > > > > > > +        FE_STALL_IDX,
> > > > > > > > > > > +        BE_STALL_IDX,
> > > > > > > > > > > +        NUM_COMMON_EVS
> > > > > > > > > > > +};
> > > > > > > > > > > +
> > > > > > > > > > > +enum grp_ev_idx {
> > > > > > > > > > > +        MISS_IDX,
> > > > > > > > > > > +        WB_IDX,
> > > > > > > > > > > +        ACC_IDX,
> > > > > > > > > > > +        NUM_GRP_EVS
> > > > > > > > > > > +};
> > > > > > > > > > > +
> > > > > > > > > > > +#define EV_CPU_CYCLES           0
> > > > > > > > > > > +#define EV_INST_RETIRED         2
> > > > > > > > > > > +#define EV_L2_D_RFILL           5
> > > > > > > > > > > +
> > > > > > > > > > > +struct ev_map_msg {
> > > > > > > > > > > +        u32 num_evs;
> > > > > > > > > > > +        u32 hw_type;
> > > > > > > > > > > +        u32 cid[NUM_COMMON_EVS];
> > > > > > > > > > > +};
> > > > > > > > > > > +
> > > > > > > > > > > +struct cpufreq_memfreq_map {
> > > > > > > > > > > +        unsigned int cpufreq_mhz;
> > > > > > > > > > > +        unsigned int memfreq_khz;
> > > > > > > > > > > +};
> > > > > > > > > > > +
> > > > > > > > > > > +struct scmi_monitor_info {
> > > > > > > > > > > +        struct cpufreq_memfreq_map *freq_map;
> > > > > > > > > > > +        char mon_name[MAX_NAME_LEN];
> > > > > > > > > > > +        u32 mon_idx;
> > > > > > > > > > > +        u32 mon_type;
> > > > > > > > > > > +        u32 ipm_ceil;
> > > > > > > > > > > +        u32 mask;
> > > > > > > > > > > +        u32 freq_map_len;
> > > > > > > > > > > +};
> > > > > > > > > > > +
> > > > > > > > > > > +struct scmi_memory_info {
> > > > > > > > > > > +        struct scmi_monitor_info *monitor[MAX_MONITOR_CNT];
> > > > > > > > > > > +        u32 hw_type;
> > > > > > > > > > > +        int monitor_cnt;
> > > > > > > > > > > +        u32 min_freq;
> > > > > > > > > > > +        u32 max_freq;
> > > > > > > > > > > +};
> > > > > > > > > > > +
> > > > > > > > > > > +struct scmi_memlat_info {
> > > > > > > > > > > +        struct scmi_protocol_handle *ph;
> > > > > > > > > > > +        const struct qcom_generic_ext_ops *ops;
> > > > > > > > > > > +        struct scmi_memory_info *memory[MAX_MEMORY_TYPES];
> > > > > > > > > > > +        u32 cluster_info[NR_CPUS];
> > > > > > > > > > > +        int memory_cnt;
> > > > > > > > > > > +};
> > > > > > > > > > > +
> > > > > > > > > > > +static int populate_cluster_info(u32 *cluster_info)
> > > > > > > > > > > +{
> > > > > > > > > > > +        char name[MAX_NAME_LEN];
> > > > > > > > > > > +        int i = 0;
> > > > > > > > > > > +
> > > > > > > > > > > +        struct device_node *cn __free(device_node) = of_find_node_by_path("/cpus");
> > > > > > > > > > > +        if (!cn)
> > > > > > > > > > > +                return -ENODEV;
> > > > > > > > > > > +
> > > > > > > > > > > +        struct device_node *map __free(device_node) = of_get_child_by_name(cn, "cpu-map");
> > > > > > > > > > > +        if (!map)
> > > > > > > > > > > +                return -ENODEV;
> > > > > > > > > > > +
> > > > > > > > > > > +        do {
> > > > > > > > > > > +                snprintf(name, sizeof(name), "cluster%d", i);
> > > > > > > > > > > +                struct device_node *c __free(device_node) = of_get_child_by_name(map, name);
> > > > > > > > > > > +                if (!c)
> > > > > > > > > > > +                        break;
> > > > > > > > > > > +
> > > > > > > > > > > +                *(cluster_info + i) = of_get_child_count(c);
> > > > > > > > > > > +                i++;
> > > > > > > > > > > +        } while (1);
> > > > > > > > > > 
> > > > > > > > > > Can you use existing API from drivers/base/arch_topology.c? If not, can
> > > > > > > > > > it be extended to support your usecase?
> > > > > > > > > 
> > > > > > > > > ack. But I'm pretty sure it's going to take a while for reaching such
> > > > > > > > > an agreement so I'll drop this feature during the next re-spin.
> > > > > > > > 
> > > > > > > > Why? What kind of API do you actually need? The arch_topology.c simply
> > > > > > > > exports a table of struct cpu_topology. Is it somehow different from
> > > > > > > > what you are parsing manually?
> > > > > > > 
> > > > > > > yup, we had to figure out the physical id of the cpu
> > > > > > > since cpus can be disabled by the bootloader using
> > > > > > > status = "failed" property and we have to pass this
> > > > > > > onto the cpucp memlat algorithm.
> > > > > > 
> > > > > > Isn't it equal to the index in the cpu_topology table?
> > > > > 
> > > > > from what I see cpu_topology indexes remain unpopulated
> > > > > for cpus that are disabled since get_cpu_for_node
> > > > > ignores those?
> > > > 
> > > > Why do you need cpu_topology for disabled aka non-existing CPU devices?
> > > 
> > > sorry was out sick couldn't back earlier. We need the know
> > > what cpus are disbled to pass on the correct mask of cpus
> > > enabled to the SCP.
> > 
> > Yes. So isn't it enough to know only the enabled CPUs?
> 
> yes just knowing the physical index of the enabled cpus
> should be enough.

Then exiting cpu_topology is enough for your case, isn't it?

-- 
With best wishes
Dmitry

