Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 067375240F7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 May 2022 01:24:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349324AbiEKXYM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 May 2022 19:24:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349491AbiEKXYF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 May 2022 19:24:05 -0400
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 788215640C;
        Wed, 11 May 2022 16:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1652311317; x=1683847317;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=wc57Na2pTCiNNEmqE67S/Gi8zz7NqysL4NMydfAAhNo=;
  b=iv9EV504fRKEZTyCz5Vp5MLP476UsZmjD1ByD/wI1DB1/UpFvy1PfymI
   DlJPHWAgRWWtNycG5Y6AVo7764nmqPX562k1gwcGTbw/i9G31GLVlhY76
   I37Kk9DT+I1MsqwzpaPs2Gx3S1MAiMdTtzFkpid/Ihpkggo+SBjEFwtT2
   s=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 11 May 2022 16:21:57 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2022 16:21:56 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 11 May 2022 16:21:55 -0700
Received: from [10.110.21.19] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 11 May
 2022 16:21:54 -0700
Message-ID: <89ac42c5-76a3-dfb4-16cf-18a2efbf8c6e@quicinc.com>
Date:   Wed, 11 May 2022 16:21:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v4] drm/msm/dp: Always clear mask bits to disable
 interrupts at dp_ctrl_reset_irq_ctrl()
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        <robdclark@gmail.com>, <sean@poorly.run>, <swboyd@chromium.org>,
        <dianders@chromium.org>, <vkoul@kernel.org>, <daniel@ffwll.ch>,
        <airlied@linux.ie>, <agross@kernel.org>,
        <bjorn.andersson@linaro.org>
CC:     <quic_abhinavk@quicinc.com>, <quic_aravindh@quicinc.com>,
        <quic_sbillaka@quicinc.com>, <freedreno@lists.freedesktop.org>,
        <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <1652305225-1048-1-git-send-email-quic_khsieh@quicinc.com>
 <e12933c9-0439-410b-e691-0fa444c71011@linaro.org>
From:   Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <e12933c9-0439-410b-e691-0fa444c71011@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 5/11/2022 2:47 PM, Dmitry Baryshkov wrote:
> On 12/05/2022 00:40, Kuogee Hsieh wrote:
>> dp_catalog_ctrl_reset() will software reset DP controller. But it will
>> not reset programmable registers to default value. DP driver still have
>> to clear mask bits to interrupt status registers to disable interrupts
>> after software reset of controller. This patch removes the enable flag
>> condition checking to always clear mask bits of interrupt status
>> registers to disable interrupts if enable flag is false.
>>
>> This patch also will fix the potential problem happen at system 
>> suspend where
>> dp_ctrl_reset_irq_ctrl() was called to try to disable HPD related 
>> irqs but
>> the irq is still unmasked unexpectedly
>
> Why is it unmasked? Especially unexpectedly.

due to dp_catalog_ctrl_reset() does not clear hpd interrupt mask bits.

This is the problem this patch try to fix it.

I will revise commit text to explain more.

>
>> and can come in while system are
>> suspending. This leads to bus hangs if the irq is handled after we 
>> power down
>> the DP hardware because we run the irq handler and access a device 
>> register
>> assuming that no irq could ever come in if we powered down the 
>> device. We
>> don't know when the irq will be handled though, so it's possible the 
>> irq is
>> pending from before we disable the irq in the hardware.
>
> Please split into two patches.

this is just the same problem mention above.

>
>>
>> Changes in v2:
>> -- add more details commit text
>>
>> Changes in v3:
>> -- add synchrons_irq()
>> -- add atomic_t suspended
>>
>> Changes in v4:
>> -- correct Fixes's commit ID
>>
>> Fixes: 989ebe7bc446 ("drm/msm/dp: do not initialize phy until plugin 
>> interrupt received")
>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_ctrl.c    |  9 +++++++--
>>   drivers/gpu/drm/msm/dp/dp_display.c | 18 ++++++++++++++++++
>>   2 files changed, 25 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c 
>> b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> index af7a80c..f3e333e 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> @@ -1389,8 +1389,13 @@ void dp_ctrl_reset_irq_ctrl(struct dp_ctrl 
>> *dp_ctrl, bool enable)
>>         dp_catalog_ctrl_reset(ctrl->catalog);
>>   -    if (enable)
>> -        dp_catalog_ctrl_enable_irq(ctrl->catalog, enable);
>> +    /*
>> +     * all dp controller programmable registers will not
>> +     * be reset to default value after DP_SW_RESET
>> +     * therefore interrupt mask bits have to be updated
>> +     * to enable/disable interrupts
>> +     */
>> +    dp_catalog_ctrl_enable_irq(ctrl->catalog, enable);
>>   }
>>     void dp_ctrl_phy_init(struct dp_ctrl *dp_ctrl)
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c 
>> b/drivers/gpu/drm/msm/dp/dp_display.c
>> index c388323..c34dbfc 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -98,6 +98,8 @@ struct dp_display_private {
>>       struct dp_ctrl    *ctrl;
>>       struct dp_debug   *debug;
>>   +    atomic_t suspended;
>
> Usage of atomic_t signifies that something is wrong here. Bool should 
> be enough here.

suspended flag are shared by both event_thread and display_irq_handler, 
i think it need either atomic

or protected by spinlock.

>
>> +
>>       struct dp_usbpd_cb usbpd_cb;
>>       struct dp_display_mode dp_mode;
>>       struct msm_dp dp_display;
>> @@ -187,6 +189,11 @@ static int dp_add_event(struct 
>> dp_display_private *dp_priv, u32 event,
>>       int pndx;
>>         spin_lock_irqsave(&dp_priv->event_lock, flag);
>> +    if (atomic_read(&dp_priv->suspended)) {
>> +        spin_unlock_irqrestore(&dp_priv->event_lock, flag);
>> +        return -EPERM;
>
> Why EPERM?
>
>> +    }
>> +
>>       pndx = dp_priv->event_pndx + 1;
>>       pndx %= DP_EVENT_Q_MAX;
>>       if (pndx == dp_priv->event_gndx) {
>> @@ -454,6 +461,13 @@ static void dp_display_host_deinit(struct 
>> dp_display_private *dp)
>>           dp->dp_display.connector_type, dp->core_initialized,
>>           dp->phy_initialized);
>>   +    if (!dp->core_initialized) {
>
> Can this happen?

not likely,

but It should not in this patch. will double check.

>
>> +        DRM_DEBUG_DP("DP core not initialized\n");
>> +        return;
>> +    }
>> +
>> +    synchronize_irq(dp->irq);
>
> Why? If you need to run with IRQs disabled, you can use 
> suspend_late/early_resume. But generally it should be enough to check 
> for the !suspended in the IRQ.
>
>> +
>>       dp_ctrl_reset_irq_ctrl(dp->ctrl, false);
>>       dp_aux_deinit(dp->aux);
>>       dp_power_deinit(dp->power);
>> @@ -1362,6 +1376,8 @@ static int dp_pm_resume(struct device *dev)
>>           dp->dp_display.connector_type, dp->core_initialized,
>>           dp->phy_initialized, dp_display->power_on);
>>   +    atomic_set(&dp->suspended, 0);
>> +
>>       /* start from disconnected state */
>>       dp->hpd_state = ST_DISCONNECTED;
>>   @@ -1431,6 +1447,8 @@ static int dp_pm_suspend(struct device *dev)
>>           dp->dp_display.connector_type, dp->core_initialized,
>>           dp->phy_initialized, dp_display->power_on);
>>   +    atomic_inc(&dp->suspended);
>> +
>>       /* mainlink enabled */
>>       if (dp_power_clk_status(dp->power, DP_CTRL_PM))
>>           dp_ctrl_off_link_stream(dp->ctrl);
>
>
