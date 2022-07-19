Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B6B65790ED
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Jul 2022 04:39:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235207AbiGSCjL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Jul 2022 22:39:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234271AbiGSCjH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Jul 2022 22:39:07 -0400
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com [IPv6:2001:4860:4864:20::35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A46312528F
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Jul 2022 19:39:06 -0700 (PDT)
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-10c0430e27dso28855539fac.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Jul 2022 19:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=wm/d7g9+Kn3JB5OGUKlcMYsTmYkIW1B3SgCJ+oJ3vPY=;
        b=qj+zm++BHUM19KuCYUWWGC9VksbbnkAY2Yoll9PG/f71LMcHVsVacpzH+ZJ8/rLpcx
         PcbhY+WSU6tmQCXl6m4z9IZcvrzlpUhVHZSuq8JhaMOSm7Ah+q+v52xxyx9BiQRbTcRN
         qzCFOwxpPNMqHX0dURrkwnM6OHvSJBSzVqR3u5yPRufyidgGW8QKucaqvvPJsjE/TF/L
         /d9vxXX9w++niTY41HYrIMTKAr1ocB7COLldmtw50NA8ijMPCwD+w3dOwNb9C9DnTHH2
         mkOa/AGa6wb6o1YNNEJNi+tu02kVBmMeU2RJWt5UwRNIK50wkYJ4naM0PqYMyl5fgPgl
         ZaYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wm/d7g9+Kn3JB5OGUKlcMYsTmYkIW1B3SgCJ+oJ3vPY=;
        b=WmV9tkM8yh+wVaId2IKNoYtMC92cd8c9Q4LGgLGlFPBaKSpFeQq29QUNOJv1/Y08jJ
         pT9pGPcoS1Zvi/83sbRpcbKa7JZC5X0HOO1dqQnAlxURFjvMyebDIOV6P/s9bz8Gdr/n
         nk0jTPryCIw9XowQzcvtrCLvDD7BB5hn2O8vTMXtj13aCJoM/sX8hejGMZEXBaUYsw+r
         K0IpHcA4harivx8c2+2WnPT5PfQemBndihYuON+zB1iZD10FcNhtOMJSM+fuIVbTYZny
         8z4thyPvBAKZcV81YRwMhQiTfqPau95BKMciCgSbFwYYSB6lQESxb04UeSjLWVrtsDQU
         +fxA==
X-Gm-Message-State: AJIora9jc3BkmHlsuJEtPd94MlcZA/GZ+Sxt7M+9coF7Og0BZUzNc0Us
        SqomFUb2mI6AxYhmk0XdI0qFDw==
X-Google-Smtp-Source: AGRyM1v9rzKtUFZreXzWZUMZg6qf4gz5UAJnvdDhJcDD7UtLWZLNDCLDmHphVGWEwgqoLgSXjbs7kw==
X-Received: by 2002:a05:6808:654:b0:33a:66b8:a7ef with SMTP id z20-20020a056808065400b0033a66b8a7efmr6406262oih.108.1658198346055;
        Mon, 18 Jul 2022 19:39:06 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id m3-20020a9d4003000000b0061c34f86b31sm5765168ote.5.2022.07.18.19.39.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 19:39:05 -0700 (PDT)
Date:   Mon, 18 Jul 2022 21:39:03 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: a53-pll: convert to use parent_data rather
 than parent_names
Message-ID: <YtYZR9tsfNw8OwvO@builder.lan>
References: <20220620010643.1533531-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220620010643.1533531-1-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun 19 Jun 20:06 CDT 2022, Dmitry Baryshkov wrote:

> Change a53-pll driver to use clk_parent_data rather than always looking
> up the xo clock in the system clock list.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/clk/qcom/a53-pll.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/a53-pll.c b/drivers/clk/qcom/a53-pll.c
> index 329d2c5356d8..f9c5e296dba2 100644
> --- a/drivers/clk/qcom/a53-pll.c
> +++ b/drivers/clk/qcom/a53-pll.c
> @@ -127,7 +127,9 @@ static int qcom_a53pll_probe(struct platform_device *pdev)
>  	if (!init.name)
>  		return -ENOMEM;
>  
> -	init.parent_names = (const char *[]){ "xo" };
> +	init.parent_data = &(const struct clk_parent_data){
> +		.fw_name = "xo", .name = "xo_board",

This used to look up the globally named clock "xo", now it picked up
"xo_board". If this is intentional, could you please update the commit
message to cover this part?

Thanks,
Bjorn

> +	};
>  	init.num_parents = 1;
>  	init.ops = &clk_pll_sr2_ops;
>  	pll->clkr.hw.init = &init;
> -- 
> 2.35.1
> 
