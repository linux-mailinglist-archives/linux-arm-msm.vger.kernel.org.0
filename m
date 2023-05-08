Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 07A656FB558
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 May 2023 18:40:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234018AbjEHQkF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 May 2023 12:40:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233694AbjEHQkB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 May 2023 12:40:01 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 430A47287
        for <linux-arm-msm@vger.kernel.org>; Mon,  8 May 2023 09:39:30 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-4efe8991b8aso5501606e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 May 2023 09:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683563967; x=1686155967;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fGhSQBof6Qw7j8oJ6dl7kDWKIrDr2aP4xnq1pwJb2TQ=;
        b=nyKMpcZ8VFP7xiJevf65/S2S4dhuujUyPZQZhOahSHdqBe1Is0sdKBAqPaRqtjYe8i
         A1ZSPXz29/mBpnjUqXvDtx1qrDcA9YHPLtL+gTkepFiD2LRbcQVuxFb9eRoT+cfXxb9w
         HnC4lAnTZnXUpryg8gmhJkPw9HGl2w8ebWVfj+LH1GFymKIezNaw7nNSWTxltwx4momP
         vzKiDXicBpzqU++SXrPWhXU7arruK2z2ILWS/ABikWeQJZoM7TdCo9RnkJqD/6dve4jK
         Cl+zZAB0Sf41kfLfYuXo+tfksTPTbpTHSD2IOBuHaJ0KtlmLkO1j4U6lzMKErescAyS8
         Ogng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683563967; x=1686155967;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fGhSQBof6Qw7j8oJ6dl7kDWKIrDr2aP4xnq1pwJb2TQ=;
        b=cAv6NiRfd8nZpknwc3sB7t35hMPKV06/0Gm8/BsaoVw6nwPa8HPQtSuU+NugFYMsY6
         eCNyuHDKffNKeEi7eYm82qyvYbUvnS1QaW3hM88KooKK5V5qWZNdAUGwyq1ltZE/vDVK
         JMVF0P7YDX2g8eVCVkEcMrqDyvHntKJvtsiZkWsTsFu6hFVJi0+dmxCtVsygjKL+78gF
         5iGpFzRKAZXz2PGM/hylCtAkLSjlEOyuicdaabvWPU1+QJ2Avk8bHycXH8qja0iJqpcK
         87WbnaF9VchxEWwK4qT6Y7PHuZeG/WvAXHGWQpP2/99xPBUtbin0DuCiiVpHLfDErsWl
         FPjg==
X-Gm-Message-State: AC+VfDzI7hCiG+KBRIdAVpzMEWrajDYCKLQxUEfOGelw3oRJirZZAvcJ
        lLwNc1mch/sDnYfcDqa0YFJkhQ==
X-Google-Smtp-Source: ACHHUZ780o8Hl76I8LAZEsSYyASCwjYLOlcmFu8v1tXYtLWfWTWJT9QzwBadu9FLf2MnY6MNJJCYYg==
X-Received: by 2002:ac2:52b6:0:b0:4f2:5393:b71 with SMTP id r22-20020ac252b6000000b004f253930b71mr303906lfm.17.1683563967000;
        Mon, 08 May 2023 09:39:27 -0700 (PDT)
Received: from [192.168.1.101] (abyl248.neoplus.adsl.tpnet.pl. [83.9.31.248])
        by smtp.gmail.com with ESMTPSA id h22-20020a197016000000b004e887fd71acsm37704lfc.236.2023.05.08.09.39.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 May 2023 09:39:26 -0700 (PDT)
Message-ID: <033952d2-af42-3980-95ab-1aea158f60f1@linaro.org>
Date:   Mon, 8 May 2023 18:39:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH] clk: qcom: mmcc-msm8974: remove oxili_ocmemgx_clk
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20230508153319.2371645-1-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230508153319.2371645-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 8.05.2023 17:33, Dmitry Baryshkov wrote:
> After the internal discussions, it looks like this clock is managed by
> RPM itself. Linux kernel should not touch it on its own, as this causes
> disagreement with RPM. Shutting down this clock causes the OCMEM<->GPU
> interface to stop working, resulting in GPU hangchecks/timeouts.
> 
> Fixes: d8b212014e69 ("clk: qcom: Add support for MSM8974's multimedia clock controller (MMCC)")
Feels good to fix 9 year old code!

> Suggested-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
+CC Luca please give it a spin on your smartwatch

(fun to say isn't it)

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/clk/qcom/mmcc-msm8974.c | 19 -------------------
>  1 file changed, 19 deletions(-)
> 
> diff --git a/drivers/clk/qcom/mmcc-msm8974.c b/drivers/clk/qcom/mmcc-msm8974.c
> index 277ef0065aae..82f6bad144a9 100644
> --- a/drivers/clk/qcom/mmcc-msm8974.c
> +++ b/drivers/clk/qcom/mmcc-msm8974.c
> @@ -2204,23 +2204,6 @@ static struct clk_branch ocmemcx_ocmemnoc_clk = {
>  	},
>  };
>  
> -static struct clk_branch oxili_ocmemgx_clk = {
> -	.halt_reg = 0x402c,
> -	.clkr = {
> -		.enable_reg = 0x402c,
> -		.enable_mask = BIT(0),
> -		.hw.init = &(struct clk_init_data){
> -			.name = "oxili_ocmemgx_clk",
> -			.parent_data = (const struct clk_parent_data[]){
> -				{ .fw_name = "gfx3d_clk_src", .name = "gfx3d_clk_src" },
> -			},
> -			.num_parents = 1,
> -			.flags = CLK_SET_RATE_PARENT,
> -			.ops = &clk_branch2_ops,
> -		},
> -	},
> -};
> -
>  static struct clk_branch ocmemnoc_clk = {
>  	.halt_reg = 0x50b4,
>  	.clkr = {
> @@ -2512,7 +2495,6 @@ static struct clk_regmap *mmcc_msm8226_clocks[] = {
>  	[MMSS_MMSSNOC_AXI_CLK] = &mmss_mmssnoc_axi_clk.clkr,
>  	[MMSS_S0_AXI_CLK] = &mmss_s0_axi_clk.clkr,
>  	[OCMEMCX_AHB_CLK] = &ocmemcx_ahb_clk.clkr,
> -	[OXILI_OCMEMGX_CLK] = &oxili_ocmemgx_clk.clkr,
>  	[OXILI_GFX3D_CLK] = &oxili_gfx3d_clk.clkr,
>  	[OXILICX_AHB_CLK] = &oxilicx_ahb_clk.clkr,
>  	[OXILICX_AXI_CLK] = &oxilicx_axi_clk.clkr,
> @@ -2670,7 +2652,6 @@ static struct clk_regmap *mmcc_msm8974_clocks[] = {
>  	[MMSS_S0_AXI_CLK] = &mmss_s0_axi_clk.clkr,
>  	[OCMEMCX_AHB_CLK] = &ocmemcx_ahb_clk.clkr,
>  	[OCMEMCX_OCMEMNOC_CLK] = &ocmemcx_ocmemnoc_clk.clkr,
> -	[OXILI_OCMEMGX_CLK] = &oxili_ocmemgx_clk.clkr,
>  	[OCMEMNOC_CLK] = &ocmemnoc_clk.clkr,
>  	[OXILI_GFX3D_CLK] = &oxili_gfx3d_clk.clkr,
>  	[OXILICX_AHB_CLK] = &oxilicx_ahb_clk.clkr,
