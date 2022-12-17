Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A85B364F9A7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Dec 2022 16:08:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229659AbiLQPIw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 17 Dec 2022 10:08:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229480AbiLQPIv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 17 Dec 2022 10:08:51 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB01114098
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Dec 2022 07:08:50 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id q6so7693756lfm.10
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Dec 2022 07:08:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7+AAXNyn7D4ZBGrHZRVwibl7ejUX7z4qDKo/f6e91EE=;
        b=Sa0b8rbQmQVYQ/13uSKElmHawbEyW9ulmnd895VZB1yrJwLuyoWAp7+KyEbEbensFu
         ZggpHWQ0UUKQSJkNBGpIrCmbWttGcEJ255BzfQpUPiAabL5VsQe1GQwbZlMAeKA1RzDR
         /3iU07Wa2/Y7Fx/6E7JGvX7cUcBg57r39jH9N7YBx5QAiNWKZPX+wB9vbr53BDHxv04G
         ukkRDWMIWuk5fGvZTr3sB9jV7/TQUhj6cZuQE0l02l+XzkTxMYjYpKlvM8ti07uJOr1w
         IIDnqQkhecNWtx17gtCNa3HIy1b936wohLF0kBJJIo+xwAFJb+VTl3w7BkBUK0cNXdZN
         qr4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7+AAXNyn7D4ZBGrHZRVwibl7ejUX7z4qDKo/f6e91EE=;
        b=j3mQ5hGsKOY6pcVY4yzxUswLqlM1uTjQazqKowEQq1V6OkyxDeR1igeS8ZPL6VWKRz
         IrG9QB4VxirZ1ljp7gODBf2tnKz1Yy18fBJ6UDP1MsQ0a/V2gJExckXTIiaX4fV8yw7Z
         NGrI3kBE3f9cmEpIIL4p3Rqyj8YjOcttPNuL5W7cetdbGYI7TyHxhYuswjqZilX2tVbi
         qRdLAchl6FV0md0HpdMe8DWn2cttTTooriPp7E/zw/B2/DUwEESjAtIK3kGtHiR2YC5V
         tZNMDRVynnnSOlrHyRVBm/DySG/xobCJUnISvix1mqUcbg2+1ww0vLJsg9vXo04psLcw
         H+nw==
X-Gm-Message-State: AFqh2koHuL8vqXJoU7q98IlAGtTgcD2tTyPoDECCWH/IuJr+FzkxfDQ5
        6Lp7PuwpCXvT3RHWqATu8hSIIw==
X-Google-Smtp-Source: AMrXdXvUNttNkcx62RJR0XZ210Ami7+3OHcy8kcQI3gecJtPOddnwFLM29pf1svCB6q2tfPrPFrh1A==
X-Received: by 2002:a05:6512:e96:b0:4c0:91d0:e7ae with SMTP id bi22-20020a0565120e9600b004c091d0e7aemr2404609lfb.28.1671289729083;
        Sat, 17 Dec 2022 07:08:49 -0800 (PST)
Received: from [192.168.1.101] (abxh44.neoplus.adsl.tpnet.pl. [83.9.1.44])
        by smtp.gmail.com with ESMTPSA id c14-20020ac25f6e000000b00497ab34bf5asm534973lfc.20.2022.12.17.07.08.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Dec 2022 07:08:48 -0800 (PST)
Message-ID: <0e4e1d76-cd47-f8e4-4ba1-e28578036b1b@linaro.org>
Date:   Sat, 17 Dec 2022 16:08:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 06/15] clk: qcom: gcc-qcs404: fix names of the DSI clocks
 used as parents
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20221217001730.540502-1-dmitry.baryshkov@linaro.org>
 <20221217001730.540502-7-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221217001730.540502-7-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 17.12.2022 01:17, Dmitry Baryshkov wrote:
> The QCS404 uses 28nm LPM DSI PHY, which registers dsi0pll and
> dsi0pllbyte clocks. Fix all DSI PHY clock names used as parents inside
> the GCC driver.
> 
> Fixes: 652f1813c113 ("clk: qcom: gcc: Add global clock controller driver for QCS404")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/clk/qcom/gcc-qcs404.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gcc-qcs404.c b/drivers/clk/qcom/gcc-qcs404.c
> index c48326da1bb3..23562096298d 100644
> --- a/drivers/clk/qcom/gcc-qcs404.c
> +++ b/drivers/clk/qcom/gcc-qcs404.c
> @@ -115,7 +115,7 @@ static const struct parent_map gcc_parent_map_5[] = {
>  
>  static const char * const gcc_parent_names_5[] = {
>  	"cxo",
> -	"dsi0pll_byteclk_src",
> +	"dsi0pllbyte",
>  	/* "gpll0_out_aux", */
>  	"core_bi_pll_test_se",
>  };
> @@ -129,7 +129,7 @@ static const struct parent_map gcc_parent_map_6[] = {
>  
>  static const char * const gcc_parent_names_6[] = {
>  	"cxo",
> -	"dsi0_phy_pll_out_byteclk",
> +	"dsi0pllbyte",
>  	/* "gpll0_out_aux", */
>  	"core_bi_pll_test_se",
>  };
> @@ -175,7 +175,7 @@ static const struct parent_map gcc_parent_map_9[] = {
>  static const char * const gcc_parent_names_9[] = {
>  	"cxo",
>  	"gpll0_out_main",
> -	"dsi0_phy_pll_out_dsiclk",
> +	"dsi0pll",
>  	"gpll6_out_aux",
>  	"core_bi_pll_test_se",
>  };
> @@ -213,7 +213,7 @@ static const struct parent_map gcc_parent_map_12[] = {
>  
>  static const char * const gcc_parent_names_12[] = {
>  	"cxo",
> -	"dsi0pll_pclk_src",
> +	"dsi0pll",
>  	/* "gpll0_out_aux", */
>  	"core_bi_pll_test_se",
>  };
