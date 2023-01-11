Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B4016665F8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jan 2023 23:05:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235441AbjAKWFe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Jan 2023 17:05:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235946AbjAKWFY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Jan 2023 17:05:24 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E15FC43192
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 14:05:22 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id j17so25661340lfr.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 14:05:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4K5zK7fDf08t/OhFP3CP7dF756IpX6+tYU9iSJ/5cow=;
        b=rbWCCBbMIwtvlznW8tsbDElv5X2MvNWBAZURnRcgP73YSirGodRJtUixY53+kEhSpi
         swD7Km2vcxG7oeN7/RVyEFDIA1bKo0i+GEhDru/6H6HFOqZ0FUwpKIH3MHUa9nnztEgK
         goPRISkqXWjMJfkQvEs3vvVZCl602jQHf10v/PxVHQbrnfncBEb8n2hJhS9DlNyKiY+M
         mjWp7Y0rVQBn3OVWGW/VcEe+WUPaaqiUg14+9/R9BQBQRavnDlVWy7lDEEB3Ajt+nYQ0
         e1hxxjnCKXDXBZCc3pf75/pIdMYe1g4oiLk8oBLCwygD/FbbtsndDGfxcGeP1pJzMrD3
         iVkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4K5zK7fDf08t/OhFP3CP7dF756IpX6+tYU9iSJ/5cow=;
        b=kuXElLuPaa8FQiocjU+YWLLNoWjGt3xFDXUBy1Uuw5tvD9yfwWWJs473CVdnyQOr5m
         K32nKjhA9lwUUI5Xff+T02gOozwSJvhAZWWIXTs+xd6dt17aLexOCgZpkJG1jndrkfCr
         aLG7+atpEsZ7noE68kuFHafUHdXZ9hq9qMgSAklDN36I8p3QN8T+Q7RE/JgnYEAKaP++
         tn9sK+L/EstaVQoHm/CQ1rTsXsO4v6skWe3QBz9ijmQyHIdxpio4Ct4wl2LOXCwaqXmE
         i9nQGPOF4qfTJvWVW0DprsSFVx0Vzn5dM3ApCo9UNsM+bnbDsQMmcmYiZE+izyk85v4K
         PZdw==
X-Gm-Message-State: AFqh2krzoab/VS1b3ctO4xZzbqFjorK6xLR4C147Ize13VWHmc8VfGrM
        +3ZRp2xmF+bhq6K0Ji+T08dKXg==
X-Google-Smtp-Source: AMrXdXtJ5LMApL6Lh+6GG9WSpnzHi/6H31s8+Ht1/QTlOkRwZA3Oie2133BXqk31tMN7ly18v8Vhgw==
X-Received: by 2002:a05:6512:32cb:b0:4c5:38ae:4b1e with SMTP id f11-20020a05651232cb00b004c538ae4b1emr28212103lfg.45.1673474721279;
        Wed, 11 Jan 2023 14:05:21 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id bi26-20020a0565120e9a00b004cc8620281csm1550585lfb.62.2023.01.11.14.05.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jan 2023 14:05:20 -0800 (PST)
Message-ID: <449be451-f12c-ee14-a5f8-7a1e0d417597@linaro.org>
Date:   Thu, 12 Jan 2023 00:05:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 09/13] clk: qcom: cpu-8996: fix PLL configuration sequence
Content-Language: en-GB
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
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
 <e556e250-7ae4-a5a7-7d0f-eb80a0231e8b@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <e556e250-7ae4-a5a7-7d0f-eb80a0231e8b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 11/01/2023 23:08, Konrad Dybcio wrote:
> 
> 
> On 11.01.2023 20:20, Dmitry Baryshkov wrote:
>> Switch both power and performance clocks to the GPLL0/2 (sys_apcs_aux)
>> before PLL configuration. Switch them to the ACD afterwards.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/clk/qcom/clk-cpu-8996.c | 14 ++++++++++++++
>>   1 file changed, 14 insertions(+)
>>
>> diff --git a/drivers/clk/qcom/clk-cpu-8996.c b/drivers/clk/qcom/clk-cpu-8996.c
>> index 571ed52b3026..47c58bb5f21a 100644
>> --- a/drivers/clk/qcom/clk-cpu-8996.c
>> +++ b/drivers/clk/qcom/clk-cpu-8996.c
>> @@ -432,13 +432,27 @@ static int qcom_cpu_clk_msm8996_register_clks(struct device *dev,
>>   {
>>   	int i, ret;
>>   
>> +	/* Select GPLL0 for 300MHz for the both clusters */
> superfluous 'the'
> 
>> +	regmap_write(regmap, PERFCL_REG_OFFSET + MUX_OFFSET, 0xc);
>> +	regmap_write(regmap, PWRCL_REG_OFFSET + MUX_OFFSET, 0xc);
>> +
>> +	/* Ensure write goes through before PLLs are reconfigured */
>> +	udelay(5);
> Is this value based on n clock cycles, or 'good enough'?

Don't know, this is based on downstream direclty.

> 
>> +
>>   	clk_alpha_pll_configure(&pwrcl_pll, regmap, &hfpll_config);
>>   	clk_alpha_pll_configure(&perfcl_pll, regmap, &hfpll_config);
>>   	clk_alpha_pll_configure(&pwrcl_alt_pll, regmap, &altpll_config);
>>   	clk_alpha_pll_configure(&perfcl_alt_pll, regmap, &altpll_config);
>>   
>> +	/* Wait for PLL(s) to lock */
>> +        udelay(50);
> Weird indentation
> 
> Maybe wait_for_pll_enable_lock() to be super sure?

Does it work for HWFSM PLLs?

> 
>> +
>>   	qcom_cpu_clk_msm8996_acd_init(regmap);
>>   
>> +	/* Switch clusters to use the ACD leg */
>> +	regmap_write(regmap, PWRCL_REG_OFFSET + MUX_OFFSET, 0x2);
>> +	regmap_write(regmap, PERFCL_REG_OFFSET + MUX_OFFSET, 0x2);
>> +
> No delays here?

No. Probably it isn't required since there is no additional PLL locking, 
etc.

> 
> Konrad
>>   	for (i = 0; i < ARRAY_SIZE(cpu_msm8996_hw_clks); i++) {
>>   		ret = devm_clk_hw_register(dev, cpu_msm8996_hw_clks[i]);
>>   		if (ret)

-- 
With best wishes
Dmitry

