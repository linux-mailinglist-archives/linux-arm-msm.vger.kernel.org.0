Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9FCD3507F14
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Apr 2022 04:47:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230054AbiDTCuA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Apr 2022 22:50:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238819AbiDTCt7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Apr 2022 22:49:59 -0400
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A21AF38782
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Apr 2022 19:47:15 -0700 (PDT)
Received: by mail-oi1-x22b.google.com with SMTP id z8so650885oix.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Apr 2022 19:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=84Z8Ou62HiUqb8n4/xIdxq8unXBMW3W4N2w/x005ArY=;
        b=iruwlQMQmkHPdfb5AUtOdH7s6RB4z+YA3vS74UUFPPoI9qTD2pH2mcQTnXg78CVToG
         Q5zsNfXphSO1QQAk/vj3875wHTzoeSlZ2vXJO7asCXN5yVk/jZK7KSzWIN+zQrtjHSzC
         JgLnEjBkjJMfRSqoiGAfGUFtMKk5Qd1MHOcNNK9rXQ2N79STDLNknk3YsCQqROd8eqDN
         K83lmvqOaYoK5rTmwC1AcQhk/7BiBVtX+7UPL3qdAkdGRGvB06YApqKCgowV1mMo16wa
         JdLAiTaTpGjpbImKUzleBacTZtMddsi30sZpK2RLjT2atcF2jhXSpjpCs7xbkuxbnlEa
         Bv0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=84Z8Ou62HiUqb8n4/xIdxq8unXBMW3W4N2w/x005ArY=;
        b=PT7gbdnlabOi7CELKuiTh9HhISRn5wCC0lIN6JXBs60vwXksxJkJ6qBiwIYWLNeim4
         0r64B//cp7xZd4wpgxCYpKPuQHXDUZz6dz4KGsDWRmowrN2qyWie4qx+JGiaGlenzwZX
         C1fZZgwmLw/bW92sNfZI3Oskn+5PCBBzwfhAZTXcf+tYg+Oa2bbG+qsYax9zBB700Uxx
         BWB7SNhvXTBlw/4RGcrYSsNIEvaROg4LzHeLDvTR9Es43j/2elD649mUkc85eR6/Is/r
         MtVM0KXK+8Ue+n2/t9ulHERjgISMT2StOwuJ0bkbZzriiPE/90qg+xQXcCeFxm6mPm7Y
         rxFw==
X-Gm-Message-State: AOAM533ehB7oUGF+LbLr5Iz27yQaB61cZpIwm0Z+QrvN4wJybk4MLDHg
        iMlIaPgCzkaEC/V225becm1tTw==
X-Google-Smtp-Source: ABdhPJwpUgs1fxza/ioCVfipQG6pgrpTluzQomDGAxienilt70kyO+VUXsamqwicKGfF+JtOL5M7+g==
X-Received: by 2002:a05:6808:140a:b0:2f9:a830:d12e with SMTP id w10-20020a056808140a00b002f9a830d12emr772201oiv.235.1650422835061;
        Tue, 19 Apr 2022 19:47:15 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id o19-20020a4a9593000000b0032176119e65sm6117380ooi.34.2022.04.19.19.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Apr 2022 19:47:14 -0700 (PDT)
Date:   Tue, 19 Apr 2022 21:47:12 -0500
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
Message-ID: <Yl90MENoa52cGtna@builder.lan>
References: <20220419235447.1586192-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220419235447.1586192-1-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
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
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Stephen, please pick this for -fixes.

Thanks,
Bjorn

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
