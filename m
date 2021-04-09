Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9C603597A6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Apr 2021 10:22:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232615AbhDIIWY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Apr 2021 04:22:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232358AbhDIIWX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Apr 2021 04:22:23 -0400
Received: from relay01.th.seeweb.it (relay01.th.seeweb.it [IPv6:2001:4b7a:2000:18::162])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CF4BC061760
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Apr 2021 01:22:11 -0700 (PDT)
Received: from [10.0.20.3] (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 441D91FAF2;
        Fri,  9 Apr 2021 10:22:06 +0200 (CEST)
Subject: Re: [Freedreno] [PATCH 1/3] drm/msm/mdp5: Configure PP_SYNC_HEIGHT to
 double the vtotal
To:     Abhinav Kumar <abhinavk@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Cc:     phone-devel@vger.kernel.org,
        freedreno <freedreno@lists.freedesktop.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        David Airlie <airlied@linux.ie>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Martin Botka <martin.botka@somainline.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>
References: <20210406214726.131534-1-marijn.suijten@somainline.org>
 <20210406214726.131534-2-marijn.suijten@somainline.org>
 <6413863d04df9743e2d7e81beff5c3e8@codeaurora.org>
 <04860f05-f79f-de0b-13d1-aba85065b4da@somainline.org>
 <CAF6AEGuoLgBSZOou1TSb-d2o6tHS-L-E7AQLS5RM4aOogvRG7Q@mail.gmail.com>
 <CAK7fi1aUXy2i8zY0Cb5Svq0s1H9cSAvY4hq+BsiWgdphwm-ebA@mail.gmail.com>
 <CAF6AEGuSav210dMHa3+f-7W1Kgyjam7K7HhWFO4aXWbdjvPTLw@mail.gmail.com>
From:   Marijn Suijten <marijn.suijten@somainline.org>
Message-ID: <408460b9-e150-c971-663f-5fa0bd40b873@somainline.org>
Date:   Fri, 9 Apr 2021 10:22:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <CAF6AEGuSav210dMHa3+f-7W1Kgyjam7K7HhWFO4aXWbdjvPTLw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Abhinav, Angelo, Rob,

On 4/9/21 2:08 AM, Rob Clark wrote:
> On Thu, Apr 8, 2021 at 4:16 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@somainline.org> wrote:
>>
>>
>> Il gio 8 apr 2021, 21:05 Rob Clark <robdclark@gmail.com> ha scritto:
>>>
>>> On Wed, Apr 7, 2021 at 12:11 PM AngeloGioacchino Del Regno
>>> <angelogioacchino.delregno@somainline.org> wrote:
>>>>
>>>> Il 07/04/21 20:19, abhinavk@codeaurora.org ha scritto:
>>>>> Hi Marijn
>>>>>
>>>>> On 2021-04-06 14:47, Marijn Suijten wrote:
>>>>>> Leaving this at a close-to-maximum register value 0xFFF0 means it takes
>>>>>> very long for the MDSS to generate a software vsync interrupt when the
>>>>>> hardware TE interrupt doesn't arrive.  Configuring this to double the
>>>>>> vtotal (like some downstream kernels) leads to a frame to take at most
>>>>>> twice before the vsync signal, until hardware TE comes up.
>>>>>>
>>>>>> In this case the hardware interrupt responsible for providing this
>>>>>> signal - "disp-te" gpio - is not hooked up to the mdp5 vsync/pp logic at
>>>>>> all.  This solves severe panel update issues observed on at least the
>>>>>> Xperia Loire and Tone series, until said gpio is properly hooked up to
>>>>>> an irq.
>>>>>
>>>>> The reason the CONFIG_HEIGHT was at such a high value is to make sure that
>>>>> we always get the TE only from the panel vsync and not false positives
>>>>> coming
>>>>> from the tear check logic itself.


Correct, most CAF kernels mention such behaviour in comments, with
fallbacks to vtotal*2 for safety or vtotal when an emulated panel does
not support hardware TE at all.  We don't seem to (need to) support the 
latter case but one might at some point want to configure the tearcheck 
logic to emit a signal for every frame, by means of a DT property or 
automatically when disp-te is not defined.

>>>>>
>>>>> When you say that disp-te gpio is not hooked up, is it something
>>>>> incorrect with
>>>>> the schematic OR panel is not generating the TE correctly?
>>>>>


The GPIO is currently not used at all by this kernel driver besides a
call to devm_gpiod_get_optional.  As mentioned in the cover letter we
have patches in progress to hook up this interrupt line to the pp_done
infrastructure and complete vsync requests that way instead of waiting
for this "simulated" interrupt from the MDP.

>>> Currently I have this patch in msm-next-staging but I guess we need to
>>> decide in the next day or so whether to drop it or smash in a comment?
>>
>> Marijn, can you please urgently throw a comment in, reminding that these timers are interacting with TE and send a fast V2?
> 
> Or just reply on list w/ a comment to smash in, if that is easier

How about a comment along the lines of:

Tearcheck emits a blanking signal every vclks_line * vtotal * 2 ticks on 
the vsync_clk equating to roughly half the desired panel refresh rate. 
This is only necessary as stability fallback if interrupts from the 
panel arrive too late or not at all, but is currently used by default 
because these panel interrupts are not wired up yet.

I'd place this comment right above REG_MDP5_PP_SYNC_CONFIG_VSYNC, and 
perhaps add a newline after REG_MDP5_PP_SYNC_CONFIG_HEIGHT to make it 
clear this applies to those two registers specifically.  We can also 
involve MDP5_PP_SYNC_CONFIG_VSYNC_COUNT(vclks_line) in the mix.

Then, when the panel TE is wired up we can be smarter about the 
situation and print warnings when the user has disp-te hooked up but is 
receiving interrupts from the MDSS block instead of the panel directly 
(except if incidentally).  This likely means that SET_TEAR_ON was not 
sent to the panel or the GPIO is wrong.  In that sense this patch 
(together with x100 removal) is concealing configuration mistakes, but 
we might also revert back to 0xfff0 if the GPIO is specified in DT and 
accept the timeout+recovery which did not seem to hamper devices on 
downstream kernels anyway.

- Marijn
