Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A213569375
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Jul 2022 22:40:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233734AbiGFUkn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Jul 2022 16:40:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232075AbiGFUkm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Jul 2022 16:40:42 -0400
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D83BF248EC
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Jul 2022 13:40:41 -0700 (PDT)
Received: by mail-ot1-x32b.google.com with SMTP id n12-20020a9d64cc000000b00616ebd87fc4so12622502otl.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Jul 2022 13:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=jbu+Xolfw/UCGkWoc/N/K4GT7EYnQrpnk3gnXwJ0aDs=;
        b=uE2rBU+ye6xoSUBC+1Xj831S1uRcJlkgDR1ThqSVS8k4uhsyh1wya8Knai7vTdCsWL
         PLikT8TA1iuktX4z2LVa7ZNxSl/w58LNiisUyWC5ablf02Da3u+8shynD+jgifvnBh/l
         7RwB3vHs+rJBYgJt5HMaP47DYx5Ygz8BPqVNc7WT7X9udadKvW7f3vaGijyBjm3Py2Bb
         ygvPfb0HgfcRYGspJ7wyjgdXocbC4KccCtqf09ROP8FONKSz+5DifoMmXYOHNz8wsmSD
         Wc1S1IzxbsWaFUEDXWJN5i+1Ctago0S+V1ZXtPjOyUECAeivezpBp+GMBUK2Zag0PJBf
         kOJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jbu+Xolfw/UCGkWoc/N/K4GT7EYnQrpnk3gnXwJ0aDs=;
        b=EFcwrT12rtQFVJnBQWxt4io3IJI3d5veXz6Xlsj3234iorIYOdm3oU2OUODR+3lwy2
         Urdu84JiAFcHqSGGt/fJ2X1j26i/UkYey6j54pYDMOk64EqWpQbsKlFxdd1zYPfPAJsF
         GigcNYPIDcSCrpC7IZS6tMY1veGt0eV7iBXozO8DItelgXDqRY1mt2cr6sAbFoXWPQq0
         CvVjYBfLELvuLCKohfz39+cPOhZKTGxsIwwmvXBQXQSnFnm9sOZA16sejB+kV4xYOCYs
         +X+CsvjqcTktZIX125wfHSk20waZuThM0MOvLNDNRHKcFVKHSJvYBWQiGDhXOo0x5zDt
         5gyQ==
X-Gm-Message-State: AJIora+RMFKEShVhc/GQDeNCFLjBmklqvn63NF9HP23aaQJ1pMKJEvE5
        5vDZ2PaW6J9oSsbbtEzJI9g/mt1yEfhACg==
X-Google-Smtp-Source: AGRyM1sNeHBBsJB/+2f9iqPz+44tu1Q+eJXIEssGpbPlgYCnk0Shf1qjLZP2HH2kuWCo6jiaotot+g==
X-Received: by 2002:a9d:7154:0:b0:618:d838:3a07 with SMTP id y20-20020a9d7154000000b00618d8383a07mr12799746otj.158.1657140041071;
        Wed, 06 Jul 2022 13:40:41 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id f21-20020a056830309500b00616a2aa298asm16415803ots.75.2022.07.06.13.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 13:40:40 -0700 (PDT)
Date:   Wed, 6 Jul 2022 15:40:38 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v1 2/4] clk: qcom: Add support for Display Clock
 Controller on SM8450
Message-ID: <YsXzRhcAKgsVts9M@builder.lan>
References: <20220623114737.247703-1-dmitry.baryshkov@linaro.org>
 <20220623114737.247703-3-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220623114737.247703-3-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 23 Jun 06:47 CDT 2022, Dmitry Baryshkov wrote:
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index bc4dcf356d82..f409b891fce4 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -635,6 +635,15 @@ config SM_DISPCC_6350
>  	  Say Y if you want to support display devices and functionality such as
>  	  splash screen.
>  
> +config SM_DISPCC_8450
> +	tristate "SM8450 Display Clock Controller"
> +	depends on SM_GCC_8450
> +	help
> +	  Support for the display clock controller on Qualcomm Technologies, Inc
> +	  SM8250 devices.

s/2/4/

> +	  Say Y if you want to support display devices and functionality such as
> +	  splash screen.
> +
[..]
> diff --git a/drivers/clk/qcom/dispcc-sm8450.c b/drivers/clk/qcom/dispcc-sm8450.c
[..]
> +static struct clk_alpha_pll disp_cc_pll0 = {
> +	.offset = 0x0,
> +	.vco_table = lucid_evo_vco,
> +	.num_vco = ARRAY_SIZE(lucid_evo_vco),
> +	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_EVO],
> +	.clkr = {
> +		.hw.init = &(struct clk_init_data){
> +			.name = "disp_cc_pll0",
> +			.parent_data = &(const struct clk_parent_data){
> +				.fw_name = "bi_tcxo",

Can we please have this transitioned to using .index as in the other new
clock drivers?

Also, you have a bi_tcxo clk_parent_data below, how about using that?

And lastly, could I please have a space inbetween ) and {?

> +			},
> +			.num_parents = 1,
> +			.ops = &clk_alpha_pll_reset_lucid_evo_ops,
> +		},
> +	},
> +};
> +
[..]
> +static int __init disp_cc_sm8450_init(void)
> +{
> +	return platform_driver_register(&disp_cc_sm8450_driver);
> +}
> +subsys_initcall(disp_cc_sm8450_init);
> +
> +static void __exit disp_cc_sm8450_exit(void)
> +{
> +	platform_driver_unregister(&disp_cc_sm8450_driver);
> +}
> +module_exit(disp_cc_sm8450_exit);

You should be able to module_platform_driver() this instead.

> +
> +MODULE_DESCRIPTION("QTI DISP_CC WAIPIO Driver");

While not secret, please update this to use SM8450 and perhaps a more
human readable form?

> +MODULE_LICENSE("GPL v2");

Please change this to MODULE_LICENSE("GPL")

Regards,
Bjorn
