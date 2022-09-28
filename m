Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 862855EDF96
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Sep 2022 17:02:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234595AbiI1PCG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Sep 2022 11:02:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234523AbiI1PCF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Sep 2022 11:02:05 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3518193784
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 08:02:03 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id s14so20330745wro.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 08:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=UMwaiHo1eLQK8IfkiAfCU0lkKLmszBUs//Hb1jAlWoY=;
        b=enbOhPsr6zIPkBsmx40qOuouUrPan0+01WARY8T73AICUgpKOA6dEbIUNaSEO5MUTU
         p2+hCJztXY9lEySCO9QuW5pFkIycqcz2Cmde3ZCUgUPwpkmdFaHn5dVl4gjHo54gg4QE
         7Ar9im1vCB9d6BsOs0r3APyf23A2xbY0fyG4wbSb2VO5x/rthaJNwG1p3Nc8HuEXDwB3
         MXVF5O0e1cZxnKLOw76xhxUQ1qkVP0uLawoIIdzDlvFyf2Yqvo/OmxbYAp//SgVHSq/w
         ybkXgYTKqrsdG4mZiyZemMpp6LUhZy0l4LMerVubMyufYovZby+mRNUbuJJgYW1L5FvI
         DlqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=UMwaiHo1eLQK8IfkiAfCU0lkKLmszBUs//Hb1jAlWoY=;
        b=sxH+0Oi4nItjEX/nRCC5QpoI5dXSMVeNSYq5Q9X0muLwpdnzkSBl1ma3lrJ8yWYvaY
         pSRNluaElTljV3WDfqd4DB0x6V611mGUqj1i9tJkJ/F53sLBzNJhtoCJXLeIzPhc4QBH
         GFtpyolAGuJGRVQA74B4FSYNI3obY+NT4A6mo2Yq6r93shUTgrSSu4jZkvI8GbloN1Vl
         9ExhURZeaO0g5oku+Uc/vKFuSOOWkhscbVNwBA5vX0OMAPWOah195NnUSAKtWm/Uu01F
         hOb/kgTY9OwEtG7gfdK0xxfGA2qvUkTsLghpIvFTzRcgx2L5HrBUxMgOxVGrqpDXFsvD
         cb6g==
X-Gm-Message-State: ACrzQf233pd0S+9icimz9wUDLlKHqv3INxFiyGdsQvpbsP0Y8PKv+m4X
        N44++kut5lM/WiOXEfq07Xbyeg==
X-Google-Smtp-Source: AMsMyM42uI+yVH19PPnULaoaWHiL4YsvauLxANPEcxM5bMgKTHG0BrNhtSEP2dzZ5ETDA2rVtU/4zw==
X-Received: by 2002:adf:a41e:0:b0:22c:c70e:5202 with SMTP id d30-20020adfa41e000000b0022cc70e5202mr3211113wra.412.1664377321759;
        Wed, 28 Sep 2022 08:02:01 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id z8-20020a1cf408000000b003b56be51313sm1449795wma.44.2022.09.28.08.02.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Sep 2022 08:02:01 -0700 (PDT)
Message-ID: <edbe66fd-1956-6e1f-b7a0-228e1b6ba2fa@linaro.org>
Date:   Wed, 28 Sep 2022 16:02:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 3/3] clk: qcom: gcc-msm8939: use ARRAY_SIZE instead of
 specifying num_parents
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220928145609.375860-1-dmitry.baryshkov@linaro.org>
 <20220928145609.375860-4-dmitry.baryshkov@linaro.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20220928145609.375860-4-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 28/09/2022 15:56, Dmitry Baryshkov wrote:
> Use ARRAY_SIZE() instead of manually specifying num_parents. This makes
> adding/removing entries to/from parent_data easy and errorproof.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/clk/qcom/gcc-msm8939.c | 120 ++++++++++++++++-----------------
>   1 file changed, 60 insertions(+), 60 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gcc-msm8939.c b/drivers/clk/qcom/gcc-msm8939.c
> index 9d4f35716990..af608f165896 100644
> --- a/drivers/clk/qcom/gcc-msm8939.c
> +++ b/drivers/clk/qcom/gcc-msm8939.c
> @@ -614,7 +614,7 @@ static struct clk_rcg2 pcnoc_bfdcd_clk_src = {
>   	.clkr.hw.init = &(struct clk_init_data){
>   		.name = "pcnoc_bfdcd_clk_src",
>   		.parent_data = gcc_xo_gpll0_parent_data,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_parent_data),
>   		.ops = &clk_rcg2_ops,
>   	},
>   };

Nice

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
