Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 000D26F3F36
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 May 2023 10:37:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233650AbjEBIhB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 May 2023 04:37:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233820AbjEBIgw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 May 2023 04:36:52 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA6683C0C
        for <linux-arm-msm@vger.kernel.org>; Tue,  2 May 2023 01:36:41 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3f1e2555b5aso21730225e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 May 2023 01:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683016600; x=1685608600;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5NiBoxF9WGY8V59+lPmvYrsanQwp8RYmlLhhD+xWcqs=;
        b=CQKkioNnPT8ZQGQ7jj2KWYnOU6kgAkQPl7Azknhfh0hrADXjfPReufPBADx+fXFZtT
         KL3sOax/IO+vmWSoSpyJ9SSCFTJoAvvnjAY5FDpvZOkTVjYlQ7pmaefSHzjtvaZVURuJ
         leJrgh+fXkYmyKVQjCWsUWT5ORKIwyyJU+u/MYPSwtpc/0K8mf6gpdUnXigUC9HyE6OQ
         mWjXtYVhXxe6l6jNsCLY96pHQxUQ0ZbTcDb8q9b9rpJ0COxFXHsccZ7gwGJ73HPRDCWn
         7necTDuUf6Q/xMO76NyumDxncj6r0KrdbtgVyaTWfGT5ynxbTrnuJJPiN4DiiMFnRsoH
         noeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683016600; x=1685608600;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5NiBoxF9WGY8V59+lPmvYrsanQwp8RYmlLhhD+xWcqs=;
        b=h9xogbhpA/DARIs0nkURPqyzppcMMqI66pb8Fd2Q9N1xAkjreTVSFG26+8UIH9E9wE
         AH5W9bvZvVj5Eca76MCbXpYbatRdVXKcK25V79XiL/B0bejSm75DNEXa6TTDXFPxNTOp
         5001wdsl78KHfuavodjyWhQj0G++NybeTYfLaNnmXSgfepnEuCbzWrTeUWaKHg1Sikwb
         e/rLMg7Jt0DgPBZvrZloUAxN8ZeH5cAhgtzKh1GV6A5ZYEUNXjXoUvbMPLEysU5qb/5s
         D20bFEx7XkLo0o2mwP35vT7BrIlDTMkl1FecPlJlb4nVa+B+sTnlG3jmygmxwqX9iJIF
         9i1A==
X-Gm-Message-State: AC+VfDxajz7IjU9Qz+tUppnYANr4nq9+ZpnWiaZ43zdJNu6trmbINYCb
        uIpdDIJerLU6ON3CBix73nWC9w==
X-Google-Smtp-Source: ACHHUZ4YNT2j2Ckfud8spePAbYGzrGcVYQCBwIjjbwRcXlFJoVdTctC+SZ4jaaEyORcpxfddiCrx8Q==
X-Received: by 2002:a1c:f607:0:b0:3f1:72ec:4024 with SMTP id w7-20020a1cf607000000b003f172ec4024mr11436863wmc.21.1683016600206;
        Tue, 02 May 2023 01:36:40 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:e265:b513:556a:4149? ([2a01:e0a:982:cbb0:e265:b513:556a:4149])
        by smtp.gmail.com with ESMTPSA id k24-20020a7bc318000000b003f16fc33fbesm34702148wmj.17.2023.05.02.01.36.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 May 2023 01:36:39 -0700 (PDT)
Message-ID: <250067c0-5701-21b8-c728-b946531147fa@linaro.org>
Date:   Tue, 2 May 2023 10:36:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 08/10] clk: qcom: gcc-mdm9615: drop the cxo clock
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230501203401.41393-1-dmitry.baryshkov@linaro.org>
 <20230501203401.41393-9-dmitry.baryshkov@linaro.org>
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230501203401.41393-9-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 01/05/2023 22:33, Dmitry Baryshkov wrote:
> The gcc and lcc devices have been switched to the DT-defined cxo_board
> clock. Now we can drop the manually defined cxo clock.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/clk/qcom/gcc-mdm9615.c | 17 -----------------
>   1 file changed, 17 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gcc-mdm9615.c b/drivers/clk/qcom/gcc-mdm9615.c
> index c1742113b0eb..a28df201e87d 100644
> --- a/drivers/clk/qcom/gcc-mdm9615.c
> +++ b/drivers/clk/qcom/gcc-mdm9615.c
> @@ -26,17 +26,6 @@
>   #include "clk-branch.h"
>   #include "reset.h"
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
>   enum {
>   	P_CXO,
>   	P_PLL8,
> @@ -1618,10 +1607,6 @@ static struct clk_branch ebi2_aon_clk = {
>   	},
>   };
>   
> -static struct clk_hw *gcc_mdm9615_hws[] = {
> -	&cxo.hw,
> -};
> -
>   static struct clk_regmap *gcc_mdm9615_clks[] = {
>   	[PLL0] = &pll0.clkr,
>   	[PLL0_VOTE] = &pll0_vote,
> @@ -1731,8 +1716,6 @@ static const struct qcom_cc_desc gcc_mdm9615_desc = {
>   	.num_clks = ARRAY_SIZE(gcc_mdm9615_clks),
>   	.resets = gcc_mdm9615_resets,
>   	.num_resets = ARRAY_SIZE(gcc_mdm9615_resets),
> -	.clk_hws = gcc_mdm9615_hws,
> -	.num_clk_hws = ARRAY_SIZE(gcc_mdm9615_hws),
>   };
>   
>   static const struct of_device_id gcc_mdm9615_match_table[] = {

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
