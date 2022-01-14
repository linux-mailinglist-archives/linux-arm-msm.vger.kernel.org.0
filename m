Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7FB348F268
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jan 2022 23:28:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230423AbiANW2z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 Jan 2022 17:28:55 -0500
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:34147 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230310AbiANW2z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 Jan 2022 17:28:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1642199335; x=1673735335;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=SMYVXUFcqvm73ktl2Lmgp3uM9JleJ3uNnTtTQe48tYY=;
  b=Vsgqy6d9rwoEH0jqTJ4bNigZVbEaiRP6MQQlChWY7OapKZ45qi7kTPsW
   RkeJmr44prPiGoke8/dCFZ8SfagKHea5K8N0R+T4sf1Yv43r7Q8LsFpc9
   mpsZRN98ZmGZUqoteE0PGgNXAyMHpsjCWrrJTmLwzsTE6J/j9QVUxZQ8O
   8=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 14 Jan 2022 14:28:54 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2022 14:28:54 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Fri, 14 Jan 2022 14:28:53 -0800
Received: from [10.110.125.36] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Fri, 14 Jan
 2022 14:28:52 -0800
Message-ID: <f5a282ed-0b4a-9fb2-fc04-17842745feaa@quicinc.com>
Date:   Fri, 14 Jan 2022 14:28:52 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v15 1/4] drm/msm/dp: do not initialize phy until plugin
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
References: <1642194710-2512-1-git-send-email-quic_khsieh@quicinc.com>
 <1642194710-2512-2-git-send-email-quic_khsieh@quicinc.com>
 <CAE-0n52UYBajrqGFqppun5oK82V3ppjvQxANU27kL95gCZtURg@mail.gmail.com>
From:   Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <CAE-0n52UYBajrqGFqppun5oK82V3ppjvQxANU27kL95gCZtURg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 1/14/2022 1:41 PM, Stephen Boyd wrote:
> Quoting Kuogee Hsieh (2022-01-14 13:11:47)
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>> index 7cc4d21..7cd6222 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -696,12 +699,9 @@ static int dp_irq_hpd_handle(struct dp_display_private *dp, u32 data)
>>           * dp core (ahb/aux clks) must be initialized before
>>           * irq_hpd be handled
>>           */
>> -       if (dp->core_initialized) {
>> -               ret = dp_display_usbpd_attention_cb(&dp->pdev->dev);
>> -               if (ret == -ECONNRESET) { /* cable unplugged */
>> -                       dp->core_initialized = false;
>> -               }
>> -       }
>> +       if (dp->core_initialized)
> When is this condition false? The irq isn't unmasked until the core has
> been initialized. On the resume path I suppose the irq is enabled in
> dp_display_host_init() calling dp_ctrl_reset_irq_ctrl(), and then we
> could immediately get the interrupt but it will block on the event_mutex
> lock.

This is left over form Lazor.

I remember that there is an extreme case that several irq_hpd interrupts 
happen right after dongle plug in  (happen at resume too) and sometime 
cause system crash at dpcd read due to AHB clock is not enabled yet. It 
took some time to debug it.

 From looking into code, it does not look likely it will happen. But it 
did happen at real world.

So that I would like to keep this condition checking.


>> +               dp_display_usbpd_attention_cb(&dp->pdev->dev);
>> +
>>          DRM_DEBUG_DP("hpd_state=%d\n", state);
>>
>>          mutex_unlock(&dp->event_mutex);
>> @@ -1363,14 +1373,16 @@ static int dp_pm_suspend(struct device *dev)
>>                  if (dp_power_clk_status(dp->power, DP_CTRL_PM))
>>                          dp_ctrl_off_link_stream(dp->ctrl);
>>
>> +               dp_display_host_phy_exit(dp);
>> +
>> +               /* host_init will be called at pm_resume */
>>                  dp_display_host_deinit(dp);
>> +       } else {
>> +               dp_display_host_phy_exit(dp);
> I fail to see where this condition happens. Can we suspend the device
> without the irq being installed?

Agree, with this new mechanism it should not happen.

Will remove it.

>>          }
>>
>>          dp->hpd_state = ST_SUSPENDED;
>>
>> -       /* host_init will be called at pm_resume */
>> -       dp->core_initialized = false;
>> -
>>          DRM_DEBUG_DP("After, core_inited=%d power_on=%d\n",
>>                          dp->core_initialized, dp_display->power_on);
>>
