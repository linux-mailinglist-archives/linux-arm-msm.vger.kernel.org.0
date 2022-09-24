Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 057495E8934
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Sep 2022 09:34:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233555AbiIXHeR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 24 Sep 2022 03:34:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233534AbiIXHeO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 24 Sep 2022 03:34:14 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9ABADEC559
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Sep 2022 00:34:02 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id i26so3421654lfp.11
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Sep 2022 00:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=TZJsCn6RBqZPS0mMabTRyJHPpOlSZXBlgWgFemMXnVw=;
        b=Vajv0eHcO5+6YPVjMYXG6AsE0FdHWBwFndUieNud2UzMCRINiYV6KSQ6zX+t0qmf8H
         L2Gb2pF+XjUdvVkwBLOlnrl93solNZLz7xTNhl6P6sX1qkL/1g1E71ZEiJ+EXP/CqFcL
         Py6WHMJ54AlsIGiGZsOdEg9tnPQnmF1yM/jQpMnRV3lIp4plpkFDRkjaO7/U3aLEYCsN
         39K9V7N4yXlXJMCyj/wNL9y3HGbzTgH5U3rwu1OhPBTfTbB5/L3jL+IdxqCufVlpkjQt
         BYjb4IWaMAsOJc2jGR7lIWzoTYAck4X7Xf1+z4y6+d+d/8GSC5ERhOXMgDm0ksJoJoGh
         zXiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=TZJsCn6RBqZPS0mMabTRyJHPpOlSZXBlgWgFemMXnVw=;
        b=vz53ZYgyfGGjlNefScXxaUO1FhwSZHnO7XWY3yeztPKr42Udh2ChWFx677W1v6kD2+
         54ESf3d36xqr02iBd4RUDhCoCGHzY+WifcLymo5/3OZt2mtOEMnzzsGP39hlQJxRTg7Q
         XxLEAh4kq/UT1VKdQAYtBUxAW9Utsz/2MQP4GXlowhyCVl2SbxDP7+fV14tELFEY4Nw7
         kfxHOzQfWh2+XHoUHoZbRV+Ba/n4ju5G7NroCwGdz25SReLPNtMAMYxUBEYoLnvRUwbt
         GFXkoddpRIy3JsIevrSXZxGNU1LL6CY7U0+WNJ+BKlQ72uHVBmpNOF6AUG5NPxhTvgN9
         TYVw==
X-Gm-Message-State: ACrzQf2Ja2ipzRZNc+6vbtbNXqultGr31a+tDMexO8Z0XgR+OSBe1biM
        r9ZHWkbxmNN4vEeTFWWksvR/zA==
X-Google-Smtp-Source: AMsMyM4D++2g1WM2MdCB82pdJV724iMYEdsVDIhgvk/jlZggcqyyJXCg9e+9bHMZKevVRHKFliF1iw==
X-Received: by 2002:a05:6512:32c6:b0:49f:53d1:4ee5 with SMTP id f6-20020a05651232c600b0049f53d14ee5mr4529332lfg.525.1664004840873;
        Sat, 24 Sep 2022 00:34:00 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id v25-20020ac258f9000000b00492dc29be7bsm1797220lfo.227.2022.09.24.00.34.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Sep 2022 00:34:00 -0700 (PDT)
Message-ID: <20f1dc9a-5d71-7e6b-aa48-e535ecb2786c@linaro.org>
Date:   Sat, 24 Sep 2022 10:33:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v4 1/3] clk: asm9260: use parent index to link the
 reference clock
Content-Language: en-GB
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-phy@lists.infradead.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
References: <20220916061740.87167-1-dmitry.baryshkov@linaro.org>
 <20220916061740.87167-2-dmitry.baryshkov@linaro.org>
In-Reply-To: <20220916061740.87167-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Stephen, gracious ping for the first two patches. They touch the generic 
clk code, so they belong your domain. If they can be merged into 6.1, 
this would save us from the inter-subsys dependency with the PHY patch 
going in into 6.2.

On 16/09/2022 09:17, Dmitry Baryshkov wrote:
> Rewrite clk-asm9260 to use parent index to use the reference clock.
> During this rework two helpers are added:
> 
> - clk_hw_register_mux_table_parent_data() to supplement
>    clk_hw_register_mux_table() but using parent_data instead of
>    parent_names
> 
> - clk_hw_register_fixed_rate_parent_accuracy() to be used instead of
>    directly calling __clk_hw_register_fixed_rate(). The later function is
>    an internal API, which is better not to be called directly.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/clk/clk-asm9260.c    | 29 ++++++++++++-----------------
>   include/linux/clk-provider.h | 21 +++++++++++++++++++++
>   2 files changed, 33 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/clk/clk-asm9260.c b/drivers/clk/clk-asm9260.c
> index bacebd457e6f..8b3c059e19a1 100644
> --- a/drivers/clk/clk-asm9260.c
> +++ b/drivers/clk/clk-asm9260.c
> @@ -80,7 +80,7 @@ struct asm9260_mux_clock {
>   	u8			mask;
>   	u32			*table;
>   	const char		*name;
> -	const char		**parent_names;
> +	const struct clk_parent_data *parent_data;
>   	u8			num_parents;
>   	unsigned long		offset;
>   	unsigned long		flags;
> @@ -232,10 +232,10 @@ static const struct asm9260_gate_data asm9260_ahb_gates[] __initconst = {
>   		HW_AHBCLKCTRL1,	16 },
>   };
>   
> -static const char __initdata *main_mux_p[] =   { NULL, NULL };
> -static const char __initdata *i2s0_mux_p[] =   { NULL, NULL, "i2s0m_div"};
> -static const char __initdata *i2s1_mux_p[] =   { NULL, NULL, "i2s1m_div"};
> -static const char __initdata *clkout_mux_p[] = { NULL, NULL, "rtc"};
> +static struct clk_parent_data __initdata main_mux_p[] =   { { .index = 0, }, { .name = "pll" } };
> +static struct clk_parent_data __initdata i2s0_mux_p[] =   { { .index = 0, }, { .name = "pll" }, { .name = "i2s0m_div"} };
> +static struct clk_parent_data __initdata i2s1_mux_p[] =   { { .index = 0, }, { .name = "pll" }, { .name = "i2s1m_div"} };
> +static struct clk_parent_data __initdata clkout_mux_p[] = { { .index = 0, }, { .name = "pll" }, { .name = "rtc"} };
>   static u32 three_mux_table[] = {0, 1, 3};
>   
>   static struct asm9260_mux_clock asm9260_mux_clks[] __initdata = {
> @@ -255,9 +255,10 @@ static struct asm9260_mux_clock asm9260_mux_clks[] __initdata = {
>   
>   static void __init asm9260_acc_init(struct device_node *np)
>   {
> -	struct clk_hw *hw;
> +	struct clk_hw *hw, *pll_hw;
>   	struct clk_hw **hws;
> -	const char *ref_clk, *pll_clk = "pll";
> +	const char *pll_clk = "pll";
> +	struct clk_parent_data pll_parent_data = { .index = 0 };
>   	u32 rate;
>   	int n;
>   
> @@ -274,21 +275,15 @@ static void __init asm9260_acc_init(struct device_node *np)
>   	/* register pll */
>   	rate = (ioread32(base + HW_SYSPLLCTRL) & 0xffff) * 1000000;
>   
> -	/* TODO: Convert to DT parent scheme */
> -	ref_clk = of_clk_get_parent_name(np, 0);
> -	hw = __clk_hw_register_fixed_rate(NULL, NULL, pll_clk,
> -			ref_clk, NULL, NULL, 0, rate, 0,
> -			CLK_FIXED_RATE_PARENT_ACCURACY);
> -
> -	if (IS_ERR(hw))
> +	pll_hw = clk_hw_register_fixed_rate_parent_accuracy(NULL, pll_clk, &pll_parent_data,
> +							0, rate);
> +	if (IS_ERR(pll_hw))
>   		panic("%pOFn: can't register REFCLK. Check DT!", np);
>   
>   	for (n = 0; n < ARRAY_SIZE(asm9260_mux_clks); n++) {
>   		const struct asm9260_mux_clock *mc = &asm9260_mux_clks[n];
>   
> -		mc->parent_names[0] = ref_clk;
> -		mc->parent_names[1] = pll_clk;
> -		hw = clk_hw_register_mux_table(NULL, mc->name, mc->parent_names,
> +		hw = clk_hw_register_mux_table_parent_data(NULL, mc->name, mc->parent_data,
>   				mc->num_parents, mc->flags, base + mc->offset,
>   				0, mc->mask, 0, mc->table, &asm9260_clk_lock);
>   	}
> diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
> index 1615010aa0ec..86140ac2f9a5 100644
> --- a/include/linux/clk-provider.h
> +++ b/include/linux/clk-provider.h
> @@ -439,6 +439,20 @@ struct clk *clk_register_fixed_rate(struct device *dev, const char *name,
>   	__clk_hw_register_fixed_rate((dev), NULL, (name), NULL, NULL,	      \
>   				     (parent_data), NULL, (flags),	      \
>   				     (fixed_rate), (fixed_accuracy), 0)
> +/**
> + * clk_hw_register_fixed_rate_parent_accuracy - register fixed-rate clock with
> + * the clock framework
> + * @dev: device that is registering this clock
> + * @name: name of this clock
> + * @parent_name: name of clock's parent
> + * @flags: framework-specific flags
> + * @fixed_rate: non-adjustable clock rate
> + */
> +#define clk_hw_register_fixed_rate_parent_accuracy(dev, name, parent_data,    \
> +						   flags, fixed_rate)	      \
> +	__clk_hw_register_fixed_rate((dev), NULL, (name), NULL, NULL,      \
> +				     (parent_data), (flags), (fixed_rate), 0,    \
> +				     CLK_FIXED_RATE_PARENT_ACCURACY)
>   
>   void clk_unregister_fixed_rate(struct clk *clk);
>   void clk_hw_unregister_fixed_rate(struct clk_hw *hw);
> @@ -957,6 +971,13 @@ struct clk *clk_register_mux_table(struct device *dev, const char *name,
>   			      (parent_names), NULL, NULL, (flags), (reg),     \
>   			      (shift), (mask), (clk_mux_flags), (table),      \
>   			      (lock))
> +#define clk_hw_register_mux_table_parent_data(dev, name, parent_data,	      \
> +				  num_parents, flags, reg, shift, mask,	      \
> +				  clk_mux_flags, table, lock)		      \
> +	__clk_hw_register_mux((dev), NULL, (name), (num_parents),	      \
> +			      NULL, NULL, (parent_data), (flags), (reg),      \
> +			      (shift), (mask), (clk_mux_flags), (table),      \
> +			      (lock))
>   #define clk_hw_register_mux(dev, name, parent_names, num_parents, flags, reg, \
>   			    shift, width, clk_mux_flags, lock)		      \
>   	__clk_hw_register_mux((dev), NULL, (name), (num_parents),	      \

-- 
With best wishes
Dmitry

