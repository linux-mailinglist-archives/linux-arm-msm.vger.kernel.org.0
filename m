Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B7C021C4B3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2020 16:49:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728390AbgGKOtW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 11 Jul 2020 10:49:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728309AbgGKOtW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 11 Jul 2020 10:49:22 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5391DC08C5DD;
        Sat, 11 Jul 2020 07:49:21 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id a8so6962298edy.1;
        Sat, 11 Jul 2020 07:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4yR4ElxSmQKAvvG7liwNFfm8FLmxQ3u6hyl81BR6FRs=;
        b=mhfhaSL3VH3YP+HH2mKvyYUSrtIDiSMSbkJEOyyqXAslTAjfGZeerQMmzEafymvtux
         fBStxw9Qg808qFtgqSmdAqFPrenNhjg+/TgSpXMGX0wxCY+idvGpmXJqlnKBE+EYNvhC
         4oDt9xbpxGTL5jJIFqD/o1LYupXdWREzGUqBiR5j9MMc1WKs5UwGzP5NUYMygpVbDJqU
         NANb0Fv58gCoFICIEg740wlv3ITcSynGXaxuW/ZJ7SS98QGaPPWN4hwW3QwbLHDvmJQo
         CZ9iMvwKk83kgYOXVnuXiiQwgRVLDSYz7t+Xm92LFTO5gd0OWD1EDbwa2sSlAG7+0M3K
         /Svw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4yR4ElxSmQKAvvG7liwNFfm8FLmxQ3u6hyl81BR6FRs=;
        b=BZPFSdYxwNE3J1p7iNpDTuSpm0YTwVp7KUXLNvJfjy+KkJ+jEzR6hNrzBInw5t+P11
         lI9l675Tw+wkWX2gx3O72C9ukLYqVa1wZyo56UlqMWVBmb6R9jgWtX4hZrIeQLl09J7/
         /6T0x29AUKoJ73LbDYMkiaj3+jtvf5YG+bYCpXXxyVXFLaIrrbGVNvKnBo/JSRPNXGOc
         ZzDKSghMoeSb8Xu4J4MSLudJE5eS8odxzgDj5DHJp7M5toeBlCGhvVwOAmA3f6WtuOX2
         xa366upZ+PB1VcXozA9f1M3MdCp8aVTiKFVGnKSQEPjVEsy1wuVLud/wokYYPV1wXC3u
         UQ/Q==
X-Gm-Message-State: AOAM532JnGN5Iylnohx+3o98C25Wa7dIvkMACTtZCTV5KKCe9RNoT45V
        1UcSqynbheb9T7Or+Mi3v9iuNsBinTLjFtL2QwU=
X-Google-Smtp-Source: ABdhPJzAiuATMrQ3L3Wzx0z/E2edOMusL72tAS8Keix8xaYUMrn+jsnM9WeuOWdX2QI3hVGXp4039REikR5s1dmbWBE=
X-Received: by 2002:a05:6402:1250:: with SMTP id l16mr84267646edw.362.1594478960548;
 Sat, 11 Jul 2020 07:49:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200707203529.2098979-1-robdclark@gmail.com> <20200707203529.2098979-2-robdclark@gmail.com>
 <CACRpkdb0+V7AmvG0JXXETzayr4Q785OLhBWjU414tUJo1toJOQ@mail.gmail.com>
In-Reply-To: <CACRpkdb0+V7AmvG0JXXETzayr4Q785OLhBWjU414tUJo1toJOQ@mail.gmail.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Sat, 11 Jul 2020 07:49:52 -0700
Message-ID: <CAF6AEGu3_qYWGKVmc2VrMVzU35svgxTEVKAMpNUZfy_jZg3euQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/msm: sync generated headers
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Harigovindan P <harigovi@codeaurora.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        zhengbin <zhengbin13@huawei.com>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <freedreno@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Jul 11, 2020 at 4:49 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Tue, Jul 7, 2020 at 10:36 PM Rob Clark <robdclark@gmail.com> wrote:
>
> > From: Rob Clark <robdclark@chromium.org>
> >
> > We haven't sync'd for a while.. pull in updates to get definitions for
> > some fields in pkt7 payloads.
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
>
> Out of curiosity : where are the syncs coming from? Mesa?

sometimes indirectly.. but they are generated from:

  https://github.com/freedreno/envytools/tree/master/rnndb

The cmdstream and devcoredump decoding tools (which also use the xml)
are in the envytools tree as well.

We have a copy of the gpu side xml in mesa, where we generate the
headers at build time, but I guess doing that on the kernel side would
introduce some build time dependencies that others wouldn't
appreciate:

  https://gitlab.freedesktop.org/mesa/mesa/-/tree/master/src/freedreno/registers

Mesa already depends a lot on py generated headers, tables, etc.

BR,
-R

> Yours,
> Linus Walleij
