Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27C544D7712
	for <lists+linux-arm-msm@lfdr.de>; Sun, 13 Mar 2022 18:08:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232582AbiCMRJn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 13 Mar 2022 13:09:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235087AbiCMRJn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 13 Mar 2022 13:09:43 -0400
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E20D9125509
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Mar 2022 10:08:34 -0700 (PDT)
Received: by mail-ot1-x329.google.com with SMTP id 17-20020a9d0611000000b005b251571643so10187024otn.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Mar 2022 10:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=wDQcvU3O9fegsU0DwY4l35rHZ7y0JZdDaFDAx9WQ1dU=;
        b=Q+Wbckw1wonK4yRmxurG1PH1PNHun6axBbji+9LuL+tHhKxPXlo7IrI2MOPawYlohb
         ra6peV+zwWrDVClFIyfp2NMwKnhhpz3dIFfqy4Z4ewRa984IIXy/EeOXIgehHMjmhwsh
         GhpIIGRgvXosftqW+pbxe8nS5OY0L+uSJwt/ldYCkkGp0qcNrA4E5pIMXBdUwjfnez08
         TPFf1PPjKcxm/Tdb9AYhK+9Ij1arJXseL6Hxa4P0p0VWWJN7boRcRhrKIbwPEJMJicJK
         /HUbMRFljD9bOsfTJkx7XVzK+JHST/gO3TqBY/ZQxJO0UEnUER5Cyca1zfmj+YlSSGby
         dEvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wDQcvU3O9fegsU0DwY4l35rHZ7y0JZdDaFDAx9WQ1dU=;
        b=c3Dx5DQBOGQ29HDd52oOkwNnJdHEOLDl140tTvRAE7KHb/byNVHs3FM1jSoQDQhpf2
         +6T6tbar9VDNOzQDELYwwRpV9P8zHNi5Iqpct36Nf57bpKg2Gg8oO2j5DytgXdj3sz2Q
         6RxmtP3lllL8ESnANWFVWQdUtN1b8VmDHQG8NEbdozlJ66321QfCCZGm5Lt8hrTDNvfE
         xnYNYvqs8Hh28ZFN/9Y3IuS2wFztEsiOTkrlXra9eHqtv3jgYKgJt9Gt4eXc2tVRCsXh
         OKcmXssE06nxFjW0cwj2Blajz/QIsvsAjtHr3YmJEcfECTW1SNz/UmyKzw59cMDgd39k
         fCDw==
X-Gm-Message-State: AOAM533vYyl8gsRSvQ0gmQAtEJgJKkMUXho62DgxT0f/k5L2p68Eyry4
        rwvdNZOoSQ54KHgxwh/LfGjMWg==
X-Google-Smtp-Source: ABdhPJzcwjyugEwV5BMAAsC7aKlOM3HeMr6tjC5lrbs1q5DYKLztpI8FpviNUWzfXtStO8dIira72Q==
X-Received: by 2002:a05:6830:1548:b0:5b2:3046:5b9a with SMTP id l8-20020a056830154800b005b230465b9amr9368016otp.286.1647191314232;
        Sun, 13 Mar 2022 10:08:34 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id y16-20020a9d6350000000b005c9653ab377sm36166otk.17.2022.03.13.10.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Mar 2022 10:08:33 -0700 (PDT)
Date:   Sun, 13 Mar 2022 12:08:32 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Krzysztof Wilczy??ski <kw@linux.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Prasad Malisetty <quic_pmaliset@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pci@vger.kernel.org
Subject: Re: [RFC PATCH 2/5] clk: qcom: gcc-sm8450: use new
 clk_regmap_mux_safe_ops for PCIe pipe clocks
Message-ID: <Yi4lEL9qldDMZgA4@builder.lan>
References: <20220313000824.229405-1-dmitry.baryshkov@linaro.org>
 <20220313000824.229405-3-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220313000824.229405-3-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat 12 Mar 18:08 CST 2022, Dmitry Baryshkov wrote:

> Use newly defined clk_regmap_mux_safe_ops for PCIe pipe clocks to let
> the clock framework automatically park the clock when the clock is
> switched off and restore the parent when the clock is switched on.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  drivers/clk/qcom/gcc-sm8450.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gcc-sm8450.c b/drivers/clk/qcom/gcc-sm8450.c
> index 593a195467ff..a5323d20bc0d 100644
> --- a/drivers/clk/qcom/gcc-sm8450.c
> +++ b/drivers/clk/qcom/gcc-sm8450.c
> @@ -243,13 +243,14 @@ static struct clk_regmap_mux gcc_pcie_0_pipe_clk_src = {
>  	.reg = 0x7b060,
>  	.shift = 0,
>  	.width = 2,
> +	.safe_src_index = 2,
>  	.parent_map = gcc_parent_map_4,
>  	.clkr = {
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_pcie_0_pipe_clk_src",
>  			.parent_data = gcc_parent_data_4,
>  			.num_parents = ARRAY_SIZE(gcc_parent_data_4),
> -			.ops = &clk_regmap_mux_closest_ops,
> +			.ops = &clk_regmap_mux_safe_ops,
>  		},
>  	},
>  };
> @@ -273,13 +274,14 @@ static struct clk_regmap_mux gcc_pcie_1_pipe_clk_src = {
>  	.reg = 0x9d064,
>  	.shift = 0,
>  	.width = 2,
> +	.safe_src_index = 2,
>  	.parent_map = gcc_parent_map_6,
>  	.clkr = {
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_pcie_1_pipe_clk_src",
>  			.parent_data = gcc_parent_data_6,
>  			.num_parents = ARRAY_SIZE(gcc_parent_data_6),
> -			.ops = &clk_regmap_mux_closest_ops,
> +			.ops = &clk_regmap_mux_safe_ops,
>  		},
>  	},
>  };
> -- 
> 2.34.1
> 
