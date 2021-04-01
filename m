Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B72F35145A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Apr 2021 13:13:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234000AbhDALMX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Apr 2021 07:12:23 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:33297 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233760AbhDALMU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Apr 2021 07:12:20 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20210401111218euoutp01c37e28da0b2f772678c50fdea7da3280~xt4ivOjMH3039430394euoutp01C
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Apr 2021 11:12:18 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20210401111218euoutp01c37e28da0b2f772678c50fdea7da3280~xt4ivOjMH3039430394euoutp01C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1617275538;
        bh=ujfA3T71LRzofJpX5nYviui2I10BsQ52TNd3YI/L44I=;
        h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
        b=cbK1AoK+dEdTOaKLIIx+Fg2gvM/SuDY5wedSI0utAFOZsslM/IiuOb6RkQknjga+E
         ZWPr9jxzyA3khdMCH7QvNow580GNUJ2lGYu9F29U4TxK+7zStsuoHlCzHf7NLsA7VE
         Xcn3n6YKk88e9Yuy7f8/aNSYQsacAMq2RQ4Rj3sE=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20210401111218eucas1p1abf78e42c1ecf30d21dca2bf232b8aff~xt4iJm-av2891828918eucas1p19;
        Thu,  1 Apr 2021 11:12:18 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id ED.88.09444.29AA5606; Thu,  1
        Apr 2021 12:12:18 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20210401111217eucas1p216733507e975578557232025c4fa881f~xt4hoGdvr0076600766eucas1p2d;
        Thu,  1 Apr 2021 11:12:17 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20210401111217eusmtrp2e40bf6ebeb51d772d28a5fb3a9e7e99b~xt4hnHSLO1222412224eusmtrp2N;
        Thu,  1 Apr 2021 11:12:17 +0000 (GMT)
X-AuditID: cbfec7f4-dd5ff700000024e4-26-6065aa927376
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id A3.31.08696.19AA5606; Thu,  1
        Apr 2021 12:12:17 +0100 (BST)
Received: from localhost (unknown [106.210.131.79]) by eusmtip2.samsung.com
        (KnoxPortal) with ESMTPA id
        20210401111215eusmtip2407c059f426bfe1f62567d5bbd68732f~xt4fyNxD90635106351eusmtip21;
        Thu,  1 Apr 2021 11:12:15 +0000 (GMT)
Message-ID: <b3c08808-204c-6a3c-3e58-a2766985b5ef@samsung.com>
Date:   Thu, 1 Apr 2021 13:12:15 +0200
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
In-Reply-To: <CAD=FV=XJ5qtMDn5B431ObPS0JU3-P3755N7jzLZbbcc6XpqYtg@mail.gmail.com>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrFKsWRmVeSWpSXmKPExsWy7djPc7qTVqUmGKx8xGHRe+4kk8Xp/e9Y
        LM4uO8hmceXrezaLq99fMlucfHOVxaJz4hJ2i4n7z7JbXN41h83iUF+0xbWfj5ktPs16yGyx
        4udWRov2LhuLn9fbmC2O33nK5CDg8f5GK7vH7IaLLB6zO2ayeize85LJY86iG8weJyZcYvK4
        c20Pm8f2bw9YPe53H2fyWDLtKpvHgd7JLB6fN8kF8ERx2aSk5mSWpRbp2yVwZXz4up+14Llu
        xZRNW9kaGLeqdDFyckgImEgcbtjKBmILCaxglNi+PxvC/sIo8eCkThcjF5D9mVFiascZdpiG
        z3P/s0EkljNKLLr3gwXCecEo0TVjCtgoXgE7ie8Xp4HZLAIqEtf+9LJAxAUlTs58AmaLCiRI
        rLqxnAnEFhZIkXi96SQziM0sIC7R9GUlK4gtIqAp8azhJTPIAmaBbywSv2/9BDuDDSjxd/NN
        sAWcAoESE34+YYNolpdo3jobrEFC4BynxMruf0AJDiDHReLXRzOIF4QlXh3fAvWOjMT/nfOZ
        IOx6ifsrWqB6Oxgltm7YyQyRsJa4c+4X2BxmoMXrd+lDhB0lpr1Zxggxnk/ixltBiBP4JCZt
        m84MEeaV6GgTgqhWlLh/divUQHGJpRe+sk1gVJqFFCqzkHw/C8kzsxD2LmBkWcUonlpanJue
        WmyUl1quV5yYW1yal66XnJ+7iRGYHE//O/5lB+PyVx/1DjEycTAeYpTgYFYS4RU+kJggxJuS
        WFmVWpQfX1Sak1p8iFGag0VJnDdpy5p4IYH0xJLU7NTUgtQimCwTB6dUA1N6kPDzfvlj3IoS
        W0/qqPy0kmG5pxu2h/Ho7Iqk3o0GzztvH1w9KWCqQ/nlBjfJoxxy1cYTr5yTvbo3dv1xx4/s
        5n9Z9H8+vcR1uHPzum0BP24INx9X2WX8pd5mmRb3d4Pof01frmtPdWqwD0sNjTlw8pGNdcOV
        6OpW7dsXU4u/Vfqe51ZccyXwz+O8+waap5Nkw/ROfHJxvCLzIb6zJjrq8N/ykPoKHanQEqsa
        Bt9W5n1rbybrGJRuKf6R8fiiU5ryE/0n4ctuPbts52Mv8m5ljNanPYyrj8ktzIycGZbTt/pG
        WbSg80Hjt9U9iS8vtHgdqWOPXazbt4+7a96e3Oqd4bbH74SduP1a9N90biWW4oxEQy3mouJE
        AEReEpb9AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpgleLIzCtJLcpLzFFi42I5/e/4Pd2Jq1ITDL5vULboPXeSyeL0/ncs
        FmeXHWSzuPL1PZvF1e8vmS1OvrnKYtE5cQm7xcT9Z9ktLu+aw2ZxqC/a4trPx8wWn2Y9ZLZY
        8XMro0V7l43Fz+ttzBbH7zxlchDweH+jld1jdsNFFo/ZHTNZPRbvecnkMWfRDWaPExMuMXnc
        ubaHzWP7twesHve7jzN5LJl2lc3jQO9kFo/Pm+QCeKL0bIryS0tSFTLyi0tslaINLYz0DC0t
        9IxMLPUMjc1jrYxMlfTtbFJSczLLUov07RL0Mj583c9a8Fy3YsqmrWwNjFtVuhg5OSQETCQ+
        z/3P1sXIxSEksJRR4n7PGzaIhLjE7vlvmSFsYYk/17qgip4xSpxb8gEswStgJ/H94jSwBhYB
        FYlrf3pZIOKCEidnPgGzRQUSJM5+mMcEYgsLpEg0flzJCGIzAy1o+rKSFcQWEdCUeNbwkhlk
        AbPAHxaJjz1zWSC23WCSeHigHWwDG1DV3803wWxOgUCJCT+fsEFMMpPo2toFNVVeonnrbOYJ
        jEKzkBwyC8nCWUhaZiFpWcDIsopRJLW0ODc9t9hIrzgxt7g0L10vOT93EyMwKWw79nPLDsaV
        rz7qHWJk4mA8xCjBwawkwit8IDFBiDclsbIqtSg/vqg0J7X4EKMpMDQmMkuJJucD01JeSbyh
        mYGpoYmZpYGppZmxkjivyZE18UIC6YklqdmpqQWpRTB9TBycUg1Muw7MDWHmnMp60PZqztHk
        bbMYTFpVQrTi10krqzYGbPkfzlr9q9RjStXsazWP/DfX3jQQ2lLbmhdUfyV20vbyFpMXCTNb
        Uk2Xemis2WV2Y0GzVFhNyr/Z/3zMmZfsa7JosOc8cPP5fpX22eaL+yL7dW7MWsuXo37/bYHK
        Ib7XDwvXBvR4/eB0Prb3lOHTMjWLj7UJp4zk1FKEHAzDt//fd2KabuzeLbquvD27D5q8Upvy
        dALrheUVZjYhNg7fOneeWLKvuXOeje+x1bYMFjtmif1/o7mp/HPzaRGXutU325+uSVJU8TRw
        27k25Wnb7kVtjHYXuyTfPg+4VmEh3RIz//rpQOWU6nquXf0Rj6YqsRRnJBpqMRcVJwIAeo73
        ipMDAAA=
X-CMS-MailID: 20210401111217eucas1p216733507e975578557232025c4fa881f
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
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


W dniu 31.03.2021 o 16:48, Doug Anderson pisze:
> Hi,
>
> On Wed, Mar 31, 2021 at 4:08 AM Andrzej Hajda <a.hajda@samsung.com> wrote:
>>
>> W dniu 30.03.2021 o 04:53, Douglas Anderson pisze:
>>> eDP panels won't provide their EDID unless they're powered on. Let's
>>> chain a power-on before we read the EDID. This roughly matches what
>>> was done in 'parade-ps8640.c'.
>>>
>>> NOTE: The old code attempted to call pm_runtime_get_sync() before
>>> reading the EDID. While that was enough to power the bridge chip on,
>>> it wasn't enough to talk to the panel for two reasons:
>>> 1. Since we never ran the bridge chip's pre-enable then we never set
>>>      the bit to ignore HPD. This meant the bridge chip didn't even _try_
>>>      to go out on the bus and communicate with the panel.
>>> 2. Even if we fixed things to ignore HPD, the EDID still wouldn't read
>>>      if the panel wasn't on.
>>>
>>> One thing that's a bit odd here is taking advantage of the EDID that
>>> the core might have cached for us. See the patch ("drm/edid: Use the
>>> cached EDID in drm_get_edid() if eDP"). We manage to get at the cache
>>> by:
>>> - Instantly failing aux transfers if we're not powered.
>>> - If the first read of the EDID fails we try again after powering.
>>>
>>> Fixes: 58074b08c04a ("drm/bridge: ti-sn65dsi86: Read EDID blob over DDC")
>>> Signed-off-by: Douglas Anderson <dianders@chromium.org>
>>> ---
>>> Depending on what people think of the other patches in this series,
>>> some of this could change.
>>> - If everyone loves the "runtime PM" in the panel driver then we
>>>     could, in theory, put the pre-enable chaining straight in the "aux
>>>     transfer" function.
>>> - If everyone hates the EDID cache moving to the core then we can
>>>     avoid some of the awkward flow of things and keep the EDID cache in
>>>     the sn65dsi86 driver.
>>
>> I wonder if this shouldn't be solved in the core - ie caller of
>> get_modes callback should be responsible for powering up the pipeline,
>> otherwise we need to repeat this stuff in every bridge/panel driver.
>>
>> Any thoughts?
> Yeah, I did look at this a little bit. Presumably it would only make
> sense to do it for eDP connections since:
>
> a) The concept of reading an EDID doesn't make sense for things like MIPI.

I guess you mean MIPI DSI, and yes I agree, more generally it usually(!) 
doesn't make sense for any setup with fixed display panel.

On the other hand there are DSI/HDMI or DSI/DP adapters which usually 
have EDID reading logic.

And the concept makes sense for most connectors accepting external 
displays: HDMI, DP, MHL, VGA...

>
> b) For something with an external connector (DP and HDMI) you don't
> even know they're inserted unless the EDID is ready to read (these
> devices are, essentially, always powered).

Usually there are two elements which are not the same:

1. HotPlug signal/wire.

2. EDID reading logic.

The logic responsible for reading EDID needs to be enabled only for time 
required for EDID reading :) So it's power state often must be 
controlled explicitly by the bridge driver. So even if in many cases 
pre_enable powers on the logic for EDID reading it does not make it the 
rule, so I must step back from my claim that it is up to caller :)


>
> So I started off trying to do this in the core for eDP, but then it
> wasn't completely clear how to write this code in a way that was super
> generic. Specifically:
>
> 1. I don't think it's a 100% guarantee that everything is powered on
> in pre-enable and powered off in post-disable. In this bridge chip
> it's true, but maybe not every eDP driver? Would you want me to just
> assume this, or add a flag?

Ok, pre_enable should power on the chip, but for performing 
initialization of video transport layer. Assumption it will power on 
EDID logic is incorrect, so my claim seems wrong, but also this patch 
looks incorrect :)

In general only device containing EDID logic knows how to power it up.

Since I do not know your particular case I can propose few possible ways 
to investigate:

- call bridge.next->get_modes - you leave responsibility for powering up 
to the downstream device.

- ddc driver on i2c request should power up the panel - seems also correct,


Regards

Andrzej


>
> 2. It wasn't totally clear to me which state to use for telling if the
> bridge had already been pre-enabled so I could avoid double-calling
> it. I could dig more if need be but I spent a bit of time looking and
> was coming up empty. If you have advice I'd appreciate it, though.
>
> 3. It wasn't clear to me if I should be using the atomic version
> (drm_atomic_bridge_chain_pre_enable) if I put this in the core and how
> exactly to do this, though I am a self-admitted DRM noob. I can do
> more digging if need be. Again, advice is appreciated.
>
> 4. Since I got feedback that the EDID caching belongs in the driver,
> not in the core [1] then we might end up powering things up
> pointlessly since the core wouldn't know if the driver was going to
> return the cache or not.
>
> Given that this patch isn't too much code and not too complicated (and
> will be even less complicated if I move the EDID caching back into the
> driver), maybe we can land it and if we see the pattern repeat a bunch
> more times then think about moving it to the core?
>
>
> [1] https://lore.kernel.org/dri-devel/YGMvO3PNDCiBmqov@intel.com/
>
> -Doug
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://protect2.fireeye.com/v1/url?k=e133dd76-bea8e47a-e1325639-000babff3563-c6b07779450426d5&q=1&e=fd12ab0a-1858-4d09-a3b6-0ff1336fc2ba&u=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Fdri-devel
>
