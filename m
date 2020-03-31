Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7CA9E199A99
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2020 18:00:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730366AbgCaQAV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 31 Mar 2020 12:00:21 -0400
Received: from mail-vk1-f194.google.com ([209.85.221.194]:39285 "EHLO
        mail-vk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730149AbgCaQAV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 31 Mar 2020 12:00:21 -0400
Received: by mail-vk1-f194.google.com with SMTP id r129so5834987vkr.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2020 09:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/GMoukOL0KHHE8wEvMLxzDD6OsKNGd37py8qqC7r4eI=;
        b=Mdyk4hIdWk9iaKwb4+KZqwkLAVAFtwZV/5MocNo0ZUVnr90atdWYJplVeGt1osWlMJ
         tsGG0jSCSuDfx6UCog8dLugU+8D/yjeNzKb4ikMbN1zz2tOBe/7yHSe5i4d0VKOn18dH
         u6KGIqmobDm7Jdik275lPhk3ZHks5e56i9mV0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/GMoukOL0KHHE8wEvMLxzDD6OsKNGd37py8qqC7r4eI=;
        b=dX5Diii7PjU+6w91Z+XK/5r/0u40/tDvaA7108EFxFl1AJTuRU8Rqw2LwgCk+rE36+
         h6w1RlzXCdIf7pH8+jEJi2VcnVFqJqaH771HrqGxPlAHfARtL5cF51dcHECmnibsP8qI
         betx+XUVRHKEOUOFSEwgkFckzEBlUbUS8Rbyb663P0hiF3S7hQOp/BMRnCnCWef6BZT8
         txRToa2/dSjQ/prVadBB+aLAWfdu0dyB5hdOblsx8Vymg8zkOnskPqiKXmc0hgzq+3e5
         Tah24sZmG46ZDZ9jlCrEPEZyg9hll762EyB1pHPKYZIfTVmB7vtQmdWN1jZSh6pAMi3D
         MYcw==
X-Gm-Message-State: AGi0PuacR9yTJI1MCvur3hV5Qe7lnYwTWBKitmDqI4y2iRmuDWIXHfy3
        YVJPGYf12M4cC7CVf1LiciX3/qNF1tY=
X-Google-Smtp-Source: APiQypJJUxsQe71RqxmVe1evVXRxPGDADtlED46DdHDDjaGP8/G3yYHYP+XjxNvNwOqvEheRavqOGw==
X-Received: by 2002:a1f:6182:: with SMTP id v124mr11985212vkb.48.1585670419165;
        Tue, 31 Mar 2020 09:00:19 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id 7sm6781554uap.16.2020.03.31.09.00.18
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2020 09:00:18 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id g10so2007677uae.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2020 09:00:18 -0700 (PDT)
X-Received: by 2002:ab0:7406:: with SMTP id r6mr3595683uap.22.1585670417847;
 Tue, 31 Mar 2020 09:00:17 -0700 (PDT)
MIME-Version: 1.0
References: <1585663107-12406-1-git-send-email-kalyan_t@codeaurora.org>
In-Reply-To: <1585663107-12406-1-git-send-email-kalyan_t@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 31 Mar 2020 09:00:06 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Up4y6GUkJc8NNJBdC28L+6LvUs7pCUg4pyMCgHMGEkug@mail.gmail.com>
Message-ID: <CAD=FV=Up4y6GUkJc8NNJBdC28L+6LvUs7pCUg4pyMCgHMGEkug@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: ensure device suspend happens during PM sleep
To:     Kalyan Thota <kalyan_t@codeaurora.org>
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
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Mar 31, 2020 at 6:58 AM Kalyan Thota <kalyan_t@codeaurora.org> wrote:
>
> "The PM core always increments the runtime usage counter
> before calling the ->suspend() callback and decrements it
> after calling the ->resume() callback"
>
> DPU and DSI are managed as runtime devices. When
> suspend is triggered, PM core adds a refcount on all the
> devices and calls device suspend, since usage count is
> already incremented, runtime suspend was not getting called
> and it kept the clocks on which resulted in target not
> entering into XO shutdown.
>
> Add changes to force suspend on runtime devices during pm sleep.
>
> Changes in v1:
>  - Remove unnecessary checks in the function
>     _dpu_kms_disable_dpu (Rob Clark).
>
> Changes in v2:
>  - Avoid using suspend_late to reset the usagecount
>    as suspend_late might not be called during suspend
>    call failures (Doug).
>
> Changes in v3:
>  - Use force suspend instead of managing device usage_count
>    via runtime put and get API's to trigger callbacks (Doug).
>
> Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 2 ++
>  drivers/gpu/drm/msm/dsi/dsi.c           | 2 ++
>  drivers/gpu/drm/msm/msm_drv.c           | 4 ++++
>  3 files changed, 8 insertions(+)

This looks much saner to me.  Thanks!  I assume it still works fine
for you?  I'm still no expert on how all the pieces of DRM drivers
work together, but at least there's not a bunch of strange fiddling
with pm_runtime state and hopefully it will avoid weird corner
cases...


> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index ce19f1d..b886d9d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -1123,6 +1123,8 @@ static int __maybe_unused dpu_runtime_resume(struct device *dev)
>
>  static const struct dev_pm_ops dpu_pm_ops = {
>         SET_RUNTIME_PM_OPS(dpu_runtime_suspend, dpu_runtime_resume, NULL)
> +       SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> +                               pm_runtime_force_resume)
>  };
>
>  static const struct of_device_id dpu_dt_match[] = {
> diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
> index 55ea4bc2..62704885 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi.c
> @@ -161,6 +161,8 @@ static int dsi_dev_remove(struct platform_device *pdev)
>
>  static const struct dev_pm_ops dsi_pm_ops = {
>         SET_RUNTIME_PM_OPS(msm_dsi_runtime_suspend, msm_dsi_runtime_resume, NULL)
> +       SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> +                               pm_runtime_force_resume)
>  };
>
>  static struct platform_driver dsi_driver = {
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 7d985f8..2b8c99c 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -1051,6 +1051,8 @@ static int msm_pm_suspend(struct device *dev)
>                 return ret;
>         }
>
> +       pm_runtime_force_suspend(dev);

nit: check return value of pm_runtime_force_suspend()?


> +
>         return 0;
>  }
>
> @@ -1063,6 +1065,8 @@ static int msm_pm_resume(struct device *dev)
>         if (WARN_ON(!priv->pm_state))
>                 return -ENOENT;
>
> +       pm_runtime_force_resume(dev);

nit: check return value of pm_runtime_force_resume()?


-Doug
