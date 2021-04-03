Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C6CC353384
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 Apr 2021 12:58:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236496AbhDCK6r (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 3 Apr 2021 06:58:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236484AbhDCK6q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 3 Apr 2021 06:58:46 -0400
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it [IPv6:2001:4b7a:2000:18::165])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C2C0C061788
        for <linux-arm-msm@vger.kernel.org>; Sat,  3 Apr 2021 03:58:42 -0700 (PDT)
Received: from [10.0.20.3] (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 46C832007C;
        Sat,  3 Apr 2021 12:57:56 +0200 (CEST)
Subject: Re: [PATCH v3 11/16] clk: qcom: dispcc-sdm845: convert to parent data
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20210402205804.96507-1-dmitry.baryshkov@linaro.org>
 <20210402205804.96507-12-dmitry.baryshkov@linaro.org>
From:   Marijn Suijten <marijn.suijten@somainline.org>
Message-ID: <962cc7f2-715e-4646-5071-e620aa29d9f6@somainline.org>
Date:   Sat, 3 Apr 2021 12:57:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210402205804.96507-12-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Dmitry,

On 4/2/21 10:57 PM, Dmitry Baryshkov wrote:
> Convert the clock driver to specify parent data rather than parent
> names, to actually bind using 'clock-names' specified in the DTS rather
> than global clock names.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/clk/qcom/dispcc-sdm845.c | 188 ++++++++++++++++---------------
>   1 file changed, 95 insertions(+), 93 deletions(-)
> 
> diff --git a/drivers/clk/qcom/dispcc-sdm845.c b/drivers/clk/qcom/dispcc-sdm845.c
> index 5c932cd17b14..bf5e8a4a0230 100644
> --- a/drivers/clk/qcom/dispcc-sdm845.c
> +++ b/drivers/clk/qcom/dispcc-sdm845.c
> @@ -122,7 +124,7 @@ static struct clk_rcg2 disp_cc_mdss_byte0_clk_src = {
>   	.parent_map = disp_cc_parent_map_0,
>   	.clkr.hw.init = &(struct clk_init_data){
>   		.name = "disp_cc_mdss_byte0_clk_src",
> -		.parent_names = disp_cc_parent_names_0,
> +		.parent_data = disp_cc_parent_data_0,
>   		.num_parents = 4,

While changing the surrounding lines, isn't it common practice to use 
ARRAY_SIZE(disp_cc_parent_data_0) here and below?

>   		.flags = CLK_SET_RATE_PARENT,
>   		.ops = &clk_byte2_ops,

> @@ -381,8 +383,8 @@ static struct clk_branch disp_cc_mdss_byte0_clk = {
>   		.enable_mask = BIT(0),
>   		.hw.init = &(struct clk_init_data){
>   			.name = "disp_cc_mdss_byte0_clk",
> -			.parent_names = (const char *[]){
> -				"disp_cc_mdss_byte0_clk_src",
> +			.parent_data = &(const struct clk_parent_data){
> +				.hw = &disp_cc_mdss_byte0_clk_src.clkr.hw,

For this commit and all other "convert to parent data" commits in this 
series:  It should be possible to use .parent_hws which is a little more 
lightweight when only referencing parents that are internal to this clk 
controller.  .parent_data is used to mix internal (.hw) parent clocks 
with external (.name and .fw_name) clocks.

>   			},
>   			.num_parents = 1,
>   			.flags = CLK_SET_RATE_PARENT,

Thanks!
Marijn
