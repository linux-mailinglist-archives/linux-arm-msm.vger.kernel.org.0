Return-Path: <linux-arm-msm+bounces-116088-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id T5cvIKmrRmpVbQsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116088-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 20:19:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BDD66FBED6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 20:19:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="LaL1K6/I";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116088-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116088-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7510631F0E74
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 17:22:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9282A353A8D;
	Thu,  2 Jul 2026 17:22:01 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F69346A10;
	Thu,  2 Jul 2026 17:21:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783012921; cv=none; b=Pa2sDMWJEugGmkyoKpZiIiMSulrVvntnI86FW0S5ylBBYMX/TUibYv2KaFJ8Y5x/sj1cisQLgfG1LWn+n0f3kdkv42qDj/sEsuxQpmMWYbI2c6awRxibSzRL+E0vTlbqsvYZpn59ZDhMERqDqCy624FlQeU/FdUPDX/p1Ja1MVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783012921; c=relaxed/simple;
	bh=hVd7GuTdqIM+SW281TDv1bC5I8V+Ddm6hNEz7u2iRAA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=StQjaUVJwNA2JWKcS7Dm0FRKtL6t/OLLmuvaZsp8eVHjc7WrwECcAWMYoK3L1hiWQlrXv7Cbhg619nn7Y5O76s+cr6haviV8J31QCMMuwgsA4Nl3en4s1CqaYTS/WZXDPCtPbSNx2M3Y+RYd6aGWHZsX4+b/6adRSZdkrsqvxTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LaL1K6/I; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C136F1F000E9;
	Thu,  2 Jul 2026 17:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783012917;
	bh=gKyPW51Ysmxx9HGxvTNpFgVgThSo+39KY8FIjit86E4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LaL1K6/Ionwp1MjFJmJl4siWvuYgabmSZEJaQgCa30EIUkj5H+rIJkHh1xiEtjNeV
	 ZgbjjTEMJOpSaXDrn7QrSxnfA3NsRbiyTqZF446Olq/RtoPd55dSURcdyiBsasVlEW
	 QfGs8kRIHTKOdW8alSiwL/kazR0v8JiOII7ZsgaxGRE/7sSpC3wM1HQp40vctvHYre
	 /iY/uYbxRa1X0Bugf5aVzkwb8Nl4HyoW11fJwXZktUGW7ndLB5S5tDxbSkO6VgJ07u
	 MyD/k+4OjJAgXRmpQlvqxmIRX7Sfkmi5qOSlV+gDwznTz4mRg4BkowZuh2fhRNe+LL
	 d4W48n1ZCa3CQ==
Date: Thu, 2 Jul 2026 12:21:53 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, 
	Cristian Marussi <cristian.marussi@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Dmitry Osipenko <digetx@gmail.com>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>, Pankaj Patil <pankaj.patil@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-tegra@vger.kernel.org, Amir Vajid <amir.vajid@oss.qualcomm.com>, 
	Ramakrishna Gottimukkula <ramakrishna.gottimukkula@oss.qualcomm.com>
Subject: Re: [PATCH RFC v7 7/9] PM / devfreq: Introduce the QCOM SCMI Memlat
 devfreq driver
Message-ID: <akWBtfG1j7-53fec@baldur>
References: <20260610-rfc_v7_scmi_memlat-v7-0-f3f68c608f25@oss.qualcomm.com>
 <20260610-rfc_v7_scmi_memlat-v7-7-f3f68c608f25@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610-rfc_v7_scmi_memlat-v7-7-f3f68c608f25@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:pragnesh.papaniya@oss.qualcomm.com,m:sudeep.holla@kernel.org,m:cristian.marussi@arm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:sibi.sankar@oss.qualcomm.com,m:myungjoo.ham@samsung.com,m:kyungmin.park@samsung.com,m:cw00.choi@samsung.com,m:digetx@gmail.com,m:thierry.reding@kernel.org,m:jonathanh@nvidia.com,m:konradybcio@kernel.org,m:rajendra.nayak@oss.qualcomm.com,m:pankaj.patil@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:arm-scmi@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-tegra@vger.kernel.org,m:amir.vajid@oss.qualcomm.com,m:ramakrishna.gottimukkula@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116088-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,arm.com,oss.qualcomm.com,samsung.com,gmail.com,nvidia.com,vger.kernel.org,lists.infradead.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,vger.kernel.org:from_smtp,pdevinfo.id:url,pdevinfo.name:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9BDD66FBED6

On Wed, Jun 10, 2026 at 02:21:34PM +0530, Pragnesh Papaniya wrote:
> From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> 
> On Qualcomm Glymur, Mahua and X1E/X1P (Hamoa) SoCs, the memlat governor and
> the mechanism to control the various caches and RAM is hosted on the CPU
> Control Processor (CPUCP), and configuration and control of this governor
> is exposed through the QCOM SCMI Generic Extension Protocol, addressed via
> the "MEMLAT" algorithm string.
> 

This explains that there's a bunch of functionality running on CPUCP and
there's a "MEMLAT" string.

> Introduce a devfreq SCMI client driver that uses the MEMLAT algorithm
> string to detect memory-latency-bound workloads and control the
> frequency/level of the memory buses (DDR, LLCC and DDR_QOS).

You established that there's stuff running in the firmware, now we're
introducing a client driver to control memory buses.

But where did you explain how these two "facts" are related? Why is
there a client driver, what is the actual distribution of roles in this
dance?

> Model each bus
> as a devfreq device using the remote devfreq governor. This provides basic
> insight into device operation via trans_stat and allows further tuning of
> the remote governor's parameters from userspace.
> 

Does this mean that the driver is "optional", and only exists to give
insight and a way to tune the firmware operation?

If that's the case, why is it a devfreq driver?

Please write your commit messages (and patches) such that people outside
your immediate team can understand why the patches are needed and what
the code is supposed to do.

> Co-developed-by: Amir Vajid <amir.vajid@oss.qualcomm.com>
> Signed-off-by: Amir Vajid <amir.vajid@oss.qualcomm.com>
> Co-developed-by: Ramakrishna Gottimukkula <ramakrishna.gottimukkula@oss.qualcomm.com>
> Signed-off-by: Ramakrishna Gottimukkula <ramakrishna.gottimukkula@oss.qualcomm.com>
> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> Co-developed-by: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
> Signed-off-by: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
> ---
>  drivers/devfreq/Kconfig                    |  13 +
>  drivers/devfreq/Makefile                   |   1 +
>  drivers/devfreq/scmi-qcom-memlat-cfg.h     | 573 +++++++++++++++++++++++++++
>  drivers/devfreq/scmi-qcom-memlat-devfreq.c | 616 +++++++++++++++++++++++++++++
>  4 files changed, 1203 insertions(+)
> 
> diff --git a/drivers/devfreq/Kconfig b/drivers/devfreq/Kconfig
> index 2caa87554914..98b5a50d3189 100644
> --- a/drivers/devfreq/Kconfig
> +++ b/drivers/devfreq/Kconfig
> @@ -169,6 +169,19 @@ config ARM_SUN8I_A33_MBUS_DEVFREQ
>  	  This adds the DEVFREQ driver for the MBUS controller in some
>  	  Allwinner sun8i (A33 through H3) and sun50i (A64 and H5) SoCs.
>  
> +config SCMI_QCOM_MEMLAT_DEVFREQ
> +	tristate "Qualcomm Technologies Inc. SCMI client driver"
> +	depends on QCOM_SCMI_GENERIC_EXT || COMPILE_TEST
> +	select DEVFREQ_GOV_REMOTE
> +	help
> +	  This driver uses the MEMLAT (memory latency) algorithm string

Is "driver uses X algorithm string" idiomatic SCMI terms?

> +	  hosted on QCOM SCMI Vendor Protocol to detect memory latency
> +	  workloads and control frequency/level of the various memory
> +	  buses (DDR/LLCC/DDR_QOS).
> +
> +	  This driver defines/documents the parameter IDs used while configuring
> +	  the memory buses.

Imagine an person outside your team, sitting there in menuconfig
wondering if they should enable this driver or not.

There's a sentence in the middle ("control frequency/level of various
memory buses" - that sounds like something I want. But "detect memory
latency", is it just monitoring or does that part relate to the
controlling part? "This driver defines" so what are those parameters
used for, do I need some other driver for the control part? Is this last
paragraph adding value to my understanding for that
CONFIG_SCMI_QCOM_MEMLAT_DEVFREQ does?

> +
>  source "drivers/devfreq/event/Kconfig"
>  
>  endif # PM_DEVFREQ
> diff --git a/drivers/devfreq/Makefile b/drivers/devfreq/Makefile
> index cde57c8cda76..b11f94e2f485 100644
> --- a/drivers/devfreq/Makefile
> +++ b/drivers/devfreq/Makefile
> @@ -17,6 +17,7 @@ obj-$(CONFIG_ARM_MEDIATEK_CCI_DEVFREQ)	+= mtk-cci-devfreq.o
>  obj-$(CONFIG_ARM_RK3399_DMC_DEVFREQ)	+= rk3399_dmc.o
>  obj-$(CONFIG_ARM_SUN8I_A33_MBUS_DEVFREQ)	+= sun8i-a33-mbus.o
>  obj-$(CONFIG_ARM_TEGRA_DEVFREQ)		+= tegra30-devfreq.o
> +obj-$(CONFIG_SCMI_QCOM_MEMLAT_DEVFREQ)	+= scmi-qcom-memlat-devfreq.o
>  
>  # DEVFREQ Event Drivers
>  obj-$(CONFIG_PM_DEVFREQ_EVENT)		+= event/
> diff --git a/drivers/devfreq/scmi-qcom-memlat-cfg.h b/drivers/devfreq/scmi-qcom-memlat-cfg.h
> new file mode 100644
> index 000000000000..1ab8b61ea271
> --- /dev/null
> +++ b/drivers/devfreq/scmi-qcom-memlat-cfg.h

Are the entities declared in this header file used by anything other
than scmi-qcom-memlat-devfreq.c? If not why is it a separate header file?

> @@ -0,0 +1,573 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#ifndef __DRIVERS_DEVFREQ_SCMI_QCOM_MEMLAT_CONFIG_H__
> +#define __DRIVERS_DEVFREQ_SCMI_QCOM_MEMLAT_CONFIG_H__
> +
> +/*
> + * Memlat Effective Frequency Calculation Method
> + * CPUCP_EFFECTIVE_FREQ_METHOD_0 - Uses CPU Cycles and CONST Cycles to calculate
> + * CPUCP_EFFECTIVE_FREQ_METHOD_1 - Uses CPU Cycles and time period
> + */
> +#define CPUCP_EFFECTIVE_FREQ_CALC_METHOD_0	0
> +#define CPUCP_EFFECTIVE_FREQ_CALC_METHOD_1	1

#define ZERO 0
#define ONE  1

Can these be given real names, or could the struct member even be a
boolean?

That said, "ZERO" isn't used in your patch...

> +
> +#define EV_CPU_CYCLES		0
> +#define EV_CNT_CYCLES		1
> +#define EV_INST_RETIRED		2
> +#define EV_STALL_BACKEND_MEM	3
> +#define EV_L2_D_RFILL		5
> +#define INVALID_IDX		0xff

The names of these defines aren't awesome names to put in include
files...

> +
> +#define MEMLAT_ALGO_STR		0x4D454D4C4154ULL /* MEMLAT */

As you've seen a thousand times on LKML already, we want lower-case hex
digits...

> +
> +struct scmi_qcom_map_table {
> +	unsigned int cpu_freq;
> +	unsigned int mem_freq;

Unit soup

> +};
> +
> +struct scmi_qcom_opp_data {
> +	unsigned long freq;
> +	unsigned int level;

The arrays of opp_data is all static const, and you seem to only define
"level" for ddr_qos, which if I read the code correctly you later
treat in some special way anyways.

> +};
> +
> +struct scmi_qcom_memory_range {
> +	unsigned int min_freq;
> +	unsigned int max_freq;
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
> +/*
> + * CPUCP firmware identifies memory groups by a small integer (the hw_type
> + * carried in node_msg / scalar_param_msg / map_param_msg / ev_map_msg).

Ok, sounds reasonable.

> The
> + * encoding is shared between the cfg tables below and scmi_qcom_devfreq_get_cur_freq()
> + * which special-cases DDR_QOS as a level-based bus rather than a frequency-scaled one.

The constants are shared between A and B, both being described as
in-driver users. So is this constants shared between the first (as you
said above) or an enumeration within the driver?

> + */
> +enum scmi_qcom_memlat_hw_type {
> +	MEMLAT_HW_DDR			= 0,
> +	MEMLAT_HW_LLCC			= 1,
> +	MEMLAT_HW_DDR_QOS_COMPUTE	= 2,

Please use "enum" for enumerations and #define for constants. (These
aren't enumerations, as they are defined constants)

> +};
> +
> +struct scmi_qcom_monitor_cfg {
> +	const struct scmi_qcom_map_table *table;
> +	const char *name;
> +	u32 be_stall_floor;

What is a "be stall floor"? Also, it seems to be 1 in all your cases. Is
it boolean? Is it constant?

> +	u32 cpu_mask;
> +	u32 ipm_ceil;
> +	int table_len;

Why is this signed?

> +};
> +
> +struct scmi_qcom_memory_cfg {
> +	const struct scmi_qcom_monitor_cfg *monitor_cfg;
> +	const struct scmi_qcom_opp_data *mem_table;
> +	struct scmi_qcom_memory_range memory_range;
> +	const u32 *grp_ev;
> +	const char *name;
> +	u32 memory_type;

As the memory type isn't an enumeration, I asked you above to make it
constants. But in the form you wrote it, there's no reason for this not
to have its enum type.

> +	int monitor_cnt;
> +	int num_opps;

Aren't these unsigned?

> +};
> +
> +struct scmi_qcom_memlat_cfg_data {
> +	const struct scmi_qcom_memory_cfg *memory_cfg;
> +	const u32 *common_ev;
> +	u32 cpucp_freq_method;
> +	u32 cpucp_sample_ms;
> +	int memory_cnt;

Unsigned...

> +};
> +
> +static const u32 glymur_common_ev[NUM_COMMON_EVS] = {
> +	[INST_IDX]      = EV_INST_RETIRED,
> +	[CYC_IDX]       = EV_CPU_CYCLES,
> +	[CONST_CYC_IDX] = EV_CNT_CYCLES,
> +	[FE_STALL_IDX]  = INVALID_IDX,
> +	[BE_STALL_IDX]  = EV_STALL_BACKEND_MEM,
> +};
> +
> +static const u32 glymur_ddr_grp_ev[NUM_GRP_EVS] = {
> +	[MISS_IDX] = EV_L2_D_RFILL,
> +	[WB_IDX]   = INVALID_IDX,
> +	[ACC_IDX]  = INVALID_IDX,
> +};
> +
> +static const u32 glymur_llcc_grp_ev[NUM_GRP_EVS] = {
> +	[MISS_IDX] = EV_L2_D_RFILL,
> +	[WB_IDX]   = INVALID_IDX,
> +	[ACC_IDX]  = INVALID_IDX,
> +};
> +
> +static const u32 glymur_ddr_qos_grp_ev[NUM_GRP_EVS] = {
> +	[MISS_IDX] = EV_L2_D_RFILL,
> +	[WB_IDX]   = INVALID_IDX,
> +	[ACC_IDX]  = INVALID_IDX,
> +};
> +
> +static const u32 hamoa_common_ev[NUM_COMMON_EVS] = {
> +	[INST_IDX]      = EV_INST_RETIRED,
> +	[CYC_IDX]       = EV_CPU_CYCLES,
> +	[CONST_CYC_IDX] = EV_CNT_CYCLES,
> +	[FE_STALL_IDX]  = INVALID_IDX,
> +	[BE_STALL_IDX]  = EV_STALL_BACKEND_MEM,
> +};
> +
> +static const u32 hamoa_ddr_grp_ev[NUM_GRP_EVS] = {
> +	[MISS_IDX] = EV_L2_D_RFILL,
> +	[WB_IDX]   = INVALID_IDX,
> +	[ACC_IDX]  = INVALID_IDX,
> +};
> +
> +static const u32 hamoa_llcc_grp_ev[NUM_GRP_EVS] = {
> +	[MISS_IDX] = EV_L2_D_RFILL,
> +	[WB_IDX]   = INVALID_IDX,
> +	[ACC_IDX]  = INVALID_IDX,
> +};
> +
> +static const u32 hamoa_ddr_qos_grp_ev[NUM_GRP_EVS] = {
> +	[MISS_IDX] = EV_L2_D_RFILL,
> +	[WB_IDX]   = INVALID_IDX,
> +	[ACC_IDX]  = INVALID_IDX,
> +};
> +
> +static const struct scmi_qcom_opp_data glymur_llcc_table[] = {
> +	{ .freq = 315000000 },
> +	{ .freq = 479000000 },
> +	{ .freq = 545000000 },
> +	{ .freq = 725000000 },
> +	{ .freq = 840000000 },
> +	{ .freq = 959000000 },
> +	{ .freq = 1090000000 },
> +	{ .freq = 1211000000 },
> +};
> +
> +static const struct scmi_qcom_opp_data hamoa_llcc_table[] = {
> +	{ .freq = 300000000 },
> +	{ .freq = 466000000 },
> +	{ .freq = 600000000 },
> +	{ .freq = 806000000 },
> +	{ .freq = 933000000 },
> +	{ .freq = 1066000000 },
> +};
> +
> +static const struct scmi_qcom_opp_data glymur_ddr_table[] = {
> +	{ .freq = 200000000 },
> +	{ .freq = 547000000 },
> +	{ .freq = 1353000000 },
> +	{ .freq = 1555000000 },
> +	{ .freq = 1708000000 },
> +	{ .freq = 2092000000 },
> +	{ .freq = 2736000000 },
> +	{ .freq = 3187000000 },
> +	{ .freq = 3686000000 },
> +	{ .freq = 4224000000 },
> +	{ .freq = 4761000000 },
> +};
> +
> +static const struct scmi_qcom_opp_data hamoa_ddr_table[] = {
> +	{ .freq = 200000000 },
> +	{ .freq = 547000000 },
> +	{ .freq = 768000000 },
> +	{ .freq = 1555000000 },
> +	{ .freq = 1708000000 },
> +	{ .freq = 2092000000 },
> +	{ .freq = 2736000000 },
> +	{ .freq = 3187000000 },
> +	{ .freq = 3686000000 },
> +	{ .freq = 4224000000 },
> +};
> +
> +/*
> + * DDR_QOS is a level-based bus (0 = nominal, 1 = boost), not a
> + * frequency-scaled one.

"level-based"? Looks more like "boolean"?

So I presume "not a frequency-scaled one" should be interpreted as the
.freq is bogus?

> The OPP entries below use synthetic frequencies
> + * (1 / 100) purely as distinct devfreq keys so trans_stat can show
> + * level transitions.

1/100? 0.01?

Why are the frequencies 1 and 100, why not 0 and 1, or 0 and 100?

> scmi_qcom_devfreq_get_cur_freq() maps the firmware
> + * level back to the matching key.

What is the "key" here?

> + */
> +static const struct scmi_qcom_opp_data glymur_ddr_qos_table[] = {
> +	{ .freq = 1, .level = 0 },
> +	{ .freq = 100, .level = 1 },
> +};
> +
> +static const struct scmi_qcom_memory_cfg glymur_memory_cfg[] = {
> +	{
> +		.memory_type = MEMLAT_HW_DDR,
> +		.name = "ddr",
> +		.mem_table = glymur_ddr_table,
> +		.num_opps = ARRAY_SIZE(glymur_ddr_table),
> +		.grp_ev = glymur_ddr_grp_ev,
> +		.monitor_cnt = 4,
> +		.memory_range = { .min_freq = 547000, .max_freq = 4761000},
> +		.monitor_cfg = (const struct scmi_qcom_monitor_cfg[]) {
> +			{
> +				.name = "mon_0",
> +				.cpu_mask = 0x3f,
> +				.ipm_ceil = 60000000,
> +				.be_stall_floor = 1,
> +				.table_len = 8,
> +				.table = (const struct scmi_qcom_map_table[]) {
> +					{ .cpu_freq = 960, .mem_freq = 547000 },
> +					{ .cpu_freq = 1133, .mem_freq = 1353000 },
> +					{ .cpu_freq = 1594, .mem_freq = 1555000 },
> +					{ .cpu_freq = 1920, .mem_freq = 1708000 },
> +					{ .cpu_freq = 2228, .mem_freq = 2736000 },
> +					{ .cpu_freq = 2362, .mem_freq = 3187000 },
> +					{ .cpu_freq = 2650, .mem_freq = 3686000 },
> +					{ .cpu_freq = 2938, .mem_freq = 4761000 },

Why are these tables hard coded in the driver? Are they constant?

> +				}
> +			},
> +			{
> +				.name = "mon_1",
> +				.cpu_mask = 0xfc0,
> +				.ipm_ceil = 60000000,
> +				.be_stall_floor = 1,
> +				.table_len = 8,
> +				.table = (const struct scmi_qcom_map_table[]) {
> +					{ .cpu_freq = 356, .mem_freq = 547000 },
> +					{ .cpu_freq = 1018, .mem_freq = 1353000 },
> +					{ .cpu_freq = 1536, .mem_freq = 1555000 },
> +					{ .cpu_freq = 1748, .mem_freq = 1708000 },
> +					{ .cpu_freq = 2324, .mem_freq = 2736000 },
> +					{ .cpu_freq = 2496, .mem_freq = 3187000 },
> +					{ .cpu_freq = 2900, .mem_freq = 3686000 },
> +					{ .cpu_freq = 3514, .mem_freq = 4761000 },
> +				}
> +			},
> +			{
> +				.name = "mon_2",
> +				.cpu_mask = 0x3f000,
> +				.ipm_ceil = 60000000,
> +				.be_stall_floor = 1,
> +				.table_len = 8,
> +				.table = (const struct scmi_qcom_map_table[]) {
> +					{ .cpu_freq = 356, .mem_freq = 547000 },
> +					{ .cpu_freq = 1018, .mem_freq = 1353000 },
> +					{ .cpu_freq = 1536, .mem_freq = 1555000 },
> +					{ .cpu_freq = 1748, .mem_freq = 1708000 },
> +					{ .cpu_freq = 2324, .mem_freq = 2736000 },
> +					{ .cpu_freq = 2496, .mem_freq = 3187000 },
> +					{ .cpu_freq = 2900, .mem_freq = 3686000 },
> +					{ .cpu_freq = 3514, .mem_freq = 4761000 },
> +				}
> +			},
> +			{
> +				.name = "mon_3",
> +				.cpu_mask = 0x3ffff,
> +				.table_len = 4,
> +				.table = (const struct scmi_qcom_map_table[]) {
> +					{ .cpu_freq = 2823, .mem_freq = 547000 },
> +					{ .cpu_freq = 3034, .mem_freq = 1555000 },
> +					{ .cpu_freq = 3226, .mem_freq = 1708000 },
> +					{ .cpu_freq = 5012, .mem_freq = 2092000 },
> +				}
> +			},
> +		},
> +	},
> +	{
> +		.memory_type = MEMLAT_HW_LLCC,
> +		.name = "llcc",
> +		.mem_table = glymur_llcc_table,
> +		.num_opps = ARRAY_SIZE(glymur_llcc_table),
> +		.grp_ev = glymur_llcc_grp_ev,
> +		.monitor_cnt = 3,
> +		.memory_range = { .min_freq = 315000, .max_freq = 1211000},
> +		.monitor_cfg = (const struct scmi_qcom_monitor_cfg[]) {
> +			{
> +				.name = "mon_0",
> +				.cpu_mask = 0x3f,
> +				.ipm_ceil = 60000000,
> +				.be_stall_floor = 1,
> +				.table_len = 7,
> +				.table = (const struct scmi_qcom_map_table[]) {
> +					{ .cpu_freq = 960, .mem_freq = 315000 },
> +					{ .cpu_freq = 1113, .mem_freq = 479000 },
> +					{ .cpu_freq = 1594, .mem_freq = 545000 },
> +					{ .cpu_freq = 1920, .mem_freq = 725000 },
> +					{ .cpu_freq = 2362, .mem_freq = 840000 },
> +					{ .cpu_freq = 2650, .mem_freq = 959000 },
> +					{ .cpu_freq = 2938, .mem_freq = 1211000 },
> +				}
> +			},
> +			{
> +				.name = "mon_1",
> +				.cpu_mask = 0xfc0,
> +				.ipm_ceil = 60000000,
> +				.be_stall_floor = 1,
> +				.table_len = 7,
> +				.table = (const struct scmi_qcom_map_table[]) {
> +					{ .cpu_freq = 356, .mem_freq = 315000 },
> +					{ .cpu_freq = 1018, .mem_freq = 479000 },
> +					{ .cpu_freq = 1536, .mem_freq = 545000 },
> +					{ .cpu_freq = 1748, .mem_freq = 725000 },
> +					{ .cpu_freq = 2496, .mem_freq = 840000 },
> +					{ .cpu_freq = 2900, .mem_freq = 959000 },
> +					{ .cpu_freq = 3514, .mem_freq = 1211000 },
> +				}
> +			},
> +			{
> +				.name = "mon_2",
> +				.cpu_mask = 0x3f000,
> +				.ipm_ceil = 60000000,
> +				.be_stall_floor = 1,
> +				.table_len = 7,
> +				.table = (const struct scmi_qcom_map_table[]) {
> +					{ .cpu_freq = 356, .mem_freq = 315000 },
> +					{ .cpu_freq = 1018, .mem_freq = 479000 },
> +					{ .cpu_freq = 1536, .mem_freq = 545000 },
> +					{ .cpu_freq = 1748, .mem_freq = 725000 },
> +					{ .cpu_freq = 2496, .mem_freq = 840000 },
> +					{ .cpu_freq = 2900, .mem_freq = 959000 },
> +					{ .cpu_freq = 3514, .mem_freq = 1211000 },
> +				}
> +			},
> +		},
> +	},
> +	{
> +		.memory_type = MEMLAT_HW_DDR_QOS_COMPUTE,
> +		.name = "ddr-qos",
> +		.monitor_cnt = 3,
> +		.mem_table = glymur_ddr_qos_table,
> +		.num_opps = ARRAY_SIZE(glymur_ddr_qos_table),
> +		.grp_ev = glymur_ddr_qos_grp_ev,
> +		.memory_range = { .min_freq = 0, .max_freq = 1},
> +		.monitor_cfg = (const struct scmi_qcom_monitor_cfg[]) {
> +			{
> +				.name = "mon_0",
> +				.cpu_mask = 0x3f,
> +				.ipm_ceil = 80000000,
> +				.be_stall_floor = 1,
> +				.table_len = 2,
> +				.table = (const struct scmi_qcom_map_table[]) {
> +					{ .cpu_freq = 2362, .mem_freq = 0 },
> +					{ .cpu_freq = 2938, .mem_freq = 1 },
> +				}
> +			},
> +			{
> +				.name = "mon_1",
> +				.cpu_mask = 0xfc0,
> +				.ipm_ceil = 80000000,
> +				.be_stall_floor = 1,
> +				.table_len = 2,
> +				.table = (const struct scmi_qcom_map_table[]) {
> +					{ .cpu_freq = 2496, .mem_freq = 0 },
> +					{ .cpu_freq = 3514, .mem_freq = 1 },
> +				}
> +			},
> +			{
> +				.name = "mon_2",
> +				.cpu_mask = 0x3f000,
> +				.ipm_ceil = 80000000,
> +				.be_stall_floor = 1,
> +				.table_len = 2,
> +				.table = (const struct scmi_qcom_map_table[]) {
> +					{ .cpu_freq = 2496, .mem_freq = 0 },
> +					{ .cpu_freq = 3514, .mem_freq = 1 },
> +				}
> +			},
> +		},
> +	},
> +};
> +
> +static const struct scmi_qcom_memory_cfg hamoa_memory_cfg[] = {
> +	{
> +		.memory_type = MEMLAT_HW_DDR,
> +		.name = "ddr",
> +		.mem_table = hamoa_ddr_table,
> +		.num_opps = ARRAY_SIZE(hamoa_ddr_table),
> +		.grp_ev = hamoa_ddr_grp_ev,
> +		.monitor_cnt = 4,
> +		.memory_range = { .min_freq = 200000, .max_freq = 4224000},
> +		.monitor_cfg = (const struct scmi_qcom_monitor_cfg[]) {
> +			{
> +				.name = "mon_0",
> +				.cpu_mask = 0xf,
> +				.ipm_ceil = 20000000,
> +				.be_stall_floor = 1,
> +				.table_len = 6,
> +				.table = (const struct scmi_qcom_map_table[]) {
> +					{ .cpu_freq = 999, .mem_freq = 547000 },
> +					{ .cpu_freq = 1440, .mem_freq = 768000 },
> +					{ .cpu_freq = 1671, .mem_freq = 1555000 },
> +					{ .cpu_freq = 2189, .mem_freq = 2092000 },
> +					{ .cpu_freq = 2516, .mem_freq = 3187000 },
> +					{ .cpu_freq = 3860, .mem_freq = 4224000 },
> +				}
> +			},
> +			{
> +				.name = "mon_1",
> +				.cpu_mask = 0xf0,
> +				.ipm_ceil = 20000000,
> +				.be_stall_floor = 1,
> +				.table_len = 6,
> +				.table = (const struct scmi_qcom_map_table[]) {
> +					{ .cpu_freq = 999, .mem_freq = 547000 },
> +					{ .cpu_freq = 1440, .mem_freq = 768000 },
> +					{ .cpu_freq = 1671, .mem_freq = 1555000 },
> +					{ .cpu_freq = 2189, .mem_freq = 2092000 },
> +					{ .cpu_freq = 2516, .mem_freq = 3187000 },
> +					{ .cpu_freq = 3860, .mem_freq = 4224000 },
> +				}
> +			},
> +			{
> +				.name = "mon_2",
> +				.cpu_mask = 0xf00,
> +				.ipm_ceil = 20000000,
> +				.be_stall_floor = 1,
> +				.table_len = 6,
> +				.table = (const struct scmi_qcom_map_table[]) {
> +					{ .cpu_freq = 999, .mem_freq = 547000 },
> +					{ .cpu_freq = 1440, .mem_freq = 768000 },
> +					{ .cpu_freq = 1671, .mem_freq = 1555000 },
> +					{ .cpu_freq = 2189, .mem_freq = 2092000 },
> +					{ .cpu_freq = 2516, .mem_freq = 3187000 },
> +					{ .cpu_freq = 3860, .mem_freq = 4224000 },
> +				}
> +			},
> +			{
> +				.name = "mon_3",
> +				.cpu_mask = 0xfff,
> +				.table_len = 4,
> +				.table = (const struct scmi_qcom_map_table[]) {
> +					{ .cpu_freq = 1440, .mem_freq = 547000 },
> +					{ .cpu_freq = 2189, .mem_freq = 768000 },
> +					{ .cpu_freq = 2516, .mem_freq = 1555000 },
> +					{ .cpu_freq = 3860, .mem_freq = 2092000 },
> +				}
> +			},
> +		},
> +	},
> +	{
> +		.memory_type = MEMLAT_HW_LLCC,
> +		.name = "llcc",
> +		.mem_table = hamoa_llcc_table,
> +		.num_opps = ARRAY_SIZE(hamoa_llcc_table),
> +		.grp_ev = hamoa_llcc_grp_ev,
> +		.monitor_cnt = 3,
> +		.memory_range = { .min_freq = 300000, .max_freq = 1066000},
> +		.monitor_cfg = (const struct scmi_qcom_monitor_cfg[]) {
> +			{
> +				.name = "mon_0",
> +				.cpu_mask = 0xf,
> +				.ipm_ceil = 20000000,
> +				.be_stall_floor = 1,
> +				.table_len = 6,
> +				.table = (const struct scmi_qcom_map_table[]) {
> +					{ .cpu_freq = 999, .mem_freq = 300000 },
> +					{ .cpu_freq = 1440, .mem_freq = 466000 },
> +					{ .cpu_freq = 1671, .mem_freq = 600000 },
> +					{ .cpu_freq = 2189, .mem_freq = 806000 },
> +					{ .cpu_freq = 2516, .mem_freq = 933000 },
> +					{ .cpu_freq = 3860, .mem_freq = 1066000 },
> +				}
> +			},
> +			{
> +				.name = "mon_1",
> +				.cpu_mask = 0xf0,
> +				.ipm_ceil = 20000000,
> +				.be_stall_floor = 1,
> +				.table_len = 6,
> +				.table = (const struct scmi_qcom_map_table[]) {
> +					{ .cpu_freq = 999, .mem_freq = 300000 },
> +					{ .cpu_freq = 1440, .mem_freq = 466000 },
> +					{ .cpu_freq = 1671, .mem_freq = 600000 },
> +					{ .cpu_freq = 2189, .mem_freq = 806000 },
> +					{ .cpu_freq = 2516, .mem_freq = 933000 },
> +					{ .cpu_freq = 3860, .mem_freq = 1066000 },
> +				}
> +			},
> +			{
> +				.name = "mon_2",
> +				.cpu_mask = 0xf00,
> +				.ipm_ceil = 20000000,
> +				.be_stall_floor = 1,
> +				.table_len = 6,
> +				.table = (const struct scmi_qcom_map_table[]) {
> +					{ .cpu_freq = 999, .mem_freq = 300000 },
> +					{ .cpu_freq = 1440, .mem_freq = 466000 },
> +					{ .cpu_freq = 1671, .mem_freq = 600000 },
> +					{ .cpu_freq = 2189, .mem_freq = 806000 },
> +					{ .cpu_freq = 2516, .mem_freq = 933000 },
> +					{ .cpu_freq = 3860, .mem_freq = 1066000 },
> +				}
> +			},
> +		},
> +	},
> +	{
> +		.memory_type = MEMLAT_HW_DDR_QOS_COMPUTE,
> +		.name = "ddr-qos",
> +		.monitor_cnt = 3,
> +		.mem_table = glymur_ddr_qos_table,
> +		.num_opps = ARRAY_SIZE(glymur_ddr_qos_table),
> +		.grp_ev = hamoa_ddr_qos_grp_ev,
> +		.memory_range = { .min_freq = 0, .max_freq = 1},
> +		.monitor_cfg = (const struct scmi_qcom_monitor_cfg[]) {
> +			{
> +				.name = "mon_0",
> +				.cpu_mask = 0xf,
> +				.ipm_ceil = 20000000,
> +				.be_stall_floor = 1,
> +				.table_len = 2,
> +				.table = (const struct scmi_qcom_map_table[]) {
> +					{ .cpu_freq = 2189, .mem_freq = 0 },
> +					{ .cpu_freq = 3860, .mem_freq = 1 },
> +				}
> +			},
> +			{
> +				.name = "mon_1",
> +				.cpu_mask = 0xf0,
> +				.ipm_ceil = 20000000,
> +				.be_stall_floor = 1,
> +				.table_len = 2,
> +				.table = (const struct scmi_qcom_map_table[]) {
> +					{ .cpu_freq = 2189, .mem_freq = 0 },
> +					{ .cpu_freq = 3860, .mem_freq = 1 },
> +				}
> +			},
> +			{
> +				.name = "mon_2",
> +				.cpu_mask = 0xf00,
> +				.ipm_ceil = 20000000,
> +				.be_stall_floor = 1,
> +				.table_len = 2,
> +				.table = (const struct scmi_qcom_map_table[]) {
> +					{ .cpu_freq = 2189, .mem_freq = 0 },
> +					{ .cpu_freq = 3860, .mem_freq = 1 },
> +				}
> +			},
> +		},
> +	},
> +};
> +
> +static const struct scmi_qcom_memlat_cfg_data glymur_memlat_data = {
> +	.memory_cfg = glymur_memory_cfg,
> +	.common_ev = glymur_common_ev,
> +	.cpucp_freq_method = CPUCP_EFFECTIVE_FREQ_CALC_METHOD_1,
> +	.cpucp_sample_ms = 4,
> +	.memory_cnt = ARRAY_SIZE(glymur_memory_cfg),
> +};
> +
> +static const struct scmi_qcom_memlat_cfg_data hamoa_memlat_data = {
> +	.memory_cfg = hamoa_memory_cfg,
> +	.common_ev = hamoa_common_ev,
> +	.cpucp_freq_method = CPUCP_EFFECTIVE_FREQ_CALC_METHOD_1,
> +	.cpucp_sample_ms = 4,
> +	.memory_cnt = ARRAY_SIZE(hamoa_memory_cfg),
> +};

It would be wonderful to declare scmi_qcom_memlat_configs[] in the
vicinity of these two definitions.

> +
> +#endif
> diff --git a/drivers/devfreq/scmi-qcom-memlat-devfreq.c b/drivers/devfreq/scmi-qcom-memlat-devfreq.c
> new file mode 100644
> index 000000000000..99ae229acfdc
> --- /dev/null
> +++ b/drivers/devfreq/scmi-qcom-memlat-devfreq.c
> @@ -0,0 +1,616 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <linux/cpu.h>
> +#include <linux/devfreq.h>
> +#include <linux/err.h>
> +#include <linux/errno.h>
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_opp.h>
> +#include <linux/scmi_protocol.h>
> +#include <linux/scmi_qcom_protocol.h>
> +#include <linux/units.h>
> +
> +#define MAX_NAME_LEN				20
> +#define MAX_MAP_ENTRIES				10

The names used for these defines are a bit generic...

> +
> +#include "scmi-qcom-memlat-cfg.h"
> +
> +/**
> + * enum scmi_memlat_protocol_cmd - parameter_ids supported by the "MEMLAT" algo_str hosted
> + *                                 by the Qualcomm Generic Vendor Protocol on the SCMI controller.

This is supposed to be the short description, yet it's the same length
as the long description on the very next line.

> + *
> + * MEMLAT (Memory Latency) monitors the counters to detect memory latency bound workloads
> + * and scales the frequency/levels of the memory buses accordingly.
> + *
> + * @MEMLAT_SET_MEM_GROUP: initializes the frequency/level scaling functions for the memory bus.
> + * @MEMLAT_SET_MONITOR: configures the monitor to work on a specific memory bus.
> + * @MEMLAT_SET_COMMON_EV_MAP: set up common counters used to monitor the cpu frequency.
> + * @MEMLAT_SET_GRP_EV_MAP: set up any specific counters used to monitor the memory bus.
> + * @MEMLAT_IPM_CEIL: set the IPM (Instruction Per Misses) ceiling per monitor.
> + * @MEMLAT_BE_STALL_FLOOR: set the back-end stall floor per monitor.
> + * @MEMLAT_SAMPLE_MS: set the sampling period for all the monitors.
> + * @MEMLAT_MON_FREQ_MAP: setup the cpufreq to memfreq map.
> + * @MEMLAT_SET_MIN_FREQ: set the min frequency of the memory bus.
> + * @MEMLAT_SET_MAX_FREQ: set the max frequency of the memory bus.
> + * @MEMLAT_GET_CUR_FREQ: query the current frequency/level of the memory bus.
> + * @MEMLAT_START_TIMER: start all the monitors with the requested sampling period.
> + * @MEMLAT_STOP_TIMER: stop all the running monitors.
> + * @MEMLAT_SET_EFFECTIVE_FREQ_METHOD: set the method used to determine cpu frequency.
> + */
> +enum scmi_memlat_protocol_cmd {

Don't use "enum" when you don't mean "enumeration".

> +	MEMLAT_SET_MEM_GROUP = 16,
> +	MEMLAT_SET_MONITOR,
> +	MEMLAT_SET_COMMON_EV_MAP,
> +	MEMLAT_SET_GRP_EV_MAP,
> +	MEMLAT_IPM_CEIL = 23,
> +	MEMLAT_BE_STALL_FLOOR = 25,
> +	MEMLAT_SAMPLE_MS = 31,
> +	MEMLAT_MON_FREQ_MAP,
> +	MEMLAT_SET_MIN_FREQ,
> +	MEMLAT_SET_MAX_FREQ,
> +	MEMLAT_GET_CUR_FREQ,
> +	MEMLAT_START_TIMER = 36,
> +	MEMLAT_STOP_TIMER,
> +	MEMLAT_SET_EFFECTIVE_FREQ_METHOD = 39,
> +};
> +
> +struct cpucp_map_table {
> +	__le16 v1;
> +	__le16 v2;

v1 v2?

As far as I can tell these two numbers are cpu and memory frequency.

> +};
> +
> +struct map_param_msg {
> +	__le32 hw_type;
> +	__le32 mon_idx;
> +	__le32 nr_rows;
> +	struct cpucp_map_table tbl[MAX_MAP_ENTRIES];
> +} __packed;

Does this really need the __packed? And if so, why is the only message
that you explicitly mark as packed?

> +
> +struct node_msg {
> +	__le32 cpumask;
> +	__le32 hw_type;
> +	__le32 mon_type;
> +	__le32 mon_idx;
> +	char mon_name[MAX_NAME_LEN];
> +};
> +
> +struct scalar_param_msg {
> +	__le32 hw_type;
> +	__le32 mon_idx;
> +	__le32 val;
> +};
> +
> +struct ev_map_msg {
> +	__le32 num_evs;
> +	__le32 hw_type;
> +	__le32 cid[NUM_COMMON_EVS];
> +};
> +
> +struct scmi_qcom_memlat_map {
> +	unsigned int cpufreq_mhz;
> +	unsigned int memfreq_khz;

unit soup

> +};
> +
> +struct scmi_qcom_monitor_info {
> +	struct scmi_qcom_memlat_map *freq_map;
> +	char name[MAX_NAME_LEN];
> +	u32 mon_idx;
> +	u32 mon_type;
> +	u32 ipm_ceil;
> +	u32 be_stall_floor;
> +	u32 mask;
> +	u32 freq_map_len;

Most of these values are merely copied from const tables to heap on
probe - verbatim - and then put in messages. Would it be possible to
just reference the static configuration, or are the any dynamic aspects
that I'm missing?

> +};
> +
> +struct scmi_qcom_memory_info {
> +	struct scmi_qcom_monitor_info **monitor;
> +	u32 hw_type;
> +	int monitor_cnt;

Why signed?

> +	u32 min_freq;
> +	u32 max_freq;

Throughout the driver we see frequencies expressed in mhz, khz, and hz.
Suffix these to help the reader.

> +	struct devfreq_dev_profile profile;
> +	struct devfreq *devfreq;
> +	struct platform_device *pdev;
> +	struct scmi_protocol_handle *ph;
> +	const struct qcom_generic_ext_ops *ops;
> +};
> +
> +struct scmi_qcom_memlat_info {
> +	struct scmi_protocol_handle *ph;
> +	const struct qcom_generic_ext_ops *ops;
> +	const struct scmi_qcom_memlat_cfg_data *cfg_data;
> +	struct scmi_qcom_memory_info **memory;
> +	u32 cpucp_freq_method;
> +	u32 cpucp_sample_ms;
> +	int memory_cnt;

Sounds like an unsigned to me

> +};
> +
> +static int configure_cpucp_common_events(struct scmi_qcom_memlat_info *info,
> +					 const struct scmi_qcom_memlat_cfg_data *cfg_data)
> +{
> +	const struct qcom_generic_ext_ops *ops = info->ops;
> +	struct ev_map_msg msg = {};
> +	int i;
> +
> +	msg.num_evs = cpu_to_le32(NUM_COMMON_EVS);
> +	/* Common events apply to all groups; INVALID_IDX flags "no specific group". */

Does hw_type of INVALID_IDX mean "all groups", or "any (no specific)
group"?

Is the protocol defined that you pass "invalid index" for both hw_type
and cid? Or do we just reuse the INVALID_IDX define because it happens
to have the right value?

Why not "#define HW_TYPE_ALL 0xff"? Then you can skip the second half of
the comment above, which only purpose is to clarify why the code looks
"wrong".

> +	msg.hw_type = cpu_to_le32(INVALID_IDX);
> +	for (i = 0; i < NUM_COMMON_EVS; i++)
> +		msg.cid[i] = cpu_to_le32(cfg_data->common_ev[i]);
> +
> +	return ops->set_param(info->ph, &msg, sizeof(msg), MEMLAT_ALGO_STR,

This is always info->ops->set_param(info->ph, ..., ..., MEMLAT_ALGO_STR,
...), why not create a helper unction that takes info, the command,
message and size instead?

Would make the code less noisy.

> +			      MEMLAT_SET_COMMON_EV_MAP);
> +}
> +
> +static int configure_cpucp_grp(struct device *dev, struct scmi_qcom_memlat_info *info,
> +			       const struct scmi_qcom_memlat_cfg_data *cfg_data,
> +			       int memory_index)
> +{
> +	const u32 *grp_ev = cfg_data->memory_cfg[memory_index].grp_ev;
> +	struct scmi_qcom_memory_info *memory = info->memory[memory_index];
> +	const struct qcom_generic_ext_ops *ops = info->ops;
> +	struct ev_map_msg ev_msg = {};
> +	struct node_msg msg = {};
> +	int ret;
> +	int i;
> +
> +	msg.cpumask = cpu_to_le32(*cpumask_bits(cpu_possible_mask));
> +	msg.hw_type = cpu_to_le32(memory->hw_type);
> +	msg.mon_type = 0;
> +	msg.mon_idx = 0;
> +	ret = ops->set_param(info->ph, &msg, sizeof(msg), MEMLAT_ALGO_STR, MEMLAT_SET_MEM_GROUP);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "failed to configure mem type %d\n",
> +				     memory->hw_type);
> +
> +	ev_msg.num_evs = cpu_to_le32(NUM_GRP_EVS);
> +	ev_msg.hw_type = cpu_to_le32(memory->hw_type);
> +	for (i = 0; i < NUM_GRP_EVS; i++)
> +		ev_msg.cid[i] = cpu_to_le32(grp_ev[i]);
> +
> +	ret = ops->set_param(info->ph, &ev_msg, sizeof(ev_msg), MEMLAT_ALGO_STR,
> +			     MEMLAT_SET_GRP_EV_MAP);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "failed to configure event map for mem type %d\n",
> +				     memory->hw_type);
> +
> +	return ret;
> +}
> +
> +static int configure_cpucp_mon(struct device *dev, struct scmi_qcom_memlat_info *info,
> +			       int memory_index, int monitor_index)
> +{
> +	const struct qcom_generic_ext_ops *ops = info->ops;
> +	struct scmi_qcom_memory_info *memory = info->memory[memory_index];
> +	struct scmi_qcom_monitor_info *monitor = memory->monitor[monitor_index];
> +	struct scalar_param_msg scalar_msg = {};
> +	struct map_param_msg map_msg = {};
> +	struct node_msg msg = {};

So you have scalar_msg, map_msg, and msg... Why is "msg" just "msg" and
not "node_msg", is it special?

If you made scalar_param_msg the "msg" instead, this function would be
significantly less characters :)

In fact, is it significant that these local variables are denoted to be
messages? If you name them "scalar", "map" and "node" you will reduce
the noise below quite a bit.

Same goes for all other functions that has multiple messages - where the
message type is the more significant fact, and you choose to name the
variable "this is a message".

> +	int ret;
> +	int i;
> +
> +	msg.cpumask = cpu_to_le32(monitor->mask);
> +	msg.hw_type = cpu_to_le32(memory->hw_type);
> +	msg.mon_type = cpu_to_le32(monitor->mon_type);
> +	msg.mon_idx = cpu_to_le32(monitor->mon_idx);
> +	strscpy(msg.mon_name, monitor->name, sizeof(msg.mon_name));
> +	ret = ops->set_param(info->ph, &msg, sizeof(msg), MEMLAT_ALGO_STR, MEMLAT_SET_MONITOR);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "failed to configure monitor %s\n",
> +				     monitor->name);
> +
> +	scalar_msg.hw_type = cpu_to_le32(memory->hw_type);
> +	scalar_msg.mon_idx = cpu_to_le32(monitor->mon_idx);
> +	scalar_msg.val = cpu_to_le32(monitor->ipm_ceil);
> +	ret = ops->set_param(info->ph, &scalar_msg, sizeof(scalar_msg), MEMLAT_ALGO_STR,
> +			     MEMLAT_IPM_CEIL);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "failed to set ipm ceil for %s\n",
> +				     monitor->name);
> +
> +	scalar_msg.hw_type = cpu_to_le32(memory->hw_type);
> +	scalar_msg.mon_idx = cpu_to_le32(monitor->mon_idx);
> +	scalar_msg.val = cpu_to_le32(monitor->be_stall_floor);
> +	ret = ops->set_param(info->ph, &scalar_msg, sizeof(scalar_msg), MEMLAT_ALGO_STR,
> +			     MEMLAT_BE_STALL_FLOOR);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "failed to set be_stall_floor for %s\n",
> +				     monitor->name);
> +
> +	map_msg.hw_type = cpu_to_le32(memory->hw_type);
> +	map_msg.mon_idx = cpu_to_le32(monitor->mon_idx);
> +	map_msg.nr_rows = cpu_to_le32(monitor->freq_map_len);
> +	for (i = 0; i < monitor->freq_map_len; i++) {
> +		map_msg.tbl[i].v1 = cpu_to_le16(monitor->freq_map[i].cpufreq_mhz);
> +
> +		/*
> +		 * Wire format v2 is u16 in MHz; convert from kHz.

Why is the freq_map cpufreq defined in MHz, but the memfreq in kHz - and
then we convert the memory frequency to MHz before we write it?

Why are they not both defined in MHz?

> For DDR_QOS
> +		 * the table holds level indices (0 / 1) rather than real
> +		 * frequencies, so pass them through unchanged.

"holds level indices", "pass them through unchanged"? What are you
trying to say?

> +		 */
> +		if (monitor->freq_map[i].memfreq_khz > 1)

If you change memfreq_khz to memfreq_mhz you can remove the whole
comment, the condition, as well as the divide. There might be a reason
for you to do this, but the comment is poor, so I simply can't tell.

> +			map_msg.tbl[i].v2 = cpu_to_le16(monitor->freq_map[i].memfreq_khz / 1000);
> +		else
> +			map_msg.tbl[i].v2 = cpu_to_le16(monitor->freq_map[i].memfreq_khz);
> +	}
> +	ret = ops->set_param(info->ph, &map_msg, sizeof(map_msg), MEMLAT_ALGO_STR,
> +			     MEMLAT_MON_FREQ_MAP);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "failed to configure freq_map for %s\n",
> +				     monitor->name);
> +
> +	scalar_msg.hw_type = cpu_to_le32(memory->hw_type);
> +	scalar_msg.mon_idx = cpu_to_le32(monitor->mon_idx);
> +	scalar_msg.val = cpu_to_le32(memory->min_freq);
> +	ret = ops->set_param(info->ph, &scalar_msg, sizeof(scalar_msg), MEMLAT_ALGO_STR,
> +			     MEMLAT_SET_MIN_FREQ);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "failed to set min_freq for %s\n",
> +				     monitor->name);
> +
> +	scalar_msg.hw_type = cpu_to_le32(memory->hw_type);
> +	scalar_msg.mon_idx = cpu_to_le32(monitor->mon_idx);
> +	scalar_msg.val = cpu_to_le32(memory->max_freq);
> +	ret = ops->set_param(info->ph, &scalar_msg, sizeof(scalar_msg), MEMLAT_ALGO_STR,
> +			     MEMLAT_SET_MAX_FREQ);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "failed to set max_freq for %s\n", monitor->name);
> +
> +	return ret;
> +}
> +
> +static int scmi_qcom_devfreq_get_cur_freq(struct device *dev, unsigned long *freq)
> +{
> +	struct scmi_qcom_memory_info *memory = dev_get_drvdata(dev);
> +	const struct qcom_generic_ext_ops *ops = memory->ops;
> +	struct scalar_param_msg scalar_msg = {};
> +	u32 max_freq_khz = 0;
> +	__le32 cur_freq;
> +	int ret, i;
> +
> +	/*
> +	 * MEMLAT_GET_CUR_FREQ returns target_freq for a single (hw_type,
> +	 * mon_idx) tuple. The bus's actual voted frequency is the max across
> +	 * all configured monitors in the group, so query each one and pick
> +	 * the highest vote.

You can say this with fewer words.

> +	 */
> +	for (i = 0; i < memory->monitor_cnt; i++) {
> +		scalar_msg.hw_type = cpu_to_le32(memory->hw_type);
> +		scalar_msg.mon_idx = cpu_to_le32(memory->monitor[i]->mon_idx);
> +		scalar_msg.val = 0;
> +
> +		ret = ops->get_param(memory->ph, &scalar_msg, sizeof(scalar_msg),
> +				     MEMLAT_ALGO_STR, MEMLAT_GET_CUR_FREQ,
> +				     sizeof(cur_freq));
> +		if (ret < 0) {
> +			dev_err(dev, "failed to get current frequency for %s\n",
> +				memory->monitor[i]->name);
> +			return ret;

We're grabbing a bunch of these, is it really fatal if one fails?

> +		}
> +
> +		/* qcom_scmi_common_xfer() returns the response into the same tx buffer. */

What is qcom_scmi_common_xfer()?

You can express in C the fact that msg is a in/out - by declaring it as
a union.

That way you don't need a comment to describe why you're reinterpreting
the first 4 bytes of msg as the result of the query.

> +		memcpy(&cur_freq, &scalar_msg, sizeof(cur_freq));
> +		if (le32_to_cpu(cur_freq) > max_freq_khz)
> +			max_freq_khz = le32_to_cpu(cur_freq);

And you could then le32_to_cpu() out of the union to a local variable
once, to avoid the double le32_to_cpu().

> +	}
> +
> +	/*
> +	 * Frequency-scaled buses (DDR/LLCC) report cur_freq in kHz; convert
> +	 * to Hz to match the devfreq OPP table units. Level-based buses
> +	 * (e.g. DDR_QOS_COMPUTE) configure max_freq == 1 because the firmware
> +	 * reports a 0/1 level rather than a frequency, and the matching
> +	 * synthetic OPP keys (1 / 100) live in glymur_ddr_qos_table.

You surely don't need 5 lines of solid text to express this.

> +	 */
> +	if (memory->max_freq > 1)
> +		*freq = max_freq_khz * 1000UL;
> +	else
> +		*freq = max_freq_khz ? 100 : 1;
> +
> +	return 0;
> +}
> +
> +static void scmi_qcom_memlat_unwind(struct scmi_qcom_memlat_info *info, int count)
> +{
> +	for (int i = 0; i < count; i++) {
> +		struct scmi_qcom_memory_info *memory = info->memory[i];
> +
> +		if (IS_ERR_OR_NULL(memory) || IS_ERR_OR_NULL(memory->pdev))

I don't get it, how can "memory" be IS_ERR()? Isn't it the result of the
devm_kcalloc() in scmi_qcom_memlat_parse_cfg()?

> +			continue;
> +
> +		dev_pm_opp_remove_all_dynamic(&memory->pdev->dev);
> +		platform_device_unregister(memory->pdev);
> +	}
> +}
> +
> +static int scmi_qcom_memlat_configure_events(struct scmi_device *sdev,
> +					     struct scmi_qcom_memlat_info *info)
> +{
> +	const struct qcom_generic_ext_ops *ops = info->ops;
> +	struct scmi_protocol_handle *ph = info->ph;
> +	__le32 sample_ms, freq_method;
> +	int i, j, ret;
> +
> +	/* Configure common events ids */
> +	ret = configure_cpucp_common_events(info, info->cfg_data);
> +	if (ret < 0)
> +		return dev_err_probe(&sdev->dev, ret, "failed to configure common events\n");
> +
> +	for (i = 0; i < info->memory_cnt; i++) {
> +		/* Configure per group parameters */
> +		ret = configure_cpucp_grp(&sdev->dev, info, info->cfg_data, i);
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
> +	sample_ms = cpu_to_le32(info->cpucp_sample_ms);
> +	ret = ops->set_param(ph, &sample_ms, sizeof(sample_ms),
> +			     MEMLAT_ALGO_STR, MEMLAT_SAMPLE_MS);
> +	if (ret < 0)
> +		return dev_err_probe(&sdev->dev, ret, "failed to set sample_ms\n");
> +
> +	/* Set the effective cpu frequency calculation method */
> +	freq_method = cpu_to_le32(info->cpucp_freq_method);
> +	ret = ops->set_param(ph, &freq_method, sizeof(freq_method),
> +			     MEMLAT_ALGO_STR, MEMLAT_SET_EFFECTIVE_FREQ_METHOD);
> +	if (ret < 0)
> +		return dev_err_probe(&sdev->dev, ret,
> +				     "failed to set effective frequency calc method\n");
> +
> +	/* Start sampling and voting timer */
> +	ret = ops->start_activity(ph, NULL, 0, MEMLAT_ALGO_STR, MEMLAT_START_TIMER);
> +	if (ret < 0)
> +		return dev_err_probe(&sdev->dev, ret, "failed to start memory group timer\n");
> +
> +	for (i = 0; i < info->memory_cnt; i++) {
> +		struct scmi_qcom_memory_info *memory = info->memory[i];
> +		struct platform_device *pdev = memory->pdev;
> +		struct devfreq_dev_profile *profile = &memory->profile;
> +
> +		/* sampling time should be double the devfreq observing time */

That's interesting, tell me more...

> +		profile->polling_ms = max(1U, info->cpucp_sample_ms / 2);
> +		profile->get_cur_freq = scmi_qcom_devfreq_get_cur_freq;
> +		profile->initial_freq = memory->min_freq > 1 ?
> +					(memory->min_freq * 1000UL) : memory->min_freq;

What is the purpose of this conditional?

You support memories with an actual frequency, and what you call
"level". But for any memory with a "level" resource other than a boolean
this logic fails.

For min_freq == 0 we get initial_freq of 0, both for frequency-based and
level-based memories.

So the only case where this actually does anything is if you have a
boolean resource with minimum value of 1 (i.e. a constant). Do we have
those?

> +
> +		platform_set_drvdata(pdev, memory);
> +
> +		memory->devfreq = devm_devfreq_add_device(&pdev->dev, profile,
> +							  DEVFREQ_GOV_REMOTE, NULL);
> +		if (IS_ERR(memory->devfreq)) {
> +			dev_err(&sdev->dev, "failed to add devfreq device\n");

I personally don't like all the dev_err_probe() that you have sprinkled
throughout the driver, but I know that many others do - and this one
isn't consistent.

> +			/* Stop sampling and voting timer */
> +			ret = ops->stop_activity(ph, NULL, 0, MEMLAT_ALGO_STR, MEMLAT_STOP_TIMER);
> +			if (ret < 0)
> +				dev_err_probe(&sdev->dev, ret,
> +					      "failed to stop memory group timer\n");

The significant event is that adding the devfreq device failed, but the
error message that you retain is "failed to stop memory group timer"...

> +			return PTR_ERR(memory->devfreq);
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static struct scmi_qcom_memlat_map *
> +scmi_qcom_parse_memlat_map(struct device *dev, const struct scmi_qcom_monitor_cfg *mon_cfg)
> +{
> +	struct scmi_qcom_memlat_map *map_table;
> +	const struct scmi_qcom_map_table *table;
> +
> +	if (mon_cfg->table_len > MAX_MAP_ENTRIES)
> +		return ERR_PTR(-EINVAL);
> +
> +	map_table = devm_kcalloc(dev, mon_cfg->table_len, sizeof(*map_table),
> +				 GFP_KERNEL);
> +	if (!map_table)
> +		return ERR_PTR(-ENOMEM);
> +
> +	for (int i = 0; i < mon_cfg->table_len; i++) {
> +		table = &mon_cfg->table[i];
> +
> +		map_table[i].cpufreq_mhz = table->cpu_freq;
> +		map_table[i].memfreq_khz = table->mem_freq;
> +	}
> +
> +	return map_table;
> +}
> +
> +static const struct of_device_id scmi_qcom_memlat_configs[] = {
> +	{ .compatible = "qcom,glymur", .data = &glymur_memlat_data},
> +	{ .compatible = "qcom,mahua", .data = &glymur_memlat_data},
> +	{ .compatible = "qcom,x1e80100", .data = &hamoa_memlat_data},
> +	{ .compatible = "qcom,x1p42100", .data = &hamoa_memlat_data},
> +	{ }
> +};
> +
> +static int scmi_qcom_memlat_parse_cfg(struct scmi_device *sdev, struct scmi_qcom_memlat_info *info)
> +{
> +	const struct scmi_qcom_memlat_cfg_data *cfg_data;
> +	struct scmi_qcom_monitor_info *monitor;
> +	struct scmi_qcom_memory_info *memory;
> +	int ret, i, j;
> +
> +	cfg_data = of_machine_get_match_data(scmi_qcom_memlat_configs);
> +	if (!cfg_data) {
> +		/*
> +		 * The SCMI generic-ext protocol can bind on Qualcomm SoCs that
> +		 * do not ship CPUCP memlat. Bail out quietly in that case rather
> +		 * than printing an error on every such system.
> +		 */
> +		dev_dbg(&sdev->dev, "no memlat config data for this platform\n");
> +		return -ENODEV;
> +	}
> +
> +	info->memory = devm_kcalloc(&sdev->dev, cfg_data->memory_cnt,
> +				    sizeof(*info->memory), GFP_KERNEL);
> +	if (!info->memory)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < cfg_data->memory_cnt; i++) {
> +		const struct scmi_qcom_memory_cfg *memory_cfg = &cfg_data->memory_cfg[i];
> +		struct platform_device_info pdevinfo = { 0 };
> +
> +		pdevinfo.parent = &sdev->dev;
> +		pdevinfo.name = memory_cfg->name;
> +		pdevinfo.id = PLATFORM_DEVID_NONE;
> +
> +		memory = devm_kzalloc(&sdev->dev, sizeof(*memory), GFP_KERNEL);
> +		if (!memory)
> +			return -ENOMEM;
> +
> +		memory->ops = info->ops;
> +		memory->ph = info->ph;
> +		memory->hw_type = memory_cfg->memory_type;
> +		memory->monitor_cnt = memory_cfg->monitor_cnt;
> +		memory->min_freq = memory_cfg->memory_range.min_freq;
> +		memory->max_freq = memory_cfg->memory_range.max_freq;
> +
> +		memory->pdev = platform_device_register_full(&pdevinfo);

Why are there platform_devices in here?

I'm guessing that you want the struct devices to hang the opp tables
off? But why a whole platform_device?

> +		if (IS_ERR(memory->pdev))
> +			return dev_err_probe(&sdev->dev, PTR_ERR(memory->pdev),
> +					     "failed to register platform device\n");
> +
> +		info->memory[i] = memory;
> +		/* Track progress so probe() can unwind on a later failure. */

Please clean up your own mess. If this function becomes too long for you
to be able to get things in order, that's just another indication that
you need to refactor this function.

> +		info->memory_cnt = i + 1;
> +
> +		for (j = 0; j < memory_cfg->num_opps; j++) {
> +			const struct scmi_qcom_opp_data *table = &memory_cfg->mem_table[j];
> +			struct platform_device *pdev = memory->pdev;
> +			struct dev_pm_opp_data data = {};
> +
> +			data.freq = table->freq;
> +			data.level = table->level;
> +
> +			ret = dev_pm_opp_add_dynamic(&pdev->dev, &data);
> +			if (ret)
> +				return dev_err_probe(&sdev->dev, ret, "failed to add OPP\n");
> +		}
> +
> +		memory->monitor = devm_kcalloc(&sdev->dev, memory_cfg->monitor_cnt,
> +					       sizeof(*memory->monitor), GFP_KERNEL);
> +		if (!memory->monitor)
> +			return -ENOMEM;
> +
> +		for (j = 0; j < memory_cfg->monitor_cnt; j++) {
> +			const struct scmi_qcom_monitor_cfg *mon_cfg = &memory_cfg->monitor_cfg[j];
> +
> +			monitor = devm_kzalloc(&sdev->dev, sizeof(*monitor), GFP_KERNEL);
> +			if (!monitor)
> +				return -ENOMEM;
> +
> +			monitor->ipm_ceil = mon_cfg->ipm_ceil;
> +			/* mon_type 0 = IPM-based latency monitor; 1 = stall-only (compute) */
> +			monitor->mon_type = monitor->ipm_ceil ? 0 : 1;

So the actual mon_type in the message is just a 0 or 1? Is this 0 the
same as the 0 in configure_cpucp_grp()? Should we have a couple of
defines for these - instead of the comment?

> +			monitor->be_stall_floor = mon_cfg->be_stall_floor;
> +			monitor->mask = mon_cfg->cpu_mask;
> +			monitor->freq_map_len = mon_cfg->table_len;
> +
> +			monitor->freq_map = scmi_qcom_parse_memlat_map(&sdev->dev, mon_cfg);

It might be a good idea to do this before you're starting to register
platform_devices and opps, as it would simplify the cleanup.

> +			if (IS_ERR(monitor->freq_map))
> +				return dev_err_probe(&sdev->dev, PTR_ERR(monitor->freq_map),
> +						     "failed to populate cpufreq-memfreq map\n");

There are two ways scmi_qcom_parse_memlat_map() can fail, either the
driver data is wrong and you get EINVAL (a developer BUG) or you get
ENOMEM, which is already printed...

> +
> +			strscpy(monitor->name, mon_cfg->name, sizeof(monitor->name));

Do you really need a copy? As far as I can see the next access is
another copy out of this struct.

> +			monitor->mon_idx = j;
> +			memory->monitor[j] = monitor;
> +		}
> +	}
> +
> +	info->cfg_data = cfg_data;
> +	info->cpucp_freq_method = cfg_data->cpucp_freq_method;
> +	info->cpucp_sample_ms = cfg_data->cpucp_sample_ms;

So much code just moving data between two representations...

> +
> +	return 0;
> +}
> +
> +static int scmi_qcom_devfreq_memlat_probe(struct scmi_device *sdev)
> +{
> +	const struct scmi_handle *handle = sdev->handle;
> +	const struct qcom_generic_ext_ops *ops;
> +	struct scmi_qcom_memlat_info *info;
> +	struct scmi_protocol_handle *ph;
> +	int ret;
> +
> +	if (!handle)
> +		return -ENODEV;
> +
> +	info = devm_kzalloc(&sdev->dev, sizeof(*info), GFP_KERNEL);
> +	if (!info)
> +		return -ENOMEM;
> +
> +	ops = handle->devm_protocol_get(sdev, SCMI_PROTOCOL_QCOM_GENERIC, &ph);
> +	if (IS_ERR(ops))
> +		return PTR_ERR(ops);
> +
> +	info->ops = ops;
> +	info->ph = ph;
> +
> +	ret = scmi_qcom_memlat_parse_cfg(sdev, info);
> +	if (ret) {
> +		scmi_qcom_memlat_unwind(info, info->memory_cnt);

scmi_qcom_memlat_unwind() unwinds the work done by
scmi_qcom_memlat_parse_cfg(), this isn't really idiomatic. Please have
scmi_qcom_memlat_parse_cfg() clean up its own mess on failure.

> +		return ret;
> +	}
> +
> +	ret = scmi_qcom_memlat_configure_events(sdev, info);
> +	if (ret) {
> +		scmi_qcom_memlat_unwind(info, info->memory_cnt);
> +		return ret;
> +	}
> +
> +	dev_set_drvdata(&sdev->dev, info);
> +
> +	return ret;
> +}
> +
> +static void scmi_qcom_devfreq_memlat_remove(struct scmi_device *sdev)
> +{
> +	struct scmi_qcom_memlat_info *info = dev_get_drvdata(&sdev->dev);
> +	struct scmi_protocol_handle *ph;
> +	const struct qcom_generic_ext_ops *ops;
> +	int ret;
> +
> +	if (!info)

How is that possible?

> +		return;
> +
> +	ph = info->ph;
> +	ops = info->ops;
> +
> +	ret = ops->stop_activity(ph, NULL, 0, MEMLAT_ALGO_STR, MEMLAT_STOP_TIMER);
> +	if (ret < 0)
> +		dev_err(&sdev->dev, "failed to stop memory group timer\n");
> +
> +	scmi_qcom_memlat_unwind(info, info->memory_cnt);
> +}
> +
> +static const struct scmi_device_id scmi_id_table[] = {
> +	{ SCMI_PROTOCOL_QCOM_GENERIC, "qcom-generic-ext" },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(scmi, scmi_id_table);
> +
> +static struct scmi_driver scmi_qcom_devfreq_memlat_driver = {
> +	.name		= "scmi-qcom-devfreq-memlat",
> +	.probe		= scmi_qcom_devfreq_memlat_probe,
> +	.remove		= scmi_qcom_devfreq_memlat_remove,
> +	.id_table	= scmi_id_table,
> +};
> +module_scmi_driver(scmi_qcom_devfreq_memlat_driver);
> +
> +MODULE_AUTHOR("Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>");
> +MODULE_DESCRIPTION("SCMI QCOM DEVFREQ MEMLAT driver");

Let go of the shift key!

s/QCOM/Qualcomm/ at least.

Regards,
Bjorn

> +MODULE_LICENSE("GPL");
> 
> -- 
> 2.34.1
> 

