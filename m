Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66012642755
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Dec 2022 12:17:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230317AbiLELR1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Dec 2022 06:17:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230117AbiLELR0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Dec 2022 06:17:26 -0500
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3335517589
        for <linux-arm-msm@vger.kernel.org>; Mon,  5 Dec 2022 03:17:25 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id bj12so26898705ejb.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Dec 2022 03:17:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+uwiDGo5iXEyQhfF9TxujAu4nxCjo02A9VsTl3PXQBE=;
        b=zB+DjXSsXdM73/tC+qe3HFYVCirITKqAu6TlZWR9fYdZN5EROdC1vmPSYOBpIGECP2
         JsTPuwS2FRksuq0TS8RAq2vceymopy+AyEML/tQa18Ls7Kdq5oSYh9ZHGokLyFd1j7Vb
         mMV0vjBMW0Yn/174wIzbU7PNzLEAdR/WPuDTLh4GU5JkEYS/J39R8x+ttjdX/9aLZcs+
         h5mBlkygP5gH1KanuDN+AkSG2PdgUaUjtgNgIAWg4pQyFHMTqADk/VI65+dbCZbCYkVn
         v8g9koEQYkMk26YtmI1nXx5HuaWgs223Bc2wtuIi+nzJ0cFxnbqFgA6fwctObqrvsuSA
         2ivw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+uwiDGo5iXEyQhfF9TxujAu4nxCjo02A9VsTl3PXQBE=;
        b=sEvJp+bC1qN8LKgeWBCgSfv7+h4Ippf7E3lRH7NiQp/rQW3Oa0Y7a6OlSI2Zhs/RbW
         Wyt1UioqVRqP3keHarTepchvrcC4jJ8oMz6b6jC//zxFykKBajXVKjVlSQ4FVrUSqG+N
         83CryjiW3qYW3qiWOWarI4Kcsj3M2QmNz8Mf+N05oI9K7rxuBi0AfSQ+N3Qq04M9IEuA
         iQh6eO5nvff7ng3Bs+2iBN2G4yjGTdfkh4wIX9u+OuvgYGG8ieYoDSiMMxhV8tdxNgch
         3u/J/UlCncy2Spzz7fC4F7k8ZAuo5f2y3DQc1Ex5joRCrK9CZ2UF4Y+ZTD7UNITDTO1a
         p3ZQ==
X-Gm-Message-State: ANoB5pmeeRIhwTtZS13TNNHdVHmqP9SSnrruptJ6IKgLjsU/7CDImbs/
        N9BWOsJGTMrb5ZpyAN7yTmAb2A==
X-Google-Smtp-Source: AA0mqf4yTSC+TY+b5UhzyoRRZuY0c9TpldfT5FT+EtOe22NzNqIjxrgE7GIj+tyA7CtV/Tb3UeJWSw==
X-Received: by 2002:a17:906:a094:b0:7ad:88f8:761f with SMTP id q20-20020a170906a09400b007ad88f8761fmr65433998ejy.417.1670239043527;
        Mon, 05 Dec 2022 03:17:23 -0800 (PST)
Received: from [192.168.31.208] ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id h4-20020aa7c604000000b0045bd14e241csm6097631edq.76.2022.12.05.03.17.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Dec 2022 03:17:22 -0800 (PST)
Message-ID: <9b99b85e-7d58-af5b-22d7-9ab73b9f5b99@linaro.org>
Date:   Mon, 5 Dec 2022 12:17:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH 04/16] clk: qcom: smd-rpm: add missing ln_bb_clkN clocks
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Alex Elder <elder@linaro.org>
References: <20221203175808.859067-1-dmitry.baryshkov@linaro.org>
 <20221203175808.859067-5-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221203175808.859067-5-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 03/12/2022 18:57, Dmitry Baryshkov wrote:
> Newer platforms (msm8998, sdm660, sm6125) have low noise LN_BB_CLKn
> clocks. The driver already uses proper clock indices
> (RPM_SMD_LN_BB_CLKn). Fix clock names used by these platforms.
> 
> Fixes: a0384ecfe2aa ("clk: qcom: smd-rpm: De-duplicate identical entries")
> Fixes: edeb2ca74716 ("clk: qcom: smd: Add support for SM6125 rpm clocks")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>   drivers/clk/qcom/clk-smd-rpm.c | 44 ++++++++++++++++++----------------
>   1 file changed, 24 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
> index 26c4738eaacf..42d55bf35a33 100644
> --- a/drivers/clk/qcom/clk-smd-rpm.c
> +++ b/drivers/clk/qcom/clk-smd-rpm.c
> @@ -852,6 +852,10 @@ static const struct rpm_smd_clk_desc rpm_clk_qcs404 = {
>   	.num_clks = ARRAY_SIZE(qcs404_clks),
>   };
>   
> +DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8998, ln_bb_clk1, ln_bb_clk1_a, 1, 19200000);
> +DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8998, ln_bb_clk1_pin, ln_bb_clk1_a_pin, 1, 19200000);
> +DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8998, ln_bb_clk2, ln_bb_clk2_a, 2, 19200000);
> +DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8998, ln_bb_clk2_pin, ln_bb_clk2_a_pin, 2, 19200000);
>   DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8998, ln_bb_clk3, ln_bb_clk3_a, 3, 19200000);
>   DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8998, ln_bb_clk3_pin, ln_bb_clk3_a_pin, 3, 19200000);
>   DEFINE_CLK_SMD_RPM(msm8998, aggre1_noc_clk, aggre1_noc_a_clk,
> @@ -882,16 +886,16 @@ static struct clk_smd_rpm *msm8998_clks[] = {
>   	[RPM_SMD_DIV_A_CLK3] = &msm8992_div_clk3_a,
>   	[RPM_SMD_IPA_CLK] = &msm8976_ipa_clk,
>   	[RPM_SMD_IPA_A_CLK] = &msm8976_ipa_a_clk,
> -	[RPM_SMD_LN_BB_CLK1] = &msm8916_bb_clk1,
> -	[RPM_SMD_LN_BB_CLK1_A] = &msm8916_bb_clk1_a,
> -	[RPM_SMD_LN_BB_CLK2] = &msm8916_bb_clk2,
> -	[RPM_SMD_LN_BB_CLK2_A] = &msm8916_bb_clk2_a,
> +	[RPM_SMD_LN_BB_CLK1] = &msm8998_ln_bb_clk1,
> +	[RPM_SMD_LN_BB_CLK1_A] = &msm8998_ln_bb_clk1_a,
> +	[RPM_SMD_LN_BB_CLK2] = &msm8998_ln_bb_clk2,
> +	[RPM_SMD_LN_BB_CLK2_A] = &msm8998_ln_bb_clk2_a,
>   	[RPM_SMD_LN_BB_CLK3] = &msm8998_ln_bb_clk3,
>   	[RPM_SMD_LN_BB_CLK3_A] = &msm8998_ln_bb_clk3_a,
> -	[RPM_SMD_LN_BB_CLK1_PIN] = &msm8916_bb_clk1_pin,
> -	[RPM_SMD_LN_BB_CLK1_A_PIN] = &msm8916_bb_clk1_a_pin,
> -	[RPM_SMD_LN_BB_CLK2_PIN] = &msm8916_bb_clk2_pin,
> -	[RPM_SMD_LN_BB_CLK2_A_PIN] = &msm8916_bb_clk2_a_pin,
> +	[RPM_SMD_LN_BB_CLK1_PIN] = &msm8998_ln_bb_clk1_pin,
> +	[RPM_SMD_LN_BB_CLK1_A_PIN] = &msm8998_ln_bb_clk1_a_pin,
> +	[RPM_SMD_LN_BB_CLK2_PIN] = &msm8998_ln_bb_clk2_pin,
> +	[RPM_SMD_LN_BB_CLK2_A_PIN] = &msm8998_ln_bb_clk2_a_pin,
>   	[RPM_SMD_LN_BB_CLK3_PIN] = &msm8998_ln_bb_clk3_pin,
>   	[RPM_SMD_LN_BB_CLK3_A_PIN] = &msm8998_ln_bb_clk3_a_pin,
>   	[RPM_SMD_MMAXI_CLK] = &msm8996_mmssnoc_axi_rpm_clk,
> @@ -946,18 +950,18 @@ static struct clk_smd_rpm *sdm660_clks[] = {
>   	[RPM_SMD_RF_CLK1_A] = &msm8916_rf_clk1_a,
>   	[RPM_SMD_DIV_CLK1] = &msm8974_div_clk1,
>   	[RPM_SMD_DIV_A_CLK1] = &msm8974_div_a_clk1,
> -	[RPM_SMD_LN_BB_CLK] = &msm8916_bb_clk1,
> -	[RPM_SMD_LN_BB_A_CLK] = &msm8916_bb_clk1_a,
> -	[RPM_SMD_LN_BB_CLK2] = &msm8916_bb_clk2,
> -	[RPM_SMD_LN_BB_CLK2_A] = &msm8916_bb_clk2_a,
> +	[RPM_SMD_LN_BB_CLK] = &msm8998_ln_bb_clk1,
> +	[RPM_SMD_LN_BB_A_CLK] = &msm8998_ln_bb_clk1_a,
> +	[RPM_SMD_LN_BB_CLK2] = &msm8998_ln_bb_clk2,
> +	[RPM_SMD_LN_BB_CLK2_A] = &msm8998_ln_bb_clk2_a,
>   	[RPM_SMD_LN_BB_CLK3] = &msm8998_ln_bb_clk3,
>   	[RPM_SMD_LN_BB_CLK3_A] = &msm8998_ln_bb_clk3_a,
>   	[RPM_SMD_RF_CLK1_PIN] = &msm8916_rf_clk1_pin,
>   	[RPM_SMD_RF_CLK1_A_PIN] = &msm8916_rf_clk1_a_pin,
> -	[RPM_SMD_LN_BB_CLK1_PIN] = &msm8916_bb_clk1_pin,
> -	[RPM_SMD_LN_BB_CLK1_A_PIN] = &msm8916_bb_clk1_a_pin,
> -	[RPM_SMD_LN_BB_CLK2_PIN] = &msm8916_bb_clk2_pin,
> -	[RPM_SMD_LN_BB_CLK2_A_PIN] = &msm8916_bb_clk2_a_pin,
> +	[RPM_SMD_LN_BB_CLK1_PIN] = &msm8998_ln_bb_clk1_pin,
> +	[RPM_SMD_LN_BB_CLK1_A_PIN] = &msm8998_ln_bb_clk1_a_pin,
> +	[RPM_SMD_LN_BB_CLK2_PIN] = &msm8998_ln_bb_clk2_pin,
> +	[RPM_SMD_LN_BB_CLK2_A_PIN] = &msm8998_ln_bb_clk2_a_pin,
>   	[RPM_SMD_LN_BB_CLK3_PIN] = &msm8998_ln_bb_clk3_pin,
>   	[RPM_SMD_LN_BB_CLK3_A_PIN] = &msm8998_ln_bb_clk3_a_pin,
>   };
> @@ -1057,10 +1061,10 @@ static struct clk_smd_rpm *sm6125_clks[] = {
>   	[RPM_SMD_IPA_A_CLK] = &msm8976_ipa_a_clk,
>   	[RPM_SMD_CE1_CLK] = &msm8992_ce1_clk,
>   	[RPM_SMD_CE1_A_CLK] = &msm8992_ce1_a_clk,
> -	[RPM_SMD_LN_BB_CLK1] = &msm8916_bb_clk1,
> -	[RPM_SMD_LN_BB_CLK1_A] = &msm8916_bb_clk1_a,
> -	[RPM_SMD_LN_BB_CLK2] = &msm8916_bb_clk2,
> -	[RPM_SMD_LN_BB_CLK2_A] = &msm8916_bb_clk2_a,
> +	[RPM_SMD_LN_BB_CLK1] = &msm8998_ln_bb_clk1,
> +	[RPM_SMD_LN_BB_CLK1_A] = &msm8998_ln_bb_clk1_a,
> +	[RPM_SMD_LN_BB_CLK2] = &msm8998_ln_bb_clk2,
> +	[RPM_SMD_LN_BB_CLK2_A] = &msm8998_ln_bb_clk2_a,
>   	[RPM_SMD_LN_BB_CLK3] = &msm8998_ln_bb_clk3,
>   	[RPM_SMD_LN_BB_CLK3_A] = &msm8998_ln_bb_clk3_a,
>   	[RPM_SMD_QUP_CLK] = &sm6125_qup_clk,
