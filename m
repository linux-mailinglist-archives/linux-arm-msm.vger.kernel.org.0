Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C5634ECD3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2019 18:10:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726045AbfFUQKD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 Jun 2019 12:10:03 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.165]:28745 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726032AbfFUQKC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 Jun 2019 12:10:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1561133398;
        s=strato-dkim-0002; d=gerhold.net;
        h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=Emdotc5KZs0nYoiDHIIYAIdqYH7BCst4xsvTGCscKW0=;
        b=pRYC03+J0iOg/M7XJ58i+0/u6VSk1x7Cns7PsStZ4fkbIdIY4+z05IGLa+jFy7sJkk
        5rnm6t53iegZRyBTvxoptVkG943HpMIfsw7ENiwuQGj25JCqZVYhygxHlkCYJr0V4fMQ
        BxvTetvvqv4FbnKKRFae88ra9rBlTgjsBjNtVSMOpW3EJHTCbhsstRU0uTYnVUwRgDFv
        DiYeFvdb6yrW9l3gK+Tm3LuA2HzeoOs792YKItvKwyWdlO0NTHdTUnQBet1LU0o0d3s5
        F3GS6PTBfSJq/VMREWL/9hfW6Jb1Meyk8pTJsoCXNpX4Ol7LOFhSJCmkeEiCvBEuYhAO
        quwQ==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u26zEodhPgRDZ8b5Ic/FbYo="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
        by smtp.strato.de (RZmta 44.24 DYNA|AUTH)
        with ESMTPSA id m0a13fv5LG6gGTs
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Fri, 21 Jun 2019 18:06:42 +0200 (CEST)
Date:   Fri, 21 Jun 2019 18:06:31 +0200
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>
Cc:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        David Brown <david.brown@linaro.org>,
        Andy Gross <agross@kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Subject: Re: Coresight causes synchronous external abort on msm8916
Message-ID: <20190621160631.GA34922@gerhold.net>
References: <20190618202623.GA53651@gerhold.net>
 <a51f117f-c48d-d3f4-c3d1-9b584e3a055f@arm.com>
 <20190619183904.GB937@gerhold.net>
 <CANLsYkxaX2=Bp_BWWUFimC-UmP3L5g=CU7tqjd+xoFVcWG38tA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANLsYkxaX2=Bp_BWWUFimC-UmP3L5g=CU7tqjd+xoFVcWG38tA@mail.gmail.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi all,

Thanks for all your replies!

On Wed, Jun 19, 2019 at 02:16:38PM -0600, Mathieu Poirier wrote:
> On Wed, 19 Jun 2019 at 12:39, Stephan Gerhold <stephan@gerhold.net> wrote:
> >
> > Hi,
> >
> > On Wed, Jun 19, 2019 at 09:49:03AM +0100, Suzuki K Poulose wrote:
> > > Hi Stephan,
> > >
> > > On 18/06/2019 21:26, Stephan Gerhold wrote:
> > > > Hi,
> > > >
> > > > I'm trying to run mainline Linux on a smartphone with MSM8916 SoC.
> > > > It works surprisingly well, but the coresight devices seem to cause the
> > > > following crash shortly after userspace starts:
> > > >
> > > >      Internal error: synchronous external abort: 96000010 [#1] PREEMPT SMP
> > >
> > > ...
> > >
> > >
> > > >
> > > > In this case I'm using a simple device tree similar to apq8016-sbc,
> > > > but it also happens using something as simple as msm8916-mtp.dts
> > > > on this particular device.
> > > >    (Attached: dmesg log with msm8916-mtp.dts and arm64 defconfig)
> > > >
> > > > I can avoid the crash and boot without any further problems by disabling
> > > > every coresight device defined in msm8916.dtsi, e.g.:
> > > >
> > > >     tpiu@820000 { status = "disabled"; };
> > >
> > > ...
> > >
> > > >
> > > > I don't have any use for coresight at the moment,
> > > > but it seems somewhat odd to put this in the device specific dts.
> > > >
> > > > Any idea what could be causing this crash?
> > >
> > > This is mostly due to the missing power domain support. The CoreSight
> > > components are usually in a debug power domain. So unless that is turned on,
> > > (either by specifying proper power domain ids for power management protocol
> > > supported by the firmware OR via other hacks - e.g, connecting a DS-5 to
> > > keep the debug power domain turned on , this works on Juno -).
> >
> > Interesting, thanks a lot!
> >
> > In this case I'm wondering how it works on the Dragonboard 410c.
> 
> There can be two problems:
> 
> 1) CPUidle is enabled on your platform and as I pointed out before,
> that won't work.  There are patches circulating[1] to fix that problem
> but it still needs a little bit of work.

I tried disabling cpuidle (see [1]), but unfortunately it did not help.

[1]: https://lore.kernel.org/linux-arm-msm/20190619173743.GA937@gerhold.net/

>
> 2) As Suzuki pointed out the debug power domain may not be enabled by
> default on your platform, something I would understand if it is a
> production device.  There is nothing I can do on that front.

Indeed, this is a production device.
The downstream (production) kernel does not seem to have coresight
enabled, so it is very well possible that the debug power domain is not
enabled by the firmware.

> 
> [1]. https://www.spinics.net/lists/arm-kernel/msg735707.html
> 
> > Does it enable these power domains in the firmware?
> >   (Assuming it boots without this error...)
> 
> The debug power domain is enabled by default on the 410c and the board
> boots without error.

Good to know, thank you!

> 
> >
> > If coresight is not working properly on all/most msm8916 devices,
> > shouldn't coresight be disabled by default in msm8916.dtsi?
> 
> It is in the defconfig for arm64, as such it shouldn't bother you.

Indeed, I already have CONFIG_CORESIGHT disabled.
At the moment, I'm using arm64 defconfig as-is, with no modifications.

So the error happens in the AMBA bus code even when CONFIG_CORESIGHT is
disabled, as Suzuki suspected [2].

[2]: https://lore.kernel.org/linux-arm-msm/6bb74dcc-62e4-5310-5884-9c4b82ce5be9@arm.com/

> 
> > At least until those power domains can be set up by the kernel.
> >
> > If this is a device-specific issue, what would be an acceptable solution
> > for mainline?
> > Can I turn on these power domains from the kernel?
> 
> Yes, if you have the SoC's TRM.

I guess "TRM" refers to Technical Reference Manual?
Unfortunately, I don't have access to any documentation that is not
publicly available on the Internet.

> 
> > Or is it fine to disable coresight for this device with the snippet above?
> >
> > I'm not actually trying to use coresight, I just want the device to boot :)
> > And since I am considering submitting my device tree for inclusion in
> > mainline, I want to ask in advance how I should tackle this problem.
> 
> Simply don't enable coresight in the kernel config if the code isn't
> mature enough to properly handle the relevant power domains using the
> PM runtime API.

The error occurs without CONFIG_CORESIGHT, and I believe there is no
way to disable CONFIG_AMBA (it is selected by CONFIG_ARM64 and included
in arm64 defconfig).

So, assuming it is the debug power domain, I believe I can make the
device boot successfully by either:

 (a) Turning on the debug power domain:
     It seems like the kernel cannot do this on msm8916 at the moment(?)
     (msm8916.dtsi does not declare any power domain in the coresight
      device tree nodes)

     I cannot modify the firmware of this device,
     so I'm afraid I have absolutely no idea how to turn it on. :/

 (b) Preventing the crash:
     Is there some way to:

      (1) Add a check in the AMBA bus code to verify if the power
          domain is actually turned on?
     or
      (2) Recover from the "synchronous external abort" and continue
          booting after printing an error/warning?
          (At the moment, userspace seems to continue for a while,
           but stops working at some point after the error...)

     Otherwise, there is still the option to prevent the AMBA bus code
     from running by disabling the affected device tree nodes.
     That's what the debug@850000 { status = "disabled"; }; ... snippet
     from my first mail [3] does, and it is the only way to make the
     kernel boot successfully at the moment.

     It wouldn't affect any other device if placed in the DTS for my
     device (i.e. *not* in the shared msm8916.dtsi).

What do you think?
Stephan

[3]: https://lore.kernel.org/linux-arm-msm/20190618202623.GA53651@gerhold.net/
