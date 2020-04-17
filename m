Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BC691AE703
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2020 22:56:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726439AbgDQU4t (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Apr 2020 16:56:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726277AbgDQU4t (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Apr 2020 16:56:49 -0400
Received: from mail-ua1-x942.google.com (mail-ua1-x942.google.com [IPv6:2607:f8b0:4864:20::942])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A3E6C061A0C
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2020 13:56:49 -0700 (PDT)
Received: by mail-ua1-x942.google.com with SMTP id f59so755985uaf.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2020 13:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nTPDJ1FZx21ZUdm/rZe6vuNjgKbQ4V6e3Md/8z5QSYQ=;
        b=NTiOrafaduGKDmVfB6vAvc2mWdTspMay2fHcWX+kFb/9rqtwB1ixoAxjzkdoDWotNU
         cJPXhjrUZPXQpMjnVmPFTyNGXTFPAxaFIEJ+J06zvtyOEqhWnIlMm7m494gCUii9ggCA
         1t8AcHugDOTujupYSZCzSQt7zsOSByyoz29Tw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nTPDJ1FZx21ZUdm/rZe6vuNjgKbQ4V6e3Md/8z5QSYQ=;
        b=GBoIeDmfQF/spKWs+KBGDNYKOVrLdIS/DCt/JHG1qnEpCzWxUz5JNbU96FWTKMbOns
         AP0fZzrwOdWIXnzUI+XIYtgWYTJDkK7cpSAL2ThSCTaMooXcbVO6tWMZPu/q28+fW7PJ
         ul8vc+HlVURhgUfbFXmqaV90TDzQyR3aHfeBPaRSVFeKmjEtG+5YWm8FHKFnHHXQCIn/
         3Vp2YhUx0PfO1Ylj9IJxozoDDxyl440rlbMh1eePsoTMRGKYz3z2nudOrzUoxvZXHYLQ
         G1Ljp2a/eKkwZQ2THRR4E66/77i2VdxwDtODiWnYYYMIf9WolouC8BcLG4PHefp5Y5Ax
         EqrA==
X-Gm-Message-State: AGi0PuYiN4M9HzBOGr8OoGKbUk0ucEKkd1ywnBBw95WS8O4HoiCVXO2f
        QFT3q9KoP/m1369jjO5AGMNLi+AY4So=
X-Google-Smtp-Source: APiQypIX3o6q7o4b5wlYLXmKDrXmHyxqSgacGXeVC29G9xvYdgIrpdpWnw8p3MQ3GprSU+760+cUpw==
X-Received: by 2002:ab0:778d:: with SMTP id x13mr721623uar.110.1587157008306;
        Fri, 17 Apr 2020 13:56:48 -0700 (PDT)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id o8sm7113830vkd.47.2020.04.17.13.56.46
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Apr 2020 13:56:47 -0700 (PDT)
Received: by mail-vs1-f53.google.com with SMTP id s2so2041188vsm.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2020 13:56:46 -0700 (PDT)
X-Received: by 2002:a67:1e46:: with SMTP id e67mr4201742vse.106.1587157005954;
 Fri, 17 Apr 2020 13:56:45 -0700 (PDT)
MIME-Version: 1.0
References: <1587107546-7379-1-git-send-email-kalyan_t@codeaurora.org>
In-Reply-To: <1587107546-7379-1-git-send-email-kalyan_t@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 17 Apr 2020 13:56:34 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WmiXRJF77Nd0JEr-6WDGpJvxt4as6YJJUZdKo6c0NuvQ@mail.gmail.com>
Message-ID: <CAD=FV=WmiXRJF77Nd0JEr-6WDGpJvxt4as6YJJUZdKo6c0NuvQ@mail.gmail.com>
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

On Fri, Apr 17, 2020 at 12:13 AM Kalyan Thota <kalyan_t@codeaurora.org> wrote:
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
> Changes in v4:
>  - Check the return values of pm_runtime_force_suspend and
>    pm_runtime_force_resume API's and pass appropriately (Doug).
>
> Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c |  2 ++
>  drivers/gpu/drm/msm/dsi/dsi.c           |  2 ++
>  drivers/gpu/drm/msm/msm_drv.c           | 14 +++++++++++++-
>  3 files changed, 17 insertions(+), 1 deletion(-)

I am most certainly not an expert in this code, but as far as I can
tell it looks sane.  Thus:

Reviewed-by: Douglas Anderson <dianders@chromium.org>

-Doug
