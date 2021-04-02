Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F94B3530D8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Apr 2021 23:45:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235025AbhDBVpm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Apr 2021 17:45:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231149AbhDBVpm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Apr 2021 17:45:42 -0400
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com [IPv6:2607:f8b0:4864:20::72d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81ED5C0613E6
        for <linux-arm-msm@vger.kernel.org>; Fri,  2 Apr 2021 14:45:40 -0700 (PDT)
Received: by mail-qk1-x72d.google.com with SMTP id x11so6337785qkp.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Apr 2021 14:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=w/ZFqdPtGzDkqCBMP4OyjhCVZaJFf+dBQBfj22hpRiE=;
        b=fR/uwETGDlv7x2KneEGWioUh5GnHXl6COTEbAPvUEKXqSO6DcbFhq6GmsakFHFfQb1
         wliBhr4E8MsNOCDNkBhlQKCaO4VIM69RBeM5lAhTDxR2PyRbPdXlccDmkWf3i+hZ36ZY
         wDCOxhUkM9o0Ddesn2NSw1F02JXvkyONIIoMk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=w/ZFqdPtGzDkqCBMP4OyjhCVZaJFf+dBQBfj22hpRiE=;
        b=CuwF7RcvRSMH4x7YNv0sxCHJGLPUF+cmnBh2wD+QWQSDpsvvp9RC3gFQFF8yZ+08pI
         I2fBuTPS4a4usgHbL4kOcoMepzryejf0EGDO2JYvrOiFM7qZk7xTRhz4oVLW/NlROY0e
         GBiUIpseDa8sodWHIe3ZewrFJ0BnfhU87P+kVVbybqESYnfwAwFKUXbRDFtG2Dcpc2V4
         MtzxP72f7lqc+Z8tcljsC9/zLOLpbaTCXm75/6HR7voGGOt4QEIXESQWWHqqlLBXaUfH
         3GQRQxeEcSp+mVOwsqYiiuQ+4BEDD5Fk5dMCOPYx0FRBXSD/DykScwOgEeLiq8j2GYqe
         sxmQ==
X-Gm-Message-State: AOAM531PE02hX+Ml5ckfpX1tjyHUxQ25X+SrYl7bJvRmP6dDv0lk5gP8
        qUP5gePFBZu/CCUQ/2twV7LR8wTUm/hKpA==
X-Google-Smtp-Source: ABdhPJyNpr2aAZ+V7TT7nE7PQPswOrGzbhIqb5uj8D1cVZFVOh49WELbCiITQjy1POgBlp6Scr4+dw==
X-Received: by 2002:a37:a941:: with SMTP id s62mr15330063qke.404.1617399939633;
        Fri, 02 Apr 2021 14:45:39 -0700 (PDT)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com. [209.85.219.178])
        by smtp.gmail.com with ESMTPSA id j129sm8199257qkf.110.2021.04.02.14.45.38
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Apr 2021 14:45:39 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id j2so6301846ybj.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Apr 2021 14:45:38 -0700 (PDT)
X-Received: by 2002:a25:8712:: with SMTP id a18mr14891430ybl.79.1617399938583;
 Fri, 02 Apr 2021 14:45:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210402211226.875726-1-robdclark@gmail.com>
In-Reply-To: <20210402211226.875726-1-robdclark@gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 2 Apr 2021 14:45:27 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vm9CTmayrKjUoLNyObtQgejhBacvvP5aK5tFULmPWeNw@mail.gmail.com>
Message-ID: <CAD=FV=Vm9CTmayrKjUoLNyObtQgejhBacvvP5aK5tFULmPWeNw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm: Drop mm_lock in scan loop
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <freedreno@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Apr 2, 2021 at 2:08 PM Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> lock_stat + mmm_donut[1] say that this reduces contention on mm_lock
> significantly (~350x lower waittime-max, and ~100x lower waittime-avg)
>
> [1] https://chromium.googlesource.com/chromiumos/platform/microbenchmarks/+/refs/heads/main/mmm_donut.py
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/msm_drv.h          |  3 +-
>  drivers/gpu/drm/msm/msm_gem.c          |  2 +-
>  drivers/gpu/drm/msm/msm_gem_shrinker.c | 48 ++++++++++++++++++++++----
>  3 files changed, 45 insertions(+), 8 deletions(-)

Looks good to me now!

Reviewed-by: Douglas Anderson <dianders@chromium.org>
