Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B86726699C9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jan 2023 15:15:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241818AbjAMOO6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Jan 2023 09:14:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242089AbjAMOOA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Jan 2023 09:14:00 -0500
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F8F42603
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 06:13:05 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id p25so16384748ljn.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 06:13:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Hi9jqg50OEVhl7jCCxFL32jvNeUTrwhRUg3WSRa3Nhs=;
        b=Njb2WSy/HTRM1iWD9SdSD5iB1rNkju6Gl/oI6AsSTZLMNtBdAixr37CUbG/rdrjaYq
         2rGVOCmWdZBM9lmAuZwpX479mYKXJYyGHbzPNui4W+4t/fCjKF2B6lwPDd6flUBPOS30
         QsSPrWDFiSBr/Ep1bDAuxOVQwry4GtZXxPYLYpHT4E8Qe7KllwGShMQEZFPOcnwWCzF/
         +8gUox46LZK90uiUeM4GhyEOqcyhv0kbfz91tckZUHdLObcQh0Jy6vPAuXFtvt8VFYMg
         HCPFbfFuTywrdCPcux6oS2RoGpJhwrzu2l0VNMv+Ff3wUol2Mg8lNFK4G+zUIJO+0cw4
         1XZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hi9jqg50OEVhl7jCCxFL32jvNeUTrwhRUg3WSRa3Nhs=;
        b=ZGl6KdfeFYzLH4PfEAUsCsQBHN80VLQ2rBqY4WYa4BxAN+m3iH8aGkXlMqWK2B5bLN
         dtsJagjnurc0H9616mfuOqI83MeaDGIubbd4QZH4A+YwQh8xWtpp1OSMs1380fXIOcA6
         FeOAlQmNVNO+w8hNBISNWd2JYItg7s2jwSySxGzNxjJUFAAb3LJ8QmrAA8aY0oakInaQ
         KPQLxG+77biak20sPtrXO8xcwre+265aWP0dXoXXLdK22qMBWfCWsnvHF5aWC5P7gd1F
         NVAyKpSaW3mMHAZLHwCfLbwDI7RRFmYT/C5Wyk35LuEIMp16QmexQTlxd48qj/vQROMg
         a+4Q==
X-Gm-Message-State: AFqh2kpFxxexRIPqh5YpRJK6UfPjBjEFwnryzaFMmBvsf1FkBVWBpyhH
        8XjR/v6AOplPtwUjtFULHaV8Ag==
X-Google-Smtp-Source: AMrXdXu5+vCzU9T2ANOfqc3wzs+RVypJughZD6kwOQgZgI7ENe+5pa5XlVkxisOhnZ8vSaUjnpqquQ==
X-Received: by 2002:a2e:be8b:0:b0:281:153d:9b0d with SMTP id a11-20020a2ebe8b000000b00281153d9b0dmr10039651ljr.41.1673619183853;
        Fri, 13 Jan 2023 06:13:03 -0800 (PST)
Received: from [192.168.1.101] (abym53.neoplus.adsl.tpnet.pl. [83.9.32.53])
        by smtp.gmail.com with ESMTPSA id s6-20020ac25fe6000000b004b50b4f63b7sm3842176lfg.170.2023.01.13.06.12.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jan 2023 06:13:01 -0800 (PST)
Message-ID: <3652dfeb-946b-6c1b-74d4-6c3ab9f5e93b@linaro.org>
Date:   Fri, 13 Jan 2023 15:12:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 10/14] clk: qcom: cpu-8996: fix PLL configuration
 sequence
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
 <20230113120544.59320-11-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230113120544.59320-11-dmitry.baryshkov@linaro.org>
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
> Switch both power and performance clocks to the GPLL0/2 (sys_apcs_aux)
> before PLL configuration. Switch them to the ACD afterwards.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/clk/qcom/clk-cpu-8996.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/clk/qcom/clk-cpu-8996.c b/drivers/clk/qcom/clk-cpu-8996.c
> index 571ed52b3026..07d59bca741e 100644
> --- a/drivers/clk/qcom/clk-cpu-8996.c
> +++ b/drivers/clk/qcom/clk-cpu-8996.c
> @@ -432,13 +432,27 @@ static int qcom_cpu_clk_msm8996_register_clks(struct device *dev,
>  {
>  	int i, ret;
>  
> +	/* Select GPLL0 for 300MHz for both clusters */
> +	regmap_write(regmap, PERFCL_REG_OFFSET + MUX_OFFSET, 0xc);
> +	regmap_write(regmap, PWRCL_REG_OFFSET + MUX_OFFSET, 0xc);
> +
> +	/* Ensure write goes through before PLLs are reconfigured */
> +	udelay(5);
> +
>  	clk_alpha_pll_configure(&pwrcl_pll, regmap, &hfpll_config);
>  	clk_alpha_pll_configure(&perfcl_pll, regmap, &hfpll_config);
>  	clk_alpha_pll_configure(&pwrcl_alt_pll, regmap, &altpll_config);
>  	clk_alpha_pll_configure(&perfcl_alt_pll, regmap, &altpll_config);
>  
> +	/* Wait for PLL(s) to lock */
> +	udelay(50);
> +
>  	qcom_cpu_clk_msm8996_acd_init(regmap);
>  
> +	/* Switch clusters to use the ACD leg */
> +	regmap_write(regmap, PWRCL_REG_OFFSET + MUX_OFFSET, 0x2);
> +	regmap_write(regmap, PERFCL_REG_OFFSET + MUX_OFFSET, 0x2);
> +
>  	for (i = 0; i < ARRAY_SIZE(cpu_msm8996_hw_clks); i++) {
>  		ret = devm_clk_hw_register(dev, cpu_msm8996_hw_clks[i]);
>  		if (ret)
