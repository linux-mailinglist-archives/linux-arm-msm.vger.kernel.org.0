Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE05637D12B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 May 2021 19:54:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240345AbhELRsp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 May 2021 13:48:45 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:64500 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348185AbhELRcA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 May 2021 13:32:00 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1620840652; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=7oUoGyjrFKYwW1zHjHfoOw/G0kalViUlyRPQ/f7iQmc=;
 b=NQeA2kyoJdn2rNr0oKimdmTqIRWWroAdlWXfaZA9kKV1a1rvB82JDpsSyXRMD4bmMbeHpidS
 oZTSBKvtYUIfXuMC6QuDZTfIlJEwu0AFGuNgbuJ1H/Ec8Ti1sh2avVQXyMWcEDt1SdXL+1WA
 csogZPiCVdcyia5CY+EaupRHGec=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 609c10c0938a1a6b8f6e38cb (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 12 May 2021 17:30:40
 GMT
Sender: khsieh=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 5DDFFC433F1; Wed, 12 May 2021 17:30:40 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: khsieh)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0C505C433D3;
        Wed, 12 May 2021 17:30:39 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 12 May 2021 10:30:39 -0700
From:   khsieh@codeaurora.org
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Stephen Boyd <swboyd@chromium.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, robdclark@gmail.com, sean@poorly.run,
        abhinavk@codeaurora.org, aravindh@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dp: handle irq_hpd with sink_count = 0 correctly
In-Reply-To: <YJtnPt63yK4zP3O1@vkoul-mobl.Dlink>
References: <1620251521-29999-1-git-send-email-khsieh@codeaurora.org>
 <CAE-0n50HUo0tm22xX+j8H-u+EDH+wBrdEvM68p-X3EyR8S_u3Q@mail.gmail.com>
 <YJtnPt63yK4zP3O1@vkoul-mobl.Dlink>
Message-ID: <868dbca9a30e0d6a6d51f5e559b12ea3@codeaurora.org>
X-Sender: khsieh@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-05-11 22:27, Vinod Koul wrote:
> On 10-05-21, 11:15, Stephen Boyd wrote:
>> Quoting Kuogee Hsieh (2021-05-05 14:52:01)
>> > @@ -1414,6 +1416,10 @@ void dp_ctrl_host_deinit(struct dp_ctrl *dp_ctrl)
>> >         phy = dp_io->phy;
>> >
>> >         dp_catalog_ctrl_enable_irq(ctrl->catalog, false);
>> > +
>> > +       if (phy->power_count)
>> > +               phy_power_off(phy);
>> > +
>> >         phy_exit(phy);
>> >
>> >         DRM_DEBUG_DP("Host deinitialized successfully\n");
>> > @@ -1445,7 +1451,6 @@ static int dp_ctrl_reinitialize_mainlink(struct dp_ctrl_private *ctrl)
>> >
>> >         dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, false);
>> >         opts_dp->lanes = ctrl->link->link_params.num_lanes;
>> > -       phy_configure(phy, &dp_io->phy_opts);
>> >         /*
>> >          * Disable and re-enable the mainlink clock since the
>> >          * link clock might have been adjusted as part of the
>> > @@ -1456,9 +1461,13 @@ static int dp_ctrl_reinitialize_mainlink(struct dp_ctrl_private *ctrl)
>> >                 DRM_ERROR("Failed to disable clocks. ret=%d\n", ret);
>> >                 return ret;
>> >         }
>> > -       phy_power_off(phy);
>> > -       /* hw recommended delay before re-enabling clocks */
>> > -       msleep(20);
>> > +
>> > +       if (phy->power_count) {
>> 
>> I don't believe members of 'phy' are supposed to be looked at by 
>> various
>> phy consumer drivers. Vinod, is that right?
> 
> That is correct, we should not be doing that. And IMO this code is
> redundant, the phy core will check power_count and invoke drivers
> .power_off accordingly, so should be removed...
> 
> Thanks

ok, v2 patch uploaded to address this issue.
