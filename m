Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D95DB20E058
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2020 23:56:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732495AbgF2Up0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Jun 2020 16:45:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388183AbgF2UpZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Jun 2020 16:45:25 -0400
Received: from mail-ua1-x932.google.com (mail-ua1-x932.google.com [IPv6:2607:f8b0:4864:20::932])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66F3CC061755
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2020 13:45:25 -0700 (PDT)
Received: by mail-ua1-x932.google.com with SMTP id b13so5785940uav.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2020 13:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=w7kFF6I/7tjyYaS1rtr5oIMqxgnM+l1sJPudiJl+Cto=;
        b=np8GQKHletK7G3CJusLVB9GC+G7QJF/kREt9GxLJ1t3Hlt3hdOPYI7AnTqvqvfjjOh
         XTfgB9NlwsFFJPFFY/3WXO2tvqKQyGWdikLrXJA5twdfvWv6WqsfZ8fbSnJ761heXjn9
         vHh9j+YN5HmSWr/N6yqL9vCMgNC/cINJ2irupbhcqOWIFiVYa2coSiBY23Qs4cG4b/ie
         cUcy4Xxu/2VK8s6dDPcsm9MWe4pGDUccuyqfsEfwzQSOtHKWPVj5rEL732Fq4SCxwmox
         8LSPZSwt63n11b2S6g6OLJdtEXt+dK5kugr9Rn/1xTEMZV2pqm/UsihoKln3VyxotYET
         UjTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=w7kFF6I/7tjyYaS1rtr5oIMqxgnM+l1sJPudiJl+Cto=;
        b=rA8w7Nx/lKMFk+cIbxy2t3ND5fa09xSdM/ETcbi3+Wyj9U8UBAUg/mCjlIvBsP+P4W
         L3K5QGTboaca1hmim8UMEExH4eTPSIyMDsENGPCgdeMmcWl3jn1IbO8OTFCgqDOllfbU
         lWbRxzQ1SS+e8Gnfv5L5Zwua1BhfgJBC0M96W7lscjSxowe0MExs1do/bhpt4vv+qfep
         TMf8a/6sCUR+OtkPZoH41gNGThpnYAW1SuQ3W/r2/LghntOYbzzmhJu6VwDQSHq3Lft0
         71SZ2lEePqmGIjGv8dWZfgw5HWUuopfnaAj7UJtl08e/sIwZ39oA/aoWwOcS2yNJJUv6
         7zZQ==
X-Gm-Message-State: AOAM532f1TGFED959AdEWkEyI76SkQffG5M1BrKKbqZSTmmFUhBTX9Eh
        GlUQPIoqHnFeX6laA5UcFPUxBImh9nDsksB4y3bIZg==
X-Google-Smtp-Source: ABdhPJxJKIf8c61d6Sxw032JzZeDqSjWcveZhm6ih/0vZLyM07fRcVrc1Lj+/k5p5DI0zMqvLZYhwCd5VnyTNVlYSEQ=
X-Received: by 2002:a9f:3b18:: with SMTP id i24mr12193440uah.52.1593463524191;
 Mon, 29 Jun 2020 13:45:24 -0700 (PDT)
MIME-Version: 1.0
References: <1593087419-903-1-git-send-email-kalyan_t@codeaurora.org> <CAD=FV=VXAQagbM-dn7MWGm08DdBxefc4jHNbkvHzuBjSM_jWnw@mail.gmail.com>
In-Reply-To: <CAD=FV=VXAQagbM-dn7MWGm08DdBxefc4jHNbkvHzuBjSM_jWnw@mail.gmail.com>
From:   Kristian Kristensen <hoegsberg@google.com>
Date:   Mon, 29 Jun 2020 13:45:13 -0700
Message-ID: <CAOPc6T=E68D8NG+hkRH6WTnYBcCzq=-H6q1M_NVoU9S6eGkxFg@mail.gmail.com>
Subject: Re: [v2] drm/msm/dpu: add support for dither block in display
To:     Doug Anderson <dianders@chromium.org>
Cc:     Kalyan Thota <kalyan_t@codeaurora.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Sean Paul <seanpaul@chromium.org>,
        "Kristian H. Kristensen" <hoegsberg@chromium.org>,
        mkrishn@codeaurora.org, travitej@codeaurora.org,
        nganji@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Yes, this is a big improvement for the display I have here. Thanks Kalyan.

Tested-by: Kristian H. Kristensen <hoegsberg@google.com>

On Thu, Jun 25, 2020 at 3:21 PM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Thu, Jun 25, 2020 at 5:17 AM Kalyan Thota <kalyan_t@codeaurora.org> wrote:
> >
> > This change enables dither block for primary interface
> > in display.
> >
> > Enabled for 6bpc in the current version.
> >
> > Changes in v1:
> >  - Remove redundant error checks (Rob).
> >
> > Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c     | 39 +++++++++++++++
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c | 63 +++++++++++++++++++++----
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h | 28 +++++++++++
> >  3 files changed, 121 insertions(+), 9 deletions(-)
>
> Tested-by: Douglas Anderson <dianders@chromium.org>
