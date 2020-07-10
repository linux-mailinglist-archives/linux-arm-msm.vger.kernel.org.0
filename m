Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C55C121ADCA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2020 06:12:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726756AbgGJEMX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Jul 2020 00:12:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726391AbgGJEMW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Jul 2020 00:12:22 -0400
Received: from mail-ua1-x943.google.com (mail-ua1-x943.google.com [IPv6:2607:f8b0:4864:20::943])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C31EC08C5CE
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2020 21:12:21 -0700 (PDT)
Received: by mail-ua1-x943.google.com with SMTP id h18so1414182uao.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2020 21:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xFtqd/2QNLLRFKTwkoyRLlBqWZF8TYezgrp3LmAuB5w=;
        b=HYGsk6XQv7pKew7gvxg4OvE+OHnsBXXsbjk0fQFUW6L2EyTcSa8qFi7fRWcUERDxTX
         8Z2sQokRGj+KwAKYsjt7YgG+IBPD6QQcd9wNwoBvG8MYSM2aLyYuLbN4oSLYc3VodSB6
         zSlflC98ztn0yQ23AeKmcZXyMg1lPljk+9kzg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xFtqd/2QNLLRFKTwkoyRLlBqWZF8TYezgrp3LmAuB5w=;
        b=nKDsQZBM8e5Yb1FsPepyc5Jobza+/0j0k0mlb7zprSROejPx6uejWSn4x8RPy8AbG8
         oW7NRx6zm71BOIylebZICjBF9Qw5PRSQEiTCKk4e37yinD1NHZ5Dw2Oe8owqm/L+oxvj
         VwlRWb5vAg3yMlDQW9lINserfUQQWwsxYIQ3AS3niP+FSRqtYl/CRZ6iRmTEMYBn8l4c
         dtUVSQMBz4KPH5VebsUIixNiB51XEYE93wlk3wkleTzkA0YYAGL+0PH184VKYXHSB4Nb
         paZykhoJN/wH2jp5eqou8EkOwmLIx3a5Nvlwfxsauwoi9M+qaZ358sNLkqijzdL49nCt
         KATg==
X-Gm-Message-State: AOAM533XoWvyKMpXUJm2C6+yZJ4stC16W1bVZP8F+jU/iZyo2RgOtE3N
        bFC/lA7qZPeGfvegJiiuBb4WbRit59Y=
X-Google-Smtp-Source: ABdhPJznZA3bEvuNiTzB3P7wdwaOUyM95ZLWJ2h3qTzFQPUaozQ4VvW/GuDw4uONCE8ak6rEPOB62A==
X-Received: by 2002:ab0:6618:: with SMTP id r24mr38435709uam.32.1594354340075;
        Thu, 09 Jul 2020 21:12:20 -0700 (PDT)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com. [209.85.221.174])
        by smtp.gmail.com with ESMTPSA id x201sm609398vsc.27.2020.07.09.21.12.18
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2020 21:12:19 -0700 (PDT)
Received: by mail-vk1-f174.google.com with SMTP id v26so948209vkn.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2020 21:12:18 -0700 (PDT)
X-Received: by 2002:a1f:9d57:: with SMTP id g84mr24862294vke.100.1594354337635;
 Thu, 09 Jul 2020 21:12:17 -0700 (PDT)
MIME-Version: 1.0
References: <20191218143416.v3.6.Iaf8d698f4e5253d658ae283d2fd07268076a7c27@changeid>
 <20200710011935.GA7056@gentoo.org> <CAD=FV=X3oazamoKR1jHoXm-yCAp9208ahNd8y+NDPt1pU=5xRg@mail.gmail.com>
 <CAD=FV=UWQsGit6XMCzHn5cBRAC9nAaGReDyMzMM2Su02bfiPyQ@mail.gmail.com>
 <dc786abb-4bc2-2416-7ee5-de408aceb8f1@kali.org> <e0702671-3bed-9e3d-c7f4-d050c617eb65@kali.org>
 <bc795659-7dd6-c667-1c93-4331510ecfbc@kali.org>
In-Reply-To: <bc795659-7dd6-c667-1c93-4331510ecfbc@kali.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 9 Jul 2020 21:12:06 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VC+RP8WfS-yuc65WRN2KokNbAs-F3UdQtQoZjcMMSNFA@mail.gmail.com>
Message-ID: <CAD=FV=VC+RP8WfS-yuc65WRN2KokNbAs-F3UdQtQoZjcMMSNFA@mail.gmail.com>
Subject: Re: [PATCH v3 6/9] drm/bridge: ti-sn65dsi86: Use 18-bit DP if we can
To:     Steev Klimaszewski <steev@kali.org>
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

On Thu, Jul 9, 2020 at 8:43 PM Steev Klimaszewski <steev@kali.org> wrote:
>
>
> On 7/9/20 10:17 PM, Steev Klimaszewski wrote:
> >
> > On 7/9/20 10:12 PM, Steev Klimaszewski wrote:
> >>
> >> On 7/9/20 9:14 PM, Doug Anderson wrote:
> >>> Hi,
> >>>
> >>> On Thu, Jul 9, 2020 at 6:38 PM Doug Anderson <dianders@chromium.org>
> >>> wrote:
> >>>> Hi,
> >>>>
> >>>> On Thu, Jul 9, 2020 at 6:19 PM Steev Klimaszewski
> >>>> <steev@gentoo.org> wrote:
> >>>>> Hi Doug,
> >>>>>
> >>>>> I've been testing 5.8 and linux-next on the Lenovo Yoga C630, and
> >>>>> with this patch applied, there is really bad banding on the display.
> >>>>>
> >>>>> I'm really bad at explaining it, but you can see the differences
> >>>>> in the following:
> >>>>>
> >>>>> 24bit (pre-5.8) - https://dev.gentoo.org/~steev/files/image0.jpg
> >>>>>
> >>>>> 18bit (5.8/linux-next) -
> >>>>> https://dev.gentoo.org/~steev/files/image1.jpg
> >>>> Presumably this means that your panel is defined improperly? If the
> >>>> panel reports that it's a 6 bits per pixel panel but it's actually an
> >>>> 8 bits per pixel panel then you'll run into this problem.
> >>>>
> >>>> I would have to assume you have a bunch of out of tree patches to
> >>>> support your hardware since I don't see any device trees in linuxnext
> >>>> (other than cheza) that use this bridge chip.  Otherwise I could try
> >>>> to check and confirm that was the problem.
> >>> Ah, interesting.  Maybe you have the panel:
> >>>
> >>> boe,nv133fhm-n61
> >>>
> >>> As far as I can tell from the datasheet (I have the similar
> >>> boe,nv133fhm-n62) this is a 6bpp panel.  ...but if you feed it 8bpp
> >>> the banding goes away!  Maybe the panel itself knows how to dither???
> >>> ...or maybe the datasheet / edid are wrong and this is actually an
> >>> 8bpp panel.  Seems unlikely...
> >>>
> >>> In any case, one fix is to pick
> >>> <https://lore.kernel.org/dri-devel/1593087419-903-1-git-send-email-kalyan_t@codeaurora.org/>,
> >>>
> >>> though right now that patch is only enabled for sc7180.  Maybe you
> >>> could figure out how to apply it to your hardware?
> >>>
> >>> ...another fix would be to pretend that your panel is 8bpp even though
> >>> it's actually 6bpp.  Ironically if anyone ever tried to configure BPP
> >>> from the EDID they'd go back to 6bpp.  You can read the EDID of your
> >>> panel with this:
> >>>
> >>> bus=$(i2cdetect -l | grep sn65 | sed 's/i2c-\([0-9]*\).*$/\1/')
> >>> i2cdump ${bus} 0x50 i
> >>>
> >>> When I do that and then decode it on the "boe,nv133fhm-n62" panel, I
> >>> find:
> >>>
> >>> 6 bits per primary color channel
> >>>
> >>> -Doug
> >>
> >>
> >> Hi Doug,
> >>
> >> Decoding it does show be to boe,nv133fhm-n61 - and yeah it does say
> >> it's 6-bit according to panelook's specs for it.
>
>
> I derped again...
>
> root@c630:~# bus=$(i2cdetect -l | grep sn65 | sed 's/i2c-\([0-9]*\).*$/\1/')
> root@c630:~# i2cdump ${bus} 0x50 i > edid
> WARNING! This program can confuse your I2C bus, cause data loss and worse!
> I will probe file /dev/i2c-16, address 0x50, mode i2c block
> Continue? [Y/n]
> root@c630:~# edid-decode edid
> edid-decode (hex):
>
> 00 ff ff ff ff ff ff 00 09 e5 d1 07 00 00 00 00
> 01 1c 01 04 a5 1d 11 78 0a 1d b0 a6 58 54 9e 26
> 0f 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 c0 39 80 18 71 38 28 40 30 20
> 36 00 26 a5 10 00 00 1a 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 1a 00 00 00 fe 00 42
> 4f 45 20 43 51 0a 20 20 20 20 20 20 00 00 00 fe
> 00 4e 56 31 33 33 46 48 4d 2d 4e 36 31 0a 00 9a
>
> 03 26 0a 77 ab 1c 05 71 6f 1d 8c f1 43 ce 6a bb
> fb d3 11 20 39 07 22 6e 65 68 77 70 d3 05 34 73
> 44 21 8b fd f5 6d 11 62 94 2a 7c fa 93 ba 6a 61
> 92 da 15 53 4c 39 eb f7 86 23 97 48 e9 39 09 d2
> 66 02 70 bb e2 77 0f 4a a3 a0 4c 72 6e 5d 47 70
> 43 c2 13 f3 b2 d9 b9 78 02 be 41 82 15 6a 28 dc
> 45 0f 9d eb 0f 2a cc e8 35 8d 34 7f 3e 84 5e a3
> 30 5e 1e 29 0a 48 0c d1 0a c4 08 31 03 a9 3b 29
>
> ----------------
>
> EDID version: 1.4
> Manufacturer: BOE Model 2001 Serial Number 0
> Made in week 1 of 2018
> Digital display
> 8 bits per primary color channel
> DisplayPort interface
> Maximum image size: 29 cm x 17 cm
> Gamma: 2.20
> Supported color formats: RGB 4:4:4, YCrCb 4:4:4
> First detailed timing includes the native pixel format and preferred
> refresh rate
> Color Characteristics
>    Red:   0.6484, 0.3447
>    Green: 0.3310, 0.6181
>    Blue:  0.1503, 0.0615
>    White: 0.3125, 0.3281
> Established Timings I & II: none
> Standard Timings: none
> Detailed mode: Clock 147.840 MHz, 294 mm x 165 mm
>                 1920 1968 2000 2200 ( 48  32 200)
>                 1080 1083 1089 1120 (  3   6  31)
>                 +hsync -vsync
>                 VertFreq: 60.000 Hz, HorFreq: 67.200 kHz
> Manufacturer-Specified Display Descriptor (0x00): 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 1a  ................
> Alphanumeric Data String: BOE CQ
> Alphanumeric Data String: NV133FHM-N61
> Checksum: 0x9a
>
> ----------------
>
> Unknown EDID Extension Block 0x03
>    03 26 0a 77 ab 1c 05 71 6f 1d 8c f1 43 ce 6a bb .&.w...qo...C.j.
>    fb d3 11 20 39 07 22 6e 65 68 77 70 d3 05 34 73  ... 9."nehwp..4s
>    44 21 8b fd f5 6d 11 62 94 2a 7c fa 93 ba 6a 61 D!...m.b.*|...ja
>    92 da 15 53 4c 39 eb f7 86 23 97 48 e9 39 09 d2 ...SL9...#.H.9..
>    66 02 70 bb e2 77 0f 4a a3 a0 4c 72 6e 5d 47 70 f.p..w.J..Lrn]Gp
>    43 c2 13 f3 b2 d9 b9 78 02 be 41 82 15 6a 28 dc C......x..A..j(.
>    45 0f 9d eb 0f 2a cc e8 35 8d 34 7f 3e 84 5e a3 E....*..5.4.>.^.
>    30 5e 1e 29 0a 48 0c d1 0a c4 08 31 03 a9 3b 29 0^.).H.....1..;)
> Checksum: 0x29 (should be 0x82)
>
>
> - My edid does in fact say it's 8bit

Crazy!  Mine:

Extracted contents:
header:          00 ff ff ff ff ff ff 00
serial number:   09 e5 2d 08 00 00 00 00 23 1c
version:         01 04
basic params:    95 1d 11 78 02
chroma info:     d5 00 a6 58 54 9f 27 0f 4f 57
established:     00 00 00
standard:        01 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01
descriptor 1:    c0 39 80 18 71 38 28 40 30 20 36 00 26 a5 10 00 00 1a
descriptor 2:    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
descriptor 3:    00 00 00 fe 00 42 4f 45 20 43 51 0a 20 20 20 20 20 20
descriptor 4:    00 00 00 fe 00 4e 56 31 33 33 46 48 4d 2d 4e 36 32 0a
extensions:      00
checksum:        40

Manufacturer: BOE Model 82d Serial Number 0
Made week 35 of 2018
EDID version: 1.4
Digital display
6 bits per primary color channel
DisplayPort interface
Maximum image size: 29 cm x 17 cm
Gamma: 2.20
Supported color formats: RGB 4:4:4
First detailed timing is preferred timing
Established timings supported:
Standard timings supported:
Detailed mode: Clock 147.840 MHz, 294 mm x 165 mm
               1920 1968 2000 2200 hborder 0
               1080 1083 1089 1120 vborder 0
               +hsync -vsync
Manufacturer-specified data, tag 0
ASCII string: BOE
ASCII string: NV133FHM-N62
Checksum: 0x40 (valid)

Unknown extension block

EDID block does NOT conform to EDID 1.3!
        Missing name descriptor
        Missing monitor ranges
        Detailed block string not properly terminated
EDID block does not conform at all!
        Has 128 nonconformant extension block(s)
