Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C071348DD2C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jan 2022 18:51:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233140AbiAMRvq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Jan 2022 12:51:46 -0500
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:44029 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229635AbiAMRvp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Jan 2022 12:51:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1642096305; x=1673632305;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=jwq8d5kK+K/ab3JvF5IReXEIv5LYfB8y1+rqInWBWOA=;
  b=T6d+UMOt9Ns3vG+iCjvJ4AeQd367sADp89G6hW7SPOC0OiBMfaaV92dQ
   vglbUcqEwa0IJkXUdfsjwWAh0pbRIjMz2ATP7llTTzLG9KRfE/SgL1V6Q
   JBIuuHReeU4Lwkm9vJ+tp7Ungsr05q18kwpH2Av/E5RZjuPt6CyERyjIy
   k=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 13 Jan 2022 09:51:45 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2022 09:51:45 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Thu, 13 Jan 2022 09:51:44 -0800
Received: from [10.110.125.36] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Thu, 13 Jan
 2022 09:51:43 -0800
Message-ID: <338ae657-e8ed-e620-0aa7-4ad05df18ad1@quicinc.com>
Date:   Thu, 13 Jan 2022 09:51:42 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v11 1/4] drm/msm/dp: do not initialize phy until plugin
 interrupt received
Content-Language: en-US
To:     Stephen Boyd <swboyd@chromium.org>, <agross@kernel.org>,
        <airlied@linux.ie>, <bjorn.andersson@linaro.org>,
        <daniel@ffwll.ch>, <dmitry.baryshkov@linaro.org>,
        <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
        <sean@poorly.run>, <vkoul@kernel.org>
CC:     <quic_abhinavk@quicinc.com>, <aravindh@codeaurora.org>,
        <quic_sbillaka@quicinc.com>, <freedreno@lists.freedesktop.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <1641926606-1012-1-git-send-email-quic_khsieh@quicinc.com>
 <1641926606-1012-2-git-send-email-quic_khsieh@quicinc.com>
 <CAE-0n53hrPYR3ThwxM_+fzyRSB+6W1drFymW5n_RKmg_gf8z-w@mail.gmail.com>
 <84ee17f9-2597-86b6-1517-2358d443f65b@quicinc.com>
 <CAE-0n5134H0puMicozjdfTY+zXVUZyrebjv7Hto3EWcQAELO4A@mail.gmail.com>
From:   Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <CAE-0n5134H0puMicozjdfTY+zXVUZyrebjv7Hto3EWcQAELO4A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 1/12/2022 8:13 PM, Stephen Boyd wrote:
> Quoting Kuogee Hsieh (2022-01-12 14:17:54)
>> On 1/12/2022 12:00 PM, Stephen Boyd wrote:
>>> Quoting Kuogee Hsieh (2022-01-11 10:43:23)
>>>> Current DP drivers have regulators, clocks, irq and phy are grouped
>>>> together within a function and executed not in a symmetric manner.
>>>> This increase difficulty of code maintenance and limited code scalability.
>>>> This patch divides the driver life cycle of operation into four states,
>>>> resume (including booting up), dongle plugin, dongle unplugged and suspend.
>>>> Regulators, core clocks and irq are grouped together and enabled at resume
>>>> (or booting up) so that the DP controller is armed and ready to receive HPD
>>>> plugin interrupts. HPD plugin interrupt is generated when a dongle plugs
>>>> into DUT (device under test). Once HPD plugin interrupt is received, DP
>>>> controller will initialize phy so that dpcd read/write will function and
>>>> following link training can be proceeded successfully. DP phy will be
>>>> disabled after main link is teared down at end of unplugged HPD interrupt
>>>> handle triggered by dongle unplugged out of DUT. Finally regulators, code
>>>> clocks and irq are disabled at corresponding suspension.
>> 0) Please note that  dongles are behavior differently.
>>
>> 1) Apple dongle will generate plug-in interrupt only if no hdmi monitor
>> atatched to dongle. it will generate irq-hpd interrupt once hdmi monitor
>> connect to dongle later.
>>
>> 2) Apple dongle will generate plugged-in interrupt followed by irq-hpd
>> interrupt if dongle has hdmi monitor attached when connects to DUT.
>>
>> 3) other dongle will not generate plug-in interrupt unless dongle has
>> hdmi monitor attached when connects to DUT. It only generate plug-in
>> interrupt only and no irq-hpd interrupt  generated on this case.
> Ok. The test scenarios can be reworded in terms of plugin irq and
> irq-hpd if that makes it easier.
>
>> 4) Note: phy_initialized only associated with plugged-in interrupt
>>
>> 5) irq-hpd interrupt must happen after plugged-in interrupt and before
>> unplugged interrupt
> More precisely it's that plugged-in interrupt must be handled before
> irq-hpd but plugged-in and irq-hpd can both be pending at the device
> concurrently unless they're masked and unmasked in some particular
> order. I thought the driver ensures that only irq-hpd is unmasked once
> the plugged in irq is handled. Can you confirm? Similarly, unplugged irq
> is unmasked after plugged in irq is handled, but irq-hpd and unplugged
> can both be pending if the irq handler is delayed?

we went through this before,

1) plugin_handler ==> do plug staffs + unmask irq_hpd at end of handler

2) unplug_handler ==> mask both plugin and irq_hpd  + do unplug staffs + 
unmask plugin irq at end of handler

3) priority order of handling irq when multiple irqs pending ==> plugin 
-> irq_hpd -> unplug

>
>> I will fill up below question with Apple dongle case with the order of
>> event happen timing.
>>
>>> I'll write out the various scenarios
>>>
>>> #1
>>>        dongle plugged in with HDMI cable attached
>>>        driver probe
>> 1) driver probe ==> core_initialized = false;    phy_initialized = false;
>> 2) dp_display_host_init() ==> core_initialized = true;
>> 3) generate plugged-in interrupt triggers handler
>> 4) dp_display_phy_init() ==> phy_initialized = true;
>>
>>>
>>> #2
>>>        dongle unplugged
>>>        driver probe
>> 1) driver probe ==> core_initialized = false;    phy_initialized = false;
>> 2) dp_display_host_init() ==> core_initialized = true;
>>
>>
>>> #3
>>>        dongle plugged in without HDMI cable attached
>>>        driver probe
>> 1) driver probe ==> core_initialized = false;    phy_initialized = false;
>> 2) dp_display_host_init() ==> core_initialized = true;
>> 3) generate plug-in interrupt triggers handler
>> 4) dp_display_phy_init() ==> phy_initialized = true;
>>
>> Note: same as case #1
>>> #4
>>>        driver probe
>>>        dongle plugged in without HDMI cable attached
>> 1) driver probe ==> core_initialized = false;    phy_initialized = false;
>> 2) dp_display_host_init() ==> core_initialized = true;
>> 3) dongle plugged in
>> 4) generate plug-in interrupt triggers handler
>> 5) dp_display_phy_init() ==> phy_initialized = true;
>>
>>>
>>> #5
>>>        driver probe
>>>        dongle plugged in with HDMI cable attached
>> 1) driver probe ==> core_initialized = false;    phy_initialized = false;
>> 2) dp_display_host_init() ==> core_initialized = true;
>> 3) dongle plugged in
>> 4) generate plug-in interrupt trigger handler
>> 5) dp_display_phy_init() ==> phy_initialized = true;
>>
>> Note: same as case #4
>>
>>> #6
>>>        driver probe
>>>        dongle plugged in
>>>        suspend
>>>        resume
>> 1) driver probe ==> core_initialized = false;    phy_initialized = false;
>> 2) dp_display_host_init() ==> core_initialized = true;
>> 3) dongle plug in
>> 4) generate plug-in interrupt triggers handler
>> 5) dp_display_phy_init() ==> phy_initialized = true;
>> 6) suspend
>> 7) dp_display_host_deinit() ==> core_initialized = false;
>> 8) dp_display_host_phy_exit() ==> phy_initialize = false;
>> 9) resume
>> 10) dp_display_host_init() ==> core_initialized = true;
>> 11) generate plug-in interrupt
>> 12) dp_display_phy_init() ==> phy_initialize = true;
>>
>>> #7
>>>        driver probe
>>>        dongle plugged in
>>>        suspend
>>>        dongle unplugged
>>>        resume
>> 1) driver probe ==> core_initialized = false;    phy_initialized = false;
>> 2) dp_display_host_init() ==> core_initialized = true;
>> 3) dongle plugged in
>> 4) generate plug-in interrupt triggers handler
>> 5) dp_display_phy_init() ==> phy_initialized = true;
>> 6) suspend
>> 7) dp_display_host_deinit() ==> core_initialized = false;
>> 8) dp_display_host_phy_exit() ==> phy_initialize = false;
> Why is the order of operations swapped? During probe core_initialized
> is done first and then phy_initialized but then on suspend
> core_initialized is done first again before phy_initialized. That's
> asymmetric.
ok, will fix this
>
>> 9) dongle unplugged
>> 10) resume
>> 11) dp_display_host_init() ==> core_initialized = true;
>>
>> #8
>>          driver probe
>>          dongle plugged in without HDMI cable attached
>>          suspend
>>          resume
>>
>> 1) driver probe ==> core_initialized = false;    phy_initialized = false;
>> 2) dp_display_host_init() ==> core_initialized = true;
>> 3) dongle plug in
>> 4) generate plug-in interrupt triggers handler
>> 5) dp_display_phy_init() ==> phy_initialized = true;
>> 6) suspend
>> 7) dp_display_host_deinit() ==> core_initialized = false;
>> 8) dp_display_host_phy_exit() ==> phy_initialize = false;
>> 9) resume
>> 10) dp_display_host_init() ==> core_initialized = true;
>> 11) generate plug-in interrupt
>> 12) dp_display_phy_init() ==> phy_initialize = true;
>>
>>
>> NOTE: same case #6
>>
>> #9
>>          driver probe
>>          dongle plugged in without HDMI cable attached
>>          suspend
>>          HDMI cable attached during suspend
>>          resume
>>
>> 1) driver probe ==> core_initialized = false;    phy_initialized = false;
>> 2) dp_display_host_init() ==> core_initialized = true;
>> 3) dongle plugged in
>> 4) generate plug-in interrupt triggers handler
>> 5) dp_display_phy_init() ==> phy_initialized = true;
>> 6) suspend
>> 7) dp_display_host_deinit() ==> core_initialized = false;
>> 8) dp_display_host_phy_exit() ==> phy_initialize = false;
>> 9) HDMI cable attached
>> 10) resume
>> 11) dp_display_host_init() ==> core_initialized = true;
>> 12) generate plug-in interrupt
>> 13) dp_display_phy_init() ==> phy_initialize = true;
>>
>>
>> What's the state of the phy and core initialized variable at the end of
>> each of these scenarios? Please fill out the truth table.
>>
>>                    +-----------------+------------------------
>>                     |    false        |       true            |
>>                    +-----------------+------------------------
>>    phy_initialized  |                 |                       |
>>                    +-----------------+------------------------
>>    core_initialized |                 | #1,                   |
>>                    +-----------------+------------------------
>>
>> I guess we also need eDP scenarios, but that's probably simpler
>>
>> #10
>>          eDP panel connected
>>          driver probe
>>
>> 1) driver probe ==> core_initialized = false;    phy_initialized = false;
>> 2) dp_display_host_init() ==> core_initialized = true;
>> 3) generate plug-in interrupt triggers handler
> I think this is more like "dp_display_config_hpd() is called by hpd
> kthread"?

yes, correct as below (eDP will call phy_init immediately

1) driver probe ==> core_initialized = false;    phy_initialized = false;
2) dp_display_config_hpd()
3) dp_display_host_init() ==> core_initialized = true;
4) dp_display_host_phy_init() ==> phy_initialize = true
5) generate plug-in interrupt triggers handler

>
>> 4) dp_display_phy_init() ==> phy_initialized = true;
>>
>>
>>
>> #11
>>          eDP panel disconnected
>>          driver probe
>>
>> NOTE: eDP panel can not be disconnected
> The panel can certainly be disconnected in the sense that the ribbon
> cable to the panel is busted or not working properly. That's what this
> scenario is for.

1) driver probe ==> core_initialized = false;    phy_initialized = false;
2) dp_display_config_hpd()
3) dp_display_host_init() ==> core_initialized = true;
4) dp_display_host_phy_init() ==> phy_initialize = true

1) driver probe ==> core_initialized = false; phy_initialized = false;
>> #12
>>          eDP panel disconnected
>>          driver probe
>>          suspend
>>          resume
>>
>> NOTE: assume edp panel connected
>> 1) driver probe ==> core_initialized = false;    phy_initialized = false;
>> 2) dp_display_host_init() ==> core_initialized = true;
>> 3) generate plug-in interrupt triggers handler
>> 4) dp_display_phy_init() ==> phy_initialized = true;
>> 5) suspend
>> 6) dp_display_host_deinit() ==> core_initialized = false;
>> 7) dp_display_host_phy_exit() ==> phy_initialize = false;
>> 8) resume
>> 9) dp_display_host_init() ==> core_initialized = true;
>> 10) generate plug-in interrupt
>> 11) dp_display_phy_init() ==> phy_initialize = true;

1) driver probe ==> core_initialized = false;    phy_initialized = false;
2) dp_display_config_hpd()
3) dp_display_host_init() ==> core_initialized = true;
4) dp_display_host_phy_init() ==> phy_initialize = true
5) generate plug-in interrupt triggers handler
6) dp_display_phy_init() ==> phy_initialized = true;
7) suspend
8) dp_display_host_deinit() ==> core_initialized = false;
9) dp_display_host_phy_exit() ==> phy_initialize = false;
10) resume
11) dp_display_host_init() ==> core_initialized = true;
11) dp_display_phy_init() ==> phy_initialize = true;
12) generate plug-in interrupt triggers handler

> Thanks. It really helps to see the various scenarios.
>
>>>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>>>> index 7cc4d21..f6bb4bc 100644
>>>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>>>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>>>> @@ -83,6 +83,7 @@ struct dp_display_private {
>>>>
>>>>           /* state variables */
>>>>           bool core_initialized;
>>>> +       bool phy_initialized;
>>>>           bool hpd_irq_on;
>>>>           bool audio_supported;
>>>>
>>>> @@ -372,21 +373,46 @@ static int dp_display_process_hpd_high(struct dp_display_private *dp)
>>>>           return rc;
>>>>    }
>>>>
>>>> -static void dp_display_host_init(struct dp_display_private *dp, int reset)
>>>> +static void dp_display_host_phy_init(struct dp_display_private *dp)
>>>>    {
>>>> -       bool flip = false;
>>>> +       DRM_DEBUG_DP("core_init=%d phy_init=%d\n",
>>>> +                       dp->core_initialized, dp->phy_initialized);
>>>>
>>>> +       if (!dp->phy_initialized) {
>>>> +               dp_ctrl_phy_init(dp->ctrl);
>>>> +               dp->phy_initialized = true;
>>>> +       }
>>>> +}
>>>> +
>>>> +static void dp_display_host_phy_exit(struct dp_display_private *dp)
>>>> +{
>>>> +       DRM_DEBUG_DP("core_init=%d phy_init=%d\n",
>>>> +                       dp->core_initialized, dp->phy_initialized);
>>>> +
>>>> +       if (dp->phy_initialized) {
>>>> +               dp_ctrl_phy_exit(dp->ctrl);
>>>> +               dp->phy_initialized = false;
>>>> +       }
>>>> +}
>>>> +
>>>> +static void dp_display_host_init(struct dp_display_private *dp)
>>>> +{
>>>>           DRM_DEBUG_DP("core_initialized=%d\n", dp->core_initialized);
>>>>           if (dp->core_initialized) {
>>>>                   DRM_DEBUG_DP("DP core already initialized\n");
>>>>                   return;
>>>>           }
>>>>
>>>> -       if (dp->usbpd->orientation == ORIENTATION_CC2)
>>>> -               flip = true;
>>>> +       dp_power_init(dp->power, false);
>>>> +       dp_ctrl_reset_irq_ctrl(dp->ctrl, true);
>>>> +
>>>> +       /*
>>>> +        * eDP is the embedded primary display and has its own phy
>>>> +        * initialize phy immediately
>>> Question still stands why we can't wait for hpd high from the eDP panel.
>>> Also, I think "has its own phy" means that it's not part of a combo
>>> USB+DP phy? Can you please clarify?
>>>
>>>> +        */
>>>> +       if (dp->dp_display.connector_type == DRM_MODE_CONNECTOR_eDP)
>>>> +               dp_display_host_phy_init(dp);
>>>>
>>>> -       dp_power_init(dp->power, flip);
>>>> -       dp_ctrl_host_init(dp->ctrl, flip, reset);
>>>>           dp_aux_init(dp->aux);
>>>>           dp->core_initialized = true;
>>>>    }
>>>> @@ -1306,20 +1330,23 @@ static int dp_pm_resume(struct device *dev)
>>>>           dp->hpd_state = ST_DISCONNECTED;
>>>>
>>>>           /* turn on dp ctrl/phy */
>>>> -       dp_display_host_init(dp, true);
>>>> +       dp_display_host_init(dp);
>>>>
>>>>           dp_catalog_ctrl_hpd_config(dp->catalog);
>>>>
>>>> -       /*
>>>> -        * set sink to normal operation mode -- D0
>>>> -        * before dpcd read
>>>> -        */
>>>> -       dp_link_psm_config(dp->link, &dp->panel->link_info, false);
>>>>
>>>>           if (dp_catalog_link_is_connected(dp->catalog)) {
>>>> +               /*
>>>> +                * set sink to normal operation mode -- D0
>>>> +                * before dpcd read
>>>> +                */
>>>> +               dp_display_host_phy_init(dp);
>>>> +               dp_link_psm_config(dp->link, &dp->panel->link_info, false);
>>>>                   sink_count = drm_dp_read_sink_count(dp->aux);
>>>>                   if (sink_count < 0)
>>>>                           sink_count = 0;
>>>> +
>>>> +               dp_display_host_phy_exit(dp);
>>> Why is the phy exited on resume when the link is still connected? Is
>>> this supposed to be done only when the sink_count is 0? And how does
>>> this interact with eDP where the phy is initialized by the call to
>>> dp_display_host_init() earlier in this function.
>>>
>>>>           }
>>>>
>>>>           dp->link->sink_count = sink_count;
> Any response to the above two comments?
