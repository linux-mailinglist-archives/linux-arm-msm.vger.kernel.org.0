Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A3D83948BF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 May 2021 00:38:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229656AbhE1Wjv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 May 2021 18:39:51 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:17364 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229589AbhE1Wjv (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 May 2021 18:39:51 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1622241496; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=jSJ6ouw7sBSntMFtGhcr7YAwQxKznNopiE0ruE/1CnU=;
 b=de5JLEA5LONVwL/KRETniqNtWu5UFyeqAmzDrwrlbbmix6jUteX9HDgAFbw4/Ebeqi+FJ8N2
 sAshdTH4/IYii6VKSlkI70WV7LzcQRgTP20nG2UQxRZWz9Mf7ED6c4cTVrlqoUWGiGDsXCOn
 hIiz19o4IPZHpyT4KmX+tQJCgt0=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 60b170c8e27c0cc77ff1df21 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 28 May 2021 22:38:00
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 065A9C4323A; Fri, 28 May 2021 22:38:00 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 93241C433F1;
        Fri, 28 May 2021 22:37:57 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 28 May 2021 15:37:57 -0700
From:   abhinavk@codeaurora.org
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Stephen Boyd <swboyd@chromium.org>, sbillaka@codeaurora.org,
        Tanmay Shah <tanmay@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        freedreno@lists.freedesktop.org,
        Chandan Uddaraju <chandanu@codeaurora.org>
Subject: Re: [Freedreno] [PATCH 0/4] drm/msm/dp: Add support for SC8180x eDP
 controller
In-Reply-To: <20210519145149.GX2484@yoga>
References: <20210511042043.592802-1-bjorn.andersson@linaro.org>
 <40f6aefd3fa341e2bec2060106389be7@codeaurora.org>
 <20210519145149.GX2484@yoga>
Message-ID: <d10c43ffbbf90ea7e00c7f0c61602924@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bjorn

On 2021-05-19 07:51, Bjorn Andersson wrote:
> On Tue 18 May 22:41 CDT 2021, abhinavk@codeaurora.org wrote:
> 
>> Hi Bjorn
>> 
>> I had a quick glance on the series and before getting to other things 
>> wanted
>> to know how you are initializing two different connectors for
>> DP & EDP resp.
>> 
>> The connector type for DP should be DRM_MODE_CONNECTOR_DisplayPort and 
>> eDP
>> should be DRM_MODE_CONNECTOR_eDP.
> 
> As far as I've been able to conclude there is no eDP support in the
> upstream DPU driver; an encoder of type DRM_MODE_ENCODER_TMDS will only
> attach to INTF_DP.
> 
>> We need both to be created so that both EDP and DP can be supported
>> concurrently.
>> 
> 
> Further more the DP controller driver has a global variable to track
> state and the INTF-picker will always pick the interface of index 0 
> when
> setting up the DP controller.
> 
>> Will these changes work for concurrent eDP and DP case?
>> 
> 
> The proposed changes are all that I need to get eDP working on my
> sc8180x laptop. But the DPU code does not currently support more than a
> single DP interface - and that has to be on the first INTF_DP that the
> DPU driver knows about.
> 
> But this is a limitation we should fix, rather than claiming that you
> can only have one of each. Further more, afaict the sc7280 DP 
> controller
> can do both DP and eDP, so it would make sense not to distinguish the
> interfaces as eDP or DP - just because the product in mind will use 
> eDP.
> 
> 
> PS. I've currently disabled the eDP interface on my laptop and am
> working on trying to get Type-C DP working. Once that's in place I'd
> need a better INTF/encoder picker - because the current model of just
> picking INTF_DP 0 (or in a sequential fashion) won't work.
> 
> Regards,
> Bjorn

Yes, we should be able to support eDP + DP concurrently on both sc7280
and sc8180x. Some of the changes we will be posting in the coming weeks
should add support for it. Till then, as we spoke on IRC, since your 
changes
dont break existing DP functionality, will continue reviewing rest of 
the changes.

> 
>> Thanks
>> 
>> Abhinav
>> 
>> On 2021-05-10 21:20, Bjorn Andersson wrote:
>> > The first patch in the series is somewhat unrelated to the support, but
>> > simplifies reasoning and debugging of timing related issues.
>> >
>> > The second patch introduces support for dealing with different register
>> > block
>> > layouts, which is used in the forth patch to describe the hardware
>> > blocks found
>> > in the SC8180x eDP block.
>> >
>> > The third patch configures the INTF_CONFIG register, which carries the
>> > configuration for widebus handling. As with the DPU the bootloader
>> > enables
>> > widebus and we need to disable it, or implement support for adjusting
>> > the
>> > timing.
>> >
>> > Bjorn Andersson (4):
>> >   drm/msm/dp: Simplify the mvid/nvid calculation
>> >   drm/msm/dp: Store each subblock in the io region
>> >   drm/msm/dp: Initialize the INTF_CONFIG register
>> >   drm/msm/dp: Add support for SC8180x eDP
>> >
>> >  drivers/gpu/drm/msm/dp/dp_catalog.c | 99 +++++++----------------------
>> >  drivers/gpu/drm/msm/dp/dp_display.c |  1 +
>> >  drivers/gpu/drm/msm/dp/dp_parser.c  | 22 +++++++
>> >  drivers/gpu/drm/msm/dp/dp_parser.h  |  8 +++
>> >  4 files changed, 53 insertions(+), 77 deletions(-)
