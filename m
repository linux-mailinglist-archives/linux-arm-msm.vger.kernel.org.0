Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3702062DA2F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Nov 2022 13:05:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239936AbiKQMFp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Nov 2022 07:05:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239934AbiKQMFo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Nov 2022 07:05:44 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C02DC697DF
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Nov 2022 04:05:42 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id j16so2405307lfe.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Nov 2022 04:05:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4vBJfku2YOPCei0NDUQlkZ+DR+fRz7GEW44wY/UG+q0=;
        b=aklIwLaZvWRzyrrA/HjRTUq3wtQs/4MqAmVQARezMs8k7na5dWIRPMHLPdXauIyW9k
         4qZCYETBbt45FpEcydnipVLOWqUAZ5Xgb3U403aen8BAzzEfBQpmM/9PVyw/j+OTY/IK
         iWnZofDHdpOpC0dxssF9k9bR5tjVfyg7ccnY2bTcOnARb8FbyzrE4MSAF8zxy9dJv6oQ
         B5qBgZSeS9FoQn7arjlQ2PXExP16W9peA00bNT6aG5BrRecUkOK92GjUnuqTnUC+fSbW
         QVmMzcG+1Mc9zLDoJKVfjYT5U094xTJoJmtRiTcOFtMojtE00G5bRvPZFydyZMTr1nIF
         LAGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4vBJfku2YOPCei0NDUQlkZ+DR+fRz7GEW44wY/UG+q0=;
        b=A6/9ue5DHdjV6ik5ivLm4uiabfKs4JsP4KOAwTA8+ta+3ARYrOc0913N+k6bYx1diY
         M3SIM72cQb2zju2ZtHvRU3Sks5ZZi1jPd//MbPBQSfLI3Tx4EVuIHUPCQGW+KLqmFCaR
         g6CFYHvbyz53BonSGQPH/bjFhFnRFp+BsnhJyMDrEbifbESTjSWknnjR/D+y2OVhPMJf
         TAgCDr8Z0YSiw4rHya99D0SL2Q6CJ3JiAt6NuTXXqmXyWGYSDT1gJ8lpgPoNgzC2RdnR
         ibuNFQ4QFBu8tM3tmUjYRpnlvcPW+mCpDio6rbDl/jJMUi85NMA3ZtA/6F/Ai1hRE34M
         lKsQ==
X-Gm-Message-State: ANoB5pkIYldA1jhrywU4uRdpQE2mEMMUYbauN3D+OUnsD1oNNoDkwHTD
        4h1F9PzFChHQSMWwS6oWL4785g==
X-Google-Smtp-Source: AA0mqf7HnyKwK5jfl0Gp7nDtxl4GeheMQZKwYUXWChctipW7ciAHx3LUdUwAk0LFGl/dbBNAAekj0Q==
X-Received: by 2002:ac2:510c:0:b0:4af:d4e:dfa7 with SMTP id q12-20020ac2510c000000b004af0d4edfa7mr741241lfb.582.1668686740979;
        Thu, 17 Nov 2022 04:05:40 -0800 (PST)
Received: from [10.10.15.130] ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id h22-20020a2e3a16000000b00278e9c0d3a2sm166005lja.33.2022.11.17.04.05.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Nov 2022 04:05:40 -0800 (PST)
Message-ID: <8b1614c5-7634-6681-b19a-cb2c68e80c61@linaro.org>
Date:   Thu, 17 Nov 2022 14:05:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v3 2/2] soc: qcom: Add Qualcomm Ramp Controller driver
Content-Language: en-GB
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>, agross@kernel.org
Cc:     andersson@kernel.org, konrad.dybcio@somainline.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, marijn.suijten@somainline.org,
        kernel@collabora.com
References: <20221115154555.324437-1-angelogioacchino.delregno@collabora.com>
 <20221115154555.324437-3-angelogioacchino.delregno@collabora.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221115154555.324437-3-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 15/11/2022 18:45, AngeloGioacchino Del Regno wrote:
> The Ramp Controller is used to program the sequence ID for pulse
> swallowing, enable sequence and linking sequence IDs for the CPU
> cores on some Qualcomm SoCs.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>   drivers/soc/qcom/Kconfig           |   9 +
>   drivers/soc/qcom/Makefile          |   1 +
>   drivers/soc/qcom/ramp_controller.c | 331 +++++++++++++++++++++++++++++
>   3 files changed, 341 insertions(+)
>   create mode 100644 drivers/soc/qcom/ramp_controller.c
> 
> diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
> index 024e420f1bb7..d174183a26f7 100644
> --- a/drivers/soc/qcom/Kconfig
> +++ b/drivers/soc/qcom/Kconfig
> @@ -95,6 +95,15 @@ config QCOM_QMI_HELPERS
>   	tristate
>   	depends on NET
>   
> +config QCOM_RAMP_CTRL
> +	tristate "Qualcomm Ramp Controller driver"
> +	depends on ARCH_QCOM || COMPILE_TEST
> +	help
> +	  The Ramp Controller is used to program the sequence ID for pulse
> +	  swallowing, enable sequence and link sequence IDs for the CPU
> +	  cores on some Qualcomm SoCs.
> +	  Say y here to enable support for the ramp controller.
> +
>   config QCOM_RMTFS_MEM
>   	tristate "Qualcomm Remote Filesystem memory driver"
>   	depends on ARCH_QCOM
> diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
> index d66604aff2b0..6e02333c4080 100644
> --- a/drivers/soc/qcom/Makefile
> +++ b/drivers/soc/qcom/Makefile
> @@ -10,6 +10,7 @@ obj-$(CONFIG_QCOM_OCMEM)	+= ocmem.o
>   obj-$(CONFIG_QCOM_PDR_HELPERS)	+= pdr_interface.o
>   obj-$(CONFIG_QCOM_QMI_HELPERS)	+= qmi_helpers.o
>   qmi_helpers-y	+= qmi_encdec.o qmi_interface.o
> +obj-$(CONFIG_QCOM_RAMP_CTRL)	+= ramp_controller.o
>   obj-$(CONFIG_QCOM_RMTFS_MEM)	+= rmtfs_mem.o
>   obj-$(CONFIG_QCOM_RPMH)		+= qcom_rpmh.o
>   qcom_rpmh-y			+= rpmh-rsc.o
> diff --git a/drivers/soc/qcom/ramp_controller.c b/drivers/soc/qcom/ramp_controller.c
> new file mode 100644
> index 000000000000..b403493f3541
> --- /dev/null
> +++ b/drivers/soc/qcom/ramp_controller.c
> @@ -0,0 +1,331 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Qualcomm Ramp Controller driver
> + * Copyright (c) 2022, AngeloGioacchino Del Regno
> + *                     <angelogioacchino.delregno@collabora.com>
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/types.h>
> +
> +#define RC_UPDATE_EN		BIT(0)
> +#define RC_ROOT_EN		BIT(1)
> +
> +#define RC_REG_CFG_UPDATE	0x60
> +#define RC_CFG_UPDATE_EN	BIT(8)
> +#define RC_CFG_ACK		GENMASK(31, 16)
> +
> +#define RC_DCVS_CFG_SID		2
> +#define RC_LINK_SID		3
> +#define RC_LMH_SID		6
> +#define RC_DFS_SID		14
> +
> +#define RC_UPDATE_TIMEOUT_US	500
> +
> +/**
> + * struct qcom_ramp_controller_desc - SoC specific parameters
> + * @cfg_dfs_sid:      Dynamic Frequency Scaling SID configuration
> + * @cfg_link_sid:     Link SID configuration
> + * @cfg_lmh_sid:      Limits Management hardware SID configuration
> + * @cfg_ramp_pre_en:  Ramp Controller pre-enable sequence
> + * @cfg_ramp_en:      Ramp Controller enable sequence
> + * @cfg_ramp_post_en: Ramp Controller post-enable sequence
> + * @cfg_ramp_dis:     Ramp Controller disable sequence
> + * @cmd_reg:          Command register offset
> + * @num_dfs_sids:     Number of DFS SIDs (max 8)
> + * @num_link_sids:    Number of Link SIDs (max 3)
> + * @num_lmh_sids:     Number of LMh SIDs (max 8)
> + */
> +struct qcom_ramp_controller_desc {
> +	const struct reg_sequence *cfg_dfs_sid;
> +	const struct reg_sequence *cfg_link_sid;
> +	const struct reg_sequence *cfg_lmh_sid;
> +	const struct reg_sequence *cfg_ramp_pre_en;
> +	const struct reg_sequence *cfg_ramp_en;
> +	const struct reg_sequence *cfg_ramp_post_en;
> +	const struct reg_sequence *cfg_ramp_dis;
> +	u8 cmd_reg;
> +	u8 num_dfs_sids;
> +	u8 num_link_sids;
> +	u8 num_lmh_sids;
> +};
> +
> +/**
> + * struct qcom_ramp_controller - Main driver structure
> + * @regmap: Regmap handle
> + * @desc:   SoC specific parameters
> + */
> +struct qcom_ramp_controller {
> +	struct regmap *regmap;
> +	const struct qcom_ramp_controller_desc *desc;
> +};
> +
> +/**
> + * rc_wait_for_update() - Wait for Ramp Controller root update
> + * @qrc: Main driver structure
> + *
> + * Return: Zero for success or negative number for failure
> + */
> +static int rc_wait_for_update(struct qcom_ramp_controller *qrc)
> +{
> +	const struct qcom_ramp_controller_desc *d = qrc->desc;
> +	struct regmap *r = qrc->regmap;
> +	u32 val;
> +	int ret;
> +
> +	ret = regmap_set_bits(r, d->cmd_reg, RC_ROOT_EN);
> +	if (ret)
> +		return ret;
> +
> +	return regmap_read_poll_timeout(r, d->cmd_reg, val, !(val & RC_UPDATE_EN),
> +					1, RC_UPDATE_TIMEOUT_US);
> +}
> +
> +/**
> + * rc_set_cfg_update() - Ramp Controller configuration update
> + * @qrc: Main driver structure
> + * @ce: Configuration entry to update
> + *
> + * Return: Zero for success or negative number for failure
> + */
> +static int rc_set_cfg_update(struct qcom_ramp_controller *qrc, u8 ce)
> +{
> +	const struct qcom_ramp_controller_desc *d = qrc->desc;
> +	struct regmap *r = qrc->regmap;
> +	u32 ack, val;
> +	int ret;
> +
> +	/* The ack bit is between bits 16-31 of RC_REG_CFG_UPDATE */
> +	ack = FIELD_PREP(RC_CFG_ACK, BIT(ce));
> +
> +	/* Write the configuration type first... */
> +	ret = regmap_set_bits(r, d->cmd_reg + RC_REG_CFG_UPDATE, ce);
> +	if (ret)
> +		return ret;
> +
> +	/* ...and after that, enable the update bit to sync the changes */
> +	ret = regmap_set_bits(r, d->cmd_reg + RC_REG_CFG_UPDATE, RC_CFG_UPDATE_EN);
> +	if (ret)
> +		return ret;
> +
> +	/* Wait for the changes to go through */
> +	ret = regmap_read_poll_timeout(r, d->cmd_reg + RC_REG_CFG_UPDATE, val,
> +				       val & ack, 1, RC_UPDATE_TIMEOUT_US);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * Configuration update success! The CFG_UPDATE register will not be
> +	 * cleared automatically upon applying the configuration, so we have
> +	 * to do that manually in order to leave the ramp controller in a
> +	 * predictable and clean state.
> +	 */
> +	ret = regmap_write(r, d->cmd_reg + RC_REG_CFG_UPDATE, 0);
> +	if (ret)
> +		return ret;
> +
> +	/* Wait for the update bit cleared ack */
> +	return regmap_read_poll_timeout(r, d->cmd_reg + RC_REG_CFG_UPDATE,
> +					val, !(val & RC_CFG_ACK), 1,
> +					RC_UPDATE_TIMEOUT_US);
> +}
> +
> +/**
> + * rc_write_cfg - Send configuration sequence
> + * @qrc: Main driver structure
> + * @seq: Register sequence to send before asking for update
> + * @ce: Configuration SID
> + * @nsids: Total number of SIDs
> + *
> + * Returns: Zero for success or negative number for error
> + */
> +static int rc_write_cfg(struct qcom_ramp_controller *qrc,
> +			const struct reg_sequence *seq,
> +			u16 ce, u8 nsids)
> +{
> +	int ret;
> +	u8 i;
> +
> +	/* Check if, and wait until the ramp controller is ready */
> +	ret = rc_wait_for_update(qrc);
> +	if (ret)
> +		return ret;
> +
> +	/* Write the sequence */
> +	ret = regmap_multi_reg_write(qrc->regmap, seq, nsids);
> +	if (ret)
> +		return ret;
> +
> +	/* Pull the trigger: do config update starting from the last sid */
> +	for (i = 0; i < nsids; i++) {
> +		ret = rc_set_cfg_update(qrc, (u8)ce - i);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * rc_ramp_ctrl_enable() - Enable Ramp up/down Control
> + * @qrc: Main driver structure
> + *
> + * Return: Zero for success or negative number for error
> + */
> +static int rc_ramp_ctrl_enable(struct qcom_ramp_controller *qrc)
> +{
> +	const struct qcom_ramp_controller_desc *d = qrc->desc;
> +	int ret;
> +
> +	ret = rc_write_cfg(qrc, d->cfg_ramp_pre_en, RC_DCVS_CFG_SID, 1);

ARRAY_SIZE or num_somthing (here and below)

> +	if (ret)
> +		return ret;
> +
> +	ret = rc_write_cfg(qrc, d->cfg_ramp_en, RC_DCVS_CFG_SID, 1);
> +	if (ret)
> +		return ret;
> +
> +	return rc_write_cfg(qrc, d->cfg_ramp_post_en, RC_DCVS_CFG_SID, 1);

Is there any benefit from having separate pre_en, en and post_en configs 
here? I'd suggest using a single array in the configuration.

> +}
> +
> +/**
> + * qcom_ramp_controller_start() - Initialize and start the ramp controller
> + * @qrc: Main driver structure
> + *
> + * The Ramp Controller needs to be initialized by programming the relevant
> + * registers with SoC-specific configuration: once programming is done,
> + * the hardware will take care of the rest (no further handling required).
> + *
> + * Return: Zero for success or negative number for error
> + */
> +static int qcom_ramp_controller_start(struct qcom_ramp_controller *qrc)
> +{
> +	const struct qcom_ramp_controller_desc *d = qrc->desc;
> +	int ret;
> +
> +	/* Program LMH, DFS, Link SIDs */
> +	ret = rc_write_cfg(qrc, d->cfg_lmh_sid, RC_LMH_SID, d->num_lmh_sids);
> +	if (ret)
> +		return ret;
> +
> +	ret = rc_write_cfg(qrc, d->cfg_dfs_sid, RC_DFS_SID, d->num_dfs_sids);
> +	if (ret)
> +		return ret;
> +
> +	ret = rc_write_cfg(qrc, d->cfg_link_sid, RC_LINK_SID, d->num_link_sids);
> +	if (ret)
> +		return ret;
> +
> +	/* Everything is ready! Enable the ramp up/down control */
> +	return rc_ramp_ctrl_enable(qrc);
> +}
> +
> +static const struct regmap_config qrc_regmap_config = {
> +	.reg_bits = 32,
> +	.reg_stride = 4,
> +	.val_bits = 32,
> +	.max_register =	0x68,
> +	.fast_io = true,
> +};
> +
> +static const struct qcom_ramp_controller_desc msm8976_rc_cfg = {
> +	.cfg_dfs_sid = (const struct reg_sequence[]) {
> +		{ 0x10, 0xfefebff7 },
> +		{ 0x14, 0xfdff7fef },
> +		{ 0x18, 0xfbffdefb },
> +		{ 0x1c, 0xb69b5555 },
> +		{ 0x20, 0x24929249 },
> +		{ 0x24, 0x49241112 },
> +		{ 0x28, 0x11112111 },
> +		{ 0x2c, 0x8102 },
> +	},

Please move these config arrays to the named constants. This would allow 
you to use ARRAY_SIZE below, for num_foo_sids variables.

> +	.cfg_link_sid = (const struct reg_sequence[]) {
> +		{ 0x40, 0xfc987 },
> +	},
> +	.cfg_lmh_sid = (const struct reg_sequence[]) {
> +		{ 0x30, 0x77706db },
> +		{ 0x34, 0x5550249 },
> +		{ 0x38, 0x111 },
> +	},
> +	.cfg_ramp_pre_en = (const struct reg_sequence[]) {
> +		{ 0x50, 0x800 },
> +	},
> +	.cfg_ramp_en = (const struct reg_sequence[]) {
> +		{ 0x50, 0xc00 },
> +	},
> +	.cfg_ramp_post_en = (const struct reg_sequence[]) {
> +		{ 0x50, 0x400 },
> +	},
> +	.cfg_ramp_dis = (const struct reg_sequence[]) {
> +		{ 0x50, 0x0 },
> +	},
> +	.cmd_reg = 0x0,
> +
> +	.num_dfs_sids = 8,
> +	.num_lmh_sids = 3,
> +	.num_link_sids = 1,
> +};
> +
> +static int qcom_ramp_controller_probe(struct platform_device *pdev)
> +{
> +	struct qcom_ramp_controller *qrc;
> +	void __iomem *base;
> +
> +	base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);
> +
> +	qrc = devm_kmalloc(&pdev->dev, sizeof(*qrc), GFP_KERNEL);
> +	if (!qrc)
> +		return -ENOMEM;
> +
> +	qrc->desc = device_get_match_data(&pdev->dev);
> +	if (!qrc)
> +		return -EINVAL;
> +
> +	qrc->regmap = devm_regmap_init_mmio(&pdev->dev, base, &qrc_regmap_config);
> +	if (IS_ERR(qrc->regmap))
> +		return PTR_ERR(qrc->regmap);
> +
> +	platform_set_drvdata(pdev, qrc);
> +
> +	return qcom_ramp_controller_start(qrc);
> +}
> +
> +static int qcom_ramp_controller_remove(struct platform_device *pdev)
> +{
> +	struct qcom_ramp_controller *qrc = platform_get_drvdata(pdev);
> +
> +	return rc_write_cfg(qrc, qrc->desc->cfg_ramp_dis, RC_DCVS_CFG_SID, 1);

ARRAY_SIZE or num_something

> +}
> +
> +static const struct of_device_id qcom_ramp_controller_match_table[] = {
> +	{ .compatible = "qcom,msm8976-ramp-controller", .data = &msm8976_rc_cfg },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, qcom_ramp_controller_match_table);
> +
> +static struct platform_driver qcom_ramp_controller_driver = {
> +	.driver = {
> +		.name = "qcom-ramp-controller",
> +		.of_match_table = qcom_ramp_controller_match_table,
> +		.suppress_bind_attrs = true,
> +	},
> +	.probe  = qcom_ramp_controller_probe,
> +	.remove = qcom_ramp_controller_remove,
> +};
> +
> +static int __init qcom_ramp_controller_init(void)
> +{
> +	return platform_driver_register(&qcom_ramp_controller_driver);
> +}
> +arch_initcall(qcom_ramp_controller_init);
> +
> +MODULE_AUTHOR("AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>");
> +MODULE_DESCRIPTION("Qualcomm Ramp Controller driver");
> +MODULE_LICENSE("GPL");

-- 
With best wishes
Dmitry

