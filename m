Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E33A4B2DD2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Feb 2022 20:38:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244277AbiBKTiB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Feb 2022 14:38:01 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:52796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347031AbiBKTiA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Feb 2022 14:38:00 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38B63CFA
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Feb 2022 11:37:57 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id j7so1189889lfu.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Feb 2022 11:37:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=sSx8Paqu3ASvbjQPUlnYKKI4cx7QprSE/iXv4ANFEu4=;
        b=swvsTENNZju97vEixJSQtcO5KNE1iXnnSC/vj7XjHeIGPkW7BS7rKBUg/XaUiC/z7h
         lVUUw9VsFgIORqxaHtjDNwNdahuXfjgXpoNDyels9L1rHPaQi4bzRKzq0Sp58Yd7pnid
         deQv832Rtc9ZH5uqGGs6/sHobyeWb6Ae6jzHMs77LXuBUurfb06OZ85Jd8mVgyoA+CjE
         4niHkWEV0Vk2/Z08SP0PYis54EP5lB/eO8E3WIEXWcy0GmMt/elIXWbQMfzqQS5yBjAl
         HYNOtOxc76pWIUwU83qhmxbfvT3TligFl+9D1Rr5K83WcnvBG86o1EpENeLNO4+e67pS
         holw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=sSx8Paqu3ASvbjQPUlnYKKI4cx7QprSE/iXv4ANFEu4=;
        b=O1JmI79JX9TkhlzjZn4w3PLSiyoPGv2LSeHdPxEz94ZY5mGx5jSUVQibGWSGunSZF3
         ezB75VWEYmuPian7Uri3tBIjOnOD94FVXdb28IHnHCIBiq8VfG6x94KLaQvIuQuNBOmv
         F8MEUmXKHvMKCFyGOkXWuF+J5W+Y22CBQQIStA0sZO0Y2WXDr8CPTcNJhRy8A6fjAqqe
         m2SeE6A4kuMdH28QDu5EiBTV7pQnouS3efSF42ZuvoCY9jIOn+xf2UkdPM/b8tDl2Goh
         4AleY02SASiZ+dfHk0YjrCgAkCWMjzRVKipkj58AE3BHXHegxv0IPHw8BwQklsXrc+OQ
         ELCw==
X-Gm-Message-State: AOAM531kebRkcAq9JcojlFuqk+E/PAzFqtDqr85sbUFK/pzi7qql15O0
        +XjPRQGVDqi86JufQ6voiTFfcA==
X-Google-Smtp-Source: ABdhPJxN/S/6+pDOdwmvMpW/KnsSgE/aQtO96RAZErkrt+Ug0YDjxVElnFHKfH3n4d/fC1CAk32q9A==
X-Received: by 2002:ac2:5dcb:: with SMTP id x11mr2225351lfq.160.1644608275561;
        Fri, 11 Feb 2022 11:37:55 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id q7sm1151702lfm.113.2022.02.11.11.37.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Feb 2022 11:37:54 -0800 (PST)
Message-ID: <b3338d40-5f54-2577-60a9-afa3a34173f1@linaro.org>
Date:   Fri, 11 Feb 2022 22:37:53 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH 1/2] drm/msm/dsi: move DSI host powerup to modeset time
Content-Language: en-GB
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
References: <20211207222901.988484-1-dmitry.baryshkov@linaro.org>
 <20211207222901.988484-2-dmitry.baryshkov@linaro.org>
 <9fc8d452-7541-cbc5-57ca-96d1e480150c@quicinc.com>
 <CAA8EJpp_re=UYYpuY90FiFJjARcFr+sZoR_WtJ9ETU40Dc_wig@mail.gmail.com>
In-Reply-To: <CAA8EJpp_re=UYYpuY90FiFJjARcFr+sZoR_WtJ9ETU40Dc_wig@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 18/01/2022 23:03, Dmitry Baryshkov wrote:
> On Tue, 18 Jan 2022 at 22:29, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>>
>>
>> On 12/7/2021 2:29 PM, Dmitry Baryshkov wrote:
>>> The DSI subsystem does not fully fall into the pre-enable/enable system
>>> of callbacks, since typically DSI device bridge drivers expect to be
>>> able to communicate with DSI devices at the pre-enable() callback. The
>>> reason is that for some DSI hosts enabling the video stream would
>>> prevent other drivers from sending DSI commands. For example see the
>>> panel-bridge driver, which does drm_panel_prepare() from the
>>> pre_enable() callback (which would be called before our pre_enable()
>>> callback, resulting in panel preparation failures as the link is not yet
>>> ready).
>>>
>>> Therewere several attempts to solve this issue, but currently the best
>>> approach is to power up the DSI link from the mode_set() callback,
>>> allowing next bridge/panel to use DSI transfers in the pre_enable()
>>> time. Follow this approach.
>>>
>> Change looks okay. As per the programming guideline, we should set the
>> VIDEO_MODE_EN register in the DSI controller followed by enabling the
>> timing engine which will still happen even now because we will do it in
>> modeset instead of the pre_enable().
>> But, this can potentially increase the delay between VIDEO_MODE_EN
>> and TIMING_ENGINE_EN. I dont see anything in the programming guide
>> against this but since this is a change from the original flow, I would
>> like to do one test before acking this. Can you please try adding a huge
>> delay like 200-300ms between VIDEO_MODE_EN and timing engine enable to
>> make sure there are no issues? You can do that here:
> 
> 
> Fine, I'll do the test as the time permits.

I did the tests, the display pipeline works as expected.

Let's get this in, it allows using other DSI-controlled bridges.

> 
>>
>> int msm_dsi_host_enable(struct mipi_dsi_host *host)
>> {
>>       struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
>>
>>       dsi_op_mode_config(msm_host,
>>           !!(msm_host->mode_flags & MIPI_DSI_MODE_VIDEO), true);
>>
>>       msleep(300);
>> }
>>
>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>    drivers/gpu/drm/msm/dsi/dsi_manager.c | 43 +++++++++++++++++++--------
>>>    1 file changed, 31 insertions(+), 12 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
>>> index 681ca74fe410..497719efb9e9 100644
>>> --- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
>>> +++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
>>> @@ -336,13 +336,12 @@ dsi_mgr_connector_best_encoder(struct drm_connector *connector)
>>>        return msm_dsi_get_encoder(msm_dsi);
>>>    }
>>>
>>> -static void dsi_mgr_bridge_pre_enable(struct drm_bridge *bridge)
>>> +static void dsi_mgr_bridge_power_on(struct drm_bridge *bridge)
>>>    {
>>>        int id = dsi_mgr_bridge_get_id(bridge);
>>>        struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
>>>        struct msm_dsi *msm_dsi1 = dsi_mgr_get_dsi(DSI_1);
>>>        struct mipi_dsi_host *host = msm_dsi->host;
>>> -     struct drm_panel *panel = msm_dsi->panel;
>>>        struct msm_dsi_phy_shared_timings phy_shared_timings[DSI_MAX];
>>>        bool is_bonded_dsi = IS_BONDED_DSI();
>>>        int ret;
>>> @@ -383,6 +382,34 @@ static void dsi_mgr_bridge_pre_enable(struct drm_bridge *bridge)
>>>        if (is_bonded_dsi && msm_dsi1)
>>>                msm_dsi_host_enable_irq(msm_dsi1->host);
>>>
>>> +     return;
>>> +
>>> +host1_on_fail:
>>> +     msm_dsi_host_power_off(host);
>>> +host_on_fail:
>>> +     dsi_mgr_phy_disable(id);
>>> +phy_en_fail:
>>> +     return;
>>> +}
>>> +
>>> +static void dsi_mgr_bridge_pre_enable(struct drm_bridge *bridge)
>>> +{
>>> +     int id = dsi_mgr_bridge_get_id(bridge);
>>> +     struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
>>> +     struct msm_dsi *msm_dsi1 = dsi_mgr_get_dsi(DSI_1);
>>> +     struct mipi_dsi_host *host = msm_dsi->host;
>>> +     struct drm_panel *panel = msm_dsi->panel;
>>> +     bool is_bonded_dsi = IS_BONDED_DSI();
>>> +     int ret;
>>> +
>>> +     DBG("id=%d", id);
>>> +     if (!msm_dsi_device_connected(msm_dsi))
>>> +             return;
>>> +
>>> +     /* Do nothing with the host if it is slave-DSI in case of bonded DSI */
>>> +     if (is_bonded_dsi && !IS_MASTER_DSI_LINK(id))
>>> +             return;
>>> +
>>>        /* Always call panel functions once, because even for dual panels,
>>>         * there is only one drm_panel instance.
>>>         */
>>> @@ -417,17 +444,7 @@ static void dsi_mgr_bridge_pre_enable(struct drm_bridge *bridge)
>>>        if (panel)
>>>                drm_panel_unprepare(panel);
>>>    panel_prep_fail:
>>> -     msm_dsi_host_disable_irq(host);
>>> -     if (is_bonded_dsi && msm_dsi1)
>>> -             msm_dsi_host_disable_irq(msm_dsi1->host);
>>>
>>> -     if (is_bonded_dsi && msm_dsi1)
>>> -             msm_dsi_host_power_off(msm_dsi1->host);
>>> -host1_on_fail:
>>> -     msm_dsi_host_power_off(host);
>>> -host_on_fail:
>>> -     dsi_mgr_phy_disable(id);
>>> -phy_en_fail:
>>>        return;
>>>    }
>>>
>>> @@ -573,6 +590,8 @@ static void dsi_mgr_bridge_mode_set(struct drm_bridge *bridge,
>>>        msm_dsi_host_set_display_mode(host, adjusted_mode);
>>>        if (is_bonded_dsi && other_dsi)
>>>                msm_dsi_host_set_display_mode(other_dsi->host, adjusted_mode);
>>> +
>>> +     dsi_mgr_bridge_power_on(bridge);
>>>    }
>>>
>>>    static const struct drm_connector_funcs dsi_mgr_connector_funcs = {
> 
> 
> 


-- 
With best wishes
Dmitry
