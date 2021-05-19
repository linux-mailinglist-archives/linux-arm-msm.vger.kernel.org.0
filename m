Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B152038996C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 May 2021 00:43:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229508AbhESWoZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 May 2021 18:44:25 -0400
Received: from mail-40131.protonmail.ch ([185.70.40.131]:47747 "EHLO
        mail-40131.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbhESWoZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 May 2021 18:44:25 -0400
Date:   Wed, 19 May 2021 22:42:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
        s=protonmail; t=1621464183;
        bh=A95P5VcW4Kdb09IztDj5EB+t6+VkeKybrxN1hQ+voYY=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=ZUUs/S5Mzy19CNGOoQ3stt6FfQ/Ep6H2OBSxP0h/0HKl9+RaA3qoIJxvMgU7kMhN9
         yCK0FBM7qMjMywrw4pYtQJfJTY3BZg4ajKuItRGJWSboLTgQlH6bAVRZ76VWQp9sdB
         iVkVUnpR+oQE4sYjCywpv+azmr77lp96tQABIl9c=
To:     Saravana Kannan <saravanak@google.com>,
        Rob Clark <robdclark@gmail.com>
From:   Caleb Connolly <caleb@connolly.tech>
Cc:     John Stultz <john.stultz@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dmitry.baryshkov@linaro.org
Reply-To: Caleb Connolly <caleb@connolly.tech>
Subject: Re: fw_devlink breakage on SDM845 / a630 with DSI displays
Message-ID: <968c8e20-82ef-cc3d-c809-f38d801699c8@connolly.tech>
In-Reply-To: <CAGETcx-2TySe=w1qAbtj2AJu6fNo_gaYnyP6GN150ShT1TvDfA@mail.gmail.com>
References: <aff4807e-e554-2e32-5789-dfaf65128a8e@connolly.tech> <CAF6AEGvnL9mOp3vKuSvz=KDijtFVMdKCF4BXSLxXeoR38O-SUg@mail.gmail.com> <CAGETcx-2TySe=w1qAbtj2AJu6fNo_gaYnyP6GN150ShT1TvDfA@mail.gmail.com>
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

Hi Saravana,

On 19/05/2021 10:52 pm, Saravana Kannan wrote:
> On Wed, May 19, 2021 at 8:36 AM Rob Clark <robdclark@gmail.com> wrote:
>>
>> + some more folks and msm list..
>>
>> I suppose I didn't hit this because CONFIG_FBDEV_EMULATION is not
>> normally enabled for CrOS.. but I'm not really to familiar with
>> fw_devlink
>>
>> BR,
>> -R
>>
>> On Wed, May 19, 2021 at 8:26 AM Caleb Connolly <caleb@connolly.tech> wro=
te:
>>>
>>>
>>> Hi,
>>>
>>> Since -rc1 I've been hit by some DRM breakage in freedreno which happen=
s
>>> when fw_devlink=3Don. It seems to cause some clocks (rcg) to get stuck =
and
>>> break DSI displays, here's a full log from the OnePlus 6:
>>> https://paste.ubuntu.com/p/8kPx4nFGF5/ (that is with
>>> "deferred_probe_timeout") The PocoPhone F1 also seems to be affected by
>>> this.
>>>
>>> The display will still come up after pressing the power button a few
>>> times, although it will be incredibly slow.
>>>
>>> It's worth noting that the issue only happens with
>>> CONFIG_FBDEV_EMULATION is enabled, I've previously required this to see
>>> kernel logs during boot and general boot splash with postmarketOS.
>>> Without it the display will be stuck on the bootloader splash until I
>>> press the power button and cause it to update once UI (like Phosh) has
>>> started (though this has been the case for quite some time).
>>>
>>> I'd appreciate any help with debugging / resolving this issue, I'm
>>> afraid I haven't been able to determine much from some brief digging.
>>>
>
> Hi Caleb,
>
> Is this a device that's supported upstream? If so, can you please
> point me to the DTS file that corresponds to this board?
The DTS can be found in
arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi (the two devices
"enchilada" and "fajita" share almost all hardware in common).
>
> Also, can you please change all the dev_dbg to dev_info in these
> functions and give me the full boot log?
> device_link_add()
> device_links_check_suppliers()
I've uploaded a log here: https://paste.ubuntu.com/p/8ynFgRWbYW/
For reference, the same but with fw_devlink=3Dpermissive:
https://paste.ubuntu.com/p/F2853CphHb/
>
> Can you also tell what device are not probing with fw_devlink=3Don that
> might be probing with fw_devlink=3Dpermissive?
The devices in question are ae00000.mdss, ae94000.dsi and ae01000.mdp.
> You should be able to compare /<debugfs>/devices_deferred to figure that =
out.
devices_deferred is empty for me, however device_component contains
(only) the following:
oneplus6:/home/user# cat /sys/kernel/debug/device_component/ae00000.mdss
master name                                            status
-------------------------------------------------------------
ae00000.mdss                                            bound

device name                                            status
-------------------------------------------------------------
ae01000.mdp                                             bound
ae94000.dsi                                             bound
5000000.gpu                                             bound
>
> Thanks,
> Saravana
>

I tried reverting the commit Dmitry mentioned however it didn't seem to
have any effect for me. (Cc'd)

--
Kind Regards,
Caleb

