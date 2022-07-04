Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38600565D66
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Jul 2022 20:14:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233330AbiGDSOn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Jul 2022 14:14:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231281AbiGDSOl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Jul 2022 14:14:41 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA423637C
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Jul 2022 11:14:40 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id j21so17015577lfe.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Jul 2022 11:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=yK261D6HT2CVyvMevzRHg6YQDQr/r3Jm74jKb1CkJiA=;
        b=u5E0t5qI//wrIJMe7jyJw1s5HaBn6u2jtbBpeqrjqVCy5pEtO5+2UR59UJlmSGcDCT
         l1jw+MYdnW15Xi0g8am4oVWwxVfXE7XMMAc7/xL2pyw11VIaCuL9sx15zvOSeEvkr7rR
         z5XWhD5XGrKcJ9vhDc68aCmfDg2EqI5LCkKDqdm5aHm79fqjgLrGtNepYA8GZGEAzM9/
         qdFVoxoxGsNiQC2SJx1z2crW6CgeGUxN7hqxrMrK0My217aEFMKo6t3VnFSRUMs4k/np
         EiCpPjZl6akLiyKdhF/LPkDgjD97ehSE13uQxmxp7ZUmXlgHgujueO9Qb45scuRvyrr4
         UM5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=yK261D6HT2CVyvMevzRHg6YQDQr/r3Jm74jKb1CkJiA=;
        b=aAxJjIN3gEj7oh7VMAScdVJzCCXO+DnonWaCRYB8UT2JOWhVbAwTE7k05wcr0YdL+R
         y/r3OJYgJxRRSikCdrX1WlEQ8b+xEAAEIk8mrsJJ4vGegMTTGHTY23sM3nJajhvJIUiw
         TfM6ShPP/GxqORO+Jw06hHYQ5c7R6onIid17ESz9OiR82DO/mB+vV/icMK664D1s4dAt
         odSyuMP2uCGdf9CLQ/doR0fmwB1HAoAoMu/YmNd58j+6EUB2LUxOLaD5BY0nY7n3NJzz
         SiiA4N0t2DNHx33fW/vWUePLBaeBl/byCwdxTeqvC2kZyAAovl2IvYTyGlf0CzKh9MGq
         N7Cg==
X-Gm-Message-State: AJIora+Hew1d/4qT7s96NzH39/gfKWrYe4CmIxGEsNwbodHMXLxy80Gc
        1Mc20oPBSxVKfmE85GYeMQwEeA==
X-Google-Smtp-Source: AGRyM1voejqIQUfyQJAn5Pr/jmcGfGNP7559mIQvMxHIsFHFO6GgCyiRVTIEUYv0pJ8ArEc6s8M3Fg==
X-Received: by 2002:a05:6512:15a1:b0:47f:933e:a865 with SMTP id bp33-20020a05651215a100b0047f933ea865mr18387360lfb.200.1656958478998;
        Mon, 04 Jul 2022 11:14:38 -0700 (PDT)
Received: from [192.168.1.212] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id d6-20020a2e96c6000000b0025bdd6af056sm3461335ljj.45.2022.07.04.11.14.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Jul 2022 11:14:38 -0700 (PDT)
Message-ID: <1df69cf9-7610-45af-240c-1b8e02953bc1@linaro.org>
Date:   Mon, 4 Jul 2022 21:14:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] drm/msm/dp: make eDP panel as the first connected
 connector
Content-Language: en-GB
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>,
        Doug Anderson <dianders@chromium.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc:     Sean Paul <sean@poorly.run>, Stephen Boyd <swboyd@chromium.org>,
        Vinod Koul <vkoul@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "Abhinav Kumar (QUIC)" <quic_abhinavk@quicinc.com>,
        "Aravind Venkateswaran (QUIC)" <quic_aravindh@quicinc.com>,
        "Kuogee Hsieh (QUIC)" <quic_khsieh@quicinc.com>,
        Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        freedreno <freedreno@lists.freedesktop.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
References: <1656429606-2765-1-git-send-email-quic_khsieh@quicinc.com>
 <F35C87BF-46A5-41D3-B8A5-B2AB4A24252D@linaro.org>
 <CAD=FV=X3cv=Q30pODyi__OyRY+LbFT14RfEELvm_DAeHafF70g@mail.gmail.com>
 <CAF6AEGvFYK3x_CmErkKsmYNEv9y8AksE9UB_sfp-Z7RieX=tVg@mail.gmail.com>
 <E87F561E-22B4-46B6-AD9B-4995E92A8E29@linaro.org>
In-Reply-To: <E87F561E-22B4-46B6-AD9B-4995E92A8E29@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30/06/2022 09:14, Dmitry Baryshkov wrote:
> 
> 
> On 30 June 2022 04:57:35 GMT+03:00, Rob Clark <robdclark@gmail.com> wrote:
>> On Wed, Jun 29, 2022 at 5:36 PM Doug Anderson <dianders@chromium.org> wrote:
>>>
>>> Hi,
>>>
>>> On Tue, Jun 28, 2022 at 1:14 PM Dmitry Baryshkov
>>> <dmitry.baryshkov@linaro.org> wrote:
>>>>
>>>> On 28 June 2022 18:20:06 GMT+03:00, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>>>>> Some userspace presumes that the first connected connector is the main
>>>>> display, where it's supposed to display e.g. the login screen. For
>>>>> laptops, this should be the main panel.
>>>>>
>>>>> This patch call drm_helper_move_panel_connectors_to_head() after
>>>>> drm_bridge_connector_init() to make sure eDP stay at head of
>>>>> connected connector list. This fixes unexpected corruption happen
>>>>> at eDP panel if eDP is not placed at head of connected connector
>>>>> list.
>>>>
>>>> The change itself is a good fix anyway. (And I'd ack it.) However I would like to understand why does it fix the corruption issue. What is we have eDP and DSI, with DSI ending up before the eDP? Would we see the issue?
>>>> Also could you please describe the mind of corruption you are observing?
>>>
>>> I've spent a whole bunch of time poking at this and in the end my
>>> conclusion is this:
>>>
>>> 1. The glitchyness seems to be a result of the Chrome OS userspace
>>> somehow telling the kernel to do something wrong.
>>>
>>> 2. I believe (though I have no proof other than Kuogee's patch fixing
>>> things) that the Chrome OS userspace is simply confused by the eDP
>>> connector being second. This would imply that Kuogee's patch is
>>> actually the right one.
>>>
>>> 3. It would be ideal if the Chrome OS userspace were fixed to handle
>>> this, but it's an area of code that I've never looked at. It also
>>> seems terribly low priority to fix since apparently other OSes have
>>> similar problems (seems like this code was originally added by
>>> RedHat?)
>>>
>>>
>>> Specifically, I tested with a similar but "persistent" glitch that I
>>> reproduced. The glitch Kuogee was digging into was a transitory glitch
>>> on the eDP (internal) display when you plugged in a DP (external)
>>> display. It would show up for a frame or two and then be fixed. I can
>>> get a similar-looking glitch (vertical black and white bars) that
>>> persists by doing these steps on a Chrome OS device (and Chrome OS
>>> kernel):
>>>
>>> a) Observe screen looks good.
>>> b) Observe DP not connected.
>>> c) Plug in DP
>>> d) See transitory glitch on screen, then it all looks fine.
>>> e) set_power_policy --ac_screen_dim_delay=5 --ac_screen_off_delay=10
>>> f) Wait for screen to turn off
>>> g) Unplug DP
>>> h) Hit key on keyboard to wake device.
>>> i) See glitchy.
>>> j) Within 5 seconds: set_power_policy --ac_screen_dim_delay=5000
>>> --ac_screen_off_delay=10000
>>>
>>> Once I'm in the persistent glitch:
>>>
>>> * The "screenshot" command in Chrome OS shows corruption. Not exactly
>>> black and white bars, but the image produced has distinct bands of
>>> garbage.
>>>
>>> * I can actually toggle between VT2 and the main screen (VT1). Note
>>> that VT1/VT2 are not quite the normal Linux managed solution--I
>>> believe they're handled by frecon. In any case, when I switch to VT2
>>> it looks normal (I can see the login prompt). Then back to VT1 and the
>>> vertical bars glitch. Back to VT2 and it's normal. Back to VT1 and the
>>> glitch again. This implies (especially with the extra evidence of
>>> screenshot) that the display controller hardware is all fine and that
>>> it's the underlying data that's somehow messed up.
>>
>> fwiw, from looking at this a bit w/ Doug, I think the "glitch" is
>> simply just an un-renderered buffer being interpreted by the display
>> controller as UBWC (because userspace tells it to)
> 
> Thanks for the description. I think the userspace code should be fixed too, but this patch can go in on its own.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

After some time (please excuse me), musing with the code and even 
picking up the commit for the merge branch, I understood the fact that I 
did not like about this change. It moves all panel connectors (generic 
code) from the DP-specific driver.

I'd like to retract my R-b. Please move this call to the msm_drm_init(). 
Calling this function somewhere after the ->kms_init() would make sure 
that all panel connectors are close to the top of the list, whichever 
MDP/DPU driver is used and whichever actual interface is bound to this 
panel.

> 
> 
>>
>> BR,
>> -R
>>
>>> When I pick Kuogee's patch then this "persistent" glitch goes away
>>> just like the transitory one does.
>>>
>>> I'm going to go ahead and do:
>>>
>>> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>>> Tested-by: Douglas Anderson <dianders@chromium.org>
> 


-- 
With best wishes
Dmitry
