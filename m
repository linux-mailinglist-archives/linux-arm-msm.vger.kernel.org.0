Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E8501549B9F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jun 2022 20:35:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245373AbiFMSfn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Jun 2022 14:35:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245511AbiFMSf2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Jun 2022 14:35:28 -0400
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D1AE6439;
        Mon, 13 Jun 2022 08:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1655134972; x=1686670972;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=m8YDmG7CVT6t+y4DSNge1YApMVBVkN5F0wgxXF4G1vY=;
  b=GkvQlMNowfxqLWzbnndmKWBVBmDaRoTR4/HwZaMXNJ6R81d2Ko6RHw3L
   67u+/aaWpJ3F6B8fX7BNWhoAplRMGkklANHvxUZR7p+bItDyiJcqMDEu0
   TOF3YPOfQVYTBHkDh+80A9penvjZetUtJyr4kQvpzRV2/whWobq2qbXhS
   g=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 13 Jun 2022 08:42:52 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2022 08:42:51 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 13 Jun 2022 08:42:51 -0700
Received: from [10.110.74.141] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Mon, 13 Jun
 2022 08:42:49 -0700
Message-ID: <b12a3e95-44b2-7075-2b77-f382f0d38cf7@quicinc.com>
Date:   Mon, 13 Jun 2022 08:42:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v4] drm/msm/dp: force link training for display resolution
 change
Content-Language: en-US
To:     Stephen Boyd <swboyd@chromium.org>, <agross@kernel.org>,
        <airlied@linux.ie>, <bjorn.andersson@linaro.org>,
        <daniel@ffwll.ch>, <dianders@chromium.org>,
        <dmitry.baryshkov@linaro.org>, <robdclark@gmail.com>,
        <sean@poorly.run>, <vkoul@kernel.org>
CC:     <quic_abhinavk@quicinc.com>, <quic_aravindh@quicinc.com>,
        <quic_sbillaka@quicinc.com>, <freedreno@lists.freedesktop.org>,
        <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <1653687133-32331-1-git-send-email-quic_khsieh@quicinc.com>
 <CAE-0n519jUEQK565OFVevvyoF49rgTazf4McjKmDS8mfDrWwyQ@mail.gmail.com>
From:   Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <CAE-0n519jUEQK565OFVevvyoF49rgTazf4McjKmDS8mfDrWwyQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-Spam-Status: No, score=-5.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 6/10/2022 2:04 PM, Stephen Boyd wrote:
> Quoting Kuogee Hsieh (2022-05-27 14:32:13)
>> During display resolution changes display have to be disabled first
>> followed by display enabling with new resolution. Display disable
>> will turn off both pixel clock and main link clock so that main link
>> have to be re trained during display enable to have new video stream
> s/re/re-/
>
>> flow again. At current implementation, display enable function manually
>> kicks up irq_hpd_handle which will read panel link status and start link
>> training if link status is not in sync state. However, there is rare
>> case that a particular panel links status keep staying in sync for
>> some period of time after main link had been shut down previously at
>> display disabled. Main link retraining will not be executed by
>> irq_hdp_handle() if the link status read from pane shows it is in
> s/pane/panel/
>
>> sync state. If this was happen, then video stream of newer display
>> resolution will fail to be transmitted to panel due to main link is
>> not in sync between host and panel. This patch force main link always
>> be retrained during display enable procedure to prevent this rare
>> failed case from happening. Also this implementation are more
>> efficient than manual kicking off irq_hpd_handle function.
> The description makes it sound like the link status is not updated,
> sometimes. Isn't that the real issue here? Not that link training needs
> to be done again (which it always does apparently), but that disabling
> the display doesn't wait for the link to go down. Or disabling the link
> is causing some sort of glitch on the sink causing it to report the
> status as OK when it really isn't.

As soon as mainlink teared down, sink has to reflect the mainlink at out 
of synch state in real time.

link re-training always required for display resolution changes since 
resolution changes will involve link configuration changes, such as 2 
lanes change to 1 changes or 5.7G link rate changes to 2.7G or vise 
versa. Therefore there is no need to check sinker's main link status to 
decide re training is required or not.



>> Changes in v2:
>> -- set force_link_train flag on DP only (is_edp == false)
>>
>> Changes in v3:
>> -- revise commit  text
>> -- add Fixes tag
>>
>> Changes in v4:
>> -- revise commit  text
>>
>> Fixes: 62671d2ef24b ("drm/msm/dp: fixes wrong connection state caused by failure of link train")
>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>> index c388323..370348d 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -1688,10 +1689,14 @@ void dp_bridge_enable(struct drm_bridge *drm_bridge)
>>
>>          state =  dp_display->hpd_state;
>>
>> -       if (state == ST_DISPLAY_OFF)
>> +       if (state == ST_DISPLAY_OFF) {
>>                  dp_display_host_phy_init(dp_display);
>>
>> -       dp_display_enable(dp_display, 0);
>> +               if (!dp->is_edp)
> Does this assume eDP has one resolution? I don't understand why eDP is
> special here, especially if eDP has more than one resolution available
> it seems like we would want to retrain the link regardless.
>
>> +                       force_link_train = true;
>> +       }
>> +
>> +       dp_display_enable(dp_display, force_link_train);
>>
>>          rc = dp_display_post_enable(dp);
>>          if (rc) {
