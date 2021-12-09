Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0D0346F349
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Dec 2021 19:39:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229504AbhLISmw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Dec 2021 13:42:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229487AbhLISmv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Dec 2021 13:42:51 -0500
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21306C0617A1
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Dec 2021 10:39:18 -0800 (PST)
Received: by mail-ot1-x336.google.com with SMTP id h19-20020a9d3e53000000b0056547b797b2so7147287otg.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Dec 2021 10:39:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=3Sn2+7MDJO3cjYGn8rzHVVGgbKOroIrbj25OALkURQ0=;
        b=RektemzBcVJ+OueCG11Q6mbEt6SCJb7yk7K91WMvCsuwEMclDw/TOu/ALHkvDw3hNN
         kxTVvwm1IQoOxovWXmYhvy4pdIsCw4OOQyALJjbinC2YiwccJ4flSBKzY+hiiebrv+5H
         enlqMV75rl46RgdtkHjz9cCbI7PZDE0nUtbu4le7R6JZa3rJVB3Yr10o+1WhjGxGrL/e
         ZMMiemBidsR6lqLO1TppJO6fyMBpzhwTgM5oc4BalhZQbYgBNnCk9CkdQ9z0KcE5xr4b
         7eHJGDbb/jNVuZpoHOpZRUwSXYW9S5O/IxnL1EnKE9/k6QljKqZfXb59IxqsFLFgxD8w
         y/fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3Sn2+7MDJO3cjYGn8rzHVVGgbKOroIrbj25OALkURQ0=;
        b=ReTLSKx88OrUxnpWtknHfkFIIcJYHJcOUUf9UZqyO4zrNj6NTpcUCR55GoQz3rf6a3
         AhLOlDrE/pco6ZSI95qNlqJYNa7e0T+5euFv2zSMlODrpZE/x38BBVAtFG7Y0WpAhVCK
         5W7CvEIWDmW8veO3dwlW/9iUhEg5q3PjhmClOBXXuC6cEWs0MvefRiab4oTUI10a3ISC
         t+OFsUhb/fyIigS1jeoFxp9sg/EZpu6eU98jLUN/JZy+Ho3DQ+2n3rnIxF9YiS2MvAGQ
         U0kOOPDkaymcA1quCB1bCEWU0FMSsd8NkrrrMA1XDFmGso5kXQIeR3n6OwVZrnh/Io0y
         mgwg==
X-Gm-Message-State: AOAM530/M1bv1w2TmCFV1Jb1D6oCIpb9uL4AwXstV/PKfYmtOgpkCGHD
        /9DS24o113hHorqHzZSJw1RDHw==
X-Google-Smtp-Source: ABdhPJxz1XTm0VpC6tKn9XVTH26bVDpJeZGMyEZWt8PIxc/YVR1WqWX9PkiTbHf0xBp/2srjqBx/AQ==
X-Received: by 2002:a05:6830:2806:: with SMTP id w6mr6980232otu.382.1639075157381;
        Thu, 09 Dec 2021 10:39:17 -0800 (PST)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id bg38sm143272oib.40.2021.12.09.10.39.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 10:39:16 -0800 (PST)
Date:   Thu, 9 Dec 2021 10:40:39 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 2/2] clk: qcom: dispcc-sdm845: park
 disp_cc_mdss_mdp_clk_src
Message-ID: <YbJNp+tnD6kEQAzt@ripper>
References: <20211208022210.1300773-1-dmitry.baryshkov@linaro.org>
 <20211208022210.1300773-3-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211208022210.1300773-3-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 07 Dec 18:22 PST 2021, Dmitry Baryshkov wrote:

> To stop disp_cc_mdss_mdp_clk_src from getting stuck during boot if it
> was enabled by the bootloader, part it to the TCXO clock source.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/clk/qcom/dispcc-sdm845.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/clk/qcom/dispcc-sdm845.c b/drivers/clk/qcom/dispcc-sdm845.c
> index 735adfefc379..f2afbba7bc72 100644
> --- a/drivers/clk/qcom/dispcc-sdm845.c
> +++ b/drivers/clk/qcom/dispcc-sdm845.c
> @@ -858,6 +858,9 @@ static int disp_cc_sdm845_probe(struct platform_device *pdev)
>  
>  	clk_fabia_pll_configure(&disp_cc_pll0, regmap, &disp_cc_pll0_config);
>  
> +	/* Park disp_cc_mdss_mdp_clk_src */
> +	clk_rcg2_park_safely(regmap, 0x2088, 0);

Today booting the system with "clk_ignore_unused" will give you a
working efifb up until the point where the display driver kicks in and
reinitializes the hardware state - which during development might be
indefinite.

If we blindly cut the mdp_clk_src here that will no longer be possible.

Regards,
Bjorn

> +
>  	/* Enable hardware clock gating for DSI and MDP clocks */
>  	regmap_update_bits(regmap, 0x8000, 0x7f0, 0x7f0);
>  
> -- 
> 2.33.0
> 
