Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D7E121AC83
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2020 03:38:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726446AbgGJBis (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Jul 2020 21:38:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726433AbgGJBis (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Jul 2020 21:38:48 -0400
Received: from mail-ua1-x942.google.com (mail-ua1-x942.google.com [IPv6:2607:f8b0:4864:20::942])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AACFCC08C5DC
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2020 18:38:47 -0700 (PDT)
Received: by mail-ua1-x942.google.com with SMTP id j21so1326144ual.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2020 18:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rwZ3DYshMM6TxgS7HlmiJMG3O0eqLFDjVA0qiqONL9c=;
        b=kxMyTpnOoVqLAx06Eq/BG8dsTt2HetQM+osslhZwLZLc6qwsmlW+bGHiIJ4xrH96dS
         b8Z4AmXJ6eAlGURzDiRvOaW6caIuXF3dnOU9Me9Ji2G9SrPTWdoTpsd8DSYGzmMWDoCP
         9QKK+ffBMstJ7DjkzVsc4yRl/QNqfbFX9q+ZY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rwZ3DYshMM6TxgS7HlmiJMG3O0eqLFDjVA0qiqONL9c=;
        b=NngxFoRye4uB8qws7snkIJnFnAED38mDFhALBmfUV28C6TLzDY3sPZ9ZCfxJ8iYUog
         f9t57x3iTC0zluNjV/ADCQnMkWxwm8uKqGkEGZnAE+qrVU3w6hVCU1NglAi7QHYGUnGQ
         cUVXuerGk6snMUdRics+MwdKMcPx1bjTuLKOtjUoNR73kzXdlKUYbRPkpGk7RkAibE5Z
         vU7bOjYqU029jiz3m9bKxmfGmg9HRS/dZNsat9fdVG8YN5Jtidjdi+lm8CEVYxYypDLW
         BjKTXFAwqBvMTeJoKMPY69P3h3u6kdUCmdtM9Pg17HYS1/T2LInEtjwamIEPoWC3dXLf
         SPMw==
X-Gm-Message-State: AOAM531dVKlZIi5joJC98ZGAM7TgLY9YSNJDDYYurLArsqD9xSYKug9W
        +apkWyqY1x1NPgweCiujkcFMtaCm2CQ=
X-Google-Smtp-Source: ABdhPJzTxts4BDPGHBIKTgxeXMEy/z9MEXs9q8WrCg5glZrIqSIyPuHPJ2V8b+IT+INtekP+6cihJw==
X-Received: by 2002:a9f:320c:: with SMTP id x12mr12597169uad.45.1594345126329;
        Thu, 09 Jul 2020 18:38:46 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id i7sm528362vsi.10.2020.07.09.18.38.43
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2020 18:38:44 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id a17so2153526vsq.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2020 18:38:43 -0700 (PDT)
X-Received: by 2002:a67:e046:: with SMTP id n6mr20302730vsl.6.1594345122863;
 Thu, 09 Jul 2020 18:38:42 -0700 (PDT)
MIME-Version: 1.0
References: <20191218143416.v3.6.Iaf8d698f4e5253d658ae283d2fd07268076a7c27@changeid>
 <20200710011935.GA7056@gentoo.org>
In-Reply-To: <20200710011935.GA7056@gentoo.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 9 Jul 2020 18:38:31 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X3oazamoKR1jHoXm-yCAp9208ahNd8y+NDPt1pU=5xRg@mail.gmail.com>
Message-ID: <CAD=FV=X3oazamoKR1jHoXm-yCAp9208ahNd8y+NDPt1pU=5xRg@mail.gmail.com>
Subject: Re: [PATCH v3 6/9] drm/bridge: ti-sn65dsi86: Use 18-bit DP if we can
To:     steev@kali.org
Cc:     Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        David Airlie <airlied@linux.ie>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonas Karlman <jonas@kwiboo.se>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>,
        Sean Paul <seanpaul@chromium.org>,
        Steev Klimaszewski <steev@gentoo.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Jul 9, 2020 at 6:19 PM Steev Klimaszewski <steev@gentoo.org> wrote:
>
> Hi Doug,
>
> I've been testing 5.8 and linux-next on the Lenovo Yoga C630, and with this patch applied, there is really bad banding on the display.
>
> I'm really bad at explaining it, but you can see the differences in the following:
>
> 24bit (pre-5.8) - https://dev.gentoo.org/~steev/files/image0.jpg
>
> 18bit (5.8/linux-next) - https://dev.gentoo.org/~steev/files/image1.jpg

Presumably this means that your panel is defined improperly?  If the
panel reports that it's a 6 bits per pixel panel but it's actually an
8 bits per pixel panel then you'll run into this problem.

I would have to assume you have a bunch of out of tree patches to
support your hardware since I don't see any device trees in linuxnext
(other than cheza) that use this bridge chip.  Otherwise I could try
to check and confirm that was the problem.

-Doug
