Return-Path: <linux-arm-msm+bounces-22771-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0077F909DF9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Jun 2024 16:55:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AB9D21C208B2
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Jun 2024 14:55:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC0EF107A9;
	Sun, 16 Jun 2024 14:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="LgQ5zGo4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from msa.smtpout.orange.fr (msa-211.smtpout.orange.fr [193.252.23.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA1EE19D8BA;
	Sun, 16 Jun 2024 14:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.252.23.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718549712; cv=none; b=MJL41sJDVIiLhjPKF1Jghr944y0LS/UBDA+eugxC+kyklOoqbQBDxgYmfvYwqtIGbiApGDwK/b2+Mp/LxGh3fUEdheKx62rJEGjm0w+tPuJS1PJlV8plO7GZWfHESfENoF3wGV8ulv9mvHfYxDpewPrXpkfZ5TxuwaRUxdd/vOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718549712; c=relaxed/simple;
	bh=O/z/vjCG75DIyxaHpKuZpK8HKPbP/ZzO9wdI9VnFK6g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TUEdh7UzLXnlFh3l3bLQlWxIi7/4cjRkK/WYT0e+V7z6CnJZ6gQPoMOfiOY/EtbLCXc7dj3qFWUw3Na1NSSIC7CQYvHasXZHcgtgaDCCc7h3hcrfAEZWj2tZZUgKPynnMJzi/Tv8SddBb0TFQI1VrnwJgOi5RCTb+NNbH15qQl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=LgQ5zGo4; arc=none smtp.client-ip=193.252.23.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [192.168.1.37] ([86.243.222.230])
	by smtp.orange.fr with ESMTPA
	id IrHWsSO0wuRA3IrHXsfkBD; Sun, 16 Jun 2024 16:55:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1718549701;
	bh=OAMsrwU7Q/Q7uwAy9o856/VzFrQmnQenr1H3/1+8Kos=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=LgQ5zGo44dK1XzAx6t987fvlNEHvrWLkZCD71N2kHh41BoEaNCQ/RF8uZVnNXqx0Q
	 tOMHoLsVMCETSBt50K8b4dlgtQpAKKgmKk5BHrXuT0emLD5LkKOw/cjMGyZtDRmAB9
	 oFl1gwQZp58BcoeNruu7JUXLy1zqxMNqmONO5MelfMHVVpq3q/pRv49feBNDqmQjGW
	 fk5QZGCRsBul/9vKSerElZL+zvVflkFJY0hXgXyUW4M6N1Dy0PkM0GXXQFoY5r/RHm
	 KckU7bgYY1+5/5/qz3JqbHRfYE/PK25Bndo1zV6tyoBkqZ5izV4RuliXandilo7Asc
	 fmNADNXO8D7OA==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 16 Jun 2024 16:55:01 +0200
X-ME-IP: 86.243.222.230
Message-ID: <2b92c0f9-2595-4b73-8015-1abb825a61a1@wanadoo.fr>
Date: Sun, 16 Jun 2024 16:54:58 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/7] ASoC: codecs: wcd937x: add wcd937x codec driver
To: Mohammad Rafi Shaik <quic_mohs@quicinc.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, quic_rohkumar@quicinc.com,
 quic_pkumpatl@quicinc.com, Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20240611074557.604250-1-quic_mohs@quicinc.com>
 <20240611074557.604250-4-quic_mohs@quicinc.com>
Content-Language: en-MW
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20240611074557.604250-4-quic_mohs@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 11/06/2024 à 09:45, Mohammad Rafi Shaik a écrit :
> From: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> 
> This patch adds basic SoundWire codec driver to support for
> WCD9370/WCD9375 TX and RX devices.
> 
> The WCD9370/WCD9375 has Multi Button Headset Control hardware to
> support Headset insertion, type detection, 8 headset buttons detection,
> Over Current detection and Impedence measurements.
> This patch adds support for this using wcd-mbhc apis.
> 
> Co-developed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> Co-developed-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> ---

Hi,

this pathc has reached -next, but I have a question.

If I'm correct, I can send a patch, but if the fix can be folded 
somewhere, this is also fine for me.

...

> +static int wcd937x_soc_codec_probe(struct snd_soc_component *component)
> +{

...

> +	wcd937x->hphr_pdm_wd_int = regmap_irq_get_virq(wcd937x->irq_chip,
> +						       WCD937X_IRQ_HPHR_PDM_WD_INT);
> +	wcd937x->hphl_pdm_wd_int = regmap_irq_get_virq(wcd937x->irq_chip,
> +						       WCD937X_IRQ_HPHL_PDM_WD_INT);
> +	wcd937x->aux_pdm_wd_int = regmap_irq_get_virq(wcd937x->irq_chip,
> +						      WCD937X_IRQ_AUX_PDM_WD_INT);
> +
> +	/* Request for watchdog interrupt */
> +	ret = devm_request_threaded_irq(dev, wcd937x->hphr_pdm_wd_int, NULL, wcd937x_wd_handle_irq,
> +					IRQF_ONESHOT | IRQF_TRIGGER_RISING,
> +					"HPHR PDM WDOG INT", wcd937x);
> +	if (ret)
> +		dev_err(dev, "Failed to request HPHR watchdog interrupt (%d)\n", ret);
> +
> +	ret = devm_request_threaded_irq(dev, wcd937x->hphl_pdm_wd_int, NULL, wcd937x_wd_handle_irq,
> +					IRQF_ONESHOT | IRQF_TRIGGER_RISING,
> +					"HPHL PDM WDOG INT", wcd937x);
> +	if (ret)
> +		dev_err(dev, "Failed to request HPHL watchdog interrupt (%d)\n", ret);
> +
> +	ret = devm_request_threaded_irq(dev, wcd937x->aux_pdm_wd_int, NULL, wcd937x_wd_handle_irq,
> +					IRQF_ONESHOT | IRQF_TRIGGER_RISING,
> +					"AUX PDM WDOG INT", wcd937x);
> +	if (ret)
> +		dev_err(dev, "Failed to request Aux watchdog interrupt (%d)\n", ret);
> +
> +	/* Disable watchdog interrupt for HPH and AUX */
> +	disable_irq_nosync(wcd937x->hphr_pdm_wd_int);
> +	disable_irq_nosync(wcd937x->hphl_pdm_wd_int);
> +	disable_irq_nosync(wcd937x->aux_pdm_wd_int);
> +
> +	ret = wcd937x_mbhc_init(component);
> +	if (ret)
> +		dev_err(component->dev, "mbhc initialization failed\n");
> +
> +	return ret;
> +}
> +
> +static void wcd937x_soc_codec_remove(struct snd_soc_component *component)
> +{
> +	struct wcd937x_priv *wcd937x = snd_soc_component_get_drvdata(component);
> +
> +	wcd937x_mbhc_deinit(component);
> +	free_irq(wcd937x->aux_pdm_wd_int, wcd937x);
> +	free_irq(wcd937x->hphl_pdm_wd_int, wcd937x);
> +	free_irq(wcd937x->hphr_pdm_wd_int, wcd937x);

These irq have been requested wth devm_request_threaded_irq(), so either 
this free_irq should be removed, or devm_free_irq() should be used if 
the order is important.

CJ

> +
> +	wcd_clsh_ctrl_free(wcd937x->clsh_info);
> +}




