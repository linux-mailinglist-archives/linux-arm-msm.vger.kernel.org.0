Return-Path: <linux-arm-msm+bounces-44444-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C0937A0653F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 20:20:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E53333A7D8F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 19:20:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B3482010E1;
	Wed,  8 Jan 2025 19:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="P1Nhm7JJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-30.smtpout.orange.fr [80.12.242.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2F8D200BB2;
	Wed,  8 Jan 2025 19:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736364044; cv=none; b=fbJSywQOyn9KAVD8YRyZ0ZiYKeAdJnYGAE8EYBrAS6+yIeoyCtm4gGmk3HNXkfYpA0ktYqc3l8H5bOD6n0JuBRhJ0W4Sbb+zeWWXfwkvr1351oahRCouer8t371dS6+c1YwzcLCixMHUNvJTbk+EDBrTVyS+OUBxUFmA+BSiZbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736364044; c=relaxed/simple;
	bh=L+RpQGow8xkrq65mketEkjUnqMJb37QojTR/a7ncITM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SlH/BrzEjXQbHkNxQkoDRrmoJkxtUCl6Ede7FIYnb0mkeh2eav97/hwq4SW2fZFNEPTNvkqy0yMwLIHoQMy8xpo3brUEA1aERq/kKwzQP8TDDnMX+Kd0LGiswINj2DQg8k5dX8A+EhAhSJN/Fe1vQnX4E3+Ro0PA7q3IQI8t75o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=P1Nhm7JJ; arc=none smtp.client-ip=80.12.242.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id VbaMtLzUGLSCnVbaPtFP0K; Wed, 08 Jan 2025 20:19:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1736363969;
	bh=BXCOtKlMZhgvv0WlfFdcDBMt3DYEIWplOpebQIGJy6E=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=P1Nhm7JJ6o4ex9Y/yOOLRkcQF7jcKeL2ucvGSpbqvzQjMOZNxvGt480Tl71nYwpnd
	 ATAXa2VpWTMxf/KrvWNUVtA10mGILwI8GAit8w3D9/yBVGlsQyC4xspUEMTln5oujL
	 cszRNcWnG+2RB4cKRjJhIdOGQIDR3xYPZ/rFG8s4yUb+ibnktuDG+/FLCd4bwojMy8
	 ernhAytbnefHKV+LLSAVNxXSqJTCFB+CLf1xtU3yPf6Pk+lrBmlg88Ug2noNgIWz57
	 ZRlZn+L8T2Ddv0MSdi5hN21d13ZQNzn5AVIk0jggt2qJf8iOcRe82O6oAgzncW34Z4
	 JUyWNSlqfeY+Q==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Wed, 08 Jan 2025 20:19:29 +0100
X-ME-IP: 90.11.132.44
Message-ID: <29e742c9-82f5-41d5-a06f-70f010a3f39e@wanadoo.fr>
Date: Wed, 8 Jan 2025 20:19:17 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 03/14] net: ethernet: qualcomm: Add PPE driver
 for IPQ9574 SoC
To: Luo Jie <quic_luoj@quicinc.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Lei Wei <quic_leiwei@quicinc.com>,
 Suruchi Agarwal <quic_suruchia@quicinc.com>,
 Pavithra R <quic_pavir@quicinc.com>, Simon Horman <horms@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-hardening@vger.kernel.org,
 quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
 srinivas.kandagatla@linaro.org, bartosz.golaszewski@linaro.org,
 john@phrozen.org
References: <20250108-qcom_ipq_ppe-v2-0-7394dbda7199@quicinc.com>
 <20250108-qcom_ipq_ppe-v2-3-7394dbda7199@quicinc.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20250108-qcom_ipq_ppe-v2-3-7394dbda7199@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 08/01/2025 à 14:47, Luo Jie a écrit :
> The PPE (Packet Process Engine) hardware block is available
> on Qualcomm IPQ SoC that support PPE architecture, such as
> IPQ9574.
> 
> The PPE in IPQ9574 includes six integrated ethernet MAC
> (for 6 PPE ports), buffer management, queue management and
> scheduler functions. The MACs can connect with the external
> PHY or switch devices using the UNIPHY PCS block available
> in the SoC.
> 
> The PPE also includes various packet processing offload
> capabilities such as L3 routing and L2 bridging, VLAN and
> tunnel processing offload. It also includes Ethernet DMA
> function for transferring packets between ARM cores and
> PPE ethernet ports.
> 
> This patch adds the base source files and Makefiles for
> the PPE driver such as platform driver registration,
> clock initialization, and PPE reset routines.
> 
> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
> ---

...

> +static int qcom_ppe_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct ppe_device *ppe_dev;
> +	void __iomem *base;
> +	int ret, num_icc;
> +
> +	num_icc = ARRAY_SIZE(ppe_icc_data);
> +	ppe_dev = devm_kzalloc(dev, struct_size(ppe_dev, icc_paths, num_icc),
> +			       GFP_KERNEL);
> +	if (!ppe_dev)
> +		return dev_err_probe(dev, -ENOMEM, "PPE alloc memory failed\n");

Usually, no error message in logged in case of devm_kzalloc().
It is already loud enough.

> +
> +	base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(base))
> +		return dev_err_probe(dev, PTR_ERR(base), "PPE ioremap failed\n");
> +
> +	ppe_dev->regmap = devm_regmap_init_mmio(dev, base, &regmap_config_ipq9574);
> +	if (IS_ERR(ppe_dev->regmap))
> +		return dev_err_probe(dev, PTR_ERR(ppe_dev->regmap),
> +				     "PPE initialize regmap failed\n");
> +	ppe_dev->dev = dev;
> +	ppe_dev->clk_rate = PPE_CLK_RATE;
> +	ppe_dev->num_ports = PPE_PORT_MAX;
> +	ppe_dev->num_icc_paths = num_icc;
> +
> +	ret = ppe_clock_init_and_reset(ppe_dev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "PPE clock config failed\n");
> +
> +	platform_set_drvdata(pdev, ppe_dev);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id qcom_ppe_of_match[] = {
> +	{ .compatible = "qcom,ipq9574-ppe" },
> +	{},

The ending comma after a terminator like that is not needed.

> +};

...

CJ


