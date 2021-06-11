Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0117C3A4B06
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Jun 2021 00:53:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229753AbhFKWzI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Jun 2021 18:55:08 -0400
Received: from mail-0201.mail-europe.com ([51.77.79.158]:37249 "EHLO
        mail-02.mail-europe.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S229572AbhFKWzI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Jun 2021 18:55:08 -0400
Date:   Fri, 11 Jun 2021 22:52:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
        s=protonmail; t=1623451987;
        bh=fjFhRBqsOMJIOFq5irzqk4jp+YHV9ZfbwpQyNsv9rEI=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=meYCXpzUnzUoy7PJ0AyijARNqbPUIkIZaMewrBIEbW9oJr2BC+u1X08jgWPxecdGn
         18O3k7vNvPNreVwazUIlgXqo3/zwCI5I057sfT9JeLrD/s99chIfCoDB1qKBVQNIP2
         jiFfJsm69wa3V/p2Zg/pZkkWwXkDcAFP+7bSBrbo=
To:     Saravana Kannan <saravanak@google.com>
From:   Caleb Connolly <caleb@connolly.tech>
Cc:     Rob Clark <robdclark@gmail.com>,
        John Stultz <john.stultz@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dmitry.baryshkov@linaro.org
Reply-To: Caleb Connolly <caleb@connolly.tech>
Subject: Re: fw_devlink breakage on SDM845 / a630 with DSI displays
Message-ID: <8c46f015-117a-790c-a788-13b4850bdd02@connolly.tech>
In-Reply-To: <CAGETcx97=+pOpfdMXDXgHOGQhj7whkc=zq7Hc27fE_BARXSGtQ@mail.gmail.com>
References: <aff4807e-e554-2e32-5789-dfaf65128a8e@connolly.tech> <CAF6AEGvnL9mOp3vKuSvz=KDijtFVMdKCF4BXSLxXeoR38O-SUg@mail.gmail.com> <CAGETcx-2TySe=w1qAbtj2AJu6fNo_gaYnyP6GN150ShT1TvDfA@mail.gmail.com> <968c8e20-82ef-cc3d-c809-f38d801699c8@connolly.tech> <CAGETcx97=+pOpfdMXDXgHOGQhj7whkc=zq7Hc27fE_BARXSGtQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi all,

This issue is still occurring on -rc5, breaking display output on the
OnePlus 6, 6T and PocoPhone F1 unless fw_devlink=3Dpermissive is set.

I'm not quite sure how I should go about debugging and resolving this,
I'd greatly appreciate any ideas / recommendations as I would really
like to make sure 5.13 doesn't release with broken displays on these
devices.

Thanks,
On 20/05/2021 1:17 am, Caleb Connolly wrote:
>
>
> On 20/05/2021 1:06 am, Saravana Kannan wrote:
>> On Wed, May 19, 2021 at 3:43 PM Caleb Connolly <caleb@connolly.tech> wro=
te:
>>>
>>> Hi Saravana,
>>>
>>> On 19/05/2021 10:52 pm, Saravana Kannan wrote:
>>>> On Wed, May 19, 2021 at 8:36 AM Rob Clark <robdclark@gmail.com> wrote:
>>>>>
>>>>> + some more folks and msm list..
>>>>>
>>>>> I suppose I didn't hit this because CONFIG_FBDEV_EMULATION is not
>>>>> normally enabled for CrOS.. but I'm not really to familiar with
>>>>> fw_devlink
>>>>>
>>>>> BR,
>>>>> -R
>>>>>
>>>>> On Wed, May 19, 2021 at 8:26 AM Caleb Connolly <caleb@connolly.tech> =
wrote:
>>>>>>
>>>>>>
>>>>>> Hi,
>>>>>>
>>>>>> Since -rc1 I've been hit by some DRM breakage in freedreno which hap=
pens
>>>>>> when fw_devlink=3Don. It seems to cause some clocks (rcg) to get stu=
ck and
>>>>>> break DSI displays, here's a full log from the OnePlus 6:
>>>>>> https://paste.ubuntu.com/p/8kPx4nFGF5/ (that is with
>>>>>> "deferred_probe_timeout") The PocoPhone F1 also seems to be affected=
 by
>>>>>> this.
>>>>>>
>>>>>> The display will still come up after pressing the power button a few
>>>>>> times, although it will be incredibly slow.
>>>>>>
>>>>>> It's worth noting that the issue only happens with
>>>>>> CONFIG_FBDEV_EMULATION is enabled, I've previously required this to =
see
>>>>>> kernel logs during boot and general boot splash with postmarketOS.
>>>>>> Without it the display will be stuck on the bootloader splash until =
I
>>>>>> press the power button and cause it to update once UI (like Phosh) h=
as
>>>>>> started (though this has been the case for quite some time).
>>>>>>
>>>>>> I'd appreciate any help with debugging / resolving this issue, I'm
>>>>>> afraid I haven't been able to determine much from some brief digging=
.
>>>>>>
>>>>
>>>> Hi Caleb,
>>>>
>>>> Is this a device that's supported upstream? If so, can you please
>>>> point me to the DTS file that corresponds to this board?
>>> The DTS can be found in
>>> arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi (the two devices
>>> "enchilada" and "fajita" share almost all hardware in common).
>>>>
>>>> Also, can you please change all the dev_dbg to dev_info in these
>>>> functions and give me the full boot log?
>>>> device_link_add()
>>>> device_links_check_suppliers()
>>> I've uploaded a log here: https://paste.ubuntu.com/p/8ynFgRWbYW/
>>> For reference, the same but with fw_devlink=3Dpermissive:
>>> https://paste.ubuntu.com/p/F2853CphHb/
>>>>
>>>> Can you also tell what device are not probing with fw_devlink=3Don tha=
t
>>>> might be probing with fw_devlink=3Dpermissive?
>>> The devices in question are ae00000.mdss, ae94000.dsi and ae01000.mdp.
>>>> You should be able to compare /<debugfs>/devices_deferred to figure th=
at out.
>>> devices_deferred is empty for me,
>>
>> So, ae00000.mdss, ae94000.dsi and ae01000.mdp are probing for =3Don and
>> =3Dpermissive?
>>
>> That's interesting. So maybe fw_devlink is somehow changing the probe
>> order that's causing this? AFAIK, fw_devlink shouldn't cause changes
>> to probe order (it used to, but I've fixed them all).
> Yeah, they always successfully probe, it seems like fw_devlink is
> exposing some racy behaviour somewhere.
>
> The issue happens when initialising the display for framebuffer device
> emulation - with framebuffer emulation disabled it all mostly works as
> expected. With the caveat that there is nothing on the display until the
> device has finished booting AND the user causes a refresh by pressing
> the power button a few times.
>
> Perhaps this early framebuffer driver is causing confusion as it has
> different dependencies than the main driver?
>>
>>> however device_component contains
>>> (only) the following:
>>> oneplus6:/home/user# cat /sys/kernel/debug/device_component/ae00000.mds=
s
>>> master name                                            status
>>> -------------------------------------------------------------
>>> ae00000.mdss                                            bound
>>>
>>> device name                                            status
>>> -------------------------------------------------------------
>>> ae01000.mdp                                             bound
>>> ae94000.dsi                                             bound
>>> 5000000.gpu                                             bound
>>
>> Sorry, I have no context on this and how to interpret it. I kinda know
>> a little about the component framework, but not much. Is this file the
>> same for =3Don and =3Dpermissive?
> Apologies, I assumed it had something to do with fw_devlink. It's the
> same for both cases yeah.
>>
>> -Saravana
>>
>

--
Kind Regards,
Caleb

