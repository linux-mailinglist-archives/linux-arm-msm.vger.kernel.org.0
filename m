Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6AFA5117016
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2019 16:14:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726379AbfLIPOy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Dec 2019 10:14:54 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:34112 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726197AbfLIPOy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Dec 2019 10:14:54 -0500
Received: by mail-wr1-f66.google.com with SMTP id t2so16662085wrr.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Dec 2019 07:14:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zaRznLEbJBIMqX9o54B5wFHWmYjPD7jwFecsyE0QNCE=;
        b=wtlAWzvePiDH0QT8OK1VXY+PL23lqTyo2nYCue2Am5RSCAZbd7g0Q4B9ofL9D2bJ8J
         whN0Sulbm+PXIPBCPiwTkW8U7D/ZuvxMdhMBOJsOPY7OK7/klmAT/8cuW4zMZQ8pUI9F
         fiYWZOEv2WAMAYa1tHTKDVqJrLQEnkFmXGWLbbmUpelaDRIC/fTm3Uhn1fJ6DRPMi8c4
         sT2Va3vi0pfKuv19QMTw7OpsjNO5GXgttYQUJ74GKNp0OOi2D5DpvsLCzbz5Vm4Q9zNO
         aWXvHnyjc5FlcyQWV8tULsd1i61pqvuwBkmCmEBc9c4JRZZkHJrTjuCofQFSSjZ0tWTL
         TSoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zaRznLEbJBIMqX9o54B5wFHWmYjPD7jwFecsyE0QNCE=;
        b=T1nW5+SeGtaPIr8CKP+fm8ViGvAtfMcTqO8XzUwswgTG36uactnq89jl0R4uaQMHq2
         dnAP9e62cmCfF2kvcYqAqNLT8smL7VWRVzAnnd09PO5d20p9f5MHZ6h7B4uF1L4qatA6
         niIxKU05AV2tVm4cgQWfdnQFCtXWceIqSzJKrr0Ukgytk5TKaooTnrr8Fc9B4F3u4p3t
         livlNPZo4WG0SWYn52ktyzt3kg1/nPPyUthdp7YUutAk4rMTG4xkfRJN53wVL1yDXCEj
         +rJgjF6c5eyGM3Wt+ErZsU0HrgxpJLXcgXnghq6wJnBAvfgSbHwFGxe6c1hVjTrL9lKe
         Q7Zw==
X-Gm-Message-State: APjAAAUw6cpT8uspgcgrx6oXDBs14C0TuJ2qtW96apks432JBpjHgPCX
        +Alb6NsmPRp3tdsUmML13jHqtpO0Xh/EgtXNZcu/Rw==
X-Google-Smtp-Source: APXvYqzWh2fV9N35ufjeGu6GWhEuXFTo+WSnH/1Oe2r5mpe2lK976TzEAEjHpPbxT9IIQZjiStl0KIO3ImGrR+/WYOE=
X-Received: by 2002:adf:81c2:: with SMTP id 60mr2729391wra.8.1575904492252;
 Mon, 09 Dec 2019 07:14:52 -0800 (PST)
MIME-Version: 1.0
References: <20191205161505.15295-1-p.pisati@gmail.com> <20191205161505.15295-2-p.pisati@gmail.com>
In-Reply-To: <20191205161505.15295-2-p.pisati@gmail.com>
From:   Amit Pundir <amit.pundir@linaro.org>
Date:   Mon, 9 Dec 2019 20:44:16 +0530
Message-ID: <CAMi1Hd3o68WhMvy75rgN=K-xQuHysj5VzB3izoq7T0S-7RetUA@mail.gmail.com>
Subject: Re: [PATCH 1/6] clk: qcom: Drop gcc_aggre1_pnoc_ahb_clk clock
To:     Paolo Pisati <p.pisati@gmail.com>,
        Rajendra Nayak <rnayak@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch of mine was more of a stopgap fix. Adding Rajendra, who
authored "clk: qcom: Add some missing gcc clks for msm8996", for
review.

On Thu, 5 Dec 2019 at 21:45, Paolo Pisati <p.pisati@gmail.com> wrote:
>
> From: Amit Pundir <amit.pundir@linaro.org>
>
> Clock "gcc_aggre1_pnoc_ahb_clk" added in QcomLT commit 9a108d744fda
> ("clk: qcom: Add some missing gcc clks for msm8996"), broke USB
> gagdets for db820c. So drop it for now and re-visit the dropped
> changes while submitting it upstream.
>
> Fixes: 9a108d744fda ("clk: qcom: Add some missing gcc clks for msm8996")

Also this ^^ is not upstream commit. Upstream commit is:
b567752144e3 ("clk: qcom: Add some missing gcc clks for msm8996")

Regards,
Amit Pundir

> Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
> ---
>  drivers/clk/qcom/gcc-msm8996.c | 15 ---------------
>  1 file changed, 15 deletions(-)
>
> diff --git a/drivers/clk/qcom/gcc-msm8996.c b/drivers/clk/qcom/gcc-msm8996.c
> index d004cda..c1e1148 100644
> --- a/drivers/clk/qcom/gcc-msm8996.c
> +++ b/drivers/clk/qcom/gcc-msm8996.c
> @@ -2937,20 +2937,6 @@ static struct clk_branch gcc_smmu_aggre0_ahb_clk = {
>         },
>  };
>
> -static struct clk_branch gcc_aggre1_pnoc_ahb_clk = {
> -       .halt_reg = 0x82014,
> -       .clkr = {
> -               .enable_reg = 0x82014,
> -               .enable_mask = BIT(0),
> -               .hw.init = &(struct clk_init_data){
> -                       .name = "gcc_aggre1_pnoc_ahb_clk",
> -                       .parent_names = (const char *[]){ "periph_noc_clk_src" },
> -                       .num_parents = 1,
> -                       .ops = &clk_branch2_ops,
> -               },
> -       },
> -};
> -
>  static struct clk_branch gcc_aggre2_ufs_axi_clk = {
>         .halt_reg = 0x83014,
>         .clkr = {
> @@ -3453,7 +3439,6 @@ static struct clk_regmap *gcc_msm8996_clocks[] = {
>         [GCC_AGGRE0_CNOC_AHB_CLK] = &gcc_aggre0_cnoc_ahb_clk.clkr,
>         [GCC_SMMU_AGGRE0_AXI_CLK] = &gcc_smmu_aggre0_axi_clk.clkr,
>         [GCC_SMMU_AGGRE0_AHB_CLK] = &gcc_smmu_aggre0_ahb_clk.clkr,
> -       [GCC_AGGRE1_PNOC_AHB_CLK] = &gcc_aggre1_pnoc_ahb_clk.clkr,
>         [GCC_AGGRE2_UFS_AXI_CLK] = &gcc_aggre2_ufs_axi_clk.clkr,
>         [GCC_AGGRE2_USB3_AXI_CLK] = &gcc_aggre2_usb3_axi_clk.clkr,
>         [GCC_QSPI_AHB_CLK] = &gcc_qspi_ahb_clk.clkr,
> --
> 2.7.4
>
