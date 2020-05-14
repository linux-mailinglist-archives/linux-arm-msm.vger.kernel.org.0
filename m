Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E8821D3639
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2020 18:17:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726126AbgENQRa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 May 2020 12:17:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726113AbgENQRa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 May 2020 12:17:30 -0400
Received: from mail-vk1-xa41.google.com (mail-vk1-xa41.google.com [IPv6:2607:f8b0:4864:20::a41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FD2EC061A0C
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2020 09:17:30 -0700 (PDT)
Received: by mail-vk1-xa41.google.com with SMTP id j127so918051vke.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2020 09:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OqjZEsENiuJ7Z2+zCW9pzRm/SY0vcINZf6TSPb9wFL8=;
        b=T5HS0B1fvJofutv3NJqUrbAvHVxEP8Z/4pbg8rWnyUbriguTHHrLowQ8XSkvu1D4nb
         CKxxadhSnrOhka8fhDtg4GRuLt/M9djey/HD7gL8AniRdx98Ev//amZicIk25BLCfDDp
         gSMyC2uil/ZYl+myPhupP0IWuS1OqIEI9X8ZY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OqjZEsENiuJ7Z2+zCW9pzRm/SY0vcINZf6TSPb9wFL8=;
        b=iFYENTSBXcVTo+/FkuCLdyZQJng2vIZkLAM/m+PzFSjYtrDWXFQ4knRX6fLVAnb8RV
         6xlkhDfnWgW/mDKa9kqPb07mD1mIXrrq+ZWbZYVENH6UNzwArQ053e5ozO7s5hXFjqnd
         /nwBAhMY5zVrULx/WafSEn1RpaIU2yXxh5S4Wfv1HJ9C1RDMI0FIWdqTj9hJEeBfEP8R
         twZJem9ZQVxN+Gh+jrf0fDC+6B0BUHy47NHxbH2YW9/KP94qOdPT8Ktg+XMAJVN/Gmjn
         Nn8d4+wIw38VUiVvdFQSAmjzHZCnwGOoswjznKFNx7BjDwSln2x7DPLfPvDlcmdfy7kF
         mNJQ==
X-Gm-Message-State: AOAM532eSKSTuWY6NjGTG33afvATnCaTbX1HBqBsbV6pXiKEpu8X8+Rw
        NqdrAi6xK6nAB8GgCjEes/QOAlIM3Yg=
X-Google-Smtp-Source: ABdhPJxhqtl8OSI9qj4bIKqmVWVziJnrYTUVG97tFygw6gINyWujf5UZTVjoTurt6ozyGPI5UlOvcA==
X-Received: by 2002:ac5:c810:: with SMTP id y16mr4111959vkl.49.1589473048717;
        Thu, 14 May 2020 09:17:28 -0700 (PDT)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com. [209.85.221.173])
        by smtp.gmail.com with ESMTPSA id h2sm258818vkn.12.2020.05.14.09.17.27
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2020 09:17:27 -0700 (PDT)
Received: by mail-vk1-f173.google.com with SMTP id z3so259895vka.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2020 09:17:27 -0700 (PDT)
X-Received: by 2002:a1f:9605:: with SMTP id y5mr4360665vkd.75.1589473046623;
 Thu, 14 May 2020 09:17:26 -0700 (PDT)
MIME-Version: 1.0
References: <1588339863-1322-1-git-send-email-kalyan_t@codeaurora.org>
In-Reply-To: <1588339863-1322-1-git-send-email-kalyan_t@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 14 May 2020 09:17:15 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UJGivCyp=t0J++1DbSFDVf+5zSCcXgh83VZtssBmavjg@mail.gmail.com>
Message-ID: <CAD=FV=UJGivCyp=t0J++1DbSFDVf+5zSCcXgh83VZtssBmavjg@mail.gmail.com>
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

On Fri, May 1, 2020 at 6:31 AM Kalyan Thota <kalyan_t@codeaurora.org> wrote:
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
> Changes in v5:

Can you please put the version number properly in your subject?  It's
really hard to tell one version of your patch from another.


>  - With v4 patch, test cycle has uncovered issues in device resume.
>
>    On bubs: cmd tx failures were seen as SW is sending panel off
>    commands when the dsi resources are turned off.
>
>    Upon suspend, DRM driver will issue a NULL composition to the
>    dpu, followed by turning off all the HW blocks.
>
>    v5 changes will serialize the NULL commit and resource unwinding
>    by handling them under PM prepare and PM complete phases there by
>    ensuring that clks are on when panel off commands are being
>    processed.

I'm still most definitely not an expert in how all the DRM pieces all
hook up together, but the solution you have in this patch seems wrong
to me.  As far as I can tell the "prepare" state isn't supposed to be
actually doing the suspend work and here that's exactly what you're
doing.  I think you should find a different solution to ensure
ordering is correct.

-Doug
