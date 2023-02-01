Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA33E686DE9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Feb 2023 19:27:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230231AbjBAS1X (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Feb 2023 13:27:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230091AbjBAS1X (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Feb 2023 13:27:23 -0500
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 607E57F687
        for <linux-arm-msm@vger.kernel.org>; Wed,  1 Feb 2023 10:26:54 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id dr8so32447147ejc.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Feb 2023 10:26:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P6pObJRjfjJcbaU6cgRblMXkK3bAA9+2wu4TUKbtXAU=;
        b=keQ7dG8y+O3OpOCQJHQIRpxjKKsra89oKsY0zf10NWp+ddV1DvgqMGyGkveNs61tiN
         v6seYylgh2rBpjWLHNWZ2bv6iZF4GUmEarhkoreumLOk+BEHTYZdKeYI8fqazraLmb1o
         jh+1i4aF4c5G40oTTr1AdGv2FDmgqguRqkG8/26UBbHANnDgymlc78VeMJzx4n9a0gVX
         l8sxAtgOZcX2Mty1zmJvUO0mbQkU/fBuQ7sfeFn53zGTMXmqjRHDKARrP/aVO6GtPx6R
         j126+thTm1tsTQvZWWqqkYbC+4BDFMajV6v0+QKnWn1jsehxH/wmSagtGwCgtjM/lAXs
         EgWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P6pObJRjfjJcbaU6cgRblMXkK3bAA9+2wu4TUKbtXAU=;
        b=XvLVE39i5CZF/npAj1+52C69YLRD8EZ+1mGH7Dk3aDnA3hmQ9crmQNTHVYrO7L7WtM
         h81t1lP6XCJrHu+6Lf+i12Sg4g6V1GtO+lN1NfEn7heJ2GIjAQlS+hM3IVi8bV6XFXdw
         r2qx8u8CMnr717my5ZVfa62pw+aaR0qDANvP1DG/tOv6F5Oprv+owZ7Pwr/qbmm+uyje
         Mao22Q7CPilcWJZrHHglfsj0KQUCDPkk1KF3FpxSQMykxTvBofiKZIIMEYpvfWFZOm+U
         /9QGGnhOXzxTLA3sYRl89Nxj++SYbUfxiBztUo1cCvuP/nNqvVci8P5RCrzQdztLC338
         sZrg==
X-Gm-Message-State: AO0yUKWXzBZFsreBgqqxYQp2v4eNfWKsNUFZNjSWnpQCwTVqJKTjZHC6
        ulnBDeVyK6eSmHoGGybImQd/dw==
X-Google-Smtp-Source: AK7set+MQh4xdRs4CnNpq5NrK7gX8ybW7tJeHMcqJ3zC7esU+kEns4x/KMITUIDA8RC3/jBhViovtA==
X-Received: by 2002:a17:907:9687:b0:7c0:d6ba:c934 with SMTP id hd7-20020a170907968700b007c0d6bac934mr4050726ejc.13.1675276012894;
        Wed, 01 Feb 2023 10:26:52 -0800 (PST)
Received: from [192.168.1.101] (abyl20.neoplus.adsl.tpnet.pl. [83.9.31.20])
        by smtp.gmail.com with ESMTPSA id r15-20020a1709067fcf00b0087fa83790d8sm8114105ejs.13.2023.02.01.10.26.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Feb 2023 10:26:52 -0800 (PST)
Message-ID: <cabfd590-b476-4e87-f4ef-e5d2c4872611@linaro.org>
Date:   Wed, 1 Feb 2023 19:26:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v2 1/2] clk: qcom: gpucc-sc7180: fix clk_dis_wait being
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
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230201172305.993146-1-dmitry.baryshkov@linaro.org>
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
> Fixes: 745ff069a49c ("clk: qcom: Add graphics clock controller driver for SC7180")
> Reviewed-by: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/clk/qcom/gpucc-sc7180.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gpucc-sc7180.c b/drivers/clk/qcom/gpucc-sc7180.c
> index d738251cba17..6839b4b71a2f 100644
> --- a/drivers/clk/qcom/gpucc-sc7180.c
> +++ b/drivers/clk/qcom/gpucc-sc7180.c
> @@ -21,8 +21,6 @@
>  #define CX_GMU_CBCR_SLEEP_SHIFT		4
>  #define CX_GMU_CBCR_WAKE_MASK		0xF
>  #define CX_GMU_CBCR_WAKE_SHIFT		8
> -#define CLK_DIS_WAIT_SHIFT		12
> -#define CLK_DIS_WAIT_MASK		(0xf << CLK_DIS_WAIT_SHIFT)
>  
>  enum {
>  	P_BI_TCXO,
> @@ -160,6 +158,7 @@ static struct clk_branch gpu_cc_cxo_clk = {
>  static struct gdsc cx_gdsc = {
>  	.gdscr = 0x106c,
>  	.gds_hw_ctrl = 0x1540,
> +	.clk_dis_wait_val = 8,
>  	.pd = {
>  		.name = "cx_gdsc",
>  	},
> @@ -242,10 +241,6 @@ static int gpu_cc_sc7180_probe(struct platform_device *pdev)
>  	value = 0xF << CX_GMU_CBCR_WAKE_SHIFT | 0xF << CX_GMU_CBCR_SLEEP_SHIFT;
>  	regmap_update_bits(regmap, 0x1098, mask, value);
>  
> -	/* Configure clk_dis_wait for gpu_cx_gdsc */
> -	regmap_update_bits(regmap, 0x106c, CLK_DIS_WAIT_MASK,
> -						8 << CLK_DIS_WAIT_SHIFT);
> -
>  	return qcom_cc_really_probe(pdev, &gpu_cc_sc7180_desc, regmap);
>  }
>  
