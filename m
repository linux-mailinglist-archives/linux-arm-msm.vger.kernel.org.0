Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2FEE067EC89
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jan 2023 18:34:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232433AbjA0ReN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Jan 2023 12:34:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234971AbjA0ReM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Jan 2023 12:34:12 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAB3E7BBE5
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jan 2023 09:34:09 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id y25so9227188lfa.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jan 2023 09:34:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0OhyX9oLZW5/zYk0jNLeuEhyuYMFe887hKU9REklXWk=;
        b=xQoDRotJWTfm0FYDlP09QYgGT0DlEthrjbwvbLnqQosgbMa4Mc0hvjdFpRXyVlxfgX
         NF8a/HOPPKWvFCYYSrO35oWpGIL44haX3vGkwe+8ljkTb28MIqEPSLa1CQwqd38McY7b
         fxCn181ng0qmtiNO++Tkyuqguo/7VYbU+grW0206Fk5zWarVLjz+I6s06kIc4oLfUP6O
         C6eQq9jChx4i3xQ7fnmAM1uBDgJ9iV34z+bjw0gCWdFpDK3uEGPHxjEZSzwk4pctAdJ3
         MIzZx1GGGW5j/Yr75//RwOj5RR825AU2vSMvXu5xTyOzVM56Zijq0VEoC75eEpKUAGmB
         mr6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0OhyX9oLZW5/zYk0jNLeuEhyuYMFe887hKU9REklXWk=;
        b=tau96RN9RcSkMolnRW1hCa5ceqB3Tvnc4AiymRMoZ+ZzgMiTQuMNZ3K0092+XFk0VD
         w9V4zv2tLvOE6WBT/RqcXBNSMV6NNbBexMsTQA+Qoezv2LhkCkZpM+G/v3qrRXEexS9X
         nojPWbWysb1jvwAufc0TewXFssuDIYKJewXaXhdB+arAmFzYWx+ilH2G18nTKeawVkMj
         a/mAVAFEAm8DH+KcUNkSIfB18HS2/adKEmQvsYT3vzHz8xKRH4b2Zu8pQA8iDh6CkiNS
         bPApDpRZC2RCAVcQ7RRxMxfkqly2JvbdHQFEz7/lBEiMUA1JRIkGOAk9lFAPyVlJS1Dy
         j7tQ==
X-Gm-Message-State: AFqh2ko46n9yVmLTwLvDMZXNygWX8YysITFkXSoLn3drSjWSK8LrpvhY
        XwSdK7rCtg5+l8ByhkSlzhHDXw==
X-Google-Smtp-Source: AMrXdXsGzvZuPLTgjrbSx+zXKFB8cmU1+jIBTyqMu1EkczTQ9+l24aEfT0yZ5h+ZVr+qQbaScMQXug==
X-Received: by 2002:a05:6512:128a:b0:4d5:acb3:fd30 with SMTP id u10-20020a056512128a00b004d5acb3fd30mr8017681lfs.21.1674840848050;
        Fri, 27 Jan 2023 09:34:08 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 13-20020ac2482d000000b004cafe65883dsm315781lft.122.2023.01.27.09.34.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jan 2023 09:34:07 -0800 (PST)
Message-ID: <aebba18e-8da7-fba0-a012-5e69bca424f4@linaro.org>
Date:   Fri, 27 Jan 2023 19:34:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [RFT PATCH 2/2] drm/msm/dsi: Stop unconditionally powering up DSI
 hosts at modeset
Content-Language: en-GB
To:     Doug Anderson <dianders@chromium.org>
Cc:     dri-devel@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Robert Foss <robert.foss@linaro.org>,
        Sean Paul <sean@poorly.run>, Jonas Karlman <jonas@kwiboo.se>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        David Airlie <airlied@gmail.com>,
        linux-arm-msm@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Vinod Koul <vkoul@kernel.org>, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, ye xingchen <ye.xingchen@zte.com.cn>
References: <20230113155547.RFT.1.I723a3761d57ea60c5dd754c144aed6c3b2ea6f5a@changeid>
 <20230113155547.RFT.2.I4cfeab9d0e07e98ead23dd0736ab4461e6c69002@changeid>
 <CAA8EJprBPNfjhx1Op4rnHTx9DXDGkgc0q3cZzBHtahi6EaKS_w@mail.gmail.com>
 <CAD=FV=Xt2XbAX6DxCFUz0F1O0NV2dbc7cy5ZNQ5-nFwMu6j4YA@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CAD=FV=Xt2XbAX6DxCFUz0F1O0NV2dbc7cy5ZNQ5-nFwMu6j4YA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 27/01/2023 18:32, Doug Anderson wrote:
> Hi,
> 
> On Thu, Jan 26, 2023 at 9:49 PM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
>>
>> Hi,
>>
>> On Sat, 14 Jan 2023 at 01:56, Douglas Anderson <dianders@chromium.org> wrote:
>>>
>>> In commit 7d8e9a90509f ("drm/msm/dsi: move DSI host powerup to modeset
>>> time"), we moved powering up DSI hosts to modeset time. This wasn't
>>> because it was an elegant design, but there were no better options.
>>>
>>> That commit actually ended up breaking ps8640, and thus was born
>>> commit ec7981e6c614 ("drm/msm/dsi: don't powerup at modeset time for
>>> parade-ps8640") as a temporary hack to un-break ps8640 by moving it to
>>> the old way of doing things. It turns out that ps8640 _really_ doesn't
>>> like its pre_enable() function to be called after
>>> dsi_mgr_bridge_power_on(). Specifically (from experimentation, not
>>> because I have any inside knowledge), it looks like the assertion of
>>> "RST#" in the ps8640 runtime resume handler seems like it's not
>>> allowed to happen after dsi_mgr_bridge_power_on()
>>>
>>> Recently, Dave Stevenson's series landed allowing bridges some control
>>> over pre_enable ordering. The meaty commit for our purposes is commit
>>> 4fb912e5e190 ("drm/bridge: Introduce pre_enable_prev_first to alter
>>> bridge init order"). As documented by that series, if a bridge doesn't
>>> set "pre_enable_prev_first" then we should use the old ordering.
>>>
>>> Now that we have the commit ("drm/bridge: tc358762: Set
>>> pre_enable_prev_first") we can go back to the old ordering, which also
>>> allows us to remove the ps8640 special case.
>>>
>>> One last note is that even without reverting commit 7d8e9a90509f
>>> ("drm/msm/dsi: move DSI host powerup to modeset time"), if you _just_
>>> revert the ps8640 special case and try it out then it doesn't seem to
>>> fail anymore. I spent time bisecting / debugging this and it turns out
>>> to be mostly luck, so we still want this patch to make sure it's
>>> solid. Specifically the reason it sorta works these days is because
>>> we implemented wait_hpd_asserted() in ps8640 now, plus the magic of
>>> "pm_runtime" autosuspend. The fact that we have wait_hpd_asserted()
>>> implemented means that we actually power the bridge chip up just a wee
>>> bit earlier and then the bridge happens to stay on because of
>>> autosuspend and thus ends up powered before dsi_mgr_bridge_power_on().
>>
>> I had a small comment on your patch, but then I was distracted and
>> forgot to send it. See below.
>>
>>>
>>> Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
>>> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>> Signed-off-by: Douglas Anderson <dianders@chromium.org>
>>> ---
>>>
>>>   drivers/gpu/drm/msm/dsi/dsi_manager.c | 68 +++++----------------------
>>>   1 file changed, 11 insertions(+), 57 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
>>> index 3a1417397283..5e6b8d423b96 100644
>>> --- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
>>> +++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
>>> @@ -34,32 +34,6 @@ static struct msm_dsi_manager msm_dsim_glb;
>>>   #define IS_SYNC_NEEDED()       (msm_dsim_glb.is_sync_needed)
>>>   #define IS_MASTER_DSI_LINK(id) (msm_dsim_glb.master_dsi_link_id == id)
>>>
>>> -#ifdef CONFIG_OF
>>> -static bool dsi_mgr_power_on_early(struct drm_bridge *bridge)
>>> -{
>>> -       struct drm_bridge *next_bridge = drm_bridge_get_next_bridge(bridge);
>>> -
>>> -       /*
>>> -        * If the next bridge in the chain is the Parade ps8640 bridge chip
>>> -        * then don't power on early since it seems to violate the expectations
>>> -        * of the firmware that the bridge chip is running.
>>> -        *
>>> -        * NOTE: this is expected to be a temporary special case. It's expected
>>> -        * that we'll eventually have a framework that allows the next level
>>> -        * bridge to indicate whether it needs us to power on before it or
>>> -        * after it. When that framework is in place then we'll use it and
>>> -        * remove this special case.
>>> -        */
>>> -       return !(next_bridge && next_bridge->of_node &&
>>> -                of_device_is_compatible(next_bridge->of_node, "parade,ps8640"));
>>> -}
>>> -#else
>>> -static inline bool dsi_mgr_power_on_early(struct drm_bridge *bridge)
>>> -{
>>> -       return true;
>>> -}
>>> -#endif
>>> -
>>>   static inline struct msm_dsi *dsi_mgr_get_dsi(int id)
>>>   {
>>>          return msm_dsim_glb.dsi[id];
>>> @@ -254,7 +228,7 @@ static void msm_dsi_manager_set_split_display(u8 id)
>>>          }
>>>   }
>>>
>>> -static void dsi_mgr_bridge_power_on(struct drm_bridge *bridge)
>>> +static void dsi_mgr_bridge_pre_enable(struct drm_bridge *bridge)
>>
>> Can you please keep the dsi_mgr_bridge_power_on() as is and just
>> remove the now-legacy dsi_mgr_power_on_early().
> 
> By this, I assume you mean keep the function separate but still remove
> the call to it from "modeset" and unconditionally call it from
> dsi_mgr_bridge_pre_enable(), right?

Yes, of course.

> 
> 
>>>   {
>>>          int id = dsi_mgr_bridge_get_id(bridge);
>>>          struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
>>> @@ -300,36 +274,10 @@ static void dsi_mgr_bridge_power_on(struct drm_bridge *bridge)
>>>          if (is_bonded_dsi && msm_dsi1)
>>>                  msm_dsi_host_enable_irq(msm_dsi1->host);
>>>
>>> -       return;
>>> -
>>> -host1_on_fail:
>>> -       msm_dsi_host_power_off(host);
>>> -host_on_fail:
>>> -       dsi_mgr_phy_disable(id);
>>> -phy_en_fail:
>>> -       return;
>>> -}
>>> -
>>> -static void dsi_mgr_bridge_pre_enable(struct drm_bridge *bridge)
>>> -{
>>> -       int id = dsi_mgr_bridge_get_id(bridge);
>>> -       struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
>>> -       struct msm_dsi *msm_dsi1 = dsi_mgr_get_dsi(DSI_1);
>>> -       struct mipi_dsi_host *host = msm_dsi->host;
>>> -       bool is_bonded_dsi = IS_BONDED_DSI();
>>> -       int ret;
>>> -
>>> -       DBG("id=%d", id);
>>> -       if (!msm_dsi_device_connected(msm_dsi))
>>> -               return;
>>> -
>>>          /* Do nothing with the host if it is slave-DSI in case of bonded DSI */
>>>          if (is_bonded_dsi && !IS_MASTER_DSI_LINK(id))
>>>                  return;
>>>
>>> -       if (!dsi_mgr_power_on_early(bridge))
>>> -               dsi_mgr_bridge_power_on(bridge);
>>> -
>>>          ret = msm_dsi_host_enable(host);
>>>          if (ret) {
>>>                  pr_err("%s: enable host %d failed, %d\n", __func__, id, ret);
>>> @@ -349,7 +297,16 @@ static void dsi_mgr_bridge_pre_enable(struct drm_bridge *bridge)
>>>   host1_en_fail:
>>>          msm_dsi_host_disable(host);
>>>   host_en_fail:
>>> -
>>> +       msm_dsi_host_disable_irq(host);
>>> +       if (is_bonded_dsi && msm_dsi1) {
>>> +               msm_dsi_host_disable_irq(msm_dsi1->host);
>>> +               msm_dsi_host_power_off(msm_dsi1->host);
>>> +       }
>>> +host1_on_fail:
>>> +       msm_dsi_host_power_off(host);
>>> +host_on_fail:
>>> +       dsi_mgr_phy_disable(id);
>>> +phy_en_fail:
>>>          return;
>>>   }
>>>
>>> @@ -438,9 +395,6 @@ static void dsi_mgr_bridge_mode_set(struct drm_bridge *bridge,
>>>          msm_dsi_host_set_display_mode(host, adjusted_mode);
>>>          if (is_bonded_dsi && other_dsi)
>>>                  msm_dsi_host_set_display_mode(other_dsi->host, adjusted_mode);
>>> -
>>> -       if (dsi_mgr_power_on_early(bridge))
>>> -               dsi_mgr_bridge_power_on(bridge);
>>>   }
>>>
>>>   static enum drm_mode_status dsi_mgr_bridge_mode_valid(struct drm_bridge *bridge,
>>> --
>>> 2.39.0.314.g84b9a713c41-goog
>>>
>>
>>
>> --
>> With best wishes
>> Dmitry

-- 
With best wishes
Dmitry

