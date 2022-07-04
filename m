Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A2449565C9D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Jul 2022 19:13:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229515AbiGDRNB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Jul 2022 13:13:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230064AbiGDRM7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Jul 2022 13:12:59 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 928FB11C34
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Jul 2022 10:12:56 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id z21so16694768lfb.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Jul 2022 10:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=lJy+46ezTDgJsQOXbCrjUK9vt5fA4ncnjl/F1Gq+s/I=;
        b=kHs6hsySjDLOys3Ut1OJmZH3nAWkmV6l95DCcpvuA2FMa4KXeUG4126imNViuTeglF
         psTu5Gr1LXIQGjn5e6elrRChFGUwtMvGqO8A6n0HuMsq8YoEEEIayIDdg0fjMzXmVLW1
         LDoMnmrCIomQVX1cIk31T+AmaNsHhImcwhdSC3hSGpRYWdES4gUUd7ENpFgrcpyalxbo
         ysx1KH9FXdO6tVksXqcj5TAZpz9Vcl8bP6ajxcNvBP5t3OokpAcoNQEVQfgxq2lgeEal
         vlTCuM2VDTKEQGy8T/XOwi5XBNvrcmk4US2jb2fgr0pLJqyhyQSs7OZwXgdxPa57uvAF
         4Tjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=lJy+46ezTDgJsQOXbCrjUK9vt5fA4ncnjl/F1Gq+s/I=;
        b=YKwmnjNeS8vwxVXOgdkbFBgoQ31KQnlTMUbqbFQgHzRVHErhbV4zHLMCtK7MeXXF2B
         3FZ/qPWqYJzCmNUIFlfAdteRucBrw8gSF6tXaghSZ38MCmZaxiHD9KC4vNHWWEniSPd7
         0tVA7NNI0FO3yIcBV866t/Gtuf1ykckfdgtu7/Rt0xvm8L25tMmN0aFUoiZAq6YptQfh
         1nt/y9EPjWWcRj9Ud7a2NFqSCLBQAJY5iD0KZS7unqHKO79Gh7035X3VBp7JGU5s0xLl
         7TdurAKfmyJHKeB2E694VN20ZNjda1j/Ki4bTTxxTvmYtS8MMd2uUkKr+62wHNRRu582
         giig==
X-Gm-Message-State: AJIora8i370CGKfTdeHWdTOUtStsbc3/Q9oIQjx4hE3YBJmFLfkOBawF
        zekIxxkshcp7sVAEMjBV6W65RQ==
X-Google-Smtp-Source: AGRyM1usQfDRZm49tvPkVlanIljPPTyCIVthdTObhza6jzI1PANCl9zrYQVmRalvnh7SV0UfUS1B2g==
X-Received: by 2002:a05:6512:1056:b0:47f:6f00:66c2 with SMTP id c22-20020a056512105600b0047f6f0066c2mr18668264lfb.410.1656954774696;
        Mon, 04 Jul 2022 10:12:54 -0700 (PDT)
Received: from [192.168.1.212] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id bu35-20020a05651216a300b0047255d211b9sm5221401lfb.232.2022.07.04.10.12.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Jul 2022 10:12:54 -0700 (PDT)
Message-ID: <65f2ae62-9417-1c94-5dda-224d92c0ba2d@linaro.org>
Date:   Mon, 4 Jul 2022 20:12:53 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 3/7] clk: qcom: gcc-msm8916: use ARRAY_SIZE instead of
 specifying num_parents
Content-Language: en-GB
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>
References: <20220619212735.1244953-1-dmitry.baryshkov@linaro.org>
 <20220619212735.1244953-4-dmitry.baryshkov@linaro.org>
 <20220627210337.ayg5el2n5vihasqv@SoMainline.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220627210337.ayg5el2n5vihasqv@SoMainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 28/06/2022 00:03, Marijn Suijten wrote:
> On 2022-06-20 00:27:31, Dmitry Baryshkov wrote:
>> Use ARRAY_SIZE() instead of manually specifying num_parents. This makes
>> adding/removing entries to/from parent_data easy and errorproof.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> 
> But do read on about an accidental fix that you may want to pull out
> into an explicit patch.
>> ---
>>   drivers/clk/qcom/gcc-msm8916.c | 108 ++++++++++++++++-----------------
>>   1 file changed, 54 insertions(+), 54 deletions(-)
>>
>> diff --git a/drivers/clk/qcom/gcc-msm8916.c b/drivers/clk/qcom/gcc-msm8916.c
>> index 17e4a5a2a9fd..40c27ba6286f 100644
>> --- a/drivers/clk/qcom/gcc-msm8916.c
>> +++ b/drivers/clk/qcom/gcc-msm8916.c
>> @@ -371,7 +371,7 @@ static struct clk_rcg2 pcnoc_bfdcd_clk_src = {
>>   	.clkr.hw.init = &(struct clk_init_data){
>>   		.name = "pcnoc_bfdcd_clk_src",
>>   		.parent_names = gcc_xo_gpll0_bimc,
>> -		.num_parents = 3,
>> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_bimc),
>>   		.ops = &clk_rcg2_ops,
>>   	},
>>   };
>> @@ -383,7 +383,7 @@ static struct clk_rcg2 system_noc_bfdcd_clk_src = {
>>   	.clkr.hw.init = &(struct clk_init_data){
>>   		.name = "system_noc_bfdcd_clk_src",
>>   		.parent_names = gcc_xo_gpll0_bimc,
>> -		.num_parents = 3,
>> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_bimc),
>>   		.ops = &clk_rcg2_ops,
>>   	},
>>   };
>> @@ -403,7 +403,7 @@ static struct clk_rcg2 camss_ahb_clk_src = {
>>   	.clkr.hw.init = &(struct clk_init_data){
>>   		.name = "camss_ahb_clk_src",
>>   		.parent_names = gcc_xo_gpll0,
>> -		.num_parents = 2,
>> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>>   		.ops = &clk_rcg2_ops,
>>   	},
>>   };
>> @@ -424,7 +424,7 @@ static struct clk_rcg2 apss_ahb_clk_src = {
>>   	.clkr.hw.init = &(struct clk_init_data){
>>   		.name = "apss_ahb_clk_src",
>>   		.parent_names = gcc_xo_gpll0,
>> -		.num_parents = 2,
>> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>>   		.ops = &clk_rcg2_ops,
>>   	},
>>   };
>> @@ -443,7 +443,7 @@ static struct clk_rcg2 csi0_clk_src = {
>>   	.clkr.hw.init = &(struct clk_init_data){
>>   		.name = "csi0_clk_src",
>>   		.parent_names = gcc_xo_gpll0,
>> -		.num_parents = 2,
>> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>>   		.ops = &clk_rcg2_ops,
>>   	},
>>   };
>> @@ -456,7 +456,7 @@ static struct clk_rcg2 csi1_clk_src = {
>>   	.clkr.hw.init = &(struct clk_init_data){
>>   		.name = "csi1_clk_src",
>>   		.parent_names = gcc_xo_gpll0,
>> -		.num_parents = 2,
>> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>>   		.ops = &clk_rcg2_ops,
>>   	},
>>   };
>> @@ -484,7 +484,7 @@ static struct clk_rcg2 gfx3d_clk_src = {
>>   	.clkr.hw.init = &(struct clk_init_data){
>>   		.name = "gfx3d_clk_src",
>>   		.parent_names = gcc_xo_gpll0a_gpll1_gpll2a,
>> -		.num_parents = 4,
>> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0a_gpll1_gpll2a),
>>   		.ops = &clk_rcg2_ops,
>>   	},
>>   };
>> @@ -511,7 +511,7 @@ static struct clk_rcg2 vfe0_clk_src = {
>>   	.clkr.hw.init = &(struct clk_init_data){
>>   		.name = "vfe0_clk_src",
>>   		.parent_names = gcc_xo_gpll0_gpll2,
>> -		.num_parents = 3,
>> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll2),
>>   		.ops = &clk_rcg2_ops,
>>   	},
>>   };
>> @@ -530,7 +530,7 @@ static struct clk_rcg2 blsp1_qup1_i2c_apps_clk_src = {
>>   	.clkr.hw.init = &(struct clk_init_data){
>>   		.name = "blsp1_qup1_i2c_apps_clk_src",
>>   		.parent_names = gcc_xo_gpll0,
>> -		.num_parents = 2,
>> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>>   		.ops = &clk_rcg2_ops,
>>   	},
>>   };
>> @@ -559,7 +559,7 @@ static struct clk_rcg2 blsp1_qup1_spi_apps_clk_src = {
>>   	.clkr.hw.init = &(struct clk_init_data){
>>   		.name = "blsp1_qup1_spi_apps_clk_src",
>>   		.parent_names = gcc_xo_gpll0,
>> -		.num_parents = 2,
>> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>>   		.ops = &clk_rcg2_ops,
>>   	},
>>   };
>> @@ -572,7 +572,7 @@ static struct clk_rcg2 blsp1_qup2_i2c_apps_clk_src = {
>>   	.clkr.hw.init = &(struct clk_init_data){
>>   		.name = "blsp1_qup2_i2c_apps_clk_src",
>>   		.parent_names = gcc_xo_gpll0,
>> -		.num_parents = 2,
>> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>>   		.ops = &clk_rcg2_ops,
>>   	},
>>   };
>> @@ -586,7 +586,7 @@ static struct clk_rcg2 blsp1_qup2_spi_apps_clk_src = {
>>   	.clkr.hw.init = &(struct clk_init_data){
>>   		.name = "blsp1_qup2_spi_apps_clk_src",
>>   		.parent_names = gcc_xo_gpll0,
>> -		.num_parents = 2,
>> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>>   		.ops = &clk_rcg2_ops,
>>   	},
>>   };
>> @@ -599,7 +599,7 @@ static struct clk_rcg2 blsp1_qup3_i2c_apps_clk_src = {
>>   	.clkr.hw.init = &(struct clk_init_data){
>>   		.name = "blsp1_qup3_i2c_apps_clk_src",
>>   		.parent_names = gcc_xo_gpll0,
>> -		.num_parents = 2,
>> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>>   		.ops = &clk_rcg2_ops,
>>   	},
>>   };
>> @@ -613,7 +613,7 @@ static struct clk_rcg2 blsp1_qup3_spi_apps_clk_src = {
>>   	.clkr.hw.init = &(struct clk_init_data){
>>   		.name = "blsp1_qup3_spi_apps_clk_src",
>>   		.parent_names = gcc_xo_gpll0,
>> -		.num_parents = 2,
>> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>>   		.ops = &clk_rcg2_ops,
>>   	},
>>   };
>> @@ -626,7 +626,7 @@ static struct clk_rcg2 blsp1_qup4_i2c_apps_clk_src = {
>>   	.clkr.hw.init = &(struct clk_init_data){
>>   		.name = "blsp1_qup4_i2c_apps_clk_src",
>>   		.parent_names = gcc_xo_gpll0,
>> -		.num_parents = 2,
>> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>>   		.ops = &clk_rcg2_ops,
>>   	},
>>   };
>> @@ -640,7 +640,7 @@ static struct clk_rcg2 blsp1_qup4_spi_apps_clk_src = {
>>   	.clkr.hw.init = &(struct clk_init_data){
>>   		.name = "blsp1_qup4_spi_apps_clk_src",
>>   		.parent_names = gcc_xo_gpll0,
>> -		.num_parents = 2,
>> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>>   		.ops = &clk_rcg2_ops,
>>   	},
>>   };
>> @@ -653,7 +653,7 @@ static struct clk_rcg2 blsp1_qup5_i2c_apps_clk_src = {
>>   	.clkr.hw.init = &(struct clk_init_data){
>>   		.name = "blsp1_qup5_i2c_apps_clk_src",
>>   		.parent_names = gcc_xo_gpll0,
>> -		.num_parents = 2,
>> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>>   		.ops = &clk_rcg2_ops,
>>   	},
>>   };
>> @@ -667,7 +667,7 @@ static struct clk_rcg2 blsp1_qup5_spi_apps_clk_src = {
>>   	.clkr.hw.init = &(struct clk_init_data){
>>   		.name = "blsp1_qup5_spi_apps_clk_src",
>>   		.parent_names = gcc_xo_gpll0,
>> -		.num_parents = 2,
>> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>>   		.ops = &clk_rcg2_ops,
>>   	},
>>   };
>> @@ -680,7 +680,7 @@ static struct clk_rcg2 blsp1_qup6_i2c_apps_clk_src = {
>>   	.clkr.hw.init = &(struct clk_init_data){
>>   		.name = "blsp1_qup6_i2c_apps_clk_src",
>>   		.parent_names = gcc_xo_gpll0,
>> -		.num_parents = 2,
>> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>>   		.ops = &clk_rcg2_ops,
>>   	},
>>   };
>> @@ -694,7 +694,7 @@ static struct clk_rcg2 blsp1_qup6_spi_apps_clk_src = {
>>   	.clkr.hw.init = &(struct clk_init_data){
>>   		.name = "blsp1_qup6_spi_apps_clk_src",
>>   		.parent_names = gcc_xo_gpll0,
>> -		.num_parents = 2,
>> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>>   		.ops = &clk_rcg2_ops,
>>   	},
>>   };
>> @@ -727,7 +727,7 @@ static struct clk_rcg2 blsp1_uart1_apps_clk_src = {
>>   	.clkr.hw.init = &(struct clk_init_data){
>>   		.name = "blsp1_uart1_apps_clk_src",
>>   		.parent_names = gcc_xo_gpll0,
>> -		.num_parents = 2,
>> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>>   		.ops = &clk_rcg2_ops,
>>   	},
>>   };
>> @@ -741,7 +741,7 @@ static struct clk_rcg2 blsp1_uart2_apps_clk_src = {
>>   	.clkr.hw.init = &(struct clk_init_data){
>>   		.name = "blsp1_uart2_apps_clk_src",
>>   		.parent_names = gcc_xo_gpll0,
>> -		.num_parents = 2,
>> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>>   		.ops = &clk_rcg2_ops,
>>   	},
>>   };
>> @@ -760,7 +760,7 @@ static struct clk_rcg2 cci_clk_src = {
>>   	.clkr.hw.init = &(struct clk_init_data){
>>   		.name = "cci_clk_src",
>>   		.parent_names = gcc_xo_gpll0a,
>> -		.num_parents = 2,
>> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0a),
>>   		.ops = &clk_rcg2_ops,
>>   	},
>>   };
>> @@ -780,7 +780,7 @@ static struct clk_rcg2 camss_gp0_clk_src = {
>>   	.clkr.hw.init = &(struct clk_init_data){
>>   		.name = "camss_gp0_clk_src",
>>   		.parent_names = gcc_xo_gpll0_gpll1a_sleep,
>> -		.num_parents = 4,
>> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll1a_sleep),
>>   		.ops = &clk_rcg2_ops,
>>   	},
>>   };
>> @@ -794,7 +794,7 @@ static struct clk_rcg2 camss_gp1_clk_src = {
>>   	.clkr.hw.init = &(struct clk_init_data){
>>   		.name = "camss_gp1_clk_src",
>>   		.parent_names = gcc_xo_gpll0_gpll1a_sleep,
>> -		.num_parents = 4,
>> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll1a_sleep),
>>   		.ops = &clk_rcg2_ops,
>>   	},
>>   };
>> @@ -814,7 +814,7 @@ static struct clk_rcg2 jpeg0_clk_src = {
>>   	.clkr.hw.init = &(struct clk_init_data){
>>   		.name = "jpeg0_clk_src",
>>   		.parent_names = gcc_xo_gpll0,
>> -		.num_parents = 2,
>> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>>   		.ops = &clk_rcg2_ops,
>>   	},
>>   };
>> @@ -835,7 +835,7 @@ static struct clk_rcg2 mclk0_clk_src = {
>>   	.clkr.hw.init = &(struct clk_init_data){
>>   		.name = "mclk0_clk_src",
>>   		.parent_names = gcc_xo_gpll0_gpll1a_sleep,
>> -		.num_parents = 4,
>> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll1a_sleep),
>>   		.ops = &clk_rcg2_ops,
>>   	},
>>   };
>> @@ -849,7 +849,7 @@ static struct clk_rcg2 mclk1_clk_src = {
>>   	.clkr.hw.init = &(struct clk_init_data){
>>   		.name = "mclk1_clk_src",
>>   		.parent_names = gcc_xo_gpll0_gpll1a_sleep,
>> -		.num_parents = 4,
>> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll1a_sleep),
>>   		.ops = &clk_rcg2_ops,
>>   	},
>>   };
>> @@ -868,7 +868,7 @@ static struct clk_rcg2 csi0phytimer_clk_src = {
>>   	.clkr.hw.init = &(struct clk_init_data){
>>   		.name = "csi0phytimer_clk_src",
>>   		.parent_names = gcc_xo_gpll0_gpll1a,
>> -		.num_parents = 3,
>> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll1a),
>>   		.ops = &clk_rcg2_ops,
>>   	},
>>   };
>> @@ -881,7 +881,7 @@ static struct clk_rcg2 csi1phytimer_clk_src = {
>>   	.clkr.hw.init = &(struct clk_init_data){
>>   		.name = "csi1phytimer_clk_src",
>>   		.parent_names = gcc_xo_gpll0_gpll1a,
>> -		.num_parents = 3,
>> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll1a),
>>   		.ops = &clk_rcg2_ops,
>>   	},
>>   };
>> @@ -901,7 +901,7 @@ static struct clk_rcg2 cpp_clk_src = {
>>   	.clkr.hw.init = &(struct clk_init_data){
>>   		.name = "cpp_clk_src",
>>   		.parent_names = gcc_xo_gpll0_gpll2,
>> -		.num_parents = 3,
>> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll2),
>>   		.ops = &clk_rcg2_ops,
>>   	},
>>   };
>> @@ -922,7 +922,7 @@ static struct clk_rcg2 crypto_clk_src = {
>>   	.clkr.hw.init = &(struct clk_init_data){
>>   		.name = "crypto_clk_src",
>>   		.parent_names = gcc_xo_gpll0,
>> -		.num_parents = 2,
>> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>>   		.ops = &clk_rcg2_ops,
>>   	},
>>   };
>> @@ -941,7 +941,7 @@ static struct clk_rcg2 gp1_clk_src = {
>>   	.clkr.hw.init = &(struct clk_init_data){
>>   		.name = "gp1_clk_src",
> 
> Starting here...
> 
>>   		.parent_names = gcc_xo_gpll0_gpll1a_sleep,
>> -		.num_parents = 3,
>> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll1a_sleep),
>>   		.ops = &clk_rcg2_ops,
>>   	},
>>   };
>> @@ -955,7 +955,7 @@ static struct clk_rcg2 gp2_clk_src = {
>>   	.clkr.hw.init = &(struct clk_init_data){
>>   		.name = "gp2_clk_src",
>>   		.parent_names = gcc_xo_gpll0_gpll1a_sleep,
>> -		.num_parents = 3,
>> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll1a_sleep),
>>   		.ops = &clk_rcg2_ops,
>>   	},
>>   };
>> @@ -969,7 +969,7 @@ static struct clk_rcg2 gp3_clk_src = {
>>   	.clkr.hw.init = &(struct clk_init_data){
>>   		.name = "gp3_clk_src",
>>   		.parent_names = gcc_xo_gpll0_gpll1a_sleep,
>> -		.num_parents = 3,
>> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll1a_sleep),
> 
> And ending here, note that this array and the corresponding _map contain
> four items instead of 3, making this a semantic change.  The last
> member, `sleep_clk`, couldn't previously be selected here.

I thought about it for quite a while. I suspect it doesn't make sense to 
create a separate commit, changing 3 to 4 then replacing it with 
ARRAY_SIZE. I think we'd better document the change in the commit 
message and add proper fixes tags to this commit.

> 
> - Marijn
> 
>>   		.ops = &clk_rcg2_ops,
>>   	},
>>   };
>> @@ -981,7 +981,7 @@ static struct clk_rcg2 byte0_clk_src = {
>>   	.clkr.hw.init = &(struct clk_init_data){
>>   		.name = "byte0_clk_src",
>>   		.parent_names = gcc_xo_gpll0a_dsibyte,
>> -		.num_parents = 3,
>> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0a_dsibyte),
>>   		.ops = &clk_byte2_ops,
>>   		.flags = CLK_SET_RATE_PARENT,
>>   	},
>> @@ -1000,7 +1000,7 @@ static struct clk_rcg2 esc0_clk_src = {
>>   	.clkr.hw.init = &(struct clk_init_data){
>>   		.name = "esc0_clk_src",
>>   		.parent_names = gcc_xo_dsibyte,
>> -		.num_parents = 2,
>> +		.num_parents = ARRAY_SIZE(gcc_xo_dsibyte),
>>   		.ops = &clk_rcg2_ops,
>>   	},
>>   };
>> @@ -1025,7 +1025,7 @@ static struct clk_rcg2 mdp_clk_src = {
>>   	.clkr.hw.init = &(struct clk_init_data){
>>   		.name = "mdp_clk_src",
>>   		.parent_names = gcc_xo_gpll0_dsiphy,
>> -		.num_parents = 3,
>> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_dsiphy),
>>   		.ops = &clk_rcg2_ops,
>>   	},
>>   };
>> @@ -1038,7 +1038,7 @@ static struct clk_rcg2 pclk0_clk_src = {
>>   	.clkr.hw.init = &(struct clk_init_data){
>>   		.name = "pclk0_clk_src",
>>   		.parent_names = gcc_xo_gpll0a_dsiphy,
>> -		.num_parents = 3,
>> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0a_dsiphy),
>>   		.ops = &clk_pixel_ops,
>>   		.flags = CLK_SET_RATE_PARENT,
>>   	},
>> @@ -1057,7 +1057,7 @@ static struct clk_rcg2 vsync_clk_src = {
>>   	.clkr.hw.init = &(struct clk_init_data){
>>   		.name = "vsync_clk_src",
>>   		.parent_names = gcc_xo_gpll0a,
>> -		.num_parents = 2,
>> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0a),
>>   		.ops = &clk_rcg2_ops,
>>   	},
>>   };
>> @@ -1075,7 +1075,7 @@ static struct clk_rcg2 pdm2_clk_src = {
>>   	.clkr.hw.init = &(struct clk_init_data){
>>   		.name = "pdm2_clk_src",
>>   		.parent_names = gcc_xo_gpll0,
>> -		.num_parents = 2,
>> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>>   		.ops = &clk_rcg2_ops,
>>   	},
>>   };
>> @@ -1100,7 +1100,7 @@ static struct clk_rcg2 sdcc1_apps_clk_src = {
>>   	.clkr.hw.init = &(struct clk_init_data){
>>   		.name = "sdcc1_apps_clk_src",
>>   		.parent_names = gcc_xo_gpll0,
>> -		.num_parents = 2,
>> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>>   		.ops = &clk_rcg2_floor_ops,
>>   	},
>>   };
>> @@ -1125,7 +1125,7 @@ static struct clk_rcg2 sdcc2_apps_clk_src = {
>>   	.clkr.hw.init = &(struct clk_init_data){
>>   		.name = "sdcc2_apps_clk_src",
>>   		.parent_names = gcc_xo_gpll0,
>> -		.num_parents = 2,
>> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>>   		.ops = &clk_rcg2_floor_ops,
>>   	},
>>   };
>> @@ -1145,7 +1145,7 @@ static struct clk_rcg2 apss_tcu_clk_src = {
>>   	.clkr.hw.init = &(struct clk_init_data){
>>   		.name = "apss_tcu_clk_src",
>>   		.parent_names = gcc_xo_gpll0a_gpll1_gpll2,
>> -		.num_parents = 4,
>> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0a_gpll1_gpll2),
>>   		.ops = &clk_rcg2_ops,
>>   	},
>>   };
>> @@ -1168,7 +1168,7 @@ static struct clk_rcg2 bimc_gpu_clk_src = {
>>   	.clkr.hw.init = &(struct clk_init_data){
>>   		.name = "bimc_gpu_clk_src",
>>   		.parent_names = gcc_xo_gpll0_bimc,
>> -		.num_parents = 3,
>> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_bimc),
>>   		.flags = CLK_GET_RATE_NOCACHE,
>>   		.ops = &clk_rcg2_ops,
>>   	},
>> @@ -1187,7 +1187,7 @@ static struct clk_rcg2 usb_hs_system_clk_src = {
>>   	.clkr.hw.init = &(struct clk_init_data){
>>   		.name = "usb_hs_system_clk_src",
>>   		.parent_names = gcc_xo_gpll0,
>> -		.num_parents = 2,
>> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>>   		.ops = &clk_rcg2_ops,
>>   	},
>>   };
>> @@ -1213,7 +1213,7 @@ static struct clk_rcg2 ultaudio_ahbfabric_clk_src = {
>>   	.clkr.hw.init = &(struct clk_init_data){
>>   		.name = "ultaudio_ahbfabric_clk_src",
>>   		.parent_names = gcc_xo_gpll0_gpll1_sleep,
>> -		.num_parents = 4,
>> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll1_sleep),
>>   		.ops = &clk_rcg2_ops,
>>   	},
>>   };
>> @@ -1292,7 +1292,7 @@ static struct clk_rcg2 ultaudio_lpaif_pri_i2s_clk_src = {
>>   	.clkr.hw.init = &(struct clk_init_data){
>>   		.name = "ultaudio_lpaif_pri_i2s_clk_src",
>>   		.parent_names = gcc_xo_gpll1_epi2s_emclk_sleep,
>> -		.num_parents = 5,
>> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll1_epi2s_emclk_sleep),
>>   		.ops = &clk_rcg2_ops,
>>   	},
>>   };
>> @@ -1323,7 +1323,7 @@ static struct clk_rcg2 ultaudio_lpaif_sec_i2s_clk_src = {
>>   	.clkr.hw.init = &(struct clk_init_data){
>>   		.name = "ultaudio_lpaif_sec_i2s_clk_src",
>>   		.parent_names = gcc_xo_gpll1_esi2s_emclk_sleep,
>> -		.num_parents = 5,
>> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll1_esi2s_emclk_sleep),
>>   		.ops = &clk_rcg2_ops,
>>   	},
>>   };
>> @@ -1354,7 +1354,7 @@ static struct clk_rcg2 ultaudio_lpaif_aux_i2s_clk_src = {
>>   	.clkr.hw.init = &(struct clk_init_data){
>>   		.name = "ultaudio_lpaif_aux_i2s_clk_src",
>>   		.parent_names = gcc_xo_gpll1_esi2s_emclk_sleep,
>> -		.num_parents = 5,
>> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll1_esi2s_emclk_sleep),
>>   		.ops = &clk_rcg2_ops,
>>   	},
>>   };
>> @@ -1389,7 +1389,7 @@ static struct clk_rcg2 ultaudio_xo_clk_src = {
>>   	.clkr.hw.init = &(struct clk_init_data){
>>   		.name = "ultaudio_xo_clk_src",
>>   		.parent_names = gcc_xo_sleep,
>> -		.num_parents = 2,
>> +		.num_parents = ARRAY_SIZE(gcc_xo_sleep),
>>   		.ops = &clk_rcg2_ops,
>>   	},
>>   };
>> @@ -1445,7 +1445,7 @@ static struct clk_rcg2 codec_digcodec_clk_src = {
>>   	.clkr.hw.init = &(struct clk_init_data){
>>   		.name = "codec_digcodec_clk_src",
>>   		.parent_names = gcc_xo_gpll1_emclk_sleep,
>> -		.num_parents = 4,
>> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll1_emclk_sleep),
>>   		.ops = &clk_rcg2_ops,
>>   	},
>>   };
>> @@ -1515,7 +1515,7 @@ static struct clk_rcg2 vcodec0_clk_src = {
>>   	.clkr.hw.init = &(struct clk_init_data){
>>   		.name = "vcodec0_clk_src",
>>   		.parent_names = gcc_xo_gpll0,
>> -		.num_parents = 2,
>> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>>   		.ops = &clk_rcg2_ops,
>>   	},
>>   };
>> @@ -2771,7 +2771,7 @@ static struct clk_rcg2 bimc_ddr_clk_src = {
>>   	.clkr.hw.init = &(struct clk_init_data){
>>   		.name = "bimc_ddr_clk_src",
>>   		.parent_names = gcc_xo_gpll0_bimc,
>> -		.num_parents = 3,
>> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_bimc),
>>   		.ops = &clk_rcg2_ops,
>>   		.flags = CLK_GET_RATE_NOCACHE,
>>   	},
>> -- 
>> 2.35.1
>>


-- 
With best wishes
Dmitry
