Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D5FCA19A8AD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2020 11:32:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726974AbgDAJcc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Apr 2020 05:32:32 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:15027 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731870AbgDAJcb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Apr 2020 05:32:31 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1585733550; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=O4mfO68j0oUFthZ8BDymyBRZQeDPJ5DqwOJdqb9xXjc=;
 b=REC6ewzdQ+lioINZISvKvcXrblJFbUF8/aD56UKqVCfTTt1b6ppsuwcEvYkbYZRuAKSWqxo3
 OABiVYTs6Vv4GDzv0Nli+uCzHPrxJshaBpMU6oGXeOJQCtaYlfUma30dSqoGY8lvAxGGF9Yb
 +fs5BFjuD1T/7xfy2YS67eYfRao=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e845fa6.7f8810132c38-smtp-out-n03;
 Wed, 01 Apr 2020 09:32:22 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E3642C43636; Wed,  1 Apr 2020 09:32:21 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: kalyan_t)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 16FF4C433D2;
        Wed,  1 Apr 2020 09:32:21 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 01 Apr 2020 15:02:21 +0530
From:   kalyan_t@codeaurora.org
To:     Doug Anderson <dianders@chromium.org>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Sean Paul <seanpaul@chromium.org>,
        "Kristian H. Kristensen" <hoegsberg@chromium.org>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        mkrishn@codeaurora.org, travitej@codeaurora.org,
        nganji@codeaurora.org
Subject: Re: [PATCH] drm/msm/dpu: ensure device suspend happens during PM
 sleep
In-Reply-To: <CAD=FV=Up4y6GUkJc8NNJBdC28L+6LvUs7pCUg4pyMCgHMGEkug@mail.gmail.com>
References: <1585663107-12406-1-git-send-email-kalyan_t@codeaurora.org>
 <CAD=FV=Up4y6GUkJc8NNJBdC28L+6LvUs7pCUg4pyMCgHMGEkug@mail.gmail.com>
Message-ID: <2922a0c64ec61c3d74d516e44dca2d71@codeaurora.org>
X-Sender: kalyan_t@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-03-31 21:30, Doug Anderson wrote:
> Hi,
> 
> On Tue, Mar 31, 2020 at 6:58 AM Kalyan Thota <kalyan_t@codeaurora.org> 
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
>> Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
>> ---
>>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 2 ++
>>  drivers/gpu/drm/msm/dsi/dsi.c           | 2 ++
>>  drivers/gpu/drm/msm/msm_drv.c           | 4 ++++
>>  3 files changed, 8 insertions(+)
> 
> This looks much saner to me.  Thanks!  I assume it still works fine
> for you?  I'm still no expert on how all the pieces of DRM drivers
> work together, but at least there's not a bunch of strange fiddling
> with pm_runtime state and hopefully it will avoid weird corner
> cases...
> 
--- Yes, verified the change on trogdor device, and display can suspend 
with the change.
> 
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> index ce19f1d..b886d9d 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> @@ -1123,6 +1123,8 @@ static int __maybe_unused 
>> dpu_runtime_resume(struct device *dev)
>> 
>>  static const struct dev_pm_ops dpu_pm_ops = {
>>         SET_RUNTIME_PM_OPS(dpu_runtime_suspend, dpu_runtime_resume, 
>> NULL)
>> +       SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
>> +                               pm_runtime_force_resume)
>>  };
>> 
>>  static const struct of_device_id dpu_dt_match[] = {
>> diff --git a/drivers/gpu/drm/msm/dsi/dsi.c 
>> b/drivers/gpu/drm/msm/dsi/dsi.c
>> index 55ea4bc2..62704885 100644
>> --- a/drivers/gpu/drm/msm/dsi/dsi.c
>> +++ b/drivers/gpu/drm/msm/dsi/dsi.c
>> @@ -161,6 +161,8 @@ static int dsi_dev_remove(struct platform_device 
>> *pdev)
>> 
>>  static const struct dev_pm_ops dsi_pm_ops = {
>>         SET_RUNTIME_PM_OPS(msm_dsi_runtime_suspend, 
>> msm_dsi_runtime_resume, NULL)
>> +       SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
>> +                               pm_runtime_force_resume)
>>  };
>> 
>>  static struct platform_driver dsi_driver = {
>> diff --git a/drivers/gpu/drm/msm/msm_drv.c 
>> b/drivers/gpu/drm/msm/msm_drv.c
>> index 7d985f8..2b8c99c 100644
>> --- a/drivers/gpu/drm/msm/msm_drv.c
>> +++ b/drivers/gpu/drm/msm/msm_drv.c
>> @@ -1051,6 +1051,8 @@ static int msm_pm_suspend(struct device *dev)
>>                 return ret;
>>         }
>> 
>> +       pm_runtime_force_suspend(dev);
> 
> nit: check return value of pm_runtime_force_suspend()?
> 
> 
>> +
>>         return 0;
>>  }
>> 
>> @@ -1063,6 +1065,8 @@ static int msm_pm_resume(struct device *dev)
>>         if (WARN_ON(!priv->pm_state))
>>                 return -ENOENT;
>> 
>> +       pm_runtime_force_resume(dev);
> 
> nit: check return value of pm_runtime_force_resume()?
> 
> 
> -Doug
