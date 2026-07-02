Return-Path: <linux-arm-msm+bounces-115843-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Z5FjLhcPRmpTIgsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115843-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 09:11:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D77E6F40A1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 09:11:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=cEWqRRU4;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115843-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115843-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ED81D304CC30
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 07:07:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9331438F92A;
	Thu,  2 Jul 2026 07:07:52 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0410838E8DC;
	Thu,  2 Jul 2026 07:07:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782976072; cv=none; b=BN+M1N9dyibGV1ZRKJL+o8F6JlGlZAMSzEEnqwlrmHjI1D2j31On8x+jSdlmQ4EBlKTznqeYI1jFRff0sI7jD22D6zk1KC7adgO7/HJ3qTZy1kWBO7rx9j5TrRjbYF3kDbsmejYD0VuC3G0bZyrnFcdza7GLtlCvRy82WYnz/Fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782976072; c=relaxed/simple;
	bh=GbAmTAWHx7OXUk0w3I5VCglsgx5MOKEixyGf2vYEk/A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dfw5H6IWuAVBuGNlSDLB4zugIFxF3bOjoTh6KDBDglDTFo7q1xh2mbgXFzD/GeEi2lC0gPqNtLx+MDJXOmMysWzTdS8h/+NHJJ/yTibUco/coZF3hJzYq42ms+O4ocb6ANk+4vfxTkRM+cDZ5jOt3qCsCDM9HMcq225HmAR1bq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cEWqRRU4; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A9ED1F000E9;
	Thu,  2 Jul 2026 07:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782976070;
	bh=4E92IV9DM9LGq59NKnDTKE63kIrVlk8CBJH9w//FZPs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cEWqRRU4A/khm4p/wkk5kZ6dpxKwFSDR0MsmV4QyoyLjtOZmgqchiTffPixrREU3R
	 /jlF0qpRkJoi84g0nE8TKNHqX2RSEYBYaQE1oREI0qW0BxSFil0DOnVlpDq6ZLy3Fi
	 BTQ/AbexDOII6YmbTZ4z5CQIqDZZQQJJli/xXBJ1PWeFne8VTV0GBYF+HFqXgds5QU
	 9OOQlYp3OiJIZuAlNtreYXnvt0+Y3jqnEYUlAnS5B2PVlq8LD4IFK5/jfPTNNYlM09
	 z3xdYmC+aQK5CSew8/kz7WROEASxMC+iA4Pll3ulATyY7xiN9eGcBeSftR6Ddpvumc
	 Z2bBEP11njbgQ==
Date: Thu, 2 Jul 2026 09:07:45 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 07/11] ASoC: qcom: Add QAIF regmap, DT parsing and
 platform init
Message-ID: <20260702-stoic-chinchilla-of-nirvana-3bfb14@quoll>
References: <20260701105757.2779738-1-harendra.gautam@oss.qualcomm.com>
 <20260701105757.2779738-8-harendra.gautam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260701105757.2779738-8-harendra.gautam@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115843-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:harendra.gautam@oss.qualcomm.com,m:srini@kernel.org,m:broonie@kernel.org,m:lgirdwood@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,quoll:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2D77E6F40A1

On Wed, Jul 01, 2026 at 04:27:53PM +0530, Harendra Gautam wrote:
> +/**
> + * asoc_qcom_qaif_cpu_platform_probe - Probe the QAIF CPU and platform driver
> + * @pdev: Platform device
> + *
> + * Initialises the QAIF regmap, parses DT, sets up clocks and registers
> + * the CPU DAI component and PCM platform.
> + *
> + * Return: 0 on success, negative error code on failure.
> + */
> +int asoc_qcom_qaif_cpu_platform_probe(struct platform_device *pdev)
> +{
> +	struct qaif_drv_data *drvdata;
> +	struct resource *res;
> +	const struct qaif_variant *variant;
> +	struct device *dev = &pdev->dev;
> +	const struct of_device_id *match;
> +	int ret, i, dai_id, idx;
> +	bool variant_init_done = false;
> +
> +	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
> +	if (!drvdata)
> +		return -ENOMEM;
> +	platform_set_drvdata(pdev, drvdata);
> +
> +	match = of_match_device(dev->driver->of_match_table, dev);
> +	if (!match || !match->data)
> +		return -EINVAL;
> +
> +	drvdata->variant = match->data;
> +	variant = drvdata->variant;
> +
> +	ret = of_qaif_parse_aif_intf_cfg(dev, drvdata);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to parse aif interfaces\n");
> +
> +	drvdata->audio_qaif =
> +			devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(drvdata->audio_qaif))
> +		return PTR_ERR(drvdata->audio_qaif);
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!res)
> +		return -EINVAL;
> +
> +	audio_qaif_regmap_config.max_register = resource_size(res);

Why are you modifiying static variable? So if second instance is probed,
how is this supposed to work?

> +	drvdata->audio_qaif_map =
> +		devm_regmap_init_mmio(dev, drvdata->audio_qaif,
> +				      &audio_qaif_regmap_config);
> +	if (IS_ERR(drvdata->audio_qaif_map))
> +		return PTR_ERR(drvdata->audio_qaif_map);
> +
> +	ret = of_qaif_cdc_dma_clks_parse(dev, drvdata);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to get cdc dma clocks\n");
> +
> +	if (variant->clk_init) {
> +		ret = variant->clk_init(pdev);
> +		if (ret)
> +			return dev_err_probe(dev, ret, "Failed to initialize variant\n");
> +		variant_init_done = true;
> +	}
> +
> +	for (i = 0; i < variant->num_dai; i++) {
> +		dai_id = variant->dai_driver[i].id;
> +		if (is_cif_dma_port(dai_id))
> +			continue;
> +		idx = variant->get_dma_idx(dai_id);
> +		if (idx < 0)
> +			continue;
> +
> +		drvdata->mi2s_bit_clk[idx] = devm_clk_get(dev,
> +							  variant->dai_bit_clk_names[idx]);
> +		if (IS_ERR(drvdata->mi2s_bit_clk[idx])) {
> +			ret = PTR_ERR(drvdata->mi2s_bit_clk[idx]);

Wrong syntax. Please use dev_err_probe.


> +			dev_err_probe(dev, ret, "error getting %s\n",
> +				      variant->dai_bit_clk_names[idx]);
> +			goto err;
> +		}
> +	}
> +
> +	ret = qaif_aif_cpu_init_bitfields(dev, drvdata->audio_qaif_map);
> +	if (ret) {
> +		dev_err_probe(dev, ret, "error init aif bitfields\n");
> +		goto err;
> +	}
> +
> +	ret = qaif_aif_cfg_cpu_init_bitfields(dev, drvdata->audio_qaif_map);
> +	if (ret) {
> +		dev_err_probe(dev, ret, "error init aif intfctl fields\n");
> +		goto err;
> +	}
> +
> +	ret = qaif_cif_cpu_init_bitfields(dev, drvdata->audio_qaif_map);
> +	if (ret) {
> +		dev_err_probe(dev, ret, "error init cif bitfields\n");
> +		goto err;
> +	}

Why do you need to enable the clocks before all this init? Do you
actually access the device here (like its registers)?

> +
> +	ret = devm_snd_soc_register_component(dev,
> +					      &qaif_cpu_comp_driver,
> +					      variant->dai_driver,
> +					      variant->num_dai);
> +	if (ret) {
> +		dev_err_probe(dev, ret, "error registering cpu driver\n");
> +		goto err;
> +	}
> +
> +	ret = asoc_qcom_qaif_platform_register(pdev);
> +	if (ret) {
> +		dev_err_probe(dev, ret, "error registering platform driver\n");
> +		goto err;
> +	}
> +err:
> +	if (ret && variant_init_done && variant->clk_deinit)
> +		variant->clk_deinit(pdev);
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(asoc_qcom_qaif_cpu_platform_probe);
> +
> +/**
> + * asoc_qcom_qaif_cpu_platform_remove - Remove the QAIF CPU and platform driver
> + * @pdev: Platform device
> + */
> +void asoc_qcom_qaif_cpu_platform_remove(struct platform_device *pdev)
> +{
> +	struct qaif_drv_data *drvdata = platform_get_drvdata(pdev);
> +
> +	if (drvdata->variant->clk_deinit)
> +		drvdata->variant->clk_deinit(pdev);
> +}
> +EXPORT_SYMBOL_GPL(asoc_qcom_qaif_cpu_platform_remove);
> +
> +/**
> + * asoc_qcom_qaif_cpu_platform_shutdown - Shutdown the QAIF CPU and platform driver
> + * @pdev: Platform device
> + */
> +void asoc_qcom_qaif_cpu_platform_shutdown(struct platform_device *pdev)
> +{
> +	struct qaif_drv_data *drvdata = platform_get_drvdata(pdev);
> +
> +	if (drvdata->variant->clk_deinit)
> +		drvdata->variant->clk_deinit(pdev);
> +}
> +EXPORT_SYMBOL_GPL(asoc_qcom_qaif_cpu_platform_shutdown);

I do not understand why do you need wrappers over single call of single
driver. You do not have different variants. And even if you had
different variants, I claim they will have exactly the same clk init and
deinit.

Again, this looks awfully like sending us a dowsntream driver which is a
known antipattern of upstreaming.


Best regards,
Krzysztof


