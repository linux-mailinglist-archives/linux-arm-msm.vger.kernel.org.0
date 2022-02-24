Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 807D44C22BD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Feb 2022 04:58:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229809AbiBXD6x (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Feb 2022 22:58:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229804AbiBXD6w (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Feb 2022 22:58:52 -0500
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CBB625D252
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Feb 2022 19:58:23 -0800 (PST)
Received: by mail-oi1-x236.google.com with SMTP id j2so1235400oie.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Feb 2022 19:58:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/rHiMAZ7RH310gYheZGBklR98lgCQetqEuPG8BVoGnc=;
        b=HtVFWkzVcB22eS57Hsfut1l+77KIhq5/gbM5SHBvkuOE6GFtyFNtp1XsuwdvAW83X3
         ibivk9VPRmP4U3z6bsgxysubOwl5aG/g5HS7qpv/tqtOUBJTvHwsMqPSTeAEP/MVC6OO
         /6maTp2IRezoW92bw/VggdtfKvzpkQb8C2DUxQA4OmG4Lmw/r52TndslRuaa1rU1/IG4
         jALk5HVeFaTImVEzZrIBRBEVnosnnF2TH2khXCmjESDUHliCT6/6azAc6K8jK9Js3sZn
         lUVyp5ogTAVlShTSNzT1uV7YczjAr0Ws4Zt8R5eNq2Y0t9d/47OkROwPRmjYV6iwIBkE
         k8Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/rHiMAZ7RH310gYheZGBklR98lgCQetqEuPG8BVoGnc=;
        b=Cy2lcenGuqHOR52dLadlIzWy3Pv1J3tU3FtG+cmsK4cNJy7PJTY4SdOqslezeug8Wy
         PxGtiHDud/hMLEHxrvWdVIycQ6pNiHkqFiJpqBgooEqkGPbngsPpAAVBRTsRbg+BoeWG
         wNF1YJ+RYfDzj1yaQ0WoKgYFb0K/Iy5yVSr886iQXoYRDL678hozhR70ehQfzCjgsPuh
         Vm0hkNnkvl9BwZAec8H0Ue+8vRQWd62B0i/YDZbZiB9SwEtU39xSNhDzlqStsh0ulMQT
         diXa3weNvnS3J5YNQ6gYP5QueQIT1ZC7bmogi/pogkpq8n3SoopbC8b7E15GhDV28ndP
         9IRQ==
X-Gm-Message-State: AOAM5313FIz9dJT02CRPXFJ9UMgnHVmJT7VQmuYK97sIQW7sdgBE9D8h
        btKe5yU21UfWSzV5KHVnIvpcnbkG4hWezg==
X-Google-Smtp-Source: ABdhPJz9NXg0iE9mEWe1XINNAqvGIzk1n7sIHTLoP3qwnqauuCzLd4tE/sYDSuaZtsdh0GeiDf9iig==
X-Received: by 2002:a05:6808:1707:b0:2ce:6a75:b883 with SMTP id bc7-20020a056808170700b002ce6a75b883mr382885oib.330.1645675102514;
        Wed, 23 Feb 2022 19:58:22 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id s6sm912678oap.32.2022.02.23.19.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Feb 2022 19:58:21 -0800 (PST)
Date:   Wed, 23 Feb 2022 21:58:20 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Ansuel Smith <ansuelsmth@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Taniya Das <tdas@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 10/16] clk: qcom: clk-rcg: add clk_rcg_floor_ops ops
Message-ID: <YhcCXGWJhMBDCp6k@builder.lan>
References: <20220217235703.26641-1-ansuelsmth@gmail.com>
 <20220217235703.26641-11-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220217235703.26641-11-ansuelsmth@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 17 Feb 17:56 CST 2022, Ansuel Smith wrote:

> Add clk_rcg_floor_ops for clock that can't provide a stable freq and
> require to use a floor freq to provide the requested frequency.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> ---
>  drivers/clk/qcom/clk-rcg.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/drivers/clk/qcom/clk-rcg.c b/drivers/clk/qcom/clk-rcg.c
> index a9d181d6be21..88845baa7f84 100644
> --- a/drivers/clk/qcom/clk-rcg.c
> +++ b/drivers/clk/qcom/clk-rcg.c
> @@ -526,6 +526,19 @@ static int clk_rcg_set_rate(struct clk_hw *hw, unsigned long rate,
>  	return __clk_rcg_set_rate(rcg, f);
>  }
>  
> +static int clk_rcg_set_floor_rate(struct clk_hw *hw, unsigned long rate,
> +				  unsigned long parent_rate)
> +{
> +	struct clk_rcg *rcg = to_clk_rcg(hw);
> +	const struct freq_tbl *f;
> +
> +	f = qcom_find_freq_floor(rcg->freq_tbl, rate);
> +	if (!f)
> +		return -EINVAL;
> +
> +	return __clk_rcg_set_rate(rcg, f);
> +}
> +
>  static int clk_rcg_bypass_set_rate(struct clk_hw *hw, unsigned long rate,
>  				unsigned long parent_rate)
>  {
> @@ -816,6 +829,17 @@ const struct clk_ops clk_rcg_ops = {
>  };
>  EXPORT_SYMBOL_GPL(clk_rcg_ops);
>  
> +const struct clk_ops clk_rcg_floor_ops = {
> +	.enable = clk_enable_regmap,
> +	.disable = clk_disable_regmap,
> +	.get_parent = clk_rcg_get_parent,
> +	.set_parent = clk_rcg_set_parent,
> +	.recalc_rate = clk_rcg_recalc_rate,
> +	.determine_rate = clk_rcg_determine_rate,
> +	.set_rate = clk_rcg_set_floor_rate,
> +};
> +EXPORT_SYMBOL_GPL(clk_rcg_floor_ops);
> +
>  const struct clk_ops clk_rcg_bypass_ops = {
>  	.enable = clk_enable_regmap,
>  	.disable = clk_disable_regmap,
> -- 
> 2.34.1
> 
