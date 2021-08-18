Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D24D3EF8D4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Aug 2021 05:44:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236287AbhHRDpB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Aug 2021 23:45:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236055AbhHRDpA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Aug 2021 23:45:00 -0400
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81D02C0613CF
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Aug 2021 20:44:26 -0700 (PDT)
Received: by mail-ot1-x32a.google.com with SMTP id 108-20020a9d01750000b029050e5cc11ae3so1127719otu.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Aug 2021 20:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=dOY/Y+m8CtGs2t22YoW318N2LcUpxV+MpuaJ5LhTgsc=;
        b=aLy58NDwB5iWg0GHfBe12kmdCiuAYo9opAjTnoggWlFAx23pcpHyAXkeBjVJdVAcI+
         y2hLvIe7bGl3c7IbxKwD2jADhSpX2mh7rFTGtMUwEp9fTkcRI17RG7mRzcOB5wZVNk3c
         Hgy9R3VSP2qotmwK+iPSpLpRRmWWeHRIO/jHIvzIQ9B09uT4Yk+IW/qstqhpAEEc6jBD
         0DCz4QZuGFNiPHeyaceIo4Ipn0WxaQ3XnAADSyHNe0ybSxadh2+foMXNVSdp136YJJ/R
         9KbpdIMTejZMUN407CjyuCUKCeVJvuG0uA4Xr5l8Mp6VdbGXjqC5gZWFBn48D3EI4rXA
         6ekQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=dOY/Y+m8CtGs2t22YoW318N2LcUpxV+MpuaJ5LhTgsc=;
        b=pPIXkl8p3gVnoe2xM5XykhQzpT2hYkHykq0/qbCSYpBGpm9mqGNoAI+JThizMOGyeW
         yCMk+sQarlADqsBRar3PD40P2zLtod+qwwwI54CGdrLZ4Py4jQdpjV2rxV3B6u1O9HNQ
         jY/4Qdgc+SFmwuRSNanQVAVZ/6ElEQ797483c0RiMW77V5TzpdyMlAXPNd0VVdz/ujaf
         sMNd2PjYjSOK90ONbTKbwHClcGJaPspF2QoInn0tG20MOps4ntXwqSp9K2wb6KEa+sHq
         YfdIESAlxmAsf2KxDPiGuYeQjs+t6byEHYdy1TXUgjB1tvuJGYsYF+8RvK0NajlgZSIf
         f5Fg==
X-Gm-Message-State: AOAM531Sb1/D7eyk9rbI3SdEkj0ST6vfy13D+IQeFiV2OVw4dsvD6xQ1
        iWQW5Ww4mYB2s5VClmOWoQkrFw==
X-Google-Smtp-Source: ABdhPJwnVYK5fYr39j7qhmd0jRrOO7rMEezuFGQlLvSOJkLU4zHxBqJ5DgiwAELpKicRaga+Gs1gCg==
X-Received: by 2002:a9d:649a:: with SMTP id g26mr5174265otl.92.1629258265750;
        Tue, 17 Aug 2021 20:44:25 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id u126sm835593ooa.23.2021.08.17.20.44.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Aug 2021 20:44:25 -0700 (PDT)
Date:   Tue, 17 Aug 2021 22:44:23 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Serge Semin <fancer.lancer@gmail.com>
Cc:     John Stultz <john.stultz@linaro.org>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
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
Message-ID: <YRyCFx0ZOYTMhinf@builder.lan>
References: <YPf+shNM6cXb3mfe@kroah.com>
 <d853df77-8d36-30b0-dd26-da1bfcb068e0@kernel.org>
 <20210721112531.xvu6ni5ksaehsrjh@mobilestation>
 <CALAqxLViEqSO17P3JGRGYJh-wDoHaJiQQV48zeoRgnar4Xd5Bg@mail.gmail.com>
 <20210722181221.xh3r5kyu7zlcojjx@mobilestation>
 <YPnEO6NVFZDS1s//@yoga>
 <CALAqxLUT0e+mHMVo685oVTxR8y76733cN0yciQ7ePS6GRE+_dg@mail.gmail.com>
 <20210722220918.l7j6zw3aaa27qato@mobilestation>
 <CALAqxLXrs0_Xs0JV5H-wS1q2CJ7XhW5Dj90eu=uazkRXXEMUxQ@mail.gmail.com>
 <20210815194617.sbrkutxzldqbxfat@mobilestation>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210815194617.sbrkutxzldqbxfat@mobilestation>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun 15 Aug 14:46 CDT 2021, Serge Semin wrote:

> Hello John
> 
> On Fri, Aug 13, 2021 at 06:06:24PM -0700, John Stultz wrote:
> > On Thu, Jul 22, 2021 at 3:09 PM Serge Semin <fancer.lancer@gmail.com> wrote:
> > > On Thu, Jul 22, 2021 at 01:09:05PM -0700, John Stultz wrote:
> > > > On Thu, Jul 22, 2021 at 12:17 PM Bjorn Andersson
> > > > <bjorn.andersson@linaro.org> wrote:
> > > > > > On Jul 21, 2021, 1:45 PM +0200, Krzysztof Kozlowski wrote:
> > > > > > > I had impression that kernel defines interfaces which should be used and
> > > > > > > are stable (e.g. syscalls, sysfs and so on). This case is example of
> > > > > > > user-space relying on something not being marked as part of ABI. Instead
> > > > > > > they found something working for them and now it is being used in "we
> > > > > > > cannot break existing systems". Basically, AOSP unilaterally created a
> > > > > > > stable ABI and now kernel has to stick to it.
> > > > > > >
> > > > > > > Really, all normal systems depend on aliases or names and here we have
> > > > > > > dependency on device address. I proposed way how AOSP should be fixed.
> > > > > > > Anything happened? Nope.
> > > > > >
> > > > > > First time he sent a possible solution for the problem:
> > > > > > https://lore.kernel.org/lkml/20201221210423.GA2504@kozik-lap/
> > > > > >
> > > > > > To sum up you could have used one of the more portable approaches
> > > > > > 1. add an udc alias to the controller and use it then to refer to the
> > > > > > corresponding USB controller
> > > > >
> > > > > Is there such a thing as "UDC alias"? Or are you suggesting that we
> > > > > should add such feature?
> > > > >
> > > > > I think it would be wonderful if we could identify the UDCs on our
> > > > > boards as "USB1" and "USB2", or "the one and only USB-C connector". But
> > > > > unless that will fall back to the existing naming it would break John's
> > > > > _existing_ userspace.
> > > >
> > >
> > > > Well, I'd not hold up the existing userspace I'm using as sacrosanct
> > > > (AOSP devices still usually don't have to work cross-kernel versions -
> > > > devboards being the main exception). I'm fine if we can rework
> > > > userland as proposed, so that the issues can be avoided, but I
> > > > honestly don't have enough context to really understand what that
> > > > looks like (no idea what udc aliases are).
> > > >
> > > > And whatever we do, the main constraint is that userland has to be
> > > > able to work with existing LTS kernels and newer kernels.
> > >
> > > As I said in my response to Bjorn even if it is added to the kernel it
> > > won't get to the official LTSes as it would be a new kernel feature.
> > > New features aren't normally backported to the older kernels.
> > >
> > > >
> > > > > > 2. search through DT-nodes looking for a specific compatible/reg
> > > > > > DT-properties.
> > > > > >
> > > > >
> > > > > We could define that this is the way, but again we didn't yesterday so
> > > > > your proposal is not backwards compatible.
> > > >
> > >
> > > > It may be backwards compatible, but I'm still not clear exactly how it
> > > > would work.
> > > >
> > > > I guess if we look through all
> > > > sys/bus/platform/devices/*/of_node/compatbile strings for the desired
> > > > "snps,dwc3", then find which of the directories have the desired
> > > > address in the string? (The suggestion for looking at reg seems
> > > > better, but I don't get a char value out of the dwc3 of_node/reg
> > > > file).
> > >
> > > The algorithm is simple:
> > > 1) You know what USB controllers you have on your platform. They are
> > > supposed to be compatible with snps,dwc3 string and have some pre-defined
> > > base address.
> > > 2) Find all the files in the directory /sys/class/udc/.
> > > 3) Walk through all the directories in /sys/bus/platform/devices/ with
> > > names found in 2) and stop on the device with matching compatible/base
> > > address defined in 1).
> > >
> > > In my case the strings could be retrieved like this:
> > > USB_NAME_COMPAT=$(/sys/bus/platform/devices/1f100000.usb/of_node/compatible | tr '\0' '\t' | cut -f1)
> > > USB_DEVICE_ADDR="$(head -c 4 /sys/bus/platform/devices/1f100000.usb/of_node/reg | hexdump -ve '/1 "%02x"' | sed -e 's/^0*//g')"
> > 
> > 
> 
> > Hey Serge,
> >    I just wanted to follow up here.  Amit has reworked the db845c AOSP
> > userland so that it no longer uses the fixed node name, but instead
> > probes for it:
> >   https://android-review.googlesource.com/c/device/linaro/dragonboard/+/1774872
> > 
> > Admittedly, it does take a short-cut.  As your algorithm above,
> > digging up the devices and finding the sys/bus path to read the reg
> > value and pipe through hexdump (which android doesn't have) seemed
> > overly obtuse when the address is in the node name itself (while the
> > only way to be sure, one normally doesn't use spectroscopy to
> > determine the value of a coin when you can read what's printed on it
> > :).  But, should the node naming be further changed at least the
> > infrastructure we have can be reworked fairly easily to adapt now.
> > 
> > In any case, as we can handle the name change now, if you want to
> > resubmit your patch, we would no longer object (but can't promise no
> > one else might be bitten).  Sorry for the delay this caused, and we
> > appreciate you working with us to find a solution.
> 
> Great! Thanks for sending the notification. I'll resend the patch with a
> reference to your report and to the update made to AOSP, as soon as I
> am done with my current task.
> 

Amit's change makes future versions of AOSP able to cope with changes in
the UDC name, unfortunately it doesn't change the fact that renaming the
node breaks compatibility in non-Android user space (or any existing
branches/tags of AOSP).

Regards,
Bjorn
