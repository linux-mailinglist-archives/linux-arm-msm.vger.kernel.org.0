Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5647C665F44
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jan 2023 16:38:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238445AbjAKPiF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Jan 2023 10:38:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235295AbjAKPht (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Jan 2023 10:37:49 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC23119C3E
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 07:37:47 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id b3so24132197lfv.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 07:37:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DiZWVXTm47HTNMEhLXJp72R5vsBenAHhGAw4+f526sM=;
        b=pcKiK+f2lKHpjYPsVehN4nLr098fiEnqCowZYXCaK+Ioz8cm7WIXb2G+twhfjyx8NQ
         pCZbGDGsPp46Y2cH3vUq4mAB9VCGcXhhYRF73p6zIat+xUtfEAIaXmb6DczHd9woQt2u
         jDp7o4a9O0XtGoENzmAiYL3bL96izRPsvBEVWmVmV3OKrpkK8b/Cyo+a/d4BCDZkZuRZ
         nIJxMj7gq/JI00x4Qrw88XiwdjuVGmQF3TKy/hwsyzmUhd8wM+wk2EBuiVX3LwU4Onyf
         3DC+Lh/WAL0cDSz5JqsfjH3R9Tj/UKSuCd7B6K03XAHzahOdmXpOISPns6OJXgMjLd/D
         Cz8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DiZWVXTm47HTNMEhLXJp72R5vsBenAHhGAw4+f526sM=;
        b=YSZQkOZ4oWSUkvwrwN19ikA8ipo5dntQlnVXFwhO+UGKpUKlwKMhV2f/877PNkBMHw
         i7bTsW4UXPvdNMl1zuz6UwuWS8yykhJnSBDeJTQfTJbYC/qg6/v3bMRvvGo/Ci3+WcB5
         kHwMKqaGHi5E0lOUpucm9WKMRoVDUmBTA7kj/HMBHN+Nh/3v7hSdROUh9mViayPJF7eh
         8FOsoVhwbS+5ZNPWLRck6uMjo6e9SYzLtwvlc1lTS7DJnNCgPDY/raXLDk1Ih9kbD74g
         xeVyJi41ZMGorgohy7ted7JGjJwnD2Gk/PnQqngo1a3kADxPNLiUQYj5fdrWluzj1yPX
         T6yA==
X-Gm-Message-State: AFqh2koy2vQKaKMDY0eN9/KGcXMz7xIBT6lyNGogtrR8cyP1h37j0m6s
        ID+irnbW12fKCkfejY7hXtfHdw==
X-Google-Smtp-Source: AMrXdXtS3EoDQWb7T/eo7e/pqwmSTvEMZ1Bvy/Bo03WuHhBJGgXevGa+e32bUStRw4lGq5zeK5b1iQ==
X-Received: by 2002:a05:6512:304a:b0:4aa:54a:3a6e with SMTP id b10-20020a056512304a00b004aa054a3a6emr24005109lfb.41.1673451466103;
        Wed, 11 Jan 2023 07:37:46 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id bi35-20020a0565120ea300b0048a982ad0a8sm2780901lfb.23.2023.01.11.07.37.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jan 2023 07:37:45 -0800 (PST)
Message-ID: <1b29bbef-1ee3-654c-bb58-c8fcf3b876a0@linaro.org>
Date:   Wed, 11 Jan 2023 17:37:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 12/13] drm/bridge: lt9611: stop filtering modes via the
 table
Content-Language: en-GB
To:     neil.armstrong@linaro.org, Vinod Koul <vkoul@kernel.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>
Cc:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org
References: <20230108165656.136871-1-dmitry.baryshkov@linaro.org>
 <20230108165656.136871-13-dmitry.baryshkov@linaro.org>
 <c03235b1-85d1-1e55-b8c2-9a553887145f@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <c03235b1-85d1-1e55-b8c2-9a553887145f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/01/2023 12:57, Neil Armstrong wrote:
> On 08/01/2023 17:56, Dmitry Baryshkov wrote:
>> The lt9611 bridge can support different modes, it makes no sense to list
>> them in the table. Drop the table and check the number of interfaces
>> using the fixed value.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/bridge/lontium-lt9611.c | 41 +++----------------------
>>   1 file changed, 4 insertions(+), 37 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c 
>> b/drivers/gpu/drm/bridge/lontium-lt9611.c
>> index 82af1f954cc6..df9f015aa3a0 100644
>> --- a/drivers/gpu/drm/bridge/lontium-lt9611.c
>> +++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
>> @@ -84,24 +84,6 @@ static const struct regmap_config 
>> lt9611_regmap_config = {
>>       .num_ranges = ARRAY_SIZE(lt9611_ranges),
>>   };
>> -struct lt9611_mode {
>> -    u16 hdisplay;
>> -    u16 vdisplay;
>> -    u8 vrefresh;
>> -    u8 lanes;
>> -    u8 intfs;
>> -};
>> -
>> -static struct lt9611_mode lt9611_modes[] = {
>> -    { 3840, 2160, 30, 4, 2 }, /* 3840x2160 24bit 30Hz 4Lane 2ports */
>> -    { 1920, 1080, 60, 4, 1 }, /* 1080P 24bit 60Hz 4lane 1port */
>> -    { 1920, 1080, 30, 3, 1 }, /* 1080P 24bit 30Hz 3lane 1port */
>> -    { 1920, 1080, 24, 3, 1 },
>> -    { 720, 480, 60, 4, 1 },
>> -    { 720, 576, 50, 2, 1 },
>> -    { 640, 480, 60, 2, 1 },
>> -};
>> -
>>   static struct lt9611 *bridge_to_lt9611(struct drm_bridge *bridge)
>>   {
>>       return container_of(bridge, struct lt9611, bridge);
>> @@ -603,21 +585,6 @@ static int lt9611_regulator_enable(struct lt9611 
>> *lt9611)
>>       return 0;
>>   }
>> -static struct lt9611_mode *lt9611_find_mode(const struct 
>> drm_display_mode *mode)
>> -{
>> -    int i;
>> -
>> -    for (i = 0; i < ARRAY_SIZE(lt9611_modes); i++) {
>> -        if (lt9611_modes[i].hdisplay == mode->hdisplay &&
>> -            lt9611_modes[i].vdisplay == mode->vdisplay &&
>> -            lt9611_modes[i].vrefresh == drm_mode_vrefresh(mode)) {
>> -            return &lt9611_modes[i];
>> -        }
>> -    }
>> -
>> -    return NULL;
>> -}
>> -
>>   static enum drm_connector_status lt9611_bridge_detect(struct 
>> drm_bridge *bridge)
>>   {
>>       struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
>> @@ -832,12 +799,12 @@ static enum drm_mode_status 
>> lt9611_bridge_mode_valid(struct drm_bridge *bridge,
>>                                const struct drm_display_info *info,
>>                                const struct drm_display_mode *mode)
>>   {
>> -    struct lt9611_mode *lt9611_mode = lt9611_find_mode(mode);
>>       struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
>> -    if (!lt9611_mode)
>> -        return MODE_BAD;
>> -    else if (lt9611_mode->intfs > 1 && !lt9611->dsi1)
>> +    if (mode->hdisplay >= 3840 && drm_mode_vrefresh(mode) >= 31)
> 
> Isn't 31 a typo ?

Maybe I should change that to drm_mode_vrefresh(mode) > 30. The chip 
supports 3840x2160-30, but doesn't promise to support anything above that.

> 
>> +        return MODE_CLOCK_HIGH;
>> +
>> +    if (mode->hdisplay > 2000 && !lt9611->dsi1_node)
>>           return MODE_PANEL;
>>       else
>>           return MODE_OK;
> 

-- 
With best wishes
Dmitry

