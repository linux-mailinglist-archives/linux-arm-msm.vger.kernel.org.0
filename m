Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E1F7E6359EC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Nov 2022 11:30:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236778AbiKWKan (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Nov 2022 05:30:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235839AbiKWKaU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Nov 2022 05:30:20 -0500
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D126DDFC5
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Nov 2022 02:12:47 -0800 (PST)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
        by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        id 1oxmkG-0003GP-J1; Wed, 23 Nov 2022 11:12:44 +0100
Message-ID: <b5ba4e16-ed09-2893-53ed-9803fd2b00d5@leemhuis.info>
Date:   Wed, 23 Nov 2022 11:12:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v2.5] drm/msm/dsi: switch to DRM_PANEL_BRIDGE
Content-Language: en-US, de-DE
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Caleb Connolly <caleb.connolly@linaro.org>
Cc:     freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
        linux-arm-msm@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        dri-devel@lists.freedesktop.org,
        Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sean Paul <sean@poorly.run>
References: <0abf1924-485b-8f1c-c8c8-d14dcccc3a27@quicinc.com>
 <0Co5PrfVEsYkXu9wz6ixpiFl0aWmXfIng6NSPOiYNcrAfHZx0w2crkWN7InPdtR-YTAb1IxLovgcEHCmFpmaqA==@protonmail.internalid>
 <20220712132258.671263-1-dmitry.baryshkov@linaro.org>
 <1892d0af-8aa4-dc03-887a-e44bb623b836@linaro.org>
 <CAA8EJpq_9iC1rkiZVom28Kv_B3QLd4pBgFObxBfSpJ+Xh=Mp1g@mail.gmail.com>
From:   Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <CAA8EJpq_9iC1rkiZVom28Kv_B3QLd4pBgFObxBfSpJ+Xh=Mp1g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1669198368;0125f2a4;
X-HE-SMSGID: 1oxmkG-0003GP-J1
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi, this is your Linux kernel regression tracker.

On 13.11.22 14:28, Dmitry Baryshkov wrote:
> Hi Caleb,
> 
> On Fri, 11 Nov 2022 at 18:30, Caleb Connolly <caleb.connolly@linaro.org> wrote:
>>
>> Hi,
>>
>> This patch has caused a regression on 6.1-rc for some devices that use
>> DSI panels. The new behaviour results in the DSI controller being
>> switched off before the panel unprepare hook is called. As a result,
>> panel drivers which call mipi_dsi_dcs_write() or similar in
>> unprepare() fail.
> 
> Thanks for the notice. Can you move your command stream to
> panel_disable() hook? (even if it's just as a temporary workaround)

Caleb, did you look into what Dmitry suggested? This issue is on my list
of tracked regressions in 6.1 and time is running out to get it fixed
before the release.

Or was there any progress to get this fixed and I just missed it?

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I deal with a lot of
reports and sometimes miss something important when writing mails like
this. If that's the case here, don't hesitate to tell me in a public
reply, it's in everyone's interest to set the public record straight.

#regzbot ignore-activity

> From what I see from other panels, some of them call
> mipi_dsi_dcs_set_display_off() in the unprepare() hook, while others
> do it in disable().
> 
> Yes, this is (again) the DSI host vs device order here. Short story:
> the DRM has a notion of 'the display pipe (i.e. clocks and timing
> signals) feeding the bridge being running'. That's the difference
> between enable/pre_enable and disable/post_disable. For the DSI we
> have a third state, when the DSI clock and ln0 allow transferring
> commands to the panel, but the image is not enabled.
> 
> There was a somewhat promising patchset at [1], but it seems it went
> out of the radar. I can try working on an alternative (explicit)
> approach if I have time.
> 
> With respect to your panel. Let me quote the docs: 'Before stopping
> video transmission from the display controller it can be necessary to
> turn off the panel to avoid visual glitches. This is done in the
> .disable() function. Analogously to .enable() this typically involves
> turning off the backlight and waiting for some time to make sure no
> image is visible on the panel. It is then safe for the display
> controller to cease transmission of video data.'
> 
> So, if we stop the call chain after switching the DSI host off but
> before calling the panel's unprepare() hook, will we see any
> artifacts/image leftover/etc. on the panel? Generally I have the
> feeling that all panels should call mipi_dsi_dcs_set_display_off() in
> the .disable() hook, not in the .unprepare() one.
> 
> [1] https://lore.kernel.org/dri-devel/cover.1646406653.git.dave.stevenson@raspberrypi.com/
> 
>>
>> I've noticed it specifically on the OnePlus 6 (with upstream Samsung
>> s0fef00 panel driver) and the SHIFT6mq with an out of tree driver.
>>
>> On 12/07/2022 14:22, Dmitry Baryshkov wrote:
>>> Currently the DSI driver has two separate paths: one if the next device
>>> in a chain is a bridge and another one if the panel is connected
>>> directly to the DSI host. Simplify the code path by using panel-bridge
>>> driver (already selected in Kconfig) and dropping support for
>>> handling the panel directly.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>
>>> I'm not sending this as a separate patchset (I'd like to sort out mdp5
>>> first), but more of a preview of changes related to
>>> msm_dsi_manager_ext_bridge_init().
>>>
>>> ---
>>>   drivers/gpu/drm/msm/dsi/dsi.c         |  35 +---
>>>   drivers/gpu/drm/msm/dsi/dsi.h         |  16 +-
>>>   drivers/gpu/drm/msm/dsi/dsi_host.c    |  25 ---
>>>   drivers/gpu/drm/msm/dsi/dsi_manager.c | 283 +++-----------------------
>>>   4 files changed, 36 insertions(+), 323 deletions(-)
> 
> [skipped the patch itself]
> 
