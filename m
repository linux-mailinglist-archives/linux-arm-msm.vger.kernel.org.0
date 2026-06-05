Return-Path: <linux-arm-msm+bounces-111386-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uz4XIkutImoYcAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111386-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 13:04:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1EC6479B5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 13:04:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=ZiGCqXRn;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111386-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111386-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 89637301185D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jun 2026 10:58:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B99994C77D3;
	Fri,  5 Jun 2026 10:58:11 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C4B30C629;
	Fri,  5 Jun 2026 10:58:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780657091; cv=none; b=XkIxbGG5WmEYAJlwkGAna1vUAUxqcey72LDEP8w7ARNnmaNrfj57O6/HqHCzBFMI66d5uEYHuQKsReWEgKT3OFr4RImYA5X8WVQ/Fm9QLxM4n94LPTSElckyOpSo0D7ECgchoRsf1BHEZj3mFS0apDZwlPR8ztuZk0WmXSdPg/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780657091; c=relaxed/simple;
	bh=wGGVS93ASZq1Wi1PBhkxT8yl+BDnoXj9jlp0ra3d/2Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XnYVQa4TvHwH/jP5hSpo5jrXSTOBlKRDX4kAvcLP79nO4dg0Ujc8eZevta96Gy+ku8kbP73vNFU++n2Csce59AeWdQ0spLEfFrLL4gGF12fU2FZqo62TpZCKVJUHoXnQoPt1+At1OK8bvcsSICR8pJnmEN/aetUre4PBWrGWjPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZiGCqXRn; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 316DF1F00893;
	Fri,  5 Jun 2026 10:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780657090;
	bh=WoQYpwLqys1HKd275mQQZSCn3qoccYG+WZuCTOzum3w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=ZiGCqXRne5sfw4oDsmh3hq65XsR3qlUV0r1+QF46WkBZNPKu4kLAmvafGZcFPWDsc
	 9weKbfS+lZW9H5Bd5hbuNHR1iYbt/nJqKJxadj4mfg2ynpd30gfym1um83kB6mF9r5
	 O2BWQyjcDcBq9qswNlKgOYBrYpCQZDwCRrLGqINNB3MMJrNcSYlJwDF9ahzDLYViEk
	 ztlX4LnoLQQc+7cFdSYXILpg9V9Fy+fH1yfkSERCRoVn4xRgJS/25GiAa6intP/ON2
	 KDaNoZTfRORhmRw0xawSoSatd2zZrALwwlB/G3ElzY6BnROpvcQnkYcqXfwviRQVQu
	 7XEZziNAe1aDw==
Message-ID: <d82f95fe-4c74-4488-9b1c-ecf28a59a602@kernel.org>
Date: Fri, 5 Jun 2026 12:58:02 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/13] ASoC: qcom: Add Shikra QAIF support
To: Harendra Gautam <harendra.gautam@oss.qualcomm.com>,
 Srinivas Kandagatla <srini@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260605103739.3557573-1-harendra.gautam@oss.qualcomm.com>
 <20260605103739.3557573-14-harendra.gautam@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20260605103739.3557573-14-harendra.gautam@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111386-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:harendra.gautam@oss.qualcomm.com,m:srini@kernel.org,m:broonie@kernel.org,m:lgirdwood@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1B1EC6479B5

On 05/06/2026 12:37, Harendra Gautam wrote:
> diff --git a/sound/soc/qcom/qaif-shikra.c b/sound/soc/qcom/qaif-shikra.c
> new file mode 100644
> index 000000000000..e83564503087
> --- /dev/null
> +++ b/sound/soc/qcom/qaif-shikra.c
> @@ -0,0 +1,585 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + *
> + * qaif-shikra.c -- ALSA SoC CPU-Platform DAI driver for QTi QAIF
> + */
> +
> +#include <linux/module.h>
> +#include <sound/pcm.h>
> +#include <sound/soc.h>
> +#include <linux/pm.h>
> +#include "qaif.h"
> +
> +struct qaif_dmaidx_dai_map shikra_aif_dma_dai_map[] = {

Why is this global? And why not const?

I have doubts this passes builds without warnings.

Please run standard kernel tools for static analysis, like coccinelle,
smatch and sparse, and fix reported warnings. Also please check for
warnings when building with W=1 for gcc and clang. Most of these
commands (checks or W=1 build) can build specific targets, like some
directory, to narrow the scope to only your code. The code here looks
like it needs a fix. Feel free to get in touch if the warning is not clear.

> +		{ QAIF_MI2S_TDM_AIF0 },
> +		{ QAIF_MI2S_TDM_AIF1 },
> +		{ QAIF_MI2S_TDM_AIF2 },
> +		{ QAIF_MI2S_TDM_AIF3 }
> +};
> +

...

> +
> +static int shikra_qaif_init(struct platform_device *pdev)
> +{
> +	struct qaif_drv_data *drvdata = platform_get_drvdata(pdev);
> +	const struct qaif_variant *v = drvdata->variant;
> +	struct device *dev = &pdev->dev;
> +	int ret, i;
> +
> +	if (!v) {
> +		dev_err(dev, "No variant data\n");
> +		return -EINVAL;
> +	}
> +	if (v->num_clks == 0 || v->num_clks > QAIF_MAX_VARIANT_CLKS) {
> +		dev_err(dev, "Invalid clock count: %d\n", v->num_clks);
> +		return -EINVAL;
> +	}
> +	drvdata->clks = devm_kcalloc(dev, v->num_clks,
> +				     sizeof(*drvdata->clks), GFP_KERNEL);
> +	if (!drvdata->clks)
> +		return -ENOMEM;
> +
> +	drvdata->num_clks = v->num_clks;
> +
> +	for (i = 0; i < drvdata->num_clks; i++)
> +		drvdata->clks[i].id = v->clk_name[i];
> +
> +	ret = devm_clk_bulk_get(dev, drvdata->num_clks, drvdata->clks);
> +	if (ret) {
> +		dev_err(dev, "Failed to get clocks %d\n", ret);

Is this probe path? If so, use dev_err_probe - please look at other
drivers how they are written.

Also, probe calls should be obvious, so often suffixed  "probe" not
"init". But maybe it's not probe path...

> +		return ret;
> +	}
> +
> +	ret = clk_bulk_prepare_enable(drvdata->num_clks, drvdata->clks);
> +	if (ret) {
> +		dev_err(dev, "shikra clk_enable failed\n");
> +		return ret;
> +	}
> +


...

> +	/* AUDIO_CORE_QAIF_AUD_INTFa_BIT_WIDTH_CFG (0x4008 + 0x1000*a) */
> +	.aif_sample_width_rx					= REG_FIELD_ID(0x4008, 24, 28, 4, 0x1000),
> +	.aif_sample_width_tx					= REG_FIELD_ID(0x4008, 16, 20, 4, 0x1000),
> +	.aif_slot_width_rx						= REG_FIELD_ID(0x4008, 8, 12, 4, 0x1000),
> +	.aif_slot_width_tx						= REG_FIELD_ID(0x4008, 0, 4, 4, 0x1000),
> +
> +	/* AUDIO_CORE_QAIF_AUD_INTFa_FRAME_CFG (0x400C + 0x1000*a) */
> +	.aif_bits_per_lane						= REG_FIELD_ID(0x400C, 0, 9, 4, 0x1000),
> +
> +	/* AUDIO_CORE_QAIF_AUD_INTFa_ACTV_SLOT_EN_TX (0x4010 + 0x1000*a) */
> +	.aif_slot_en_tx_mask					= REG_FIELD_ID(0x4010, 0, 31, 4, 0x1000),
> +
> +	/* AUDIO_CORE_QAIF_AUD_INTFa_ACTV_SLOT_EN_RX (0x4030 + 0x1000*a) */
> +	.aif_slot_en_rx_mask					= REG_FIELD_ID(0x4030, 0, 31, 4, 0x1000),
> +
> +	/* AUDIO_CORE_QAIF_AUD_INTFa_LANE_CFG (0x4050 + 0x1000*a) */
> +	.aif_loopback_en						= REG_FIELD_ID(0x4050, 31, 31, 4, 0x1000),
> +	.aif_ctrl_data_oe						= REG_FIELD_ID(0x4050, 16, 16, 4, 0x1000),
> +	.aif_lane_en							= REG_FIELD_ID(0x4050, 8, 15, 4, 0x1000),
> +	.aif_lane_dir							= REG_FIELD_ID(0x4050, 0, 7, 4, 0x1000),
> +
> +	/* AUDIO_CORE_QAIF_AUD_INTFa_MI2S_CFG (0x4054 + 0x1000*a) */
> +	.aif_mono_mode_rx						= REG_FIELD_ID(0x4054, 1, 1, 4, 0x1000),
> +	.aif_mono_mode_tx						= REG_FIELD_ID(0x4054, 0, 0, 4, 0x1000),
> +
> +	/* AUDIO_CORE_QAIF_AUD_INTFa_CFG (0x4058 + 0x1000*a) */
> +	.aif_full_cycle_en						= REG_FIELD_ID(0x4058, 0, 0, 4, 0x1000),


Honestly, I find everything above completely unreadable.

> +
> +	.clk_name			= (const char*[]) {
> +							"lpass_config_clk",
> +							"lpass_core_axim_clk",
> +							"bus_clk"
> +						},

Same here.

> +	.num_clks			= 3,
> +
> +	.dai_driver			= shikra_qaif_cpu_dai_driver,
> +	.num_dai			= ARRAY_SIZE(shikra_qaif_cpu_dai_driver),
> +
> +	.dai_osr_clk_names		= (const char *[]) {
> +							"null"
> +							},
> +	.dai_bit_clk_names		= (const char *[]) {
> +							"aif_if0_ibit_clk",
> +							"aif_if1_ibit_clk",
> +							"aif_if2_ibit_clk",
> +							"aif_if3_ibit_clk"
> +							},
> +	.init					= shikra_qaif_init,
> +	.exit					= shikra_qaif_exit,
> +	.alloc_stream_dma_idx	= shikra_qaif_alloc_stream_dma_idx,
> +	.free_stream_dma_idx	= shikra_qaif_free_stream_dma_idx,	
> +	.get_dma_idx			= shikra_qaif_get_dma_idx,
> +};
> +
> +static const struct of_device_id shikra_qaif_cpu_device_id[] = {
> +	{.compatible = "qcom,shikra-qaif-cpu", .data = &shikra_qaif_data},
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, shikra_qaif_cpu_device_id);
> +
> +static struct platform_driver shikra_qaif_cpu_platform_driver = {
> +	.driver = {
> +		.name = "shikra-qaif-cpu",
> +		.of_match_table = of_match_ptr(shikra_qaif_cpu_device_id),

You have warnings here. Drop of_match_ptr.

> +		.pm = &shikra_qaif_pm_ops,
> +	},
> +	.probe = asoc_qcom_qaif_cpu_platform_probe,
> +	.remove = asoc_qcom_qaif_cpu_platform_remove,
> +	.shutdown = asoc_qcom_qaif_cpu_platform_shutdown,
> +};
> +module_platform_driver(shikra_qaif_cpu_platform_driver);
> +
> +MODULE_DESCRIPTION("Qualcomm Audio Interface (QAIF) Shikra variant driver");
> +MODULE_AUTHOR("Harendra Gautam <harendra.gautam@oss.qualcomm.com>");
> +MODULE_LICENSE("GPL");


Best regards,
Krzysztof

