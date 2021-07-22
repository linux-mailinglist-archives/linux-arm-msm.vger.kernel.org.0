Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF84D3D2F64
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jul 2021 23:55:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231858AbhGVVOW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Jul 2021 17:14:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231336AbhGVVOW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Jul 2021 17:14:22 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57600C061575;
        Thu, 22 Jul 2021 14:54:55 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id t20so9233269ljd.2;
        Thu, 22 Jul 2021 14:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=pvlmTHk2+lbZBOZSnrun/AeBzfz6XMBW8GJa8DMckvQ=;
        b=uQObpAbjrJX6qqrJZoKbvfOQcBjft0jwfT8VUCee/UxL6HE5gmMhRJ5/T3EYz2bcgU
         Rjs84Iy/3uAXiWgl8LxEW4p0dTf2DCOTXHiIIYCrkFgi9CT8GoYt3O99U0SAnv5LhyKt
         6kQgW5z40xa+ABvD455GhrzVIQlhIt6Ao0TJc20CEU6sSmsqV+s36w/+qy5KkQgknA9d
         T9uP9GJiXJ/4ld6wOHLFYttWfAp1uHx/7V7871FpPgpHVejTjcHKs8kFZ70D5CRGOTAH
         1QDOmA1f9s8pd+nPa5Nt9QR8K5yetir3YqNpyuAOfihywkjkWJtcQPlUnsWuEKO1y/g6
         0sSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pvlmTHk2+lbZBOZSnrun/AeBzfz6XMBW8GJa8DMckvQ=;
        b=qq4aeEXpvHFGkHkCDNeuAheZRUaTP+QdyDbml361ed67w9PznWgpkoL5oMLx8ownlE
         AU3AnJ96wF9UA/qTSjTKBdKmuQBg6+JKSf3FLmB8TizBOi8/cirfJSTzRRQEsidtgXkb
         NQfaPio6ZnRUQ3ivb/1N28X2ERL8xXbYNqi6m5jCUetWarJ5jC2fH/zALu41ATWmRBGH
         2c88RRJ14nGMYr+eIboGSk3305z6cpcNEgowxPshyylhysrm0/c3PphlWYSxWT1rVosm
         v0I7q9HOMAX9Zds9QhQiteSGXuYOphsaynkgec5vBfqMW48G5+45/tqwBkG4xYzeeVSn
         DVMw==
X-Gm-Message-State: AOAM531+0i5r3r91NMxSNHkDQxE3xKkE+AOub6lxxnc5a8EszGgJ6u9l
        bVfkhERNOwcgZw7WU1pDB7I=
X-Google-Smtp-Source: ABdhPJz9hPbhsGf8+1qLd5pBiKJ3Xx+gTBL0/9qeMC+4zuP+95wCklYUKGC3loJ/8LCtmVgmhpi6WA==
X-Received: by 2002:a2e:7e05:: with SMTP id z5mr1402211ljc.342.1626990893667;
        Thu, 22 Jul 2021 14:54:53 -0700 (PDT)
Received: from mobilestation ([95.79.127.110])
        by smtp.gmail.com with ESMTPSA id a16sm1802070lfi.38.2021.07.22.14.54.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jul 2021 14:54:53 -0700 (PDT)
Date:   Fri, 23 Jul 2021 00:54:51 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     John Stultz <john.stultz@linaro.org>,
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
Message-ID: <20210722215451.cdhvh5jjvtv5zncl@mobilestation>
References: <YPfPDqJhfzbvDLvB@kroah.com>
 <20210721100220.ddfxwugivsndsedv@mobilestation>
 <YPf29+ewbrYgHxRP@kroah.com>
 <0064cb2c-5ca6-e693-2e89-8f045c8f7502@kernel.org>
 <YPf+shNM6cXb3mfe@kroah.com>
 <d853df77-8d36-30b0-dd26-da1bfcb068e0@kernel.org>
 <20210721112531.xvu6ni5ksaehsrjh@mobilestation>
 <CALAqxLViEqSO17P3JGRGYJh-wDoHaJiQQV48zeoRgnar4Xd5Bg@mail.gmail.com>
 <20210722181221.xh3r5kyu7zlcojjx@mobilestation>
 <YPnEO6NVFZDS1s//@yoga>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YPnEO6NVFZDS1s//@yoga>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jul 22, 2021 at 02:17:15PM -0500, Bjorn Andersson wrote:
> On Thu 22 Jul 13:12 CDT 2021, Serge Semin wrote:
> > On Wed, Jul 21, 2021 at 11:08:08AM -0700, John Stultz wrote:
> > > On Wed, Jul 21, 2021 at 4:25 AM Serge Semin <fancer.lancer@gmail.com> wrote:
> > > > On Wed, Jul 21, 2021 at 01:10:19PM +0200, Krzysztof Kozlowski wrote:
> > > > > It's not good example. The configfs entries (file names) are
> > > > > user-visible however the USB gadget exposes specific value for specific
> > > > > one device. It encodes device specific DT node name and HW address and
> > > > > gives it to user-space. It is valid only on this one HW, all other
> > > > > devices will have different values.
> > > > >
> > > > > User-space has hard-coded this value (DT node name and hardware
> > > > > address). This value was never part of configfs ABI, maybe except of its
> > > > > format "[a-z]+\.[0-9a-f]+". Format is not broken. Just the value changes
> > > > > for a specific device/hardware.
> > > > >
> > > > > It's like you depend that lsusb will always report:
> > > > >   Bus 003 Device 008: ID 046d:c52b Logitech, Inc. Unifying Receiver
> > > > > and then probing order changed and this Logitech ends as Device 009.
> > > > > Then AOSP guys come, wait, we hard-coded that Logitech on our device
> > > > > will be always Device 008, not 009. Please revert it, we depend on
> > > > > specific value of Device number. It must be always 009...
> > > > >
> > > > > For the record - the change discussed here it's nothing like USB VID/PID. :)
> > > >
> > > > Right I was wrong referring to the configfs names in this context.
> > > > That must have mislead Greg.
> > > >
> > > > Getting back to the topic AFAICS from what John said in here
> > > > https://lore.kernel.org/lkml/CALAqxLWGujgR7p8Vb5S_RimRVYxwm5XF-c4NkKgMH-43wEBaWg@mail.gmail.com/
> > > >
> > > > AOSP developers somehow hardcoded a USB-controller UDC name in the
> > > > internal property called "sys.usb.controller" with a value
> > > > "ff100000.dwc3". That value is generated by the kernel based on the
> > > > corresponding DT-node name. The property is then used to
> > > > pre-initialize the system like it's done here:
> > > > https://android.googlesource.com/platform/system/core/+/master/rootdir/init.usb.configfs.rc
> > > >
> > > > Since we changed the DT-node name in the recent kernel, we thus changed the
> > > > UDC controller name so AOSP init procedure now fails to bring up the Linux
> > > > USB-gadget using on the older UDC name. UDC is supposed to be ff100000.usb now
> > > > (after this patch has been merged in).
> > > >
> > > > What problems I see here:
> > > > 1) the AOSP developers shouldn't have hard-coded the value but read
> > > > from the /sys/class/udc/* directory and then decided which controller
> > > > to use. As it's described for instance here:
> > > > https://www.kernel.org/doc/Documentation/usb/gadget_configfs.txt
> > > 
> > 
> > > The problem with this is there may be multiple USB controllers on a
> > > system (not all exposed outside the case - and also the dummy
> > > controller is often present). How can we configure the system to know
> > > which controller is which?
> > 
> > How did you distinguish them before this change? It has nothing really
> > related with the patch in topic.
> > 
> > > 
> > > The only name we have for distinguishing the controllers is the DTS
> > > node. So it seems inherent that changes to that name will break the
> > > config.
> > 
> > No, it's not the only way you have. I say it was the easiest way for
> > you to find a corresponding device. The DT-node name never was a part
> > of ABI for at least up until we finally get the DT-node names
> > consistent with DT spec. Only then it would be possible to consider
> > them as such. One more time I'll quote what @Krzisztof has already
> > told you twice:
> > 
> 

> The requirement to keep a stable userspace ABI does not consider the
> fact that the kernel made up part of that ABI based on things it found
> in e.g. DT.
> 
> The name of the UDC devices has been and is simply the
> dev_name(dwc3-device) and this is directly based on the DT node.
> 
> So changing DT indirectly changed the user space ABI and anyone who is
> using USB Gadget Configfs is directly affected by this.

Here we get to the main question again: is the device-name or an
acceptable values of the UDC configfs node are a part of the kernel
ABI? Could you provide a link to where the Linux ABI docs state that?
I failed to find it. The only part what concerns UDC is described in
Documentation/ABI/stable/sysfs-class-udc. But it doesn't guarantee any
device name, DT-node name or so.

> 
> Regards,
> Bjorn
> 
> > On Jul 21, 2021, 1:45 PM +0200, Krzysztof Kozlowski wrote:
> > > I had impression that kernel defines interfaces which should be used and
> > > are stable (e.g. syscalls, sysfs and so on). This case is example of
> > > user-space relying on something not being marked as part of ABI. Instead
> > > they found something working for them and now it is being used in "we
> > > cannot break existing systems". Basically, AOSP unilaterally created a
> > > stable ABI and now kernel has to stick to it.
> > > 
> > > Really, all normal systems depend on aliases or names and here we have
> > > dependency on device address. I proposed way how AOSP should be fixed.
> > > Anything happened? Nope.
> > 
> > First time he sent a possible solution for the problem:
> > https://lore.kernel.org/lkml/20201221210423.GA2504@kozik-lap/
> > 
> > To sum up you could have used one of the more portable approaches
> > 1. add an udc alias to the controller and use it then to refer to the
> > corresponding USB controller
> 

> Is there such a thing as "UDC alias"? Or are you suggesting that we
> should add such feature?

There isn't at the moment. But it could be added.

> 
> I think it would be wonderful if we could identify the UDCs on our
> boards as "USB1" and "USB2", or "the one and only USB-C connector". But
> unless that will fall back to the existing naming it would break John's
> _existing_ userspace.

Well, even if we implemented that feature, then I don't see why John
or someone responsible for AOSP support would have wanted to change
the user-space part to comply with it seeing nobody decided to follow
the 2nd case suggested by @Krzysztof (see my next comment). Especially
seeing it won't be backported to the LTS kernels as it would be a new
feature.

> 
> > 2. search through DT-nodes looking for a specific compatible/reg
> > DT-properties.
> > 
> 

> We could define that this is the way, but again we didn't yesterday so
> your proposal is not backwards compatible.

Hmm, what isn't backwards compatible in this solution? What I can see
is that it wasn't indeed implemented in AOSP.

Anyway looking at this discussion in the whole the logic seems to get
to a deadlock. John said there is no a solution. We suggest two of
them. One of them involves kernel changes (alias-related) and thus
user-space modifications, another one - only the user-space changes.
You say the second one isn't appropriate as it won't be backwards
compatible. The first one, which involves having both part modified,
won't be also backwards compatible and thus won't be suitable either.
Therefore the only solution you accept is reverting the patch just
because nobody really wants to provide the AOSP modification instead.

> 
> > Of course it was easier to revert the patch. But if we always chose
> > such approach, the kernel would have been filled with tons of
> > workarounds and legacy parts without possibility to move forward to
> > having more unified interfaces.
> > 
> 

> Yes, and that's exactly where we are heading with the ongoing DT
> validation work. But "don't break your users" isn't excused because the
> ABI is derived from some third party.

I always thought that ABI is supposed to be something what is
thoroughly documented and firmly declared to be so. It isn't something
claimed to be on a random nature but defined to be one when it's
more-or-less standardized. Thus the Linux kernel developers decide not
to change something unless it went through the series of iterations like
testing, stable, obsolete, remove. As I see it the rule-of-thumb is
supposed to be as "nothing is ABI unless it's declared as such".

> 
> > > 
> > > That said, this issue reminded me of the /dev/hda -> /dev/sda device
> > > name or the eth0 -> enp3s0 switch which both also had the potential to
> > > break configurations or scripts.  I get that having a standard naming
> > > scheme is important (I'm very sympathetic to this point)! I can
> > > imagine UI trying to show possible controllers for a user to select
> > > needs a simple way to determine if a device is a usb controller - but
> > > again this just shows that the node names are an ABI.
> > > 
> > > So I'm not the one to judge if this change is useful enough to push
> > > through the pain, but it did seem to be done a bit casually.
> > > 
> > > > 2) even if they hard-coded the value, then they should have used an
> > > > older dts file for their platform, since DTS is more
> > > > platform-specific, but not the kernel one. Even if a dts-file is
> > > > supplied in the kernel it isn't supposed to have the node names
> > > > unchanged from release to release.
> > > 
> > > DTS changes are a constant source of regressions in my experience. We
> > > mostly just have to roll with it, but it feels never ending. :)  I'd
> > > personally rather folks in general be more thoughtful about what DTS
> > > changes they make and accept, understanding that they do have impact
> > > on userland.  And I'd imagine If updates to linux-firmware broke the
> > > most recent LTS kernel, that would be seen as a regression too, and
> > > folks wouldn't be told to just keep the old firmware.
> > 
> > > But all the
> > > same, I'd also be happy for suggestions to remove any such
> > > dependencies userland has on specific dts naming, where possible, to
> > > make the constant pain go away. :)
> > 
> > Well, @Krzisztof has already given you such suggestions regarding this
> > issue not once. But you tend to ignore them.
> > 
> 

> Those are good suggestions, but they require changes in userspace.

So what I can infer from all of that is we aren't supposed to change
in the kernel anything what may cause user-space changes. Right? If
so the kernel will end up in a dead-end very soon.

> 
> > Anyway this patch doesn't break LTS kernel and doesn't break the
> > linux-firmware either. It changes DT-node name, which happens to
> > change the device name, which isn't guaranteed to be stable as it's
> > not part of the kernel ABI. If you think otherwise please provide some
> > proves to that. I didn't find any in the official Linux ABI docs.
> > 
> 

> I think it's a gray area, at least I do want it to be a gray area,
> because I don't want device names to be part of the ABI.
> 
> 
> The problem is that someone decided to use the device name in the USB
> gadget configfs interface and as such made it part of the ABI.

I can agree with that only if any value acceptable by configfs
nodes implicitly gets to be ABI. But I failed to find any proof of
that. As I said above the only UDC-related ABI I found was described
in Documentation/ABI/stable/sysfs-class-udc. In addition to that there
is a currently testing USB-gadget configfs interface
Documentation/ABI/testing/configfs-usb-gadget
but it also claims that the user-space applications are supposed to use the
USB-controller names found in the /sys/class/udc/* directory.

Regards,
-Sergey

> 
> Regards,
> Bjorn
