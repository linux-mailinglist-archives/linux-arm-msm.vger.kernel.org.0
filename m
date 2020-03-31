Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 201ED199818
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2020 16:05:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730543AbgCaOFZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 31 Mar 2020 10:05:25 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:37417 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730562AbgCaOFZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 31 Mar 2020 10:05:25 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1585663524; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=JPQGZVO7GQmUjDTatLNPuWZXRCXTSbNi57XEzEX56cE=;
 b=hOuh2Xt7EVO4/2Vf4CjjMk8ECmeXIh3DoFSjRsRVRfuhTaEe0NZFuqvWUKbgFmUSkeKPFGp7
 3MqFJLqDL3Ziufzs3Rj70OfRRo7RTPmn4jq9nxFHsL5r8+ie1UWqpI49TuRUY1Kwj67ygpcn
 IjwaOfqTZcN2HW0SkInlpoZSvME=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e834e23.7f61220ab848-smtp-out-n03;
 Tue, 31 Mar 2020 14:05:23 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 8A93DC433F2; Tue, 31 Mar 2020 14:05:22 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: kalyan_t)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id BBE03C433F2;
        Tue, 31 Mar 2020 14:05:21 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 31 Mar 2020 19:35:21 +0530
From:   kalyan_t@codeaurora.org
To:     Doug Anderson <dianders@chromium.org>
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, mkrishn@codeaurora.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        travitej@codeaurora.org, LKML <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Rob Clark <robdclark@gmail.com>, nganji@codeaurora.org,
        Sean Paul <seanpaul@chromium.org>,
        "Kristian H. Kristensen" <hoegsberg@chromium.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Jeykumar Sankaran <jsanka@codeaurora.org>
Subject: Re: [Freedreno] [PATCH] drm/msm/dpu: ensure device suspend happens
 during PM sleep
In-Reply-To: <CAD=FV=WcFahUm8jK+QTwx7BkCb3GTgKqFLP_pdqWBqN-zawrbw@mail.gmail.com>
References: <1585559008-12705-1-git-send-email-kalyan_t@codeaurora.org>
 <CAD=FV=WcFahUm8jK+QTwx7BkCb3GTgKqFLP_pdqWBqN-zawrbw@mail.gmail.com>
Message-ID: <145ea4f469465674c8a2e36fdfcbec67@codeaurora.org>
X-Sender: kalyan_t@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-03-31 00:25, Doug Anderson wrote:
> Hi,
> 
> On Mon, Mar 30, 2020 at 2:04 AM Kalyan Thota <kalyan_t@codeaurora.org> 
> wrote:
>> 
>> "The PM core always increments the runtime usage counter
>> before calling the ->suspend() callback and decrements it
>> after calling the ->resume() callback"
>> 
>> DPU and DSI are managed as runtime devices. When
>> suspend is triggered, PM core adds a refcount on all the
>> devices and calls device suspend, since usage count is
>> already incremented, runtime suspend was not getting called
>> and it kept the clocks on which resulted in target not
>> entering into XO shutdown.
>> 
>> Add changes to manage runtime devices during pm sleep.
>> 
>> Changes in v1:
>>  - Remove unnecessary checks in the function
>>    _dpu_kms_disable_dpu (Rob Clark).
>> 
>> Changes in v2:
>>  - Avoid using suspend_late to reset the usagecount
>>    as suspend_late might not be called during suspend
>>    call failures (Doug).
>> 
>> Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
>> ---
>>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 33 
>> +++++++++++++++++++++++++++++++++
>>  drivers/gpu/drm/msm/msm_drv.c           |  4 ++++
>>  drivers/gpu/drm/msm/msm_kms.h           |  2 ++
>>  3 files changed, 39 insertions(+)
> 
> I am still 100% baffled by your patch and I never did quite understand
> your response to my previous comments [1].  I think you're saying that
> the problem you were facing is that if you call "suspend" but never
> called "runtime_suspend" that the device stays active.  Is that right?
>  If that's true, did you try something like this suggestion I made?
> 
> SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, 
> pm_runtime_force_resume)
> 
> 
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> index ce19f1d..2343cbd 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> @@ -26,6 +26,7 @@
>>  #include "dpu_encoder.h"
>>  #include "dpu_plane.h"
>>  #include "dpu_crtc.h"
>> +#include "dsi.h"
>> 
>>  #define CREATE_TRACE_POINTS
>>  #include "dpu_trace.h"
>> @@ -325,6 +326,37 @@ static void dpu_kms_disable_commit(struct msm_kms 
>> *kms)
>>         pm_runtime_put_sync(&dpu_kms->pdev->dev);
>>  }
>> 
>> +static void _dpu_kms_disable_dpu(struct msm_kms *kms)
>> +{
>> +       struct dpu_kms *dpu_kms = to_dpu_kms(kms);
>> +       struct drm_device *dev = dpu_kms->dev;
>> +       struct msm_drm_private *priv = dev->dev_private;
>> +       struct msm_dsi *dsi;
>> +       int i;
>> +
>> +       dpu_kms_disable_commit(kms);
>> +
>> +       for (i = 0; i < ARRAY_SIZE(priv->dsi); i++) {
>> +               if (!priv->dsi[i])
>> +                       continue;
>> +               dsi = priv->dsi[i];
>> +               pm_runtime_put_sync(&dsi->pdev->dev);
>> +       }
>> +       pm_runtime_put_sync(dev->dev);
>> +
>> +       /* Increment the usagecount without triggering a resume */
>> +       pm_runtime_get_noresume(dev->dev);
>> +
>> +       pm_runtime_get_noresume(&dpu_kms->pdev->dev);
>> +
>> +       for (i = 0; i < ARRAY_SIZE(priv->dsi); i++) {
>> +               if (!priv->dsi[i])
>> +                       continue;
>> +               dsi = priv->dsi[i];
>> +               pm_runtime_get_noresume(&dsi->pdev->dev);
>> +       }
>> +}
> 
> My pm_runtime knowledge is pretty weak sometimes, but the above
> function looks crazy.  Maybe it's just me not understanding, but can
> you please summarize what you're trying to accomplish?
> 
-- I was trying to get the runtime callbacks via controlling the device 
usage_count
Since the usage_count was already incremented by PM core, i was 
decrementing and incrementing (without resume)
so that callbacks are triggered.

I have taken your suggestion on forcing the suspend instead of managing 
it via usage_count.
i'll follow it up in the next patchset.

> -Doug
> 
> [1] 
> https://lore.kernel.org/r/114130f68c494f83303c51157e2c5bfa@codeaurora.org
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno
