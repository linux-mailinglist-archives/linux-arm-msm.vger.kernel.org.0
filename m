Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A45245B619C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Sep 2022 21:25:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230327AbiILTZG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Sep 2022 15:25:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230160AbiILTZF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Sep 2022 15:25:05 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2DBFF592
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Sep 2022 12:25:03 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id a8so16430118lff.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Sep 2022 12:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=Z9xrK+cudMsYTzvXWKkchJ/OTg9Bcw0V+8CX/GWM0c0=;
        b=Ux765ewV0FXkPOzPH8OAb7l1cxJv5icqz8fyK8Ye8gt3OBN8U25JwaXo+dzE8IlhAi
         75aKdew0phMILWACWO6Cf+c+S5YPdCYWe7nZCWTN6Poe0x8v4gzMX4rE3zmGRIoae/hp
         gaB8R0KGWwZQXd8zoTIu722gS4mTZSWqapA0rd/V/uzQrgndzMOQUlhMgZQiQp9Jxj6n
         cmZj4qXkVk8wgpp+R7Zw2aoscO3WCFNu7zLv6GmrPcilMYiRaV96BPSxgBtIL1gA8YSl
         AcO6KZh+XfshaI76xalChr5y1I48yYCHGRdnPTjgVZcJZxFuhU3/l8VoJtLXP8GU68Uz
         z8OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=Z9xrK+cudMsYTzvXWKkchJ/OTg9Bcw0V+8CX/GWM0c0=;
        b=SDsUj/f7tYaXfxgqJyQ6LHW9OXN0i5J4cshJHcoAKylEihQRBJx697f6VuWj/H6v0w
         aFo4FK3UAJPkMNB1jy6HGW4Tj+wq3uNoYZmHJT3xd6/ddN4MkIZmhQCq9OC4NDyskO3K
         +AQgfeBrEpVlBkwYwbEysgl4VtlOfw4eYUrUOdl74xPZNlWWhqX0lCpUSM2kOqf1K078
         HpkLEEps+qmKkOI7KZFsAp0hAGuQg5oK7siJyf84l8tfOIfSvF2Kq3Ka9JTwldBp1b/Y
         kuPxWynt2sfzrgnzOjqYao+OzdK46HI/8fqmkqC0SZ9JjdUvh9uwN00KHupMcj5FSBwM
         vu3w==
X-Gm-Message-State: ACgBeo3CpDzfE4iW/BQEDoIOiufuB+aQmEiMxiCyqMvbHmakLoj+ukae
        dqDVm6JjllOi6qUgslzvQmyo+A==
X-Google-Smtp-Source: AA6agR4Utj//Gm3aUx2tKn4UBVPn53W9al1xERLYZulmEfSRZMXJmam4Wja66nWfrYsiFAZZThHoUg==
X-Received: by 2002:a05:6512:118b:b0:492:e3c4:a164 with SMTP id g11-20020a056512118b00b00492e3c4a164mr10273254lfr.598.1663010702159;
        Mon, 12 Sep 2022 12:25:02 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id b20-20020a056512071400b00492b494c4e8sm1220165lfs.298.2022.09.12.12.25.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Sep 2022 12:25:01 -0700 (PDT)
Message-ID: <47f661b6-b5b9-9f28-10cf-1e7bbb8b282a@linaro.org>
Date:   Mon, 12 Sep 2022 22:25:00 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v5 1/3] drm/msm/dp: cleared DP_DOWNSPREAD_CTRL register
 before start link training
Content-Language: en-GB
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>,
        dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        sean@poorly.run, swboyd@chromium.org, dianders@chromium.org,
        vkoul@kernel.org, daniel@ffwll.ch, airlied@linux.ie,
        agross@kernel.org, bjorn.andersson@linaro.org
Cc:     quic_abhinavk@quicinc.com, quic_sbillaka@quicinc.com,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1662999830-13916-1-git-send-email-quic_khsieh@quicinc.com>
 <1662999830-13916-2-git-send-email-quic_khsieh@quicinc.com>
 <0f381285-860f-aaa2-2ae7-834608d0b4e8@linaro.org>
 <e6543dd7-30ac-d210-6bf0-95bb9d22ca0a@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <e6543dd7-30ac-d210-6bf0-95bb9d22ca0a@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/09/2022 22:21, Kuogee Hsieh wrote:
> 
> On 9/12/2022 11:39 AM, Dmitry Baryshkov wrote:
>> On 12/09/2022 19:23, Kuogee Hsieh wrote:
>>> DOWNSPREAD_CTRL (0x107) shall be cleared to 0 upon power-on reset or an
>>> upstream device disconnect. This patch will enforce this rule by always
>>> cleared DOWNSPREAD_CTRL register to 0 before start link training. At 
>>> rare
>>> case that DP MSA timing parameters may be mis-interpreted by the sink
>>> which causes audio sampling rate be calculated wrongly and cause audio
>>> did not work at sink if DOWNSPREAD_CTRL register is not cleared to 0.
>>>
>>> Changes in v2:
>>> 1) fix spelling at commit text
>>> 2) merge ssc variable into encoding[0]
>>>
>>> Changes in v3:
>>> -- correct spelling of DOWNSPREAD_CTRL
>>> -- replace err with len of ssize_t
>>>
>>> Changes in v4:
>>> -- split into 2 patches
>>>
>>> Fixes: 154b5a7da0fd ("drm/msm/dp: add displayPort driver support")
>>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>>> ---
>>>   drivers/gpu/drm/msm/dp/dp_ctrl.c | 13 +++++--------
>>>   1 file changed, 5 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c 
>>> b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>>> index ab6aa13..2c74c59 100644
>>> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
>>> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>>> @@ -1245,8 +1245,7 @@ static int dp_ctrl_link_train(struct 
>>> dp_ctrl_private *ctrl,
>>>   {
>>>       int ret = 0;
>>>       const u8 *dpcd = ctrl->panel->dpcd;
>>> -    u8 encoding = DP_SET_ANSI_8B10B;
>>> -    u8 ssc;
>>> +    u8 encoding[] = { 0, DP_SET_ANSI_8B10B };
>>>       u8 assr;
>>>       struct dp_link_info link_info = {0};
>>>   @@ -1258,13 +1257,11 @@ static int dp_ctrl_link_train(struct 
>>> dp_ctrl_private *ctrl,
>>>         dp_aux_link_configure(ctrl->aux, &link_info);
>>>   -    if (drm_dp_max_downspread(dpcd)) {
>>> -        ssc = DP_SPREAD_AMP_0_5;
>>> -        drm_dp_dpcd_write(ctrl->aux, DP_DOWNSPREAD_CTRL, &ssc, 1);
>>> -    }
>>> +    if (drm_dp_max_downspread(dpcd))
>>> +        encoding[0] |= DP_SPREAD_AMP_0_5;
>>
>> It would be simpler to call drm_dp_dpcd_write(ssc, DP_DOWNSPREAD_CTRL, 
>> 1) unconditionally here. You won't have to change the 
>> encoding/DP_MAIN_LINK_CHANNEL_CODING_SET/etc.
> 
> The difference is one write with 2 bytes against two writes with one 
> byte each.
> 
> I think it is more efficient to combine two bytes into one write since 
> these two bytes are consecutive address.

I probably wouldn't do so, nevertheless:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> 
>>
>>>   -    drm_dp_dpcd_write(ctrl->aux, DP_MAIN_LINK_CHANNEL_CODING_SET,
>>> -                &encoding, 1);
>>> +    /* config DOWNSPREAD_CTRL and MAIN_LINK_CHANNEL_CODING_SET */
>>> +    drm_dp_dpcd_write(ctrl->aux, DP_DOWNSPREAD_CTRL, encoding, 2);
>>>         if (drm_dp_alternate_scrambler_reset_cap(dpcd)) {
>>>           assr = DP_ALTERNATE_SCRAMBLER_RESET_ENABLE;
>>

-- 
With best wishes
Dmitry

