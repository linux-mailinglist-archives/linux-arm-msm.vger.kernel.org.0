Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A548644F81
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Dec 2022 00:19:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229684AbiLFXTt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Dec 2022 18:19:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbiLFXTs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Dec 2022 18:19:48 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84E632A409
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Dec 2022 15:19:46 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id cf42so20282987lfb.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Dec 2022 15:19:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/5wD54s7r2R1GWpY43s9YP2B81sQ62crKuEBUhuNS80=;
        b=waDmgxnFK4qF9Ley2L1gaKOTkbVRBWV6rs7AGM7MnncSS+xU0Jwvg6Var2eQUg8T3b
         5BEiv3S7084sV1sv/2NUR5nUAVTY7rdcgY521jGRiJbX1Z4E9wu2N4VC/QhUjIHj96zi
         XIPSaTvUbONW1Pt+IgfLLqYayBGPTnFgG/HQpcSZ/p8kj0m+FHIT3X6IWj2DtQxZBMc6
         s9E45MQ4VE9BH+l1lEc8iKsyoex7LUy+5rTZUmeq8P46Ukr7L2gEmqnwuK9qW8O/AaCJ
         ATV3pjilhfbl4CFBJ9q8SrTQdhdl4L1C4iCvhuNHYnLoT2bERrydczjZuh/8EUuAsh+n
         pTVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/5wD54s7r2R1GWpY43s9YP2B81sQ62crKuEBUhuNS80=;
        b=jeVlMXMa2Ssxz5lCxyY9ozzVjhBPlrVgWiBh5aOm9wA9XDD4wGQBEw47RES/jpHIq4
         6fJWC8wFUvuUj3U920wu6ULuF4vdAyjsop40WGXnXdzlYvjrn9INcdZeL4bAPMb/XuC4
         cVKAXxv1ngWnYnTAecpiylm8FTh3UBsea/6Rcar3UL9CLoa0KB6RbcYjx01p+P5qt0Du
         h5B8N+u6xQTx9RrXtKNniWbg8HMNi5kwROhzR0iKZhvX10ErImcVetfdev9VPkETjPFZ
         4ykZVH6Zc/JJQtTAGVmB9MPnKckzMO2tu/TVKxMEFAFi3SDLgJEzYnfSOCS1BbLQLzkp
         8snQ==
X-Gm-Message-State: ANoB5pkE5V0jaQGsUwDtrAkUT5KZR95Lopp/G+9N7eL/OvtJIy+jNCH/
        AmfaSUCPQsQyx5+fVz7V6c1Yig==
X-Google-Smtp-Source: AA0mqf4PLXVQHEkImMVQk2Sx75ytVd1qa4DXGnR5mIMjHzVtbkTuq75DrltKnxkXP4z8dCO82MExQA==
X-Received: by 2002:a19:2d52:0:b0:4b1:dc42:6f85 with SMTP id t18-20020a192d52000000b004b1dc426f85mr28336275lft.568.1670368784840;
        Tue, 06 Dec 2022 15:19:44 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id c23-20020ac25f77000000b004b4ad5ee601sm2635831lfc.255.2022.12.06.15.19.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Dec 2022 15:19:44 -0800 (PST)
Message-ID: <4d55e115-593e-28eb-4b46-be9eb360854a@linaro.org>
Date:   Wed, 7 Dec 2022 01:19:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 04/16] clk: qcom: smd-rpm: add missing ln_bb_clkN clocks
Content-Language: en-GB
To:     Alex Elder <elder@linaro.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20221203175808.859067-1-dmitry.baryshkov@linaro.org>
 <20221203175808.859067-5-dmitry.baryshkov@linaro.org>
 <d1386fa7-9e9a-68a2-9eed-538a36ed706d@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <d1386fa7-9e9a-68a2-9eed-538a36ed706d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05/12/2022 19:04, Alex Elder wrote:
> On 12/3/22 11:57 AM, Dmitry Baryshkov wrote:
>> Newer platforms (msm8998, sdm660, sm6125) have low noise LN_BB_CLKn
>> clocks. The driver already uses proper clock indices
>> (RPM_SMD_LN_BB_CLKn). Fix clock names used by these platforms.
> 
> Should these lines be deleted also?
> 
> DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8916, bb_clk1, bb_clk1_a, 1, 19200000);
> DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8916, bb_clk2, bb_clk2_a, 2, 19200000);
> 
> DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8916, bb_clk1_pin, 
> bb_clk1_a_pin, 1, 19200000);
> DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8916, bb_clk2_pin, 
> bb_clk2_a_pin, 2, 19200000);

No, becasue bb_clk's are used for older platforms (including e.g. msm8916).

> 
>                      -Alex
> 
>>
>> Fixes: a0384ecfe2aa ("clk: qcom: smd-rpm: De-duplicate identical 
>> entries")
>> Fixes: edeb2ca74716 ("clk: qcom: smd: Add support for SM6125 rpm clocks")
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/clk/qcom/clk-smd-rpm.c | 44 ++++++++++++++++++----------------
>>   1 file changed, 24 insertions(+), 20 deletions(-)
>>
>> diff --git a/drivers/clk/qcom/clk-smd-rpm.c 
>> b/drivers/clk/qcom/clk-smd-rpm.c
>> index 26c4738eaacf..42d55bf35a33 100644
>> --- a/drivers/clk/qcom/clk-smd-rpm.c
>> +++ b/drivers/clk/qcom/clk-smd-rpm.c
>> @@ -852,6 +852,10 @@ static const struct rpm_smd_clk_desc 
>> rpm_clk_qcs404 = {
>>       .num_clks = ARRAY_SIZE(qcs404_clks),
>>   };
>> +DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8998, ln_bb_clk1, ln_bb_clk1_a, 1, 
>> 19200000);
>> +DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8998, ln_bb_clk1_pin, 
>> ln_bb_clk1_a_pin, 1, 19200000);
>> +DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8998, ln_bb_clk2, ln_bb_clk2_a, 2, 
>> 19200000);
>> +DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8998, ln_bb_clk2_pin, 
>> ln_bb_clk2_a_pin, 2, 19200000);
>>   DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8998, ln_bb_clk3, ln_bb_clk3_a, 3, 
>> 19200000);
>>   DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8998, ln_bb_clk3_pin, 
>> ln_bb_clk3_a_pin, 3, 19200000);
>>   DEFINE_CLK_SMD_RPM(msm8998, aggre1_noc_clk, aggre1_noc_a_clk,
>> @@ -882,16 +886,16 @@ static struct clk_smd_rpm *msm8998_clks[] = {
>>       [RPM_SMD_DIV_A_CLK3] = &msm8992_div_clk3_a,
>>       [RPM_SMD_IPA_CLK] = &msm8976_ipa_clk,
>>       [RPM_SMD_IPA_A_CLK] = &msm8976_ipa_a_clk,
>> -    [RPM_SMD_LN_BB_CLK1] = &msm8916_bb_clk1,
>> -    [RPM_SMD_LN_BB_CLK1_A] = &msm8916_bb_clk1_a,
>> -    [RPM_SMD_LN_BB_CLK2] = &msm8916_bb_clk2,
>> -    [RPM_SMD_LN_BB_CLK2_A] = &msm8916_bb_clk2_a,
>> +    [RPM_SMD_LN_BB_CLK1] = &msm8998_ln_bb_clk1,
>> +    [RPM_SMD_LN_BB_CLK1_A] = &msm8998_ln_bb_clk1_a,
>> +    [RPM_SMD_LN_BB_CLK2] = &msm8998_ln_bb_clk2,
>> +    [RPM_SMD_LN_BB_CLK2_A] = &msm8998_ln_bb_clk2_a,
>>       [RPM_SMD_LN_BB_CLK3] = &msm8998_ln_bb_clk3,
>>       [RPM_SMD_LN_BB_CLK3_A] = &msm8998_ln_bb_clk3_a,
>> -    [RPM_SMD_LN_BB_CLK1_PIN] = &msm8916_bb_clk1_pin,
>> -    [RPM_SMD_LN_BB_CLK1_A_PIN] = &msm8916_bb_clk1_a_pin,
>> -    [RPM_SMD_LN_BB_CLK2_PIN] = &msm8916_bb_clk2_pin,
>> -    [RPM_SMD_LN_BB_CLK2_A_PIN] = &msm8916_bb_clk2_a_pin,
>> +    [RPM_SMD_LN_BB_CLK1_PIN] = &msm8998_ln_bb_clk1_pin,
>> +    [RPM_SMD_LN_BB_CLK1_A_PIN] = &msm8998_ln_bb_clk1_a_pin,
>> +    [RPM_SMD_LN_BB_CLK2_PIN] = &msm8998_ln_bb_clk2_pin,
>> +    [RPM_SMD_LN_BB_CLK2_A_PIN] = &msm8998_ln_bb_clk2_a_pin,
>>       [RPM_SMD_LN_BB_CLK3_PIN] = &msm8998_ln_bb_clk3_pin,
>>       [RPM_SMD_LN_BB_CLK3_A_PIN] = &msm8998_ln_bb_clk3_a_pin,
>>       [RPM_SMD_MMAXI_CLK] = &msm8996_mmssnoc_axi_rpm_clk,
>> @@ -946,18 +950,18 @@ static struct clk_smd_rpm *sdm660_clks[] = {
>>       [RPM_SMD_RF_CLK1_A] = &msm8916_rf_clk1_a,
>>       [RPM_SMD_DIV_CLK1] = &msm8974_div_clk1,
>>       [RPM_SMD_DIV_A_CLK1] = &msm8974_div_a_clk1,
>> -    [RPM_SMD_LN_BB_CLK] = &msm8916_bb_clk1,
>> -    [RPM_SMD_LN_BB_A_CLK] = &msm8916_bb_clk1_a,
>> -    [RPM_SMD_LN_BB_CLK2] = &msm8916_bb_clk2,
>> -    [RPM_SMD_LN_BB_CLK2_A] = &msm8916_bb_clk2_a,
>> +    [RPM_SMD_LN_BB_CLK] = &msm8998_ln_bb_clk1,
>> +    [RPM_SMD_LN_BB_A_CLK] = &msm8998_ln_bb_clk1_a,
>> +    [RPM_SMD_LN_BB_CLK2] = &msm8998_ln_bb_clk2,
>> +    [RPM_SMD_LN_BB_CLK2_A] = &msm8998_ln_bb_clk2_a,
>>       [RPM_SMD_LN_BB_CLK3] = &msm8998_ln_bb_clk3,
>>       [RPM_SMD_LN_BB_CLK3_A] = &msm8998_ln_bb_clk3_a,
>>       [RPM_SMD_RF_CLK1_PIN] = &msm8916_rf_clk1_pin,
>>       [RPM_SMD_RF_CLK1_A_PIN] = &msm8916_rf_clk1_a_pin,
>> -    [RPM_SMD_LN_BB_CLK1_PIN] = &msm8916_bb_clk1_pin,
>> -    [RPM_SMD_LN_BB_CLK1_A_PIN] = &msm8916_bb_clk1_a_pin,
>> -    [RPM_SMD_LN_BB_CLK2_PIN] = &msm8916_bb_clk2_pin,
>> -    [RPM_SMD_LN_BB_CLK2_A_PIN] = &msm8916_bb_clk2_a_pin,
>> +    [RPM_SMD_LN_BB_CLK1_PIN] = &msm8998_ln_bb_clk1_pin,
>> +    [RPM_SMD_LN_BB_CLK1_A_PIN] = &msm8998_ln_bb_clk1_a_pin,
>> +    [RPM_SMD_LN_BB_CLK2_PIN] = &msm8998_ln_bb_clk2_pin,
>> +    [RPM_SMD_LN_BB_CLK2_A_PIN] = &msm8998_ln_bb_clk2_a_pin,
>>       [RPM_SMD_LN_BB_CLK3_PIN] = &msm8998_ln_bb_clk3_pin,
>>       [RPM_SMD_LN_BB_CLK3_A_PIN] = &msm8998_ln_bb_clk3_a_pin,
>>   };
>> @@ -1057,10 +1061,10 @@ static struct clk_smd_rpm *sm6125_clks[] = {
>>       [RPM_SMD_IPA_A_CLK] = &msm8976_ipa_a_clk,
>>       [RPM_SMD_CE1_CLK] = &msm8992_ce1_clk,
>>       [RPM_SMD_CE1_A_CLK] = &msm8992_ce1_a_clk,
>> -    [RPM_SMD_LN_BB_CLK1] = &msm8916_bb_clk1,
>> -    [RPM_SMD_LN_BB_CLK1_A] = &msm8916_bb_clk1_a,
>> -    [RPM_SMD_LN_BB_CLK2] = &msm8916_bb_clk2,
>> -    [RPM_SMD_LN_BB_CLK2_A] = &msm8916_bb_clk2_a,
>> +    [RPM_SMD_LN_BB_CLK1] = &msm8998_ln_bb_clk1,
>> +    [RPM_SMD_LN_BB_CLK1_A] = &msm8998_ln_bb_clk1_a,
>> +    [RPM_SMD_LN_BB_CLK2] = &msm8998_ln_bb_clk2,
>> +    [RPM_SMD_LN_BB_CLK2_A] = &msm8998_ln_bb_clk2_a,
>>       [RPM_SMD_LN_BB_CLK3] = &msm8998_ln_bb_clk3,
>>       [RPM_SMD_LN_BB_CLK3_A] = &msm8998_ln_bb_clk3_a,
>>       [RPM_SMD_QUP_CLK] = &sm6125_qup_clk,
> 

-- 
With best wishes
Dmitry

