Return-Path: <linux-arm-msm+bounces-108700-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KEt1HM+PDWoIzQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108700-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 12:41:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E180858BE41
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 12:41:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B18283005142
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 10:40:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D844C39B48F;
	Wed, 20 May 2026 10:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ov+ZfuPj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6FC3C0601;
	Wed, 20 May 2026 10:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779273600; cv=none; b=NHRJTFPhiJdK2gd16Kzcw7IBOPtgq5yrhD9OvYar3JdZq06zEiqRMFVmfSQuTU5G803H69ef61YCWiCZV4g66wYhUsYK+/30v+Eni9k2ggHZG4vkEvqU72qDX9N7Ra3pFmRZkZz1eGSvDXyeEvuRSwdHi6/ctJzfvJNQuONZnhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779273600; c=relaxed/simple;
	bh=wGCBJwVR2BqRUlN7ZNYNR9/tQEJ6K4h0nOwf4I8vkjg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IO1Cco5jXUXKKZlaiw8ZLWjcySvrx2drQ+XtRWS2KhdYgJM0LtzyeWK9cHxNjeY1Kx5WMukdJnUDJMx7Mgo8/NZHGXIE0rZ/Yw6/X/1TH4+LAEoWGufSKCYiP1VYDumhviuYhYFNFwSo8IdlCcSyiesH3/N09Wwe1ZNlZd4bG/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ov+ZfuPj; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 843AB1F000E9;
	Wed, 20 May 2026 10:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779273596;
	bh=qXGlQ4S6PRaBvBMqUGp7m2mgi/ugw8+PBi3RqYGvSkM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ov+ZfuPjPHrlUwW8RHIuXWMkX/DBLlzRgv6ENTUL4zOubNDj9A9Z5DAp1YsMepjW1
	 873xvqbeywoGIyDI+EDyWcmhcuu4pTH9gz18TKOdgX3bA676CY9G90jyUcmesc1ROu
	 mSGCPqsCQR84mACqmvPlLZDewHOz+5V9ks7tV40CrnSXhK+ktijZSvdgtbbAmLqUIA
	 eelCyjs4lAK39acrsqlwEx3HFk35zpnQ7tNVVDURYvXa4Q1uRxRARBxpYWZNUklEF/
	 19J3a/MKfwc2ZZohYvhRqTzLKi3RFN5jCtRvczcFTSz5nZvcGw4dQNVT/qUL1urgmA
	 0Tg5knaMRbhGw==
Date: Wed, 20 May 2026 12:39:53 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
Cc: Saravanan Sekar <sravanhome@gmail.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>
Subject: Re: [PATCH 2/2] regulator: mp8899: Add MPS MP8899 PMIC regulator
 driver
Message-ID: <20260520-luminous-tacky-swallow-a455d3@quoll>
References: <20260519-mp8899-regulator-driver-v1-0-30d14421b7f1@oss.qualcomm.com>
 <20260519-mp8899-regulator-driver-v1-2-30d14421b7f1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260519-mp8899-regulator-driver-v1-2-30d14421b7f1@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org,oss.qualcomm.com];
	TAGGED_FROM(0.00)[bounces-108700-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,config.dev:url]
X-Rspamd-Queue-Id: E180858BE41
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 19, 2026 at 11:51:06PM +0530, Vignesh Viswanathan wrote:
> +static int mp8899_parse_cb(struct device_node *np,
> +			   const struct regulator_desc *desc,
> +			   struct regulator_config *config)
> +{
> +	struct mp8899_regulator_info *info = config->driver_data;
> +	struct regulator_desc *rdesc;
> +	int buck_id = desc->id;
> +	int ret;
> +	u8 val;
> +
> +	/* Read buck phase delay from DTS */
> +	ret = of_property_read_u8(np, "mps,buck-phase-delay", &val);

NAK

> +	if (!ret) {
> +		ret = regmap_update_bits(config->regmap,
> +					 MP8899_BUCK_REG(buck_id, MP8899_BUCK1_CTL1),
> +					 MP8899_PHASE_DELAY_MASK,
> +					 (val & 3) << MP8899_PHASE_DELAY_SHIFT);
> +		if (ret) {
> +			dev_err(config->dev, "Failed to set phase delay for buck%d: %d\n",
> +				buck_id + 1, ret);
> +			return ret;
> +		}
> +	}
> +
> +	/* Read buck soft start from DTS */
> +	ret = of_property_read_u8(np, "mps,buck-softstart", &val);
> +	if (!ret) {
> +		rdesc = &info->rdesc[buck_id];
> +		rdesc->soft_start_val_on = (val & 3) << MP8899_SOFT_START_TIME_SHIFT;
> +	}
> +
> +	/* Read buck soft stop enable and configuration from DTS */
> +	if (of_property_read_bool(np, "mps,buck-softstop-enable")) {
> +		/* Enable soft stop */
> +		ret = regmap_update_bits(config->regmap,
> +					 MP8899_BUCK_REG(buck_id, MP8899_BUCK1_CTL2),
> +					 MP8899_SOFT_STOP_EN_MASK,
> +					 MP8899_SOFT_STOP_EN_MASK);
> +		if (ret) {
> +			dev_err(config->dev, "Failed to enable soft stop for buck%d: %d\n",
> +				buck_id + 1, ret);
> +			return ret;
> +		}
> +
> +		/* Read soft stop timing configuration */
> +		ret = of_property_read_u8(np, "mps,buck-softstop", &val);
> +		if (!ret) {
> +			ret = regmap_update_bits(config->regmap,
> +						 MP8899_BUCK_REG(buck_id, MP8899_BUCK1_CTL2),
> +						 MP8899_SOFT_STOP_TIME_MASK,
> +						 val & 3);
> +			if (ret) {
> +				dev_err(config->dev, "Failed to set soft stop timing for buck%d: %d\n",
> +					buck_id + 1, ret);
> +				return ret;
> +			}
> +		}
> +	}
> +
> +	/* OVP disable configuration */
> +	if (of_property_read_bool(np, "mps,buck-ovp-disable")) {
> +		ret = regmap_update_bits(config->regmap,
> +					 MP8899_BUCK_REG(buck_id, MP8899_BUCK1_CTL1),
> +					 MP8899_VOUT_OVP_EN_MASK, 0);
> +		if (ret) {
> +			dev_err(config->dev, "Failed to disable OVP for buck%d: %d\n",
> +				buck_id + 1, ret);
> +			return ret;
> +		}
> +		dev_info(config->dev, "OVP disabled for buck%d\n", buck_id + 1);
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * mp8899_parse_dt() - Parse global device tree properties
> + * @dev: Device pointer
> + * @info: Pointer to mp8899_regulator_info structure
> + *
> + * Parses global device tree properties that apply to all buck converters,
> + * such as switching frequency configuration.
> + */
> +static void mp8899_parse_dt(struct device *dev,
> +			    struct mp8899_regulator_info *info)
> +{
> +	struct device_node *np = dev->of_node;
> +	int ret;
> +	u8 freq;
> +
> +	np = of_get_child_by_name(np, "regulators");
> +	if (!np) {
> +		dev_err(dev, "missing 'regulators' subnode in DT\n");
> +		return;
> +	}
> +
> +	/* Read switching frequency from DTS */
> +	ret = of_property_read_u8(np, "mps,switch-freq", &freq);

NAK, you don't have such property. Test your DTS first.

This is not really acceptable quality of a driver.

> +	if (!ret) {
> +		ret = regmap_update_bits(info->regmap, MP8899_SYSTEM2,
> +					 MP8899_FREQ_MASK,
> +					 (freq & 7) << 5);
> +		if (ret)
> +			dev_err(dev, "Failed to set switching frequency: %d\n", ret);
> +	}
> +
> +	of_node_put(np);
> +}
> +
> +/* Initialize debugfs for reg_addr and reg_value only */
> +static void mp8899_debugfs_init(struct mp8899_regulator_info *info,
> +				struct i2c_client *client)
> +{
> +	char name[16];
> +
> +	/* Create root debugfs directory: /sys/kernel/debug/mp8899-<bus>-<addr> */
> +	snprintf(name, sizeof(name), "mp8899-%d-%04x",
> +		 client->adapter->nr, client->addr);
> +	info->debugfs_root = debugfs_create_dir(name, NULL);
> +	if (IS_ERR_OR_NULL(info->debugfs_root)) {
> +		dev_warn(info->dev, "Failed to create debugfs root directory\n");

No, drop

> +		info->debugfs_root = NULL;
> +		return;
> +	}
> +
> +	/* Create generic register access files at root level */
> +	debugfs_create_file("reg_addr", 0644, info->debugfs_root, info,
> +			    &mp8899_debugfs_reg_addr_fops);
> +	debugfs_create_file("reg_value", 0644, info->debugfs_root, info,
> +			    &mp8899_debugfs_reg_value_fops);
> +}
> +
> +/* Cleanup debugfs */
> +/**
> + * mp8899_debugfs_exit() - Cleanup debugfs interface
> + * @info: Pointer to mp8899_regulator_info structure
> + *
> + * Removes all debugfs entries created for the MP8899 device.
> + */
> +static void mp8899_debugfs_exit(struct mp8899_regulator_info *info)
> +{
> +	debugfs_remove_recursive(info->debugfs_root);
> +}
> +
> +/**
> + * mp8899_identify_device() - Verify MP8899 device presence
> + * @info: Pointer to mp8899_regulator_info structure
> + *
> + * Reads and validates the vendor ID from SYSTEM4 register to confirm
> + * the device is a genuine MP8899 PMIC.
> + *
> + * Return: 0 on success, -ENODEV if vendor ID doesn't match
> + */
> +static int mp8899_identify_device(struct mp8899_regulator_info *info)
> +{
> +	unsigned int vendor_id;
> +	int ret;
> +
> +	ret = regmap_read(info->regmap, MP8899_SYSTEM4, &vendor_id);
> +	if (ret) {
> +		dev_err(info->dev, "Failed to read vendor ID: %d\n", ret);
> +		return ret;
> +	}
> +
> +	vendor_id = (vendor_id & MP8899_VENDOR_ID_MASK) >> 4;
> +	if (vendor_id != MP8899_VENDOR_ID_VALUE) {
> +		dev_err(info->dev, "Invalid vendor ID: 0x%x\n", vendor_id);
> +		return -ENODEV;
> +	}
> +
> +	dev_dbg(info->dev, "PMIC MP8899 device detected\n");
> +	return 0;
> +}
> +
> +/**
> + * mp8899_i2c_probe() - I2C driver probe function
> + * @client: I2C client device
> + *
> + * Initializes the MP8899 PMIC driver:
> + * 1. Allocates driver data structures
> + * 2. Initializes I2C regmap interface
> + * 3. Verifies device identity
> + * 4. Parses device tree configuration
> + * 5. Read the BUCK1_CTL3 register of each buck and configure the linear ranges accordingly
> + * 6. Registers regulator devices
> + *
> + * Return: 0 on success, negative error code on failure

Why do you have kerneldoc for probe? Actually - why do you have
kerneldoc everywhere?

> + */
> +static int mp8899_i2c_probe(struct i2c_client *client)
> +{
> +	struct mp8899_regulator_info *info;
> +	struct regulator_config config = {};
> +	struct device *dev = &client->dev;
> +	struct regulator_dev *rdev;
> +	struct regmap *regmap;
> +	unsigned int vout_select;
> +	int i, ret;
> +
> +	info = devm_kzalloc(dev, sizeof(struct mp8899_regulator_info), GFP_KERNEL);

This is some very old code. If you were working on upstream, you would
notice that syntax is sizeof(*). But NOW the syntax is even simpler: kzalloc_obj().


> +	if (!info)
> +		return -ENOMEM;
> +
> +	/* Allocate separate regulator_desc array for dynamic configuration */
> +	info->rdesc = devm_kmemdup(dev, mp8899_regulators_desc,
> +				   sizeof(mp8899_regulators_desc), GFP_KERNEL);
> +	if (!info->rdesc)
> +		return -ENOMEM;
> +
> +	info->dev = dev;
> +
> +	regmap = devm_regmap_init_i2c(client, &mp8899_regmap_config);
> +	if (IS_ERR(regmap))
> +		return dev_err_probe(dev, PTR_ERR(regmap), "Failed to allocate regmap\n");
> +
> +	info->regmap = regmap;
> +	i2c_set_clientdata(client, info);
> +
> +	/* Identify the device */
> +	ret = mp8899_identify_device(info);
> +	if (ret)
> +		return ret;
> +
> +	/* Parse device tree properties */
> +	if (client->dev.of_node)
> +		mp8899_parse_dt(&client->dev, info);
> +
> +	/* Configure linear ranges for each buck based on VOUT_SELECT */
> +	for (i = 0; i < MP8899_MAX_REGULATORS; i++) {
> +		ret = regmap_read(info->regmap,
> +				  MP8899_BUCK_REG(i, MP8899_BUCK1_CTL3),
> +				  &vout_select);
> +		if (ret) {
> +			dev_err(dev, "Failed to read VOUT_SELECT for buck%d: %d\n", i + 1, ret);
> +			return ret;
> +		}
> +
> +		if (vout_select & MP8899_VOUT_SELECT_MASK) {
> +			/* 1.0mV step mode */
> +			info->rdesc[i].linear_ranges = mp8899_buck_ranges_1000uv;
> +			info->rdesc[i].n_linear_ranges = ARRAY_SIZE(mp8899_buck_ranges_1000uv);
> +			info->rdesc[i].n_voltages = MP8899_N_VOLTAGES_1MV;  /* 3201 voltages */
> +			dev_dbg(dev, "Buck%d: 1.0mV step mode\n", i + 1);
> +		} else {
> +			/* 0.5mV step mode */
> +			info->rdesc[i].linear_ranges = mp8899_buck_ranges_500uv;
> +			info->rdesc[i].n_linear_ranges = ARRAY_SIZE(mp8899_buck_ranges_500uv);
> +			info->rdesc[i].n_voltages = MP8899_N_VOLTAGES;  /* 3296 voltages */
> +			dev_dbg(dev, "Buck%d: 0.5mV step mode\n", i + 1);
> +		}
> +	}
> +
> +	config.dev = dev;
> +	config.regmap = regmap;
> +	config.driver_data = info;
> +
> +	/* Register regulators */
> +	for (i = 0; i < MP8899_MAX_REGULATORS; i++) {
> +		rdev = devm_regulator_register(dev, &info->rdesc[i], &config);
> +		if (IS_ERR(rdev))
> +			return dev_err_probe(dev,
> +					     PTR_ERR(rdev),
> +					     "Failed to register regulator %d\n",
> +					     i);
> +
> +		info->rdev[i] = rdev;
> +	}
> +
> +	/* Initialize debugfs interface */
> +	mp8899_debugfs_init(info, client);
> +
> +	/* Register panic notifier for PMIC state dump */
> +	info->panic_notifier.notifier_call = mp8899_panic_handler;
> +	info->panic_notifier.priority = 0;
> +	ret = atomic_notifier_chain_register(&panic_notifier_list, &info->panic_notifier);
> +	if (ret)
> +		dev_info(dev, "Failed to register panic notifier: %d\n", ret);
> +
> +	dev_info(dev, "MP8899 regulator driver registered successfully\n");

Drop

> +
> +	return 0;
> +}
> +
> +/**
> + * mp8899_i2c_remove() - I2C driver remove function
> + * @client: I2C client device
> + *
> + * Cleanup function called when the driver is unloaded:
> + * 1. Unregister panic handler from notifier chain
> + * 2. Cleanup debugfs interface
> + *
> + * Return: 0 on success
> + */
> +static void mp8899_i2c_remove(struct i2c_client *client)
> +{
> +	struct mp8899_regulator_info *info = i2c_get_clientdata(client);
> +
> +	/* Unregister panic handler */
> +	atomic_notifier_chain_unregister(&panic_notifier_list, &info->panic_notifier);
> +
> +	/* Cleanup debugfs */
> +	mp8899_debugfs_exit(info);
> +
> +	dev_info(&client->dev, "MP8899 PMIC regulator driver removed\n");

Really, drop. We really do not print such messages in upstream. Look at
other drivers.

Best regards,
Krzysztof


