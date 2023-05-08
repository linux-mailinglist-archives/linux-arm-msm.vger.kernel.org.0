Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 967D66FA1A6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 May 2023 09:55:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233614AbjEHHzZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 May 2023 03:55:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233607AbjEHHzX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 May 2023 03:55:23 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D3EA1BFE
        for <linux-arm-msm@vger.kernel.org>; Mon,  8 May 2023 00:55:22 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-4f2510b2b98so518680e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 May 2023 00:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683532521; x=1686124521;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q2ALHLGEvKmJVohfNvJg1us24FkLGEto5t+03iCusFw=;
        b=tLTXGa6UnaZthxqnkQq4HYXhlaSRjRUR3QIK3DO/EWNL6Dg63Ddvc9GNrVVswwIaxi
         rjg9a4c5U7BsDH6FGxXndCrP5TkKankUdemMjNOh5rEQJ93Ju6ut9pQLEzx+O1gD1dBZ
         2fNc3iZ924yHNZkODXhrrS7GLytn1crRJMGxkXhGmVHln6/T3Uk9m0SmhoQGc6tSR7dO
         ImA1LXpvCn0x/+8aZPRYHLjRm7VKpAvjKtmO+d1nb7DbeyclvLUu9hlR3it81C2J1m4D
         zo+1fpsqM7waJnzw4Hkl4pYsjQnRe0iX4zQyd53DGG5hs7Mf9mLpK08sb+ev4JpvJycB
         nmjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683532521; x=1686124521;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q2ALHLGEvKmJVohfNvJg1us24FkLGEto5t+03iCusFw=;
        b=dWUasZWF0fqhdhHwZfMbNpVa6ar1v2UO+wTd7PUn0BwNq06MsEpfN6ywM+UQsCXXDg
         /fQ7IsrIcjJcephzsNPhSqVA3fV8p5s/DSHp+E3k37ekZPtE9wKb0MIanIEutxlW+0lK
         Ef3PFRWLXeHCIQqDicKjGOMBb+xaIJZ5BKss193r62IaaLndtSwNqWIE2SvFel+Uxuuh
         AK/StOspgFuHcFohckKEjljcKCkarjPZ6LQsVmoxw3LYwZV2vheGE/6BY7DSdIkmrsNk
         PpIv4+MaH8HQJj/f2djjIHd15e+NSq95QXtZav0AD6wRHOKDRw3bF+qWo2BMuUl1CjTg
         lqtA==
X-Gm-Message-State: AC+VfDy/BoafLGDfXaYWLS+dMEz2Wlrh9eOHKHj4mj0po+tM5hdLfjOJ
        jDB4ZbEO4Z2sEtxss5YtWhEfMQ==
X-Google-Smtp-Source: ACHHUZ62wPngHnjMNGrTLtyaL6+Y0BFQatHP4ZzR8IBJ0Rg2RKczNqRFnEsNJsMHpjthzqJGb59F7w==
X-Received: by 2002:ac2:521b:0:b0:4eb:43f5:738e with SMTP id a27-20020ac2521b000000b004eb43f5738emr2612353lfl.60.1683532520730;
        Mon, 08 May 2023 00:55:20 -0700 (PDT)
Received: from [192.168.1.101] (abyl248.neoplus.adsl.tpnet.pl. [83.9.31.248])
        by smtp.gmail.com with ESMTPSA id c7-20020ac24147000000b004f13b59307asm1204133lfi.232.2023.05.08.00.55.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 May 2023 00:55:20 -0700 (PDT)
Message-ID: <70b06c2a-de21-b14f-b3b2-82e40762f862@linaro.org>
Date:   Mon, 8 May 2023 09:55:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 1/2] clk: qcom: mmcc-msm8974: use clk_rcg2_shared_ops for
 mdp_clk_src clock
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20230507175335.2321503-1-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230507175335.2321503-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 7.05.2023 19:53, Dmitry Baryshkov wrote:
> The mdp_clk_src clock should not be turned off. Instead it should be
> 'parked' to the XO, as most of other mdp_clk_src clocks. Fix that by
> using the clk_rcg2_shared_ops.
> 
> Fixes: d8b212014e69 ("clk: qcom: Add support for MSM8974's multimedia clock controller (MMCC)")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
I am inclined to think it's true, however I can't see any evidence
of this being done on the vendor kernel.. I am however not a licensed
archaeologist so I might have missed it.. Hence I'll do:

Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/clk/qcom/mmcc-msm8974.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/mmcc-msm8974.c b/drivers/clk/qcom/mmcc-msm8974.c
> index 4273fce9a4a4..aa29c79fcd55 100644
> --- a/drivers/clk/qcom/mmcc-msm8974.c
> +++ b/drivers/clk/qcom/mmcc-msm8974.c
> @@ -485,7 +485,7 @@ static struct clk_rcg2 mdp_clk_src = {
>  		.name = "mdp_clk_src",
>  		.parent_data = mmcc_xo_mmpll0_dsi_hdmi_gpll0,
>  		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_dsi_hdmi_gpll0),
> -		.ops = &clk_rcg2_ops,
> +		.ops = &clk_rcg2_shared_ops,
>  	},
>  };
>  
