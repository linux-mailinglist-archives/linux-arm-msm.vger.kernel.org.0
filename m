Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1AC79123C2E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2019 02:02:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726143AbfLRBCO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Dec 2019 20:02:14 -0500
Received: from mail-il1-f196.google.com ([209.85.166.196]:37798 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725940AbfLRBCO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Dec 2019 20:02:14 -0500
Received: by mail-il1-f196.google.com with SMTP id t8so209602iln.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Dec 2019 17:02:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4cKjTtuJ6Cl3BPkbORmbBVCSJ2Mx93CiWQ5Web+aZoo=;
        b=Ehbk3QqUh5bTHL9JWhwrStjM1T3/LkM1Kqv+zwWwwk6M/oBy9gNn8PJ2yhBeubKtqw
         eA4bTbmTus7J2LmfuinU86pawGesMIrNtGwKCU1jkvSXjjAkSBccuRyP6ktvcVlBET3y
         RsGdJaHIJjTrGFAjMBY6t7gqFXFQbI1WCoBrY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4cKjTtuJ6Cl3BPkbORmbBVCSJ2Mx93CiWQ5Web+aZoo=;
        b=WRzhKgMahA68u7kG6kmOK+FGlDbmsyDMZz69dvMjUn07VsOBqD/lcekok/sk04SITv
         O2ScJY6TRU2m3cUJKl+nPif7U0nR+b4h1jSvKv87j86JUjLdBrRkfWPkOA9AWIm+J9I/
         jlBNquuqoPoOYdIl2BRXhzgc3Wq03sAj9PLVLk93tsF5PeEwrCOXjVVGAg2qAyQ192b3
         tN7WVmLhQkmhPCZrUGK+CRkpMa1P9rsIb7NWSvESH4heO/bkneONgAZfAgbIao0/M5MJ
         VYg4aY/5k2XYcIwWwXYGlFl+9F6WCrrmwU8IXAUKoC8/DypSx6gnNyREVYf/vrC0IHle
         lOTw==
X-Gm-Message-State: APjAAAUq4r33PbKH4FxzPpsbZNuWCEbVjrDV7KLBJ/gUc5hST2NruGQ4
        9rCfNUOzz/87CbAFhDPirCr98iMq5fA=
X-Google-Smtp-Source: APXvYqyJgsuN5o+SvwsYs/swk4x9iF2BedSKOof6K7vlcPq2+MX95+mR13RnRUapfCuXLz238m1PSg==
X-Received: by 2002:a92:46d4:: with SMTP id d81mr673418ilk.24.1576630933444;
        Tue, 17 Dec 2019 17:02:13 -0800 (PST)
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com. [209.85.166.173])
        by smtp.gmail.com with ESMTPSA id f15sm108595ioj.26.2019.12.17.17.02.13
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Dec 2019 17:02:13 -0800 (PST)
Received: by mail-il1-f173.google.com with SMTP id t17so172422ilm.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Dec 2019 17:02:13 -0800 (PST)
X-Received: by 2002:a92:cc90:: with SMTP id x16mr224285ilo.269.1576630494768;
 Tue, 17 Dec 2019 16:54:54 -0800 (PST)
MIME-Version: 1.0
References: <20191213154448.9.I1791f91dd22894da04f86699a7507d101d4385bc@changeid>
 <20191215200632.1019065-1-robdclark@gmail.com>
In-Reply-To: <20191215200632.1019065-1-robdclark@gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 17 Dec 2019 16:54:42 -0800
X-Gmail-Original-Message-ID: <CAD=FV=U7PXe7n3Q+k6ZWvkUeCRA8Esdyc6C39078=N_7D+BCXA@mail.gmail.com>
Message-ID: <CAD=FV=U7PXe7n3Q+k6ZWvkUeCRA8Esdyc6C39078=N_7D+BCXA@mail.gmail.com>
Subject: Re: [PATCH 2/2] fixup! drm/bridge: ti-sn65dsi86: Skip non-standard DP rates
To:     Rob Clark <robdclark@gmail.com>
Cc:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Rob Clark <robdclark@chromium.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonas Karlman <jonas@kwiboo.se>,
        David Airlie <airlied@linux.ie>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sean Paul <seanpaul@chromium.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Sun, Dec 15, 2019 at 12:06 PM Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> ---
> Note however, the panel I have on the yoga c630 is not eDP 1.4+, so I
> cannot test that path.  But I think it looks correct.
>
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 110 +++++++++++++++++++++-----
>  1 file changed, 89 insertions(+), 21 deletions(-)

I ended up basing patch #9 in my v2 series slightly more on Jeffrey's
patch.  Hopefully it looks OK.

I don't have any eDP 1.4 panels either, so hopefully it's all good there...

-Doug
