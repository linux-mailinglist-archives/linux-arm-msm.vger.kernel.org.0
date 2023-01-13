Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B82286699B2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jan 2023 15:14:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241536AbjAMOOR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Jan 2023 09:14:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241969AbjAMONk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Jan 2023 09:13:40 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7521BBCBB
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 06:11:48 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id v25so33260351lfe.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 06:11:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hmVCGE1tKLftZsOP61jEhuxWLcIpwarx5xis4uY5iM8=;
        b=q75rohoF5reGmdgS4Dx+nJ6bPP8PK2iIxn70zQYLBmq4CToQVpJDU1I3Q2hZUtCfE+
         GYKQ51z3H7wxooH61waoQxitR8DQXQauJ0KFSd/vw+xvkUgIc5h+s6g+PJcbIMcSIqyE
         L2J7p1Zd+XOsa70fC/B05rksPGZdngjmUj3C5o1Imho+xIgF2FJJKiMIavgKxg+/v6iu
         vwRQhW6OpX75UnlhEGup/GLqkL5S6fTgzkoUeUSEVUphCrRoqhzNPaTB0vqUR3YQl/fS
         QvemjUDdXwWEsxMCP+P7w4JohTBRb8JHzm7RstsGlp1tpBxR+G9pGivmNStxSWEee+6Z
         PVEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hmVCGE1tKLftZsOP61jEhuxWLcIpwarx5xis4uY5iM8=;
        b=bq+hz9hmlQceIqq407l9sKzUHrc9ebbDxQ1gR2zBhRXbQRtGb1aeisrq3ZRcZ5vBBC
         ijNwHQydxMIT3SAQskifrVuwxq9tFrQdzm2IIlN/m8MEn6Ku3i6d9L2BNmWoPx/OGmDi
         LdH4hJZO/S5VSGgHYO51h/qXU3hykFJK4zTocq/rlPht35lU74vDazp0c/rLd8rNN2CY
         k0rq0qsSaIPhPV3CviKiYvnP//b5qJhx6KoULD6MN0FKbP5wE4Zog76IMyBXaSU8sS6z
         kLNbBSpbZy4qhSJKQ5N4NkaifDmERxvYtoz8K9INHKvwY/Swtr72G/rcXEUQsepRh3lJ
         wFtA==
X-Gm-Message-State: AFqh2krmJEviC9jenjMiN1AjHFqBEhC983bPU1RsPoSogLZlz01yQHeY
        ZIxq3yxaXDg1GCeyhijcpLdzKA==
X-Google-Smtp-Source: AMrXdXvirc+w/7gNZGxPeG/Zp+UuUfdNfgq2ii1n23Ya9cXgO9etGE9u+6wb1an3zlrHT6cS3uA9Tg==
X-Received: by 2002:a05:6512:1115:b0:4aa:e120:b431 with SMTP id l21-20020a056512111500b004aae120b431mr27335485lfg.38.1673619106753;
        Fri, 13 Jan 2023 06:11:46 -0800 (PST)
Received: from [192.168.1.101] (abym53.neoplus.adsl.tpnet.pl. [83.9.32.53])
        by smtp.gmail.com with ESMTPSA id cf37-20020a056512282500b004d254939bebsm99737lfb.305.2023.01.13.06.11.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jan 2023 06:11:45 -0800 (PST)
Message-ID: <5f8faea9-fca6-004f-563c-6a88e6f70943@linaro.org>
Date:   Fri, 13 Jan 2023 15:11:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 02/14] clk: qcom: clk-alpha-pll: program
 PLL_TEST/PLL_TEST_U if required
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
References: <20230113120544.59320-1-dmitry.baryshkov@linaro.org>
 <20230113120544.59320-3-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230113120544.59320-3-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_HTTP,RCVD_IN_SORBS_SOCKS,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 13.01.2023 13:05, Dmitry Baryshkov wrote:
> Program PLL_TEST and PLL_TEST_U registers if required by the pll
> configuration.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/clk/qcom/clk-alpha-pll.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
> index f9e4cfd7261c..e266379427f2 100644
> --- a/drivers/clk/qcom/clk-alpha-pll.c
> +++ b/drivers/clk/qcom/clk-alpha-pll.c
> @@ -358,6 +358,11 @@ void clk_alpha_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
>  
>  	regmap_update_bits(regmap, PLL_USER_CTL(pll), mask, val);
>  
> +	clk_alpha_pll_write_config(regmap, PLL_TEST_CTL(pll),
> +						config->test_ctl_val);
> +	clk_alpha_pll_write_config(regmap, PLL_TEST_CTL_U(pll),
> +						config->test_ctl_hi_val);
> +
>  	if (pll->flags & SUPPORTS_FSM_MODE)
>  		qcom_pll_set_fsm_mode(regmap, PLL_MODE(pll), 6, 0);
>  }
