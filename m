Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B4366940B5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Feb 2023 10:19:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229822AbjBMJTN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Feb 2023 04:19:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230061AbjBMJTK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Feb 2023 04:19:10 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA0A915547
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Feb 2023 01:18:49 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id s11so4178404edd.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Feb 2023 01:18:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eXcO6OpF41wT8g2AlitKAQca/Gi4aTS6loHCy0fN5O8=;
        b=na3b1mLWpUHjG7w0WvINAJ+sieyOA0V8D503u4UydLg7/5IcsuQhitxgPBOsqZJIWK
         d4XT97q8e8BmIYy1LeKDLxEXt9Y9YxsNaGgtBIgp1E7r8V7AbV0WtyVu2Si6tZahcQfo
         JO8h3+U8ptvOchPabTPGVPVJxyZys1slQR1OI+yimsYXgsDk7f8+AKMkJqssydyBOwRS
         TmT1jSWRGsbl5rNUkg/kYHJ2fS89jySGcH4yr1kD8PDHU29FRfqvVYcgmW+PFoSSxlHd
         C6v4gjddkzUCg6bysiz18NxGz6kAPfkH+/w1fuQ+AhQIxpm+l2n2TPqctSX8UBF7ROgZ
         8P8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eXcO6OpF41wT8g2AlitKAQca/Gi4aTS6loHCy0fN5O8=;
        b=eujikNWmmsV94L/b4eMQJE07d8MvzCTYdqfyBrJTnDJ8/woecEgtS7Ix2PUWhHzsBm
         CrPvx8IIQcQXpTEhUc855ctKnHpJvWo9S6v3qoGF9Ha4UussRrj4aT/g1iRMnRTBZiBk
         BeoIdDh5QZZFtO2PHxtr6yL+DKcnGoGZHQiCWZUcW3mAPGUe4j9NS+uw6j31YpNfW/6K
         UBI0XM1dmg14R5qUrHCiKWOANDVbVMeIJ+lmoV7UEnp/B8UT9kLU6fWVSW9FHeqMbQh6
         mowhniJmlrXyO9rt4ARp5Z666Jzf2YHSRi4G2WslPFYqnIl3qIHqNuO29wLzNO8EA6lf
         4otg==
X-Gm-Message-State: AO0yUKWP3+CXdN7Jm86oyWxsKjRG3KtrjF02ZIwWFKicqDW7g6Oms/ZY
        YSVYXJx+L/r7UL5/bE01Rcb37g==
X-Google-Smtp-Source: AK7set+6RvtSJO2PND+dYWRs5D0MODCz7WrbFPGLsDUxj8o0g8iKPI5M9ZHqBdlXyqhhgGjc0mVVzA==
X-Received: by 2002:a50:8d4e:0:b0:4ac:bcef:505a with SMTP id t14-20020a508d4e000000b004acbcef505amr5949422edt.38.1676279928279;
        Mon, 13 Feb 2023 01:18:48 -0800 (PST)
Received: from [192.168.1.101] (abxh117.neoplus.adsl.tpnet.pl. [83.9.1.117])
        by smtp.gmail.com with ESMTPSA id l5-20020a1709061c4500b0088eb85e29c5sm6522124ejg.6.2023.02.13.01.18.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 01:18:47 -0800 (PST)
Message-ID: <8dfd429b-a77e-af58-c778-9c157844e494@linaro.org>
Date:   Mon, 13 Feb 2023 10:18:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 03/10] drm/msm/dsi: Zero-terminate
 msm_dsi_config::io_start
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Douglas Anderson <dianders@chromium.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Vladimir Lypak <vladimir.lypak@gmail.com>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20230211115110.1462920-1-konrad.dybcio@linaro.org>
 <20230211115110.1462920-4-konrad.dybcio@linaro.org>
 <71b63ae5-1b2c-b0a9-913c-99b657133f0f@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <71b63ae5-1b2c-b0a9-913c-99b657133f0f@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 11.02.2023 14:19, Dmitry Baryshkov wrote:
> On 11/02/2023 13:51, Konrad Dybcio wrote:
>> In preparation for supporting multiple sets of possible base registers,
>> Zero-terminate the array that contains them to remove the need of
>> specifying num_dsi for each set.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/dsi/dsi_cfg.c  | 39 ++++++++++--------------------
>>   drivers/gpu/drm/msm/dsi/dsi_cfg.h  |  4 +--
>>   drivers/gpu/drm/msm/dsi/dsi_host.c |  2 +-
>>   3 files changed, 16 insertions(+), 29 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
>> index 068d45b3a8f0..5f62c563bd1c 100644
>> --- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
>> +++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
>> @@ -22,9 +22,8 @@ static const struct msm_dsi_config apq8064_dsi_cfg = {
>>       .bus_clk_names = dsi_v2_bus_clk_names,
>>       .num_bus_clks = ARRAY_SIZE(dsi_v2_bus_clk_names),
>>       .io_start = {
>> -        { 0x4700000, 0x5800000 },
>> +        { 0x4700000, 0x5800000, 0 },
>>       },
>> -    .num_dsi = 2,
>>   };
>>     static const char * const dsi_6g_bus_clk_names[] = {
>> @@ -44,9 +43,8 @@ static const struct msm_dsi_config msm8974_apq8084_dsi_cfg = {
>>       .bus_clk_names = dsi_6g_bus_clk_names,
>>       .num_bus_clks = ARRAY_SIZE(dsi_6g_bus_clk_names),
>>       .io_start = {
>> -        { 0xfd922800, 0xfd922b00 },
>> +        { 0xfd922800, 0xfd922b00, 0 },
>>       },
>> -    .num_dsi = 2,
>>   };
>>     static const char * const dsi_8916_bus_clk_names[] = {
>> @@ -65,9 +63,8 @@ static const struct msm_dsi_config msm8916_dsi_cfg = {
>>       .bus_clk_names = dsi_8916_bus_clk_names,
>>       .num_bus_clks = ARRAY_SIZE(dsi_8916_bus_clk_names),
>>       .io_start = {
>> -        { 0x1a98000 },
>> +        { 0x1a98000, 0 },
>>       },
>> -    .num_dsi = 1,
>>   };
>>     static const char * const dsi_8976_bus_clk_names[] = {
>> @@ -86,9 +83,8 @@ static const struct msm_dsi_config msm8976_dsi_cfg = {
>>       .bus_clk_names = dsi_8976_bus_clk_names,
>>       .num_bus_clks = ARRAY_SIZE(dsi_8976_bus_clk_names),
>>       .io_start = {
>> -        { 0x1a94000, 0x1a96000 },
>> +        { 0x1a94000, 0x1a96000, 0 },
>>       },
>> -    .num_dsi = 2,
>>   };
>>     static const struct regulator_bulk_data msm8994_dsi_regulators[] = {
>> @@ -107,9 +103,8 @@ static const struct msm_dsi_config msm8994_dsi_cfg = {
>>       .bus_clk_names = dsi_6g_bus_clk_names,
>>       .num_bus_clks = ARRAY_SIZE(dsi_6g_bus_clk_names),
>>       .io_start = {
>> -        { 0xfd998000, 0xfd9a0000 },
>> +        { 0xfd998000, 0xfd9a0000, 0 },
>>       },
>> -    .num_dsi = 2,
>>   };
>>     static const char * const dsi_8996_bus_clk_names[] = {
>> @@ -129,9 +124,8 @@ static const struct msm_dsi_config msm8996_dsi_cfg = {
>>       .bus_clk_names = dsi_8996_bus_clk_names,
>>       .num_bus_clks = ARRAY_SIZE(dsi_8996_bus_clk_names),
>>       .io_start = {
>> -        { 0x994000, 0x996000 },
>> +        { 0x994000, 0x996000, 0 },
>>       },
>> -    .num_dsi = 2,
>>   };
>>     static const char * const dsi_msm8998_bus_clk_names[] = {
>> @@ -150,9 +144,8 @@ static const struct msm_dsi_config msm8998_dsi_cfg = {
>>       .bus_clk_names = dsi_msm8998_bus_clk_names,
>>       .num_bus_clks = ARRAY_SIZE(dsi_msm8998_bus_clk_names),
>>       .io_start = {
>> -        { 0xc994000, 0xc996000 },
>> +        { 0xc994000, 0xc996000, 0 },
>>       },
>> -    .num_dsi = 2,
>>   };
>>     static const char * const dsi_sdm660_bus_clk_names[] = {
>> @@ -170,9 +163,8 @@ static const struct msm_dsi_config sdm660_dsi_cfg = {
>>       .bus_clk_names = dsi_sdm660_bus_clk_names,
>>       .num_bus_clks = ARRAY_SIZE(dsi_sdm660_bus_clk_names),
>>       .io_start = {
>> -        { 0xc994000, 0xc996000 },
>> +        { 0xc994000, 0xc996000, 0 },
>>       },
>> -    .num_dsi = 2,
>>   };
>>     static const char * const dsi_sdm845_bus_clk_names[] = {
>> @@ -194,9 +186,8 @@ static const struct msm_dsi_config sdm845_dsi_cfg = {
>>       .bus_clk_names = dsi_sdm845_bus_clk_names,
>>       .num_bus_clks = ARRAY_SIZE(dsi_sdm845_bus_clk_names),
>>       .io_start = {
>> -        { 0xae94000, 0xae96000 },
>> +        { 0xae94000, 0xae96000, 0 },
>>       },
>> -    .num_dsi = 2,
>>   };
>>     static const struct regulator_bulk_data sm8550_dsi_regulators[] = {
>> @@ -210,9 +201,8 @@ static const struct msm_dsi_config sm8550_dsi_cfg = {
>>       .bus_clk_names = dsi_sdm845_bus_clk_names,
>>       .num_bus_clks = ARRAY_SIZE(dsi_sdm845_bus_clk_names),
>>       .io_start = {
>> -        { 0xae94000, 0xae96000 },
>> +        { 0xae94000, 0xae96000, 0 },
>>       },
>> -    .num_dsi = 2,
>>   };
>>     static const struct regulator_bulk_data sc7180_dsi_regulators[] = {
>> @@ -226,9 +216,8 @@ static const struct msm_dsi_config sc7180_dsi_cfg = {
>>       .bus_clk_names = dsi_sc7180_bus_clk_names,
>>       .num_bus_clks = ARRAY_SIZE(dsi_sc7180_bus_clk_names),
>>       .io_start = {
>> -        { 0xae94000 },
>> +        { 0xae94000, 0 },
>>       },
>> -    .num_dsi = 1,
>>   };
>>     static const char * const dsi_sc7280_bus_clk_names[] = {
>> @@ -246,9 +235,8 @@ static const struct msm_dsi_config sc7280_dsi_cfg = {
>>       .bus_clk_names = dsi_sc7280_bus_clk_names,
>>       .num_bus_clks = ARRAY_SIZE(dsi_sc7280_bus_clk_names),
>>       .io_start = {
>> -        { 0xae94000, 0xae96000 },
>> +        { 0xae94000, 0xae96000, 0 },
>>       },
>> -    .num_dsi = 2,
>>   };
>>     static const char * const dsi_qcm2290_bus_clk_names[] = {
>> @@ -266,9 +254,8 @@ static const struct msm_dsi_config qcm2290_dsi_cfg = {
>>       .bus_clk_names = dsi_qcm2290_bus_clk_names,
>>       .num_bus_clks = ARRAY_SIZE(dsi_qcm2290_bus_clk_names),
>>       .io_start = {
>> -        { 0x5e94000 },
>> +        { 0x5e94000, 0 },
>>       },
>> -    .num_dsi = 1,
>>   };
>>     static const struct msm_dsi_host_cfg_ops msm_dsi_v2_host_ops = {
>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.h b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
>> index df9f09876ccb..03493cc6b772 100644
>> --- a/drivers/gpu/drm/msm/dsi/dsi_cfg.h
>> +++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
>> @@ -41,8 +41,8 @@ struct msm_dsi_config {
>>       int num_regulators;
>>       const char * const *bus_clk_names;
>>       const int num_bus_clks;
>> -    const resource_size_t io_start[VARIANTS_MAX][DSI_MAX];
>> -    const int num_dsi;
>> +    /* Allow + 1 entry for the zero-terminator */
>> +    const resource_size_t io_start[VARIANTS_MAX][DSI_MAX + 1];
>>   };
>>     struct msm_dsi_host_cfg_ops {
>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> index 22ba8726b0ea..f5092b4d0757 100644
>> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
>> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> @@ -1868,7 +1868,7 @@ static int dsi_host_get_id(struct msm_dsi_host *msm_host)
>>       if (!res)
>>           return -EINVAL;
>>   -    for (i = 0; i < cfg->num_dsi; i++) {
>> +    for (i = 0; cfg->io_start[0][i]; i++) {
>>           if (cfg->io_start[0][i] == res->start)
>>               return i;
>>       }
> 
> I think we have the easier way to do this: always loop towards DSI_MAX. Empty cells will contain the value of 0 which can not match against valid starting address.
Yep, your approach will save us NUM_ENTRIES*sizeof(u64) memory!

> 
> Also please shift this patch to the first place, it will be logical to add VARIANT_MAX after removing num_dsi.
Ack.

Konrad
> 
