Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1DDEF702BDB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 May 2023 13:53:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241326AbjEOLx4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 May 2023 07:53:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236791AbjEOLxb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 May 2023 07:53:31 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23343558E
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 May 2023 04:41:02 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-4f139de8cefso64683352e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 May 2023 04:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684150860; x=1686742860;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mfl3EsimtWONnHrSgudubPW0vWnp/rlekvieGjohodc=;
        b=DVjy5Y28IoNdb7W9uxatzcGQFek3rJO5sQqXG+IyV9PmxuPaOYV2rDPbQjiv+3xvBO
         LCrYWPhdhg1x8XjtTXxjv0CBQuKw+kImFYBZdgW/mGCJxYeUy3Q1L2FpKUfxvxNyj6KZ
         OuXx9cWCjBvjQRPxyny6APe6oZ4QQxPV0I19CSGDkg/b0irRQW3tFmtgVKQ82IRrNZZg
         pBlIdMR0k2wDY5fmaEQ+81+Jg1DbvxlXe0v48UrQU80hg8qfojsA85xgjAdB4sp6J6Xv
         Gsn1NJnTHadeT/y2jnkQWghZFg5tpqqmB3oTIQT9Y3AiTN30m9xUPNQGh7Vk2vXMYWsY
         7skw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684150860; x=1686742860;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mfl3EsimtWONnHrSgudubPW0vWnp/rlekvieGjohodc=;
        b=e6Xpa0f76+l77the0Y+4F9mO9XcLi7p/r5S+5gHhWp0T0Ljo1Pbq/ODSFXkBnz3HDO
         myl/47VrWcITr9fUZ12NsStwsj9Ts046aTrI0xxpB4c85t26H2s/s94lCxgDfmS+QNDs
         WKWBQQPYXIixm9S6JjsW2xGuh0D0OSusgFbQNE5QAeTYk6zZX0wpoDmoBb8CzEl3VwWf
         PHvdVPjUpttnLEJ4ZBaanRghO+4hwCurgDqTLdIu6rTohviC6ICOZ5LjW+i59NbvIUgt
         5XZnwh3PjO0d/Iu+9cKkbtm2Irsr9Fmuy0Tr6556IWCqL208bPpx/RLZ8/sgcWUtzYFA
         joLQ==
X-Gm-Message-State: AC+VfDyXe53jRk6JYYzYgo/I1fggLJxP+cwP1V+rXLq3KKAVoNlCB3Un
        HpLeevwD9uaaosnol/3vKCz+Ig==
X-Google-Smtp-Source: ACHHUZ48P9pfy7XrwSlIgqNNvgYYov+NHIgGCc58pIfCZmW0CShVkmUg0Wu9Nv9kzjfOih0BJLIafw==
X-Received: by 2002:ac2:44b8:0:b0:4e8:487a:7c2e with SMTP id c24-20020ac244b8000000b004e8487a7c2emr7358625lfm.14.1684150860343;
        Mon, 15 May 2023 04:41:00 -0700 (PDT)
Received: from [192.168.1.101] (abxi58.neoplus.adsl.tpnet.pl. [83.9.2.58])
        by smtp.gmail.com with ESMTPSA id p14-20020a05651211ee00b004e84d64ab51sm2560194lfs.58.2023.05.15.04.40.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 May 2023 04:41:00 -0700 (PDT)
Message-ID: <ec2c87e3-7962-ea64-daf0-fad9c4599b35@linaro.org>
Date:   Mon, 15 May 2023 13:40:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 08/10] clk: qcom: gcc-mdm9615: drop the cxo clock
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
        devicetree@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
References: <20230512211727.3445575-1-dmitry.baryshkov@linaro.org>
 <20230512211727.3445575-9-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230512211727.3445575-9-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 12.05.2023 23:17, Dmitry Baryshkov wrote:
> The gcc and lcc devices have been switched to the DT-defined cxo_board
> clock. Now we can drop the manually defined cxo clock.
> 
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/clk/qcom/gcc-mdm9615.c | 17 -----------------
>  1 file changed, 17 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gcc-mdm9615.c b/drivers/clk/qcom/gcc-mdm9615.c
> index 458c18b639db..64d4f508e43a 100644
> --- a/drivers/clk/qcom/gcc-mdm9615.c
> +++ b/drivers/clk/qcom/gcc-mdm9615.c
> @@ -26,17 +26,6 @@
>  #include "clk-branch.h"
>  #include "reset.h"
>  
> -static struct clk_fixed_factor cxo = {
> -	.mult = 1,
> -	.div = 1,
> -	.hw.init = &(struct clk_init_data){
> -		.name = "cxo",
> -		.parent_names = (const char *[]){ "cxo_board" },
> -		.num_parents = 1,
> -		.ops = &clk_fixed_factor_ops,
> -	},
> -};
> -
>  enum {
>  	DT_CXO,
>  	DT_PLL4,
> @@ -1623,10 +1612,6 @@ static struct clk_branch ebi2_aon_clk = {
>  	},
>  };
>  
> -static struct clk_hw *gcc_mdm9615_hws[] = {
> -	&cxo.hw,
> -};
> -
>  static struct clk_regmap *gcc_mdm9615_clks[] = {
>  	[PLL0] = &pll0.clkr,
>  	[PLL0_VOTE] = &pll0_vote,
> @@ -1736,8 +1721,6 @@ static const struct qcom_cc_desc gcc_mdm9615_desc = {
>  	.num_clks = ARRAY_SIZE(gcc_mdm9615_clks),
>  	.resets = gcc_mdm9615_resets,
>  	.num_resets = ARRAY_SIZE(gcc_mdm9615_resets),
> -	.clk_hws = gcc_mdm9615_hws,
> -	.num_clk_hws = ARRAY_SIZE(gcc_mdm9615_hws),
>  };
>  
>  static const struct of_device_id gcc_mdm9615_match_table[] = {
