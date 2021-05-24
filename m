Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 546A938F4BA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 May 2021 23:09:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233294AbhEXVKk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 May 2021 17:10:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233267AbhEXVKk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 May 2021 17:10:40 -0400
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com [IPv6:2607:f8b0:4864:20::72e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D365DC061756
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 May 2021 14:09:09 -0700 (PDT)
Received: by mail-qk1-x72e.google.com with SMTP id v8so28435143qkv.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 May 2021 14:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Cb0Uq1HaIEgENxGmHlcF9aKNMAXuk7VxGUnLZxEoKmU=;
        b=ntnzKyxJBJ7zU41VapDr35r0+JiHT8LcMIOT1SR4I6dP7Nrl9EK73MZQzrTWVv2G/a
         TvLKeWmsqGVaLQw7mwVv23fZ6u/EttxAw0FagUfXUq1zL12KWaqXnLByBCoKE5F7om18
         zGL5EynggjpTSTpu9EBvXFi+MSf3PrIlYRTSY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Cb0Uq1HaIEgENxGmHlcF9aKNMAXuk7VxGUnLZxEoKmU=;
        b=Iyr0fMDEjkZCJNP4fdVz2tGSXesU/1TdZApiQTWSqEv9qAXKwF1FmoEa9UAnRdxJzq
         BENW6PJK5+a0dvNOf9TvUFI7JQChrahBr/LoXcm52QRZ0zc5oN53tNbtnk1DsdshmsHP
         bdUeWMqfkD6vjF1NGLoKfyiU7VknPVyum0DMkC6FfkYsikrtgSq7qKs/sTMvXNOLGS0Q
         2FsAt3JUc1v8FtiYxT2jxCfj6ggzCQoYhjzxWQuCGAFHJQCcLIYYVb6LXr7QuhYy/iZ3
         f0hna/N49MUdpVM0/2pTRZub9eFOSIvnpTUbQ2pJBiJ0GiXn4Y9vNJN/6APuq87ucMog
         lh7w==
X-Gm-Message-State: AOAM532rVXpxdODoQzRT0BTy3R1n2SGHOTTtv7031jtF/CTw9nuqmjut
        d53to9YNat69h/dJDrioOvCRtQC3WnIbIw==
X-Google-Smtp-Source: ABdhPJxhCG3stcmcbor+5lY7uViTAUSqKnC3rKEC4I+MYyhQnVUSHrI2IAdw23cY0XPeG8MCwZ4hkQ==
X-Received: by 2002:a37:789:: with SMTP id 131mr31537941qkh.130.1621890548508;
        Mon, 24 May 2021 14:09:08 -0700 (PDT)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com. [209.85.219.175])
        by smtp.gmail.com with ESMTPSA id s20sm11870289qke.2.2021.05.24.14.09.07
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 May 2021 14:09:07 -0700 (PDT)
Received: by mail-yb1-f175.google.com with SMTP id o18so2307189ybc.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 May 2021 14:09:07 -0700 (PDT)
X-Received: by 2002:a25:b801:: with SMTP id v1mr2108952ybj.32.1621890546699;
 Mon, 24 May 2021 14:09:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210517200907.1459182-1-dianders@chromium.org>
 <20210517130450.v7.1.I9e947183e95c9bd067c9c1d51208ac6a96385139@changeid> <YKwK+lkcHMwAosLn@pendragon.ideasonboard.com>
In-Reply-To: <YKwK+lkcHMwAosLn@pendragon.ideasonboard.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 24 May 2021 14:08:53 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VnJB_6PMo3FQt8djYDD7h0s=sc9TAbKLQMe-y+43Z3NQ@mail.gmail.com>
Message-ID: <CAD=FV=VnJB_6PMo3FQt8djYDD7h0s=sc9TAbKLQMe-y+43Z3NQ@mail.gmail.com>
Subject: Re: [PATCH v7 01/10] drm/panel: panel-simple: Add missing
 pm_runtime_dont_use_autosuspend() calls
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Sam Ravnborg <sam@ravnborg.org>,
        Rob Clark <robdclark@chromium.org>,
        David Airlie <airlied@linux.ie>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Steev Klimaszewski <steev@kali.org>,
        Thierry Reding <treding@nvidia.com>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, May 24, 2021 at 1:22 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Doug,
>
> Thank you for the patch.
>
> On Mon, May 17, 2021 at 01:08:58PM -0700, Douglas Anderson wrote:
> > The PM Runtime docs specifically call out the need to call
> > pm_runtime_dont_use_autosuspend() in the remove() callback if
> > pm_runtime_use_autosuspend() was called in probe():
> >
> > > Drivers in ->remove() callback should undo the runtime PM changes done
> > > in ->probe(). Usually this means calling pm_runtime_disable(),
> > > pm_runtime_dont_use_autosuspend() etc.
>
> ~/src/kernel/linux $ git grep pm_runtime_use_autosuspend -- drivers | wc -l
> 209
> ~/src/kernel/linux $ git grep pm_runtime_dont_use_autosuspend -- drivers | wc -l
> 80
>
> Seems like a lost battle :-(
>
> The fix is right, but I wonder if this shouldn't be handled
> automatically by the runtime PM core. The runtime PM API is notoriously
> difficult to use correctly.

No kidding.


> > We should do this. This fixes a warning splat that I saw when I was
> > testing out the panel-simple's remove().
> >
> > Fixes: 3235b0f20a0a ("drm/panel: panel-simple: Use runtime pm to avoid excessive unprepare / prepare")
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks! I have pushed just this patch for now.

-Doug
