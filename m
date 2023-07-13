Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 03355752A4A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jul 2023 20:28:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230506AbjGMS2f (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Jul 2023 14:28:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229611AbjGMS2d (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Jul 2023 14:28:33 -0400
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 396BD2D45
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jul 2023 11:28:30 -0700 (PDT)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 3642886CBB;
        Thu, 13 Jul 2023 20:28:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1689272908;
        bh=A+TyS2cpQG3yM9A5sgq6ylkFrzPjnGUwjb5tIaLFFUI=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=Wr3i7Wt1SogT6F226Jci3N0YoRCp+TbOrxm2oDE/59/kQNIB3PftXVW0t650TVjN6
         2gfFeBJHoMQCm2n1MxF1027Tm0RvMthg/tJCRLpbXJZqN3EQLXcY23sPKCRD31GNJH
         YwsbZbEWASG1uIvDsO6Z6woFTnHqdb5ysH0yFIigVQXAyWjZXNKlDraLcSyAN3Rqes
         YlRlgzdjieHXgr7qhOzIlAFHTlMWagbKRB+KEJu+s7+W7ZNSJujwPDOWfTjipSXbLh
         6B6VH6i7Hfcr+mNBWNKwOMY6G4JhJxyxCUM+omFeKs97xDqsgOc3gkK5AysglGLIBW
         AwJ/IGkHgt5Ew==
Message-ID: <f768950b-0406-1f03-86a5-50d5794bb060@denx.de>
Date:   Thu, 13 Jul 2023 20:28:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 2/2] drm/bridge: lt9611: Do not generate HFP/HBP/HSA and
 EOT packet
Content-Language: en-US
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        neil.armstrong@linaro.org, Amit Pundir <amit.pundir@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Jagan Teki <jagan@amarulasolutions.com>,
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
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <64c3352f-c2aa-5260-c6ff-4a607ce219a2@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 7/13/23 20:09, Abhinav Kumar wrote:
> 
> 
> On 7/12/2023 10:41 AM, Marek Vasut wrote:
>> On 7/9/23 03:03, Abhinav Kumar wrote:
>>>
>>>
>>> On 7/7/2023 1:47 AM, Neil Armstrong wrote:
>>>> On 07/07/2023 09:18, Neil Armstrong wrote:
>>>>> Hi,
>>>>>
>>>>> On 06/07/2023 11:20, Amit Pundir wrote:
>>>>>> On Wed, 5 Jul 2023 at 11:09, Dmitry Baryshkov
>>>>>> <dmitry.baryshkov@linaro.org> wrote:
>>>>>>>
>>>>>>> [Adding freedreno@ to cc list]
>>>>>>>
>>>>>>> On Wed, 5 Jul 2023 at 08:31, Jagan Teki 
>>>>>>> <jagan@amarulasolutions.com> wrote:
>>>>>>>>
>>>>>>>> Hi Amit,
>>>>>>>>
>>>>>>>> On Wed, Jul 5, 2023 at 10:15 AM Amit Pundir 
>>>>>>>> <amit.pundir@linaro.org> wrote:
>>>>>>>>>
>>>>>>>>> Hi Marek,
>>>>>>>>>
>>>>>>>>> On Wed, 5 Jul 2023 at 01:48, Marek Vasut <marex@denx.de> wrote:
>>>>>>>>>>
>>>>>>>>>> Do not generate the HS front and back porch gaps, the HSA gap and
>>>>>>>>>> EOT packet, as these packets are not required. This makes the 
>>>>>>>>>> bridge
>>>>>>>>>> work with Samsung DSIM on i.MX8MM and i.MX8MP.
>>>>>>>>>
>>>>>>>>> This patch broke display on Dragonboard 845c (SDM845) devboard 
>>>>>>>>> running
>>>>>>>>> AOSP. This is what I see
>>>>>>>>> https://people.linaro.org/~amit.pundir/db845c-userdebug/v6.5-broken-display/PXL_20230704_150156326.jpg.
>>>>>>>>> Reverting this patch fixes this regression for me.
>>>>>>>>
>>>>>>>> Might be msm dsi host require proper handling on these updated
>>>>>>>> mode_flags? did they?
>>>>>>>
>>>>>>> The msm DSI host supports those flags. Also, I'd like to point out
>>>>>>> that the patch didn't change the rest of the driver code. So even if
>>>>>>> drm/msm ignored some of the flags, it should not have caused the
>>>>>>> issue. Most likely the issue is on the lt9611 side. I's suspect that
>>>>>>> additional programming is required to make it work with these flags.
>>>>>>
>>>>>> I spent some time today on smoke testing these flags (individually 
>>>>>> and
>>>>>> in limited combination) on DB845c, to narrow down this breakage to 
>>>>>> one
>>>>>> or more flag(s) triggering it. Here are my observations in limited
>>>>>> testing done so far.
>>>>>>
>>>>>> There is no regression with MIPI_DSI_MODE_NO_EOT_PACKET when enabled
>>>>>> alone and system boots to UI as usual.
>>>>>>
>>>>>> MIPI_DSI_MODE_VIDEO_NO_HFP always trigger the broken display as in 
>>>>>> the
>>>>>> screenshot[1] shared earlier as well.
>>>>>>
>>>>>> Adding either of MIPI_DSI_MODE_VIDEO_NO_HSA and
>>>>>> MIPI_DSI_MODE_VIDEO_NO_HBP always result in no display, unless paired
>>>>>> with MIPI_DSI_MODE_VIDEO_NO_HFP and in that case we get the broken
>>>>>> display as reported.
>>>>>>
>>>>>> In short other than MIPI_DSI_MODE_NO_EOT_PACKET flag, all other flags
>>>>>> added in this commit break the display on DB845c one way or another.
>>>>>
>>>>> I think the investigation would be to understand why samsung-dsim 
>>>>> requires
>>>>> such flags and/or what are the difference in behavior between MSM 
>>>>> DSI and samsung DSIM
>>>>> for those flags ?
>>>>>
>>>>> If someone has access to the lt9611 datasheet, so it requires 
>>>>> HSA/HFP/HBP to be
>>>>> skipped ? and does MSM DSI and samsung DSIM skip them in the same 
>>>>> way ?
>>>>
>>>> I think there's a mismatch, where on one side this flags sets the 
>>>> link in LP-11 while
>>>> in HSA/HFP/HPB while on the other it completely removes those 
>>>> blanking packets.
>>>>
>>>> The name MIPI_DSI_MODE_VIDEO_NO_HBP suggests removal of HPB, not 
>>>> LP-11 while HPB.
>>>> the registers used in both controllers are different:
>>>> - samsung-dsim: DSIM_HBP_DISABLE_MODE
>>>> - msm dsi: DSI_VID_CFG0_HBP_POWER_STOP
>>>>
>>>> The first one suggest removing the packet, while the second one 
>>>> suggests powering
>>>> off the line while in the blanking packet period.
>>>>
>>>> @Abhinav, can you comment on that ?
>>>>
>>>
>>> I dont get what it means by completely removes blanking packets in DSIM.
>>
>> MIPI_DSI_MODE_VIDEO_NO_HFP means the HBP period is just skipped by DSIM.
>>
>> Maybe there is a need for new set of flags which differentiate between 
>> HBP skipped (i.e. NO HBP) and HBP LP11 ?
>>
> 
> No, the section of the MIPI DSI spec I posted below clearly states there 
> are two options:
> 
> 1) send blanking packets during those periods
> 2) transition to LP11 during those periods
> 
> There is no 3rd option in the spec of not doing both like what you are 
> suggesting. So DSIM should also be only transitioning to LP11 during 
> those periods if its not sending the blanking packets with those flags set.
> 
> So, there is no need for any new set of flags to differentiate.
> 
> The flags and their interpretation is correct in MSM driver. I cannot 
> comment on what exactly DSIM does with those flags.

How do you explain the comment in include/drm/drm_mipi_dsi.h:

128 /* disable hback-porch area */
129 #define MIPI_DSI_MODE_VIDEO_NO_HBP      BIT(6)

Esp. the "disable" part. That to me reads as "don't send HBP packet".

Where do you see that quote above in the DSI spec (which chapter and 
which version do you read) ?

>>> It should be replacing those periods with LP11 too.
>>>
>>> The traffic mode being used on this bridge is 
>>> MIPI_DSI_MODE_VIDEO_SYNC_PULSE which is "Non-Burst Mode with Sync 
>>> Pulses".
>>>
>>> As per this traffic mode in the DSI spec,
>>>
>>> "Normally, periods shown as HSA (Horizontal Sync Active), HBP 
>>> (Horizontal Back Porch) and HFP (Horizontal Front Porch) are filled 
>>> by Blanking Packets, with lengths (including packet overhead)  
>>> calculated to match the period specified by the peripheral’s data 
>>> sheet. Alternatively, if there is sufficient time to transition from 
>>> HS to LP mode and back again, a timed interval in LP mode may 
>>> substitute for a Blanking Packet, thus saving power. During HSA, HBP 
>>> and HFP periods, the bus should stay in the LP-11 state."
>>>
>>> So we can either send the blanking packets or transition to LP state 
>>> and those 3 flags are controlling exactly that during those periods 
>>> for MSM driver.
>>>
>>> If you stop sending the blanking packets, you need to replace that 
>>> gap with LP.
>>
>> I don't think that's what MIPI_DSI_MODE_VIDEO_NO_HBP means, the way I 
>> understand MIPI_DSI_MODE_VIDEO_NO_HBP is that it skips the HBP 
>> completely. So if you want HBP, then do not set 
>> MIPI_DSI_MODE_VIDEO_NO_HBP . And if you want LP11 during HBP, that is 
>> I think up to the controller (or maybe another new flag?).
>>
> 
> No, there is no need of another new flag. There are only two options as 
> per the spec.
> 
> In fact, as per my checking with more folks, requiring LP11 during those 
> periods is something very rare.
> 
> Because usually horizontal period is usually a very short period, most 
> of the time we do not use the LP11 option and send the blanking packets 
> instead.
> 
> So its something very unusual for DSIM.
> 
> That being said, I still think my previous question is important.
> 
> 1) What is the difference between the resolution you are trying Vs what 
> Amit is trying?
> 
> 2) Are you both using just standard HDMI monitors?

What is a "standard HDMI monitor" ?
I use DELL U2713HM .

[...]
