Return-Path: <linux-arm-msm+bounces-63843-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 491A4AFA3B6
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Jul 2025 10:35:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D25A4189ADDF
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Jul 2025 08:35:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 957551D61AA;
	Sun,  6 Jul 2025 08:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="Pbhg67sX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-23.smtpout.orange.fr [80.12.242.23])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F37135972;
	Sun,  6 Jul 2025 08:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751790936; cv=none; b=hH5WfDeiL/+NdVYN67zwx2VyBedyOOlN4pMtF+ne9JAcZS996fo6GE76cmRv/9Fn5EahAEE+Dv+Y8e7J+PrM68W9x/owR2m8cmMGMFYklbyVeBKI9mod6IgAYCyA58eTaO7RrfM/pCq4eZP18Tvn+BgTVgGFJHj+lOsNqtr26n4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751790936; c=relaxed/simple;
	bh=zZBUK8UI3llPineO/aa9x7oBS9wgghT1PNTWtF3og3M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=epuyRKdVZgirVzsuRu17sIDbNQg88/bdrvdZcW/eHphRlRfwnGT9T+gqR3tDLA/a+90EwukbllvcpW6m1NYYLNa327um/jW9/7uMGcFCWkv2yb4JEJqJBUsVjfFVuDLsR2ZesERVLdmCNGh0qlrtmzf+IzTLOBXQ8pQmjkR+M1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=Pbhg67sX; arc=none smtp.client-ip=80.12.242.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [IPV6:2a01:cb10:785:b00:8347:f260:7456:7662]
 ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPA
	id YKqHuLICcZ4iTYKqHu4AIl; Sun, 06 Jul 2025 10:35:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1751790924;
	bh=MDB5p/WAC2P7Gszd897B3IA9qciUHzVqAJvFbhA+Lk0=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=Pbhg67sX+6R6NST17kTPvzXRRIuZTve8csYNJfaBBXyUC6DzontwufivbY2GkUXlq
	 fU607R+bT7Js4Z+hx8oyXDK26yY6M1Yc5pwwInThh8qqCacfvPWJj42J92IJGH/Rkn
	 2PwQdjmyPF4ku/J1x/bIKiq0bSNgwOY3GzDhZO6tMVa8pv/oeP/LUWRV/MagN8X048
	 SHVWwK8dbsEyZODw76WHRwQ4Lc3GAr1AEMZcZ5SlYAQ/2DvgV4Mx+yLh9VLsA1PAfa
	 PW249lU8AK1EtKcAr6kTkIxyOLhJRzRmb+P6GUGXzDF1HFnKa0L2wy4c1xDOLA498d
	 4ouFGntQlECOw==
X-ME-Helo: [IPV6:2a01:cb10:785:b00:8347:f260:7456:7662]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Sun, 06 Jul 2025 10:35:24 +0200
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
Message-ID: <225692dd-c41b-4e9d-a20b-551f9bfb5051@wanadoo.fr>
Date: Sun, 6 Jul 2025 10:35:20 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] ASoC: codecs: Add Awinic AW8898 amplifier driver
To: Luca Weiss <luca@lucaweiss.eu>, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Weidong Wang <wangweidong.a@awinic.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250705-aw8898-v2-0-9c3adb1fc1a2@lucaweiss.eu>
 <20250705-aw8898-v2-2-9c3adb1fc1a2@lucaweiss.eu>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20250705-aw8898-v2-2-9c3adb1fc1a2@lucaweiss.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 05/07/2025 à 14:03, Luca Weiss a écrit :
> Add a driver for the AW8898 Audio Amplifier.
> 
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>

Hi,

...

> +#define AW8898_CFG_NAME				"aw8898_cfg.bin"
> +
> +#define AW8898_NUM_SUPPLIES	3

See the probe below, but if simplified, AW8898_NUM_SUPPLIES would be 
useless and could be removed.

> +static const char *aw8898_supply_names[AW8898_NUM_SUPPLIES] = {

static const char * const ?

> +	"vdd",		/* Battery power */
> +	"vddio",	/* Digital IO power */
> +	"dvdd",		/* Digital power */
> +};
> +
> +static const char * const aw8898_dev_mode_text[] = {
> +	"Speaker",
> +	"Receiver",
> +};

...

> +static int aw8898_drv_event(struct snd_soc_dapm_widget *w,
> +				struct snd_kcontrol *kcontrol, int event)
> +{
> +	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
> +	struct aw8898 *aw8898 = snd_soc_component_get_drvdata(component);
> +	int ret;

Maybe ret = 0; to simplify the code below?

Or, as done in aw8898_hw_params(), return -EINVAL; in the default case, 
and a plain return 0; at the end of the function?

> +
> +	switch (event) {
> +	case SND_SOC_DAPM_PRE_PMU:
> +		aw8898_set_power(aw8898, true);
> +
> +		if (!aw8898->cfg_loaded)
> +			aw8898_cold_start(aw8898);
> +
> +		ret = 0;
> +		break;
> +	case SND_SOC_DAPM_POST_PMD:
> +		aw8898_set_power(aw8898, false);
> +		ret = 0;
> +		break;
> +	default:
> +		dev_err(component->dev, "%s: invalid event %d\n", __func__, event);
> +		ret = -EINVAL;

Even if useless, having a break is more standard.

> +	}
> +
> +	return ret;
> +}

...

> +static int aw8898_check_chipid(struct aw8898 *aw8898)
> +{
> +	unsigned int reg;
> +	int ret;
> +
> +	ret = regmap_read(aw8898->regmap, AW8898_ID, &reg);
> +	if (ret < 0) {
> +		dev_err(&aw8898->client->dev,
> +			"Failed to read register AW8898_ID: %d\n", ret);

aw8898_check_chipid() is only called from the probe, so using return 
dev_err_probe() should be fine.

> +		return ret;
> +	}
> +
> +	dev_dbg(&aw8898->client->dev, "Read chip ID 0x%x\n", reg);
> +
> +	if (reg != AW8898_CHIP_ID) {
> +		dev_err(&aw8898->client->dev, "Unexpected chip ID: 0x%x\n",
> +			reg);

Same.

> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int aw8898_probe(struct i2c_client *client)
> +{
> +	struct aw8898 *aw8898;
> +	int ret;
> +
> +	aw8898 = devm_kzalloc(&client->dev, sizeof(*aw8898), GFP_KERNEL);
> +	if (!aw8898)
> +		return -ENOMEM;
> +
> +	i2c_set_clientdata(client, aw8898);
> +	aw8898->client = client;
> +
> +	aw8898->regmap = devm_regmap_init_i2c(client, &aw8898_regmap);
> +	if (IS_ERR(aw8898->regmap))
> +		return dev_err_probe(&client->dev, PTR_ERR(aw8898->regmap),
> +				     "Failed to allocate register map\n");
> +
> +	for (int i = 0; i < ARRAY_SIZE(aw8898->supplies); i++)
> +		aw8898->supplies[i].supply = aw8898_supply_names[i];
> +
> +	ret = devm_regulator_bulk_get(&client->dev, ARRAY_SIZE(aw8898->supplies),
> +				      aw8898->supplies);

devm_regulator_bulk_get_enable() would simplify the code and 'struct 
aw8898'.

> +	if (ret)
> +		return dev_err_probe(&client->dev, ret,
> +				     "Failed to get regulators\n");
> +
> +	ret = regulator_bulk_enable(ARRAY_SIZE(aw8898->supplies),
> +				    aw8898->supplies);
> +	if (ret) {
> +		dev_err(&client->dev, "Failed to enable supplies: %d\n",
> +			ret);

If dev_err_probe() to be consistent with the code below and above.
But this would be removed if devm_regulator_bulk_get_enable() is used.

> +		return ret;
> +	}
> +
> +	aw8898->reset = devm_gpiod_get(&client->dev, "reset", GPIOD_OUT_HIGH);
> +	if (IS_ERR(aw8898->reset))
> +		return dev_err_probe(&client->dev, PTR_ERR(aw8898->reset),
> +				     "Failed to get reset GPIO\n");
>

...

CJ

