Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 329A43932FD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 May 2021 17:58:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234432AbhE0QAY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 May 2021 12:00:24 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:28416 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234071AbhE0QAV (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 May 2021 12:00:21 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1622131128; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=skzlMQTVIv5tAa6mWagGdwHWXlS9tgzbXzi5wk32KN8=;
 b=TJujFCJq9jbyUJYR1eYV6LCNP4yOzoHPx/rcEB/AXWMvcwtJlHXAELwmMIx+WzunYeif6N8p
 A/Zku9Gdk3SdkttngF9QgBPtLz1iWlpNv0PttM9F/Nxuj8MvXdtanm8Oh6s4LKQSWkxJ8KPx
 vUjK2Y9Rg8+XeCM6Q2NoMTY3I7M=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 60afc1b667d156359a271af0 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 27 May 2021 15:58:46
 GMT
Sender: khsieh=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B62CDC433F1; Thu, 27 May 2021 15:58:46 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: khsieh)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6D2ACC433D3;
        Thu, 27 May 2021 15:58:44 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 27 May 2021 08:58:44 -0700
From:   khsieh@codeaurora.org
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, robdclark@gmail.com,
        sean@poorly.run, vkoul@kernel.org, abhinavk@codeaurora.org,
        aravindh@codeaurora.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dp: keep aux channel up when power of dp phy
In-Reply-To: <CAE-0n51tgnPnwTvtNe-w5MjEAOmgtko0aw6Hu744EwOE00tzPg@mail.gmail.com>
References: <1622072989-793-1-git-send-email-khsieh@codeaurora.org>
 <CAE-0n51tgnPnwTvtNe-w5MjEAOmgtko0aw6Hu744EwOE00tzPg@mail.gmail.com>
Message-ID: <3d3758c19a05c4304cb03326979b382a@codeaurora.org>
X-Sender: khsieh@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-05-26 21:29, Stephen Boyd wrote:
> General note, please Cc dri-devel on freedreno driver patches.
> 
> Quoting Kuogee Hsieh (2021-05-26 16:49:49)
>> Aux channel is used to perform management function and should be
>> running in parallel with main link. Therefore should only power
>> down main link and keep aux channel running when power down phy.
>> 
>> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
>> ---
> 
> Does this supersede the previous patch[1] or is it in addition to?
this is the addition one.

> 
> [1]
> https://lore.kernel.org/r/1622052503-21158-1-git-send-email-khsieh@codeaurora.org
> 
>>  drivers/gpu/drm/msm/dp/dp_ctrl.c    |  4 ----
>>  drivers/phy/qualcomm/phy-qcom-qmp.c | 11 +++++++++--
>>  2 files changed, 9 insertions(+), 6 deletions(-)
> 
> Given that it touches two subsystems the merge path is questionable.
ok, will separate it out
> 
>> 
>> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c 
>> b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> index 5115c05..5f93c64 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> @@ -1844,10 +1844,6 @@ int dp_ctrl_off_link_stream(struct dp_ctrl 
>> *dp_ctrl)
>> 
>>         phy_power_off(phy);
>> 
>> -       /* aux channel down, reinit phy */
>> -       phy_exit(phy);
>> -       phy_init(phy);
>> -
>>         DRM_DEBUG_DP("DP off link/stream done\n");
>>         return ret;
>>  }
>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c 
>> b/drivers/phy/qualcomm/phy-qcom-qmp.c
>> index b122e63..567e32e 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-qmp.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
>> @@ -3214,12 +3214,19 @@ static int qcom_qmp_phy_power_off(struct phy 
>> *phy)
>>  {
>>         struct qmp_phy *qphy = phy_get_drvdata(phy);
>>         const struct qmp_phy_cfg *cfg = qphy->cfg;
>> +       u32 val;
>> 
>>         clk_disable_unprepare(qphy->pipe_clk);
>> 
>>         if (cfg->type == PHY_TYPE_DP) {
>> -               /* Assert DP PHY power down */
>> -               writel(DP_PHY_PD_CTL_PSR_PWRDN, qphy->pcs + 
>> QSERDES_V3_DP_PHY_PD_CTL);
>> +               /*
>> +                * Assert DP PHY LANE_0_1, LANE_2_3, PSR power down
>> +                * keep aux channel up
> 
> Maybe say "keep aux channel up until phy_exit() is called" so we know
> how long it is supposed to stay on. And just to confirm, it is on in
> phy_init(), right?
> 
yes, aux channel is on at phy_init
>> +                */
>> +               val = DP_PHY_PD_CTL_PWRDN | DP_PHY_PD_CTL_AUX_PWRDN |
>> +                       DP_PHY_PD_CTL_PLL_PWRDN | 
>> DP_PHY_PD_CTL_DP_CLAMP_EN |
>> +                       DP_PHY_PD_CTL_PSR_PWRDN;
>> +               writel(val, qphy->pcs + QSERDES_V3_DP_PHY_PD_CTL);
>>         } else {
>>                 /* PHY reset */
>>                 if (!cfg->no_pcs_sw_reset)
