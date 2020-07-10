Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFC3821ADA0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2020 05:43:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726816AbgGJDnW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Jul 2020 23:43:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726495AbgGJDnV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Jul 2020 23:43:21 -0400
Received: from mail-oo1-xc44.google.com (mail-oo1-xc44.google.com [IPv6:2607:f8b0:4864:20::c44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 444ACC08C5DC
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2020 20:43:21 -0700 (PDT)
Received: by mail-oo1-xc44.google.com with SMTP id p26so747625oos.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2020 20:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=ZsCfMVxhN8HqerkbJcQvxK/1uivZN3EoSEMu1iIXARQ=;
        b=Ey0W1+RDhGppDWcHFH35tEFeA+9ks88FzZBKadS7rgMdwQbURTM4tfCtqCR3q7KNzm
         yMun9yCkNnqoXSoSm1Ry6qKwxkfNdxATWogHZbvMjVkPo1CmuWAztsP19vtDp04ziYMj
         wlueEUjEylFMjikXmwEoeYMEqdHMGYmZdBxUynvpYNwfC3AjLBavQctnboJxSs95y53a
         O1kPZlXnnNEtB6WNFtVTGLGcC4AGUXU+2LUU8svFFdHThn1w7EOjefvHTPlOPHmBbCJa
         rxKqnaJDzJYQSZmMqvf4+UgLiG9MNCbnU9DAtDZMX64it9BYownJAtMSEZYANo09xnEt
         HBBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=ZsCfMVxhN8HqerkbJcQvxK/1uivZN3EoSEMu1iIXARQ=;
        b=pxRdzC1KKGuWtKcGlSf228YSTBmEokv6wEnnh2dAe9YfrqFkWWdFBdfAiS2sgsm3mk
         vplKbjcX0LtCm8Y/+7Eoxz6uWVSDBPoEHsrUwMynWpsGGGFRPkRwh0PuObDUSipuRRlx
         Un7UPDps+MihC0Q0tMTFPQ6Z1sFWqGP0UwQxPcCXOkrSm8SnWLaTQv1dB8+EQ8jKfjZi
         FmNADI4rFqJ+zXhBRE8WiV8BNeCApWlaeaoyKQAPkO6PYVZPMce23ymjB2JAdEM2KYKt
         bnv1a1cufi+PXJrlHJPXe5wD+ubJ0z+WUP2z2FDjCZSFv25oPXHUwNsI3IDwAQbU4oR/
         f10g==
X-Gm-Message-State: AOAM531hnK2cth09ZrSNq9grWXWv7W3Kzny6l3vi619X1nFNRyPbDqSj
        lcrACMbPabLNKu0DgEyRDYtTOw==
X-Google-Smtp-Source: ABdhPJzSlVXV5zlNbmP4afJXRay77l0cMloQpZFUfuylC+x6qiPytQzYPNe7rYdiL7Uh0v5uPvs3pw==
X-Received: by 2002:a4a:ea03:: with SMTP id x3mr58938173ood.16.1594352600386;
        Thu, 09 Jul 2020 20:43:20 -0700 (PDT)
Received: from [192.168.11.9] (cpe-173-175-113-3.satx.res.rr.com. [173.175.113.3])
        by smtp.gmail.com with ESMTPSA id i20sm872800ota.55.2020.07.09.20.43.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2020 20:43:19 -0700 (PDT)
Subject: Re: [PATCH v3 6/9] drm/bridge: ti-sn65dsi86: Use 18-bit DP if we can
From:   Steev Klimaszewski <steev@kali.org>
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
Message-ID: <bc795659-7dd6-c667-1c93-4331510ecfbc@kali.org>
Date:   Thu, 9 Jul 2020 22:43:18 -0500
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <e0702671-3bed-9e3d-c7f4-d050c617eb65@kali.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 7/9/20 10:17 PM, Steev Klimaszewski wrote:
>
> On 7/9/20 10:12 PM, Steev Klimaszewski wrote:
>>
>> On 7/9/20 9:14 PM, Doug Anderson wrote:
>>> Hi,
>>>
>>> On Thu, Jul 9, 2020 at 6:38 PM Doug Anderson <dianders@chromium.org> 
>>> wrote:
>>>> Hi,
>>>>
>>>> On Thu, Jul 9, 2020 at 6:19 PM Steev Klimaszewski 
>>>> <steev@gentoo.org> wrote:
>>>>> Hi Doug,
>>>>>
>>>>> I've been testing 5.8 and linux-next on the Lenovo Yoga C630, and 
>>>>> with this patch applied, there is really bad banding on the display.
>>>>>
>>>>> I'm really bad at explaining it, but you can see the differences 
>>>>> in the following:
>>>>>
>>>>> 24bit (pre-5.8) - https://dev.gentoo.org/~steev/files/image0.jpg
>>>>>
>>>>> 18bit (5.8/linux-next) - 
>>>>> https://dev.gentoo.org/~steev/files/image1.jpg
>>>> Presumably this means that your panel is defined improperly? If the
>>>> panel reports that it's a 6 bits per pixel panel but it's actually an
>>>> 8 bits per pixel panel then you'll run into this problem.
>>>>
>>>> I would have to assume you have a bunch of out of tree patches to
>>>> support your hardware since I don't see any device trees in linuxnext
>>>> (other than cheza) that use this bridge chip.  Otherwise I could try
>>>> to check and confirm that was the problem.
>>> Ah, interesting.  Maybe you have the panel:
>>>
>>> boe,nv133fhm-n61
>>>
>>> As far as I can tell from the datasheet (I have the similar
>>> boe,nv133fhm-n62) this is a 6bpp panel.  ...but if you feed it 8bpp
>>> the banding goes away!  Maybe the panel itself knows how to dither???
>>> ...or maybe the datasheet / edid are wrong and this is actually an
>>> 8bpp panel.  Seems unlikely...
>>>
>>> In any case, one fix is to pick
>>> <https://lore.kernel.org/dri-devel/1593087419-903-1-git-send-email-kalyan_t@codeaurora.org/>, 
>>>
>>> though right now that patch is only enabled for sc7180.  Maybe you
>>> could figure out how to apply it to your hardware?
>>>
>>> ...another fix would be to pretend that your panel is 8bpp even though
>>> it's actually 6bpp.  Ironically if anyone ever tried to configure BPP
>>> from the EDID they'd go back to 6bpp.  You can read the EDID of your
>>> panel with this:
>>>
>>> bus=$(i2cdetect -l | grep sn65 | sed 's/i2c-\([0-9]*\).*$/\1/')
>>> i2cdump ${bus} 0x50 i
>>>
>>> When I do that and then decode it on the "boe,nv133fhm-n62" panel, I 
>>> find:
>>>
>>> 6 bits per primary color channel
>>>
>>> -Doug
>>
>>
>> Hi Doug,
>>
>> Decoding it does show be to boe,nv133fhm-n61 - and yeah it does say 
>> it's 6-bit according to panelook's specs for it.


I derped again...

root@c630:~# bus=$(i2cdetect -l | grep sn65 | sed 's/i2c-\([0-9]*\).*$/\1/')
root@c630:~# i2cdump ${bus} 0x50 i > edid
WARNING! This program can confuse your I2C bus, cause data loss and worse!
I will probe file /dev/i2c-16, address 0x50, mode i2c block
Continue? [Y/n]
root@c630:~# edid-decode edid
edid-decode (hex):

00 ff ff ff ff ff ff 00 09 e5 d1 07 00 00 00 00
01 1c 01 04 a5 1d 11 78 0a 1d b0 a6 58 54 9e 26
0f 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 c0 39 80 18 71 38 28 40 30 20
36 00 26 a5 10 00 00 1a 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 1a 00 00 00 fe 00 42
4f 45 20 43 51 0a 20 20 20 20 20 20 00 00 00 fe
00 4e 56 31 33 33 46 48 4d 2d 4e 36 31 0a 00 9a

03 26 0a 77 ab 1c 05 71 6f 1d 8c f1 43 ce 6a bb
fb d3 11 20 39 07 22 6e 65 68 77 70 d3 05 34 73
44 21 8b fd f5 6d 11 62 94 2a 7c fa 93 ba 6a 61
92 da 15 53 4c 39 eb f7 86 23 97 48 e9 39 09 d2
66 02 70 bb e2 77 0f 4a a3 a0 4c 72 6e 5d 47 70
43 c2 13 f3 b2 d9 b9 78 02 be 41 82 15 6a 28 dc
45 0f 9d eb 0f 2a cc e8 35 8d 34 7f 3e 84 5e a3
30 5e 1e 29 0a 48 0c d1 0a c4 08 31 03 a9 3b 29

----------------

EDID version: 1.4
Manufacturer: BOE Model 2001 Serial Number 0
Made in week 1 of 2018
Digital display
8 bits per primary color channel
DisplayPort interface
Maximum image size: 29 cm x 17 cm
Gamma: 2.20
Supported color formats: RGB 4:4:4, YCrCb 4:4:4
First detailed timing includes the native pixel format and preferred 
refresh rate
Color Characteristics
   Red:   0.6484, 0.3447
   Green: 0.3310, 0.6181
   Blue:  0.1503, 0.0615
   White: 0.3125, 0.3281
Established Timings I & II: none
Standard Timings: none
Detailed mode: Clock 147.840 MHz, 294 mm x 165 mm
                1920 1968 2000 2200 ( 48  32 200)
                1080 1083 1089 1120 (  3   6  31)
                +hsync -vsync
                VertFreq: 60.000 Hz, HorFreq: 67.200 kHz
Manufacturer-Specified Display Descriptor (0x00): 00 00 00 00 00 00 00 
00 00 00 00 00 00 00 00 1a  ................
Alphanumeric Data String: BOE CQ
Alphanumeric Data String: NV133FHM-N61
Checksum: 0x9a

----------------

Unknown EDID Extension Block 0x03
   03 26 0a 77 ab 1c 05 71 6f 1d 8c f1 43 ce 6a bb .&.w...qo...C.j.
   fb d3 11 20 39 07 22 6e 65 68 77 70 d3 05 34 73  ... 9."nehwp..4s
   44 21 8b fd f5 6d 11 62 94 2a 7c fa 93 ba 6a 61 D!...m.b.*|...ja
   92 da 15 53 4c 39 eb f7 86 23 97 48 e9 39 09 d2 ...SL9...#.H.9..
   66 02 70 bb e2 77 0f 4a a3 a0 4c 72 6e 5d 47 70 f.p..w.J..Lrn]Gp
   43 c2 13 f3 b2 d9 b9 78 02 be 41 82 15 6a 28 dc C......x..A..j(.
   45 0f 9d eb 0f 2a cc e8 35 8d 34 7f 3e 84 5e a3 E....*..5.4.>.^.
   30 5e 1e 29 0a 48 0c d1 0a c4 08 31 03 a9 3b 29 0^.).H.....1..;)
Checksum: 0x29 (should be 0x82)


- My edid does in fact say it's 8bit

