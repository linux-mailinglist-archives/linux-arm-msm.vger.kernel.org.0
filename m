Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A00FD38F0EB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 May 2021 18:08:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236576AbhEXQGw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 May 2021 12:06:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236856AbhEXQEj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 May 2021 12:04:39 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B705C026BD9
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 May 2021 08:15:23 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id x18so16772860pfi.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 May 2021 08:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2hiXKO119GSaKQpX+psN+usfMuDJQ/GOJx+xCi36V10=;
        b=U/Ic0oyql6VSf1zMHtEy4mFLp+v9j8wB4h0j/Vp8yHCVYnaly6d7tpSDvlo8G1uHBG
         onMLvowml45t3Phb7Bu7NbF6vxIoTKOpA8zY6VOsOpeZPNaRe3LNzlYisU6IV8eLRjaT
         +IRU0yWNE2MZiNO9ukMoaEt1eOKN9HLESVPHk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2hiXKO119GSaKQpX+psN+usfMuDJQ/GOJx+xCi36V10=;
        b=MygWTQFFztuWEUFlSjJoZ+NKryREwRfLorYSLYMGQetjBAEalLysCac/fowTI5ewUk
         Ff7vH+ANGXTFG0nMHMLGrHQ95PDB/sVJ9TC3uPFUiEJpUrugcUO2taAMnk6iYeBs3//h
         MjXfyWqYc8mmBFnd84qA2cpEyuCfTUoPzdkrio76/MZ1itl4e+jYKV/6J/OTKdFomA7v
         wOKo6EdZYE4NPYQiQyue/xy0e6ceOI/5xQzY65wYV28z7NxJRoEM4za+zDtVWoPIJFzh
         7SUp0Ig6WI2Wdj2ctRRxc7jE2Q2+MKnYfmjTXpWvmHXWqagYCHxiWwuP1ItAuWs/jpFQ
         ouhw==
X-Gm-Message-State: AOAM5329HEaAJ2Eik8dYvKEuAgHx2pU6o2PiHvf3ONcDn1xx1NBOd0et
        PGSzV7J/HFfHZdsP59BpdrRAthhr1+pGfw==
X-Google-Smtp-Source: ABdhPJx0PsTs3IUNYWr5w8+0jzDP6ak7VDnDBWPWIldDVCLpjFiUJIIHEtOXhBgC3Fy+L7yCeJhlmA==
X-Received: by 2002:a62:2a14:0:b029:263:20c5:6d8c with SMTP id q20-20020a622a140000b029026320c56d8cmr25346085pfq.23.1621869322274;
        Mon, 24 May 2021 08:15:22 -0700 (PDT)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com. [209.85.216.43])
        by smtp.gmail.com with ESMTPSA id j17sm11055276pff.77.2021.05.24.08.15.22
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 May 2021 08:15:22 -0700 (PDT)
Received: by mail-pj1-f43.google.com with SMTP id cu11-20020a17090afa8bb029015d5d5d2175so11402531pjb.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 May 2021 08:15:22 -0700 (PDT)
X-Received: by 2002:a05:6102:3239:: with SMTP id x25mr21095761vsf.47.1621869311242;
 Mon, 24 May 2021 08:15:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210517200907.1459182-1-dianders@chromium.org> <2536404ca2ab0e7b785a104ec6b4efb48943a438.camel@redhat.com>
In-Reply-To: <2536404ca2ab0e7b785a104ec6b4efb48943a438.camel@redhat.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 24 May 2021 08:14:59 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WqM6fTuk3g4Rt9D+Fn=P1aUQwM3Cjz-K2BXurMB2AQ5A@mail.gmail.com>
Message-ID: <CAD=FV=WqM6fTuk3g4Rt9D+Fn=P1aUQwM3Cjz-K2BXurMB2AQ5A@mail.gmail.com>
Subject: Re: [PATCH v7 00/10] drm: Fix EDID reading on ti-sn65dsi86 by
 introducing the DP AUX bus
To:     Lyude Paul <lyude@redhat.com>
Cc:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Sam Ravnborg <sam@ravnborg.org>,
        Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
        Thierry Reding <treding@nvidia.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Linus W <linus.walleij@linaro.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Rob Clark <robdclark@chromium.org>,
        Steev Klimaszewski <steev@kali.org>,
        Andy Gross <agross@kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Maxime Ripard <mripard@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Robert Foss <robert.foss@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, May 21, 2021 at 4:07 PM Lyude Paul <lyude@redhat.com> wrote:
>
> For patches 5, and 6:
>
> Reviewed-by: Lyude Paul <lyude@redhat.com>
>
> This week got really busy so I wasn't able to look at the rest of them, but next
> week is going to be a lot less busy so I should be able to look at them then

Thanks for your review on the two patches and for letting me know your
plans. I know that I still need to spin the bindings patches with Rob
Herring's feedback, but I won't do that until I know you're done
reviewing just to avoid spamming everyone an extra time. Assuming no
emergency comes around and slams me, I should be able to react/respond
fairly quickly this week M-Th, though I'm taking Friday off.

BTW: if anyone reading this happens to have 10 minutes, I'd sorta like
to get patch #1 in this series landed sooner rather than later and
it's a dead-simple fix. If I see a review of that one, I'll apply it
to drm-misc before sending out the next version of the series. ;-)

-Doug
