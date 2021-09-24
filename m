Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAA9D416A7A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Sep 2021 05:37:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244019AbhIXDjT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Sep 2021 23:39:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244035AbhIXDjT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Sep 2021 23:39:19 -0400
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0EE5C061757
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Sep 2021 20:37:46 -0700 (PDT)
Received: by mail-oi1-x234.google.com with SMTP id z11so12739675oih.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Sep 2021 20:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=5tH8+71U+tMhDbr5VvxKjlEaLKBbN/N6oFTBsFjsdas=;
        b=x5srfLC4tU73ivbHkAUo3BNYxdybqkWommnBng3J6jiH/9ip2+JE++6L+lmvVSb/3/
         3aw7z4qhoS4FIjGpj2T4Ty7Alyt8SIy0RNs8UAsuVuBmfucvbm38D7qBn/9Mki47SEuV
         uuNOJ0/ybmuLZLuvnmI6dNXyyU0KT3DMorHqi0e+NhPH+m/jiks5345KzOt5UALEJBH4
         GUGdnqSadmmFdgl+vS3zdqUOBt64v8Bwq0qQySYa0VNp/yxrZoePxW4WUvrXL7NT0c3Q
         CcEyRpkJurp8RDFcK9wKGTVQIQZ5OLGNCKc/BSSxSsbZ3IVn9Ac35tOPhbuCtiiRBmC0
         WR7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5tH8+71U+tMhDbr5VvxKjlEaLKBbN/N6oFTBsFjsdas=;
        b=1VJr6CGlW0wbp4IpC2Wfnbt+NF4BtTJnzSCGUzKLYPOUBHoiBNbwN08OZRRD4aQRHb
         cPKMEsycL2z7DpCrpxmzWkPTLzcZvMkCXd5qNpd9f2L5Hx8sULGtPpe8DYFcMqefqyyd
         1Z3xWhypU6/mCPYzjBeA1jS+mHZllyd1ZB42vZREG6U3TFD2oFefM+iUB+NlIRoFAfyg
         P18HIfVbg4/LLu+DiqpmMtkTXFyhvSaZ1WYOkABIOlUbgocxBToLCJNNs4OeHqCsgYNA
         xkxbHbrBX8GdlwYUZxlykkm8BBUf6B9QI8HsFVQf/0yGF6iUstgtVjNfxKXgtkRy8xhL
         gj3g==
X-Gm-Message-State: AOAM530Nx5OHMTgGuo6zFWC9qZEuiWbqwQIRatrRo3/gzpgAcE1TGImC
        HWBj8N8+UekhvAeFqr9jXQ1TT9uLYmvtMw==
X-Google-Smtp-Source: ABdhPJzZ7NAPzJ+LAkAaSOsBvzzJHQPGKmlySJGz2arEVxHtrXty5IMClXtNBSjca083y81xL3Lw8w==
X-Received: by 2002:a05:6808:697:: with SMTP id k23mr6649239oig.128.1632454666166;
        Thu, 23 Sep 2021 20:37:46 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id g21sm580417ooc.31.2021.09.23.20.37.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Sep 2021 20:37:45 -0700 (PDT)
Date:   Thu, 23 Sep 2021 22:37:43 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        Mike Tipton <mdtipton@codeaurora.org>
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [RFC] clk: Allow forcing an unused clock to be disabled
Message-ID: <YU1IB6M91/wb6xoo@builder.lan>
References: <20210707043859.195870-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210707043859.195870-1-bjorn.andersson@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 06 Jul 23:38 CDT 2021, Bjorn Andersson wrote:

> The process of disabling unused clocks will skip clocks that are not
> enabled by Linux, but doesn't implement the is_enabled() callback to
> read back the hardware state. In the case that it's determined that the
> parent clock is enabled this might be turned off, causing the skipped
> clock to lock up.
> 
> One such case is the RCG "mdp_clk_src" in the Qualcomm SDM845, which at
> boot is parented by "disp_cc_pll0", which during clk_disable_unused() is
> left untouched, while the parent is disabled.
> 
> Later the typical next operation for "mdp_clk_src" is an
> assigned-clock-rates will cause the next enable attempt to reparent the
> RCG. But the RCG needs both the old and new parent to be ticking to
> perform this switch and will therefor not complete.
> 
> Introduce a new flag for clock drivers to mark that clocks that should
> be assumed to be enabled even when is_enabled isn't implemented and mark
> the "mdp_clk_src" clock for SDM845 as such.
> This allows the driver to transition the RCG from the PLL to a clock
> source that is known to be enabled when the future reparenting operation
> is undertaken.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> Naturally this patch should be split in a core and driver part, but for the
> sake of the RFC I made both changes in the same patch.
> 

Ping?

>  drivers/clk/clk.c                | 2 +-
>  drivers/clk/qcom/dispcc-sdm845.c | 1 +
>  include/linux/clk-provider.h     | 2 ++
>  3 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 65508eb89ec9..9e4789d106f3 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -1265,7 +1265,7 @@ static void __init clk_disable_unused_subtree(struct clk_core *core)
>  	 * sequence.  call .disable_unused if available, otherwise fall
>  	 * back to .disable
>  	 */
> -	if (clk_core_is_enabled(core)) {
> +	if (clk_core_is_enabled(core) || core->flags & CLK_ASSUME_ENABLED_BOOT) {
>  		trace_clk_disable(core);
>  		if (core->ops->disable_unused)
>  			core->ops->disable_unused(core->hw);
> diff --git a/drivers/clk/qcom/dispcc-sdm845.c b/drivers/clk/qcom/dispcc-sdm845.c
> index 735adfefc379..046f7e656f7c 100644
> --- a/drivers/clk/qcom/dispcc-sdm845.c
> +++ b/drivers/clk/qcom/dispcc-sdm845.c
> @@ -267,6 +267,7 @@ static struct clk_rcg2 disp_cc_mdss_mdp_clk_src = {
>  		.parent_data = disp_cc_parent_data_3,
>  		.num_parents = ARRAY_SIZE(disp_cc_parent_data_3),
>  		.ops = &clk_rcg2_shared_ops,
> +		.flags = CLK_ASSUME_ENABLED_BOOT,
>  	},
>  };
>  
> diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
> index 162a2e5546a3..d00ca925842c 100644
> --- a/include/linux/clk-provider.h
> +++ b/include/linux/clk-provider.h
> @@ -32,6 +32,8 @@
>  #define CLK_OPS_PARENT_ENABLE	BIT(12)
>  /* duty cycle call may be forwarded to the parent clock */
>  #define CLK_DUTY_CYCLE_PARENT	BIT(13)
> +/* assume clock is enabled if found unused in late init */
> +#define CLK_ASSUME_ENABLED_BOOT	BIT(14)
>  
>  struct clk;
>  struct clk_hw;
> -- 
> 2.29.2
> 
