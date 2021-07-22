Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77D9A3D2BC0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jul 2021 20:12:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229914AbhGVRbv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Jul 2021 13:31:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229716AbhGVRbu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Jul 2021 13:31:50 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 808B8C061575;
        Thu, 22 Jul 2021 11:12:25 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id g22so9944832lfu.0;
        Thu, 22 Jul 2021 11:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=LjbuTq13P9ZyzTNmXlBLLaFJFN65pioCVIN0K6aVUoA=;
        b=JTr2EQzWaaz1FdZ5ZiRrMc5hqSr3sruAR4htnqwcEvIFLUrVMGK4SaoO/4NeOS8EeP
         uRnjQSjsHSlHXraaL6fKJYCXQFMgM3bmeILHpsGA/eI9eBuEWVW4tNNR12MnfPsIIWzq
         cVQtFT+I1gbyOWA31vDF+M5oSWOlIIhtyGG6Q/g7/W6lO8I42wJmn0/Y9GY7k/55+SQl
         TmcEVI82Hg+u605v9rlgGhMG10NeRB4PqPV5Bub19nKjKRFufiKBu5CvJkhqH8cL7YOE
         0Ov7hBMdD7UL4bF+yl+GqM4L7ah/CDYsfcjpFm5rhz0m7Cps4guaX0XT24eMAcL2SHcJ
         SFog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=LjbuTq13P9ZyzTNmXlBLLaFJFN65pioCVIN0K6aVUoA=;
        b=ti+3QHuJ38TduoBLAW7VV+LpfJ8OxWDKueqjjnY1CGjkq4aK4bRQdzQ8Uno9jhz4fj
         W69iYlaZQKCtc01Vr3/6NyVSMty/1p3/PjC218Xk99oixbAaqHXCB1L0/ZT0tCYMlqie
         P1LcRoEo5w1Wu5GsdKjUQ2ZUvMaGfrJwCQkYol4Oct2oQjAxxvWPrSDtlq+xjvu5BXdz
         VWi8V4+8oVDarvQxp6nBJ1oi4gI9hDXDNneTmcVczmx6yLVVk+HDp8O3la0Sd+acZAuU
         E01MZgEI+1TUOEipeduL7JMOvH3COkFCqq7qx/904id+xeCXUs/R3333rRl8qMP5104y
         ktLA==
X-Gm-Message-State: AOAM530RDWCkZI/M29c3Va7Tiu2aHHykXKKt/5nCEyEbyWfQMrg/WV/8
        CFYmOFRn29dsEG02y49XI+k=
X-Google-Smtp-Source: ABdhPJx9uSJ8lQQQr02c2YgueRd4SZQNKVoSZxSAiicRln3FeHFVohgarmKvrURXID0isW4FNYYuYQ==
X-Received: by 2002:ac2:44d9:: with SMTP id d25mr489612lfm.92.1626977543740;
        Thu, 22 Jul 2021 11:12:23 -0700 (PDT)
Received: from mobilestation ([95.79.127.110])
        by smtp.gmail.com with ESMTPSA id c10sm3195673ljn.11.2021.07.22.11.12.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jul 2021 11:12:23 -0700 (PDT)
Date:   Thu, 22 Jul 2021 21:12:21 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     John Stultz <john.stultz@linaro.org>
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Felipe Balbi <balbi@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux USB List <linux-usb@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Amit Pundir <amit.pundir@linaro.org>
Subject: Re: [PATCH 29/29] arm64: dts: qcom: Harmonize DWC USB3 DT nodes name
Message-ID: <20210722181221.xh3r5kyu7zlcojjx@mobilestation>
References: <CALAqxLX_FNvFndEDWtGbFPjSzuAbfqxQE07diBJFZtftwEJX5A@mail.gmail.com>
 <20210714124807.o22mottsrg3tv6nt@mobilestation>
 <YPfPDqJhfzbvDLvB@kroah.com>
 <20210721100220.ddfxwugivsndsedv@mobilestation>
 <YPf29+ewbrYgHxRP@kroah.com>
 <0064cb2c-5ca6-e693-2e89-8f045c8f7502@kernel.org>
 <YPf+shNM6cXb3mfe@kroah.com>
 <d853df77-8d36-30b0-dd26-da1bfcb068e0@kernel.org>
 <20210721112531.xvu6ni5ksaehsrjh@mobilestation>
 <CALAqxLViEqSO17P3JGRGYJh-wDoHaJiQQV48zeoRgnar4Xd5Bg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALAqxLViEqSO17P3JGRGYJh-wDoHaJiQQV48zeoRgnar4Xd5Bg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jul 21, 2021 at 11:08:08AM -0700, John Stultz wrote:
> On Wed, Jul 21, 2021 at 4:25 AM Serge Semin <fancer.lancer@gmail.com> wrote:
> > On Wed, Jul 21, 2021 at 01:10:19PM +0200, Krzysztof Kozlowski wrote:
> > > It's not good example. The configfs entries (file names) are
> > > user-visible however the USB gadget exposes specific value for specific
> > > one device. It encodes device specific DT node name and HW address and
> > > gives it to user-space. It is valid only on this one HW, all other
> > > devices will have different values.
> > >
> > > User-space has hard-coded this value (DT node name and hardware
> > > address). This value was never part of configfs ABI, maybe except of its
> > > format "[a-z]+\.[0-9a-f]+". Format is not broken. Just the value changes
> > > for a specific device/hardware.
> > >
> > > It's like you depend that lsusb will always report:
> > >   Bus 003 Device 008: ID 046d:c52b Logitech, Inc. Unifying Receiver
> > > and then probing order changed and this Logitech ends as Device 009.
> > > Then AOSP guys come, wait, we hard-coded that Logitech on our device
> > > will be always Device 008, not 009. Please revert it, we depend on
> > > specific value of Device number. It must be always 009...
> > >
> > > For the record - the change discussed here it's nothing like USB VID/PID. :)
> >
> > Right I was wrong referring to the configfs names in this context.
> > That must have mislead Greg.
> >
> > Getting back to the topic AFAICS from what John said in here
> > https://lore.kernel.org/lkml/CALAqxLWGujgR7p8Vb5S_RimRVYxwm5XF-c4NkKgMH-43wEBaWg@mail.gmail.com/
> >
> > AOSP developers somehow hardcoded a USB-controller UDC name in the
> > internal property called "sys.usb.controller" with a value
> > "ff100000.dwc3". That value is generated by the kernel based on the
> > corresponding DT-node name. The property is then used to
> > pre-initialize the system like it's done here:
> > https://android.googlesource.com/platform/system/core/+/master/rootdir/init.usb.configfs.rc
> >
> > Since we changed the DT-node name in the recent kernel, we thus changed the
> > UDC controller name so AOSP init procedure now fails to bring up the Linux
> > USB-gadget using on the older UDC name. UDC is supposed to be ff100000.usb now
> > (after this patch has been merged in).
> >
> > What problems I see here:
> > 1) the AOSP developers shouldn't have hard-coded the value but read
> > from the /sys/class/udc/* directory and then decided which controller
> > to use. As it's described for instance here:
> > https://www.kernel.org/doc/Documentation/usb/gadget_configfs.txt
> 

> The problem with this is there may be multiple USB controllers on a
> system (not all exposed outside the case - and also the dummy
> controller is often present). How can we configure the system to know
> which controller is which?

How did you distinguish them before this change? It has nothing really
related with the patch in topic.

> 
> The only name we have for distinguishing the controllers is the DTS
> node. So it seems inherent that changes to that name will break the
> config.

No, it's not the only way you have. I say it was the easiest way for
you to find a corresponding device. The DT-node name never was a part
of ABI for at least up until we finally get the DT-node names
consistent with DT spec. Only then it would be possible to consider
them as such. One more time I'll quote what @Krzisztof has already
told you twice:

On Jul 21, 2021, 1:45 PM +0200, Krzysztof Kozlowski wrote:
> I had impression that kernel defines interfaces which should be used and
> are stable (e.g. syscalls, sysfs and so on). This case is example of
> user-space relying on something not being marked as part of ABI. Instead
> they found something working for them and now it is being used in "we
> cannot break existing systems". Basically, AOSP unilaterally created a
> stable ABI and now kernel has to stick to it.
> 
> Really, all normal systems depend on aliases or names and here we have
> dependency on device address. I proposed way how AOSP should be fixed.
> Anything happened? Nope.

First time he sent a possible solution for the problem:
https://lore.kernel.org/lkml/20201221210423.GA2504@kozik-lap/

To sum up you could have used one of the more portable approaches
1. add an udc alias to the controller and use it then to refer to the
corresponding USB controller
2. search through DT-nodes looking for a specific compatible/reg
DT-properties.

Of course it was easier to revert the patch. But if we always chose
such approach, the kernel would have been filled with tons of
workarounds and legacy parts without possibility to move forward to
having more unified interfaces.

> 
> That said, this issue reminded me of the /dev/hda -> /dev/sda device
> name or the eth0 -> enp3s0 switch which both also had the potential to
> break configurations or scripts.  I get that having a standard naming
> scheme is important (I'm very sympathetic to this point)! I can
> imagine UI trying to show possible controllers for a user to select
> needs a simple way to determine if a device is a usb controller - but
> again this just shows that the node names are an ABI.
> 
> So I'm not the one to judge if this change is useful enough to push
> through the pain, but it did seem to be done a bit casually.
> 
> > 2) even if they hard-coded the value, then they should have used an
> > older dts file for their platform, since DTS is more
> > platform-specific, but not the kernel one. Even if a dts-file is
> > supplied in the kernel it isn't supposed to have the node names
> > unchanged from release to release.
> 
> DTS changes are a constant source of regressions in my experience. We
> mostly just have to roll with it, but it feels never ending. :)  I'd
> personally rather folks in general be more thoughtful about what DTS
> changes they make and accept, understanding that they do have impact
> on userland.  And I'd imagine If updates to linux-firmware broke the
> most recent LTS kernel, that would be seen as a regression too, and
> folks wouldn't be told to just keep the old firmware.

> But all the
> same, I'd also be happy for suggestions to remove any such
> dependencies userland has on specific dts naming, where possible, to
> make the constant pain go away. :)

Well, @Krzisztof has already given you such suggestions regarding this
issue not once. But you tend to ignore them.

Anyway this patch doesn't break LTS kernel and doesn't break the
linux-firmware either. It changes DT-node name, which happens to
change the device name, which isn't guaranteed to be stable as it's
not part of the kernel ABI. If you think otherwise please provide some
proves to that. I didn't find any in the official Linux ABI docs.

-Sergey

> 
> thanks
> -john
