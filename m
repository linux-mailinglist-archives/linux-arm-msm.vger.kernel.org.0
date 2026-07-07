Return-Path: <linux-arm-msm+bounces-117301-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8cBEI+bnTGpkrwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117301-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 13:49:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EB88571B195
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 13:49:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linux.dev header.s=key1 header.b=jf9VX3c1;
	dmarc=pass (policy=none) header.from=linux.dev;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117301-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117301-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5D1393028B17
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 11:44:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D97E92FF176;
	Tue,  7 Jul 2026 11:44:29 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1CF4380FFB
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 11:44:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783424669; cv=none; b=ERL3kY1pkxfpTiu3+avb6MScTws+hwx1kOUW/RIfnr01pFEeM81rSyHwT2aILckIogOdW1dIqnpEjFO4s6GyjpQbCCmI+Wu7JSPwR1fSEarbjCSYaII6qnSbFg2pGLMWBB4+C++EHDzD2BUdi6l/HPD16p4yd5/Lil2GAVDSCIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783424669; c=relaxed/simple;
	bh=WFYEVVSbgNs8XAtY93+RN8xS7ng1zQ2Y0fm50yX8koU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K+YymQ3qNU9VRO6yCnKr1uWtF4LVIhwjzxrabG6YuMVNx5VeoUh0A4cN0PjbC/Qs8x98sYlsdZxWoJHPrvrujyVL9D3UfhEBmDYqctj/o60fizEiGcYuiHjltXQkKBcQ3/nPvh74zJ1tHg9dlA8pMT2XJP1ceSVHta3UEO9QbLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=jf9VX3c1; arc=none smtp.client-ip=91.218.175.179
Message-ID: <d643de20-50db-4f5c-a803-f1737da253fe@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1783424664;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b5InLZPKmJmUGGewSO9D1ukxO8lRy69ma2dzXOa9xiU=;
	b=jf9VX3c1p/2ED60VZNG3QEc5GQC9ryU4SSLHD1mqbbPIUjVZq0+GncepjNWyJlF5DmJwyi
	f3HgxxchpDcDcJsAooOaOhDts6ppbu45bls10ARSKXjEIq9koucrigtqSvlQO5wLA5dvWO
	3aOqlCMlgUGAGW1rg7vmjNu6puTaa78=
Date: Tue, 7 Jul 2026 13:42:26 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 3/3] ASoC: codecs: wcd9378: add TX/capture codec driver
To: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
 Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Luca Weiss <luca.weiss@fairphone.com>, Conor Dooley <conor+dt@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260706192229.144137-1-jorijnvdgraaf@catcrafts.net>
 <20260706192229.144137-4-jorijnvdgraaf@catcrafts.net>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20260706192229.144137-4-jorijnvdgraaf@catcrafts.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117301-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[pierre-louis.bossart@linux.dev,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:jorijnvdgraaf@catcrafts.net,m:broonie@kernel.org,m:srini@kernel.org,m:lgirdwood@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:luca.weiss@fairphone.com,m:conor+dt@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:mohammad.rafi.shaik@oss.qualcomm.com,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,fairphone.com,perex.cz,suse.com,oss.qualcomm.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pierre-louis.bossart@linux.dev,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[linux.dev:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,linux.dev:from_mime,linux.dev:dkim,linux.dev:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EB88571B195


> +/*
> + * Tell the codec the bus clock: base 19.2 MHz plus a scale (div) per bank.
> + * The downstream driver writes these raw SCP registers on every capture
> + * start; here the bus_config callback covers bank switches.
> + */
> +static int wcd9378_bus_config(struct sdw_slave *slave,
> +			      struct sdw_bus_params *params)
> +{
> +	u8 scale;
> +
> +	switch (params->curr_dr_freq) {
> +	case 4800000:
> +		scale = WCD9378_SWRS_CLK_SCALE_DIV4;
> +		break;
> +	case 9600000:
> +	default:
> +		scale = WCD9378_SWRS_CLK_SCALE_DIV2;
> +		break;
> +	}
> +
> +	sdw_write(slave, WCD9378_SWRS_SCP_HOST_CLK_DIV2_CTL(params->next_bank),
> +		  0x01);
> +	sdw_write(slave, WCD9378_SWRS_SCP_BASE_CLK,
> +		  WCD9378_SWRS_BASE_CLK_19P2MHZ);
> +	sdw_write(slave, WCD9378_SWRS_SCP_BUSCLK_SCALE_BANK0, scale);
> +	sdw_write(slave, WCD9378_SWRS_SCP_BUSCLK_SCALE_BANK1, scale);
> +
> +	return 0;
> +}

Changes to SCP registers are generally done by the SoundWire core. 
IIRC there is already support for setting the bus scaling registers. Not sure why this function is needed?


> +static int wcd9378_sdw_probe(struct sdw_slave *pdev,
> +			     const struct sdw_device_id *id)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct wcd9378_sdw_priv *wcd;
> +	u8 master_ch_mask[WCD9378_MAX_SWR_CH_IDS];
> +	int master_ch_mask_size = 0;
> +	int ret, i;
> +
> +	wcd = devm_kzalloc(dev, sizeof(*wcd), GFP_KERNEL);
> +	if (!wcd)
> +		return -ENOMEM;
> +
> +	/* Port map index starts at 0, however the data ports start at index 1 */
> +	if (of_property_present(dev->of_node, "qcom,tx-port-mapping")) {
> +		wcd->is_tx = true;
> +		ret = of_property_read_u32_array(dev->of_node, "qcom,tx-port-mapping",
> +						 &pdev->m_port_map[1],
> +						 WCD9378_MAX_TX_SWR_PORTS);
> +	} else {
> +		ret = of_property_read_u32_array(dev->of_node, "qcom,rx-port-mapping",
> +						 &pdev->m_port_map[1],
> +						 WCD9378_MAX_SWR_PORTS);
> +	}
> +	if (ret < 0)
> +		dev_info(dev, "Error getting static port mapping for %s (%d)\n",
> +			 wcd->is_tx ? "TX" : "RX", ret);
> +
> +	wcd->sdev = pdev;
> +	dev_set_drvdata(dev, wcd);
> +
> +	pdev->prop.scp_int1_mask = SDW_SCP_INT1_BUS_CLASH |
> +				   SDW_SCP_INT1_PARITY;
> +	pdev->prop.lane_control_support = true;
> +	pdev->prop.simple_clk_stop_capable = true;
> +	/* The SDCA control space sits above the 16-bit address range */
> +	pdev->prop.paging_support = true;
> +
> +	memset(master_ch_mask, 0, WCD9378_MAX_SWR_CH_IDS);
> +
> +	if (wcd->is_tx) {
> +		master_ch_mask_size = of_property_count_u8_elems(dev->of_node,
> +								 "qcom,tx-channel-mapping");
> +		master_ch_mask_size = min_t(int, master_ch_mask_size,
> +					    ARRAY_SIZE(wcd9378_sdw_tx_ch_info));
> +
> +		if (master_ch_mask_size > 0)
> +			ret = of_property_read_u8_array(dev->of_node,
> +							"qcom,tx-channel-mapping",
> +							master_ch_mask,
> +							master_ch_mask_size);
> +	} else {
> +		master_ch_mask_size = of_property_count_u8_elems(dev->of_node,
> +								 "qcom,rx-channel-mapping");
> +		master_ch_mask_size = min_t(int, master_ch_mask_size,
> +					    ARRAY_SIZE(wcd9378_sdw_rx_ch_info));
> +
> +		if (master_ch_mask_size > 0)
> +			ret = of_property_read_u8_array(dev->of_node,
> +							"qcom,rx-channel-mapping",
> +							master_ch_mask,
> +							master_ch_mask_size);
> +	}
> +
> +	if (wcd->is_tx) {
> +		pdev->prop.source_ports = GENMASK(WCD9378_MAX_TX_SWR_PORTS, 1);
> +		pdev->prop.src_dpn_prop = wcd9378_dpn_prop;
> +		wcd->ch_info = &wcd9378_sdw_tx_ch_info[0];
> +
> +		for (i = 0; i < master_ch_mask_size; i++)
> +			wcd->ch_info[i].master_ch_mask = WCD9378_SWRM_CH_MASK(master_ch_mask[i]);
> +
> +		pdev->prop.wake_capable = true;
> +
> +		wcd->regmap = devm_regmap_init_sdw(pdev, &wcd9378_regmap_config);
> +		if (IS_ERR(wcd->regmap))
> +			return dev_err_probe(dev, PTR_ERR(wcd->regmap),
> +					     "Regmap init failed\n");
> +
> +		/* Start in cache-only until device is enumerated */
> +		regcache_cache_only(wcd->regmap, true);
> +	} else {
> +		pdev->prop.sink_ports = GENMASK(WCD9378_MAX_SWR_PORTS, 1);
> +		pdev->prop.sink_dpn_prop = wcd9378_dpn_prop;
> +		wcd->ch_info = &wcd9378_sdw_rx_ch_info[0];
> +
> +		for (i = 0; i < master_ch_mask_size; i++)
> +			wcd->ch_info[i].master_ch_mask = WCD9378_SWRM_CH_MASK(master_ch_mask[i]);
> +	}
> +
> +	ret = component_add(dev, &wcd_sdw_component_ops);
> +	if (ret)
> +		return ret;
> +
> +	/* Set suspended until aggregate device is bind */
> +	pm_runtime_set_suspended(dev);

is this set_suspended() necessary? pm_runtime isn't even enabled in this probe.

> +
> +	return 0;
> +}
> +
> +static void wcd9378_sdw_remove(struct sdw_slave *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +
> +	component_del(dev, &wcd_sdw_component_ops);

pm_runtime_disable() ?

> +}
> +
> +static const struct sdw_device_id wcd9378_sdw_id[] = {
> +	SDW_SLAVE_ENTRY(0x0217, 0x0110, 0),

if this was an SDCA device shouldn't you rely on the _EXT macro?

> +	{ },
> +};
> +MODULE_DEVICE_TABLE(sdw, wcd9378_sdw_id);

> diff --git a/sound/soc/codecs/wcd9378.c b/sound/soc/codecs/wcd9378.c
> new file mode 100644
> index 000000000000..f4c4792d9d33
> --- /dev/null
> +++ b/sound/soc/codecs/wcd9378.c
> @@ -0,0 +1,1382 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2026, Jorijn van der Graaf
> + *
> + * Qualcomm WCD9378 audio codec driver.
> + *
> + * The WCD9378 pairs a WCD937x-compatible analog core with SDCA-style

SDCA-style or SDCA-compliant?

> + * function blocks (SmartMIC0/1/2, SmartJACK, SmartAMP) whose built-in
> + * sequencers perform the analog power-up/down autonomously: capture is
> + * started by programming the ADC usage mode (ITxx_USAGE), requesting
> + * power state 0 on the function's PDE, and letting the sequencer ramp
> + * the micbias selected through SMx_MB_SEL.
> + *
> + * TX/capture paths only for now; RX (earpiece/headphone), MBHC and the
> + * SmartAMP function are not implemented.
> + */

> +/* sys-usage capability bits (SYS_USAGE_CTRL profile contents) */

what does sys-usage mean? it was never clear in the SDCA spec, not sure what this refers to here.

> +enum {
> +	WCD9378_SYS_USAGE_CLASS_AB = 0,
> +	WCD9378_SYS_USAGE_TX1_FOR_JACK,
> +	WCD9378_SYS_USAGE_TX2_AMIC4,
> +	WCD9378_SYS_USAGE_TX2_AMIC1,
> +	WCD9378_SYS_USAGE_TX1_AMIC3,
> +	WCD9378_SYS_USAGE_TX1_AMIC2,
> +	WCD9378_SYS_USAGE_TX0_AMIC2,
> +	WCD9378_SYS_USAGE_TX0_AMIC1,
> +	WCD9378_SYS_USAGE_RX2_EAR,
> +	WCD9378_SYS_USAGE_RX2_AUX,
> +	WCD9378_SYS_USAGE_RX1_AUX,
> +	WCD9378_SYS_USAGE_RX0_EAR,
> +	WCD9378_SYS_USAGE_RX0_RX1_HPH,
> +};
> +
> +/* Capability sets of the 13 canned SYS_USAGE_CTRL profiles */

I guess this maps to the enum values above?

> +static const unsigned int wcd9378_sys_usage_profiles[] = {
> +	0x0c95, 0x12a7, 0x0c99, 0x1aab, 0x0894, 0x11a6, 0x0898,
> +	0x11ab, 0x126a, 0x116b, 0x1ca7, 0x1195, 0x1296,
> +};

> +/*
> + * Activate the SDCA function classes. Without FUNC_ACT the sequencer
> + * ignores all PDE power-state requests.
> + */
> +static void wcd9378_class_load(struct snd_soc_component *component)
> +{
> +	int i;
> +
> +	/*
> +	 * Plain writes, not update_bits, so the 0->1 activation edge
> +	 * always reaches the hardware regardless of regcache state.
> +	 * The engine boots from this edge only on a freshly reset
> +	 * codec; once it dies (bus clock-stop) no register write
> +	 * revives it, see the TX bus PM hold in wcd9378_bind().
> +	 */
> +	snd_soc_component_write(component, WCD9378_SMP_AMP_FUNC_ACT, 0x00);
> +	snd_soc_component_write(component, WCD9378_SMP_AMP_FUNC_ACT, 0x01);
> +	usleep_range(20000, 20010);
> +	snd_soc_component_write(component, WCD9378_SMP_AMP_FUNC_STAT, 0xff);

if this is really SDCA, this would be very odd to set all bits in the function status register. 
The function status register includers fields such as needs reset, function busy, etc.

> +
> +	snd_soc_component_write(component, WCD9378_SMP_JACK_FUNC_ACT, 0x00);
> +	snd_soc_component_write(component, WCD9378_SMP_JACK_FUNC_ACT, 0x01);
> +	usleep_range(30000, 30010);
> +	snd_soc_component_update_bits(component, WCD9378_CMT_GRP_MASK,
> +				      0xff, 0x02);
> +	snd_soc_component_write(component, WCD9378_SMP_JACK_FUNC_STAT, 0xff);
> +
> +	for (i = 0; i < 3; i++) {
> +		snd_soc_component_write(component,
> +					WCD9378_SMP_MIC_FUNC_ACT(i), 0x00);
> +		snd_soc_component_write(component,
> +					WCD9378_SMP_MIC_FUNC_ACT(i), 0x01);
> +		usleep_range(5000, 5010);
> +		snd_soc_component_write(component,
> +					WCD9378_SMP_MIC_FUNC_STAT(i), 0xff);
> +	}

quite a lot of voodoo magic in this function, eh?

> +}


> +/*
> + * Indicate the bus clock to the codec through the standard SCP
> + * BusClock_Base/Scale registers. The TX sequencers clock off the
> + * SoundWire bus clock and stall without this; the downstream driver
> + * writes these on every capture start and clears them on the last
> + * teardown.
> + */
> +/* Actual bus clock is half the SoundWire double-rate frequency */
> +static unsigned int wcd9378_tx_bus_clk(struct wcd9378_priv *wcd9378)
> +{
> +	return wcd9378->tx_sdw_dev->bus->params.curr_dr_freq / 2;
> +}
> +
> +static void wcd9378_swr_clk_indicate(struct wcd9378_priv *wcd9378, bool enable)
> +{
> +	struct sdw_slave *tx = wcd9378->tx_sdw_dev;
> +	u8 scale;
> +
> +	if (enable) {
> +		if (wcd9378_tx_bus_clk(wcd9378) >= 9600000)
> +			scale = WCD9378_SWRS_CLK_SCALE_DIV2;
> +		else
> +			scale = WCD9378_SWRS_CLK_SCALE_DIV4;
> +
> +		/*
> +		 * The downstream master broadcasts HOST_CLK_DIV2_CTL = 0x01
> +		 * (both banks) on every capture start; the sequencer does not
> +		 * power up without it.
> +		 */
> +		sdw_write(tx, WCD9378_SWRS_SCP_HOST_CLK_DIV2_CTL(0), 0x01);
> +		sdw_write(tx, WCD9378_SWRS_SCP_HOST_CLK_DIV2_CTL(1), 0x01);
> +		sdw_write(tx, WCD9378_SWRS_SCP_BASE_CLK,
> +			  WCD9378_SWRS_BASE_CLK_19P2MHZ);
> +		sdw_write(tx, WCD9378_SWRS_SCP_BUSCLK_SCALE_BANK0, scale);
> +		sdw_write(tx, WCD9378_SWRS_SCP_BUSCLK_SCALE_BANK1, scale);
> +		sdw_write(tx, SDW_SCP_COMMIT, 0x02);

is this SCP_COMMIT needed? This is only used for dual-ranked registers, and there's currently no mechanism to handle them.
The bus scale registers are banked, this is a different concept.

And to repeat my question above, is this really the codec driver job to muck with SCP registers?

> +	} else {
> +		sdw_write(tx, WCD9378_SWRS_SCP_BASE_CLK, 0x00);
> +		sdw_write(tx, WCD9378_SWRS_SCP_BUSCLK_SCALE_BANK0, 0x00);
> +		sdw_write(tx, WCD9378_SWRS_SCP_BUSCLK_SCALE_BANK1, 0x00);
> +	}
> +}
> +
> +#define WCD9378_SYS_USAGE_TX_MASK	(BIT(WCD9378_SYS_USAGE_TX2_AMIC4) | \
> +					 BIT(WCD9378_SYS_USAGE_TX2_AMIC1) | \
> +					 BIT(WCD9378_SYS_USAGE_TX1_AMIC3) | \
> +					 BIT(WCD9378_SYS_USAGE_TX1_AMIC2) | \
> +					 BIT(WCD9378_SYS_USAGE_TX0_AMIC2) | \
> +					 BIT(WCD9378_SYS_USAGE_TX0_AMIC1))
> +
> +static int wcd9378_tx_sequencer_enable(struct snd_soc_dapm_widget *w,
> +				       struct snd_kcontrol *kcontrol,
> +				       int event)
> +{
> +	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
> +	struct wcd9378_priv *wcd9378 = snd_soc_component_get_drvdata(component);
> +	const struct wcd9378_smp_fn *fn;
> +	int adc = w->shift;
> +	bool is_jack = false;
> +	int sys_bit, retries;
> +	u32 val;
> +
> +	switch (event) {
> +	case SND_SOC_DAPM_PRE_PMU:
> +		sys_bit = wcd9378_sys_usage_bit_get(component, adc, &is_jack);
> +		if (sys_bit < 0)
> +			return sys_bit;
> +
> +		/*
> +		 * Latch the profile bit and the target function: the input
> +		 * mux can be rewritten while the path is powered, and
> +		 * power-down must tear down what was actually powered up.
> +		 */
> +		wcd9378->tx_sys_bit[adc] = sys_bit;
> +		wcd9378->tx_is_jack[adc] = is_jack;
> +		if (is_jack)
> +			fn = &wcd9378_smp_jack_adc2;
> +		else
> +			fn = &wcd9378_smp_mic[adc];
> +
> +		if (wcd9378_sys_usage_update(component, sys_bit, true))
> +			return -EINVAL;
> +
> +		/*
> +		 * NORMAL/HIFI ADC modes need a 9.6 MHz bus clock; on a
> +		 * 4.8 MHz bus only the LP mode is valid and anything else
> +		 * makes the sequencer refuse to power up.
> +		 */
> +		if (wcd9378_tx_bus_clk(wcd9378) < 9600000)
> +			val = WCD9378_ADC_USAGE_LP;
> +		else
> +			val = wcd9378_get_mode_val(wcd9378, adc);
> +
> +		snd_soc_component_update_bits(component, fn->usage_reg, 0xff, val);
> +		if (fn->hpf_reg)
> +			snd_soc_component_update_bits(component, fn->hpf_reg,
> +						      fn->hpf_mask, fn->hpf_mask);
> +		snd_soc_component_update_bits(component, fn->req_reg, 0xff,
> +					      WCD9378_PDE_PS0_ON);

if this is remotely inspired by SDCA, the normal sequence is to set the REQUESTED_POWER then poll the ACTUAL_POWER register.

> +		usleep_range(800, 810);
> +
> +		wcd9378_swr_clk_indicate(wcd9378, true);
> +
> +		if (fn->hpf_reg)
> +			snd_soc_component_update_bits(component, fn->hpf_reg,
> +						      fn->hpf_mask, 0x00);
> +
> +		/* Wait for the sequencer to reach PS0 */
> +		retries = 20;
> +		do {
> +			val = snd_soc_component_read(component, fn->act_reg);
> +			if (val == WCD9378_PDE_PS0_ON)
> +				break;
> +			usleep_range(500, 510);
> +		} while (--retries);
> +		if (val != WCD9378_PDE_PS0_ON)
> +			dev_warn(component->dev,
> +				 "TX%d sequencer not in PS0 (act_ps %#x, bus %u Hz)\n",
> +				 adc, val,
> +				 wcd9378->tx_sdw_dev->bus->params.curr_dr_freq);
> +		break;
> +	case SND_SOC_DAPM_POST_PMD:
> +		sys_bit = wcd9378->tx_sys_bit[adc];
> +		if (sys_bit < 0)
> +			break;
> +		if (wcd9378->tx_is_jack[adc])
> +			fn = &wcd9378_smp_jack_adc2;
> +		else
> +			fn = &wcd9378_smp_mic[adc];
> +
> +		snd_soc_component_update_bits(component, fn->usage_reg, 0xff,
> +					      WCD9378_ADC_USAGE_OFF);
> +		if (fn->hpf_reg)
> +			snd_soc_component_update_bits(component, fn->hpf_reg,
> +						      fn->hpf_mask, 0x00);
> +		snd_soc_component_update_bits(component, fn->req_reg, 0xff,
> +					      WCD9378_PDE_PS3_OFF);
> +		usleep_range(800, 810);
> +		wcd9378_sys_usage_update(component, sys_bit, false);
> +		wcd9378->tx_sys_bit[adc] = -1;
> +
> +		if (!(wcd9378->sys_usage_mask & WCD9378_SYS_USAGE_TX_MASK))
> +			wcd9378_swr_clk_indicate(wcd9378, false);
> +		break;
> +	}
> +
> +	return 0;
> +}

> +static int wcd9378_get_swr_port(struct snd_kcontrol *kcontrol,
> +				struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct soc_mixer_control *mixer = (struct soc_mixer_control *)kcontrol->private_value;
> +	struct snd_soc_component *comp = snd_kcontrol_chip(kcontrol);
> +	struct wcd9378_priv *wcd9378 = snd_soc_component_get_drvdata(comp);
> +	struct wcd9378_sdw_priv *wcd;
> +	int dai_id = mixer->shift;
> +	int ch_idx = mixer->reg;
> +	int portidx;
> +
> +	wcd = wcd9378->sdw_priv[dai_id];
> +	portidx = wcd->ch_info[ch_idx].port_num;
> +
> +	ucontrol->value.integer.value[0] = wcd->port_enable[portidx];
> +
> +	return 0;
> +}
> +
> +static int wcd9378_set_swr_port(struct snd_kcontrol *kcontrol,
> +				struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct soc_mixer_control *mixer = (struct soc_mixer_control *)kcontrol->private_value;
> +	struct snd_soc_component *comp = snd_kcontrol_chip(kcontrol);
> +	struct wcd9378_priv *wcd9378 = snd_soc_component_get_drvdata(comp);
> +	struct wcd9378_sdw_priv *wcd;
> +	int dai_id = mixer->shift;
> +	int ch_idx = mixer->reg;
> +	int portidx;
> +	bool enable;
> +
> +	wcd = wcd9378->sdw_priv[dai_id];
> +	portidx = wcd->ch_info[ch_idx].port_num;
> +
> +	enable = ucontrol->value.integer.value[0];
> +
> +	if (enable == wcd->port_enable[portidx]) {
> +		wcd9378_connect_port(wcd, portidx, ch_idx, enable);
> +		return 0;
> +	}
> +
> +	wcd->port_enable[portidx] = enable;
> +	wcd9378_connect_port(wcd, portidx, ch_idx, enable);
> +
> +	return 1;
> +}

it's quite unclear to me why ports need to be exposed to user space?
This is really low-level stuff that isn't typically handled by user-space.


> +static int wcd9378_soc_codec_probe(struct snd_soc_component *component)
> +{
> +	struct wcd9378_priv *wcd9378 = snd_soc_component_get_drvdata(component);
> +	struct device *dev = component->dev;
> +	unsigned int part0 = 0, part1 = 0;
> +	int ret;
> +
> +	ret = sdw_slave_wait_for_init(wcd9378->tx_sdw_dev, 5000);
> +	if (ret)
> +		return ret;

That's rather unusual, the 'standard' way is to use the update_status callback when the core logic completes the enumeration/initialization.

> +
> +	snd_soc_component_init_regmap(component, wcd9378->regmap);
> +
> +	ret = pm_runtime_resume_and_get(dev);
> +	if (ret < 0)
> +		return ret;

and presumably if you wait for the init above the device is already functional?

> +
> +	regmap_read(wcd9378->regmap, WCD9378_DEV_PART_ID_0, &part0);
> +	regmap_read(wcd9378->regmap, WCD9378_DEV_PART_ID_1, &part1);
> +	dev_dbg(dev, "WCD9378 part id %#x\n", (part1 << 8) | part0);
> +
> +	/*
> +	 * SDCA interrupt type configuration, mirroring the downstream init
> +	 * sequence. Nothing consumes these interrupts yet (no MBHC support);
> +	 * kept so the bring-up sequence validated on hardware is unchanged.
> +	 */
> +	sdw_write(wcd9378->tx_sdw_dev, WCD9378_SWRS_SCP_SDCA_INTRTYPE_1, 0xff);
> +	sdw_write(wcd9378->tx_sdw_dev, WCD9378_SWRS_SCP_SDCA_INTRTYPE_2, 0x0b);
> +	sdw_write(wcd9378->tx_sdw_dev, WCD9378_SWRS_SCP_SDCA_INTRTYPE_3, 0xff);
> +
> +	wcd9378_io_init(component);

doing the io_init() after waiting for the init seems odd to me, the flow isn't classic and deserves more comments IMHO.

> +	wcd9378_set_micb_usage_vals(component);
> +
> +	pm_runtime_mark_last_busy(dev);
> +	pm_runtime_put_autosuspend(dev);
> +
> +	return 0;
> +}

> +static int wcd9378_bind(struct device *dev)
> +{
> +	struct wcd9378_priv *wcd9378 = dev_get_drvdata(dev);
> +	int ret;
> +
> +	/* Give the SDW subdevices some more time to settle */
> +	usleep_range(5000, 5010);

isn't there a better way to detect that the bus and devices are operational?

> +
> +	ret = component_bind_all(dev, wcd9378);
> +	if (ret) {
> +		dev_err(dev, "Slave bind failed, ret = %d\n", ret);
> +		return ret;
> +	}
> +
> +	wcd9378->rxdev = of_sdw_find_device_by_node(wcd9378->rxnode);
> +	if (!wcd9378->rxdev) {
> +		dev_err(dev, "could not find rx slave with matching of node\n");
> +		ret = -EINVAL;
> +		goto err_component_unbind;
> +	}
> +
> +	wcd9378->sdw_priv[AIF1_PB] = dev_get_drvdata(wcd9378->rxdev);
> +	wcd9378->sdw_priv[AIF1_PB]->wcd9378 = wcd9378;
> +
> +	wcd9378->txdev = of_sdw_find_device_by_node(wcd9378->txnode);
> +	if (!wcd9378->txdev) {
> +		dev_err(dev, "could not find tx slave with matching of node\n");
> +		ret = -EINVAL;
> +		goto err_put_rxdev;
> +	}
> +
> +	wcd9378->sdw_priv[AIF1_CAP] = dev_get_drvdata(wcd9378->txdev);
> +	wcd9378->sdw_priv[AIF1_CAP]->wcd9378 = wcd9378;
> +	wcd9378->tx_sdw_dev = dev_to_sdw_dev(wcd9378->txdev);
> +
> +	/*
> +	 * As TX is the main CSR reg interface, it should not be suspended
> +	 * first. Explicitly add the dependency link.
> +	 */
> +	if (!device_link_add(wcd9378->rxdev, wcd9378->txdev,
> +			     DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME)) {
> +		dev_err(dev, "Could not devlink TX and RX\n");
> +		ret = -EINVAL;
> +		goto err_put_txdev;
> +	}
> +
> +	if (!device_link_add(dev, wcd9378->txdev,
> +			     DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME)) {
> +		dev_err(dev, "Could not devlink WCD and TX\n");
> +		ret = -EINVAL;
> +		goto err_remove_link1;
> +	}
> +
> +	if (!device_link_add(dev, wcd9378->rxdev,
> +			     DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME)) {
> +		dev_err(dev, "Could not devlink WCD and RX\n");
> +		ret = -EINVAL;
> +		goto err_remove_link2;
> +	}
> +
> +	wcd9378->regmap = wcd9378->sdw_priv[AIF1_CAP]->regmap;
> +	if (!wcd9378->regmap) {
> +		dev_err(dev, "could not get TX device regmap\n");
> +		ret = -EINVAL;
> +		goto err_remove_link3;
> +	}
> +
> +	/*
> +	 * The SDCA function engine dies when the TX bus enters clock-stop
> +	 * and only a codec reset revives it — registers keep their values
> +	 * so a regcache sync or a FUNC_ACT re-toggle does not help. The
> +	 * downstream stack sidesteps the same problem by marking the TX
> +	 * SoundWire master "qcom,is-always-on"; do the equivalent and
> +	 * keep the TX slave (and thus its bus) runtime-active while the
> +	 * codec is bound.
> +	 */
> +	ret = pm_runtime_resume_and_get(wcd9378->txdev);

same comment as above, if the device is always on then presumably it should never suspend, which begs the question why pm_runtime was introduced?

> +	if (ret < 0) {
> +		dev_err(dev, "could not resume TX device\n");
> +		goto err_remove_link3;
> +	}
> +
> +	ret = snd_soc_register_component(dev, &soc_codec_dev_wcd9378,
> +					 wcd9378_dais, ARRAY_SIZE(wcd9378_dais));
> +	if (ret) {
> +		dev_err(dev, "Codec registration failed\n");
> +		pm_runtime_put(wcd9378->txdev);
> +		goto err_remove_link3;
> +	}
> +
> +	return ret;
> +
> +err_remove_link3:
> +	device_link_remove(dev, wcd9378->rxdev);
> +err_remove_link2:
> +	device_link_remove(dev, wcd9378->txdev);
> +err_remove_link1:
> +	device_link_remove(wcd9378->rxdev, wcd9378->txdev);
> +err_put_txdev:
> +	put_device(wcd9378->txdev);
> +err_put_rxdev:
> +	put_device(wcd9378->rxdev);
> +err_component_unbind:
> +	component_unbind_all(dev, wcd9378);
> +	return ret;
> +}

> +static int wcd9378_probe(struct platform_device *pdev)
> +{
> +	struct component_match *match = NULL;
> +	struct device *dev = &pdev->dev;
> +	struct wcd9378_priv *wcd9378;
> +	int ret, i;
> +
> +	wcd9378 = devm_kzalloc(dev, sizeof(*wcd9378), GFP_KERNEL);
> +	if (!wcd9378)
> +		return -ENOMEM;
> +
> +	dev_set_drvdata(dev, wcd9378);
> +	mutex_init(&wcd9378->micb_lock);
> +	for (i = 0; i < ARRAY_SIZE(wcd9378->tx_sys_bit); i++)
> +		wcd9378->tx_sys_bit[i] = -1;
> +	wcd9378->common.dev = dev;
> +	wcd9378->common.max_bias = WCD9378_MAX_MICBIAS;
> +
> +	wcd9378->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
> +	if (IS_ERR(wcd9378->reset_gpio))
> +		return dev_err_probe(dev, PTR_ERR(wcd9378->reset_gpio),
> +				     "failed to get reset gpio\n");
> +
> +	ret = devm_regulator_bulk_get_enable(dev, ARRAY_SIZE(wcd9378_supplies),
> +					     wcd9378_supplies);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "Failed to get and enable supplies\n");
> +
> +	ret = wcd_dt_parse_micbias_info(&wcd9378->common);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to get micbias\n");
> +
> +	ret = wcd9378_add_slave_components(wcd9378, dev, &match);
> +	if (ret)
> +		return ret;
> +
> +	wcd9378_reset(wcd9378);
> +
> +	ret = component_master_add_with_match(dev, &wcd9378_comp_ops, match);
> +	if (ret)
> +		return ret;
> +
> +	pm_runtime_set_autosuspend_delay(dev, 1000);

1s for pm_runtime autosuspend is rather low, no? Usually values are in the 3s range to avoid suspend-resume transitions while the user is playing with the UI.

> +	pm_runtime_use_autosuspend(dev);
> +	pm_runtime_mark_last_busy(dev);
> +	pm_runtime_set_active(dev);
> +	pm_runtime_enable(dev);
> +	pm_runtime_idle(dev);
> +
> +	return 0;
> +}
> +
> +static void wcd9378_remove(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +
> +	component_master_del(dev, &wcd9378_comp_ops);
> +
> +	pm_runtime_disable(dev);
> +	pm_runtime_set_suspended(dev);
> +	pm_runtime_dont_use_autosuspend(dev);

the last two calls seem unnecessary if pm_runtime is disabled already?

> +}

> +/*
> + * Raw (16-bit, non-paged) Qualcomm slave SCP registers, written with
> + * sdw_write() directly. Bus clock indication towards the codec and
> + * SDCA interrupt type configuration.
> + */
> +#define WCD9378_SWRS_SCP_BASE_CLK		0x4d
> +#define WCD9378_SWRS_SCP_BUSCLK_SCALE_BANK0	0x62
> +#define WCD9378_SWRS_SCP_BUSCLK_SCALE_BANK1	0x72
> +#define WCD9378_SWRS_SCP_SDCA_INTRTYPE_1	0xf4
> +#define WCD9378_SWRS_SCP_SDCA_INTRTYPE_2	0xf8
> +#define WCD9378_SWRS_SCP_SDCA_INTRTYPE_3	0xfc
> +#define WCD9378_SWRS_SCP_HOST_CLK_DIV2_CTL(m)	(0xe0 + 0x10 * (m))
> +#define WCD9378_SWRS_BASE_CLK_19P2MHZ		0x01
> +#define WCD9378_SWRS_CLK_SCALE_DIV2		0x02	/* 9.6 MHz */
> +#define WCD9378_SWRS_CLK_SCALE_DIV4		0x03	/* 4.8 MHz */

all of those seem like standard registers, do you really need/want to use your own definitions?




