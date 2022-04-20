Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB60F507F19
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Apr 2022 04:48:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238819AbiDTCv1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Apr 2022 22:51:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244846AbiDTCv1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Apr 2022 22:51:27 -0400
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7A3738793
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Apr 2022 19:48:42 -0700 (PDT)
Received: by mail-ot1-x330.google.com with SMTP id i11-20020a9d4a8b000000b005cda3b9754aso240773otf.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Apr 2022 19:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=2eKNulS3qlhgDAvYpJZI0rmczwYonxuVadqbW93L0aw=;
        b=xJQQvbGeiv55LxOgRCAxCgC9ZiBXWIggFHAJQV+kqOo/UxUl+LQqeAmAvnk7ypXt5V
         se5zB4Ez70kwsW8uPe+64bZzeadkPOkPg3c8sFvMS74WiPjabZ/cEm+S8w5IBAt/POhJ
         20tph+hKKIc1Rt5DSHPY3ueFYM9+Us1NVQKXMKiMwDyAI7GC+sfbC7n6aZGfKTP0Qegc
         fiRyzh4V8hHOgAGEBcLA86KqxAW1G5RaVemUcn9F4tmgwawojJN5ZCfPvl+Icqdp65N4
         gcNhDqpjrch4yLNwUu5AUrXGNZSunusoxGSUhL2YamKpprMNvIT4vp1cDS3uSEFWGzH6
         lkhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2eKNulS3qlhgDAvYpJZI0rmczwYonxuVadqbW93L0aw=;
        b=YXj6jQ3ZH2q4ue6qa6u6wh15m6eEACRjdtjL41EWeqIQKdDz2pgFeT+eFVQ7+1lM64
         NopKMmvw6Os9bhqejl5iSKWVNDmJKVZi62IT3JPqp3b/C8rc1pdgp+EgJ03usN6FRGwJ
         T5dzsxLYz8Ji8m/jb7caRr3VMXucNCfEldev2KADyisbqT5Z4gyC0cfgyhlItThsbmIv
         WBRSsk8Is1a5DwIaSUop+orMJ7X4Jt3UEg7nUimizLbLRnmhbBjtQ/D0xbVR3kZJ6zeR
         hkk6uqzL9QcNxS/gfRzmsuogbfdNeyo2C0jke4Y0cyGyBT46yO0pbkfXZBYlSqaIfYzJ
         YYEA==
X-Gm-Message-State: AOAM5312nRPiRt3Bpyrnpm2Di8i7wA1LxezdsttC0I8mcSOJaLD1pINs
        Y7W0IKLVjsmY8GGv38PXSK4zVQ==
X-Google-Smtp-Source: ABdhPJyDQoZdetLa1WR+iC8qmsQIEGsOqkaYfUCgaps/vrkB92VYUqzJ5B11+iUsOjAXBVem+glQDg==
X-Received: by 2002:a9d:6d06:0:b0:605:4e8e:fe89 with SMTP id o6-20020a9d6d06000000b006054e8efe89mr3984218otp.329.1650422921576;
        Tue, 19 Apr 2022 19:48:41 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id bp17-20020a056808239100b00322c34c4afbsm1165291oib.25.2022.04.19.19.48.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Apr 2022 19:48:41 -0700 (PDT)
Date:   Tue, 19 Apr 2022 21:48:39 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Rob Clark <robdclark@gmail.com>,
        freedreno@lists.freedesktop.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH] clk: qcom: clk-rcg2: fix gfx3d frequency calculation
Message-ID: <Yl90hxm7+nbAV4cN@builder.lan>
References: <20220419235447.1586192-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220419235447.1586192-1-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 19 Apr 18:54 CDT 2022, Dmitry Baryshkov wrote:

> Since the commit 948fb0969eae ("clk: Always clamp the rounded rate"),
> the clk_core_determine_round_nolock() would clamp the requested rate
> between min and max rates from the rate request. Normally these fields
> would be filled by clk_core_get_boundaries() called from
> clk_round_rate().
> 
> However clk_gfx3d_determine_rate() uses a manually crafted rate request,
> which did not have these fields filled. Thus the requested frequency
> would be clamped to 0, resulting in weird frequencies being requested
> from the hardware.
> 
> Fix this by filling min_rate and max_rate to the values valid for the
> respective PLLs (0 and ULONG_MAX).
> 
> Fixes: 948fb0969eae ("clk: Always clamp the rounded rate")

Reported-by: Rob Clark <robdclark@chromium.org>

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/clk/qcom/clk-rcg2.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
> index f675fd969c4d..e9c357309fd9 100644
> --- a/drivers/clk/qcom/clk-rcg2.c
> +++ b/drivers/clk/qcom/clk-rcg2.c
> @@ -818,7 +818,7 @@ EXPORT_SYMBOL_GPL(clk_pixel_ops);
>  static int clk_gfx3d_determine_rate(struct clk_hw *hw,
>  				    struct clk_rate_request *req)
>  {
> -	struct clk_rate_request parent_req = { };
> +	struct clk_rate_request parent_req = { .min_rate = 0, .max_rate = ULONG_MAX };
>  	struct clk_rcg2_gfx3d *cgfx = to_clk_rcg2_gfx3d(hw);
>  	struct clk_hw *xo, *p0, *p1, *p2;
>  	unsigned long p0_rate;
> -- 
> 2.35.1
> 
