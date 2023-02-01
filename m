Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 83075686DEC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Feb 2023 19:27:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231766AbjBAS1a (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Feb 2023 13:27:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231676AbjBAS13 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Feb 2023 13:27:29 -0500
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BE247F6A4
        for <linux-arm-msm@vger.kernel.org>; Wed,  1 Feb 2023 10:27:22 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id gr7so29449455ejb.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Feb 2023 10:27:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SP+ZJyoLhgbz6lBf/nMewvX1YgPG9NUPxjH5PQsVn7s=;
        b=QlfZ0Ykhj3igqATK866qsnwImRHb+YEI8aLwIU3Yy1pjIiohUc2cKaOlGKuGJ8Nv16
         cN694SJILaFK+mfYeqg8Q+7gkx51u0dc/8FQmYBquHeTdLUcxFNLVjvgsCBvhXa53EC0
         azx3nbP5EE4Jk3kfTptJBlv90fUeFV3I6Z95rXUoRlIy0socLEwoi6Q31X0QP2JMqriN
         D8K9mFGD98mEAt9LeZN26vM3g/7FZVzmuyMsJPX6vkNiiPZxyPh2edhJvvfUAySfR1DZ
         sAdIg9ULSznLz63nZ2gi9BYkgkDewlo/YUZM5ikJHZl3hGzbmsbcy5I9OhxsK/CNGwV2
         3uIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SP+ZJyoLhgbz6lBf/nMewvX1YgPG9NUPxjH5PQsVn7s=;
        b=XjVuffeopToCHY0jfCr0HZpSkGSZOwmV3FNn93nSJHZWxXrK2BQHhlSlZLt2+3PK3j
         PAADl2YopZnj/lwo9YmsmZoAM0JVoowujbnTdUNDEXxdZ5E7P//CRmEwmzr9Kq2wbA2x
         GvAv7auWRAGThx7agofjTiylq78bTQGNcDLcyemMPDZLg8YNLhTz9Tl2CVYfEpJzKV4O
         vsSVtbq4AUxEiJKjWN3jjJWkEoSytC+2pV5vGABzuDKtmtkYzHN8lI56qX9i68tZ+aDf
         9y8/afyc6g5kBcPYH67sfMUBkeGAzsTsCUMd3hiagxdRUw2291eXOdRT2lguzbtCzgIV
         Aqxg==
X-Gm-Message-State: AO0yUKUnrYPaMGo+msSWyNypE3zr9ELP49Y9D45BF3WvufqU8eJ5gwDw
        fTwW+tgu1XaT27zsPvyXaz1Rmw==
X-Google-Smtp-Source: AK7set8EweLE3KK6rBhUxD0GxS+r8ZRCN1cZjIHJurWjkQHzIU0Cxz7uVYqMjL9rscEMHARQlyAtgQ==
X-Received: by 2002:a17:906:2ed7:b0:878:5f7a:7aab with SMTP id s23-20020a1709062ed700b008785f7a7aabmr3106062eji.39.1675276040932;
        Wed, 01 Feb 2023 10:27:20 -0800 (PST)
Received: from [192.168.1.101] (abyl20.neoplus.adsl.tpnet.pl. [83.9.31.20])
        by smtp.gmail.com with ESMTPSA id oy17-20020a170907105100b0087bd50f6986sm8898136ejb.42.2023.02.01.10.27.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Feb 2023 10:27:20 -0800 (PST)
Message-ID: <8212dd18-50db-8e83-23ff-2155b19611e0@linaro.org>
Date:   Wed, 1 Feb 2023 19:27:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v2 2/2] clk: qcom: gpucc-sdm845: fix clk_dis_wait being
 programmed for CX GDSC
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20230201172305.993146-1-dmitry.baryshkov@linaro.org>
 <20230201172305.993146-2-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230201172305.993146-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 1.02.2023 18:23, Dmitry Baryshkov wrote:
> The gdsc_init() function will rewrite the CLK_DIS_WAIT field while
> registering the GDSC (writing the value 0x2 by default). This will
> override the setting done in the driver's probe function.
> 
> Set cx_gdsc.clk_dis_wait_val to 8 to follow the intention of the probe
> function.
> 
> Fixes: 453361cdd757 ("clk: qcom: Add graphics clock controller driver for SDM845")
> Reviewed-by: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
> 
> Changes since v1:
> - Fixed the _val suffix in .clk_dis_wait_val.
> 
> ---
>  drivers/clk/qcom/gpucc-sdm845.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gpucc-sdm845.c b/drivers/clk/qcom/gpucc-sdm845.c
> index 110b54401bc6..970d7414bdf0 100644
> --- a/drivers/clk/qcom/gpucc-sdm845.c
> +++ b/drivers/clk/qcom/gpucc-sdm845.c
> @@ -22,8 +22,6 @@
>  #define CX_GMU_CBCR_SLEEP_SHIFT		4
>  #define CX_GMU_CBCR_WAKE_MASK		0xf
>  #define CX_GMU_CBCR_WAKE_SHIFT		8
> -#define CLK_DIS_WAIT_SHIFT		12
> -#define CLK_DIS_WAIT_MASK		(0xf << CLK_DIS_WAIT_SHIFT)
>  
>  enum {
>  	P_BI_TCXO,
> @@ -121,6 +119,7 @@ static struct clk_branch gpu_cc_cxo_clk = {
>  static struct gdsc gpu_cx_gdsc = {
>  	.gdscr = 0x106c,
>  	.gds_hw_ctrl = 0x1540,
> +	.clk_dis_wait_val = 0x8,
>  	.pd = {
>  		.name = "gpu_cx_gdsc",
>  	},
> @@ -193,10 +192,6 @@ static int gpu_cc_sdm845_probe(struct platform_device *pdev)
>  	value = 0xf << CX_GMU_CBCR_WAKE_SHIFT | 0xf << CX_GMU_CBCR_SLEEP_SHIFT;
>  	regmap_update_bits(regmap, 0x1098, mask, value);
>  
> -	/* Configure clk_dis_wait for gpu_cx_gdsc */
> -	regmap_update_bits(regmap, 0x106c, CLK_DIS_WAIT_MASK,
> -						8 << CLK_DIS_WAIT_SHIFT);
> -
>  	return qcom_cc_really_probe(pdev, &gpu_cc_sdm845_desc, regmap);
>  }
>  
