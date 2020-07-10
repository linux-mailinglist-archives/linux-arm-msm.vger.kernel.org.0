Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04A1021AD64
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2020 05:17:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726581AbgGJDRS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Jul 2020 23:17:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726495AbgGJDRR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Jul 2020 23:17:17 -0400
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com [IPv6:2607:f8b0:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61B6BC08C5DC
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2020 20:17:17 -0700 (PDT)
Received: by mail-ot1-x341.google.com with SMTP id h1so3175984otq.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2020 20:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=j0wwhr1/T/vy9n1+otmduXmzQCUiGkNtjh79hw1bxv4=;
        b=BbmOQTRp6gYkwQqXj3JMZ3m0Tqr0EIu9qZrevvaVT+MMCS/1fSHpqZLGJfeAU8puZy
         9RcjYup96/Cv7z5UP21se4Jg17+/9cQF39itTwIYmb3+k5ojm4IHmdtmCnd0FYxwv7o/
         4F0LZ2pAtf9q8WpVEUg5A+svER1CDsSU08jrknSpL7/Z5xPz/URGGp2MaIoeBGzQphIS
         5zdxdg44kQyrTEyNsxhy6Mo7Ig36nIcNVAgQSS5YehxC4DjMzkC40goTy4lsxyL1bBSO
         IqgFmV3UgI1u/2nCvd0NRCxtnvYzJZFyyVPaj01JfrUQX6ctJFyhIOpP/MKL6WANMXOQ
         YQTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=j0wwhr1/T/vy9n1+otmduXmzQCUiGkNtjh79hw1bxv4=;
        b=dHwjmSYxv6ZL+pdagK/Cv9uKzQ/Nlsl+Ns7qKpHS3OTf5H+pQSJC4HMFtUOFGsTpoh
         FTIGby5bkld80/dxoQrTOSoYE++NT3cF6gGmhR+KRP9AyyvXGFQ9h97yaMPqfox/HQlO
         PuYETIPFCpV5MtJyWVUXZ+GdW2Yokng5yDlKnc83DXi+JeoVSutC8b50byNikjZF0vcv
         /4UHGk5uc4a3BfM1P+AIspCAU4A0XqOoL3utJAsewlprFxZghLZHRtcbegTmt0lRL4zN
         5xK3lljvk6vYP/rRdNbPZGW5jIaKt4BfaHQJSNxCyEfbmBGlY0p5DdNbt5VgDQDEX2kW
         mXUQ==
X-Gm-Message-State: AOAM533QGu3gFmMahXLtjEtogTvs0soWyXeRKIWrz09qV7M7s8uINr7S
        K9Wt3uo7M6uifLpi59Jg7ePERA==
X-Google-Smtp-Source: ABdhPJwpau8NTYn5wFg7gaMaXNs5CJF3bRoXICXIT+qLYysVXc/ruiVyQgs+tjrcp0KQC8fmsrEGCw==
X-Received: by 2002:a05:6830:1e03:: with SMTP id s3mr29365301otr.306.1594351036655;
        Thu, 09 Jul 2020 20:17:16 -0700 (PDT)
Received: from [192.168.11.9] (cpe-173-175-113-3.satx.res.rr.com. [173.175.113.3])
        by smtp.gmail.com with ESMTPSA id f26sm942554oop.46.2020.07.09.20.17.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2020 20:17:15 -0700 (PDT)
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
Message-ID: <e0702671-3bed-9e3d-c7f4-d050c617eb65@kali.org>
Date:   Thu, 9 Jul 2020 22:17:14 -0500
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <dc786abb-4bc2-2416-7ee5-de408aceb8f1@kali.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 7/9/20 10:12 PM, Steev Klimaszewski wrote:
>
> On 7/9/20 9:14 PM, Doug Anderson wrote:
>> Hi,
>>
>> On Thu, Jul 9, 2020 at 6:38 PM Doug Anderson <dianders@chromium.org> 
>> wrote:
>>> Hi,
>>>
>>> On Thu, Jul 9, 2020 at 6:19 PM Steev Klimaszewski <steev@gentoo.org> 
>>> wrote:
>>>> Hi Doug,
>>>>
>>>> I've been testing 5.8 and linux-next on the Lenovo Yoga C630, and 
>>>> with this patch applied, there is really bad banding on the display.
>>>>
>>>> I'm really bad at explaining it, but you can see the differences in 
>>>> the following:
>>>>
>>>> 24bit (pre-5.8) - https://dev.gentoo.org/~steev/files/image0.jpg
>>>>
>>>> 18bit (5.8/linux-next) - 
>>>> https://dev.gentoo.org/~steev/files/image1.jpg
>>> Presumably this means that your panel is defined improperly? If the
>>> panel reports that it's a 6 bits per pixel panel but it's actually an
>>> 8 bits per pixel panel then you'll run into this problem.
>>>
>>> I would have to assume you have a bunch of out of tree patches to
>>> support your hardware since I don't see any device trees in linuxnext
>>> (other than cheza) that use this bridge chip.  Otherwise I could try
>>> to check and confirm that was the problem.
>> Ah, interesting.  Maybe you have the panel:
>>
>> boe,nv133fhm-n61
>>
>> As far as I can tell from the datasheet (I have the similar
>> boe,nv133fhm-n62) this is a 6bpp panel.  ...but if you feed it 8bpp
>> the banding goes away!  Maybe the panel itself knows how to dither???
>> ...or maybe the datasheet / edid are wrong and this is actually an
>> 8bpp panel.  Seems unlikely...
>>
>> In any case, one fix is to pick
>> <https://lore.kernel.org/dri-devel/1593087419-903-1-git-send-email-kalyan_t@codeaurora.org/>, 
>>
>> though right now that patch is only enabled for sc7180.  Maybe you
>> could figure out how to apply it to your hardware?
>>
>> ...another fix would be to pretend that your panel is 8bpp even though
>> it's actually 6bpp.  Ironically if anyone ever tried to configure BPP
>> from the EDID they'd go back to 6bpp.  You can read the EDID of your
>> panel with this:
>>
>> bus=$(i2cdetect -l | grep sn65 | sed 's/i2c-\([0-9]*\).*$/\1/')
>> i2cdump ${bus} 0x50 i
>>
>> When I do that and then decode it on the "boe,nv133fhm-n62" panel, I 
>> find:
>>
>> 6 bits per primary color channel
>>
>> -Doug
>
>
> Hi Doug,
>
> Decoding it does show be to boe,nv133fhm-n61 - and yeah it does say 
> it's 6-bit according to panelook's specs for it.
>
>
> I'll take a look at the patch and see what I can come up with... at 
> the moment, I'm forcing it to be 8bit and that does "work fine" but 
> I'd like it to be fixed properly instead of my hack.
>
> Thanks for your time and work!
>
> -- Steev
>
For what it's worth - the 5.8 that I'm testing is at 
https://github.com/steev/linux/commits/c630-5.8-rc4-inline-encryption
