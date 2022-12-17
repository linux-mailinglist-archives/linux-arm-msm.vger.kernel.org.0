Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 506CA64F9BB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Dec 2022 16:15:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229870AbiLQPPx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 17 Dec 2022 10:15:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229844AbiLQPPv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 17 Dec 2022 10:15:51 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 941CAB7CD
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Dec 2022 07:15:49 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id j4so7828232lfk.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Dec 2022 07:15:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=knyQqy4QxZq7+yTs3CXGmVoBKXjPq0E4xQ9QkF7zAmo=;
        b=Mdok6UFh4KMjb+BzPDy7zf9ZH99FQdt0etcJWC7YQ1u0FfcRY7e9SOeW4nNMShpvEf
         4DXi71SJq+54LfGoQv3h34N+33E39y9uc4FdFnkciOZlyEnmb4mv3fnqNMf6+SyXdvu6
         t3UiSQWYGG/AlL6YvlLJ6Z9R1OF7+qt6hpb4/ys9Y0XC2FCSFgsh6Rwfrgni5qtbE97a
         /EO6saDYt5468IFNepiic4ScTtiuniZkl8OXYINzC349EnVYpVWNZiLKezL5ZfMMjvOO
         0aK/EDqgiOjwMmom5g2jj/qOE/b18k9fPGYZMl7zxO0ADocQuLOIkfvFpGkrBkarLvX4
         wt4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=knyQqy4QxZq7+yTs3CXGmVoBKXjPq0E4xQ9QkF7zAmo=;
        b=R7xjgptXXgVfEvbUVQ0HTgWptIM07EOH+YOWj9x7AIVObSpzNJ3zDUTNni61Fpt6pb
         7DcLeV2l0plkKcJ4PPNPnKUCeAGPa+UFL5X8NXUXqdtzMnw4xd9V7j9qxQfl3kuUb1zM
         HRgi/wAwnlBE2JuWqZcBbVUxIYM79zv29ckLmxSyOnXUmWEcCnbcpRFRXbvg7dSeajpL
         aJw5wj/6NQj1X/nmcgTURUQyLxPe5F6mqHs++dgsGS/kxfVoAqxHC0dGn82zPWjQ/fMI
         Nb1Kek3inYOca9ek0VuB3Q+PzPW1jB8qDLZ52wWDH7KYqVSgDH8Bf2NQN8f2dTQ/tbFy
         hEbg==
X-Gm-Message-State: ANoB5pn+CXP0U1TG7FtE8PRK94Xzdfx+LMLOp6R+Bi0z8soV0FCv9zwg
        hYaD6cIA38p0fti1lFNrwxQJ5w==
X-Google-Smtp-Source: AA0mqf6Jf2r3Uk3tRMHMvY37pAvfB7xgLKS46NddePEkK6MKhBwFAxIGgxqWUuVJxuMQizUjGpZmrA==
X-Received: by 2002:a05:6512:29b:b0:4b5:6f7b:8cfe with SMTP id j27-20020a056512029b00b004b56f7b8cfemr10899408lfp.41.1671290147932;
        Sat, 17 Dec 2022 07:15:47 -0800 (PST)
Received: from [192.168.1.101] (abxh44.neoplus.adsl.tpnet.pl. [83.9.1.44])
        by smtp.gmail.com with ESMTPSA id u22-20020ac258d6000000b004b52aea5ff8sm532076lfo.30.2022.12.17.07.15.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Dec 2022 07:15:47 -0800 (PST)
Message-ID: <e413ac96-085d-34d5-207a-e06d2a57f6de@linaro.org>
Date:   Sat, 17 Dec 2022 16:15:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 12/15] clk: qcom: gcc-qcs404: add support for GDSCs
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
 <20221217001730.540502-13-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221217001730.540502-13-dmitry.baryshkov@linaro.org>
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
> Add support for two GDSCs provided by this clock controller.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/clk/qcom/gcc-qcs404.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/drivers/clk/qcom/gcc-qcs404.c b/drivers/clk/qcom/gcc-qcs404.c
> index 8fb268671f0c..f8dbfffc2b8e 100644
> --- a/drivers/clk/qcom/gcc-qcs404.c
> +++ b/drivers/clk/qcom/gcc-qcs404.c
> @@ -19,6 +19,7 @@
>  #include "clk-rcg.h"
>  #include "clk-regmap.h"
>  #include "common.h"
> +#include "gdsc.h"
>  #include "reset.h"
>  
>  enum {
> @@ -2598,6 +2599,22 @@ static struct clk_branch gcc_wdsp_q6ss_axim_clk = {
>  	},
>  };
>  
> +static struct gdsc mdss_gdsc = {
> +	.gdscr = 0x4d078,
> +	.pd = {
> +		.name = "mdss",
> +	},
> +	.pwrsts = PWRSTS_OFF_ON,
> +};
> +
> +static struct gdsc oxili_gdsc = {
> +	.gdscr = 0x5901c,
> +	.pd = {
> +		.name = "oxili",
> +	},
> +	.pwrsts = PWRSTS_OFF_ON,
> +};
> +
>  static struct clk_hw *gcc_qcs404_hws[] = {
>  	&cxo.hw,
>  };
> @@ -2748,6 +2765,11 @@ static struct clk_regmap *gcc_qcs404_clocks[] = {
>  
>  };
>  
> +static struct gdsc *gcc_qcs404_gdscs[] = {
> +	[MDSS_GDSC] = &mdss_gdsc,
> +	[OXILI_GDSC] = &oxili_gdsc,
> +};
> +
>  static const struct qcom_reset_map gcc_qcs404_resets[] = {
>  	[GCC_GENI_IR_BCR] = { 0x0F000 },
>  	[GCC_CDSP_RESTART] = { 0x18000 },
> @@ -2790,6 +2812,8 @@ static const struct qcom_cc_desc gcc_qcs404_desc = {
>  	.num_resets = ARRAY_SIZE(gcc_qcs404_resets),
>  	.clk_hws = gcc_qcs404_hws,
>  	.num_clk_hws = ARRAY_SIZE(gcc_qcs404_hws),
> +	.gdscs = gcc_qcs404_gdscs,
> +	.num_gdscs = ARRAY_SIZE(gcc_qcs404_gdscs),
>  };
>  
>  static const struct of_device_id gcc_qcs404_match_table[] = {
