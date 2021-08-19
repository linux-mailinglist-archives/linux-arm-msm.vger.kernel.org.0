Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF1753F17A2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Aug 2021 13:03:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238440AbhHSLEC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Aug 2021 07:04:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236149AbhHSLEA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Aug 2021 07:04:00 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53127C061575;
        Thu, 19 Aug 2021 04:03:24 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id w20so12028799lfu.7;
        Thu, 19 Aug 2021 04:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/xsfEEbUef+0PhexOPJnDNgUK0wlU6L3z6qq8pex2G4=;
        b=ou2vOnvsg1YPX9EQb8p7nIbay+72BGHtmYxJ/uCF6Axg5uLF118aqBEqWOA6z3+SP3
         TY8M7oETmOzxGVAOiJA0Yj16TeJsaNsDwgbMFTduSw/HOI8tBDqJee+FWp9aQTAfGc0A
         JmRyuCiM6tZL2zbQ1LwZ5bCusAent7qD6d5vO6+/6g2hHBqjznHWWJydTY9wpv1GWOvg
         amRo6xOMJdGYN04DGaIqoAN/1+Cu2JSQ6OkgDS8p+zco8ham2dd+jLbAfzbexUVjAy1C
         h9LeYSL9fpEaYgH5g/7CU7CdEKlM7WOiPoBb7t5K6kuwsSrimCc56VzKO6rCQgzz80rs
         sQOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/xsfEEbUef+0PhexOPJnDNgUK0wlU6L3z6qq8pex2G4=;
        b=X/nZfxbZvFEZQ8G9v5csvDabYBHH1pBeIj/541F2JBFhfEmLCi+BcncX6BfRNs3W9i
         ftUIm13nHqRUKZqZNz3N+oTKjkzdNWuLVWAJ9rRumcPfqqWuURpxzVSbse3FOqgk6QYN
         jLg8ELj3bdVT5z9ceF97vobTFOai7BeiOvPuuMh6iNfoRed6qmm37ZskMNXG4tKQdo6f
         c7neTanr8GVyU2eW/5fZS16NHDQvtQ3ij7ZQMCkS6OrUEBDAt4NweLPs9lXBoScnXSNO
         R4bs5eY1afFiqMuxhmoCdo73kNNpe48/Y5lwcscwfsE+Z1TYepecL0NAWmmIUztC++vD
         GSuA==
X-Gm-Message-State: AOAM533u3c76AN2XehISImDUd4NLjo87hr5fA9MLiwZWt7uVa88yob1L
        fMu4m7p5W4A+YYcN7+XKm7s=
X-Google-Smtp-Source: ABdhPJz9GOmb4VA9APuG0iFfX3A7edPpmM5UdbUwO671XbEIM+3sLnQRi365KuptlzISZZWDKszW/g==
X-Received: by 2002:ac2:549c:: with SMTP id t28mr9066731lfk.412.1629371002709;
        Thu, 19 Aug 2021 04:03:22 -0700 (PDT)
Received: from mobilestation ([95.79.127.110])
        by smtp.gmail.com with ESMTPSA id e8sm235905ljj.132.2021.08.19.04.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Aug 2021 04:03:22 -0700 (PDT)
Date:   Thu, 19 Aug 2021 14:03:20 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        John Stultz <john.stultz@linaro.org>,
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
Message-ID: <20210819110320.ikri4yjkp3zfuvqx@mobilestation>
References: <d853df77-8d36-30b0-dd26-da1bfcb068e0@kernel.org>
 <20210721112531.xvu6ni5ksaehsrjh@mobilestation>
 <CALAqxLViEqSO17P3JGRGYJh-wDoHaJiQQV48zeoRgnar4Xd5Bg@mail.gmail.com>
 <20210722181221.xh3r5kyu7zlcojjx@mobilestation>
 <YPnEO6NVFZDS1s//@yoga>
 <CALAqxLUT0e+mHMVo685oVTxR8y76733cN0yciQ7ePS6GRE+_dg@mail.gmail.com>
 <20210722220918.l7j6zw3aaa27qato@mobilestation>
 <CALAqxLXrs0_Xs0JV5H-wS1q2CJ7XhW5Dj90eu=uazkRXXEMUxQ@mail.gmail.com>
 <20210815194617.sbrkutxzldqbxfat@mobilestation>
 <YRyCFx0ZOYTMhinf@builder.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YRyCFx0ZOYTMhinf@builder.lan>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Aug 17, 2021 at 10:44:23PM -0500, Bjorn Andersson wrote:
> On Sun 15 Aug 14:46 CDT 2021, Serge Semin wrote:
> 
> > Hello John
> > 
> > On Fri, Aug 13, 2021 at 06:06:24PM -0700, John Stultz wrote:
> > > On Thu, Jul 22, 2021 at 3:09 PM Serge Semin <fancer.lancer@gmail.com> wrote:
> > > > On Thu, Jul 22, 2021 at 01:09:05PM -0700, John Stultz wrote:
> > > > > On Thu, Jul 22, 2021 at 12:17 PM Bjorn Andersson
> > > > > <bjorn.andersson@linaro.org> wrote:
> > > > > > > On Jul 21, 2021, 1:45 PM +0200, Krzysztof Kozlowski wrote:
> > > > > > > > I had impression that kernel defines interfaces which should be used and
> > > > > > > > are stable (e.g. syscalls, sysfs and so on). This case is example of
> > > > > > > > user-space relying on something not being marked as part of ABI. Instead
> > > > > > > > they found something working for them and now it is being used in "we
> > > > > > > > cannot break existing systems". Basically, AOSP unilaterally created a
> > > > > > > > stable ABI and now kernel has to stick to it.
> > > > > > > >
> > > > > > > > Really, all normal systems depend on aliases or names and here we have
> > > > > > > > dependency on device address. I proposed way how AOSP should be fixed.
> > > > > > > > Anything happened? Nope.
> > > > > > >
> > > > > > > First time he sent a possible solution for the problem:
> > > > > > > https://lore.kernel.org/lkml/20201221210423.GA2504@kozik-lap/
> > > > > > >
> > > > > > > To sum up you could have used one of the more portable approaches
> > > > > > > 1. add an udc alias to the controller and use it then to refer to the
> > > > > > > corresponding USB controller
> > > > > >
> > > > > > Is there such a thing as "UDC alias"? Or are you suggesting that we
> > > > > > should add such feature?
> > > > > >
> > > > > > I think it would be wonderful if we could identify the UDCs on our
> > > > > > boards as "USB1" and "USB2", or "the one and only USB-C connector". But
> > > > > > unless that will fall back to the existing naming it would break John's
> > > > > > _existing_ userspace.
> > > > >
> > > >
> > > > > Well, I'd not hold up the existing userspace I'm using as sacrosanct
> > > > > (AOSP devices still usually don't have to work cross-kernel versions -
> > > > > devboards being the main exception). I'm fine if we can rework
> > > > > userland as proposed, so that the issues can be avoided, but I
> > > > > honestly don't have enough context to really understand what that
> > > > > looks like (no idea what udc aliases are).
> > > > >
> > > > > And whatever we do, the main constraint is that userland has to be
> > > > > able to work with existing LTS kernels and newer kernels.
> > > >
> > > > As I said in my response to Bjorn even if it is added to the kernel it
> > > > won't get to the official LTSes as it would be a new kernel feature.
> > > > New features aren't normally backported to the older kernels.
> > > >
> > > > >
> > > > > > > 2. search through DT-nodes looking for a specific compatible/reg
> > > > > > > DT-properties.
> > > > > > >
> > > > > >
> > > > > > We could define that this is the way, but again we didn't yesterday so
> > > > > > your proposal is not backwards compatible.
> > > > >
> > > >
> > > > > It may be backwards compatible, but I'm still not clear exactly how it
> > > > > would work.
> > > > >
> > > > > I guess if we look through all
> > > > > sys/bus/platform/devices/*/of_node/compatbile strings for the desired
> > > > > "snps,dwc3", then find which of the directories have the desired
> > > > > address in the string? (The suggestion for looking at reg seems
> > > > > better, but I don't get a char value out of the dwc3 of_node/reg
> > > > > file).
> > > >
> > > > The algorithm is simple:
> > > > 1) You know what USB controllers you have on your platform. They are
> > > > supposed to be compatible with snps,dwc3 string and have some pre-defined
> > > > base address.
> > > > 2) Find all the files in the directory /sys/class/udc/.
> > > > 3) Walk through all the directories in /sys/bus/platform/devices/ with
> > > > names found in 2) and stop on the device with matching compatible/base
> > > > address defined in 1).
> > > >
> > > > In my case the strings could be retrieved like this:
> > > > USB_NAME_COMPAT=$(/sys/bus/platform/devices/1f100000.usb/of_node/compatible | tr '\0' '\t' | cut -f1)
> > > > USB_DEVICE_ADDR="$(head -c 4 /sys/bus/platform/devices/1f100000.usb/of_node/reg | hexdump -ve '/1 "%02x"' | sed -e 's/^0*//g')"
> > > 
> > > 
> > 
> > > Hey Serge,
> > >    I just wanted to follow up here.  Amit has reworked the db845c AOSP
> > > userland so that it no longer uses the fixed node name, but instead
> > > probes for it:
> > >   https://android-review.googlesource.com/c/device/linaro/dragonboard/+/1774872
> > > 
> > > Admittedly, it does take a short-cut.  As your algorithm above,
> > > digging up the devices and finding the sys/bus path to read the reg
> > > value and pipe through hexdump (which android doesn't have) seemed
> > > overly obtuse when the address is in the node name itself (while the
> > > only way to be sure, one normally doesn't use spectroscopy to
> > > determine the value of a coin when you can read what's printed on it
> > > :).  But, should the node naming be further changed at least the
> > > infrastructure we have can be reworked fairly easily to adapt now.
> > > 
> > > In any case, as we can handle the name change now, if you want to
> > > resubmit your patch, we would no longer object (but can't promise no
> > > one else might be bitten).  Sorry for the delay this caused, and we
> > > appreciate you working with us to find a solution.
> > 
> > Great! Thanks for sending the notification. I'll resend the patch with a
> > reference to your report and to the update made to AOSP, as soon as I
> > am done with my current task.
> > 
> 

> Amit's change makes future versions of AOSP able to cope with changes in
> the UDC name, unfortunately it doesn't change the fact that renaming the
> node breaks compatibility in non-Android user space (or any existing
> branches/tags of AOSP).

After looking over the whole discussion, as I see it there is no
compatibility breakage in this case. But there is an improper UDC
interface usage, which has been fixed by Amit and could be ported to
another AOSP branches/tags if needed. As [1] says user-space is
able to create a USB gadget only with controllers listed in the
directory /sys/class/udc/*. That ABI doesn't change. Note the ABI
doesn't say that if someone found a file there in some kernel
version it will be available there in the in a next version with the
same name. A developer just need to search for the UDC controllers ach
time when a UDC gadget needs to be created.

Anyway as I see it the UDC gadget creation ABI IS indeed abided by
most of the developers since we haven't heard much complains so far
except from John. In case of AOSP the problem has been fixed so we can
get back the modification and proceed with the rest of the patches
review.

[1] Documentation/usb/gadget_configfs.rst

-Sergey

> 
> Regards,
> Bjorn
