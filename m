Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 98D5C2E5A1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2019 21:58:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725990AbfE2T6V (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 May 2019 15:58:21 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:48908 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725956AbfE2T6U (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 May 2019 15:58:20 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 3D4F360A00; Wed, 29 May 2019 19:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1559159899;
        bh=FVSPpTHDF0GOBaKIDyNZqRwnEvQHQL/Ok8SvfTA+sVE=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=WzEDCNiuCjmE4/YO6xyFI93CQdAZUWwA6p1MCkV5/5KeX5E36lE1PdR+ZsSCsUOxZ
         qVt0fXuPXLPBHTcfJfUdvt3ey0pJ06NyJqgG5YUkMn70Ag2MLl+rUGpMdUqLGWA6w8
         kigwSz92d76dKLYgsKFTd3HDW0Jhxkd9v3jNqOqI=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.226.58.28] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id CFF086019D;
        Wed, 29 May 2019 19:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1559159897;
        bh=FVSPpTHDF0GOBaKIDyNZqRwnEvQHQL/Ok8SvfTA+sVE=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=CU9Y1DOyQ9WEHsuZRNe0JvS0ftkyIvmdiwaW8BqrCMwhQibK1lXH3Eo+FNxZQXD5O
         glN9aggcfrZC0P3QDYUdm2eKXXNxO5yIn1GcjV2ZXYbefFULrWDMIhpbKBQ/trilC5
         FBx53OO1MI7YvLXS3xGlZclKXXWV44XtND8fRXxA=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org CFF086019D
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jhugo@codeaurora.org
Subject: Re: [Freedreno] [PATCH RFC v2 0/6] ARM: qcom: initial Nexus 5 display
 support
To:     Brian Masney <masneyb@onstation.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Sean Paul <sean@poorly.run>, Rob Herring <robh@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Dave Airlie <airlied@linux.ie>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        Rob Clark <robdclark@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        freedreno <freedreno@lists.freedesktop.org>
References: <20190509020352.14282-1-masneyb@onstation.org>
 <CACRpkda-7+ggoeMD9=erPX09OWteX0bt+qP60_Yv6=4XLqNDZQ@mail.gmail.com>
 <20190529011705.GA12977@basecamp>
 <CAOCk7NrRo2=0fPN_Sy1Bhhy+UV7U6uO5aV9uXZc8kc3VpSt71g@mail.gmail.com>
 <20190529013713.GA13245@basecamp>
 <CAOCk7NqfdNkRJkbJY70XWN-XvdtFJ0UVn3_9rbgAsNCdR7q5PQ@mail.gmail.com>
 <20190529024648.GA13436@basecamp>
 <CAOCk7NpC93ACr4jFm7SBOKSvFJSDhq2byX6BAYPX29BuYEkWnQ@mail.gmail.com>
 <20190529102822.GA15027@basecamp>
 <CAOCk7NoVknZOkFcki9c8hq2vkqLhBSfum05T9Srq8mtJjAaLyQ@mail.gmail.com>
 <20190529193046.GA19876@basecamp>
From:   Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <26c535af-9853-c8c9-3138-04f5d9ee11b0@codeaurora.org>
Date:   Wed, 29 May 2019 13:58:16 -0600
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190529193046.GA19876@basecamp>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 5/29/2019 1:30 PM, Brian Masney wrote:
> On Wed, May 29, 2019 at 08:41:31AM -0600, Jeffrey Hugo wrote:
>> On Wed, May 29, 2019 at 4:28 AM Brian Masney <masneyb@onstation.org> wrote:
>>>
>>> On Tue, May 28, 2019 at 08:53:49PM -0600, Jeffrey Hugo wrote:
>>>> On Tue, May 28, 2019 at 8:46 PM Brian Masney <masneyb@onstation.org> wrote:
>>>>>
>>>>> On Tue, May 28, 2019 at 07:42:19PM -0600, Jeffrey Hugo wrote:
>>>>>>>> Do you know if the nexus 5 has a video or command mode panel?  There
>>>>>>>> is some glitchyness with vblanks and command mode panels.
>>>>>>>
>>>>>>> Its in command mode. I know this because I see two 'pp done time out'
>>>>>>> messages, even on 4.17. Based on my understanding, the ping pong code is
>>>>>>> only applicable for command mode panels.
>>>>>>
>>>>>> Actually, the ping pong element exists in both modes, but 'pp done
>>>>>> time out' is a good indicator that it is command mode.
>>>>>>
>>>>>> Are you also seeing vblank timeouts?
>>>>>
>>>>> Yes, here's a snippet of the first one.
>>>>>
>>>>> [    2.556014] WARNING: CPU: 0 PID: 5 at drivers/gpu/drm/drm_atomic_helper.c:1429 drm_atomic_helper_wait_for_vblanks.part.1+0x288/0x290
>>>>> [    2.556020] [CRTC:49:crtc-0] vblank wait timed out
>>>>> [    2.556023] Modules linked in:
>>>>> [    2.556034] CPU: 0 PID: 5 Comm: kworker/0:0 Not tainted 5.2.0-rc1-00178-g72c3c1fd5f86-dirty #426
>>>>> [    2.556038] Hardware name: Generic DT based system
>>>>> [    2.556056] Workqueue: events deferred_probe_work_func
>>>>> ...
>>>>>
>>>>>> Do you have busybox?
>>>>>>
>>>>>> Can you run -
>>>>>> sudo busybox devmem 0xFD900614
>>>>>> sudo busybox devmem 0xFD900714
>>>>>> sudo busybox devmem 0xFD900814
>>>>>> sudo busybox devmem 0xFD900914
>>>>>> sudo busybox devmem 0xFD900A14
>>>>>
>>>>> # busybox devmem 0xFD900614
>>>>> 0x00020020
>>>>
>>>> Ok, so CTL_0 path, command mode, ping pong 0, with the output going to DSI 1.
>>>>
>>>> Next one please:
>>>>
>>>> busybox devmem 0xFD912D30
>>>
>>> It's 0x00000000 on mainline and 4.17. I used the following script to
>>> dump the entire mdp5 memory region and attached the dump from 4.17 and
>>> 5.2rc1.
>>>
>>
>> ok, 0 means autorefresh is not on.  Which is fine.  My next guess
>> would be the vblank code checking the hardware vblank counter, which
>> doesn't exist.
>> In video mode, there is a frame counter which increments, which can be
>> used as the vblank counter.  Unfortunately, that hardware isn't active
>> in command mode, and there isn't an equivalent.
>>
>> So, the vblank code is going to read the register, and look for an
>> update, which will never happen, thus it will timeout.  There is a
>> backup path which uses timestamps (no hardware), which you can
>> activate with a quick hack - make max_vblank_count = 0 at the
>> following line
>> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c#L753
> 
> That fixed the issue!

Awesome.  I'm glad it was something simple.

> 
> I previously observed that mdp5_get_vblank_counter, specifically
> mdp5_encoder_get_framecount, would always return 0.
> 
> What's the best way to fix this in mainline? Set that to zero if any
> of the interface modes is MDP5_INTF_DSI_MODE_COMMAND?
> 

Short version, yes.  Long version:

I still have that hack in my tree and haven't come back to formulating
a proper fix yet.  Feel free to run with it.

Thinking about it briefly, we could do two things.  We could fake a
hardware counter by just increment an int every time the vblank irq is
processed, but that seems clunky.  Otherwise, we could force a
fallback onto the timestamp solution, which seems less invasive.

In theory, we could service multiple displays, with different
properties (ie a combination of command and video mode).  The hack
then, is not good, because it would break video mode (at-least we
wouldn't be using the register when we could).  It would be great if
the use of the hardware register could be done per display.

Luckily, it looks like someone just made that possible -
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/gpu/drm/drm_vblank.c?h=v5.2-rc2&id=ed20151a7699bb2c77eba3610199789a126940c4

-- 
Jeffrey Hugo
Qualcomm Datacenter Technologies as an affiliate of Qualcomm 
Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
