Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C50149BB3E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jan 2022 19:26:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231517AbiAYS00 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Jan 2022 13:26:26 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:55257 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231514AbiAYS0P (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Jan 2022 13:26:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1643135176; x=1674671176;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=y3OyjjNPOF/xwWFxdHrFJnviAKdTRmjfdM4A7OrtKPY=;
  b=n8Pnpmr3B8EynDzbet5aaEyJcC/mNV/MIZuSzJ2rHRqDhbmCcwZhFFY3
   uexLCNJM+gmRqyVSJgDrNelpCwxVDgK0PkLUBIo5TTGN6KKznoMi2lq9M
   C5Zi7Ep/Uqr7Vyhs6Np4DH8GSqHUzljw3EljgVU5cilWwwcnGJrx8j4J+
   c=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 25 Jan 2022 10:26:10 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2022 10:26:09 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Tue, 25 Jan 2022 10:26:09 -0800
Received: from [10.110.95.84] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Tue, 25 Jan
 2022 10:26:08 -0800
Message-ID: <7155e3ab-daf1-4104-6712-1c4e3a328b56@quicinc.com>
Date:   Tue, 25 Jan 2022 10:26:07 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH] drm/msm/dp: add connector type to enhance debug messages
Content-Language: en-US
To:     Stephen Boyd <swboyd@chromium.org>, <agross@kernel.org>,
        <airlied@linux.ie>, <bjorn.andersson@linaro.org>,
        <daniel@ffwll.ch>, <dmitry.baryshkov@linaro.org>,
        <robdclark@gmail.com>, <sean@poorly.run>, <vkoul@kernel.org>
CC:     <quic_abhinavk@quicinc.com>, <aravindh@codeaurora.org>,
        <freedreno@lists.freedesktop.org>,
        <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <1643064292-6965-1-git-send-email-quic_khsieh@quicinc.com>
 <CAE-0n505fYR1zpgZnC=J7WSxp_gpn6mnda9TuVjmJD8vMRn2Rg@mail.gmail.com>
From:   Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <CAE-0n505fYR1zpgZnC=J7WSxp_gpn6mnda9TuVjmJD8vMRn2Rg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 1/24/2022 5:50 PM, Stephen Boyd wrote:
> Quoting Kuogee Hsieh (2022-01-24 14:44:52)
>> DP driver is a generic driver which supports both eDP and DP.
>> For debugging purpose it is required to have capabilities to
>> differentiate message are generated from eDP or DP. This patch
>> add connector type into debug messages for this purpose.
>>
>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_ctrl.c    | 20 +++++------
>>   drivers/gpu/drm/msm/dp/dp_display.c | 71 ++++++++++++++++++++++++++-----------
>>   2 files changed, 60 insertions(+), 31 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> index 245e1b9..dcd0126 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> @@ -1396,6 +1396,8 @@ void dp_ctrl_phy_init(struct dp_ctrl *dp_ctrl)
>>
>>          dp_catalog_ctrl_phy_reset(ctrl->catalog);
>>          phy_init(phy);
>> +       DRM_DEBUG_DP("phy=%p init=%d power_on=%d\n",
>> +                       phy, phy->init_count, phy->power_count);
>>   }
>>
>>   void dp_ctrl_phy_exit(struct dp_ctrl *dp_ctrl)
>> @@ -1410,6 +1412,8 @@ void dp_ctrl_phy_exit(struct dp_ctrl *dp_ctrl)
>>
>>          dp_catalog_ctrl_phy_reset(ctrl->catalog);
>>          phy_exit(phy);
>> +       DRM_DEBUG_DP("phy=%p init=%d power_on=%d\n",
>> +                       phy, phy->init_count, phy->power_count);
>>   }
>>
>>   static bool dp_ctrl_use_fixed_nvid(struct dp_ctrl_private *ctrl)
>> @@ -1484,6 +1488,8 @@ static int dp_ctrl_deinitialize_mainlink(struct dp_ctrl_private *ctrl)
>>          phy_exit(phy);
>>          phy_init(phy);
>>
>> +       DRM_DEBUG_DP("phy=%p init=%d power_on=%d\n",
>> +                       phy, phy->init_count, phy->power_count);
>>          return 0;
>>   }
>>
> These are entirely new messages. Adding messages isn't mentioned in the
> commit text. Please either split this out or indicate in the commit text
> what's going on here.
>
>> @@ -1895,14 +1901,12 @@ int dp_ctrl_off_link_stream(struct dp_ctrl *dp_ctrl)
>>
>>          phy_power_off(phy);
>>
>> -       DRM_DEBUG_DP("After, phy=%x init_count=%d power_on=%d\n",
>> -               (u32)(uintptr_t)phy, phy->init_count, phy->power_count);
>> -
>>          /* aux channel down, reinit phy */
>>          phy_exit(phy);
>>          phy_init(phy);
>>
>> -       DRM_DEBUG_DP("DP off link/stream done\n");
>> +       DRM_DEBUG_DP("phy=%p init=%d power_on=%d\n",
> The DRM_DEBUG_DP macro says it's deprecated now and we should use
> drm_dbg_dp() instead. Can you use that macro instead? Then it looks like
> drm->dev can actually be any old struct device, so I guess we're allowed
> to pass in the particular instance of dp device this is for. Allowing us
> to figure out which DP device is actually printing messages.
where it say "deprecated"?
>> +                       phy, phy->init_count, phy->power_count);
>>          return ret;
>>   }
>>
