Return-Path: <linux-arm-msm+bounces-1941-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DE40C7F8A5F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Nov 2023 12:55:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 90BDC280AC3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Nov 2023 11:55:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9185DF66;
	Sat, 25 Nov 2023 11:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Bbmw9pH5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1F8410E2
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Nov 2023 03:55:11 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-50baa2a278bso423601e87.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Nov 2023 03:55:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700913310; x=1701518110; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VjoAQdrJlyucZgCB5XwzbgMabrtPSPnwCcmkjxg9epU=;
        b=Bbmw9pH5nZZzTea+vjRB6fF6fvqoJUdmA/g4T9w1OOYuUeRyf/El9L2mdm4/M8GAis
         mtPdNAk9O856M04VuwFUkPXPSrqpSXCnWj3zPtVtgVmerNMEr07RIiJ6DMRFu4IbN6xe
         oKF7BNmomzrjDtMSOyzirzl0qofsEEwR1eq55OI4imuiay6PNUWO+B45LBUY2f27nLDN
         eUCgI/TkJMwk2sbA1lwDjOLe7xM3c1zkDJzIo/pQW3qbPogOfJhGb0kjCbJp0Q1r5O7D
         VGIvDecg6ugskSSfhiVIVZ0qo6MIejxLytRKCcEBb7cQki6H4bBrr4xmvokppm0arDaR
         Nb5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700913310; x=1701518110;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VjoAQdrJlyucZgCB5XwzbgMabrtPSPnwCcmkjxg9epU=;
        b=Sa1KT96o3ZFCYpoI578afkp77NyjgArc/ghsjpJK2C2MiZa5/wVvsAvQZNihdEQOb9
         lQEpjLWuCqf1Y2HYO/Et4IJnrPNplxeWgKjU+P0rCU34Zn6ysV2E7zXFEztTb6FJEYAi
         0r3ldnDjMJCSphMTpcoI+wjXsJbXBupiM9n72N7eiqRpiqEwSZKtYJ4wOdf3KUl8AAvm
         w+71Pni8HdSC0QsJ9D215jm3YFvnxRMzTJQ4Qw0jZASByq6hoBv5d5epB201qy/rXAXt
         tG4fXJgeUsZKcPwZ516qHpcJH3Ckqa4i/WD6ynX/tFSDoJ0PYOjk6KOUKrO2olvbYoXi
         Q9Gw==
X-Gm-Message-State: AOJu0Yy5IWKXbCv2tbnR29D7ahBSB05aN4e6bc4GRcXBOppvgHbcEuCq
	Js1gfZ/b542euqSDRfH5rrQYVw==
X-Google-Smtp-Source: AGHT+IEpfEUF2H5QKFf1d+Y7GHXr1irfgb4HzPwZHkRk2yxzLqSU/f+XmRCfwxuxa/YfvKLZt9GCWA==
X-Received: by 2002:a05:6512:3a85:b0:50b:a6c7:e8b0 with SMTP id q5-20020a0565123a8500b0050ba6c7e8b0mr1102022lfu.26.1700913309934;
        Sat, 25 Nov 2023 03:55:09 -0800 (PST)
Received: from [192.168.201.100] (178235187180.dynamic-4-waw-k-2-3-0.vectranet.pl. [178.235.187.180])
        by smtp.gmail.com with ESMTPSA id a18-20020a170906191200b009e6cedc8bf5sm3348915eje.29.2023.11.25.03.55.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Nov 2023 03:55:09 -0800 (PST)
Message-ID: <a7725504-89fd-4f62-b8d0-6ec863bd059a@linaro.org>
Date: Sat, 25 Nov 2023 12:55:07 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] ASoC: codecs: Add WCD939x Soundwire slave driver
Content-Language: en-US
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20231123-topic-sm8650-upstream-wcd939x-codec-v1-0-21d4ad9276de@linaro.org>
 <20231123-topic-sm8650-upstream-wcd939x-codec-v1-4-21d4ad9276de@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20231123-topic-sm8650-upstream-wcd939x-codec-v1-4-21d4ad9276de@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.11.2023 15:49, Neil Armstrong wrote:
> Add Soundwire Slave driver for the WCD9390/WCD9395 Audio Codec.
> 
> The WCD9390/WCD9395 Soundwire Slaves will be used by the
> main WCD9390/WCD9395 Audio Codec driver to access registers
> and configure Soundwire RX and TX ports.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
[...]


> +static struct wcd939x_sdw_ch_info wcd939x_sdw_tx_ch_info[] = {
> +	WCD_SDW_CH(WCD939X_ADC1, WCD939X_ADC_1_4_PORT, BIT(0)),
> +	WCD_SDW_CH(WCD939X_ADC2, WCD939X_ADC_1_4_PORT, BIT(1)),
> +	WCD_SDW_CH(WCD939X_ADC3, WCD939X_ADC_1_4_PORT, BIT(2)),
> +	WCD_SDW_CH(WCD939X_ADC4, WCD939X_ADC_1_4_PORT, BIT(3)),
> +	// TOFIX support ADC3/4 & DMIC0/1 on port 2
Well, fix it or drop it :D

> +	//WCD_SDW_CH(WCD939X_ADC3, WCD939X_ADC_DMIC_1_2_PORT, BIT(0)),
> +	//WCD_SDW_CH(WCD939X_ADC4, WCD939X_ADC_DMIC_1_2_PORT, BIT(1)),
> +	//WCD_SDW_CH(WCD939X_DMIC0, WCD939X_ADC_DMIC_1_2_PORT, BIT(2)),
> +	//WCD_SDW_CH(WCD939X_DMIC1, WCD939X_ADC_DMIC_1_2_PORT, BIT(3)),
> +	WCD_SDW_CH(WCD939X_DMIC0, WCD939X_DMIC_0_3_MBHC_PORT, BIT(0)),
> +	WCD_SDW_CH(WCD939X_DMIC1, WCD939X_DMIC_0_3_MBHC_PORT, BIT(1)),
> +	WCD_SDW_CH(WCD939X_MBHC, WCD939X_DMIC_0_3_MBHC_PORT, BIT(2)),
> +	WCD_SDW_CH(WCD939X_DMIC2, WCD939X_DMIC_0_3_MBHC_PORT, BIT(2)),
> +	WCD_SDW_CH(WCD939X_DMIC3, WCD939X_DMIC_0_3_MBHC_PORT, BIT(3)),
> +	WCD_SDW_CH(WCD939X_DMIC4, WCD939X_DMIC_3_7_PORT, BIT(0)),
> +	WCD_SDW_CH(WCD939X_DMIC5, WCD939X_DMIC_3_7_PORT, BIT(1)),
> +	WCD_SDW_CH(WCD939X_DMIC6, WCD939X_DMIC_3_7_PORT, BIT(2)),
> +	WCD_SDW_CH(WCD939X_DMIC7, WCD939X_DMIC_3_7_PORT, BIT(3)),
> +};
[...]

> +
> +int wcd939x_swr_get_current_bank(struct sdw_slave *sdev)
> +{
> +	int bank;
> +
> +	bank = sdw_read(sdev, SDW_SCP_CTRL);
> +
> +	return ((bank & 0x40) ? 1 : 0);
bool conversion?

Also, 0x40 == BIT(6), can you look up what it means and #define it?

[...]

> +
> +static int wcd9390_bus_config(struct sdw_slave *slave,
> +			      struct sdw_bus_params *params)
> +{
> +	sdw_write(slave, SWRS_SCP_HOST_CLK_DIV2_CTL_BANK(params->next_bank),
> +		  0x01);
similar, BIT(0)
[...]

> +	{ WCD939X_EAR_STATUS_REG_2, 0x08 },
> +	{ WCD939X_FLYBACK_NEW_CTRL_2, 0x00 }, //??
> +	{ WCD939X_FLYBACK_NEW_CTRL_3, 0x00 }, //??
> +	{ WCD939X_FLYBACK_NEW_CTRL_4, 0x44 }, //??
drop //s
[...]

> +static bool wcd939x_volatile_register(struct device *dev, unsigned int reg)
> +{
> +	if (reg <= WCD939X_BASE)
> +		return false;
Maybe move this check to readonly_register
> +
> +	if (wcd939x_readonly_register(dev, reg))
> +		return true;
and call readonly for .volatile_reg as well?
[...]

> +	/**
> +	 * Port map index starts with 0, however the data port for this codec
> +	 * are from index 1
> +	 */
This is not kerneldoc

> +	if (of_property_read_bool(dev->of_node, "qcom,tx-port-mapping")) {
> +		wcd->is_tx = true;
> +		ret = of_property_read_u32_array(dev->of_node,
> +						 "qcom,tx-port-mapping",
> +						 &pdev->m_port_map[1],
> +						 WCD939X_MAX_TX_SWR_PORTS);
> +	} else {
> +		ret = of_property_read_u32_array(dev->of_node,
> +						 "qcom,rx-port-mapping",
> +						 &pdev->m_port_map[1],
> +						 WCD939X_MAX_RX_SWR_PORTS);
> +	}
This is used in wcd9380 and will be used in wcd9370 when that happens some
day, maybe it'd be worth to commonize it as qcom_{rx/tx}_portmap_get?
[...]

> +static const struct sdw_device_id wcd9390_slave_id[] = {
> +	SDW_SLAVE_ENTRY(0x0217, 0x10e, 0),
0x10e - WCD9380 or 9385 slave? an inline comment at the end of the line
would be cool!

Konrad

