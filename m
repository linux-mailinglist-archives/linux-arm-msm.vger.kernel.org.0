Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 013B26699B8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jan 2023 15:14:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241474AbjAMOOm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Jan 2023 09:14:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242004AbjAMONr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Jan 2023 09:13:47 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 951771FD
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 06:12:23 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id f34so33282725lfv.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 06:12:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=En6+9NtPq0cL6pgLkk3Lk7L87C6wEHAcnDtilEjgyv4=;
        b=dwdrzFnsNMJoa72espmDYyu55tWlVZLFg+m/evyIAPSkLyny/T4KntGp8d795iyIOc
         fXijK8URtFCrVavv/swra/ekqCnXwJXG5TI2evOAqp70g6CNyshAcxBK+sF8QtJf8ByY
         7mTipsFdVwKGdjdq5iXkmslKtsSsOOoMSA8Ell3s+5EvBzY7momTSzRPFVmjmfdqYabg
         UJCNgu/+7M/+hlP66XJfcNNOxXxfNzcx7LwoEVpQTCBNv11xwDDlRcWBFawnUHCy7Frn
         IuSq15spOrdi/WQvkaRwE5nyU1QXBg3lqRmPdnfwOnZgTvXlg1viFhumOtdoQh2pE4B1
         f0ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=En6+9NtPq0cL6pgLkk3Lk7L87C6wEHAcnDtilEjgyv4=;
        b=nJiP8HMA+FMmBqkUhmKqouPlsOuevF75xFL81RNxondXm3VWceeyJP6jda8bT4zMCU
         Gee+y61ayTxMAQ54VNIAYxrdkoW7MyfFAe/40e8YkDslHuP4T84W6Zvqmpvx8Jnx1uWo
         4vyu71zNVZdU2OI8nwuC/bPQuNcPDhFe/r3W9wYtbRuelbgG1qYdEtQYXxvn84aC03FC
         PPrHiqeynOFJfU+eXni9tbQmKYV6LQpxsR2XdBk/GHIEAAqo1pDaNkiypDA0ySZNH6DG
         fCavrkjs4PIiRh1cgVYF4vosIpUZbVxD8FbBrhIMGVswfwBvqrQU44dHz6yJJ9YzMs29
         g0/A==
X-Gm-Message-State: AFqh2kp6JlBDkRhvV0Nr4mWuWG4aLo/00ormG0QmsJdZLxwFMMx84p8d
        YynczNSGiqmUXqjiCUyaIcSSqw==
X-Google-Smtp-Source: AMrXdXtl8kS3kvJBbDmT9skJ2W3irXsY5NG6zfXorTDNi52N6WtxE/d1k33jns7RIT7fpu/jNse6CA==
X-Received: by 2002:a05:6512:2314:b0:4cb:4571:9efe with SMTP id o20-20020a056512231400b004cb45719efemr15963804lfu.35.1673619141886;
        Fri, 13 Jan 2023 06:12:21 -0800 (PST)
Received: from [192.168.1.101] (abym53.neoplus.adsl.tpnet.pl. [83.9.32.53])
        by smtp.gmail.com with ESMTPSA id i7-20020ac25227000000b004ac6a444b26sm3851518lfl.141.2023.01.13.06.12.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jan 2023 06:12:20 -0800 (PST)
Message-ID: <8ffac2a3-bbdd-06f2-b13f-8858eb9b1383@linaro.org>
Date:   Fri, 13 Jan 2023 15:12:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 04/14] clk: qcom: cpu-8996: fix the init clock rate
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
 <20230113120544.59320-5-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230113120544.59320-5-dmitry.baryshkov@linaro.org>
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
> Current multiplier (60) results in CPU getting the rate which is
> unlisted in the CPU frequency tables (60 * 19.2 = 1152 MHz). This
> results in warnings from the cpufreq during startup.
> 
> Change PLL programming (l = 54) to init CPU clocks to start with the
> frequency of 54 * 19.2 = 1036.8 MHz which is supported by both power and
> performance clusters from all speed bins.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/clk/qcom/clk-cpu-8996.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/clk-cpu-8996.c b/drivers/clk/qcom/clk-cpu-8996.c
> index ed8cb558e1aa..d51965fda56d 100644
> --- a/drivers/clk/qcom/clk-cpu-8996.c
> +++ b/drivers/clk/qcom/clk-cpu-8996.c
> @@ -102,7 +102,7 @@ static const u8 alt_pll_regs[PLL_OFF_MAX_REGS] = {
>  /* PLLs */
>  
>  static const struct alpha_pll_config hfpll_config = {
> -	.l = 60,
> +	.l = 54,
>  	.config_ctl_val = 0x200d4828,
>  	.config_ctl_hi_val = 0x006,
>  	.test_ctl_val = 0x1c000000,
