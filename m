Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58A9221AF38
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2020 08:15:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727121AbgGJGPf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Jul 2020 02:15:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725851AbgGJGPc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Jul 2020 02:15:32 -0400
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCEA8C08C5CE
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2020 23:15:32 -0700 (PDT)
Received: by mail-oi1-x22a.google.com with SMTP id l63so3898910oih.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2020 23:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=firXECNMLXniKyCvwGOQp5z1TDCqfIAA522lZa0cjs8=;
        b=H9xNKfMb1oeJa3rxcpAig9irEvNPG756hwbJvn5FslLD3+ycXhV6tX69JPMY7g8TOM
         UuZv4JkqAYq2KOFmuZ9LSxIS0HFXwH/0/JVF9fbkt0LJQOm8tQTqcAGy39pYTngg8WB9
         xlzhzaFUpmzh+0TfTm1MSD8sUoQi7I7tNk7HXLTPpTpAQHbfXfyJx9qd421vybSSoRKj
         WLi9j58oaeYUa4AAraqE7c8bvVabf7BoNMm6fAAG4BKyDdk0tzuu/GzrkxNmDTvtOU2J
         I5pQbmCgCPRJal3CLcWC1SybOzcVDSige9M0R5odTOVY/m3/ycP/RjBGPZFnuruP8YMJ
         Su4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=firXECNMLXniKyCvwGOQp5z1TDCqfIAA522lZa0cjs8=;
        b=HaZu2FhNtvuIAthCDK8bov4C9b8oPbOry2gwmjHs0d2iwvyT/3eFK9rVE5tVsEAV6B
         VQtcbtwc/qfPSbNv/ENgNV+zHOWwEb9iY3nqsoUgvooWewu/QRnNz5Ndym0UfKtR3Hv3
         SmgIsTWT97jCqGNjK2DnzZZWMYYA+FEkMoT5XBi95GhjVHvDTkadXhTJ/buDRKud/fmx
         hNpYBIyLt+H6eBiEKAh6orCP5ng+o5FUE4b04WnaIVRyHJRnUBne332Yj4IVt4BqAooD
         LC6Tf/BegD0jhsC19qFzPK4EOwttU8IVDv+n7X+gQ4feJQsMad2SKDCeysI8jmEi0thO
         D5Ww==
X-Gm-Message-State: AOAM530BGpyTB4IjbR2mZ/jP0ZBS7C8esLSI24S1mkIMEG8ZNbymexcT
        PwKkdoC7MUwsUvkRsWh0uSul0w==
X-Google-Smtp-Source: ABdhPJzKYv1MQNBiX9pdiNawAOtCiBG3Cr1nwQSq8I7M2RjOSjTLvlyd/GsbATT1yLThRSl+gVcp3Q==
X-Received: by 2002:aca:3017:: with SMTP id w23mr3106122oiw.18.1594361731934;
        Thu, 09 Jul 2020 23:15:31 -0700 (PDT)
Received: from [192.168.11.10] (cpe-173-175-113-3.satx.res.rr.com. [173.175.113.3])
        by smtp.gmail.com with ESMTPSA id r14sm937732otp.54.2020.07.09.23.15.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2020 23:15:31 -0700 (PDT)
Subject: Re: [PATCH v3 6/9] drm/bridge: ti-sn65dsi86: Use 18-bit DP if we can
To:     Doug Anderson <dianders@chromium.org>
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
References: <20191218143416.v3.6.Iaf8d698f4e5253d658ae283d2fd07268076a7c27@changeid>
 <20200710011935.GA7056@gentoo.org>
 <CAD=FV=X3oazamoKR1jHoXm-yCAp9208ahNd8y+NDPt1pU=5xRg@mail.gmail.com>
 <CAD=FV=UWQsGit6XMCzHn5cBRAC9nAaGReDyMzMM2Su02bfiPyQ@mail.gmail.com>
 <dc786abb-4bc2-2416-7ee5-de408aceb8f1@kali.org>
 <e0702671-3bed-9e3d-c7f4-d050c617eb65@kali.org>
 <bc795659-7dd6-c667-1c93-4331510ecfbc@kali.org>
 <CAD=FV=VC+RP8WfS-yuc65WRN2KokNbAs-F3UdQtQoZjcMMSNFA@mail.gmail.com>
From:   Steev Klimaszewski <steev@kali.org>
Message-ID: <f81f0d22-85d6-66eb-c8d9-345757f53959@kali.org>
Date:   Fri, 10 Jul 2020 01:15:28 -0500
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAD=FV=VC+RP8WfS-yuc65WRN2KokNbAs-F3UdQtQoZjcMMSNFA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 7/9/20 11:12 PM, Doug Anderson wrote:
>> root@c630:~# bus=$(i2cdetect -l | grep sn65 | sed 's/i2c-\([0-9]*\).*$/\1/')
>> root@c630:~# i2cdump ${bus} 0x50 i > edid
>> WARNING! This program can confuse your I2C bus, cause data loss and worse!
>> I will probe file /dev/i2c-16, address 0x50, mode i2c block
>> Continue? [Y/n]
>> root@c630:~# edid-decode edid
>> edid-decode (hex):
>>
>> 00 ff ff ff ff ff ff 00 09 e5 d1 07 00 00 00 00
>> 01 1c 01 04 a5 1d 11 78 0a 1d b0 a6 58 54 9e 26
>> 0f 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
>> 01 01 01 01 01 01 c0 39 80 18 71 38 28 40 30 20
>> 36 00 26 a5 10 00 00 1a 00 00 00 00 00 00 00 00
>> 00 00 00 00 00 00 00 00 00 1a 00 00 00 fe 00 42
>> 4f 45 20 43 51 0a 20 20 20 20 20 20 00 00 00 fe
>> 00 4e 56 31 33 33 46 48 4d 2d 4e 36 31 0a 00 9a
>>
>> 03 26 0a 77 ab 1c 05 71 6f 1d 8c f1 43 ce 6a bb
>> fb d3 11 20 39 07 22 6e 65 68 77 70 d3 05 34 73
>> 44 21 8b fd f5 6d 11 62 94 2a 7c fa 93 ba 6a 61
>> 92 da 15 53 4c 39 eb f7 86 23 97 48 e9 39 09 d2
>> 66 02 70 bb e2 77 0f 4a a3 a0 4c 72 6e 5d 47 70
>> 43 c2 13 f3 b2 d9 b9 78 02 be 41 82 15 6a 28 dc
>> 45 0f 9d eb 0f 2a cc e8 35 8d 34 7f 3e 84 5e a3
>> 30 5e 1e 29 0a 48 0c d1 0a c4 08 31 03 a9 3b 29
>>
>> ----------------
>>
>> EDID version: 1.4
>> Manufacturer: BOE Model 2001 Serial Number 0
>> Made in week 1 of 2018
>> Digital display
>> 8 bits per primary color channel
>> DisplayPort interface
>> Maximum image size: 29 cm x 17 cm
>> Gamma: 2.20
>> Supported color formats: RGB 4:4:4, YCrCb 4:4:4
>> First detailed timing includes the native pixel format and preferred
>> refresh rate
>> Color Characteristics
>>     Red:   0.6484, 0.3447
>>     Green: 0.3310, 0.6181
>>     Blue:  0.1503, 0.0615
>>     White: 0.3125, 0.3281
>> Established Timings I & II: none
>> Standard Timings: none
>> Detailed mode: Clock 147.840 MHz, 294 mm x 165 mm
>>                  1920 1968 2000 2200 ( 48  32 200)
>>                  1080 1083 1089 1120 (  3   6  31)
>>                  +hsync -vsync
>>                  VertFreq: 60.000 Hz, HorFreq: 67.200 kHz
>> Manufacturer-Specified Display Descriptor (0x00): 00 00 00 00 00 00 00
>> 00 00 00 00 00 00 00 00 1a  ................
>> Alphanumeric Data String: BOE CQ
>> Alphanumeric Data String: NV133FHM-N61
>> Checksum: 0x9a
>>
>> ----------------
>>
>> Unknown EDID Extension Block 0x03
>>     03 26 0a 77 ab 1c 05 71 6f 1d 8c f1 43 ce 6a bb .&.w...qo...C.j.
>>     fb d3 11 20 39 07 22 6e 65 68 77 70 d3 05 34 73  ... 9."nehwp..4s
>>     44 21 8b fd f5 6d 11 62 94 2a 7c fa 93 ba 6a 61 D!...m.b.*|...ja
>>     92 da 15 53 4c 39 eb f7 86 23 97 48 e9 39 09 d2 ...SL9...#.H.9..
>>     66 02 70 bb e2 77 0f 4a a3 a0 4c 72 6e 5d 47 70 f.p..w.J..Lrn]Gp
>>     43 c2 13 f3 b2 d9 b9 78 02 be 41 82 15 6a 28 dc C......x..A..j(.
>>     45 0f 9d eb 0f 2a cc e8 35 8d 34 7f 3e 84 5e a3 E....*..5.4.>.^.
>>     30 5e 1e 29 0a 48 0c d1 0a c4 08 31 03 a9 3b 29 0^.).H.....1..;)
>> Checksum: 0x29 (should be 0x82)
>>
>>
>> - My edid does in fact say it's 8bit
> Crazy!  Mine:
>
> Extracted contents:
> header:          00 ff ff ff ff ff ff 00
> serial number:   09 e5 2d 08 00 00 00 00 23 1c
> version:         01 04
> basic params:    95 1d 11 78 02
> chroma info:     d5 00 a6 58 54 9f 27 0f 4f 57
> established:     00 00 00
> standard:        01 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01
> descriptor 1:    c0 39 80 18 71 38 28 40 30 20 36 00 26 a5 10 00 00 1a
> descriptor 2:    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> descriptor 3:    00 00 00 fe 00 42 4f 45 20 43 51 0a 20 20 20 20 20 20
> descriptor 4:    00 00 00 fe 00 4e 56 31 33 33 46 48 4d 2d 4e 36 32 0a
> extensions:      00
> checksum:        40
>
> Manufacturer: BOE Model 82d Serial Number 0
> Made week 35 of 2018
> EDID version: 1.4
> Digital display
> 6 bits per primary color channel
> DisplayPort interface
> Maximum image size: 29 cm x 17 cm
> Gamma: 2.20
> Supported color formats: RGB 4:4:4
> First detailed timing is preferred timing
> Established timings supported:
> Standard timings supported:
> Detailed mode: Clock 147.840 MHz, 294 mm x 165 mm
>                 1920 1968 2000 2200 hborder 0
>                 1080 1083 1089 1120 vborder 0
>                 +hsync -vsync
> Manufacturer-specified data, tag 0
> ASCII string: BOE
> ASCII string: NV133FHM-N62
> Checksum: 0x40 (valid)
>
> Unknown extension block
>
> EDID block does NOT conform to EDID 1.3!
>          Missing name descriptor
>          Missing monitor ranges
>          Detailed block string not properly terminated
> EDID block does not conform at all!
>          Has 128 nonconformant extension block(s)

I did attempt to modify the patch, and I don't think I did it correctly

Around line 232, I changed

IS_SC7180_TARGET(c->hw.hwversion))

to

IS_SC7180_TARGET(c->hw.hwversion) ||

IS_SDM845_TARGET(c->hw.hwversion))


But it would seem that only gets us 1/2 way there...

https://dev.gentoo.org/~steev/files/image2.jpg


But should I continue on this path, or should we be finding others who 
have an N61 and see what their EDID reports?

I have another c630, but unfortunately, it appears to have the IVO 
screen in it, instead of another N61.  I asked another user and he also 
had the IVO.

-- steev

