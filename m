Return-Path: <linux-arm-msm+bounces-61496-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F24AADB91F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 20:53:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3D69B17386E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 18:53:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C57C6286884;
	Mon, 16 Jun 2025 18:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QtyKoM+4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 381941A2632
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 18:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750100003; cv=none; b=V0iDVGA9lfr6hUapVnsG1/VcP64h/4tb2SHOMjB4414I2VUfxA28mLZJGSAhNU3ZgBD8Wnmo72itPMXj42XInYaS2NsdojZWKbrK7gnJb6twyZ7t7s/Fki1ph6Te6u/Z0HQ97+hAvaV00EdKvMqPtb0TRv6gQWU+e+//tcqSfa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750100003; c=relaxed/simple;
	bh=wPUzTydNxr8Bne1mftnFfwNbN2QFUqUlnk1+McjJqZY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kZuMrgbN3odsS/UmHFbatK4Aq1IWiuzLNYZovB5P3pOX17Ua3O967v03heTdtdVI3isxd/elp5yn4n9XLvZ3g1uVHvYU/nSpKmfAht4Mo/vJORZ6JdwagMR7fuuKtPjeU9+SNw1yk832F8OL4/s/BK7qOIjLXU6UD1kIMxwXa9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QtyKoM+4; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so54505115e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 11:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750100000; x=1750704800; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PSAHs0D4DZvGhRjRk5eyEpbY9QCRDT/qtuz8dJZf7TA=;
        b=QtyKoM+4RSR73zqxL6whQ3NIHi1t6v0ytaruQzzcMK+WhZautDAR+FEZ+ABEacl1mS
         TVHBjyxKSNvgkISpWyvWL8leKOwEbgnhGz24p+f3GayJr0yxQXVwG6aJb+tzk24ZOxbe
         j0eNcK+o1EJ/b26p6tHlGRxUDvDQ54he0Dxn8D+GovyHLb6qSRS6HdBLL5TeRRhqndAt
         /o5Ieh8NofcR9rfNdxHzIibwrTi0N26nMzEx3byo+rsMMf90dsqAQDYdipnf6b6QfyHV
         dbNZGB66WpwtUWc0uRNzSIp6gQ9TDxDHaZ33hFZXSoD8zMPmVC3ukNkD5FILRquA0sKp
         /RQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750100000; x=1750704800;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PSAHs0D4DZvGhRjRk5eyEpbY9QCRDT/qtuz8dJZf7TA=;
        b=hXFx7TjMQ527jR1nd8eSmOaTzDwbKkQ3Nrf+U8lDqF/N7rvI6OvFCerRPPSyXrBqbN
         jkHn9xTUduHs3FEjEGJW3L6ZUlc2RLHC44HlP2bj29ZUncFCClm9gqU68OP35gmJv2W0
         fULqQPCbuIyFFHsKE/uDop4ybU+inaswDG0xB4g7D8retv8XZw2AbJpjPLujWTr15kdg
         yNhJrZeUj+uqBU6JVdHOYg5qvOGpZ1NMQidaxGG0p0NX4MT7fN9Nqc1hmAlq0t10N9nE
         MeMe//L8P5L7LQ1xfbzUfj5Qt/B5Ez/qLVL51CDTEGdh9TJ/fWwjahbRDAz1gdEbzq9W
         D8uA==
X-Forwarded-Encrypted: i=1; AJvYcCVXOBHf+hwGEsNVAjTMCgMfZH6Hv9fg3wvbv/LDA5tskK2PpEQ7Jk85eEJo79cNPtYKmv/QY638m9vqmOxI@vger.kernel.org
X-Gm-Message-State: AOJu0Yxj8jXl9hvMF0uwVyixNt3H82kx8eYPCN7bBB1JPD6xbeoLkmxQ
	Yy2tDqFUCT+ejPxJC4WIN9fnwHIAgKEwteU2e14AcDd3iA+jyjoJiU4tAIOIz0ZRmE8wMUFWzl9
	dFSZFcs0=
X-Gm-Gg: ASbGnctH7K/24uw5yZZfWe42f28aCzs1xEfjdmZGYdcOA68XQxjW5qIOw6uIMTvxLGJ
	z8wRjr4FQN3ks6PaGmApSMMPb4WYcuEMKOg6rU2wvw6b44ilJGjxJV/bPUbQEsCi0B9JFAzCAF5
	bN7j5oDFXLlDAlfBjhZHnybb1wPVlPoeG8lSIeHn9nVNKB5REdtsqELvNhtwwD8Xjlp1HzZS4Ip
	AmQxz8TkM5deRkm9uHYDvJMBOiJo8KfjBuawLrtFCyYG/VqgBymfWh/FWDeUiHHOmx0CNvEgoIj
	ZiETglhDwyXp8p3Ivl6YAHBl+Bm02fsiwMTHrmCEUj8NmJJk2B8ZtPC/Ff7kWTaRIHfUMJjU9Au
	xB+ptMqPGQ+y/tWsdGtjrbyfDbBE=
X-Google-Smtp-Source: AGHT+IFn0SbC3L/Gh4Y2s0CsidlVrBqISko0TH0zpbHX6Ka08lsavjOIKbCtPTUiRNsMm0TcYXt/4A==
X-Received: by 2002:a05:600c:674a:b0:453:dda:a52e with SMTP id 5b1f17b1804b1-4533cad28b6mr89612035e9.33.1750099999511;
        Mon, 16 Jun 2025 11:53:19 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e254396sm156200275e9.28.2025.06.16.11.53.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 11:53:19 -0700 (PDT)
Message-ID: <2eea0b19-1a82-428a-8c04-74ee465e7516@linaro.org>
Date: Mon, 16 Jun 2025 19:53:17 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/8] soc: qcom: geni-se: Enable QUPs on SA8255p
 Qualcomm platforms
To: Praveen Talari <quic_ptalari@quicinc.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 devicetree@vger.kernel.org
Cc: psodagud@quicinc.com, djaggi@quicinc.com, quic_msavaliy@quicinc.com,
 quic_vtanuku@quicinc.com, quic_arandive@quicinc.com,
 quic_mnaresh@quicinc.com, quic_shazhuss@quicinc.com
References: <20250606172114.6618-1-quic_ptalari@quicinc.com>
 <SlCtr38wFck_Zdxg3nfChaMwe2uSvlQdfRCutdXc-Z2BTqoUOPd9Z9QY0cdREgcdxl40k41wXpszBkVTBB2T7A==@protonmail.internalid>
 <20250606172114.6618-4-quic_ptalari@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250606172114.6618-4-quic_ptalari@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/06/2025 18:21, Praveen Talari wrote:
> On the sa8255p platform, resources such as clocks,interconnects
> and TLMM (GPIO) configurations are managed by firmware.
> 
> Introduce a platform data function callback to distinguish whether
> resource control is performed by firmware or directly by the driver
> in linux.
> 
> The refactor ensures clear differentiation of resource
> management mechanisms, improving maintainability and flexibility
> in handling platform-specific configurations.
> 
> Signed-off-by: Praveen Talari <quic_ptalari@quicinc.com>
> ---
> v5 -> v6
> - replaced dev_err with dev_err_probe

You've missed two opportunities for dev_err_probe() in this submission.

> - added a check for desc->num_clks with MAX_CLKS, an error if
>    the specified num_clks in descriptor exceeds defined MAX_CLKS.
> - removed min_t which is not necessary.
> - renamed callback function names to resources_init.
> - resolved kernel bot warning error by documenting function
>    pointer in geni_se_desc structure.
> 
> v3 -> v4
> - declared an empty struct for sa8255p and added check as num clks.
> - Added version log after ---
> 
> v1 -> v2
> - changed datatype of i from int to unsigned int as per comment.
> ---
>   drivers/soc/qcom/qcom-geni-se.c | 77 +++++++++++++++++++++------------
>   1 file changed, 49 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
> index 4cb959106efa..5c727b9a17e9 100644
> --- a/drivers/soc/qcom/qcom-geni-se.c
> +++ b/drivers/soc/qcom/qcom-geni-se.c
> @@ -101,10 +101,13 @@ struct geni_wrapper {
>    * struct geni_se_desc - Data structure to represent the QUP Wrapper resources
>    * @clks:		Name of the primary & optional secondary AHB clocks
>    * @num_clks:		Count of clock names
> + * @resources_init:	Function pointer for initializing QUP Wrapper resources
>    */
>   struct geni_se_desc {
>   	unsigned int num_clks;
>   	const char * const *clks;
> +	int (*resources_init)(struct geni_wrapper *wrapper,
> +			      const struct geni_se_desc *desc);
>   };
> 
>   static const char * const icc_path_names[] = {"qup-core", "qup-config",
> @@ -891,10 +894,47 @@ int geni_icc_disable(struct geni_se *se)
>   }
>   EXPORT_SYMBOL_GPL(geni_icc_disable);
> 
> +static int geni_se_resource_init(struct geni_wrapper *wrapper,
> +				 const struct geni_se_desc *desc)
> +{
> +	struct device *dev = wrapper->dev;
> +	int ret;
> +	unsigned int i;
> +
> +	if (desc->num_clks > MAX_CLKS)
> +		return dev_err_probe(dev, -EINVAL,
> +				     "Too many clocks specified in descriptor:%u (max allowed: %u)\n",
> +				     desc->num_clks, MAX_CLKS);

I think this is an extraneous add, we should trust the array indexes 
inside our own driver that we control.

Actually why do we have a MAX_CLKS ? We specify a list of clk names with 
aggregate-initialisation and ARRAY_SIZE() of the aggregate.

Like so:

static const char * const qup_clks[] = {
         "m-ahb",
         "s-ahb",
};

static const struct geni_se_desc qup_desc = {
         .clks = qup_clks,
         .num_clks = ARRAY_SIZE(qup_clks),

> +
> +	wrapper->num_clks = desc->num_clks;
> +
> +	for (i = 0; i < wrapper->num_clks; ++i)
> +		wrapper->clks[i].id = desc->clks[i];
> +
> +	ret = of_count_phandle_with_args(dev->of_node, "clocks", "#clock-cells");
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "invalid clocks property at %pOF\n", dev->of_node);
> +
> +	if (ret < wrapper->num_clks) {
> +		dev_err(dev, "invalid clocks count at %pOF, expected %d entries\n",
> +			dev->of_node, wrapper->num_clks);
> +		return -EINVAL;
> +	}

This code OTOH makes way more sense as we are validating our internal 
num_clks variable which we have enumerated ourselves against a DT input 
which we are consuming.

> +
> +	ret = devm_clk_bulk_get(dev, wrapper->num_clks, wrapper->clks);
> +	if (ret) {
> +		dev_err(dev, "Err getting clks %d\n", ret);
> +		return ret;
> +	}
> +
> +	return ret;
> +}
> +
>   static int geni_se_probe(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
>   	struct geni_wrapper *wrapper;
> +	const struct geni_se_desc *desc;
>   	int ret;
> 
>   	wrapper = devm_kzalloc(dev, sizeof(*wrapper), GFP_KERNEL);
> @@ -906,36 +946,12 @@ static int geni_se_probe(struct platform_device *pdev)
>   	if (IS_ERR(wrapper->base))
>   		return PTR_ERR(wrapper->base);
> 
> -	if (!has_acpi_companion(&pdev->dev)) {
> -		const struct geni_se_desc *desc;
> -		int i;
> -
> -		desc = device_get_match_data(&pdev->dev);
> -		if (!desc)
> -			return -EINVAL;
> -
> -		wrapper->num_clks = min_t(unsigned int, desc->num_clks, MAX_CLKS);
> -
> -		for (i = 0; i < wrapper->num_clks; ++i)
> -			wrapper->clks[i].id = desc->clks[i];
> -
> -		ret = of_count_phandle_with_args(dev->of_node, "clocks", "#clock-cells");
> -		if (ret < 0) {
> -			dev_err(dev, "invalid clocks property at %pOF\n", dev->of_node);
> -			return ret;
> -		}
> +	desc = device_get_match_data(&pdev->dev);
> 
> -		if (ret < wrapper->num_clks) {
> -			dev_err(dev, "invalid clocks count at %pOF, expected %d entries\n",
> -				dev->of_node, wrapper->num_clks);
> +	if (!has_acpi_companion(&pdev->dev) && desc->num_clks) {
> +		ret = desc->resources_init(wrapper, desc);
> +		if (ret)
>   			return -EINVAL;
> -		}
> -
> -		ret = devm_clk_bulk_get(dev, wrapper->num_clks, wrapper->clks);
> -		if (ret) {
> -			dev_err(dev, "Err getting clks %d\n", ret);
> -			return ret;
> -		}
>   	}
> 
>   	dev_set_drvdata(dev, wrapper);
> @@ -951,8 +967,11 @@ static const char * const qup_clks[] = {
>   static const struct geni_se_desc qup_desc = {
>   	.clks = qup_clks,
>   	.num_clks = ARRAY_SIZE(qup_clks),
> +	.resources_init = geni_se_resource_init,
>   };
> 
> +static const struct geni_se_desc sa8255p_qup_desc;
> +
>   static const char * const i2c_master_hub_clks[] = {
>   	"s-ahb",
>   };
> @@ -960,11 +979,13 @@ static const char * const i2c_master_hub_clks[] = {
>   static const struct geni_se_desc i2c_master_hub_desc = {
>   	.clks = i2c_master_hub_clks,
>   	.num_clks = ARRAY_SIZE(i2c_master_hub_clks),
> +	.resources_init = geni_se_resource_init,
>   };
> 
>   static const struct of_device_id geni_se_dt_match[] = {
>   	{ .compatible = "qcom,geni-se-qup", .data = &qup_desc },
>   	{ .compatible = "qcom,geni-se-i2c-master-hub", .data = &i2c_master_hub_desc },
> +	{ .compatible = "qcom,sa8255p-geni-se-qup", .data = &sa8255p_qup_desc },
>   	{}
>   };
>   MODULE_DEVICE_TABLE(of, geni_se_dt_match);
> --
> 2.17.1
> 
> 

---
bod

