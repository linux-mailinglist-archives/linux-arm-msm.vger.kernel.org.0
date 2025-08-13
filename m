Return-Path: <linux-arm-msm+bounces-69077-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BCF9B2572A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 01:04:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5A4621C81360
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 23:04:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF7B72F3C36;
	Wed, 13 Aug 2025 23:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QCrrJARN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D572EA16E
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 23:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755126260; cv=none; b=G+zwU1B7PxsVVvlXZW8XT2zt48As79NvQ8Y+Gbn76BHhu3ePt4feuqW5hOYcmeROiYtJxNBPj1Ng/tMn423Y3FgX1KC1eGGQDBqa2CZD9ulQuSrqJGa8odfasb+3FqYnIDydAbfRYlpbEciVbg+AOaDpAt5m3DAjr/dTnF65NP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755126260; c=relaxed/simple;
	bh=V8tv6QYmtZ4XrciW/E5chTrle+DeFBzxKefuKdwTNlM=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=U2UuNynZx64Xdbrjj+MpDhs6JvPtyMJw2JcEGAYBidY+Dtm0rou4MFwbJx7d2ELu71239LQyrhhnq3N3st+AjiHNUhSc4IFuFtmCngdS5O0bRFbu8Be1cDxFMoI3mNles5IssAqvZZQcuJ5T9hOnlSHaA8Cr6cYmxh7s25640DY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QCrrJARN; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-45a1b0bd237so2201465e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 16:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755126255; x=1755731055; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fma0jMGy51uQlwxrCY+Lr/EVRe0o/h9sqaHsep6/mww=;
        b=QCrrJARNSh9iaSZvMuLHTJrAvyUYevsj50a8XYfzDzJySWtRLRCV0oWPxEM54Uciow
         H5I+wgQjaGuvBQafg2Sr7GZ7ZQ3FB37f+ki9+ta/QT3d2l3PcWK5mfu6NYarAjGZl0hf
         sCZUCDAxxi6qCFuaLW5S5Py3NcG1hEyrxqiQ1kmOYNnDJuWbxUZMi92zzQivS3K+ZsJg
         R2RDwEObZTx+NJWRAqa5YN1bAatk7mFYWW9JQY+U1NUOnH4s7kxpbKIYgmQYAgnY++Sv
         YnYTXbBaHTZHkJaUNCem8KviTBw01M8TKG8oABtlySbbaNqdPxSMn1VUmPMm2Lv+NQMz
         063A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755126255; x=1755731055;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Fma0jMGy51uQlwxrCY+Lr/EVRe0o/h9sqaHsep6/mww=;
        b=QFyRGs7EX5oaNttGEtcBp7ffnsi4+m2AiPwhwebagNXp9TE41zERLY9qz+5iNr3HvE
         WpwfrchMMRVnWJR+55vDEo7ohSBnRVIc+oJtiEtIv++0JHe7e1Hz/zcyiZYgV9msYBHa
         ozwDVj06Zu8D4QmUFp9IH9oA/EMByPv7ZsMYvy2nOgaPHgyrerbkNwf+NzUtY3lsS7L+
         B5BKcupEtEZr6DGOR9CMTqLBNiIHTc9wpsGckbojQsZOr+taQFSHNiHr6oVTQUKJGvmR
         6SoVDMQ3ZagFq5fLYU19RkNkb+dcB+juCXPgi7N+gPuYkgI46g+S8qQk0pwuxp59Db2w
         w3Nw==
X-Forwarded-Encrypted: i=1; AJvYcCWLHLy6NngYhD4dqM8HVMxVilJSWVD3A9UNcbtTsm7EOd3kddM8brfYKhrxoRbpAymbPswbLBFey5k3Qw73@vger.kernel.org
X-Gm-Message-State: AOJu0Ywq3nfLRC0KTPmqq1/wcdhxlc9YgsX3qXTxqu5UxErdLxdrZfTr
	PlFjSqbh8EFBF8psORFMdtOUA1fQo3MtF4bRBSPhgJcCzISfX/k1xRtjCs/sqkKEPMM=
X-Gm-Gg: ASbGncutM03hbzgMakX8ZOb+DJ+8Bxpk8ejLYP/QasDdfys6KGrvThSrL4TUSCAtGSh
	dKR83yFMYHin+jMXYnRyFyGrMlYTMHa8RKCb+iKI5EHz+PhHkULFwU484wBZ9g+QrIb6rjNY2LN
	AwpbQecwtHgvDpzuQP/F3kKEXY6mdCLLY/Y1fQKFn4vxP8ydkWjKoJpTavK1Ty2pKznZEZ/BcM+
	PbqZKFus7LTaNvWZ33x8Hq/EAzwgtYA0ngscEzreoaG7OnrLbbyy7OcPiaSvumsVrq+qCs3DMIE
	9w6QMLBMvQVpZplIirC+tlKgdyHfhyF+Ulz//Q44A55PBjDymdLPRv8AS7r8udpNR6aYGRAFsHH
	fZQFqmTBhyXliJ7c2EBj4UT4G3y8=
X-Google-Smtp-Source: AGHT+IEhcbKpnrTTmO41bGN+y6+XLDkw2c1iBzsSYn8Otej+XJU1Ch8JUGavn+Mdu+oPYs7fT9Y/tQ==
X-Received: by 2002:a05:600c:3515:b0:456:1923:7549 with SMTP id 5b1f17b1804b1-45a1b6553a8mr3339795e9.26.1755126254989;
        Wed, 13 Aug 2025 16:04:14 -0700 (PDT)
Received: from localhost ([2a02:c7c:7259:a00:7f3a:5ab2:26aa:831f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1a50b9e6sm19416515e9.6.2025.08.13.16.04.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 16:04:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 14 Aug 2025 00:04:13 +0100
Message-Id: <DC1OBXZ7UUTZ.2V473MOKABPKJ@linaro.org>
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Christophe JAILLET" <christophe.jaillet@wanadoo.fr>
Cc: "Srinivas Kandagatla" <srini@kernel.org>, "Liam Girdwood"
 <lgirdwood@gmail.com>, "Mark Brown" <broonie@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Stephen Boyd" <sboyd@kernel.org>, "Lee
 Jones" <lee@kernel.org>, "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai"
 <tiwai@suse.com>, <linux-arm-msm@vger.kernel.org>,
 <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Dmitry Baryshkov"
 <dmitry.baryshkov@oss.qualcomm.com>, "Srinivas Kandagatla"
 <srinivas.kandagatla@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/3] ASoC: codecs: add new pm4125 audio codec driver
X-Mailer: aerc 0.20.0
References: <20250711-pm4125_audio_codec_v1-v2-0-13e6f835677a@linaro.org>
 <20250711-pm4125_audio_codec_v1-v2-2-13e6f835677a@linaro.org>
 <0acde3b4-a437-4fa1-b5bd-fe1810309bb8@wanadoo.fr>
In-Reply-To: <0acde3b4-a437-4fa1-b5bd-fe1810309bb8@wanadoo.fr>

On Fri Jul 11, 2025 at 4:15 PM BST, Christophe JAILLET wrote:
> Hi,

Hi Christophe,

>> +static int pm4125_probe(struct sdw_slave *pdev, const struct sdw_device=
_id *id)
>> +{
>> +	struct device *dev =3D &pdev->dev;
>> +	struct pm4125_sdw_priv *priv;
>> +	u8 master_ch_mask[PM4125_MAX_SWR_CH_IDS];
>> +	int master_ch_mask_size =3D 0;
>> +	int ret, i;
>> +
>> +	priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>> +	if (!priv)
>> +		return -ENOMEM;
>> +
>> +	/* Port map index starts at 0, however the data port for this codec st=
arts at index 1 */
>> +	if (of_property_present(dev->of_node, "qcom,tx-port-mapping")) {
>> +		priv->is_tx =3D true;
>> +		ret =3D of_property_read_u32_array(dev->of_node, "qcom,tx-port-mappin=
g",
>> +						 &pdev->m_port_map[1], PM4125_MAX_TX_SWR_PORTS);
>> +	} else
>> +		ret =3D of_property_read_u32_array(dev->of_node, "qcom,rx-port-mappin=
g",
>> +						 &pdev->m_port_map[1], PM4125_MAX_SWR_PORTS);
>
> Nitpick: If a branch of an if needs { }, I think that both should have.

Yes. Thanks.

>> +
>> +	if (ret < 0)
>> +		dev_info(dev, "Error getting static port mapping for %s (%d)\n",
>> +			 priv->is_tx ? "TX" : "RX", ret);
>> +
>> +	priv->sdev =3D pdev;
>> +	dev_set_drvdata(dev, priv);
>
> ...
>
>> +static const struct sdw_device_id pm4125_slave_id[] =3D {
>> +	SDW_SLAVE_ENTRY(0x0217, 0x10c, 0), /* Soundwire pm4125 RX/TX Device ID=
 */
>> +	{ },
>
> No need for a trailing comma after a terminator

Ok.


>> +};
>> +MODULE_DEVICE_TABLE(sdw, pm4125_slave_id);
>
> ...
>
>> +#include <linux/component.h>
>> +#include <linux/delay.h>
>> +#include <linux/device.h>
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/pm_runtime.h>
>> +#include <linux/regmap.h>
>> +#include <linux/regulator/consumer.h>
>> +#include <linux/slab.h>
>> +#include <sound/jack.h>
>
> Maybe, keep alphabetical order?

It looks like the headers were sorted in pm4125-sdw.c.
However, in pm4125.c I changed the order a bit for the next submission.

>> +#include <sound/pcm_params.h>
>> +#include <sound/pcm.h>
>> +#include <sound/soc-dapm.h>
>> +#include <sound/soc.h>
>> +#include <sound/tlv.h>
>
> ...
>
>> +static int pm4125_bind(struct device *dev)
>
> If an error occures at some point, should things be undone before returni=
ng?

Thanks! This probably inherited from other codecs.
I reimplemented this for the next version.

>> +{
>> +	struct pm4125_priv *pm4125 =3D dev_get_drvdata(dev);
>> +	int ret;
>> +
>> +	/* Give the soundwire subdevices some more time to settle */
>> +	usleep_range(15000, 15010);
>> +
>> +	ret =3D component_bind_all(dev, pm4125);
>> +	if (ret) {
>> +		dev_err(dev, "Slave bind failed, ret =3D %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	pm4125->rxdev =3D pm4125_sdw_device_get(pm4125->rxnode);
>> +	if (!pm4125->rxdev) {
>> +		dev_err(dev, "could not find rxslave with matching of node\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	pm4125->sdw_priv[AIF1_PB] =3D dev_get_drvdata(pm4125->rxdev);
>> +	pm4125->sdw_priv[AIF1_PB]->pm4125 =3D pm4125;
>> +
>> +	pm4125->txdev =3D pm4125_sdw_device_get(pm4125->txnode);
>> +	if (!pm4125->txdev) {
>> +		dev_err(dev, "could not find txslave with matching of node\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	pm4125->sdw_priv[AIF1_CAP] =3D dev_get_drvdata(pm4125->txdev);
>> +	pm4125->sdw_priv[AIF1_CAP]->pm4125 =3D pm4125;
>> +
>> +	pm4125->tx_sdw_dev =3D dev_to_sdw_dev(pm4125->txdev);
>> +	if (!pm4125->tx_sdw_dev) {
>> +		dev_err(dev, "could not get txslave with matching of dev\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	/*
>> +	 * As TX is the main CSR reg interface, which should not be suspended =
first.
>> +	 * expicilty add the dependency link
>> +	 */
>> +	if (!device_link_add(pm4125->rxdev, pm4125->txdev,
>> +			     DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME)) {
>> +		dev_err(dev, "Could not devlink TX and RX\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	if (!device_link_add(dev, pm4125->txdev,
>> +			     DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME)) {
>> +		dev_err(dev, "Could not devlink PM4125 and TX\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	if (!device_link_add(dev, pm4125->rxdev,
>> +			     DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME)) {
>> +		dev_err(dev, "Could not devlink PM4125 and RX\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	pm4125->regmap =3D dev_get_regmap(&pm4125->tx_sdw_dev->dev, NULL);
>> +	if (!pm4125->regmap) {
>> +		dev_err(dev, "could not get TX device regmap\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	ret =3D pm4125_irq_init(pm4125, dev);
>> +	if (ret) {
>> +		dev_err(dev, "IRQ init failed: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	pm4125->sdw_priv[AIF1_PB]->slave_irq =3D pm4125->virq;
>> +	pm4125->sdw_priv[AIF1_CAP]->slave_irq =3D pm4125->virq;
>> +
>> +	ret =3D pm4125_set_micbias_data(pm4125);
>> +	if (ret < 0) {
>> +		dev_err(dev, "Bad micbias pdata\n");
>> +		return ret;
>> +	}
>> +
>> +	ret =3D snd_soc_register_component(dev, &soc_codec_dev_pm4125,
>> +					 pm4125_dais, ARRAY_SIZE(pm4125_dais));
>> +	if (ret)
>> +		dev_err(dev, "Codec registration failed\n");
>> +
>> +	return ret;
>> +}

[..]

>> +static int pm4125_probe(struct platform_device *pdev)
>> +{
>> +	struct component_match *match =3D NULL;
>> +	struct device *dev =3D &pdev->dev;
>> +	struct pm4125_priv *pm4125;
>> +	struct wcd_mbhc_config *cfg;
>> +	int ret;
>> +
>> +	pm4125 =3D devm_kzalloc(dev, sizeof(*pm4125), GFP_KERNEL);
>> +	if (!pm4125)
>> +		return -ENOMEM;
>> +
>> +	dev_set_drvdata(dev, pm4125);
>> +
>> +	pm4125->supplies[0].supply =3D "vdd-io";
>> +	pm4125->supplies[1].supply =3D "vdd-cp";
>> +	pm4125->supplies[2].supply =3D "vdd-mic-bias";
>> +	pm4125->supplies[3].supply =3D "vdd-pa-vpos";
>> +
>> +	ret =3D devm_regulator_bulk_get(dev, PM4125_MAX_BULK_SUPPLY, pm4125->s=
upplies);
>
> devm_regulator_bulk_get_enable() could certainly be used to save a few=20
> lines of code after fix the missing regulator_bulk_disable() in the=20
> error handling of the probe.

Thanks! I'll reimplement this.
For me it looks like after staring at devm_regulator_bulk_get_enable()
that regulator_bulk_disable() is not needed.

[..]

>> +static void pm4125_remove(struct platform_device *pdev)
>> +{
>> +	struct device *dev =3D &pdev->dev;
>> +	struct pm4125_priv *pm4125 =3D dev_get_drvdata(dev);
>> +
>> +	component_master_del(&pdev->dev, &pm4125_comp_ops);
>> +
>> +	pm_runtime_disable(dev);
>> +	pm_runtime_set_suspended(dev);
>> +	pm_runtime_dont_use_autosuspend(dev);
>> +
>> +	regulator_bulk_disable(PM4125_MAX_BULK_SUPPLY, pm4125->supplies);
>> +	regulator_bulk_free(PM4125_MAX_BULK_SUPPLY, pm4125->supplies);
>
> Is it correct? (it looks related to devm_regulator_bulk_get())

I'll take a look at that.

Thank you,
Alexey

