Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 073963EBF32
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Aug 2021 03:06:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236154AbhHNBHG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Aug 2021 21:07:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235870AbhHNBHF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Aug 2021 21:07:05 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01202C0617AE
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Aug 2021 18:06:37 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id z2so23269791lft.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Aug 2021 18:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AzF6zd9JjX8F2cTA3zVGcFIEpz9eK1G/eiStB2DECqY=;
        b=Uq3XLk6lrpFptnkzqvf21MBT0ct05kXZIy7vnGNZ4ojy8x26JVwiLYU0V03v8MZIHi
         4fX6IB0zI4DIhX3wRjGxFFx8YAprU0uUcoFYDretIJV7d/gDwd9TGmAY2luBWFd1dqzr
         NlZaWPD2mJ+HoSGvljAGrxaY0CTUaodrYkheMq/B5vPPUWRl0bkN5MVfqaVGwNu8A4Ku
         Xj4/B0Z0Tf7JIAJg/3mQY95EegNhjOr7TBJaqyzcoEjw5D6mpEMs2MNy9rFVrBTzJIkq
         F4haaMx/EBYDgMaXn+24h2Y+VbkA/mSiVitpJZaQ0V9VpnuWsvUowTeQL6RwpRjbveEa
         YObQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AzF6zd9JjX8F2cTA3zVGcFIEpz9eK1G/eiStB2DECqY=;
        b=klxOzq3NFcFYIAZHwECTnkuEcYoOb1zgZT/goQjDtaINLTJAjT8uKhvnrzSR/G7CKf
         YBYYud6vrv7KYzERVUwhcC1q6/6nxHNsbq7yt/nd9BFpJhBxzLoNCZbtdr29MUQJnk6g
         Wo7u52X+cgigdYCFW3yzlGvB9vA/R97/2iUh1FsSkyFXqeMsXR6nN2bvo+eY0wEpLAdq
         FkRl5udYiT+djEMyebT4PnQLOl0P1Hqb4g9ulA7COAAVcDL5UNWHEUSWX6baLpG3idy0
         NpQZlh6BB6/UNuXpCA1trzSyhO66w6q1MEY7i/1adVqPoox+cEMZYk8yME1mP3pwRRBW
         KJug==
X-Gm-Message-State: AOAM532BotL6GKi4cZGOw5kZWwdqGh0RBtDUEzw/DMOS412SnZxPnDrC
        YBdF7Q4SWKMZYoagRJh9MQQXnpjA/IeNDKHU218lwA==
X-Google-Smtp-Source: ABdhPJzHnPFEzY1zOELKvkCEgi7MSs3DvC1sUZqfe5OG7rLv6iJWlv23/7I0qdSwbAy7OwqppQvUOsUfrn8k1hcCVDY=
X-Received: by 2002:a19:4890:: with SMTP id v138mr3484589lfa.626.1628903196300;
 Fri, 13 Aug 2021 18:06:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210721100220.ddfxwugivsndsedv@mobilestation>
 <YPf29+ewbrYgHxRP@kroah.com> <0064cb2c-5ca6-e693-2e89-8f045c8f7502@kernel.org>
 <YPf+shNM6cXb3mfe@kroah.com> <d853df77-8d36-30b0-dd26-da1bfcb068e0@kernel.org>
 <20210721112531.xvu6ni5ksaehsrjh@mobilestation> <CALAqxLViEqSO17P3JGRGYJh-wDoHaJiQQV48zeoRgnar4Xd5Bg@mail.gmail.com>
 <20210722181221.xh3r5kyu7zlcojjx@mobilestation> <YPnEO6NVFZDS1s//@yoga>
 <CALAqxLUT0e+mHMVo685oVTxR8y76733cN0yciQ7ePS6GRE+_dg@mail.gmail.com> <20210722220918.l7j6zw3aaa27qato@mobilestation>
In-Reply-To: <20210722220918.l7j6zw3aaa27qato@mobilestation>
From:   John Stultz <john.stultz@linaro.org>
Date:   Fri, 13 Aug 2021 18:06:24 -0700
Message-ID: <CALAqxLXrs0_Xs0JV5H-wS1q2CJ7XhW5Dj90eu=uazkRXXEMUxQ@mail.gmail.com>
Subject: Re: [PATCH 29/29] arm64: dts: qcom: Harmonize DWC USB3 DT nodes name
To:     Serge Semin <fancer.lancer@gmail.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Felipe Balbi <balbi@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Andy Gross <agross@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux USB List <linux-usb@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Amit Pundir <amit.pundir@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jul 22, 2021 at 3:09 PM Serge Semin <fancer.lancer@gmail.com> wrote:
> On Thu, Jul 22, 2021 at 01:09:05PM -0700, John Stultz wrote:
> > On Thu, Jul 22, 2021 at 12:17 PM Bjorn Andersson
> > <bjorn.andersson@linaro.org> wrote:
> > > > On Jul 21, 2021, 1:45 PM +0200, Krzysztof Kozlowski wrote:
> > > > > I had impression that kernel defines interfaces which should be used and
> > > > > are stable (e.g. syscalls, sysfs and so on). This case is example of
> > > > > user-space relying on something not being marked as part of ABI. Instead
> > > > > they found something working for them and now it is being used in "we
> > > > > cannot break existing systems". Basically, AOSP unilaterally created a
> > > > > stable ABI and now kernel has to stick to it.
> > > > >
> > > > > Really, all normal systems depend on aliases or names and here we have
> > > > > dependency on device address. I proposed way how AOSP should be fixed.
> > > > > Anything happened? Nope.
> > > >
> > > > First time he sent a possible solution for the problem:
> > > > https://lore.kernel.org/lkml/20201221210423.GA2504@kozik-lap/
> > > >
> > > > To sum up you could have used one of the more portable approaches
> > > > 1. add an udc alias to the controller and use it then to refer to the
> > > > corresponding USB controller
> > >
> > > Is there such a thing as "UDC alias"? Or are you suggesting that we
> > > should add such feature?
> > >
> > > I think it would be wonderful if we could identify the UDCs on our
> > > boards as "USB1" and "USB2", or "the one and only USB-C connector". But
> > > unless that will fall back to the existing naming it would break John's
> > > _existing_ userspace.
> >
>
> > Well, I'd not hold up the existing userspace I'm using as sacrosanct
> > (AOSP devices still usually don't have to work cross-kernel versions -
> > devboards being the main exception). I'm fine if we can rework
> > userland as proposed, so that the issues can be avoided, but I
> > honestly don't have enough context to really understand what that
> > looks like (no idea what udc aliases are).
> >
> > And whatever we do, the main constraint is that userland has to be
> > able to work with existing LTS kernels and newer kernels.
>
> As I said in my response to Bjorn even if it is added to the kernel it
> won't get to the official LTSes as it would be a new kernel feature.
> New features aren't normally backported to the older kernels.
>
> >
> > > > 2. search through DT-nodes looking for a specific compatible/reg
> > > > DT-properties.
> > > >
> > >
> > > We could define that this is the way, but again we didn't yesterday so
> > > your proposal is not backwards compatible.
> >
>
> > It may be backwards compatible, but I'm still not clear exactly how it
> > would work.
> >
> > I guess if we look through all
> > sys/bus/platform/devices/*/of_node/compatbile strings for the desired
> > "snps,dwc3", then find which of the directories have the desired
> > address in the string? (The suggestion for looking at reg seems
> > better, but I don't get a char value out of the dwc3 of_node/reg
> > file).
>
> The algorithm is simple:
> 1) You know what USB controllers you have on your platform. They are
> supposed to be compatible with snps,dwc3 string and have some pre-defined
> base address.
> 2) Find all the files in the directory /sys/class/udc/.
> 3) Walk through all the directories in /sys/bus/platform/devices/ with
> names found in 2) and stop on the device with matching compatible/base
> address defined in 1).
>
> In my case the strings could be retrieved like this:
> USB_NAME_COMPAT=$(/sys/bus/platform/devices/1f100000.usb/of_node/compatible | tr '\0' '\t' | cut -f1)
> USB_DEVICE_ADDR="$(head -c 4 /sys/bus/platform/devices/1f100000.usb/of_node/reg | hexdump -ve '/1 "%02x"' | sed -e 's/^0*//g')"


Hey Serge,
   I just wanted to follow up here.  Amit has reworked the db845c AOSP
userland so that it no longer uses the fixed node name, but instead
probes for it:
  https://android-review.googlesource.com/c/device/linaro/dragonboard/+/1774872

Admittedly, it does take a short-cut.  As your algorithm above,
digging up the devices and finding the sys/bus path to read the reg
value and pipe through hexdump (which android doesn't have) seemed
overly obtuse when the address is in the node name itself (while the
only way to be sure, one normally doesn't use spectroscopy to
determine the value of a coin when you can read what's printed on it
:).  But, should the node naming be further changed at least the
infrastructure we have can be reworked fairly easily to adapt now.

In any case, as we can handle the name change now, if you want to
resubmit your patch, we would no longer object (but can't promise no
one else might be bitten).  Sorry for the delay this caused, and we
appreciate you working with us to find a solution.

thanks
-john
