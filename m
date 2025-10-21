Return-Path: <linux-arm-msm+bounces-78225-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A08BF92CB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 01:06:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 026C04E812C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 23:06:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C9B92BE053;
	Tue, 21 Oct 2025 23:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Gy2DxIAM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A6715CD74
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 23:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761087982; cv=none; b=kEPK+BHX/vt6jzWXx/r/U3HgjlaAaBdP6znXabg5jlZAJ9eaBtBUAifOi3ElRvOmzN2sdiUwbdg64lit4S81kbkQxEYcKln7dhcVTYAfiMJDIwXIinxmzQGaLfFKBg+7cFrnY8JJ+gBKqGYbN5Syad+F9h/cXjDDm+9C/dwcqhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761087982; c=relaxed/simple;
	bh=v9qdrPtUu7fyhR7g5W1mWsSB1mC75h6wItXGPacFG6g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ht4UhGQ/7W5ZiMSezNCK2Pjy9GKMGQQ5i/fIHjbx42/NifX2zr41AhTyVXEtWi33/fo4YPlovtR/ZPtCun16xauUWgRCJNpEOm8mL23pp4+wklGMuGw+MRk5+Vh7rFCpLsb5EbttnZPbM1k/sVPgcifjf8p2680uWkAlDKoZnfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Gy2DxIAM; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-63e076e24f2so2092910a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 16:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761087977; x=1761692777; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1skSu2R/EvG/sBAR/zOuIUly/4EtcboZ1vNpxOtlC6Q=;
        b=Gy2DxIAMz7JgiGjcHBezvujflomdr+MS5VzckydOdzppa/rnM/ky34FoE4zmYFDrB+
         evrmIqEusTl+YDb4XcEgp+20K74ESqgGTMzp3lFP2+WP5ReMAEPkI2u7cIvTA6FY7lU9
         fPFDRGod01pQieR5pHH2I6eTd8kQk+yMOPOg6VDNOnIzAGOWemS1qA/15MtXO7vg4nML
         oRevTf/ewLOiMIXs6K1MEGbuO74CP3akTKKOAekmV7kOwv7M+7hBDlyoP1t84bvv8pEY
         pVjfxf+KDGjJ5I7UaS9023P3j7oqClEyoFrQSqXbTSM+QoiLhfnOdaQxuzrvIdh1fTSz
         Te5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761087977; x=1761692777;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1skSu2R/EvG/sBAR/zOuIUly/4EtcboZ1vNpxOtlC6Q=;
        b=RQVum9U9S/wWl8V3/KCU8TMGA5Ok9SoQaXyA39X6KMYuenmdn0ij1XTpZMYWMNGlp6
         3z/2Irc/WoR/uE82xCQUqIvP/IP5bHPPFGtNyqI4uAxKG7dsSvQwOoNWuyjcVaOwnRi+
         cXOc+Bd89msfgnHbnx7xeXezaMRlgShsw2fCr4jhoNKr9JDNSh25CePo1YFaUYvxuz/R
         E48F+dg/DSYA8xHRn5QPB/jnSwo+p351SAyn5LFUCM+ODwy9sCwn0ZmdQQxYHuXTnYaH
         LV2/XX8/Q46t7ahsX2mERvkmaVPqqbU6LqI9wuJcI/OFfY4G8LPzuFvqLaN0vS7udgS2
         ssjA==
X-Gm-Message-State: AOJu0YwmNrq68hGbGDkHFS4y6hHMPK4x6IXP3KX28nChXN+WwQtkF0rM
	e6CQAzk67zo7uh8KgzIFnsoUi3nbSt6Dd2f6ZP3V1ai0SOQ/TVSIGUZuFp+v3W65h7Y=
X-Gm-Gg: ASbGncvbNh0/qwKoTyQtqhZQmKU5rqM9wbNdoi19g39/DgUY42KMoX3zN9Md9eZFn++
	NV18d4PCJsVJwI+cNQppDqnMSynaSnK5I5/5mvJmQtLnAc3CvdVs2c/mnzUr4slhAL8PDa1lef6
	KxCTyWNPRYmbmJg34wnVGrl8eMSbtNWwlQYzMVb11n908dQ3TXpLVrGERlbg5rEPKA7H49FIFhP
	djzISPQgjW3BzTx7ByKtaSwlS5Nkrn1P4JQ3/fyA3OVhYVpppF5nSLtkWU6oDI50H4MGdpi5u37
	w4jSFhTM39LX4lOkxX7TCdvu26xp0bybcI54ePiUHfkKFO06ED/4C8MDiuQm4Y+jIPkeKQX3IXn
	EoANmUDN42u+TAQhvfiZ+MJGiUQ9tHqniHP0GKvXARUoiaQ4PSBpwreSclJVI1swZ7Gc9kh1oVF
	ocJqTh9CcanMI1hl59JCXsuO/jNKusg3pP8htv09CzLR4=
X-Google-Smtp-Source: AGHT+IFtNmFUjXoSgBEFbhWp4FEFDk6kOFYy/fkKwIxw3udp45uEWOU+nEdWHQxP3zzwua5iSJikTA==
X-Received: by 2002:a05:6402:5650:b0:636:6801:eed7 with SMTP id 4fb4d7f45d1cf-63c1f6d05b1mr13395163a12.32.1761087976999;
        Tue, 21 Oct 2025 16:06:16 -0700 (PDT)
Received: from [192.168.0.163] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63c48ab54fbsm10165210a12.15.2025.10.21.16.06.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 16:06:15 -0700 (PDT)
Message-ID: <1e3053ae-3482-4388-a6e4-1edc921bfdcb@linaro.org>
Date: Wed, 22 Oct 2025 00:06:13 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] media: iris: Add support for multiple clock
 sources
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Vishnu Reddy <quic_bvisredd@quicinc.com>
References: <20251017-knp_video-v2-0-f568ce1a4be3@oss.qualcomm.com>
 <-nNKoml-evcewtxxqJqJKKjaeWf8uLZt3Vgbwq_EjIBXLfYOmkWyNTPHpARSXlsa6fjxoudnLDHuneVT6ZvCcA==@protonmail.internalid>
 <20251017-knp_video-v2-2-f568ce1a4be3@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20251017-knp_video-v2-2-f568ce1a4be3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/10/2025 15:16, Vikash Garodia wrote:
> vpu4 depends on more than one clock source. Thus far hardware versions
> up to vpu3x have been clocked by a single source.
> This adds support for multiple clocks by,
> - Adding a lookup table
> - Configuring OPP table for video device with different video clocks
> - Setting OPP for multiple clocks during dev_pm_opp_set_opp()
> 
> This patch extends the support for multiple clocks in driver, which
> would be used in subsequent patch for kaanapali, when the platform data
> is prepared.
> 
> Co-developed-by: Vishnu Reddy <quic_bvisredd@quicinc.com>
> Signed-off-by: Vishnu Reddy <quic_bvisredd@quicinc.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>   .../media/platform/qcom/iris/iris_platform_common.h  |  1 +
>   .../media/platform/qcom/iris/iris_platform_gen2.c    |  9 +++++++++
>   .../media/platform/qcom/iris/iris_platform_sm8250.c  |  6 ++++++
>   drivers/media/platform/qcom/iris/iris_power.c        |  2 +-
>   drivers/media/platform/qcom/iris/iris_probe.c        | 20 ++++++++------------
>   drivers/media/platform/qcom/iris/iris_resources.c    | 16 ++++++++++++++--
>   drivers/media/platform/qcom/iris/iris_resources.h    |  1 +
>   drivers/media/platform/qcom/iris/iris_vpu_common.c   |  4 ++--
>   8 files changed, 42 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 58d05e0a112eed25faea027a34c719c89d6c3897..df03de08c44839c1b6c137874eb7273c638d5f2c 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -206,6 +206,7 @@ struct iris_platform_data {
>   	const char * const *opp_pd_tbl;
>   	unsigned int opp_pd_tbl_size;
>   	const struct platform_clk_data *clk_tbl;
> +	const char * const *opp_clk_tbl;
>   	unsigned int clk_tbl_size;
>   	const char * const *clk_rst_tbl;
>   	unsigned int clk_rst_tbl_size;
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> index 36d69cc73986b74534a2912524c8553970fd862e..fea800811a389a58388175c733ad31c4d9c636b0 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> @@ -633,6 +633,11 @@ static const struct platform_clk_data sm8550_clk_table[] = {
>   	{IRIS_HW_CLK,   "vcodec0_core" },
>   };
> 
> +static const char * const sm8550_opp_clk_table[] = {
> +	"vcodec0_core",
> +	NULL,
> +};
> +
>   static struct ubwc_config_data ubwc_config_sm8550 = {
>   	.max_channels = 8,
>   	.mal_length = 32,
> @@ -756,6 +761,7 @@ struct iris_platform_data sm8550_data = {
>   	.opp_pd_tbl_size = ARRAY_SIZE(sm8550_opp_pd_table),
>   	.clk_tbl = sm8550_clk_table,
>   	.clk_tbl_size = ARRAY_SIZE(sm8550_clk_table),
> +	.opp_clk_tbl = sm8550_opp_clk_table,
>   	/* Upper bound of DMA address range */
>   	.dma_mask = 0xe0000000 - 1,
>   	.fwname = "qcom/vpu/vpu30_p4.mbn",
> @@ -848,6 +854,7 @@ struct iris_platform_data sm8650_data = {
>   	.opp_pd_tbl_size = ARRAY_SIZE(sm8550_opp_pd_table),
>   	.clk_tbl = sm8550_clk_table,
>   	.clk_tbl_size = ARRAY_SIZE(sm8550_clk_table),
> +	.opp_clk_tbl = sm8550_opp_clk_table,
>   	/* Upper bound of DMA address range */
>   	.dma_mask = 0xe0000000 - 1,
>   	.fwname = "qcom/vpu/vpu33_p4.mbn",
> @@ -930,6 +937,7 @@ struct iris_platform_data sm8750_data = {
>   	.opp_pd_tbl_size = ARRAY_SIZE(sm8550_opp_pd_table),
>   	.clk_tbl = sm8750_clk_table,
>   	.clk_tbl_size = ARRAY_SIZE(sm8750_clk_table),
> +	.opp_clk_tbl = sm8550_opp_clk_table,
>   	/* Upper bound of DMA address range */
>   	.dma_mask = 0xe0000000 - 1,
>   	.fwname = "qcom/vpu/vpu35_p4.mbn",
> @@ -1017,6 +1025,7 @@ struct iris_platform_data qcs8300_data = {
>   	.opp_pd_tbl_size = ARRAY_SIZE(sm8550_opp_pd_table),
>   	.clk_tbl = sm8550_clk_table,
>   	.clk_tbl_size = ARRAY_SIZE(sm8550_clk_table),
> +	.opp_clk_tbl = sm8550_opp_clk_table,
>   	/* Upper bound of DMA address range */
>   	.dma_mask = 0xe0000000 - 1,
>   	.fwname = "qcom/vpu/vpu30_p4_s6.mbn",
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
> index 16486284f8acccf6a95a27f6003e885226e28f4d..1b1b6aa751106ee0b0bc71bb0df2e78340190e66 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
> @@ -273,6 +273,11 @@ static const struct platform_clk_data sm8250_clk_table[] = {
>   	{IRIS_HW_CLK,   "vcodec0_core" },
>   };
> 
> +static const char * const sm8250_opp_clk_table[] = {
> +	"vcodec0_core",
> +	NULL,
> +};
> +
>   static struct tz_cp_config tz_cp_config_sm8250 = {
>   	.cp_start = 0,
>   	.cp_size = 0x25800000,
> @@ -333,6 +338,7 @@ struct iris_platform_data sm8250_data = {
>   	.opp_pd_tbl_size = ARRAY_SIZE(sm8250_opp_pd_table),
>   	.clk_tbl = sm8250_clk_table,
>   	.clk_tbl_size = ARRAY_SIZE(sm8250_clk_table),
> +	.opp_clk_tbl = sm8250_opp_clk_table,
>   	/* Upper bound of DMA address range */
>   	.dma_mask = 0xe0000000 - 1,
>   	.fwname = "qcom/vpu-1.0/venus.mbn",
> diff --git a/drivers/media/platform/qcom/iris/iris_power.c b/drivers/media/platform/qcom/iris/iris_power.c
> index dbca42df0910fd3c0fb253dbfabf1afa2c3d32ad..91aa21d4070ebcebbe2ed127a03e5e49b9a2bd5c 100644
> --- a/drivers/media/platform/qcom/iris/iris_power.c
> +++ b/drivers/media/platform/qcom/iris/iris_power.c
> @@ -91,7 +91,7 @@ static int iris_set_clocks(struct iris_inst *inst)
>   	}
> 
>   	core->power.clk_freq = freq;
> -	ret = dev_pm_opp_set_rate(core->dev, freq);
> +	ret = iris_opp_set_rate(core->dev, freq);
>   	mutex_unlock(&core->lock);
> 
>   	return ret;
> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
> index 00e99be16e087c4098f930151fd76cd381d721ce..ad82a62f8b923d818ffe77c131d7eb6da8c34002 100644
> --- a/drivers/media/platform/qcom/iris/iris_probe.c
> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> @@ -40,8 +40,6 @@ static int iris_init_icc(struct iris_core *core)
> 
>   static int iris_init_power_domains(struct iris_core *core)
>   {
> -	const struct platform_clk_data *clk_tbl;
> -	u32 clk_cnt, i;
>   	int ret;
> 
>   	struct dev_pm_domain_attach_data iris_pd_data = {
> @@ -56,6 +54,11 @@ static int iris_init_power_domains(struct iris_core *core)
>   		.pd_flags = PD_FLAG_DEV_LINK_ON | PD_FLAG_REQUIRED_OPP,
>   	};
> 
> +	struct dev_pm_opp_config iris_opp_clk_data = {
> +		.clk_names = core->iris_platform_data->opp_clk_tbl,
> +		.config_clks = dev_pm_opp_config_clks_simple,
> +	};
> +
>   	ret = devm_pm_domain_attach_list(core->dev, &iris_pd_data, &core->pmdomain_tbl);
>   	if (ret < 0)
>   		return ret;
> @@ -64,16 +67,9 @@ static int iris_init_power_domains(struct iris_core *core)
>   	if (ret < 0)
>   		return ret;
> 
> -	clk_tbl = core->iris_platform_data->clk_tbl;
> -	clk_cnt = core->iris_platform_data->clk_tbl_size;
> -
> -	for (i = 0; i < clk_cnt; i++) {
> -		if (clk_tbl[i].clk_type == IRIS_HW_CLK) {
> -			ret = devm_pm_opp_set_clkname(core->dev, clk_tbl[i].clk_name);
> -			if (ret)
> -				return ret;
> -		}
> -	}
> +	ret = devm_pm_opp_set_config(core->dev, &iris_opp_clk_data);
> +	if (ret)
> +		return ret;
> 
>   	return devm_pm_opp_of_add_table(core->dev);
>   }
> diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/media/platform/qcom/iris/iris_resources.c
> index cf32f268b703c1c042a9bcf146e444fff4f4990d..939f6617f2631503fa8cb3e874b9de6b2fbe7b76 100644
> --- a/drivers/media/platform/qcom/iris/iris_resources.c
> +++ b/drivers/media/platform/qcom/iris/iris_resources.c
> @@ -4,6 +4,7 @@
>    */
> 
>   #include <linux/clk.h>
> +#include <linux/devfreq.h>
>   #include <linux/interconnect.h>
>   #include <linux/pm_domain.h>
>   #include <linux/pm_opp.h>
> @@ -58,11 +59,22 @@ int iris_unset_icc_bw(struct iris_core *core)
>   	return icc_bulk_set_bw(core->icc_count, core->icc_tbl);
>   }
> 
> +int iris_opp_set_rate(struct device *dev, unsigned long freq)
> +{
> +	struct dev_pm_opp *opp __free(put_opp);
> +
> +	opp = devfreq_recommended_opp(dev, &freq, 0);
> +	if (IS_ERR(opp))
> +		return PTR_ERR(opp);
> +
> +	return dev_pm_opp_set_opp(dev, opp);
> +}
> +
>   int iris_enable_power_domains(struct iris_core *core, struct device *pd_dev)
>   {
>   	int ret;
> 
> -	ret = dev_pm_opp_set_rate(core->dev, ULONG_MAX);
> +	ret = iris_opp_set_rate(core->dev, ULONG_MAX);
>   	if (ret)
>   		return ret;
> 
> @@ -77,7 +89,7 @@ int iris_disable_power_domains(struct iris_core *core, struct device *pd_dev)
>   {
>   	int ret;
> 
> -	ret = dev_pm_opp_set_rate(core->dev, 0);
> +	ret = iris_opp_set_rate(core->dev, 0);
>   	if (ret)
>   		return ret;
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_resources.h b/drivers/media/platform/qcom/iris/iris_resources.h
> index f723dfe5bd81a9c9db22d53bde4e18743d771210..6bfbd2dc6db095ec05e53c894e048285f82446c6 100644
> --- a/drivers/media/platform/qcom/iris/iris_resources.h
> +++ b/drivers/media/platform/qcom/iris/iris_resources.h
> @@ -8,6 +8,7 @@
> 
>   struct iris_core;
> 
> +int iris_opp_set_rate(struct device *dev, unsigned long freq);
>   int iris_enable_power_domains(struct iris_core *core, struct device *pd_dev);
>   int iris_disable_power_domains(struct iris_core *core, struct device *pd_dev);
>   int iris_unset_icc_bw(struct iris_core *core);
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> index bb98950e018fadf69ac4f41b3037f7fd6ac33c5b..bbd999a41236dca5cf5700e452a6fed69f4fc922 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> @@ -266,7 +266,7 @@ void iris_vpu_power_off_hw(struct iris_core *core)
> 
>   void iris_vpu_power_off(struct iris_core *core)
>   {
> -	dev_pm_opp_set_rate(core->dev, 0);
> +	iris_opp_set_rate(core->dev, 0);
>   	core->iris_platform_data->vpu_ops->power_off_hw(core);
>   	core->iris_platform_data->vpu_ops->power_off_controller(core);
>   	iris_unset_icc_bw(core);
> @@ -352,7 +352,7 @@ int iris_vpu_power_on(struct iris_core *core)
>   	freq = core->power.clk_freq ? core->power.clk_freq :
>   				      (u32)ULONG_MAX;
> 
> -	dev_pm_opp_set_rate(core->dev, freq);
> +	iris_opp_set_rate(core->dev, freq);
> 
>   	core->iris_platform_data->set_preset_registers(core);
> 
> 
> --
> 2.34.1
> 
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

