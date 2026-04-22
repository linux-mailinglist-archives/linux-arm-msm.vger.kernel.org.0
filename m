Return-Path: <linux-arm-msm+bounces-104037-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4CITEuN96GmsKwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104037-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 09:50:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A3AB443262
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 09:50:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 84FDF3004684
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 07:50:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95E1B3603FC;
	Wed, 22 Apr 2026 07:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j5LdyOLy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D582609C5;
	Wed, 22 Apr 2026 07:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776844226; cv=none; b=b6QOF9WAmOZqhmUWDQqpbGlPjIZqdkCsQAsMSrJZ/ZyvEbwwnSaw4iHYM+7bEAjkN4k1v3xdPyT+WRRO6My1jSsWtKKq6CBkp9lt5aHhqejciqo9vQJMfJrVFtkBAKwxcisqEg6FJDDR0ZC3T/s4yU4pZv3n68vprg9q3iaq3vI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776844226; c=relaxed/simple;
	bh=d6/6i3xUhPYgQ6s56JeFkRx77F+D3+xkqXOayMXSPEo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ub4ZUCp2VpbSp+ad4R11JWSV8o1MIHir+Rw7XmMOMq0hFakssjfntW6fZtxHQ7M393HgpAbFiu6few0mUR1eFtwtrP5Ca5P5W9aCaM12Ta9a/3EATuPnGHQFaLA0BjXd2eEgk9cZy5Zc9yhcI92bW/QsvuxAYfh7NYMLx35P0kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j5LdyOLy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFDC2C19425;
	Wed, 22 Apr 2026 07:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776844226;
	bh=d6/6i3xUhPYgQ6s56JeFkRx77F+D3+xkqXOayMXSPEo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j5LdyOLyXIVAF9bJhdJMSobtHL5KNDWOFSDrCv1yDBWHfTURWBySZ8tdBxWOIaLAP
	 bKvMX2WH0MKJUykNSmKe9KGmNogWzMx06iuySG+42I/1vZTQpxtfh5aJ5DJD2ncLV+
	 BvXj7vLZzgi+fzB+RUVi7X4TUQYHEvAHgr0K0Jrtn0vV/g5vYDklI9rlqXT46+FrKI
	 b/1431qCG1UD2/cRuCLzpyZYmggKw0aaHnY9snfYuPR6pa1IduhN9vKoyJ5AIyrUZ+
	 Kar/ZHwZVFzA0hGioRTq5T5T8UFBvCQbpwO352mAVLacKNCN7RqlTuPj5ppBRqJOCM
	 Q8kIOmfKmd2zQ==
Date: Wed, 22 Apr 2026 09:50:23 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Lee Jones <lee@kernel.org>, 
	Ajit Pandey <ajit.pandey@oss.qualcomm.com>, Imran Shaik <imran.shaik@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, Maulik Shah <maulik.shah@oss.qualcomm.com>, 
	Taniya Das <taniya.das@oss.qualcomm.com>
Subject: Re: [PATCH 04/13] soc: qcom: Introduce CESTA resource manager driver
Message-ID: <20260422-funny-devious-gharial-a5e5c8@quoll>
References: <20260420-cesta-sm870-dispcc-v1-0-eb27d845df9c@oss.qualcomm.com>
 <20260420-cesta-sm870-dispcc-v1-4-eb27d845df9c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260420-cesta-sm870-dispcc-v1-4-eb27d845df9c@oss.qualcomm.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104037-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5A3AB443262
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 20, 2026 at 09:58:57PM +0530, Jagadeesh Kona wrote:
> From: Maulik Shah <maulik.shah@oss.qualcomm.com>
> 
> Add driver for QCOM SoC that have hardware based resource management.
> 
> The hardware IP known as CESTA (Client State Aggregation) have different
> Resource Manager (CESTA Resource Manager) or CRM.
> 
> CRM can be of 4 different types,
>   - CRMC is CRM for clocks local to subsystem
>   - CRMB is CRM for bandwidth votes local to subsystem
>   - CRMB_PT is pass through CRM for bandwidth votes global to subsystem
>   - CRMV is CRM for voltage rail / LDO requirements global to subsystem
> 
> A set of SW DRVs (Direct Resource Voters) can vote to all/subset of
> CRMC/CRMB/CRMB_PT which then takes care of the respective resource voting.
> There is no direct voter on CRMV, rather the CRMC votes picks up the
> respective voltage from LUTs and scales the voltage accordingly required
> for clocks or bandwidth votes.
> 
> Some important aspects of the CRM communication -
>  - Resource votes can be placed in the form of performance operating
>    levels or bandwidth votes for local/global NoCs
>  - SW DRVs vote can be of the Active / Sleep / Wake type
>  - All the resource votes are in the form of CESTA command
>    (resource id, value) pair.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/Kconfig     |  10 +
>  drivers/soc/qcom/Makefile    |   2 +
>  drivers/soc/qcom/crm.c       | 996 +++++++++++++++++++++++++++++++++++++++++++
>  drivers/soc/qcom/trace-crm.h | 111 +++++
>  include/soc/qcom/crm.h       |  72 ++++
>  5 files changed, 1191 insertions(+)
> 
> diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
> index 2caadbbcf8307ff94f5afbdd1481e5e5e291749f..50f6c3cbf12f87ca2bab183e7996dba7312b9f58 100644
> --- a/drivers/soc/qcom/Kconfig
> +++ b/drivers/soc/qcom/Kconfig
> @@ -26,6 +26,16 @@ config QCOM_COMMAND_DB
>  	  resource on a RPM-hardened platform must use this database to get
>  	  SoC specific identifier and information for the shared resources.
>  
> +config QCOM_CRM
> +	tristate "Qualcomm Technologies, Inc. (QTI) CESTA Resource Manager (CRM) driver"

Just "Qualcomm CESTA Resource Manager (CRM) driver"

Eveyrthing is Qualcomm Technologies, Inc. (QTI) and you make it
completely unreadable for the menuconfig.



> +	depends on QCOM_RPMH && (ARCH_QCOM || COMPILE_TEST)

What do you need from rpmh for compile test?

> +	help
> +	  Support for communication with the hardened-CRM blocks in
> +	  Qualcomm Technologies, Inc. (QTI) SoCs. CRM provides interface
> +	  to vote desired power state of resources local or global to a subsystem.
> +	  A set of hardware components aggregate requests for these resources and
> +	  help apply the aggregated power state on the resource.
> +
>  config QCOM_GENI_SE
>  	tristate "QCOM GENI Serial Engine Driver"
>  	depends on ARCH_QCOM || COMPILE_TEST
> diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
> index b7f1d2a5736748b8772c090fd24462fa91f321c6..7f465e86c1b8a4c2657870783a22acc4315a7407 100644
> --- a/drivers/soc/qcom/Makefile
> +++ b/drivers/soc/qcom/Makefile
> @@ -1,9 +1,11 @@
>  # SPDX-License-Identifier: GPL-2.0
> +CFLAGS_crm.o := -I$(src)
>  CFLAGS_rpmh-rsc.o := -I$(src)
>  CFLAGS_qcom_aoss.o := -I$(src)
>  obj-$(CONFIG_QCOM_AOSS_QMP) +=	qcom_aoss.o
>  obj-$(CONFIG_QCOM_GENI_SE) +=	qcom-geni-se.o
>  obj-$(CONFIG_QCOM_COMMAND_DB) += cmd-db.o
> +obj-$(CONFIG_QCOM_CRM)	+= crm.o
>  obj-$(CONFIG_QCOM_GSBI)	+=	qcom_gsbi.o
>  obj-$(CONFIG_QCOM_MDT_LOADER)	+= mdt_loader.o
>  obj-$(CONFIG_QCOM_OCMEM)	+= ocmem.o
> diff --git a/drivers/soc/qcom/crm.c b/drivers/soc/qcom/crm.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..9fc4460a65f7f0b4cc262da48f49b769db434082
> --- /dev/null
> +++ b/drivers/soc/qcom/crm.c
> @@ -0,0 +1,996 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/delay.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/slab.h>
> +#include <linux/spinlock.h>
> +#include <linux/wait.h>
> +
> +#include <soc/qcom/crm.h>
> +
> +#define CREATE_TRACE_POINTS
> +#include "trace-crm.h"
> +
> +#undef field_get
> +#define field_get(_mask, _reg) (((_reg) & (_mask)) >> (ffs(_mask) - 1))
> +
> +#define MAX_NAME_LENGTH			20
> +
> +/* Applicable for SW DRVs BW Registers */
> +#define PERF_OL_VALUE_BITS		0x7
> +
> +/* Applicable for SW DRVs BW Registers */
> +#define BW_VOTE_VALID			BIT(29)
> +/* Applicable only for SW DRVs BW PT Registers */
> +#define BW_PT_VOTE_VALID		BIT(29)
> +#define BW_PT_VOTE_TRIGGER		BIT(0)
> +/* Applicable only for SW DRVs BW Registers */
> +#define BW_VOTE_RESP_REQ		BIT(31)
> +
> +/* Set 1 to Enable IRQ for each VCD */
> +#define IRQ_ENABLE_BIT			BIT(0)
> +#define IRQ_CLEAR_BIT			BIT(0)
> +
> +/* SW DRV has ACTIVE, SLEEP and WAKE PWR STATES */
> +
> +#define MAX_SW_DRV_PWR_STATES		3
> +/* Time out for ACTIVE Only PWR STATE completion IRQ */
> +#define CRM_TIMEOUT_MS			msecs_to_jiffies(10000)
> +
> +/*
> + * Here's a high level overview of CESTA - Client State Aggregation
> + *
> + * - CESTA resource manager (CRM) is used for client side resource management.
> + *   These local resources can be clocks or NoCs. A vote can be placed by DRVs
> + *   (Direct Resource Voters) which can be either SW DRV or HW DRV.
> + *
> + * - Current driver supports placing votes via SW DRVs.
> + *
> + * - A resource vote can be placed by voting to VCD (Virtual Clock Domain) or
> + *   Node (ND).
> + *   Vote can be in the form of
> + *   (1) performance operating level votes - Local clocks scaling
> + *   (2) bandwidth votes - Local NoCs scaling (Camera / Display NoC)
> + *   (3) bandwidth pass through votes - Global resource scaling (DDR)
> + *   Not all CRM can vote via all three forms
> + *
> + * - The base crm address is the DRV base of a register space that is used to place votes.
> + *   Each VCD/ND/PT_ND has IRQ Status/Clear/Enable registers.
> + *
> + * - The config crm address is used to find overall configuration of the hardware including
> + *   version, num_perf_ol_vcds, num_nds and num_nds_pt and no. of SW DRVs.

Wrap the code to match Linux coding style.

...


> +static int crm_probe(struct platform_device *pdev)
> +{
> +	struct device_node *dn = pdev->dev.of_node;

This is NOT called 'dn', but 'np'. Always. Don't copy buggy rpmh code or
other weird drivers.

> +	struct crm_drv_top *crm;
> +	const char *name;
> +	int ret;
> +
> +	crm = devm_kzalloc(&pdev->dev, sizeof(*crm), GFP_KERNEL);
> +	if (!crm)
> +		return -ENOMEM;
> +
> +	crm->desc = of_device_get_match_data(&pdev->dev);
> +	if (!crm->desc)
> +		return -EINVAL;
> +
> +	name = of_get_property(dn, "label", NULL);
> +	if (!name)
> +		name = dev_name(&pdev->dev);
> +
> +	crm->pdev = pdev;
> +	crm->dev = &pdev->dev;
> +	scnprintf(crm->name, sizeof(crm->name), "%s", name);
> +
> +	crm->base = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
> +	if (IS_ERR(crm->base))
> +		return -ENOMEM;
> +
> +	crm->cfg = devm_platform_get_and_ioremap_resource(pdev, 1, NULL);
> +	if (IS_ERR(crm->cfg))
> +		return -ENOMEM;
> +
> +	if (pdev->dev.pm_domain) {
> +		ret = devm_pm_runtime_enable(&pdev->dev);
> +		if (ret)
> +			return ret;
> +
> +		ret = pm_runtime_resume_and_get(&pdev->dev);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	crm->crm_enabled = readl_relaxed(crm->cfg + crm->desc->cfg_regs[CRM_ENABLE]);
> +	if (!crm->crm_enabled) {
> +		dev_err(crm->dev, "%s not enabled, exiting\n", crm->name);

How is this an error? If FW did not enable CRM, it did it on purpose, so
why are you reporting it as an error to the user? What user should do
with that? File a bug report for the FW?

> +		ret = -ENODEV;
> +		goto exit;
> +	}
> +
> +	ret = crm_probe_drvs(crm, dn);
> +	if (ret)
> +		goto exit;
> +
> +	ret = crm_probe_get_irqs(crm);
> +	if (ret)
> +		goto exit;
> +
> +	dev_set_drvdata(&pdev->dev, crm);
> +exit:
> +	if (pdev->dev.pm_domain)
> +		pm_runtime_put(&pdev->dev);
> +
> +	return ret;
> +}
> +
> +static u32 crm_v2_cfg[] = {

Why isn't this const?

> +	[CRM_VERSION]			= 0x0,
> +	[MAJOR_VERSION]			= GENMASK(23, 16),
> +	[MINOR_VERSION]			= GENMASK(15, 8),
> +	[CRM_CFG_PARAM_1]		= 0x4,
> +	[NUM_OF_NODES_PT]		= GENMASK(31, 27),
> +	[NUM_VCD_VOTED_BY_BW]		= GENMASK(26, 24),
> +	[NUM_SW_DRVS]			= GENMASK(23, 20),
> +	[NUM_OF_RAILS]			= GENMASK(15, 12),
> +	[NUM_VCD_VOTED_BY_PERF_OL]	= GENMASK(11, 8),
> +	[CRM_CFG_PARAM_2]		= 0x8,
> +	[NUM_OF_NODES]			= GENMASK(30, 26),
> +	[CRM_ENABLE]			= 0xc,
> +};

Best regards,
Krzysztof


