Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F0C33ECAB3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Aug 2021 21:46:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229760AbhHOTqx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 15 Aug 2021 15:46:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229502AbhHOTqx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 15 Aug 2021 15:46:53 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CE57C061764;
        Sun, 15 Aug 2021 12:46:22 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id i28so3634107lfl.2;
        Sun, 15 Aug 2021 12:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=36NQvMA7IhQ2nmvYXvhQS10mXmbyiVfQYsSQBpwdN4E=;
        b=o9DHSf/Z8wa31i7vC39Q7BI4PvIDUQFrp3wSqcvy6IR4pNx1h5Y75KpRgXsK4zXz97
         AhoBauG2YTmFnVlX94jAWt8u5on1Zdat77YdcOb8r0FXvo+IB0nSHp4d2pxOPfjWOXXC
         gCoTQQovqrXT9PFhsRvHgYsUB3lVBgH4Cl8iMiryt6IH9YR/KGAjpkiXBkoUTfuKUZ9d
         fEIpLmESp4jDdaX4ILeE+2FmDg7MsNnxXlYEgZdj2p2gTEhQHhe+w9yNNz3Lwgnnwcfn
         4Xc2fWO54dJomMCfJn6F1LLjNAEK65eBo5c1v7G9xXbHSA4ax3ayCCLtlyQNpu5aP/za
         FwGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=36NQvMA7IhQ2nmvYXvhQS10mXmbyiVfQYsSQBpwdN4E=;
        b=VytgKsLQ0K9Ycx4D0vl3FDuYDOW4lCL6gdnizjCYgVcLJYNNtZAWE1OiTB9LKHoFa5
         JvidmQvoojf8goBeLVoXo/52rrKRkuymCYKXPQwplb0SG8NxyT2ybi2eWCDja7YfsUfC
         eRi6F8i30VAB58VfnrwTHL9YBT6OBj4X+pBgsC3Z91NfGYNcnmeuAl4oKTDPqlCY3129
         wbO0hIH5pCnOREiLAshD9QraXS7+YDEN+nssmMMHhgZj0JrVPJ1Y9E8FFTAtlWd9uTyW
         OlASsrZBBlzmPC84K59RdvUO+2rQK5MZPQepzkNUQDJeWwZv00Ow6mBihHU6esoQvs1R
         4wBA==
X-Gm-Message-State: AOAM530WuJU7GLWbG4x+slN6Z7G//HiC69h64oobJ2Ox6ujFu4lUnmPt
        l17yn/Wpu9cx6kTERkGGgLo=
X-Google-Smtp-Source: ABdhPJzares3O8HkMm6UoYb2Tt6v7dLiTqx4kl65ShpcTpWtLn4bm0L7MAaUy0Qh0nZbhc9gchSvUg==
X-Received: by 2002:ac2:4833:: with SMTP id 19mr9273501lft.528.1629056780602;
        Sun, 15 Aug 2021 12:46:20 -0700 (PDT)
Received: from mobilestation ([95.79.127.110])
        by smtp.gmail.com with ESMTPSA id s4sm932870ljp.115.2021.08.15.12.46.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Aug 2021 12:46:19 -0700 (PDT)
Date:   Sun, 15 Aug 2021 22:46:17 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     John Stultz <john.stultz@linaro.org>
Cc:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
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
Subject: Re: [PATCH 29/29] arm64: dts: qcom: Harmonize DWC USB3 DT nodes name
Message-ID: <20210815194617.sbrkutxzldqbxfat@mobilestation>
References: <0064cb2c-5ca6-e693-2e89-8f045c8f7502@kernel.org>
 <YPf+shNM6cXb3mfe@kroah.com>
 <d853df77-8d36-30b0-dd26-da1bfcb068e0@kernel.org>
 <20210721112531.xvu6ni5ksaehsrjh@mobilestation>
 <CALAqxLViEqSO17P3JGRGYJh-wDoHaJiQQV48zeoRgnar4Xd5Bg@mail.gmail.com>
 <20210722181221.xh3r5kyu7zlcojjx@mobilestation>
 <YPnEO6NVFZDS1s//@yoga>
 <CALAqxLUT0e+mHMVo685oVTxR8y76733cN0yciQ7ePS6GRE+_dg@mail.gmail.com>
 <20210722220918.l7j6zw3aaa27qato@mobilestation>
 <CALAqxLXrs0_Xs0JV5H-wS1q2CJ7XhW5Dj90eu=uazkRXXEMUxQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALAqxLXrs0_Xs0JV5H-wS1q2CJ7XhW5Dj90eu=uazkRXXEMUxQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello John

On Fri, Aug 13, 2021 at 06:06:24PM -0700, John Stultz wrote:
> On Thu, Jul 22, 2021 at 3:09 PM Serge Semin <fancer.lancer@gmail.com> wrote:
> > On Thu, Jul 22, 2021 at 01:09:05PM -0700, John Stultz wrote:
> > > On Thu, Jul 22, 2021 at 12:17 PM Bjorn Andersson
> > > <bjorn.andersson@linaro.org> wrote:
> > > > > On Jul 21, 2021, 1:45 PM +0200, Krzysztof Kozlowski wrote:
> > > > > > I had impression that kernel defines interfaces which should be used and
> > > > > > are stable (e.g. syscalls, sysfs and so on). This case is example of
> > > > > > user-space relying on something not being marked as part of ABI. Instead
> > > > > > they found something working for them and now it is being used in "we
> > > > > > cannot break existing systems". Basically, AOSP unilaterally created a
> > > > > > stable ABI and now kernel has to stick to it.
> > > > > >
> > > > > > Really, all normal systems depend on aliases or names and here we have
> > > > > > dependency on device address. I proposed way how AOSP should be fixed.
> > > > > > Anything happened? Nope.
> > > > >
> > > > > First time he sent a possible solution for the problem:
> > > > > https://lore.kernel.org/lkml/20201221210423.GA2504@kozik-lap/
> > > > >
> > > > > To sum up you could have used one of the more portable approaches
> > > > > 1. add an udc alias to the controller and use it then to refer to the
> > > > > corresponding USB controller
> > > >
> > > > Is there such a thing as "UDC alias"? Or are you suggesting that we
> > > > should add such feature?
> > > >
> > > > I think it would be wonderful if we could identify the UDCs on our
> > > > boards as "USB1" and "USB2", or "the one and only USB-C connector". But
> > > > unless that will fall back to the existing naming it would break John's
> > > > _existing_ userspace.
> > >
> >
> > > Well, I'd not hold up the existing userspace I'm using as sacrosanct
> > > (AOSP devices still usually don't have to work cross-kernel versions -
> > > devboards being the main exception). I'm fine if we can rework
> > > userland as proposed, so that the issues can be avoided, but I
> > > honestly don't have enough context to really understand what that
> > > looks like (no idea what udc aliases are).
> > >
> > > And whatever we do, the main constraint is that userland has to be
> > > able to work with existing LTS kernels and newer kernels.
> >
> > As I said in my response to Bjorn even if it is added to the kernel it
> > won't get to the official LTSes as it would be a new kernel feature.
> > New features aren't normally backported to the older kernels.
> >
> > >
> > > > > 2. search through DT-nodes looking for a specific compatible/reg
> > > > > DT-properties.
> > > > >
> > > >
> > > > We could define that this is the way, but again we didn't yesterday so
> > > > your proposal is not backwards compatible.
> > >
> >
> > > It may be backwards compatible, but I'm still not clear exactly how it
> > > would work.
> > >
> > > I guess if we look through all
> > > sys/bus/platform/devices/*/of_node/compatbile strings for the desired
> > > "snps,dwc3", then find which of the directories have the desired
> > > address in the string? (The suggestion for looking at reg seems
> > > better, but I don't get a char value out of the dwc3 of_node/reg
> > > file).
> >
> > The algorithm is simple:
> > 1) You know what USB controllers you have on your platform. They are
> > supposed to be compatible with snps,dwc3 string and have some pre-defined
> > base address.
> > 2) Find all the files in the directory /sys/class/udc/.
> > 3) Walk through all the directories in /sys/bus/platform/devices/ with
> > names found in 2) and stop on the device with matching compatible/base
> > address defined in 1).
> >
> > In my case the strings could be retrieved like this:
> > USB_NAME_COMPAT=$(/sys/bus/platform/devices/1f100000.usb/of_node/compatible | tr '\0' '\t' | cut -f1)
> > USB_DEVICE_ADDR="$(head -c 4 /sys/bus/platform/devices/1f100000.usb/of_node/reg | hexdump -ve '/1 "%02x"' | sed -e 's/^0*//g')"
> 
> 

> Hey Serge,
>    I just wanted to follow up here.  Amit has reworked the db845c AOSP
> userland so that it no longer uses the fixed node name, but instead
> probes for it:
>   https://android-review.googlesource.com/c/device/linaro/dragonboard/+/1774872
> 
> Admittedly, it does take a short-cut.  As your algorithm above,
> digging up the devices and finding the sys/bus path to read the reg
> value and pipe through hexdump (which android doesn't have) seemed
> overly obtuse when the address is in the node name itself (while the
> only way to be sure, one normally doesn't use spectroscopy to
> determine the value of a coin when you can read what's printed on it
> :).  But, should the node naming be further changed at least the
> infrastructure we have can be reworked fairly easily to adapt now.
> 
> In any case, as we can handle the name change now, if you want to
> resubmit your patch, we would no longer object (but can't promise no
> one else might be bitten).  Sorry for the delay this caused, and we
> appreciate you working with us to find a solution.

Great! Thanks for sending the notification. I'll resend the patch with a
reference to your report and to the update made to AOSP, as soon as I
am done with my current task.

Regards
-Sergey

> 
> thanks
> -john
