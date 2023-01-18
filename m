Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F67B671E5F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 14:52:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230133AbjARNv6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Jan 2023 08:51:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230114AbjARNvf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Jan 2023 08:51:35 -0500
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE27423656
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 05:22:26 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id ud5so83233735ejc.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 05:22:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SyETya9J8nxAxFrENMnlTL//0+Ln7pMx/qK2596DM28=;
        b=XsiJYGgNlxZHyqh9V2BLU6R0hJmWC96Cf0IqgWjC2xCMob6bkx+XT5obQcHg+mVkVn
         uv+sCDZOJfC9cN1TICvfQ/Zm1TwDNzWtvlf+l3tjSLpkexi6z5M+lB4DdX0Mz7BUsxfN
         N6JhFfdKy0VY2kkpZ2q0Rtno/1KBk42j6Bp6RXlQEzgZaEZtXrLtomED+SSZCZ2buLKi
         tbncdt8EIwyMjTYAi9n0YaFRIb5AHXmsrm6Ew0x5egNQrIu5XN3DsOsfpqf9c8gVlNbh
         ZwsmaYW9ocEATG7lgVzTRrrOijDXgWRqeZfJhuIuq9e3gy401Pc6C+2mPvDwqcrz8v/4
         rXBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SyETya9J8nxAxFrENMnlTL//0+Ln7pMx/qK2596DM28=;
        b=13ZVY1QshY4mPhCvuHR2/e2bvpvI7vm+AMj+Ism338J24EovnMg7U8K6v8rGIvzZkE
         V/3MlgEcUxbnvWqbD0sRFau0VhyMSvBybBgBF9K1QfDaFyXK4abSxvnZVBMEq4ySXldU
         8wQeQjP2cPmL3ILKg04GkUKnTosUbOVncz6rpO9ZFy96U5XPZWl+6g22y8aLWlway4mL
         0/pcByEVmV9eX2I5NbUmZAMbVZP1Qh14Phc4uDVqnGLBjp8I3kLEaxP0KT3X6Ec5ibcT
         VZNMCzsJdTpl3wrpWiteHt1vphE3EvbXTN22k/iX4KbJhnRg0JWRL2Abg5SHXYXi2kiD
         DWLA==
X-Gm-Message-State: AFqh2kr92mKITrlhMmQS7XBNFe0Sb5nGkgjxwhNYwquS2JlpuFIqgDmu
        Ka3H2uV/ASaP1OWM7wZUoO6zYA==
X-Google-Smtp-Source: AMrXdXumI3LnLjrODIkRwdlfVo7XPFCzuq1zMuzKCmbVt3UZy2jZB9Y230A2uuDcYxpzosH4jmICAw==
X-Received: by 2002:a17:907:6746:b0:84d:1c67:97d7 with SMTP id qm6-20020a170907674600b0084d1c6797d7mr7664734ejc.30.1674048145282;
        Wed, 18 Jan 2023 05:22:25 -0800 (PST)
Received: from [192.168.1.101] (abxh252.neoplus.adsl.tpnet.pl. [83.9.1.252])
        by smtp.gmail.com with ESMTPSA id lj1-20020a170906f9c100b0078d22b0bcf2sm14586201ejb.168.2023.01.18.05.22.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jan 2023 05:22:24 -0800 (PST)
Message-ID: <f4e65645-3951-3a38-63fd-d96f48608737@linaro.org>
Date:   Wed, 18 Jan 2023 14:22:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] clk: qcom: rpmh: remove duplicate IPA clock reference
Content-Language: en-US
To:     Arnd Bergmann <arnd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, Alex Elder <elder@linaro.org>,
        Richard Acayan <mailingradian@gmail.com>,
        Abel Vesa <abel.vesa@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230117170217.2462320-1-arnd@kernel.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230117170217.2462320-1-arnd@kernel.org>
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



On 17.01.2023 18:02, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> One of the ones that were recently added was already there:
> 
> drivers/clk/qcom/clk-rpmh.c:578:35: error: initialized field overwritten [-Werror=override-init]
>   578 |         [RPMH_IPA_CLK]          = &clk_rpmh_ipa.hw,
> 
> Fixes: aa055bf158cd ("clk: qcom: rpmh: define IPA clocks where required")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/clk/qcom/clk-rpmh.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
> index 393b83f6020e..45ee370f3307 100644
> --- a/drivers/clk/qcom/clk-rpmh.c
> +++ b/drivers/clk/qcom/clk-rpmh.c
> @@ -575,7 +575,6 @@ static struct clk_hw *sc8280xp_rpmh_clocks[] = {
>  	[RPMH_IPA_CLK]          = &clk_rpmh_ipa.hw,
>  	[RPMH_PKA_CLK]          = &clk_rpmh_pka.hw,
>  	[RPMH_HWKM_CLK]         = &clk_rpmh_hwkm.hw,
> -	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
>  };
>  
>  static const struct clk_rpmh_desc clk_rpmh_sc8280xp = {
