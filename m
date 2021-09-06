Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54BBD401963
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Sep 2021 12:02:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241537AbhIFKDH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Sep 2021 06:03:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241501AbhIFKDG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Sep 2021 06:03:06 -0400
Received: from relay03.th.seeweb.it (relay03.th.seeweb.it [IPv6:2001:4b7a:2000:18::164])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AD39C061757
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Sep 2021 03:02:01 -0700 (PDT)
Received: from Marijn-Arch-PC.localdomain (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 640761F4AB;
        Mon,  6 Sep 2021 12:01:57 +0200 (CEST)
Date:   Mon, 6 Sep 2021 12:01:56 +0200
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        jamipkettunen@somainline.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 6/9] clk: qcom: gcc-msm8994: Remove the inexistent
 GDSC_PCIE
Message-ID: <20210906100156.jvdn3hjtot4c6uaq@Marijn-Arch-PC.localdomain>
References: <20210904183014.43528-1-konrad.dybcio@somainline.org>
 <20210904183014.43528-6-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210904183014.43528-6-konrad.dybcio@somainline.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-09-04 20:30:10, Konrad Dybcio wrote:
> This GDSC is not present on msm8994.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---
> [no changes since v2]
> 
>  drivers/clk/qcom/gcc-msm8994.c | 11 ++---------
>  1 file changed, 2 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gcc-msm8994.c b/drivers/clk/qcom/gcc-msm8994.c
> index 98b2fd429629..2ed206ecb60d 100644
> --- a/drivers/clk/qcom/gcc-msm8994.c
> +++ b/drivers/clk/qcom/gcc-msm8994.c
> @@ -2485,14 +2485,6 @@ static struct clk_branch gcc_prng_ahb_clk = {
>  	},
>  };
>  
> -static struct gdsc pcie_gdsc = {
> -		.gdscr = 0x1e18,
> -		.pd = {
> -			.name = "pcie",
> -		},
> -		.pwrsts = PWRSTS_OFF_ON,
> -};
> -
>  static struct gdsc pcie_0_gdsc = {
>  		.gdscr = 0x1ac4,
>  		.pd = {
> @@ -2682,7 +2674,8 @@ static struct clk_regmap *gcc_msm8994_clocks[] = {
>  };
>  
>  static struct gdsc *gcc_msm8994_gdscs[] = {
> -	[PCIE_GDSC] = &pcie_gdsc,
> +	/* This GDSC does not exist, but ABI has to remain intact */
> +	[PCIE_GDSC] = NULL,

You could possibly leave this out since unspecified array elements are
always initialized to NULL, and place the comment on the #define of
PCIE_GDSC in the dt-bindings header instead?

Alternatively you could rename that define to PCIE_GDSC_DEPRECATED so
that any (out of tree) DT referencing it will be alerted of this change
at compile-time instead of finding a NULL-gdsc at runtime?

>  	[PCIE_0_GDSC] = &pcie_0_gdsc,
>  	[PCIE_1_GDSC] = &pcie_1_gdsc,
>  	[USB30_GDSC] = &usb30_gdsc,
> -- 
> 2.33.0
> 
