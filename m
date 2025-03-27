Return-Path: <linux-arm-msm+bounces-52664-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 51962A73602
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 16:51:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 358677A6AC5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 15:50:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73EF219D882;
	Thu, 27 Mar 2025 15:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XMJqGF0X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6CE519B3EE
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 15:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743090699; cv=none; b=ZFPsknKX1wfAmGHuMVRpUB/5+UBLFaSe+0n1bBdIsiZBFktNKrSec4ioy2YYMfE/63VD7+LBzK6t0/7444tNb8eeC68OJrP0lFSeJnMJHNjHQCUFYraHcNuZduxU3aISfFYnAqclroVQM7dl0gZwCWyiDM6iPxCb0ylhPgvKDto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743090699; c=relaxed/simple;
	bh=vAe2BAzY2N92NxfakxIQcqxIPERdP0ngW1a3+ysyFHM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=omeGon9n6siCTRv36lZ1cksokI7AvfxMIfjYkVyN8S/GXQvF29+54r3wfPLwlAHCM0u30d9RcA9O9p1LtJvcvgLlbd3BsE+R95BmrGqeBYZrSl+WTwnzRZsz6H/VTU6CLHM0uaBmC/CCEHzwkVj0kuYCWd7rzqTTVj2Ud1LU32E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XMJqGF0X; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-39bf44be22fso400908f8f.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 08:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743090695; x=1743695495; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kvLQrI2Qd2ZzqbCiSE0lDUusdYHeIhg6Scc6MGNUp1U=;
        b=XMJqGF0X9ra/xTBrzOGtSLuJm+2hemfK5eZr+B8fyPlGyrzEwONnwP4LJ/fJnTFgJY
         8/pGEutXpZtf2PUVlzSPeUj1wBh3p1eFYnoLeUwp+Zg8lfnUdjevztx6G2Lf3Sd8wvRo
         INRq0n1UOeYMfTd3BxA+6C2uQfIyCbhKNGjZ+/XNvjnYe6KQOZrPsBdHpzhD7cmblQjW
         8Eo1GIowjsgluks5XtB2ox+GAqsWMVl8FH3vQkmqmQ8ZdSWaauFPM7GCzLdADR4X9dFa
         J4okn7qkDMjpWb4D19wye058vyC97j5GWZ1mlg4mkhCNvws6APHl2VPDwWx0g72wpT4R
         o2ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743090695; x=1743695495;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kvLQrI2Qd2ZzqbCiSE0lDUusdYHeIhg6Scc6MGNUp1U=;
        b=A1mXwuJ2KdBDd2+/jK97zaw3X+qyZVCmTiH8lhGSUH9HqpGKhNOCGKK67UrtNAOw1W
         fRVAS43NJiK5Y89GvLR0xdNbTzMlFAmunlsTPKT6r8f4401CjwjJ5S04N14SFJnFBqc9
         WWClkD6g4MUETqG6+uhWXafnvaIdkJJbtn0gaJN1TzeoecXfMSIFqHoVWQIIta80Su2I
         f2k+4edo2wiVMsfP0fwVXE4WMtw9GaKrWZ52/tyzn0hGqLN6akGM5Uy55wYEyQ6AbVOk
         YvOvs2jaSnRE36+E7Wg4eHLDd3E+VtMgUimNdMMBwK1q5FXL2VqH7kma2QnJtN8hNXCD
         AT8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVbMrMnGtOik61L7TPyY1OwaJGINGon6YlSi4+oM5L9xlPrCFfX56BP+hpJa7VdCCjfc5J6kjdmKu8NACBX@vger.kernel.org
X-Gm-Message-State: AOJu0YyXMbzeTIvsfoMtvnaN01U3g9xBt/E+3sMhdFf+fv9bUpCAmpF1
	cjmliG3Y6cB+jQaD2Pj5xqHiYroTXHza5BFQq4mrDmxgtLztvGPEFRoXzRU3fpI=
X-Gm-Gg: ASbGncuOAEdXGsw8aQYD9E+37EwAiXsTcLP+dp8m7oiJi4MeXuJrdBCoMxyM6Fy9r4l
	ReUt8R2oNLzJNvbER8EPzbHTRtv41pFaZnYk/fU2zCF0Hss3deEwFvNIdPZL51hJca99dcssuRJ
	AaPWLVFiUTG7bZx+hn0cV9nElz3X3gsCtIFhPeW0YbLJCLjmWFaXgCAUDSC61mHpSu52F2x7esU
	ZSJCdCnL+MgGyvKZ02KcdNUuWMaxHQscX96ZTB7yjf9VxZWv6oVTRIQnoRaoGsqhBeak0Ulr0Hz
	dX0j4LBZAcJimRmWT1YRzZHOkx1+TW0FguG7OCOGG4faUXOh4FFw2z1ZUfySnAQXpf7B0JOfwoe
	Y4t1Z5f4QTw==
X-Google-Smtp-Source: AGHT+IGEOPuBwOnlQZwn7egIILmy4OvFd8oBZAN1W6IrnJklr7xjZZaKwIAxHQnmoX4bC4rGyQDzNQ==
X-Received: by 2002:a05:6000:2a7:b0:391:bed:ec9e with SMTP id ffacd0b85a97d-39ad1718621mr3637240f8f.0.1743090695191;
        Thu, 27 Mar 2025 08:51:35 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39ad0c6bae8sm4191678f8f.68.2025.03.27.08.51.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Mar 2025 08:51:34 -0700 (PDT)
Message-ID: <ddcaa5e5-b5c5-4d78-b44a-4cea75ec6a77@linaro.org>
Date: Thu, 27 Mar 2025 15:51:33 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/18] clk: qcom: clk-alpha-pll: Add support for common
 PLL configuration function
To: Jagadeesh Kona <quic_jkona@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
 Imran Shaik <quic_imrashai@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>,
 Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250327-videocc-pll-multi-pd-voting-v3-0-895fafd62627@quicinc.com>
 <20250327-videocc-pll-multi-pd-voting-v3-4-895fafd62627@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250327-videocc-pll-multi-pd-voting-v3-4-895fafd62627@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/03/2025 09:52, Jagadeesh Kona wrote:
> From: Taniya Das <quic_tdas@quicinc.com>
> 
> To properly configure the PLLs on recent chipsets, it often requires more
> than one power domain to be kept ON. The support to enable multiple power
> domains is being added in qcom_cc_really_probe() and PLLs should be
> configured post all the required power domains are enabled.
> 
> Hence integrate PLL configuration into clk_alpha_pll structure and add
> support for qcom_clk_alpha_pll_configure() function which can be called
> from qcom_cc_really_probe() to configure the clock controller PLLs after
> all required power domains are enabled.
> 
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> ---
>   drivers/clk/qcom/clk-alpha-pll.c | 63 ++++++++++++++++++++++++++++++++++++++++
>   drivers/clk/qcom/clk-alpha-pll.h |  3 ++
>   2 files changed, 66 insertions(+)
> 
> diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
> index cec0afea8e446010f0d4140d4ef63121706dde47..8ee842254e6690e24469053cdbd99a9953987e40 100644
> --- a/drivers/clk/qcom/clk-alpha-pll.c
> +++ b/drivers/clk/qcom/clk-alpha-pll.c
> @@ -63,6 +63,8 @@
>   #define PLL_OPMODE(p)		((p)->offset + (p)->regs[PLL_OFF_OPMODE])
>   #define PLL_FRAC(p)		((p)->offset + (p)->regs[PLL_OFF_FRAC])
>   
> +#define GET_PLL_TYPE(pll)	(((pll)->regs - clk_alpha_pll_regs[0]) / PLL_OFF_MAX_REGS)
> +
>   const u8 clk_alpha_pll_regs[][PLL_OFF_MAX_REGS] = {
>   	[CLK_ALPHA_PLL_TYPE_DEFAULT] =  {
>   		[PLL_OFF_L_VAL] = 0x04,
> @@ -2960,3 +2962,64 @@ const struct clk_ops clk_alpha_pll_regera_ops = {
>   	.set_rate = clk_zonda_pll_set_rate,
>   };
>   EXPORT_SYMBOL_GPL(clk_alpha_pll_regera_ops);
> +
> +void qcom_clk_alpha_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap)
> +{
> +	const struct clk_init_data *init = pll->clkr.hw.init;
> +	const char *name = init->name;
> +
> +	if (!pll->config || !pll->regs) {
> +		pr_err("%s: missing pll config or regs\n", name);
> +		return;
> +	}

Seems like a strange check - you are calling this function in a loop 
which looks like

for (i = 0; i < desc->num_alpha_plls; i++)
	qcom_clk_alpha_pll_configure(desc->alpha_plls[i], regmap);

Can num_alpha_plls be true but alpha_plls be NULL and why is regmap 
considered valid ?

I think you can drop this check.

> +
> +	switch (GET_PLL_TYPE(pll)) {
> +	case CLK_ALPHA_PLL_TYPE_LUCID_OLE:
> +		clk_lucid_ole_pll_configure(pll, regmap, pll->config);
> +		break;
> +	case CLK_ALPHA_PLL_TYPE_LUCID_EVO:
> +		clk_lucid_evo_pll_configure(pll, regmap, pll->config);
> +		break;
> +	case CLK_ALPHA_PLL_TYPE_TAYCAN_ELU:
> +		clk_taycan_elu_pll_configure(pll, regmap, pll->config);
> +		break;
> +	case CLK_ALPHA_PLL_TYPE_RIVIAN_EVO:
> +		clk_rivian_evo_pll_configure(pll, regmap, pll->config);
> +		break;
> +	case CLK_ALPHA_PLL_TYPE_TRION:
> +		clk_trion_pll_configure(pll, regmap, pll->config);
> +		break;
> +	case CLK_ALPHA_PLL_TYPE_HUAYRA_2290:
> +		clk_huayra_2290_pll_configure(pll, regmap, pll->config);
> +		break;
> +	case CLK_ALPHA_PLL_TYPE_FABIA:
> +		clk_fabia_pll_configure(pll, regmap, pll->config);
> +		break;
> +	case CLK_ALPHA_PLL_TYPE_AGERA:
> +		clk_agera_pll_configure(pll, regmap, pll->config);
> +		break;
> +	case CLK_ALPHA_PLL_TYPE_PONGO_ELU:
> +		clk_pongo_elu_pll_configure(pll, regmap, pll->config);
> +		break;
> +	case CLK_ALPHA_PLL_TYPE_ZONDA:
> +	case CLK_ALPHA_PLL_TYPE_ZONDA_OLE:
> +		clk_zonda_pll_configure(pll, regmap, pll->config);
> +		break;
> +	case CLK_ALPHA_PLL_TYPE_STROMER:
> +	case CLK_ALPHA_PLL_TYPE_STROMER_PLUS:
> +		clk_stromer_pll_configure(pll, regmap, pll->config);
> +		break;
> +	case CLK_ALPHA_PLL_TYPE_DEFAULT:
> +	case CLK_ALPHA_PLL_TYPE_DEFAULT_EVO:
> +	case CLK_ALPHA_PLL_TYPE_HUAYRA:
> +	case CLK_ALPHA_PLL_TYPE_HUAYRA_APSS:
> +	case CLK_ALPHA_PLL_TYPE_BRAMMO:
> +	case CLK_ALPHA_PLL_TYPE_BRAMMO_EVO:
> +		clk_alpha_pll_configure(pll, regmap, pll->config);
> +		break;
> +	default:
> +		WARN(1, "%s: invalid pll type\n", name);
> +		break;
> +	}
> +}
> +EXPORT_SYMBOL_GPL(qcom_clk_alpha_pll_configure);
> diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
> index 79aca8525262211ae5295245427d4540abf1e09a..7f35aaa7a35d88411beb11fd2be5d5dd5bfbe066 100644
> --- a/drivers/clk/qcom/clk-alpha-pll.h
> +++ b/drivers/clk/qcom/clk-alpha-pll.h
> @@ -81,6 +81,7 @@ struct pll_vco {
>    * struct clk_alpha_pll - phase locked loop (PLL)
>    * @offset: base address of registers
>    * @regs: alpha pll register map (see @clk_alpha_pll_regs)
> + * @config: array of pll settings
>    * @vco_table: array of VCO settings
>    * @num_vco: number of VCO settings in @vco_table
>    * @flags: bitmask to indicate features supported by the hardware
> @@ -90,6 +91,7 @@ struct clk_alpha_pll {
>   	u32 offset;
>   	const u8 *regs;
>   
> +	const struct alpha_pll_config *config;
>   	const struct pll_vco *vco_table;
>   	size_t num_vco;
>   #define SUPPORTS_OFFLINE_REQ		BIT(0)
> @@ -237,5 +239,6 @@ void clk_stromer_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
>   			       const struct alpha_pll_config *config);
>   void clk_regera_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
>   			     const struct alpha_pll_config *config);
> +void qcom_clk_alpha_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap);
>   
>   #endif
> 

