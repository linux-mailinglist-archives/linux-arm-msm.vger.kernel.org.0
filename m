Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 704C2666553
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jan 2023 22:09:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232580AbjAKVJM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Jan 2023 16:09:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235707AbjAKVIf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Jan 2023 16:08:35 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABE3041668
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 13:08:17 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id f34so25408706lfv.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 13:08:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W5lbdgOfShm4Q4TTWbNJWGuKb3rfMKqlmwXknWgcK+U=;
        b=x055Vi7s3YKckTXghc71MNfLvjUd2Y3JP1OrQfRnpl/b0V7UVuBYRvNcb0LycTVeBa
         ABNuc97nHUlCnTkMaOiozuuEsSDelQC5CnmmTc+GWYgJOf1bnrunM1drLEaJXOzf5sD6
         H1firi2eTgjtC1b83qKDL/PtXRyj56XKnfyBRm79viwoC5Qyd8LXwvGeq57OocLpezMO
         nOebyjMKqvYpskPB5h1IT2vSRJ+nl2wnYhiDRtIu6IfQCYi2SVk4PArZkJWrAqGT8CPr
         VjNwkwohgRaDmE0YDQLYLTI7uRwIFuAMh5uvCQV4U3D4zySZ2hkeVja+C2i06riNHWop
         3x4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W5lbdgOfShm4Q4TTWbNJWGuKb3rfMKqlmwXknWgcK+U=;
        b=4ZiS0nv5g8gAHJ8M6QLDBCRcaA5tY6hX1ueTGdsPpqwsmSw1lZAbDr9SRC3HH+O5Y9
         pEvAgetNSJ57gkecd30E3+bUFtlIEn60i1uvs/u96ST7TiOcad3s4zyhMu/u6S7lQUMx
         dBLPcx+wMbeiqtKJZ5P+XAOwUqbKyZ1jEoP6Lxj/JORSB+PFHSN8hUssHDk5JGZdaQk7
         tY3lSnx4arcLG2XXiBCCcURgqDwUF8wKEybdE3oPOUU94OUWyNA6S7t/8FL6UevB1UjW
         nysYF9lrdh92P86piEHRU47UNSsSmmS2/sHCUXq9dMZbvyuMt3dinTezDuZRxLs5rPTB
         0KGA==
X-Gm-Message-State: AFqh2kqD3PNpZyxy2HUPZV7Q9n8LJa4tbTVC/YOf8nCqOU1ZgPpfjAyF
        kmnNcnjKsyCrKMscPvOgu4jEHA==
X-Google-Smtp-Source: AMrXdXv6FNmviw5R7khvpucCs8GSKprJFIlvAhYsG4253wH41iptXtFMCqCrpPqvi57Pigc0MAWNvA==
X-Received: by 2002:a05:6512:108f:b0:4a4:68b8:c2e4 with SMTP id j15-20020a056512108f00b004a468b8c2e4mr23840032lfg.59.1673471296082;
        Wed, 11 Jan 2023 13:08:16 -0800 (PST)
Received: from [192.168.1.101] (abym53.neoplus.adsl.tpnet.pl. [83.9.32.53])
        by smtp.gmail.com with ESMTPSA id o11-20020ac2434b000000b004cc9ddce3adsm209176lfl.82.2023.01.11.13.08.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jan 2023 13:08:14 -0800 (PST)
Message-ID: <e556e250-7ae4-a5a7-7d0f-eb80a0231e8b@linaro.org>
Date:   Wed, 11 Jan 2023 22:08:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 09/13] clk: qcom: cpu-8996: fix PLL configuration sequence
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
References: <20230111192004.2509750-1-dmitry.baryshkov@linaro.org>
 <20230111192004.2509750-10-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230111192004.2509750-10-dmitry.baryshkov@linaro.org>
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



On 11.01.2023 20:20, Dmitry Baryshkov wrote:
> Switch both power and performance clocks to the GPLL0/2 (sys_apcs_aux)
> before PLL configuration. Switch them to the ACD afterwards.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/clk/qcom/clk-cpu-8996.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/clk/qcom/clk-cpu-8996.c b/drivers/clk/qcom/clk-cpu-8996.c
> index 571ed52b3026..47c58bb5f21a 100644
> --- a/drivers/clk/qcom/clk-cpu-8996.c
> +++ b/drivers/clk/qcom/clk-cpu-8996.c
> @@ -432,13 +432,27 @@ static int qcom_cpu_clk_msm8996_register_clks(struct device *dev,
>  {
>  	int i, ret;
>  
> +	/* Select GPLL0 for 300MHz for the both clusters */
superfluous 'the'

> +	regmap_write(regmap, PERFCL_REG_OFFSET + MUX_OFFSET, 0xc);
> +	regmap_write(regmap, PWRCL_REG_OFFSET + MUX_OFFSET, 0xc);
> +
> +	/* Ensure write goes through before PLLs are reconfigured */
> +	udelay(5);
Is this value based on n clock cycles, or 'good enough'?

> +
>  	clk_alpha_pll_configure(&pwrcl_pll, regmap, &hfpll_config);
>  	clk_alpha_pll_configure(&perfcl_pll, regmap, &hfpll_config);
>  	clk_alpha_pll_configure(&pwrcl_alt_pll, regmap, &altpll_config);
>  	clk_alpha_pll_configure(&perfcl_alt_pll, regmap, &altpll_config);
>  
> +	/* Wait for PLL(s) to lock */
> +        udelay(50);
Weird indentation

Maybe wait_for_pll_enable_lock() to be super sure?

> +
>  	qcom_cpu_clk_msm8996_acd_init(regmap);
>  
> +	/* Switch clusters to use the ACD leg */
> +	regmap_write(regmap, PWRCL_REG_OFFSET + MUX_OFFSET, 0x2);
> +	regmap_write(regmap, PERFCL_REG_OFFSET + MUX_OFFSET, 0x2);
> +
No delays here?

Konrad
>  	for (i = 0; i < ARRAY_SIZE(cpu_msm8996_hw_clks); i++) {
>  		ret = devm_clk_hw_register(dev, cpu_msm8996_hw_clks[i]);
>  		if (ret)
