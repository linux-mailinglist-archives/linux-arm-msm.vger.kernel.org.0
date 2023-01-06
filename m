Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 37B3865FC39
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jan 2023 08:45:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230112AbjAFHpw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Jan 2023 02:45:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbjAFHps (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Jan 2023 02:45:48 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0406B755F0
        for <linux-arm-msm@vger.kernel.org>; Thu,  5 Jan 2023 23:45:47 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id m8-20020a05600c3b0800b003d96f801c48so2997267wms.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jan 2023 23:45:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BWzIac1mQdA/HE3RfWrbgoLzJ/aPJCGCNKjxU7CNlVk=;
        b=jA7qrgj0BKbAUuBwRaUBJis0zSlr3wsts22b9lvfBwJ+2A5wnJgNUR54zHRs6/FlES
         KpT1LIxIgZIjubTPt5zvVur1WMu+Hjx2uL4c+ZwqichkLUxCdyaSIQvhSIfJjUtxWqwn
         elIcP9v3SqwBZbX1sDuvN6rCzSqG6n1uNqjgvJSYJtfvLIc7rt4TsFx65W9F0NLc3erq
         xLAAZM7tStCq0sdyROxnYW9Vy+JnPxdzWOCSRaN5VKxHxFBZ5EI5RPI2skKvWrwpad3N
         Lf8bxVU7Edt921X2f5834EvTXUky/uvN9u9bDZd75YZlQzzxHHDkGXHL+y11CsXO+A60
         b4pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BWzIac1mQdA/HE3RfWrbgoLzJ/aPJCGCNKjxU7CNlVk=;
        b=1t2ifM4mVh8/1dS2+6/ls9s8cQaxprb+ChVkA4BNZLj/jK0DgA6jylwUB3hTxC/FWT
         zLVuwre7167E4fa3B7lfnQp1G+6GcjEMXmI9MqN57OAoHkQZ62nMQueZxruSEDX2rCRg
         ICv4K6owYQ2sMvpyEDVdLXwvHEzAaYdwd0XNJqfgydNM3zwVAazmxrZzSIBvkhiWpPGv
         HqlFO26GBRrWOE20Pzq0vn7UeDNlkRjR1YIIdJV/k84OMKm6bsJlP6SDwSg4CS9y/Lvj
         hm877TK1th9TKps6pUxl4xkjMTXdsNwdtOvsazsUlPHHUti/07QiNeDt5oy4QZ4buEMF
         aCkQ==
X-Gm-Message-State: AFqh2kpPGzdzx4Z4dIFVQJID2xVk0PO5fFlJzJCueRKjarbDCSX/rfP6
        /JFpzfmvELcRCMqF0Jr8mJ300Q==
X-Google-Smtp-Source: AMrXdXuCnAAiEGnDDIF1f0v8D0Cm3uApENmX7jMXvcHmLWtjRg9DjUSiiKEoi7QWcFyQN8yza33tVA==
X-Received: by 2002:a1c:4b03:0:b0:3d9:103d:9081 with SMTP id y3-20020a1c4b03000000b003d9103d9081mr38201497wma.28.1672991145540;
        Thu, 05 Jan 2023 23:45:45 -0800 (PST)
Received: from [192.168.1.102] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id t14-20020adfeb8e000000b002baa780f0fasm356919wrn.111.2023.01.05.23.45.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jan 2023 23:45:45 -0800 (PST)
Message-ID: <c2f78788-edcd-6c64-9581-bc84dc9dd609@linaro.org>
Date:   Fri, 6 Jan 2023 08:45:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v6 4/5] clk: qcom: rpmh: Add support for SM8550 rpmh
 clocks
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mike Tipton <quic_mdtipton@quicinc.com>
Cc:     Abel Vesa <abel.vesa@linaro.org>, Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20221206224515.1495457-1-abel.vesa@linaro.org>
 <20221206224515.1495457-5-abel.vesa@linaro.org>
 <6fc64fae-e616-2038-0424-34ce0cb7e16d@linaro.org>
 <20221228185254.4acnjchbyq4krblb@builder.lan>
 <b1227e06-be29-7d8d-e8df-192a603d6424@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <b1227e06-be29-7d8d-e8df-192a603d6424@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 28/12/2022 19:59, Dmitry Baryshkov wrote:
> On 28/12/2022 20:52, Bjorn Andersson wrote:
>> On Wed, Dec 14, 2022 at 06:25:01PM +0200, Dmitry Baryshkov wrote:
>>> On 07/12/2022 00:45, Abel Vesa wrote:
>>>> Adds the RPMH clocks present in SM8550 SoC.
>>>>
>>>> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
>>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>>> ---
>>>>    drivers/clk/qcom/clk-rpmh.c | 110 +++++++++++++++++++++++++++++-------
>>>>    1 file changed, 90 insertions(+), 20 deletions(-)
>>>>
>>>> diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
>>>> index 2c2ef4b6d130..ce81c76ed0fd 100644
>>>> --- a/drivers/clk/qcom/clk-rpmh.c
>>>> +++ b/drivers/clk/qcom/clk-rpmh.c
>>>> @@ -130,6 +130,34 @@ static DEFINE_MUTEX(rpmh_clk_lock);
>>>>    		},							\
>>>>    	}
>>>> +#define DEFINE_CLK_FIXED_FACTOR(_name, _parent_name, _div)		\
>>>> +	static struct clk_fixed_factor clk_fixed_factor##_##_name = {	\
>>>> +		.mult = 1,						\
>>>> +		.div = _div,						\
>>>> +		.hw.init = &(struct clk_init_data){			\
>>>> +			.ops = &clk_fixed_factor_ops,			\
>>>> +			.name = #_name,					\
>>>> +			.parent_data =  &(const struct clk_parent_data){ \
>>>> +				.fw_name = #_parent_name,		\
>>>> +				.name = #_parent_name,			\
>>>> +			},						\
>>>> +			.num_parents = 1,				\
>>>> +		},							\
>>>> +	};								\
>>>> +	static struct clk_fixed_factor clk_fixed_factor##_##_name##_ao = { \
>>>> +		.mult = 1,						\
>>>> +		.div = _div,						\
>>>> +		.hw.init = &(struct clk_init_data){			\
>>>> +			.ops = &clk_fixed_factor_ops,			\
>>>> +			.name = #_name "_ao",				\
>>>> +			.parent_data =  &(const struct clk_parent_data){ \
>>>> +				.fw_name = #_parent_name "_ao",		\
>>>> +				.name = #_parent_name "_ao",		\
>>>> +			},						\
>>>> +			.num_parents = 1,				\
>>>> +		},							\
>>>> +	}
>>>> +
>>>>    static inline struct clk_rpmh *to_clk_rpmh(struct clk_hw *_hw)
>>>>    {
>>>>    	return container_of(_hw, struct clk_rpmh, hw);
>>>> @@ -345,6 +373,8 @@ DEFINE_CLK_RPMH_ARC(bi_tcxo, "xo.lvl", 0x3, 2);
>>>>    DEFINE_CLK_RPMH_ARC(bi_tcxo, "xo.lvl", 0x3, 4);
>>>>    DEFINE_CLK_RPMH_ARC(qlink, "qphy.lvl", 0x1, 4);
>>>> +DEFINE_CLK_FIXED_FACTOR(bi_tcxo_div2, bi_tcxo, 2);
>>>> +
>>>>    DEFINE_CLK_RPMH_VRM(ln_bb_clk1, _a2, "lnbclka1", 2);
>>>>    DEFINE_CLK_RPMH_VRM(ln_bb_clk2, _a2, "lnbclka2", 2);
>>>>    DEFINE_CLK_RPMH_VRM(ln_bb_clk3, _a2, "lnbclka3", 2);
>>>> @@ -366,6 +396,16 @@ DEFINE_CLK_RPMH_VRM(rf_clk2, _d, "rfclkd2", 1);
>>>>    DEFINE_CLK_RPMH_VRM(rf_clk3, _d, "rfclkd3", 1);
>>>>    DEFINE_CLK_RPMH_VRM(rf_clk4, _d, "rfclkd4", 1);
>>>> +DEFINE_CLK_RPMH_VRM(clk1, _a1, "clka1", 1);
>>>> +DEFINE_CLK_RPMH_VRM(clk2, _a1, "clka2", 1);
>>>> +DEFINE_CLK_RPMH_VRM(clk3, _a1, "clka3", 1);
>>>> +DEFINE_CLK_RPMH_VRM(clk4, _a1, "clka4", 1);
>>>> +DEFINE_CLK_RPMH_VRM(clk5, _a1, "clka5", 1);
>>>> +
>>>> +DEFINE_CLK_RPMH_VRM(clk6, _a2, "clka6", 2);
>>>> +DEFINE_CLK_RPMH_VRM(clk7, _a2, "clka7", 2);
>>>> +DEFINE_CLK_RPMH_VRM(clk8, _a2, "clka8", 2);
>>>> +
>>>>    DEFINE_CLK_RPMH_VRM(div_clk1, _div2, "divclka1", 2);
>>>>    DEFINE_CLK_RPMH_BCM(ce, "CE0");
>>>> @@ -576,6 +616,33 @@ static const struct clk_rpmh_desc clk_rpmh_sm8450 = {
>>>>    	.num_clks = ARRAY_SIZE(sm8450_rpmh_clocks),
>>>>    };
>>>> +static struct clk_hw *sm8550_rpmh_clocks[] = {
>>>> +	[RPMH_CXO_PAD_CLK]      = &clk_rpmh_bi_tcxo_div2.hw,
>>>> +	[RPMH_CXO_PAD_CLK_A]    = &clk_rpmh_bi_tcxo_div2_ao.hw,
>>>> +	[RPMH_CXO_CLK]		= &clk_fixed_factor_bi_tcxo_div2.hw,
>>>> +	[RPMH_CXO_CLK_A]	= &clk_fixed_factor_bi_tcxo_div2_ao.hw,
>>>> +	[RPMH_LN_BB_CLK1]	= &clk_rpmh_clk6_a2.hw,
>>>> +	[RPMH_LN_BB_CLK1_A]	= &clk_rpmh_clk6_a2_ao.hw,
>>>> +	[RPMH_LN_BB_CLK2]	= &clk_rpmh_clk7_a2.hw,
>>>> +	[RPMH_LN_BB_CLK2_A]	= &clk_rpmh_clk7_a2_ao.hw,
>>>> +	[RPMH_LN_BB_CLK3]	= &clk_rpmh_clk8_a2.hw,
>>>> +	[RPMH_LN_BB_CLK3_A]	= &clk_rpmh_clk8_a2_ao.hw,
>>>> +	[RPMH_RF_CLK1]		= &clk_rpmh_clk1_a1.hw,
>>>> +	[RPMH_RF_CLK1_A]	= &clk_rpmh_clk1_a1_ao.hw,
>>>> +	[RPMH_RF_CLK2]		= &clk_rpmh_clk2_a1.hw,
>>>> +	[RPMH_RF_CLK2_A]	= &clk_rpmh_clk2_a1_ao.hw,
>>>> +	[RPMH_RF_CLK3]		= &clk_rpmh_clk3_a1.hw,
>>>> +	[RPMH_RF_CLK3_A]	= &clk_rpmh_clk3_a1_ao.hw,
>>>> +	[RPMH_RF_CLK4]		= &clk_rpmh_clk4_a1.hw,
>>>> +	[RPMH_RF_CLK4_A]	= &clk_rpmh_clk4_a1_ao.hw,
>>>> +	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
>>>> +};
>>>> +
>>>> +static const struct clk_rpmh_desc clk_rpmh_sm8550 = {
>>>> +	.clks = sm8550_rpmh_clocks,
>>>> +	.num_clks = ARRAY_SIZE(sm8550_rpmh_clocks),
>>>> +};
>>>> +
>>>>    static struct clk_hw *sc7280_rpmh_clocks[] = {
>>>>    	[RPMH_CXO_CLK]      = &clk_rpmh_bi_tcxo_div4.hw,
>>>>    	[RPMH_CXO_CLK_A]    = &clk_rpmh_bi_tcxo_div4_ao.hw,
>>>> @@ -683,29 +750,31 @@ static int clk_rpmh_probe(struct platform_device *pdev)
>>>>    		name = hw_clks[i]->init->name;
>>>> -		rpmh_clk = to_clk_rpmh(hw_clks[i]);
>>>> -		res_addr = cmd_db_read_addr(rpmh_clk->res_name);
>>>> -		if (!res_addr) {
>>>> -			dev_err(&pdev->dev, "missing RPMh resource address for %s\n",
>>>> -				rpmh_clk->res_name);
>>>> -			return -ENODEV;
>>>> -		}
>>>> +		if (hw_clks[i]->init->ops != &clk_fixed_factor_ops) {
>>>
>>> We discussed this separately, the fixed factor clocks will be moved to the
>>> child nodes, leaving rpmhcc with only cmd-db based clocks.
>>>
>>
>> Are you saying that you will represent bi_tcxo as a fixed-factor-clock
>> under /clocks with RPMH_CXO_PAD_CLK as parent and a clock-div = <2>; ?
> 
> Yes, this was the idea. The rpmhcc driver is pretty much centric around 
> the cmd-db clocks. Adding a fixed-factor clock results either in a 
> horrible hacks or in a significant code refactoring. However we already 
> have an existing way to fixed-factor clocks: DT nodes. Adding support 
> for such nodes to rpmhcc driver requires just a single additional API 
> call: devm_of_platform_populate().

Please no. DT is not to solve driver issues, skip some code or make
things simpler for driver developers. If everyone - U-boot, *BSD,
firmwares - pushes to DT stuff like this, because this makes their
driver development easier, you would have total mess. Linux does not
have any priorities here in this approach.

Best regards,
Krzysztof

