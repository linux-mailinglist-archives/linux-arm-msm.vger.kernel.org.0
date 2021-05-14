Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CDE5380EA6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 May 2021 19:12:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232965AbhENRNZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 May 2021 13:13:25 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:63379 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232303AbhENRNZ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 May 2021 13:13:25 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1621012333; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=4a2fycPA5wDhtt5CnwTzn96+WKZ81gWbNzcy4Msq974=;
 b=oZr94sjdy6bR3LdkDjsabJ1aUAsYVJcAfhLGRPKdPAQWnGlIyXyydjctzFjH7jp0g4m6JCFn
 uRJG5/Uq/11tcsVksnmILK/Vnpxkus4Ot1VFDvYoOKcqXJ/Dd2mYODdM/0pR1JiHlzVo0euZ
 eyUZjPegnzVWPptFoY2RfvZwkNM=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 609eaf64c229adfeffffed4a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 14 May 2021 17:12:04
 GMT
Sender: khsieh=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 9FAA9C4360C; Fri, 14 May 2021 17:12:04 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: khsieh)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 8C341C433D3;
        Fri, 14 May 2021 17:12:03 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 14 May 2021 10:12:03 -0700
From:   khsieh@codeaurora.org
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, robdclark@gmail.com,
        sean@poorly.run, vkoul@kernel.org, abhinavk@codeaurora.org,
        aravindh@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] drm/msm/dp: handle irq_hpd with sink_count = 0
 correctly
In-Reply-To: <CAE-0n53V661ir2hTpPYA2CAq3HLgXQYL+O-nnJy8vHYKPzynzw@mail.gmail.com>
References: <1620862199-19514-1-git-send-email-khsieh@codeaurora.org>
 <CAE-0n53V661ir2hTpPYA2CAq3HLgXQYL+O-nnJy8vHYKPzynzw@mail.gmail.com>
Message-ID: <07028c64a5683626300ee271bed3a621@codeaurora.org>
X-Sender: khsieh@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-05-14 00:03, Stephen Boyd wrote:
> Quoting Kuogee Hsieh (2021-05-12 16:29:59)
>> irq_hpd interrupt should be handled after dongle plugged in and
>> before dongle unplugged. Hence irq_hpd interrupt is enabled at
>> the end of the plugin handle and disabled at the beginning of
>> unplugged handle. Current irq_hpd with sink_count = 0 is wrongly
>> handled same as the dongle unplugged which tears down the mainlink
>> and disables the phy. This patch fixes this problem by only tearing
>> down the mainlink but keeping phy enabled at irq_hpd with
>> sink_count = 0 handle so that next irq_hpe with sink_count =1 can be
> 
> s/irq_hpe/irq/hpd/
> 
>> handled by setup mainlink only.
>> 
>> Changes in v2:
>> -- add ctrl->phy_Power_count
>> 
>> Changes in v3:
>> -- del ctrl->phy_Power_count
>> -- add phy_power_off to dp_ctrl_off_link_stream()
>> 
>> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
>> ---
>>  drivers/gpu/drm/msm/dp/dp_catalog.c |  5 ++--
>>  drivers/gpu/drm/msm/dp/dp_ctrl.c    | 54 
>> +++++++++++++++++++++++++++++++++++++
>>  drivers/gpu/drm/msm/dp/dp_ctrl.h    |  2 ++
>>  drivers/gpu/drm/msm/dp/dp_display.c | 46 
>> ++++++++++++++++++++++++-------
>>  4 files changed, 94 insertions(+), 13 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c 
>> b/drivers/gpu/drm/msm/dp/dp_catalog.c
>> index b1a9b1b..f4f53f2 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
>> @@ -582,10 +582,9 @@ void dp_catalog_ctrl_hpd_config(struct dp_catalog 
>> *dp_catalog)
>> 
>>         u32 reftimer = dp_read_aux(catalog, REG_DP_DP_HPD_REFTIMER);
>> 
>> -       /* enable HPD interrupts */
>> +       /* enable HPD plug and unplug interrupts */
>>         dp_catalog_hpd_config_intr(dp_catalog,
>> -               DP_DP_HPD_PLUG_INT_MASK | DP_DP_IRQ_HPD_INT_MASK
>> -               | DP_DP_HPD_UNPLUG_INT_MASK | 
>> DP_DP_HPD_REPLUG_INT_MASK, true);
>> +               DP_DP_HPD_PLUG_INT_MASK | DP_DP_HPD_UNPLUG_INT_MASK, 
>> true);
>> 
>>         /* Configure REFTIMER and enable it */
>>         reftimer |= DP_DP_HPD_REFTIMER_ENABLE;
>> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c 
>> b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> index 8d59eb9..41c122c 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> @@ -1811,6 +1811,60 @@ int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl)
>>         return ret;
>>  }
>> 
>> +int dp_ctrl_off_link_stream(struct dp_ctrl *dp_ctrl)
>> +{
>> +       struct dp_ctrl_private *ctrl;
>> +       struct dp_io *dp_io;
>> +       struct phy *phy;
>> +       int ret = 0;
> 
> Please don't assign ret and then reassign it without testing it first.
> 
>> +
>> +       if (!dp_ctrl)
> 
> Does this ever happen?
> 
>> +               return -EINVAL;
>> +
>> +       ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
>> +       dp_io = &ctrl->parser->io;
>> +       phy = dp_io->phy;
>> +
>> +       dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, false);
>> +
>> +       ret = dp_power_clk_enable(ctrl->power, DP_STREAM_PM, false);
>> +       if (ret)
>> +               DRM_ERROR("Failed to disable pixel clocks. ret=%d\n", 
>> ret);
> 
> Why do we continue instead of returning with a failure?
> 
>> +
>> +       ret = dp_power_clk_enable(ctrl->power, DP_CTRL_PM, false);
>> +       if (ret)
>> +               DRM_ERROR("Failed to disable link clocks. ret=%d\n", 
>> ret);
> 
> Same, why do we continue?
> 
>> +
>> +       phy_power_off(phy);
>> +       phy_exit(phy);
>> +
>> +       /* aux channel down, reinit phy */
> 
> So we need to call exit/init to reinitialize the phy? I wonder if there
> could be some phy_reinit() function that combines those.
there is no phy_reinit() function existing currently.
we can add phy_reinit() to combine phy_exit/phy_init as long as ther is 
no changed to phy->init_count.




> 
>> +       phy_init(phy);
>> +
>> +       DRM_DEBUG_DP("DP off link/stream done\n");
>> +       return ret;
> 
> Except here we return with a failure.
> 
>> +}
>> +
>> +void dp_ctrl_off_phy(struct dp_ctrl *dp_ctrl)
>> +{
>> +       struct dp_ctrl_private *ctrl;
>> +       struct dp_io *dp_io;
>> +       struct phy *phy;
>> +
>> +       if (!dp_ctrl)
> 
> Does this ever happen?
> 
>> +               return;
>> +
>> +       ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
>> +       dp_io = &ctrl->parser->io;
>> +       phy = dp_io->phy;
>> +
>> +       dp_catalog_ctrl_reset(ctrl->catalog);
>> +
>> +       phy_exit(phy);
>> +
>> +       DRM_DEBUG_DP("DP off phy done\n");
>> +}
>> +
>>  int dp_ctrl_off(struct dp_ctrl *dp_ctrl)
>>  {
>>         struct dp_ctrl_private *ctrl;
