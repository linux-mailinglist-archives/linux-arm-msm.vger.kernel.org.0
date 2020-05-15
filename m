Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F5391D4D64
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2020 14:06:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726244AbgEOMGL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 May 2020 08:06:11 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:20270 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726112AbgEOMGL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 May 2020 08:06:11 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1589544370; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=SPYp2YDyVuaw6uCp5OOGpG4DBGumTLBzvLR2arIhqlY=;
 b=NCF9c+KRDEPmbmoq58pqZDjUs/7KqEx5If6PnyeAdD0HpeeefMLfunbLB5tqdxU6OWGwwgqj
 mpDMVEjLuFhUv0s5qf3Ld5AjDuKMIR3p5vNw2vIvDNGZvIZg2ingnu6LK88LYvF/uzC4H6Od
 CeVDiIFvs+uNk57pwuby+KLEjAE=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ebe85a1.7fd5b5a07768-smtp-out-n03;
 Fri, 15 May 2020 12:05:53 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 027D7C43636; Fri, 15 May 2020 12:05:52 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: kalyan_t)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6D22AC433D2;
        Fri, 15 May 2020 12:05:51 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 15 May 2020 17:35:51 +0530
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
In-Reply-To: <CAD=FV=UJGivCyp=t0J++1DbSFDVf+5zSCcXgh83VZtssBmavjg@mail.gmail.com>
References: <1588339863-1322-1-git-send-email-kalyan_t@codeaurora.org>
 <CAD=FV=UJGivCyp=t0J++1DbSFDVf+5zSCcXgh83VZtssBmavjg@mail.gmail.com>
Message-ID: <32c01e9a5277bdbdbab868eb71688184@codeaurora.org>
X-Sender: kalyan_t@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-05-14 21:47, Doug Anderson wrote:
> Hi,
> 
> On Fri, May 1, 2020 at 6:31 AM Kalyan Thota <kalyan_t@codeaurora.org> 
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
>> Add changes to force suspend on runtime devices during pm sleep.
>> 
>> Changes in v1:
>>  - Remove unnecessary checks in the function
>>     _dpu_kms_disable_dpu (Rob Clark).
>> 
>> Changes in v2:
>>  - Avoid using suspend_late to reset the usagecount
>>    as suspend_late might not be called during suspend
>>    call failures (Doug).
>> 
>> Changes in v3:
>>  - Use force suspend instead of managing device usage_count
>>    via runtime put and get API's to trigger callbacks (Doug).
>> 
>> Changes in v4:
>>  - Check the return values of pm_runtime_force_suspend and
>>    pm_runtime_force_resume API's and pass appropriately (Doug).
>> 
>> Changes in v5:
> 
> Can you please put the version number properly in your subject?  It's
> really hard to tell one version of your patch from another.
> 
> 
>>  - With v4 patch, test cycle has uncovered issues in device resume.
>> 
>>    On bubs: cmd tx failures were seen as SW is sending panel off
>>    commands when the dsi resources are turned off.
>> 
>>    Upon suspend, DRM driver will issue a NULL composition to the
>>    dpu, followed by turning off all the HW blocks.
>> 
>>    v5 changes will serialize the NULL commit and resource unwinding
>>    by handling them under PM prepare and PM complete phases there by
>>    ensuring that clks are on when panel off commands are being
>>    processed.
> 
> I'm still most definitely not an expert in how all the DRM pieces all
> hook up together, but the solution you have in this patch seems wrong
> to me.  As far as I can tell the "prepare" state isn't supposed to be
> actually doing the suspend work and here that's exactly what you're
> doing.  I think you should find a different solution to ensure
> ordering is correct.
> 
> -Doug
> 

Hi,

Prepare and Complete are callbacks defined as part of Sleep and Resume 
sequence

Entering PM SUSPEND the phases are : prepare --> suspend --> 
suspend_late --> suspend_noirq.
While leaving PM SUSPEND the phases are: resume_noirq --> resume_early 
--> resume --> complete.

The reason to push drm suspend handling to PM prepare phase is that 
parent here will trigger a modeset to turn off the timing and 
subsequently the panel.
the child devices should not turn of their clocks before parent unwinds 
the composition. Hence they are serialized as per the sequence mentioned 
above.

A similar approach is taken by other driver that use drm framework. In 
this driver, the device registers for prepare and complete callbacks to 
handle drm_suspend and drm_resume.
https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/exynos/exynos_drm_drv.c#L163


Kalyan


_______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno
