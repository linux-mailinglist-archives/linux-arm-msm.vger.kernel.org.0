Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C57BE3559AB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Apr 2021 18:52:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346636AbhDFQwZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Apr 2021 12:52:25 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:46701 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234931AbhDFQwW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Apr 2021 12:52:22 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20210406165209euoutp01e2b8e1b0f51ba7a2ab9bca18c9e09596~zUvspRMug0151001510euoutp015
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Apr 2021 16:52:09 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20210406165209euoutp01e2b8e1b0f51ba7a2ab9bca18c9e09596~zUvspRMug0151001510euoutp015
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1617727929;
        bh=090NTRiJVaobkbqLasuUUrFf/cGh73aIDpFnCtD7kD4=;
        h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
        b=DWd0/OZ6cqwtMqsQujfIuQ0TYGZvSZQ6r8wWNp7Rn3yJ3SrQkqZj+mjA2niqqhTC3
         Uig0oyaMPi8OsnPzV9GncGaiqwiN7LbeF1nwlqRIrnTN8AQYORRu1gOvbip2Ejb6XY
         GVTWUIXq/MKQ/3hh5/hwwsDDoGB+aZteNRtV6zOw=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20210406165209eucas1p21673fdfc8ce24084e904f001a521ed72~zUvr79Mo01965119651eucas1p2M;
        Tue,  6 Apr 2021 16:52:09 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id CF.14.09444.8B19C606; Tue,  6
        Apr 2021 17:52:08 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20210406165208eucas1p20559671356e4add4bb66ef9349c2ffaa~zUvrY5M5h1965119651eucas1p2L;
        Tue,  6 Apr 2021 16:52:08 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20210406165208eusmtrp1bf790a16349b14c62d3398754b39fe76~zUvrX_ZVK1584415844eusmtrp1Y;
        Tue,  6 Apr 2021 16:52:08 +0000 (GMT)
X-AuditID: cbfec7f4-dbdff700000024e4-4b-606c91b81d65
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 75.31.08705.8B19C606; Tue,  6
        Apr 2021 17:52:08 +0100 (BST)
Received: from localhost (unknown [106.210.131.79]) by eusmtip2.samsung.com
        (KnoxPortal) with ESMTPA id
        20210406165207eusmtip2bcdbd08e5c36a2a845fbd94b4190c9b6~zUvqoMqOj0319703197eusmtip2L;
        Tue,  6 Apr 2021 16:52:07 +0000 (GMT)
Message-ID: <7bc4ce04-4110-8b8a-067b-824296b52480@samsung.com>
Date:   Tue, 6 Apr 2021 18:52:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:88.0)
        Gecko/20100101 Thunderbird/88.0
Subject: Re: [PATCH v2 11/14] drm/bridge: ti-sn65dsi86: Power things
 properly for reading the EDID
Content-Language: en-GB
To:     Doug Anderson <dianders@chromium.org>
Cc:     Rob Clark <robdclark@chromium.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonas Karlman <jonas@kwiboo.se>,
        David Airlie <airlied@linux.ie>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        LKML <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Robert Foss <robert.foss@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Steev Klimaszewski <steev@kali.org>
From:   Andrzej Hajda <a.hajda@samsung.com>
In-Reply-To: <CAD=FV=WS8=hi07tA=t_5xOfPkb8TqY63A712uhJg4H8pUPCRJw@mail.gmail.com>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrNKsWRmVeSWpSXmKPExsWy7djP87o7JuYkGHy5Ym3Re+4kk8Xp/e9Y
        LM4uO8hmceXrezaLq99fMlucfHOVxaJz4hJ2i4n7z7JbXN41h83iUF+0xbWfj5ktPs16yGyx
        4udWRov2LhuLn9fbmC2O33nK5CDg8f5GK7vH7IaLLB6zO2ayeize85LJY86iG8weJyZcYvK4
        c20Pm8f2bw9YPe53H2fyWDLtKpvHgd7JLB6fN8kF8ERx2aSk5mSWpRbp2yVwZfzcs4K9oNGj
        4nzrDrYGxncWXYycHBICJhITlhxk6WLk4hASWMEosWLTPVaQhJDAF0aJ+Z9qIBKfGSXa+mcx
        wXQ8fLKbEaJoOaPEr30yEEUvGCVa9+1hAUnwCthJfD1wHqyBRUBFou/MREaIuKDEyZlPwGpE
        BRIkVt1YDlYjLJAi8XrTSWYQm1lAXKLpy0qwK0QENCWeNbxkBlnALPCNReL3rZ/sIAk2oMTf
        zTfZQGxOgUCJjxMms0E0y0s0b50N1iAhcIlTou/DF2aIs10kDnzuh7KFJV4d38IOYctInJ7c
        wwJh10vcX9EC1dzBKLF1w06oBmuJO+d+AW3gANqgKbF+lz5E2FFi2ptljCBhCQE+iRtvBSFu
        4JOYtG06M0SYV6KjTQiiWlHi/tmtUAPFJZZe+Mo2gVFpFlKwzELy/iwk38xC2LuAkWUVo3hq
        aXFuemqxUV5quV5xYm5xaV66XnJ+7iZGYHo8/e/4lx2My1991DvEyMTBeIhRgoNZSYR3R292
        ghBvSmJlVWpRfnxRaU5q8SFGaQ4WJXHepC1r4oUE0hNLUrNTUwtSi2CyTBycUg1Mve6Sq6PX
        reqeGb1P6f97n625V+xj/6/qtZ9gvvVU9mSG2bO19cpPR3yKWCm19tP6Ik0VkbVz5z9PdFxY
        eKA1v7EgbN6tX68PuWzUV148oTzEd52F8neNXQXvDn6Nvd8bqhseZXpq9fpZ7CmRGlJvjnet
        bNE8Y9h4+IXfSfn9irsndVg5nMh1TbpdYmfw94qtU0m4yOsZNnNP5VQfeS38qu9n7VSfJc83
        z0owEdzNtXZzzR7J9ZvmMtVsY47wuz+rw2wRbwXzvd27g/em5d+PF9Vt6H1kvk5u0c2lZ8uz
        53Ud7mH5N0Xlz+Q7/5KjNVj91z2SPMW4ZorH/vAIweOLVkXbzU2q1r8/nydp5e4fN5VYijMS
        DbWYi4oTAaGMwQn+AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpgleLIzCtJLcpLzFFi42I5/e/4Pd0dE3MSDFbPlbDoPXeSyeL0/ncs
        FmeXHWSzuPL1PZvF1e8vmS1OvrnKYtE5cQm7xcT9Z9ktLu+aw2ZxqC/a4trPx8wWn2Y9ZLZY
        8XMro0V7l43Fz+ttzBbH7zxlchDweH+jld1jdsNFFo/ZHTNZPRbvecnkMWfRDWaPExMuMXnc
        ubaHzWP7twesHve7jzN5LJl2lc3jQO9kFo/Pm+QCeKL0bIryS0tSFTLyi0tslaINLYz0DC0t
        9IxMLPUMjc1jrYxMlfTtbFJSczLLUov07RL0Mn7uWcFe0OhRcb51B1sD4zuLLkZODgkBE4mH
        T3YzdjFycQgJLGWUaGm6yQSREJfYPf8tM4QtLPHnWhcbRNEzRonnO++wgCR4Bewkvh44D9bA
        IqAi0XdmIiNEXFDi5MwnYDWiAgkSZz/MA6sRFkiRaPy4EqyGGWhB05eVrCC2iICmxLOGl8wg
        C5gF/rBIfOyZywKx7QqzxK8n28Cq2ICq/m6+yQZicwoESnycMJkNYpKZRNfWLqip8hLNW2cz
        T2AUmoXkkFlIFs5C0jILScsCRpZVjCKppcW56bnFhnrFibnFpXnpesn5uZsYgUlh27Gfm3cw
        znv1Ue8QIxMH4yFGCQ5mJRHeHb3ZCUK8KYmVValF+fFFpTmpxYcYTYGhMZFZSjQ5H5iW8kri
        Dc0MTA1NzCwNTC3NjJXEebfOXRMvJJCeWJKanZpakFoE08fEwSnVwHRQe9UV5m26wffSmPfm
        8li948idOevEh0zGgzyLeL+eWC31LPdSi/q1vbazjMK1WVeKBN3ckGXP8VR89x9du+A+eW2P
        3dKSW1pD4p6v/jEnVvnqVIcdd+bvdygKfKA4zXPijPXfN8azGNf/Te/e8KqtYXLYvPDylQFr
        G87ud5c6uOBlh9tcW997ixNa+DLEK+S6gpaYKfzsOzP1uRDLr0PLz7WlXOieN2XjlQOVe2aF
        6m3cf/eJv/WZdmFXkxVe06wtPpUxfrS0vGU/a0v22S2yub6nvjA2cRzaxNJQUfTv57I5q7Wt
        ti69aXWe48DJk9nLsr6VSaewfrl5eFbIJN/jtSU7801MVEp/sXTKiegosRRnJBpqMRcVJwIA
        3sgSFJMDAAA=
X-CMS-MailID: 20210406165208eucas1p20559671356e4add4bb66ef9349c2ffaa
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210330025435eucas1p12b96966451ee0691f6d5d99b64ac2c8b
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210330025435eucas1p12b96966451ee0691f6d5d99b64ac2c8b
References: <20210330025345.3980086-1-dianders@chromium.org>
        <CGME20210330025435eucas1p12b96966451ee0691f6d5d99b64ac2c8b@eucas1p1.samsung.com>
        <20210329195255.v2.11.Ied721dc895156046ac523baa55a71da241cd09c7@changeid>
        <8887ded7-d1ab-844c-e3a3-f39f6ef6264a@samsung.com>
        <CAD=FV=XJ5qtMDn5B431ObPS0JU3-P3755N7jzLZbbcc6XpqYtg@mail.gmail.com>
        <b3c08808-204c-6a3c-3e58-a2766985b5ef@samsung.com>
        <CAD=FV=WS8=hi07tA=t_5xOfPkb8TqY63A712uhJg4H8pUPCRJw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello again after easter,


I have looked little bit more at sn65* driver and its application to 
have better background.

I miss only info what panel do you have, how it is enabled/power controlled.


W dniu 01.04.2021 o 16:57, Doug Anderson pisze:
> Hi,
>
> On Thu, Apr 1, 2021 at 4:12 AM Andrzej Hajda <a.hajda@samsung.com> wrote:
>>
>> W dniu 31.03.2021 o 16:48, Doug Anderson pisze:
>>> Hi,
>>>
>>> On Wed, Mar 31, 2021 at 4:08 AM Andrzej Hajda <a.hajda@samsung.com> wrote:
>>>> W dniu 30.03.2021 o 04:53, Douglas Anderson pisze:
>>>>> eDP panels won't provide their EDID unless they're powered on. Let's
>>>>> chain a power-on before we read the EDID. This roughly matches what
>>>>> was done in 'parade-ps8640.c'.
>>>>>
>>>>> NOTE: The old code attempted to call pm_runtime_get_sync() before
>>>>> reading the EDID. While that was enough to power the bridge chip on,
>>>>> it wasn't enough to talk to the panel for two reasons:
>>>>> 1. Since we never ran the bridge chip's pre-enable then we never set
>>>>>       the bit to ignore HPD. This meant the bridge chip didn't even _try_
>>>>>       to go out on the bus and communicate with the panel.
>>>>> 2. Even if we fixed things to ignore HPD, the EDID still wouldn't read
>>>>>       if the panel wasn't on.
>>>>>
>>>>> One thing that's a bit odd here is taking advantage of the EDID that
>>>>> the core might have cached for us. See the patch ("drm/edid: Use the
>>>>> cached EDID in drm_get_edid() if eDP"). We manage to get at the cache
>>>>> by:
>>>>> - Instantly failing aux transfers if we're not powered.
>>>>> - If the first read of the EDID fails we try again after powering.
>>>>>
>>>>> Fixes: 58074b08c04a ("drm/bridge: ti-sn65dsi86: Read EDID blob over DDC")
>>>>> Signed-off-by: Douglas Anderson <dianders@chromium.org>
>>>>> ---
>>>>> Depending on what people think of the other patches in this series,
>>>>> some of this could change.
>>>>> - If everyone loves the "runtime PM" in the panel driver then we
>>>>>      could, in theory, put the pre-enable chaining straight in the "aux
>>>>>      transfer" function.
>>>>> - If everyone hates the EDID cache moving to the core then we can
>>>>>      avoid some of the awkward flow of things and keep the EDID cache in
>>>>>      the sn65dsi86 driver.
>>>> I wonder if this shouldn't be solved in the core - ie caller of
>>>> get_modes callback should be responsible for powering up the pipeline,
>>>> otherwise we need to repeat this stuff in every bridge/panel driver.
>>>>
>>>> Any thoughts?
>>> Yeah, I did look at this a little bit. Presumably it would only make
>>> sense to do it for eDP connections since:
>>>
>>> a) The concept of reading an EDID doesn't make sense for things like MIPI.
>> I guess you mean MIPI DSI
> Yes, sorry! I'll try to be more clear.
>
>
>> and yes I agree, more generally it usually(!)
>> doesn't make sense for any setup with fixed display panel.
>>
>> On the other hand there are DSI/HDMI or DSI/DP adapters which usually
>> have EDID reading logic.
>>
>> And the concept makes sense for most connectors accepting external
>> displays: HDMI, DP, MHL, VGA...
> So, actually, IMO the concept doesn't make sense for anything with an
> external connector. Here's the logic for a handful of connectors:
>
> 1. MIPI DSI: there is no EDID so this doesn't make sense.
>
> 2. An external connector (HDMI, DP, etc): the display that's plugged
> in is externally powered so doesn't need us to power it up to read the
> EDID. By definition, when the HPD signal is asserted then it's OK to
> read the EDID and we don't even know if a display is plugged in until
> HPD is asserted. Thus no special power sequencing is needed to read
> the EDID.  (Yes, we need to make sure that the eDP controller itself
> is powered, but that doesn't seem like it's the core's business).

Not true IMO, even if external device is powered on, you must enable 
EDID-reader logic.

I guess it is not uncommon to have different power states for EDID 
reading and bridge/panel pre-enablement (especially in embedded world). 
In fact there are setups where EDID-reader is totally different device 
than the bridge itself, and these devices should be 
powered/enabled/operational only for time of EDID reading.

>
> 3. eDP: this is where it matters. This is because:
>
> 3a) eDP displays aren't powered all the time. If you just boot up or
> you blank your screen, likely the display has no power at all.
>
> 3b) Because the display has no power, the "HPD" signal doesn't assert.
> In fact, for eDP the "HPD" signal really should mean "display ready"
> or "display finished powering up".
>
> 3c) Even though we never get a HPD signal, we still simply assume that
> a display is present because this is an "embedded" device.
>
> So eDP is unique (as far as I know) in that it's a type of display
> that has an EDID but that we will report "a display is here" before
> we've powered up the display and before we can read the EDID.
>
>>> b) For something with an external connector (DP and HDMI) you don't
>>> even know they're inserted unless the EDID is ready to read (these
>>> devices are, essentially, always powered).
>> Usually there are two elements which are not the same:
>>
>> 1. HotPlug signal/wire.
>>
>> 2. EDID reading logic.
>>
>> The logic responsible for reading EDID needs to be enabled only for time
>> required for EDID reading :) So it's power state often must be
>> controlled explicitly by the bridge driver. So even if in many cases
>> pre_enable powers on the logic for EDID reading it does not make it the
>> rule, so I must step back from my claim that it is up to caller :)
> OK, I'll plan to keep it in the bridge chip driver now.
>
>
>>> So I started off trying to do this in the core for eDP, but then it
>>> wasn't completely clear how to write this code in a way that was super
>>> generic. Specifically:
>>>
>>> 1. I don't think it's a 100% guarantee that everything is powered on
>>> in pre-enable and powered off in post-disable. In this bridge chip
>>> it's true, but maybe not every eDP driver? Would you want me to just
>>> assume this, or add a flag?
>> Ok, pre_enable should power on the chip, but for performing
>> initialization of video transport layer. Assumption it will power on
>> EDID logic is incorrect, so my claim seems wrong, but also this patch
>> looks incorrect :)
>>
>> In general only device containing EDID logic knows how to power it up.
> I still believe my patch is correct. Specifically I don't need to make
> any assumptions about display elements upstream of me (sources of the
> bridge chip). I only need to make assumptions about the pre-enable of
> the bridge driver itself and anything downstream of it.
>
> At the moment downstream of this particular bridge chip is always a
> panel device. Even further, all known downstream devices are
> "simple-panel". That is known to power up the panel enough to read the
> EDID in the "prepare" stage.
>
> Sure, someone _could_ add another bridge downstream in some design,
> but it would be up to that person to either fix that downstream driver
> to power itself in pre-enable or to add some type of quirk disabling
> the EDID reading.
>
>
>> Since I do not know your particular case I can propose few possible ways
>> to investigate:
>>
>> - call bridge.next->get_modes - you leave responsibility for powering up
>> to the downstream device.
> The "next" bridge is the panel, so I don't think this works.


Then drm_panel_get_modes will work then.


>
>
>> - ddc driver on i2c request should power up the panel - seems also correct,
> Right, so I could put the
> "drm_bridge_chain_pre_enable(&pdata->bridge)" into the
> ti_sn_aux_transfer() function. I talked about that a little bit "after
> the cut" in my post where I said:
>
>> - If everyone loves the "runtime PM" in the panel driver then we
>>    could, in theory, put the pre-enable chaining straight in the "aux
>>    transfer" function.
> The reason for the dependence on "runtime PM" in the panel driver is
> that we are doing DDC over AUX and it breaks the EDID reading into
> lots of chunks so if we did the powering up and powering down there it
> would be crazy slow without the delayed poweroff.


OK, it resembles to me DSI-controlled panel - to query/configure panel 
panel driver asks DSI-host to transfer some bytes to the panel and/or 
back via DSI-bus.

In case of eDP panels we could do similar thing to read edid - we call 
drm_panel_get_modes - it calls drm_panel_funcs.get_modes callback and it 
decides (based on DT) if it should fill modes according to hardcoded 
info into the driver or to ask the physical panel via DP-controller - 
this way all the players (the panel, AUX/DDC device) will know what to 
power-up.

I guess there is missing pieces - there is no DP bus :), I am not sure 
if there is straight way to access panel's aux/ddc from the panel 
driver, maybe somehow via drm_connector ???

Of course this only my idea - to be discussed with others.


Regards

Andrzej



>
> -Doug
>
