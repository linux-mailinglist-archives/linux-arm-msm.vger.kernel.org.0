Return-Path: <linux-arm-msm+bounces-111387-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nDKRNDWtImoRcAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111387-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 13:04:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 724496479AA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 13:04:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=ArwlXFJ4;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111387-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111387-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C60D03004F1F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jun 2026 11:02:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C88E34C954D;
	Fri,  5 Jun 2026 11:02:52 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A83B441931B;
	Fri,  5 Jun 2026 11:02:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780657372; cv=none; b=RaMK7IQ+HaXK1JmdVPB04FfinMhhf5WC03Ca82Gum3TD1EqQrCoZ3EMh/7E8Cpprj7lkIuCewyz03SH3l01c9R57eVt+8ALuKHX2asp3BUm4DaaO01VwXd0EsP6cmNx/mjqjgV2yhPP3sAQQT0SjJG+sXe5hVWDvHr3r1pnIZQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780657372; c=relaxed/simple;
	bh=ATKuZrmjh0+nxYwrl5UozVjZ4MFh7N8Xie5aZebTgJo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FuwoVq3fM+kfTSlwsIw8WF/PEQky5YyRf5uTGTWdwvGREjA40KQIyv50PhH0miBNXpp6INA0yYa+CZHS+EWcjxQgFKJlRRfprMUBiUjtd+QI8LI2aPnHB6FpNHBuTJ2pR8J8Fpd4UQyft0BSIF0UMOk8UDsk0JAc/bjatXNyedc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ArwlXFJ4; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DF681F00893;
	Fri,  5 Jun 2026 11:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780657371;
	bh=SOrwkWwzDpnmIIcj/befEioPqvfrPdVPjZKeLNjoeGQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=ArwlXFJ4RJftwlThQuOdEOEcjNo3dB9sqJ7OS44qN+HFaJcW63P+//yzsU86ayT38
	 +38jJ+QhXylXI5/ux7t1SPIQL5WNPA3Wb+xN/sdQfcgpmSp2x1Zc30F3Rw3WYELSGu
	 c/uWq8ieO9o3KxCkbpR+PPhR1g8TiYZoK9X2+rQtLOi+tmX/SsOBqasLnUPnO9gH53
	 g/qRPAp9LwSwcy1K5KFw+XEoMH05OZdfnpZEgNJqdkFGbuqtTfogqg6RtAnZjFNDsF
	 bXaNbyxo0nY7ESq7nWQ65hXlhglLsVwPpvNFV36tnAMMJTbYjpbHy1Yy7UyXbPxxOg
	 xcx/QVEgLZqJA==
Message-ID: <0f0fe294-a6c8-4b2d-a038-9f699845ab58@kernel.org>
Date: Fri, 5 Jun 2026 13:02:45 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/13] ASoC: qcom: Add QAIF regmap, DT parsing and
 platform init
To: Harendra Gautam <harendra.gautam@oss.qualcomm.com>,
 Srinivas Kandagatla <srini@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260605103739.3557573-1-harendra.gautam@oss.qualcomm.com>
 <20260605103739.3557573-11-harendra.gautam@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20260605103739.3557573-11-harendra.gautam@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111387-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:url,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 724496479AA

On 05/06/2026 12:37, Harendra Gautam wrote:
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
> +	dev_dbg(dev, "%s\n", __func__);

NAK, see further. This is clear, old known antipattern. Don't send such
code anymore.

> +	drvdata = devm_kzalloc(dev, sizeof(struct qaif_drv_data), GFP_KERNEL);

sizeof(*), and with third argument - lack of dev_err_probe - means you
just sent us old junk vendor code.

That's waste of the time - we will have to point you all standard
issues, we solved already years ago.

No. Drop all this code and start from current kernel code as your base
so you won't be repeating same old poor patterns.

> +	if (!drvdata)
> +		return -ENOMEM;
> +	platform_set_drvdata(pdev, drvdata);
> +
> +	match = of_match_device(dev->driver->of_match_table, dev);
> +	if (!match || !match->data)
> +		return -EINVAL;
> +
> +	drvdata->variant = (const struct qaif_variant *)match->data;

Why do you need to cast?

> +	variant = drvdata->variant;
> +	if (!variant) {
> +		dev_err(dev, "No variant data\n");

Is it a possible condition? Probably no, so why printing messages?

> +		return -EINVAL;
> +	}
> +
> +	ret = of_qaif_parse_aif_intf_cfg(dev, drvdata);
> +	if (ret) {
> +		dev_err(dev, "Failed to parse aif interfaces: %d\n", ret);
> +		return -EINVAL;
> +	}
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
> +
> +	drvdata->audio_qaif_map = devm_regmap_init_mmio(dev, drvdata->audio_qaif,
> +				&audio_qaif_regmap_config);

Your code is barely readable.

> +	if (IS_ERR(drvdata->audio_qaif_map))
> +		return PTR_ERR(drvdata->audio_qaif_map);
> +
> +	ret = of_qaif_cdc_dma_clks_parse(dev, drvdata);
> +	if (ret) {
> +		dev_err(dev, "failed to get cdc dma clocks %d\n", ret);
> +		return ret;
> +	}
> +
> +	if (variant->init) {
> +		ret = variant->init(pdev);
> +		if (ret) {
> +			dev_err(dev, "error initializing variant: %d\n", ret);
> +			return ret;
> +		}
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
> +						variant->dai_bit_clk_names[idx]);
> +		if (IS_ERR(drvdata->mi2s_bit_clk[idx])) {
> +			dev_err(dev,
> +				"error getting %s: %ld\n",
> +				variant->dai_bit_clk_names[idx],
> +				PTR_ERR(drvdata->mi2s_bit_clk[idx]));
> +			ret = PTR_ERR(drvdata->mi2s_bit_clk[idx]);

Heh....

> +			goto err;
> +		}
> +	}
> +
> +	ret = qaif_aif_cpu_init_bitfields(dev, drvdata->audio_qaif_map);
> +	if (ret) {
> +		dev_err(dev, "error init cif bitfield: %d\n", ret);
> +		goto err;
> +	}
> +
> +	ret = qaif_aif_cfg_cpu_init_bitfields(dev, drvdata->audio_qaif_map);
> +	if (ret) {
> +		dev_err(dev, "error init aif_intfctl field: %d\n", ret);
> +		goto err;
> +	}
> +
> +	ret = qaif_cif_cpu_init_bitfields(dev, drvdata->audio_qaif_map);
> +	if (ret) {
> +		dev_err(dev, "error init cif bitfield: %d\n", ret);
> +		goto err;
> +	}
> +
> +	ret = devm_snd_soc_register_component(dev, &qaif_cpu_comp_driver,
> +								variant->dai_driver,
> +								variant->num_dai);
> +	if (ret) {
> +		dev_err(dev, "error registering cpu driver: %d\n", ret);

Why aren't you using modern style? dev_err_probe?

> +		goto err;
> +	}
> +
> +	ret = asoc_qcom_qaif_platform_register(pdev);
> +	if (ret) {
> +		dev_err(dev, "error registering platform driver: %d\n", ret);
> +		goto err;
> +	}
> +	dev_dbg(&pdev->dev, "%s: QAIF CPU-Platform Driver Registered Successfully\n", __func__);

Drop. This does not look like useful printk message. Drivers should be
silent on success:
https://elixir.bootlin.com/linux/v6.15-rc7/source/Documentation/process/coding-style.rst#L913
https://elixir.bootlin.com/linux/v6.15-rc7/source/Documentation/process/debugging/driver_development_debugging_guide.rst#L79

Especially trivial probe successes are useless - core handles it.

> +err:
> +	if (ret && variant_init_done && variant->exit)
> +		variant->exit(pdev);
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(asoc_qcom_qaif_cpu_platform_probe);

Every exported function should have kerneldoc.

> +
> +void asoc_qcom_qaif_cpu_platform_remove(struct platform_device *pdev)
> +{
> +	struct qaif_drv_data *drvdata = platform_get_drvdata(pdev);
> +
> +	if (drvdata->variant->exit)
> +		drvdata->variant->exit(pdev);
> +}
> +EXPORT_SYMBOL_GPL(asoc_qcom_qaif_cpu_platform_remove);
> +




Best regards,
Krzysztof

