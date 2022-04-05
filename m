Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 828E54F4BF2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Apr 2022 03:10:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1575434AbiDEXHg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Apr 2022 19:07:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1572970AbiDERiH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Apr 2022 13:38:07 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6669B8202
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Apr 2022 10:36:06 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id bu29so24632360lfb.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Apr 2022 10:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=VdUHrOr8rp3LLgCgyl1hCTi6yFRnf6ES2BvzvWYzkNo=;
        b=xmsdaZdzayKOem9wRw1CE3E7NyvNdzu7tsXXm8Kp3qulQg/KFkFfUxlGVDL5RCbyq4
         fus9Ue0eApdYw+eZpQdd/xEPTIMcUG/8hUT0FKA3qnTc/W0ceIl2Gu5MQWxLNsX2UBZ3
         hzrfmPPlonBK8hz/rjUnyVuZFPo/0fDJswQ2NqCdLlqmmlMUWJ/5Z6WYHWrGA14IqgdD
         QdEH2Wk6sIe/m3K2MXjK83SS01H8lrrWZaTQA469MIafcunco1FCdjrAk7Cc2iXd8Wlq
         HqnOub5Cvf+Ujs/rZWAl7F+bhaT9jqeSoqqj2H0mR6a21sri62KOIfSCiXEfW5Di/WT5
         TBMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=VdUHrOr8rp3LLgCgyl1hCTi6yFRnf6ES2BvzvWYzkNo=;
        b=Uq1Gevajy1joTt8gp/fhrEVQ1n0s9yQFG5UemscwE6jc+pyg8Te8K6VDDnL5/1UMIu
         +O4AS74Ys06etNJeoHB2TNP917aJvhuwlIZaSKKAz+NxrupnZ0nwj0xkHsNVMo+ku/R6
         m+RUKAHO1ble37g3dbijXPOA/o6Abeg7sgOqxeebrO4taiVIyyyMhvLgg8yIJtO1U5OO
         jBf5JaMNoP/xOpQchA3pMkbiRre76KUlMPvNYRZSDm/rlnIdX7t+0wqGHryoWJkd3AGw
         3zcqNJafVx+O+l6xlsbjC+VrCVhBYB3MpJ+LwnrKqXsDbbbdFnBBXKT7W9hPIsDjs6Yb
         fiOA==
X-Gm-Message-State: AOAM531LSJvQNm3c5oWvFUb5RN94YxhaLKDSYHZWKt9yvcsiAoJAKFgA
        SBl1H5iPiAK2LyeftvhJiM0tVg==
X-Google-Smtp-Source: ABdhPJzMd3HmY/nj1P/l2+WE0GFqnmG0a2a62aA76/v5WzjABUpaiFVfU5B6qrHOWmqZFUEpQcb8KA==
X-Received: by 2002:a05:6512:a85:b0:44a:3f77:d9b9 with SMTP id m5-20020a0565120a8500b0044a3f77d9b9mr3301098lfu.465.1649180164931;
        Tue, 05 Apr 2022 10:36:04 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id k2-20020a056512330200b0044a096ea7absm1563732lfe.54.2022.04.05.10.36.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Apr 2022 10:36:04 -0700 (PDT)
Message-ID: <3e5fa57f-d636-879a-b98f-77323d07c156@linaro.org>
Date:   Tue, 5 Apr 2022 20:36:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v6 1/8] drm/msm/dp: Add eDP support via aux_bus
Content-Language: en-GB
To:     Doug Anderson <dianders@chromium.org>
Cc:     Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Clark <robdclark@gmail.com>,
        Sean Paul <seanpaul@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        quic_kalyant <quic_kalyant@quicinc.com>,
        "Abhinav Kumar (QUIC)" <quic_abhinavk@quicinc.com>,
        "Kuogee Hsieh (QUIC)" <quic_khsieh@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        quic_vproddut <quic_vproddut@quicinc.com>,
        "Aravind Venkateswaran (QUIC)" <quic_aravindh@quicinc.com>
References: <1648656179-10347-1-git-send-email-quic_sbillaka@quicinc.com>
 <1648656179-10347-2-git-send-email-quic_sbillaka@quicinc.com>
 <CAD=FV=X+QvjwoT2zGP82KW4kD0oMUY6ZgCizSikNX_Uj8dNDqA@mail.gmail.com>
 <392b933f-760c-3c81-1040-c514045df3da@linaro.org>
 <CAD=FV=W4PYK-t607yjRbfjDjjEZX0KdgHDRukw_vSH8E8EDH6w@mail.gmail.com>
 <CAA8EJppt9XONbgtKfmHmN+==QNqiVJeb8GKJFdZm=yyY-tgmHQ@mail.gmail.com>
 <CAD=FV=U5-sTDLYdkeJWLAOG-0wgxR49VxtwUyUO7z2PuibLGsg@mail.gmail.com>
 <CAA8EJppgfYgQjG8A4LsR-1wmBj3Ku3eO8cKfAYhxjWXL7e3eHg@mail.gmail.com>
 <CAD=FV=V=a1CnT8fqTJR40WoS3BaDQ3xZ=HnHVHqZh=MEmVUZBA@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CAD=FV=V=a1CnT8fqTJR40WoS3BaDQ3xZ=HnHVHqZh=MEmVUZBA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05/04/2022 20:02, Doug Anderson wrote:
> Hi,
> 
> On Tue, Apr 5, 2022 at 5:54 AM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
>>> 3. For DP and eDP HPD means something a little different. Essentially
>>> there are two concepts: a) is a display physically connected and b) is
>>> the display powered up and ready. For DP, the two are really tied
>>> together. From the kernel's point of view you never "power down" a DP
>>> display and you can't detect that it's physically connected until it's
>>> ready. Said another way, on you tie "is a display there" to the HPD
>>> line and the moment a display is there it's ready for you to do AUX
>>> transfers. For eDP, in the lowest power state of a display it _won't_
>>> assert its "HPD" signal. However, it's still physically present. For
>>> eDP you simply have to _assume_ it's present without any actual proof
>>> since you can't get proof until you power it up. Thus for eDP, you
>>> report that the display is there as soon as we're asked. We can't
>>> _talk_ to the display yet, though. So in get_modes() we need to be
>>> able to power the display on enough to talk over the AUX channel to
>>> it. As part of this, we wait for the signal named "HPD" which really
>>> means "panel finished powering on" in this context.
>>>
>>> NOTE: for aux transfer, we don't have the _display_ pipe and clocks
>>> running. We only have enough stuff running to do the AUX transfer.
>>> We're not clocking out pixels. We haven't fully powered on the
>>> display. The AUX transfer is designed to be something that can be done
>>> early _before_ you turn on the display.
>>>
>>>
>>> OK, so basically that was a longwinded way of saying: yes, we could
>>> avoid the AUX transfer in probe, but we can't wait all the way to
>>> enable. We have to be able to transfer in get_modes(). If you think
>>> that's helpful I think it'd be a pretty easy patch to write even if it
>>> would look a tad bit awkward IMO. Let me know if you want me to post
>>> it up.
>>
>> I think it would be a good idea. At least it will allow us to judge,
>> which is the more correct way.
> 
> I'm still happy to prototype this, but the more I think about it the
> more it feels like a workaround for the Qualcomm driver. The eDP panel
> driver is actually given a pointer to the AUX bus at probe time. It's
> really weird to say that we can't do a transfer on it yet... As you
> said, this is a little sideband bus. It should be able to be used
> without all the full blown infra of the rest of the driver.

Yes, I have that feeling too. However I also have a feeling that just 
powering up the PHY before the bus probe is ... a hack. There are no 
obvious stopgaps for the driver not to power it down later.

A cleaner design might be to split all hotplug event handling from the 
dp_display, provide a lightweight state machine for the eDP and select 
which state machine to use depending on the hardware connector type. The 
dp_display_bind/unbind would probably also be duplicated and receive 
correct code flows for calling dp_parser_get_next_bridge, etc.
Basically that means that depending on the device data we'd use either 
dp_display_comp_ops or (new) edp_comp_ops.

WDYT?

>> And I also think it might help the ti,sn65dsi86 driver, as it won't
>> have to ensure that gpio is available during the AUX bus probe.
> 
> The ti,sn65dsi86 GPIO issue has been solved for a while, though so not
> sure why we need to do something there? I'm also unclear how it would
> have helped. In this discussion, we've agreed that the panel driver
> would still acquire resources during its probe time and the only thing
> that would be delayed would be the first AUX transfer. The GPIO is a
> resource here and it's ideal to acquire it at probe time so we could
> EPROBE_DEFER if needed.

Ack. I agree here. The world at 5 a.m. looks differently :D

> 
> 
>> BTW, another random idea, before you start coding.
>>
>> We have the bridge's hpd_notify call. Currently it is called only by
>> the means of drm_bridge_connector's HPD mechanism, tied to the bridge
>> registering as DRM_BRIDGE_OP_HPD.
>> It looks to me like it might be a perfect fit for the first aux-bus
>> related reads.
>>
>> We'd need to trigger it manually once and tie it to the new
>> drm_panel_funcs callback, which in turn would probe the aux bus,
>> create backlight, etc.
>>
>> Regarding the Sankeerth's patch. I have been comparing it with the
>> hpd_event_thread()'s calls.
>> It looks to me like we should reuse dp_display_config_hpd()
>> /EV_HPD_INIT_SETUP and maybe others.
>>
>> What I'm trying to say is that if we split AUX probing and first AUX
>> transfers, it would be possible to reuse a significant part of MSM DP
>> HPD machine rather than hacking around it and replicating it manually.
> 
> I'm not sure I completely understand, but I'm pretty wary here. It's
> my assertion that all of the current "HPD" infrastructure in DRM all
> relates to the physical presence of the panel. If you start
> implementing these functions for eDP I think you're going to confuse
> the heck out of everything. The kernel will think that this is a
> display that's sometimes not there. Whenever the display is powered
> off then HPD will be low and it will look like there's no display.
> Nothing will ever try to power it on because it looks like there's no
> display.
> 
> I think your idea is to "trigger once" at bootup and then it all
> magically works, right? ...but what about after bootup? If you turn
> the display off for whatever reason (modeset or you simply close the
> lid of your laptop because you're using an external display) and then
> you want to use the eDP display again, how do you kickstart the
> process another time? You can't reboot, and when the display is off
> the HPD line is low.
> 
> I can't say it enough times, HPD on eDP _does not mean hot plug
> detect_. The panel is always there. HPD is really a "panel ready /
> panel notify" signal for eDP. That's fully what its function is.

Too many things being called HPD. I meant to trigger drm's hpd handling, 
which is not tied to the HPD pin for panel-edp. HPD pin is checked 
during panel runtime resume. However... let's probably go a simpler way.

-- 
With best wishes
Dmitry
