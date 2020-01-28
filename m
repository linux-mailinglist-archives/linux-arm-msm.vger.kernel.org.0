Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9649814AF42
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2020 06:55:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725797AbgA1Fzn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Jan 2020 00:55:43 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:18290 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725822AbgA1Fzm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Jan 2020 00:55:42 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1580190941; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=7yuJtQMSotzKOG8RHo+lGNABe4+fukiXNr3ICAFp3V0=; b=kmbl0E+mCFmi0y3G+Nnhmel+sZ5a/5pb7A2b91kN1pkngvEiX5ZXg15S7vlkhV6lxRu4Nnpa
 Wf7Ak3PQKQhyfGBL4btOdNXtEYsD1NzX8nU6Za6aiMCtA1fzexwoAoAdlX14LjrW4yEELdap
 pqf2RoNwLfzBaD3gach4bUNiBZQ=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e2fccdc.7f97f7973260-smtp-out-n03;
 Tue, 28 Jan 2020 05:55:40 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D8F49C447A3; Tue, 28 Jan 2020 05:55:38 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.206.28.9] (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 47132C43383;
        Tue, 28 Jan 2020 05:55:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 47132C43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=tdas@codeaurora.org
Subject: Re: [PATCH v2 07/10] clk: qcom: Fix sc7180 gpucc parent data
To:     Douglas Anderson <dianders@chromium.org>,
        Rob Herring <robh@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@codeaurora.org>
Cc:     Jeffrey Hugo <jhugo@codeaurora.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, harigovi@codeaurora.org,
        mka@chromium.org, kalyan_t@codeaurora.org,
        Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org,
        hoegsberg@chromium.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org
References: <20200124224225.22547-1-dianders@chromium.org>
 <20200124144154.v2.7.I3bf44e33f4dc7ecca10a50dbccb7dc082894fa59@changeid>
From:   Taniya Das <tdas@codeaurora.org>
Message-ID: <6e585554-d0bd-39d7-2150-e7968dd51fb3@codeaurora.org>
Date:   Tue, 28 Jan 2020 11:25:30 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200124144154.v2.7.I3bf44e33f4dc7ecca10a50dbccb7dc082894fa59@changeid>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Doug,

Thanks for your patch. But as mentioned earlier we really want to avoid 
updating the auto generated code.

On 1/25/2020 4:12 AM, Douglas Anderson wrote:
> The bindings file (qcom,gpucc.yaml) does not agree with the names we
> use for input clocks.  Fix us.  This takes into account the changes in
> the recent patch ("dt-bindings: clock: Fix qcom,gpucc bindings for
> sdm845/sc7180/msm8998"), but even without that patch the names in the
> driver were still not right.
> 
> Since we didn't add the "test" clock to the bindings (apparently it's
> never used), kill it from the driver.  If someone has a use for it we
> should add it to the bindings and bring it back.
> 
> Instead of updating the size of the array now that the test clock is
> gone, switch to using the less error-prone ARRAY_SIZE.  Not sure why
> it didn't always use that.
> 
> Fixes: 745ff069a49c ("clk: qcom: Add graphics clock controller driver for SC7180")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
> Changes in v2:
> - Patch ("clk: qcom: Fix sc7180 gpucc parent data") new for v2.
> 
>   drivers/clk/qcom/gpucc-sc7180.c | 11 +++++------
>   1 file changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gpucc-sc7180.c b/drivers/clk/qcom/gpucc-sc7180.c
> index ec61194cceaf..da56506036e2 100644
> --- a/drivers/clk/qcom/gpucc-sc7180.c
> +++ b/drivers/clk/qcom/gpucc-sc7180.c
> @@ -47,7 +47,7 @@ static struct clk_alpha_pll gpu_cc_pll1 = {
>   		.hw.init = &(struct clk_init_data){
>   			.name = "gpu_cc_pll1",
>   			.parent_data =  &(const struct clk_parent_data){
> -				.fw_name = "bi_tcxo",
> +				.fw_name = "xo",
>   			},
>   			.num_parents = 1,
>   			.ops = &clk_alpha_pll_fabia_ops,
> @@ -64,11 +64,10 @@ static const struct parent_map gpu_cc_parent_map_0[] = {
>   };
>   
>   static const struct clk_parent_data gpu_cc_parent_data_0[] = {
> -	{ .fw_name = "bi_tcxo" },
> +	{ .fw_name = "xo" },
>   	{ .hw = &gpu_cc_pll1.clkr.hw },
> -	{ .fw_name = "gcc_gpu_gpll0_clk_src" },
> -	{ .fw_name = "gcc_gpu_gpll0_div_clk_src" },
> -	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
> +	{ .fw_name = "gpll0" },
> +	{ .fw_name = "gpll0_div" },
>   };
>   
>   static const struct freq_tbl ftbl_gpu_cc_gmu_clk_src[] = {
> @@ -86,7 +85,7 @@ static struct clk_rcg2 gpu_cc_gmu_clk_src = {
>   	.clkr.hw.init = &(struct clk_init_data){
>   		.name = "gpu_cc_gmu_clk_src",
>   		.parent_data = gpu_cc_parent_data_0,
> -		.num_parents = 5,
> +		.num_parents = ARRAY_SIZE(gpu_cc_parent_data_0),
>   		.flags = CLK_SET_RATE_PARENT,
>   		.ops = &clk_rcg2_shared_ops,
>   	},
> 

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

--
