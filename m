Return-Path: <linux-arm-msm+bounces-44144-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D452CA040F4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 14:37:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 51102188712F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 13:37:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3DB51F03F5;
	Tue,  7 Jan 2025 13:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MIDjtGac"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C18B1EC014
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jan 2025 13:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736257021; cv=none; b=nDxV3gZ4agHhvM/1j3nSx3qJV0XA8CUJFYkt51JDST3s9k9sZY/xOSN55+smHwr2/E0Ls/Jeg8vXwuFhDOatrP2PCUVGje0cbpT+r8GHhbOzw8eoTPQkTgV3wrLohMemGfoH8FX52/cnVe0x3CIzM7Vo+jjO01hMI8J/L3MBXQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736257021; c=relaxed/simple;
	bh=M2ZuITtOefSaIQe7LmHH7doRVMS+ZCd81GRHwhohS3U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OdrV/QkUHKdMLVdWtgAEd0v/QKL43/8FVkGQrKUJjr1c8/Bw8huhny6IPsCqgevYDbXx5/8IBpq6BHbR9GlRyhSlwJza3H9mKNsHC7993bxuGuviFkVCKWwgCddoDesnRN+IpYegQzrR7L32yyjWM1pgf91V94NyJ+pqdothez8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MIDjtGac; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3862a999594so656991f8f.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jan 2025 05:36:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736257014; x=1736861814; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/ujt4qcG1/ccw7H7c9GX0E0Fkq2IdlGMXs7Lyd9HFgI=;
        b=MIDjtGac39bkKpp5/25tT7FSYr/O9dGCicGjxppe8cySLyJEZ6Pn+30Qdunal6DrId
         i1nFH8J3L3jkdZ502jrOOE3YBA9fKWdJzF3N+K1CoY7osejVhxjFDHezlx6o/fl/+z5f
         qmC06WI5AremWiVW+zJu+0f0fX/luLXHm+LfZ3zcsqnA8HpUUSfl6C7yZbIuuid/uFeM
         qlMYYuHlgl09edWZw82zErejMNQ+cIVNpM9qht+tGgSGy4zJpEcMzuHdEK0C9TSHqVwx
         80MuCGrUCYDF21Y7EFcXl9TW3WSYPH/0esb4eKKrEQHZR0AFVjZwOsyqVjcPxxRP2Mo8
         ivRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736257014; x=1736861814;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/ujt4qcG1/ccw7H7c9GX0E0Fkq2IdlGMXs7Lyd9HFgI=;
        b=paTSIEBeK21jXFK2Yg8TqbduN70JZAB06Js9NYoJ5/dS7kvQsEAfHtuPT4RPShZU8O
         vqup28uKWWuKWtAD5Xw3j9vgvf5OuntcbokhgS8oxKjlbW37k3Rl1Hxx7qumKuGzkjB6
         DL5oehe/bvu2mchTvda+ruIiwdZRKQhzJtxKixbHJ/oQG05xaVqr+hnHMLgod8m72Dxv
         w0A2m91TMiq/hXpPOI2cTkI9cAyd6ZOv1sow+zyZqaVvQIzRtIsT3EWBvXVuIUX7BDkT
         cjHBj9tsaYIANCwBkQ3HM3Zco4V6TqhQW4cYjAFznC4k0+EVG7v6YpxwzKtxbj/lg1KE
         q2vg==
X-Forwarded-Encrypted: i=1; AJvYcCUKTTwp3ctmDF8/eR/OVE/k+huZU90HdVQROFrFsH3fGCl2IntsQU3XYHpKlBNcBh+7hJ7IOQfh1gm3wVoC@vger.kernel.org
X-Gm-Message-State: AOJu0Yyu39aN43C8ThZqO7ea3auZczSlHc/B1MncGOomtYQ/nZxXvSaV
	frf64y/GaM7ndHsDtU22hgx+ZC8YFhXZXng0dMw7uhAxIBsAYtcJ7yqAFYSESM4=
X-Gm-Gg: ASbGnct6TzNIolUAksm3io5ib2pmz8gVGfJ3ody8sX26yqwp8uXDeh0kmDcVOepChw4
	SdFKjSnCsr2BKHdFsAIeTTjm4UwW103zyFUHAazL4PpnDgfNY6Sdkrrn0rYjjZuDUxFAfGuwfuu
	agzMD3gJsIGq7QERdiy5sVyl8cAPSpvkFwmKyFic0aViND+5t2cBXxZZABGiHbq5UKulnzVWd16
	8fniDk0nQkipuhgqnjB+LCwQY0h1umBdxA4EiZVYOTWAuy5f/CR+4V/qxmsTsgrULLlByBEuarq
X-Google-Smtp-Source: AGHT+IEwMxtX+Db1GkxFWIg0cQIT0IRXdi314I+VgEf9pBuedELep2vA5Hnr6iPKs2YhXCPkA6tY5Q==
X-Received: by 2002:a05:6000:1f8c:b0:385:e10a:4d9f with SMTP id ffacd0b85a97d-38a2213e1f5mr20453347f8f.0.1736257014363;
        Tue, 07 Jan 2025 05:36:54 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b11495sm629658325e9.19.2025.01.07.05.36.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jan 2025 05:36:53 -0800 (PST)
Message-ID: <940a744c-ca5d-4edd-8a90-be2f8c7da7c0@linaro.org>
Date: Tue, 7 Jan 2025 14:36:52 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] clk: qcom: clk-alpha-pll: Add Pongo PLL
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250106-sm8750-dispcc-v2-0-6f42beda6317@linaro.org>
 <20250106-sm8750-dispcc-v2-2-6f42beda6317@linaro.org>
 <nasilduqcbrdtfnx7ef5rzp4blyvbwhyypjpkzlmv4o6oohj4e@gz2a6kffkf7p>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <nasilduqcbrdtfnx7ef5rzp4blyvbwhyypjpkzlmv4o6oohj4e@gz2a6kffkf7p>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/01/2025 13:36, Dmitry Baryshkov wrote:
> On Mon, Jan 06, 2025 at 02:44:30PM +0100, Krzysztof Kozlowski wrote:
>> Add support for Pongo type of PLL clocks, used in Qualcomm SM8750 SoC.
>> Notable difference comparing to other PLLs is the need for calibration
>> for internally generated clock followed by wait_for_pll().  This is done
>> in configure call and at this time clocks are not yet registered, thus
>> wait_for_pll() cannot use clk_hw_get_name.
> 
> Is this still correct?

No, it is not, I forgot to drop it after reworking code.

Patches were merged, though.


> 
>> Locking during this
>> calibration requires much more time, thus increase the timeout in
>> wait_for_pll().
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>> ---
>>
>> v2:
>>  - EXPORT_SYMBOL_GPL
>>  - Move the PLL calibration and wait_for_pll_enable_lock() call to
>>    prepare callback.
>> ---
>>  drivers/clk/qcom/clk-alpha-pll.c | 165 ++++++++++++++++++++++++++++++++++++++-
>>  drivers/clk/qcom/clk-alpha-pll.h |   6 ++
>>  2 files changed, 170 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
>> index 00d3659ea2124e26dd50c1b4e88ba71c1411442e..df609f7e394de2dc73e60df01b1ad71714c0719d 100644
>> --- a/drivers/clk/qcom/clk-alpha-pll.c
>> +++ b/drivers/clk/qcom/clk-alpha-pll.c
>> @@ -58,6 +58,7 @@
>>  #define PLL_TEST_CTL_U(p)	((p)->offset + (p)->regs[PLL_OFF_TEST_CTL_U])
>>  #define PLL_TEST_CTL_U1(p)     ((p)->offset + (p)->regs[PLL_OFF_TEST_CTL_U1])
>>  #define PLL_TEST_CTL_U2(p)     ((p)->offset + (p)->regs[PLL_OFF_TEST_CTL_U2])
>> +#define PLL_TEST_CTL_U3(p)     ((p)->offset + (p)->regs[PLL_OFF_TEST_CTL_U3])
>>  #define PLL_STATUS(p)		((p)->offset + (p)->regs[PLL_OFF_STATUS])
>>  #define PLL_OPMODE(p)		((p)->offset + (p)->regs[PLL_OFF_OPMODE])
>>  #define PLL_FRAC(p)		((p)->offset + (p)->regs[PLL_OFF_FRAC])
>> @@ -197,6 +198,23 @@ const u8 clk_alpha_pll_regs[][PLL_OFF_MAX_REGS] = {
>>  		[PLL_OFF_TEST_CTL_U1] = 0x34,
>>  		[PLL_OFF_TEST_CTL_U2] = 0x38,
>>  	},
>> +	[CLK_ALPHA_PLL_TYPE_PONGO_ELU] = {
>> +		[PLL_OFF_OPMODE] = 0x04,
>> +		[PLL_OFF_STATE] = 0x08,
>> +		[PLL_OFF_STATUS] = 0x0c,
>> +		[PLL_OFF_L_VAL] = 0x10,
>> +		[PLL_OFF_USER_CTL] = 0x14,
>> +		[PLL_OFF_USER_CTL_U] = 0x18,
>> +		[PLL_OFF_CONFIG_CTL] = 0x1c,
>> +		[PLL_OFF_CONFIG_CTL_U] = 0x20,
>> +		[PLL_OFF_CONFIG_CTL_U1] = 0x24,
>> +		[PLL_OFF_CONFIG_CTL_U2] = 0x28,
>> +		[PLL_OFF_TEST_CTL] = 0x2c,
>> +		[PLL_OFF_TEST_CTL_U] = 0x30,
>> +		[PLL_OFF_TEST_CTL_U1] = 0x34,
>> +		[PLL_OFF_TEST_CTL_U2] = 0x38,
>> +		[PLL_OFF_TEST_CTL_U3] = 0x3c,
>> +	},
>>  	[CLK_ALPHA_PLL_TYPE_TAYCAN_ELU] = {
>>  		[PLL_OFF_OPMODE] = 0x04,
>>  		[PLL_OFF_STATE] = 0x08,
>> @@ -337,6 +355,12 @@ EXPORT_SYMBOL_GPL(clk_alpha_pll_regs);
>>  #define LUCID_EVO_PLL_CAL_L_VAL_SHIFT	16
>>  #define LUCID_OLE_PLL_RINGOSC_CAL_L_VAL_SHIFT	24
>>  
>> +/* PONGO ELU PLL specific setting and offsets */
>> +#define PONGO_PLL_OUT_MASK		GENMASK(1, 0)
>> +#define PONGO_PLL_L_VAL_MASK		GENMASK(11, 0)
> 
> Does it really support such a high L value, or are there any additional
> flags / data entries? PLL2 uses 0x493, which should end up with 22 GHz
> clock, if my calculations are correct.

That's the bitfield also in datasheet (except downstream driver). Not
exactly answer to "does it really support", but not sure what else we
can do here.

> 
>> +#define PONGO_XO_PRESENT		BIT(10)
>> +#define PONGO_CLOCK_SELECT		BIT(12)
>> +
>>  /* ZONDA PLL specific */
>>  #define ZONDA_PLL_OUT_MASK	0xf
>>  #define ZONDA_STAY_IN_CFA	BIT(16)
>> @@ -366,7 +390,8 @@ static int wait_for_pll(struct clk_alpha_pll *pll, u32 mask, bool inverse,
>>  	if (ret)
>>  		return ret;
>>  
>> -	for (count = 200; count > 0; count--) {
>> +	/* Pongo PLLs using a 32KHz reference can take upwards of 1500us to lock. */
>> +	for (count = 1500; count > 0; count--) {
>>  		ret = regmap_read(pll->clkr.regmap, PLL_MODE(pll), &val);
>>  		if (ret)
>>  			return ret;
>> @@ -2527,6 +2552,144 @@ const struct clk_ops clk_alpha_pll_reset_lucid_evo_ops = {
>>  };
>>  EXPORT_SYMBOL_GPL(clk_alpha_pll_reset_lucid_evo_ops);
>>  
>> +static int alpha_pll_pongo_elu_prepare(struct clk_hw *hw)
>> +{
>> +	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
>> +	struct regmap *regmap = pll->clkr.regmap;
>> +	int ret;
>> +
>> +	/* Enable PLL intially to one-time calibrate against XO. */
>> +	regmap_write(regmap, PLL_OPMODE(pll), PLL_RUN);
>> +	regmap_update_bits(regmap, PLL_MODE(pll), PLL_RESET_N, PLL_RESET_N);
>> +	regmap_update_bits(regmap, PLL_MODE(pll), PONGO_XO_PRESENT, PONGO_XO_PRESENT);
>> +
>> +	/* Set regmap for wait_for_pll() */
>> +	pll->clkr.regmap = regmap;
>> +	ret = wait_for_pll_enable_lock(pll);
>> +	if (ret) {
>> +		/* Reverse calibration - disable PLL output */
>> +		regmap_update_bits(regmap, PLL_MODE(pll), PLL_OUTCTRL, 0);
>> +		return ret;
>> +	}
>> +
>> +	/* Disable PLL after one-time calibration. */
>> +	regmap_write(regmap, PLL_OPMODE(pll), PLL_STANDBY);
>> +
>> +	/* Select internally generated clock. */
>> +	regmap_update_bits(regmap, PLL_MODE(pll), PONGO_CLOCK_SELECT,
>> +			   PONGO_CLOCK_SELECT);
>> +
>> +	return 0;
>> +}
>> +
>> +static int alpha_pll_pongo_elu_enable(struct clk_hw *hw)
>> +{
>> +	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
>> +	struct regmap *regmap = pll->clkr.regmap;
>> +	int ret;
>> +
>> +	/* Check if PLL is already enabled */
>> +	if (trion_pll_is_enabled(pll, regmap))
>> +		return 0;
>> +
>> +	ret = regmap_update_bits(regmap, PLL_MODE(pll), PLL_RESET_N, PLL_RESET_N);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/* Set operation mode to RUN */
>> +	regmap_write(regmap, PLL_OPMODE(pll), PLL_RUN);
>> +
>> +	ret = wait_for_pll_enable_lock(pll);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/* Enable the global PLL outputs */
>> +	ret = regmap_update_bits(regmap, PLL_MODE(pll), PLL_OUTCTRL, PLL_OUTCTRL);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/* Ensure that the write above goes through before returning. */
>> +	mb();
>> +
>> +	return ret;
>> +}
>> +
>> +static void alpha_pll_pongo_elu_disable(struct clk_hw *hw)
>> +{
>> +	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
>> +	struct regmap *regmap = pll->clkr.regmap;
>> +	int ret;
>> +
>> +	/* Disable the global PLL output */
>> +	ret = regmap_update_bits(regmap, PLL_MODE(pll), PLL_OUTCTRL, 0);
>> +	if (ret)
>> +		return;
>> +
>> +	/* Place the PLL mode in STANDBY */
>> +	regmap_write(regmap, PLL_OPMODE(pll), PLL_STANDBY);
>> +}
>> +
>> +static unsigned long alpha_pll_pongo_elu_recalc_rate(struct clk_hw *hw,
>> +						     unsigned long parent_rate)
>> +{
>> +	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
>> +	struct regmap *regmap = pll->clkr.regmap;
>> +	u32 l;
>> +
>> +	if (regmap_read(regmap, PLL_L_VAL(pll), &l))
>> +		return 0;
>> +
>> +	l &= PONGO_PLL_L_VAL_MASK;
>> +
>> +	return alpha_pll_calc_rate(parent_rate, l, 0, pll_alpha_width(pll));
>> +}
>> +
>> +const struct clk_ops clk_alpha_pll_pongo_elu_ops = {
>> +	.prepare = alpha_pll_pongo_elu_prepare,
>> +	.enable = alpha_pll_pongo_elu_enable,
>> +	.disable = alpha_pll_pongo_elu_disable,
>> +	.recalc_rate = alpha_pll_pongo_elu_recalc_rate,
>> +};
>> +EXPORT_SYMBOL_GPL(clk_alpha_pll_pongo_elu_ops);
>> +
>> +void clk_pongo_elu_pll_configure(struct clk_alpha_pll *pll,
>> +				 struct regmap *regmap,
>> +				 const struct alpha_pll_config *config)
>> +{
>> +	u32 val;
>> +
>> +	regmap_update_bits(regmap, PLL_USER_CTL(pll), PONGO_PLL_OUT_MASK,
>> +			   PONGO_PLL_OUT_MASK);
>> +
>> +	if (trion_pll_is_enabled(pll, regmap))
>> +		return;
>> +
>> +	if (regmap_read(regmap, PLL_L_VAL(pll), &val))
>> +		return;
>> +	val &= PONGO_PLL_L_VAL_MASK;
>> +	if (val)
>> +		return;
>> +
>> +	clk_alpha_pll_write_config(regmap, PLL_L_VAL(pll), config->l);
>> +	clk_alpha_pll_write_config(regmap, PLL_ALPHA_VAL(pll), config->alpha);
>> +	clk_alpha_pll_write_config(regmap, PLL_CONFIG_CTL(pll), config->config_ctl_val);
>> +	clk_alpha_pll_write_config(regmap, PLL_CONFIG_CTL_U(pll), config->config_ctl_hi_val);
>> +	clk_alpha_pll_write_config(regmap, PLL_CONFIG_CTL_U1(pll), config->config_ctl_hi1_val);
>> +	clk_alpha_pll_write_config(regmap, PLL_CONFIG_CTL_U2(pll), config->config_ctl_hi2_val);
>> +	clk_alpha_pll_write_config(regmap, PLL_USER_CTL(pll),
>> +				   config->user_ctl_val | PONGO_PLL_OUT_MASK);
>> +	clk_alpha_pll_write_config(regmap, PLL_USER_CTL_U(pll), config->user_ctl_hi_val);
>> +	clk_alpha_pll_write_config(regmap, PLL_TEST_CTL(pll), config->test_ctl_val);
>> +	clk_alpha_pll_write_config(regmap, PLL_TEST_CTL_U(pll), config->test_ctl_hi_val);
>> +	clk_alpha_pll_write_config(regmap, PLL_TEST_CTL_U1(pll), config->test_ctl_hi1_val);
>> +	clk_alpha_pll_write_config(regmap, PLL_TEST_CTL_U2(pll), config->test_ctl_hi2_val);
>> +	clk_alpha_pll_write_config(regmap, PLL_TEST_CTL_U3(pll), config->test_ctl_hi3_val);
>> +
>> +	/* Disable PLL output */
>> +	regmap_update_bits(regmap, PLL_MODE(pll), PLL_OUTCTRL, 0);
>> +}
>> +EXPORT_SYMBOL_GPL(clk_pongo_elu_pll_configure);
>> +
>>  void clk_rivian_evo_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
>>  				  const struct alpha_pll_config *config)
>>  {
>> diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
>> index 87bd469d9c2c2ec4e0758c97231527b92fe6afe5..79aca8525262211ae5295245427d4540abf1e09a 100644
>> --- a/drivers/clk/qcom/clk-alpha-pll.h
>> +++ b/drivers/clk/qcom/clk-alpha-pll.h
>> @@ -27,6 +27,7 @@ enum {
>>  	CLK_ALPHA_PLL_TYPE_ZONDA_OLE,
>>  	CLK_ALPHA_PLL_TYPE_LUCID_EVO,
>>  	CLK_ALPHA_PLL_TYPE_LUCID_OLE,
>> +	CLK_ALPHA_PLL_TYPE_PONGO_ELU,
>>  	CLK_ALPHA_PLL_TYPE_TAYCAN_ELU,
>>  	CLK_ALPHA_PLL_TYPE_RIVIAN_EVO,
>>  	CLK_ALPHA_PLL_TYPE_DEFAULT_EVO,
>> @@ -53,6 +54,7 @@ enum {
>>  	PLL_OFF_TEST_CTL_U,
>>  	PLL_OFF_TEST_CTL_U1,
>>  	PLL_OFF_TEST_CTL_U2,
>> +	PLL_OFF_TEST_CTL_U3,
>>  	PLL_OFF_STATE,
>>  	PLL_OFF_STATUS,
>>  	PLL_OFF_OPMODE,
>> @@ -138,6 +140,7 @@ struct alpha_pll_config {
>>  	u32 test_ctl_hi_mask;
>>  	u32 test_ctl_hi1_val;
>>  	u32 test_ctl_hi2_val;
>> +	u32 test_ctl_hi3_val;
>>  	u32 main_output_mask;
>>  	u32 aux_output_mask;
>>  	u32 aux2_output_mask;
>> @@ -196,6 +199,7 @@ extern const struct clk_ops clk_alpha_pll_postdiv_lucid_evo_ops;
>>  #define clk_alpha_pll_postdiv_lucid_ole_ops clk_alpha_pll_postdiv_lucid_evo_ops
>>  #define clk_alpha_pll_postdiv_taycan_elu_ops clk_alpha_pll_postdiv_lucid_evo_ops
>>  
>> +extern const struct clk_ops clk_alpha_pll_pongo_elu_ops;
>>  extern const struct clk_ops clk_alpha_pll_rivian_evo_ops;
>>  #define clk_alpha_pll_postdiv_rivian_evo_ops clk_alpha_pll_postdiv_fabia_ops
>>  
>> @@ -222,6 +226,8 @@ void clk_lucid_evo_pll_configure(struct clk_alpha_pll *pll, struct regmap *regma
>>  				 const struct alpha_pll_config *config);
>>  void clk_lucid_ole_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
>>  				 const struct alpha_pll_config *config);
>> +void clk_pongo_elu_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
>> +				 const struct alpha_pll_config *config);
>>  #define clk_taycan_elu_pll_configure(pll, regmap, config) \
>>  	clk_lucid_evo_pll_configure(pll, regmap, config)
>>  
>>
>> -- 
>> 2.43.0
>>
> 


Best regards,
Krzysztof

