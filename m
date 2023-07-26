Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0479D76332D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jul 2023 12:09:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230138AbjGZKJ3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Jul 2023 06:09:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233166AbjGZKJ2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Jul 2023 06:09:28 -0400
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DE4E1FEC
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jul 2023 03:09:13 -0700 (PDT)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
        by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        id 1qObS2-0000qa-MB; Wed, 26 Jul 2023 12:09:02 +0200
Message-ID: <a86a756c-4b44-1be4-cea6-a6e525970326@leemhuis.info>
Date:   Wed, 26 Jul 2023 12:09:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 2/2] drm/bridge: lt9611: Do not generate HFP/HBP/HSA and
 EOT packet
Content-Language: en-US, de-DE
To:     Amit Pundir <amit.pundir@linaro.org>, Marek Vasut <marex@denx.de>
Cc:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        neil.armstrong@linaro.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Jagan Teki <jagan@amarulasolutions.com>,
        dri-devel@lists.freedesktop.org, Robert Foss <rfoss@kernel.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Michael Walle <michael@walle.cc>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux regressions mailing list <regressions@lists.linux.dev>,
        freedreno <freedreno@lists.freedesktop.org>
References: <20230403221233.500485-1-marex@denx.de>
 <20230403221233.500485-2-marex@denx.de>
 <CAMi1Hd0TD=2z_=bcDrht3H_wiLvAFcv8Z-U_r_KUOoeMc6UMjw@mail.gmail.com>
 <CAMty3ZBNFu=f-FS4YFN4wfmiTuk=48nna-vub1eMYwidDt+msg@mail.gmail.com>
 <CAA8EJppbdiUz5m+9EAPnFb916DaS_VKWd30c7_EPWjuid8rtqQ@mail.gmail.com>
 <CAMi1Hd2G5PJmz4wpO1wbdqKd0FA8LBgvRDv2u5ZYAMb5s6Kt0A@mail.gmail.com>
 <d5fb8106-b8f3-0acf-1267-d4d6d0860e25@linaro.org>
 <d28b0090-bd1e-6737-d92b-348dc6c30750@linaro.org>
 <4396d197-f16f-92bd-727c-eb8c78016198@quicinc.com>
 <961b4747-c9f1-a31c-c33c-475b4803f832@denx.de>
 <64c3352f-c2aa-5260-c6ff-4a607ce219a2@quicinc.com>
 <f768950b-0406-1f03-86a5-50d5794bb060@denx.de>
 <CAMi1Hd0LUk__=mz8_+ZTwh=E9wm+abX_4D4XmEO1Jb8uDnPu3A@mail.gmail.com>
From:   "Linux regression tracking (Thorsten Leemhuis)" 
        <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <CAMi1Hd0LUk__=mz8_+ZTwh=E9wm+abX_4D4XmEO1Jb8uDnPu3A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1690366154;c4243c60;
X-HE-SMSGID: 1qObS2-0000qa-MB
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE,T_SPF_TEMPERROR,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi, Thorsten here, the Linux kernel's regression tracker. Top-posting
for once, to make this easily accessible to everyone.

What's the status wrt to this regression (caused by 8ddce13ae69 from
Marek)? It looks like things are stalled and the regression still is
unresolved, but I ask because I might be missing something.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.

#regzbot poke

On 14.07.23 08:11, Amit Pundir wrote:
> On Thu, 13 Jul 2023 at 23:58, Marek Vasut <marex@denx.de> wrote:
>>
>> On 7/13/23 20:09, Abhinav Kumar wrote:
>>>
>>>
>>> On 7/12/2023 10:41 AM, Marek Vasut wrote:
>>>> On 7/9/23 03:03, Abhinav Kumar wrote:
>>>>>
>>>>>
>>>>> On 7/7/2023 1:47 AM, Neil Armstrong wrote:
>>>>>> On 07/07/2023 09:18, Neil Armstrong wrote:
>>>>>>> Hi,
>>>>>>>
>>>>>>> On 06/07/2023 11:20, Amit Pundir wrote:
>>>>>>>> On Wed, 5 Jul 2023 at 11:09, Dmitry Baryshkov
>>>>>>>> <dmitry.baryshkov@linaro.org> wrote:
>>>>>>>>>
>>>>>>>>> [Adding freedreno@ to cc list]
>>>>>>>>>
>>>>>>>>> On Wed, 5 Jul 2023 at 08:31, Jagan Teki
>>>>>>>>> <jagan@amarulasolutions.com> wrote:
>>>>>>>>>>
>>>>>>>>>> Hi Amit,
>>>>>>>>>>
>>>>>>>>>> On Wed, Jul 5, 2023 at 10:15 AM Amit Pundir
>>>>>>>>>> <amit.pundir@linaro.org> wrote:
>>>>>>>>>>>
>>>>>>>>>>> Hi Marek,
>>>>>>>>>>>
>>>>>>>>>>> On Wed, 5 Jul 2023 at 01:48, Marek Vasut <marex@denx.de> wrote:
>>>>>>>>>>>>
>>>>>>>>>>>> Do not generate the HS front and back porch gaps, the HSA gap and
>>>>>>>>>>>> EOT packet, as these packets are not required. This makes the
>>>>>>>>>>>> bridge
>>>>>>>>>>>> work with Samsung DSIM on i.MX8MM and i.MX8MP.
>>>>>>>>>>>
>>>>>>>>>>> This patch broke display on Dragonboard 845c (SDM845) devboard
>>>>>>>>>>> running
>>>>>>>>>>> AOSP. This is what I see
>>>>>>>>>>> https://people.linaro.org/~amit.pundir/db845c-userdebug/v6.5-broken-display/PXL_20230704_150156326.jpg.
>>>>>>>>>>> Reverting this patch fixes this regression for me.
>>>>>>>>>>
>>>>>>>>>> Might be msm dsi host require proper handling on these updated
>>>>>>>>>> mode_flags? did they?
>>>>>>>>>
>>>>>>>>> The msm DSI host supports those flags. Also, I'd like to point out
>>>>>>>>> that the patch didn't change the rest of the driver code. So even if
>>>>>>>>> drm/msm ignored some of the flags, it should not have caused the
>>>>>>>>> issue. Most likely the issue is on the lt9611 side. I's suspect that
>>>>>>>>> additional programming is required to make it work with these flags.
>>>>>>>>
>>>>>>>> I spent some time today on smoke testing these flags (individually
>>>>>>>> and
>>>>>>>> in limited combination) on DB845c, to narrow down this breakage to
>>>>>>>> one
>>>>>>>> or more flag(s) triggering it. Here are my observations in limited
>>>>>>>> testing done so far.
>>>>>>>>
>>>>>>>> There is no regression with MIPI_DSI_MODE_NO_EOT_PACKET when enabled
>>>>>>>> alone and system boots to UI as usual.
>>>>>>>>
>>>>>>>> MIPI_DSI_MODE_VIDEO_NO_HFP always trigger the broken display as in
>>>>>>>> the
>>>>>>>> screenshot[1] shared earlier as well.
>>>>>>>>
>>>>>>>> Adding either of MIPI_DSI_MODE_VIDEO_NO_HSA and
>>>>>>>> MIPI_DSI_MODE_VIDEO_NO_HBP always result in no display, unless paired
>>>>>>>> with MIPI_DSI_MODE_VIDEO_NO_HFP and in that case we get the broken
>>>>>>>> display as reported.
>>>>>>>>
>>>>>>>> In short other than MIPI_DSI_MODE_NO_EOT_PACKET flag, all other flags
>>>>>>>> added in this commit break the display on DB845c one way or another.
>>>>>>>
>>>>>>> I think the investigation would be to understand why samsung-dsim
>>>>>>> requires
>>>>>>> such flags and/or what are the difference in behavior between MSM
>>>>>>> DSI and samsung DSIM
>>>>>>> for those flags ?
>>>>>>>
>>>>>>> If someone has access to the lt9611 datasheet, so it requires
>>>>>>> HSA/HFP/HBP to be
>>>>>>> skipped ? and does MSM DSI and samsung DSIM skip them in the same
>>>>>>> way ?
>>>>>>
>>>>>> I think there's a mismatch, where on one side this flags sets the
>>>>>> link in LP-11 while
>>>>>> in HSA/HFP/HPB while on the other it completely removes those
>>>>>> blanking packets.
>>>>>>
>>>>>> The name MIPI_DSI_MODE_VIDEO_NO_HBP suggests removal of HPB, not
>>>>>> LP-11 while HPB.
>>>>>> the registers used in both controllers are different:
>>>>>> - samsung-dsim: DSIM_HBP_DISABLE_MODE
>>>>>> - msm dsi: DSI_VID_CFG0_HBP_POWER_STOP
>>>>>>
>>>>>> The first one suggest removing the packet, while the second one
>>>>>> suggests powering
>>>>>> off the line while in the blanking packet period.
>>>>>>
>>>>>> @Abhinav, can you comment on that ?
>>>>>>
>>>>>
>>>>> I dont get what it means by completely removes blanking packets in DSIM.
>>>>
>>>> MIPI_DSI_MODE_VIDEO_NO_HFP means the HBP period is just skipped by DSIM.
>>>>
>>>> Maybe there is a need for new set of flags which differentiate between
>>>> HBP skipped (i.e. NO HBP) and HBP LP11 ?
>>>>
>>>
>>> No, the section of the MIPI DSI spec I posted below clearly states there
>>> are two options:
>>>
>>> 1) send blanking packets during those periods
>>> 2) transition to LP11 during those periods
>>>
>>> There is no 3rd option in the spec of not doing both like what you are
>>> suggesting. So DSIM should also be only transitioning to LP11 during
>>> those periods if its not sending the blanking packets with those flags set.
>>>
>>> So, there is no need for any new set of flags to differentiate.
>>>
>>> The flags and their interpretation is correct in MSM driver. I cannot
>>> comment on what exactly DSIM does with those flags.
>>
>> How do you explain the comment in include/drm/drm_mipi_dsi.h:
>>
>> 128 /* disable hback-porch area */
>> 129 #define MIPI_DSI_MODE_VIDEO_NO_HBP      BIT(6)
>>
>> Esp. the "disable" part. That to me reads as "don't send HBP packet".
>>
>> Where do you see that quote above in the DSI spec (which chapter and
>> which version do you read) ?
>>
>>>>> It should be replacing those periods with LP11 too.
>>>>>
>>>>> The traffic mode being used on this bridge is
>>>>> MIPI_DSI_MODE_VIDEO_SYNC_PULSE which is "Non-Burst Mode with Sync
>>>>> Pulses".
>>>>>
>>>>> As per this traffic mode in the DSI spec,
>>>>>
>>>>> "Normally, periods shown as HSA (Horizontal Sync Active), HBP
>>>>> (Horizontal Back Porch) and HFP (Horizontal Front Porch) are filled
>>>>> by Blanking Packets, with lengths (including packet overhead)
>>>>> calculated to match the period specified by the peripheral’s data
>>>>> sheet. Alternatively, if there is sufficient time to transition from
>>>>> HS to LP mode and back again, a timed interval in LP mode may
>>>>> substitute for a Blanking Packet, thus saving power. During HSA, HBP
>>>>> and HFP periods, the bus should stay in the LP-11 state."
>>>>>
>>>>> So we can either send the blanking packets or transition to LP state
>>>>> and those 3 flags are controlling exactly that during those periods
>>>>> for MSM driver.
>>>>>
>>>>> If you stop sending the blanking packets, you need to replace that
>>>>> gap with LP.
>>>>
>>>> I don't think that's what MIPI_DSI_MODE_VIDEO_NO_HBP means, the way I
>>>> understand MIPI_DSI_MODE_VIDEO_NO_HBP is that it skips the HBP
>>>> completely. So if you want HBP, then do not set
>>>> MIPI_DSI_MODE_VIDEO_NO_HBP . And if you want LP11 during HBP, that is
>>>> I think up to the controller (or maybe another new flag?).
>>>>
>>>
>>> No, there is no need of another new flag. There are only two options as
>>> per the spec.
>>>
>>> In fact, as per my checking with more folks, requiring LP11 during those
>>> periods is something very rare.
>>>
>>> Because usually horizontal period is usually a very short period, most
>>> of the time we do not use the LP11 option and send the blanking packets
>>> instead.
>>>
>>> So its something very unusual for DSIM.
>>>
>>> That being said, I still think my previous question is important.
>>>
>>> 1) What is the difference between the resolution you are trying Vs what
>>> Amit is trying?
>>>
>>> 2) Are you both using just standard HDMI monitors?
>>
>> What is a "standard HDMI monitor" ?
>> I use DELL U2713HM .
> 
> I see this breakage on portable HDMI monitors Viewsonic TD1655 [1] and
> Cocopar Z173FH7F [2], both running at 1920x1080 resolution.
> 
> Regards,
> Amit Pundir
> [1] https://www.amazon.in/ViewSonic-TD1655-Portable-Touchscreen-Frameless/dp/B08778F756
> [2] https://www.amazon.com/Portable-Monitor-FreeSync-Speaker-Nintendo/dp/B07ZLXCVPN
> 
>>
>> [...]
> 
> 
