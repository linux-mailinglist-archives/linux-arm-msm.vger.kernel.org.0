Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19CAA342913
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Mar 2021 00:12:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229811AbhCSXL3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 Mar 2021 19:11:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229725AbhCSXK6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 Mar 2021 19:10:58 -0400
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com [IPv6:2607:f8b0:4864:20::f36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EE0DC061762
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Mar 2021 16:10:58 -0700 (PDT)
Received: by mail-qv1-xf36.google.com with SMTP id by2so5840971qvb.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Mar 2021 16:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7EuZmmo91nl6huegeyFuO2PiUXV9nzZOyWpFg59NAqE=;
        b=TDSloJVVt/I8eDwWDYUXCksx1aBtsUfY+B1qBO9c6yy6IUkL+X3Vk8u3mQ25bRE0sL
         xftu+bGP8qFIT2FgoOfFfKm4dBELCuFE3xnYFkaZff2We+jAYkqFSF9ysPeZjggzset+
         ocPc11dxbFUhsI9gYwJdlvXRYazxvPEkGDaA0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7EuZmmo91nl6huegeyFuO2PiUXV9nzZOyWpFg59NAqE=;
        b=mZDt5sYRWQXoQ8eH92OkDo4rrCVOwO1gMn4Ugwh7W20nKqqenYf/x2K9HJ3Mis4glu
         +n5HYxCfoT4KO9H5Xt2wstV1MmDx5HbyDBT8TfqElYJA/00WlGwXva3EFQ3RNczUhdds
         ae+Y3oCu2jGNCZwlQqIRmQ7DMudsxKOnM+tZbvWoq9vIQLnlpELU6K2u7WntLmGseU4Q
         B6hYgrc48KDCZOstLoHmRudDGMfqR95cjOyRGHZ8VJpLvGLrDNfSgz6JNQvxYcWYrH5y
         L9advDjN8aR9L925FTvsMp7fsYh1+ZzUt1yp6zlQ+vUf/j+WgCW9btmAc9BWGdC1Qe51
         KbeA==
X-Gm-Message-State: AOAM532IZVXC1r5GdsBoSQPwzL2YH00cIUYrOxWVi+RKkCX2xZes5zyF
        rqeTJQWA8DyRA0tGaF4lxc0PDvHQaTyJ6A==
X-Google-Smtp-Source: ABdhPJxGGCgiD4lxbb218fBISlR6tA707bqNCLFoNb2ATTwRuqoFwnLkz62kfRLmLObm7PSqY1lXKw==
X-Received: by 2002:ad4:5887:: with SMTP id dz7mr11755053qvb.12.1616195457189;
        Fri, 19 Mar 2021 16:10:57 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id p66sm5734817qka.108.2021.03.19.16.10.56
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Mar 2021 16:10:56 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id o83so7947181ybg.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Mar 2021 16:10:56 -0700 (PDT)
X-Received: by 2002:a25:ab54:: with SMTP id u78mr10033101ybi.276.1616195455835;
 Fri, 19 Mar 2021 16:10:55 -0700 (PDT)
MIME-Version: 1.0
References: <1616158446-19290-1-git-send-email-kalyan_t@codeaurora.org>
In-Reply-To: <1616158446-19290-1-git-send-email-kalyan_t@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 19 Mar 2021 16:10:43 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XdBOZYuCVUjhAnEu0sKOmEHaCpA69v=BjQoM9gGQFjTg@mail.gmail.com>
Message-ID: <CAD=FV=XdBOZYuCVUjhAnEu0sKOmEHaCpA69v=BjQoM9gGQFjTg@mail.gmail.com>
Subject: Re: [v1] drm/msm/disp/dpu1: fix display underruns during modeset.
To:     Kalyan Thota <kalyan_t@codeaurora.org>
Cc:     y@qualcomm.com, dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Rob Clark <robdclark@gmail.com>, mkrishn@codeaurora.org,
        Stephen Boyd <swboyd@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Mar 19, 2021 at 5:54 AM Kalyan Thota <kalyan_t@codeaurora.org> wrote:
>
> During crtc disable, display perf structures are reset to 0
> which includes state varibles which are immutable. On crtc
> enable, we use the same structures and they don't refelect
> the actual values
>
> 1) Fix is to avoid updating the state structures during disable.
> 2) Reset the perf structures during atomic check when there is no
> modeset enable.
>
> Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 1 -
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      | 1 +
>  2 files changed, 1 insertion(+), 1 deletion(-)

I think Stephen was the one who originally noticed this and reported it, so:

Reported-by: Stephen Boyd <swboyd@chromium.org>

Seems to work for me. I got into the state where it was doing a
modeset at reboot (could see the underflow color for a period of time
when this happened). I added your patch and it looks better.

Tested-by: Douglas Anderson <dianders@chromium.org>
