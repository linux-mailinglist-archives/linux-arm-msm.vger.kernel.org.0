Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98A9121AD04
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2020 04:20:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726496AbgGJCUh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Jul 2020 22:20:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726444AbgGJCUh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Jul 2020 22:20:37 -0400
Received: from mail-vk1-xa44.google.com (mail-vk1-xa44.google.com [IPv6:2607:f8b0:4864:20::a44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D88F7C08C5CE
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2020 19:20:36 -0700 (PDT)
Received: by mail-vk1-xa44.google.com with SMTP id g22so900514vke.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2020 19:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4Hywc1x9A6pr0CRt+2NvKzTMAzPWDqqcQzWTAgr3WdA=;
        b=FqMpvwwCb9dpe7UBryM/EcOozRX1lwFdrdBzi6xzDnEKZh2OoMEtN2fjbqcDCUrTRA
         G/uqyZ8phkRmpHCnbtDwt4L9W1fAWzn3ef/hbpBNScSTumoNlfxcimfhrs002pQgYYMO
         C5wNeccogggNi/MBtl9XYVeMhj+5M8PkPDZAA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4Hywc1x9A6pr0CRt+2NvKzTMAzPWDqqcQzWTAgr3WdA=;
        b=ietlqzt8Hg9pXZeTMfPrEdF9XH5EzKPjUAEGuDE3HKwMCQNQ7fxkHVOwJVa6e+kmwt
         UlGBuhE4UYBT4HNbNKbVL+1FV/MySaDdqezwdG227cktJdUBUiUvPv+66oFHYGNFKrYo
         FM4JbGTQbKvoy71mpWpjjpeJ7e5JMPDeU+iJe42VZPjvm9kX1ZL34wx9A+h1+TsdGmqI
         6lFAEC5lTLyYVK36e7NbBQGPGc8a/gcqMSdZZPx0GI4vctcUzB9Nlg5kvMpPV99F2/m0
         3NPZchQjuBrDuKF7TUVR1WLA40nqtaYX/MAs7a2J/V0xyGANvAwIWt1cK66ank+h1WZl
         2xSQ==
X-Gm-Message-State: AOAM531ybeotEfbtT1X3baRSAdcTezrSvrCx2DRyj5f6+ZvYEW08G7SP
        mr2I6SG7Ih0+2jJBvSYWIInTSZviRjQ=
X-Google-Smtp-Source: ABdhPJzzCJ6XM/bdVWTCVpND+dy2q3KcbgB0BzeBdx4smTTPUxTh5DbZ7jW4llJkeXh24Ix0pvaqbg==
X-Received: by 2002:a1f:2ed4:: with SMTP id u203mr12130337vku.72.1594347635714;
        Thu, 09 Jul 2020 19:20:35 -0700 (PDT)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id v141sm713629vkd.9.2020.07.09.19.20.34
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2020 19:20:35 -0700 (PDT)
Received: by mail-ua1-f51.google.com with SMTP id g4so1348331uaq.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2020 19:20:34 -0700 (PDT)
X-Received: by 2002:ab0:6e8e:: with SMTP id b14mr54133636uav.0.1594347291225;
 Thu, 09 Jul 2020 19:14:51 -0700 (PDT)
MIME-Version: 1.0
References: <20191218143416.v3.6.Iaf8d698f4e5253d658ae283d2fd07268076a7c27@changeid>
 <20200710011935.GA7056@gentoo.org> <CAD=FV=X3oazamoKR1jHoXm-yCAp9208ahNd8y+NDPt1pU=5xRg@mail.gmail.com>
In-Reply-To: <CAD=FV=X3oazamoKR1jHoXm-yCAp9208ahNd8y+NDPt1pU=5xRg@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 9 Jul 2020 19:14:40 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UWQsGit6XMCzHn5cBRAC9nAaGReDyMzMM2Su02bfiPyQ@mail.gmail.com>
Message-ID: <CAD=FV=UWQsGit6XMCzHn5cBRAC9nAaGReDyMzMM2Su02bfiPyQ@mail.gmail.com>
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

On Thu, Jul 9, 2020 at 6:38 PM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Thu, Jul 9, 2020 at 6:19 PM Steev Klimaszewski <steev@gentoo.org> wrote:
> >
> > Hi Doug,
> >
> > I've been testing 5.8 and linux-next on the Lenovo Yoga C630, and with this patch applied, there is really bad banding on the display.
> >
> > I'm really bad at explaining it, but you can see the differences in the following:
> >
> > 24bit (pre-5.8) - https://dev.gentoo.org/~steev/files/image0.jpg
> >
> > 18bit (5.8/linux-next) - https://dev.gentoo.org/~steev/files/image1.jpg
>
> Presumably this means that your panel is defined improperly?  If the
> panel reports that it's a 6 bits per pixel panel but it's actually an
> 8 bits per pixel panel then you'll run into this problem.
>
> I would have to assume you have a bunch of out of tree patches to
> support your hardware since I don't see any device trees in linuxnext
> (other than cheza) that use this bridge chip.  Otherwise I could try
> to check and confirm that was the problem.

Ah, interesting.  Maybe you have the panel:

boe,nv133fhm-n61

As far as I can tell from the datasheet (I have the similar
boe,nv133fhm-n62) this is a 6bpp panel.  ...but if you feed it 8bpp
the banding goes away!  Maybe the panel itself knows how to dither???
...or maybe the datasheet / edid are wrong and this is actually an
8bpp panel.  Seems unlikely...

In any case, one fix is to pick
<https://lore.kernel.org/dri-devel/1593087419-903-1-git-send-email-kalyan_t@codeaurora.org/>,
though right now that patch is only enabled for sc7180.  Maybe you
could figure out how to apply it to your hardware?

...another fix would be to pretend that your panel is 8bpp even though
it's actually 6bpp.  Ironically if anyone ever tried to configure BPP
from the EDID they'd go back to 6bpp.  You can read the EDID of your
panel with this:

bus=$(i2cdetect -l | grep sn65 | sed 's/i2c-\([0-9]*\).*$/\1/')
i2cdump ${bus} 0x50 i

When I do that and then decode it on the "boe,nv133fhm-n62" panel, I find:

6 bits per primary color channel

-Doug
