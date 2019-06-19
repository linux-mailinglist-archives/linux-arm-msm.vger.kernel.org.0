Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 48BA24C22C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2019 22:16:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726230AbfFSUQv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Jun 2019 16:16:51 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:43146 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726175AbfFSUQv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Jun 2019 16:16:51 -0400
Received: by mail-io1-f66.google.com with SMTP id k20so312085ios.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Jun 2019 13:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gSdDklePvOSmN6y34wUpOR+WhiVwpvWfOE5yME0vr+o=;
        b=ImCY/UPSAV4eFHZtiPccJWlSgskB/8w2K1qcU+WPwDTPZVEfNk68RZofvBpNGZ+r/S
         oVu982DRNsLJmZ9m/DXgK5ddkMDFcFZ+TljKPMP/Zda+uELZ+7B4tAwmq1RqTqVi2RiG
         /RP13ZOgpHCMReHGJ/LgD3/3uTXmMoVLjPAPmeg1vp8RISP7di+07LZb3qPBIX0i3wsM
         FUzc78iioPgwDEY3hIuZKced1GbuE01FEl+m03dbVLwUc7dV92zD8GPPVYOLr4fEW0XN
         aANMTXxiQEd/u4D7sAKAIV8mKkOfK7NAfOOVfXPRDJh4FgmtWuXPuuQh6yMx86gpiji2
         VbrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gSdDklePvOSmN6y34wUpOR+WhiVwpvWfOE5yME0vr+o=;
        b=IZ1SZ2kSXj/z6LwCmuxJ+YPTwEYU4coUO2miMEFUKyUH+7zR3EN9l+awmo9XeOXXbA
         e+qcWMa1KGhiObURIZZOo1rTY38ss1R4yXv/hf7MjOcMjq2aTEOFhoTxrCxNMtLzHKE5
         StBStmgbx3sJ68P8H22H8KSBy8xcZ5GgsJyh0IvWLPKVaHHsJh6SbHQlSP50PplrCKKx
         kzOra8gebVRl1j9biDdL+iz0Ed0sIX9GE5U+8f8erV+pQPm0K2E+InkO/Nrh9PNgVNvj
         GGN2JxOBAHxeetSZqnyVY938+5wYHZLC53JE/3WH2eLYdnhf+3kHq2TQV9mZpNbeLpP3
         32cQ==
X-Gm-Message-State: APjAAAXFCRO3QFdRelcQC0YrviO+1KWRXnazq4ZwafB00DplduAbz19K
        cP42N4MFxs2cy6iMm58stOO7grj8zFaenBHfkc+dnw==
X-Google-Smtp-Source: APXvYqzplFL25mdA1FUd799H6nmAPZp2rpMJn55NPZTIC0gNosIcpldeIuFPkTQmzu3YCpFJ9kXytDiY1+L2Oq9BaTo=
X-Received: by 2002:a02:2a0f:: with SMTP id w15mr12907087jaw.52.1560975410114;
 Wed, 19 Jun 2019 13:16:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190618202623.GA53651@gerhold.net> <a51f117f-c48d-d3f4-c3d1-9b584e3a055f@arm.com>
 <20190619183904.GB937@gerhold.net>
In-Reply-To: <20190619183904.GB937@gerhold.net>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Wed, 19 Jun 2019 14:16:38 -0600
Message-ID: <CANLsYkxaX2=Bp_BWWUFimC-UmP3L5g=CU7tqjd+xoFVcWG38tA@mail.gmail.com>
Subject: Re: Coresight causes synchronous external abort on msm8916
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Suzuki K Poulose <suzuki.poulose@arm.com>,
        David Brown <david.brown@linaro.org>,
        Andy Gross <agross@kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 19 Jun 2019 at 12:39, Stephan Gerhold <stephan@gerhold.net> wrote:
>
> Hi,
>
> On Wed, Jun 19, 2019 at 09:49:03AM +0100, Suzuki K Poulose wrote:
> > Hi Stephan,
> >
> > On 18/06/2019 21:26, Stephan Gerhold wrote:
> > > Hi,
> > >
> > > I'm trying to run mainline Linux on a smartphone with MSM8916 SoC.
> > > It works surprisingly well, but the coresight devices seem to cause the
> > > following crash shortly after userspace starts:
> > >
> > >      Internal error: synchronous external abort: 96000010 [#1] PREEMPT SMP
> >
> > ...
> >
> >
> > >
> > > In this case I'm using a simple device tree similar to apq8016-sbc,
> > > but it also happens using something as simple as msm8916-mtp.dts
> > > on this particular device.
> > >    (Attached: dmesg log with msm8916-mtp.dts and arm64 defconfig)
> > >
> > > I can avoid the crash and boot without any further problems by disabling
> > > every coresight device defined in msm8916.dtsi, e.g.:
> > >
> > >     tpiu@820000 { status = "disabled"; };
> >
> > ...
> >
> > >
> > > I don't have any use for coresight at the moment,
> > > but it seems somewhat odd to put this in the device specific dts.
> > >
> > > Any idea what could be causing this crash?
> >
> > This is mostly due to the missing power domain support. The CoreSight
> > components are usually in a debug power domain. So unless that is turned on,
> > (either by specifying proper power domain ids for power management protocol
> > supported by the firmware OR via other hacks - e.g, connecting a DS-5 to
> > keep the debug power domain turned on , this works on Juno -).
>
> Interesting, thanks a lot!
>
> In this case I'm wondering how it works on the Dragonboard 410c.

There can be two problems:

1) CPUidle is enabled on your platform and as I pointed out before,
that won't work.  There are patches circulating[1] to fix that problem
but it still needs a little bit of work.

2) As Suzuki pointed out the debug power domain may not be enabled by
default on your platform, something I would understand if it is a
production device.  There is nothing I can do on that front.

[1]. https://www.spinics.net/lists/arm-kernel/msg735707.html

> Does it enable these power domains in the firmware?
>   (Assuming it boots without this error...)

The debug power domain is enabled by default on the 410c and the board
boots without error.

>
> If coresight is not working properly on all/most msm8916 devices,
> shouldn't coresight be disabled by default in msm8916.dtsi?

It is in the defconfig for arm64, as such it shouldn't bother you.

> At least until those power domains can be set up by the kernel.
>
> If this is a device-specific issue, what would be an acceptable solution
> for mainline?
> Can I turn on these power domains from the kernel?

Yes, if you have the SoC's TRM.

> Or is it fine to disable coresight for this device with the snippet above?
>
> I'm not actually trying to use coresight, I just want the device to boot :)
> And since I am considering submitting my device tree for inclusion in
> mainline, I want to ask in advance how I should tackle this problem.

Simply don't enable coresight in the kernel config if the code isn't
mature enough to properly handle the relevant power domains using the
PM runtime API.

Mathieu

>
> Thanks!
> Stephan
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
