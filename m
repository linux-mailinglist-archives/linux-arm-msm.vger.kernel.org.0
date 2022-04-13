Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 83D554FED22
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Apr 2022 04:45:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231860AbiDMCrl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Apr 2022 22:47:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231648AbiDMCrZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Apr 2022 22:47:25 -0400
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9736562E1
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Apr 2022 19:45:05 -0700 (PDT)
Received: by mail-oi1-x22d.google.com with SMTP id b188so690844oia.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Apr 2022 19:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=UuOOoFGnWc9VTndoEuvNPq13NPX/r0x7qzJUtDKizUo=;
        b=wxWpc3OLtS75cPwf+clCogJs/ZF7f0xw/7i2EAoQvF0aQqMeFXrId6Fstd2zde6j/i
         w5vOIwJCzam3RIJoe/FK4As+94AixxAT1NMIRd1KfxyR0WwvtPL3vEUNwZgEwdkgJpr/
         bY/phAEXQSkVHl+d/PNPBA+KktdLyPMXkG6s4ssTee7SbBMq3VMLpjEFeNw/mwqaURMX
         u+zFOMOVzMU3XtWaJGk/MPooSsdQRWQ3M/wue1fAPhiSq7dmAYFz1zhJkGJ/DtG+kMXP
         wY3eqC3PrJC2fZkeS68mXn254klyOmEHeseGVP2bdjyNFqu2YKehzliKEpt5eaoWXGtl
         r2gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=UuOOoFGnWc9VTndoEuvNPq13NPX/r0x7qzJUtDKizUo=;
        b=tQk6P8UtV3dZ6rJsTkZ3JotBIl76u8GX+ySr1UvfqovmnfcdeJGCLeOySvP4gxqhNW
         fgMszOzgeuc65dZ0xAMEObENaGNO/ZTpXuCWy0LUYIY+6Sp2jG42iwaYWw+PyzBOkOyq
         ANGepNjFFBKWFo/hlVCOpc8uXAevrsRCB5bNzAbLd54IASNhWfCmqoJOC77eOpN3gHPf
         UDeAzolKchEXD/rfPZ9q1H+rnK3r804ZQDmaMrexFTz9rGvJK5LMLxr2r1l/z/RW8wIU
         1YJJjPO2p0w3YQXFDE9q6wkAdzEJyfyYZAFk2eTx/l0Cr0hVix4O8FoqJIiAcnOPZDQH
         BNJw==
X-Gm-Message-State: AOAM53289XMMVHg8XPj8mqTankj47TDqNoZmO784bJ/2CCfl4E6zxhQ+
        YGp+EmMcFLRkRbdKdjDnAVCLCA==
X-Google-Smtp-Source: ABdhPJxEOwHg4iFGlMEG3Gks82u0WXv60WXp2MVSam88PUT9GiA9gAlP1Dk8LtmiC257E2mbah0qlA==
X-Received: by 2002:aca:90c:0:b0:2ec:f120:c705 with SMTP id 12-20020aca090c000000b002ecf120c705mr3118406oij.46.1649817904923;
        Tue, 12 Apr 2022 19:45:04 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id k22-20020a056870959600b000d277c48d18sm15258269oao.3.2022.04.12.19.45.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 19:45:04 -0700 (PDT)
Date:   Tue, 12 Apr 2022 21:45:02 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 4/7] clk: qcom: clk-alpha-pll: limit exported symbols
 to GPL licensed code
Message-ID: <YlY5Lk3fgYO2hCaA@builder.lan>
References: <20220314114211.1636574-1-vladimir.zapolskiy@linaro.org>
 <20220314114248.1636620-1-vladimir.zapolskiy@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220314114248.1636620-1-vladimir.zapolskiy@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 14 Mar 06:42 CDT 2022, Vladimir Zapolskiy wrote:

> Unify all exported PLL clock configuration functions and data structures
> as GPL symbols.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>  drivers/clk/qcom/clk-alpha-pll.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
> index 288692f0ea39..47879ee5a677 100644
> --- a/drivers/clk/qcom/clk-alpha-pll.c
> +++ b/drivers/clk/qcom/clk-alpha-pll.c
> @@ -1823,7 +1823,7 @@ const struct clk_ops clk_alpha_pll_lucid_5lpe_ops = {
>  	.round_rate = clk_alpha_pll_round_rate,
>  	.set_rate = alpha_pll_lucid_5lpe_set_rate,
>  };
> -EXPORT_SYMBOL(clk_alpha_pll_lucid_5lpe_ops);
> +EXPORT_SYMBOL_GPL(clk_alpha_pll_lucid_5lpe_ops);
>  
>  const struct clk_ops clk_alpha_pll_fixed_lucid_5lpe_ops = {
>  	.enable = alpha_pll_lucid_5lpe_enable,
> @@ -1832,14 +1832,14 @@ const struct clk_ops clk_alpha_pll_fixed_lucid_5lpe_ops = {
>  	.recalc_rate = clk_trion_pll_recalc_rate,
>  	.round_rate = clk_alpha_pll_round_rate,
>  };
> -EXPORT_SYMBOL(clk_alpha_pll_fixed_lucid_5lpe_ops);
> +EXPORT_SYMBOL_GPL(clk_alpha_pll_fixed_lucid_5lpe_ops);
>  
>  const struct clk_ops clk_alpha_pll_postdiv_lucid_5lpe_ops = {
>  	.recalc_rate = clk_alpha_pll_postdiv_fabia_recalc_rate,
>  	.round_rate = clk_alpha_pll_postdiv_fabia_round_rate,
>  	.set_rate = clk_lucid_5lpe_pll_postdiv_set_rate,
>  };
> -EXPORT_SYMBOL(clk_alpha_pll_postdiv_lucid_5lpe_ops);
> +EXPORT_SYMBOL_GPL(clk_alpha_pll_postdiv_lucid_5lpe_ops);
>  
>  void clk_zonda_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
>  			     const struct alpha_pll_config *config)
> @@ -1992,7 +1992,7 @@ const struct clk_ops clk_alpha_pll_zonda_ops = {
>  	.round_rate = clk_alpha_pll_round_rate,
>  	.set_rate = clk_zonda_pll_set_rate,
>  };
> -EXPORT_SYMBOL(clk_alpha_pll_zonda_ops);
> +EXPORT_SYMBOL_GPL(clk_alpha_pll_zonda_ops);
>  
>  static int alpha_pll_lucid_evo_enable(struct clk_hw *hw)
>  {
> -- 
> 2.33.0
> 
