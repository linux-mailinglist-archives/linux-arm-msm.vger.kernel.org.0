Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 432933BAE3F
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Jul 2021 20:14:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229672AbhGDSQd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 4 Jul 2021 14:16:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229645AbhGDSQd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 4 Jul 2021 14:16:33 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CA74C061574;
        Sun,  4 Jul 2021 11:13:57 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id u8so19165754wrq.8;
        Sun, 04 Jul 2021 11:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Y6S2/wsZZvCto6OggBe0r+M5LCBVH1Exsptmfkk/eec=;
        b=MdqBKo3IYnVfJYh3IDgykU7wNifd7Z2JuffeMXN6HNu+Q3bof0QfSCr1OQy92UJUQ1
         LwBt45JYJ2DbnR4cZQze0yFKvW3yFd8IAvXEEMVjE8mJ5VqJpIuTKskkvcgGR6GNJTOc
         iT9pi3a7Mzu34NMaubZSrNUG7h2FBqwAUAn14aBsqhCjVUAJMRjWy01i5YnYTpuG8fst
         8ngf5CN2dl83RG2anh71unWCgqAgX35KZyQ1cX8Ps2vKFrBTOdD2sxR60DT6HwmlHCmJ
         hydyfJmchATFqwoqbhy33uxiVvNtZgzPo7sEHomgf++wMr8RxF5Syd3FGtVUxFfOzEY0
         PGsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Y6S2/wsZZvCto6OggBe0r+M5LCBVH1Exsptmfkk/eec=;
        b=ZEJL8bG1b/yEaofkEoy6ztaaTBOIBtoleoNFcC7xsVeViUNndbT0vOjQg8zZrwJbWV
         sisttBYUNbNd/8AQLxFt7I/8W8G9aPWmcB7XwFioTIL/UeM2BQItydsOzJGBQigdLMSR
         K9Rxsg+Im8jQrmcxlG8BGNm6rEUeqll6nqrk1fiQJEa6fsdLZ/KSZS3as5fyXkklgJ46
         R4nqQRMHFg4B6+wVudDUw4vIkkcZY4k7h9uFzo0M13mSAPLgugz72+6Dk2SltB0XGTDS
         Mqrgcrj0EcuVNJYbN6y5lWBxuhiwGal3tl2fo9FxBaFfQhHtNDA1HR7dx1AayjM8DDkJ
         ctxg==
X-Gm-Message-State: AOAM531zqQ87FmxZqrmy9i/Ge69Dy9nbljSPVNn8TcW1WaPyjGZyKnQX
        Y0sbtTo7QG5kfHBwArrPeBbs16VluLagSNzmROg=
X-Google-Smtp-Source: ABdhPJw9nU5SAZWiLf1A5FaSPUAJd1PIz3WPubDGpEHQ0/GfCnN2Trp06uS8baSrMF3YcxOya43XulJVfx4RjuI4Dyc=
X-Received: by 2002:adf:eb43:: with SMTP id u3mr11318754wrn.83.1625422435770;
 Sun, 04 Jul 2021 11:13:55 -0700 (PDT)
MIME-Version: 1.0
References: <1625311962-14185-1-git-send-email-kalyan_t@codeaurora.org> <5dcd850a-280c-c356-32e5-35a4fe089f4e@linaro.org>
In-Reply-To: <5dcd850a-280c-c356-32e5-35a4fe089f4e@linaro.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Sun, 4 Jul 2021 11:17:57 -0700
Message-ID: <CAF6AEGvhu9a5yigu-HZZjHuD34i_DyjC8kteYgh73POeS02xcQ@mail.gmail.com>
Subject: Re: [RFC] Inline rotation support in dpu driver
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Kalyan Thota <kalyan_t@codeaurora.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Krishna Manikandan <mkrishn@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Jul 4, 2021 at 1:25 AM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On 03/07/2021 14:32, Kalyan Thota wrote:
> > This change adds support for inline rotation in the dpu driver.
> > When inline rotation is enabled the VIG pipes will directly fetch the image
> > from memory in a rotated fashion
> >
> > Inline rotation has following restrictions
> > 1) Supported only with compressed formats
>
> NV12, which is the only format you declare, is not compressed.

nv12 can be used with the UBWC modifier, fwiw.. we use this in CrOS,
albeit with a hack on the v4l2 side to work around lack of modifier
support in v4l2

BR,
-R

> > 2) max pre rotated height is 1088
> > 3) restrictions with downscaling ratio
> >
> > Queries:
> >
> > 1) Since inline rotation works for fewer pixel formats with specific modifier, how can we provide this information to the compositor so that
> > chrome compositor can choose between overlaying or falling back to GPU. In the patch it fails in the atomic check.
> >
> > 2) If a display composition fails in atomic check due to any of the restrictions in overlays
> > can chrome compositor switch it back to the GPU and re trigger the commit ?
> >
> > posting it as RFC as validation is not complete, please share early comments on this.
> >
> > Kalyan Thota (1):
> >    drm/msm/disp/dpu1: add support for inline rotation in dpu driver
> >
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 47 +++++++++----
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 20 ++++++
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c      | 93 ++++++++++++++++++++------
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h      |  2 +
> >   4 files changed, 128 insertions(+), 34 deletions(-)
> >
>
>
> --
> With best wishes
> Dmitry
