Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C46B15708A6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Jul 2022 19:08:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230494AbiGKRIC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Jul 2022 13:08:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230036AbiGKRIB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Jul 2022 13:08:01 -0400
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com [IPv6:2607:f8b0:4864:20::f36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 942572C134
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jul 2022 10:08:00 -0700 (PDT)
Received: by mail-qv1-xf36.google.com with SMTP id d17so806040qvs.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jul 2022 10:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wWcvYvacvD8N8pcx60t/vSUQTr5iBONKiVXdnTKPElY=;
        b=hOeLS2jTOqNMJXllVkjPxyOh9QyOBElTgjCJz0L+yC+3W9UQDw8rHggLAS/L/KpdEJ
         34DVd5BpJCtkVJI8v++Lf7DyZRgtfa06CQNG+M4EwmoXt32j5BkWrm5gIeCav30Zn6Qa
         6zYxBqPJdX04We78iNWuy2RsaNUkrufURHdUt+o0XvMwJqsIE0MxTf8ljHFHQ702zo3f
         KLdpFnSxgXyLN5T9kEhmOBiIzmtG4XKYK5TciFi3fK0ObdQviFwC61EmtiyhoZG7yLXP
         1ZzYXfpsNZTWOExzoBfT4At3hlklIPtsMr3kYfgsUSgi5jsQdkEB5O2eujgzjeaMN7n+
         BNAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wWcvYvacvD8N8pcx60t/vSUQTr5iBONKiVXdnTKPElY=;
        b=40c0/tPCVSYP2UrSwZWxZWTfhcvLXMZ1e98MNpkllaO68YX3VggWMQQ2oj6QerrvmV
         3BnU2ngTbEUHn9+54j4PyTwBlDGv2RHdzFq3+1sl/j2igkGMsN6++xv06uTAX0jD9l6K
         CDLyl1Sotlp04XjwmujeQKbsu/UMCmGXQx8+UTHO9/aU7ks7t7F35NdBUKwJBFvF5S0s
         HsuMKoydm3D2eVB00pFRD7BP9oEUP3THFzsaDFcHwiwCwH+2fTXwIqacUIK03lLuHzoH
         xJOZqF+1SzrX5MdslgS1P7tBMsji66o6he8fgmI7iB7DFjnbLTIK4iS+8aLyjR7gQoup
         /xfA==
X-Gm-Message-State: AJIora9U8fKZ4UiUIa3XdMPEW01EUozdABharZBK3/Sw5iVs+fz2ZIjl
        W6QevhJWRnJ7Y1a/B9M+4I8E/AnEG0TNGTooTaWwtA==
X-Google-Smtp-Source: AGRyM1tuHzXpJtx7yTkOQUhvNHpR+JwZ1+CpX+7GCj/1c16E9RRHBJO8NTioymnSxwYptVpdWinnRIR491eHxiEZsXA=
X-Received: by 2002:a05:6214:d03:b0:473:7764:2ab with SMTP id
 3-20020a0562140d0300b00473776402abmr2519187qvh.119.1657559279665; Mon, 11 Jul
 2022 10:07:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220711163021.152578-1-nathan@kernel.org>
In-Reply-To: <20220711163021.152578-1-nathan@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Mon, 11 Jul 2022 20:07:48 +0300
Message-ID: <CAA8EJpoDe5-_jd-zDRsPV06QVah1266YT2fBSWYT7GSTR2K9wA@mail.gmail.com>
Subject: Re: [PATCH] clk: qcom: gpucc-sm8350: Fix "initializer element is not
 constant" error
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tom Rix <trix@redhat.com>,
        Robert Foss <robert.foss@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
        kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 11 Jul 2022 at 19:30, Nathan Chancellor <nathan@kernel.org> wrote:
>
> When building with clang or GCC older than 8, errors along the following
> lines occur:
>
>   drivers/clk/qcom/gpucc-sm8350.c:111:2: error: initializer element is not a compile-time constant
>           gpu_cc_parent,
>           ^~~~~~~~~~~~~
>   drivers/clk/qcom/gpucc-sm8350.c:126:2: error: initializer element is not a compile-time constant
>           gpu_cc_parent,
>           ^~~~~~~~~~~~~
>   2 errors generated.
>
> The C standard allows an implementation to accept other forms of
> constant expressions, which GCC 8+ has chosen to do, but it is not
> required. To fix this error with clang and older supported versions of
> GCC, use a macro so that the expression can be used in a designated
> initializer.
>
> Fixes: 160758b05ab1 ("clk: qcom: add support for SM8350 GPUCC")
> Link: https://github.com/ClangBuiltLinux/linux/issues/1660
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  drivers/clk/qcom/gpucc-sm8350.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/clk/qcom/gpucc-sm8350.c b/drivers/clk/qcom/gpucc-sm8350.c
> index d13fa813d190..9390723f6e40 100644
> --- a/drivers/clk/qcom/gpucc-sm8350.c
> +++ b/drivers/clk/qcom/gpucc-sm8350.c
> @@ -51,9 +51,9 @@ static const struct alpha_pll_config gpu_cc_pll0_config = {
>         .user_ctl_hi1_val = 0x00000000,
>  };
>
> -static const struct clk_parent_data gpu_cc_parent = {
> -       .fw_name = "bi_tcxo",
> -};
> +#define GPU_CC_PARENT_INIT { .fw_name = "bi_txco", }

Please inline this macro. It adds no additional value in my opinion

> +
> +static const struct clk_parent_data gpu_cc_parent = GPU_CC_PARENT_INIT;
>
>  static struct clk_alpha_pll gpu_cc_pll0 = {
>         .offset = 0x0,
> @@ -108,7 +108,7 @@ static const struct parent_map gpu_cc_parent_map_0[] = {
>  };
>
>  static const struct clk_parent_data gpu_cc_parent_data_0[] = {
> -       gpu_cc_parent,
> +       GPU_CC_PARENT_INIT,
>         { .hw = &gpu_cc_pll0.clkr.hw },
>         { .hw = &gpu_cc_pll1.clkr.hw },
>         { .fw_name = "gcc_gpu_gpll0_clk_src" },
> @@ -123,7 +123,7 @@ static const struct parent_map gpu_cc_parent_map_1[] = {
>  };
>
>  static const struct clk_parent_data gpu_cc_parent_data_1[] = {
> -       gpu_cc_parent,
> +       GPU_CC_PARENT_INIT,
>         { .hw = &gpu_cc_pll1.clkr.hw },
>         { .fw_name = "gcc_gpu_gpll0_clk_src" },
>         { .fw_name = "gcc_gpu_gpll0_div_clk_src" },
>
> base-commit: 0dd8e16bfbc003b009f843e75fae4046daa08fe9
> --
> 2.37.0
>


-- 
With best wishes
Dmitry
