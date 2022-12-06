Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D9787644F92
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Dec 2022 00:26:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229555AbiLFX0G (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Dec 2022 18:26:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229479AbiLFX0G (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Dec 2022 18:26:06 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C03FF29811
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Dec 2022 15:26:04 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id p8so26060836lfu.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Dec 2022 15:26:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l526E0M3m2oeB1LGIT6sGPLZlCdqeAgIKILU4qw9R8o=;
        b=s4rxbPqRt7Xtl7khZlnLCLPWDJNS1o/oRUeXxqZBSxEuMe17Hfi8w+2xulHnNkZh+D
         VXJQ4AAofz6eCyVSiAxiV0K1lo2C/BE0gjVVjsBop+K0U2hF1GGOPAIwPR6BGvylIBOe
         BOhk5cyerhymAgyKzJfBov1B7bWcqkgk44TfdPr1EA47jYp4uA+5w2z4xudWb5HnUX86
         /ts5VwcFlddNJX9f+EDJb5MOYQ+JjGo+GmZUUkEPZ6afWSBX1LqKME/Glcsmr7VRqmH0
         9eMwI+QlkPm2LlA3SRz7erlYJpfmVJ6BVkrgugvCNGmOd6oWQyP16sbkbhFNXb/KSDb4
         MnhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l526E0M3m2oeB1LGIT6sGPLZlCdqeAgIKILU4qw9R8o=;
        b=2wsbjG1YlFyhvasGp4HU+/jSzPOucLvX4K/MzVHCsZkaqvAuSyt08TlZCoSSuXguYd
         pCdAGixvmfjoXDijMKFbcu/zmx+GJTduwBRvX6PIkz0J3VJmPVc6esP6kkXfbM6xLLP3
         UT5cQMD5r1N1VstjEZ+v+lE1zfsF1KCy0Neu1vs73LfH0ZV+SIXoJScnGI6CF6o8yLS/
         JP3BttWMtpMsXYRfua5epfnwO7oWdhWOjTU1zMrR7sI5c/OoqcLlNbEYzArvoE4cHnsy
         +EvemnQfr1qLkx1beNlCyJENwLMqKV/MPy7O8Bj7rrd8MbXx3CLlVdGThxuyuHxP71X+
         L4ZA==
X-Gm-Message-State: ANoB5plsHe60m0CYdoDzSUlCXKsP8VQofHLxCUFYy6YibivxzxNRUGFq
        4NV8m6tZG7zOq5ZXlk0Ir/K0J4DwUC5Ug49s6VePXfUq
X-Google-Smtp-Source: AA0mqf4BoWRwOwbzrlivar/cFYmd4/tWTYZ5h1khweGtYqyIdSzIjI0+GdVRyi8Lz8ijONptI+cLbQ==
X-Received: by 2002:a05:6512:340b:b0:4b5:704c:b79c with SMTP id i11-20020a056512340b00b004b5704cb79cmr3932205lfr.281.1670369163102;
        Tue, 06 Dec 2022 15:26:03 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id j19-20020a056512345300b004b549ad99adsm1690364lfr.304.2022.12.06.15.26.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Dec 2022 15:26:02 -0800 (PST)
Message-ID: <b13c2c9f-6949-57ee-22df-e99b1d3c098b@linaro.org>
Date:   Wed, 7 Dec 2022 01:26:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 06/16] clk: qcom: smd-rpm: rename msm8992_ln_bb_* clocks
 to qcs404_ln_bb_*
Content-Language: en-GB
To:     Alex Elder <elder@linaro.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20221203175808.859067-1-dmitry.baryshkov@linaro.org>
 <20221203175808.859067-7-dmitry.baryshkov@linaro.org>
 <7d56df1b-eb80-9e56-705f-c2d639ac1792@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <7d56df1b-eb80-9e56-705f-c2d639ac1792@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05/12/2022 19:04, Alex Elder wrote:
> On 12/3/22 11:57 AM, Dmitry Baryshkov wrote:
>> Follow the usual practice and rename msm8992_ln_bb_* clocks to use
>> qcs404_ln_bb_* prefix, since there is already a family of pin-controlled
>> ln_bb_clk clocks defined for the latter platform. This is mostly a
>> preparation step for the next patch.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> I notice something below.  I might be misunderstanding the code,
> but please explain anyway.
> 
>> ---
>>   drivers/clk/qcom/clk-smd-rpm.c | 24 ++++++++++++------------
>>   1 file changed, 12 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/clk/qcom/clk-smd-rpm.c 
>> b/drivers/clk/qcom/clk-smd-rpm.c
>> index 6af0753454ea..3a526a231684 100644
>> --- a/drivers/clk/qcom/clk-smd-rpm.c
>> +++ b/drivers/clk/qcom/clk-smd-rpm.c
>> @@ -635,7 +635,8 @@ static const struct rpm_smd_clk_desc 
>> rpm_clk_msm8976 = {
>>   };
>>   DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8992, div_clk3, div_clk3_a, 13, 
>> 19200000);
>> -DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8992, ln_bb_clk, ln_bb_a_clk, 8, 
>> 19200000);
>> +DEFINE_CLK_SMD_RPM_XO_BUFFER(qcs404, ln_bb_clk, ln_bb_clk_a, 8, 
>> 19200000);
>> +DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(qcs404, ln_bb_clk_pin, 
>> ln_bb_clk_a_pin, 8, 19200000);
> 
> You define the above clock(s), and comment out the qcs404 version below,
> but there are no changes to these clock reference in this patch.  Is
> that a mistake?  Should the pin control clock changes go in a different
> patch (like the next one)?

No. For all other pinctrl clocks there was a corresponding XO_BUFFER 
clock with the similar name (e.g. msm8998_ln_bb_clk3_pin vs 
msm8998_ln_bb_clk3). For qcs404_ln_bb_clk_pin there was no 
qcs404_ln_bb_clk, since the msm8992_ln_bb_clk was used instead (even for 
qcs404).

So for the sake of making the next patch simpler I just rename the 
msm8992 clock to qcs404. I'll add this to commit message.

> 
>                      -Alex
> 
>>   DEFINE_CLK_SMD_RPM(msm8992, ce1_clk, ce1_a_clk, QCOM_SMD_RPM_CE_CLK, 
>> 0);
>>   DEFINE_CLK_SMD_RPM(msm8992, ce2_clk, ce2_a_clk, QCOM_SMD_RPM_CE_CLK, 
>> 1);
>> @@ -673,8 +674,8 @@ static struct clk_smd_rpm *msm8992_clks[] = {
>>       [RPM_SMD_DIV_A_CLK3] = &msm8992_div_clk3_a,
>>       [RPM_SMD_IPA_CLK] = &msm8976_ipa_clk,
>>       [RPM_SMD_IPA_A_CLK] = &msm8976_ipa_a_clk,
>> -    [RPM_SMD_LN_BB_CLK] = &msm8992_ln_bb_clk,
>> -    [RPM_SMD_LN_BB_A_CLK] = &msm8992_ln_bb_a_clk,
>> +    [RPM_SMD_LN_BB_CLK] = &qcs404_ln_bb_clk,
>> +    [RPM_SMD_LN_BB_A_CLK] = &qcs404_ln_bb_clk_a,
>>       [RPM_SMD_MMSSNOC_AHB_CLK] = &msm8974_mmssnoc_ahb_clk,
>>       [RPM_SMD_MMSSNOC_AHB_A_CLK] = &msm8974_mmssnoc_ahb_a_clk,
>>       [RPM_SMD_MSS_CFG_AHB_CLK] = &msm8992_mss_cfg_ahb_clk,
>> @@ -733,8 +734,8 @@ static struct clk_smd_rpm *msm8994_clks[] = {
>>       [RPM_SMD_DIV_A_CLK3] = &msm8992_div_clk3_a,
>>       [RPM_SMD_IPA_CLK] = &msm8976_ipa_clk,
>>       [RPM_SMD_IPA_A_CLK] = &msm8976_ipa_a_clk,
>> -    [RPM_SMD_LN_BB_CLK] = &msm8992_ln_bb_clk,
>> -    [RPM_SMD_LN_BB_A_CLK] = &msm8992_ln_bb_a_clk,
>> +    [RPM_SMD_LN_BB_CLK] = &qcs404_ln_bb_clk,
>> +    [RPM_SMD_LN_BB_A_CLK] = &qcs404_ln_bb_clk_a,
>>       [RPM_SMD_MMSSNOC_AHB_CLK] = &msm8974_mmssnoc_ahb_clk,
>>       [RPM_SMD_MMSSNOC_AHB_A_CLK] = &msm8974_mmssnoc_ahb_a_clk,
>>       [RPM_SMD_MSS_CFG_AHB_CLK] = &msm8992_mss_cfg_ahb_clk,
>> @@ -798,8 +799,8 @@ static struct clk_smd_rpm *msm8996_clks[] = {
>>       [RPM_SMD_RF_CLK1_A] = &msm8916_rf_clk1_a,
>>       [RPM_SMD_RF_CLK2] = &msm8916_rf_clk2,
>>       [RPM_SMD_RF_CLK2_A] = &msm8916_rf_clk2_a,
>> -    [RPM_SMD_LN_BB_CLK] = &msm8992_ln_bb_clk,
>> -    [RPM_SMD_LN_BB_A_CLK] = &msm8992_ln_bb_a_clk,
>> +    [RPM_SMD_LN_BB_CLK] = &qcs404_ln_bb_clk,
>> +    [RPM_SMD_LN_BB_A_CLK] = &qcs404_ln_bb_clk_a,
>>       [RPM_SMD_DIV_CLK1] = &msm8974_div_clk1,
>>       [RPM_SMD_DIV_A_CLK1] = &msm8974_div_a_clk1,
>>       [RPM_SMD_DIV_CLK2] = &msm8974_div_clk2,
>> @@ -822,7 +823,6 @@ static const struct rpm_smd_clk_desc 
>> rpm_clk_msm8996 = {
>>   };
>>   DEFINE_CLK_SMD_RPM(qcs404, bimc_gpu_clk, bimc_gpu_a_clk, 
>> QCOM_SMD_RPM_MEM_CLK, 2);
>> -DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(qcs404, ln_bb_clk_pin, 
>> ln_bb_clk_a_pin, 8, 19200000);
>>   static struct clk_smd_rpm *qcs404_clks[] = {
>>       [RPM_SMD_QDSS_CLK] = &msm8916_qdss_clk,
>> @@ -841,8 +841,8 @@ static struct clk_smd_rpm *qcs404_clks[] = {
>>       [RPM_SMD_CE1_A_CLK] = &msm8992_ce1_a_clk,
>>       [RPM_SMD_RF_CLK1] = &msm8916_rf_clk1,
>>       [RPM_SMD_RF_CLK1_A] = &msm8916_rf_clk1_a,
>> -    [RPM_SMD_LN_BB_CLK] = &msm8992_ln_bb_clk,
>> -    [RPM_SMD_LN_BB_A_CLK] = &msm8992_ln_bb_a_clk,
>> +    [RPM_SMD_LN_BB_CLK] = &qcs404_ln_bb_clk,
>> +    [RPM_SMD_LN_BB_A_CLK] = &qcs404_ln_bb_clk_a,
>>       [RPM_SMD_LN_BB_CLK_PIN] = &qcs404_ln_bb_clk_pin,
>>       [RPM_SMD_LN_BB_A_CLK_PIN] = &qcs404_ln_bb_clk_a_pin,
>>   };
>> @@ -1014,8 +1014,8 @@ static struct clk_smd_rpm *msm8953_clks[] = {
>>       [RPM_SMD_BB_CLK2_A]        = &msm8916_bb_clk2_a,
>>       [RPM_SMD_RF_CLK2]        = &msm8916_rf_clk2,
>>       [RPM_SMD_RF_CLK2_A]        = &msm8916_rf_clk2_a,
>> -    [RPM_SMD_RF_CLK3]        = &msm8992_ln_bb_clk,
>> -    [RPM_SMD_RF_CLK3_A]        = &msm8992_ln_bb_a_clk,
>> +    [RPM_SMD_RF_CLK3]        = &qcs404_ln_bb_clk,
>> +    [RPM_SMD_RF_CLK3_A]        = &qcs404_ln_bb_clk_a,
>>       [RPM_SMD_DIV_CLK2]        = &msm8974_div_clk2,
>>       [RPM_SMD_DIV_A_CLK2]        = &msm8974_div_a_clk2,
>>       [RPM_SMD_BB_CLK1_PIN]        = &msm8916_bb_clk1_pin,
> 

-- 
With best wishes
Dmitry

