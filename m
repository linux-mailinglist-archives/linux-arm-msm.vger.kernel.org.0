Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F1113D2F84
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jul 2021 00:09:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231613AbhGVV2u (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Jul 2021 17:28:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231313AbhGVV2t (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Jul 2021 17:28:49 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E074AC061575;
        Thu, 22 Jul 2021 15:09:22 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id q16so10799033lfa.5;
        Thu, 22 Jul 2021 15:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=sQcCO7T0VAeOgAPpjlMadGVJqKhrykjGpQRGvXrG7D4=;
        b=P9Ye/XTsfh014C3IkLuJWNzEvvbK5NNSjz9ggjj2gNq1gshduWRYIhCF9ETVibqLgf
         VUOYW7QWB0BjjkSn5AbCrOQNbD9ZIKHlpdqBHvpyDgyo+5YMUMp/zMNTs7Q0NGRkYmUn
         UydSeXEKwZEfSiLMUu3YT/kJERY1Xf5IAGg+uCgXSHZNYn8nFuLY82y1yU259oknri4f
         /cHM/1Mm07WZGR30SvqbasOvefUVihOjtIgxtZ63O+bik30eDhFg4s3SZ0SBBg0uczZt
         W17HyEPFGhdhC2Yz8/pADAbzaNwpobpWxWAhVec0q3nMI1iJji00nKG6c/V+CI6QfdxP
         Jdeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=sQcCO7T0VAeOgAPpjlMadGVJqKhrykjGpQRGvXrG7D4=;
        b=OUO77xb0ViRRe9mtXQWZ2HbTzccyui1qn8tYAgmtz6pSyU/mxHroFQKc0TRC4DD1Bg
         PL+LzkH83b8F1yktnVTsa1y9MmraW8otqS6xBxf4QbQsyfpd9PN/ioTvmScGGL/dhT3d
         jOxcHnkhVRTcCZyayVBID3dDInWeZcMRthRHtFbPxz0YocKhZ03f3jOyT2NpqcqClmJA
         keWiMaEUfCZ2QQzrbOIBrkQwf6azHa3LD82zSDiMiEhEe8n6RQl0PEuY88HdrmRzbZmU
         lNPpoc3tyMOqCF4IIiFx4pMcz47Bw+G7UbaRMq9qTt7jHbAPlWftTG6dOD/TQZD2LSHc
         iCHg==
X-Gm-Message-State: AOAM530ahMVglekKeSoFxDPMOQMm/VHMYh9+qUotHxU+kF0jrVZod9uR
        LKOnuEXn5c4L2SDqKCRIbrw=
X-Google-Smtp-Source: ABdhPJxSj5Qrch2X3G0CeHYQm8Cr6HGhrry0iOsxNObScS97gZBVYhJYtco3C8u1Bdcfc/l8coFAow==
X-Received: by 2002:ac2:43a6:: with SMTP id t6mr980010lfl.194.1626991761252;
        Thu, 22 Jul 2021 15:09:21 -0700 (PDT)
Received: from mobilestation ([95.79.127.110])
        by smtp.gmail.com with ESMTPSA id g12sm3214158lja.13.2021.07.22.15.09.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jul 2021 15:09:20 -0700 (PDT)
Date:   Fri, 23 Jul 2021 01:09:18 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     John Stultz <john.stultz@linaro.org>
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
Subject: Re: [PATCH 29/29] arm64: dts: qcom: Harmonize DWC USB3 DT nodes name
Message-ID: <20210722220918.l7j6zw3aaa27qato@mobilestation>
References: <20210721100220.ddfxwugivsndsedv@mobilestation>
 <YPf29+ewbrYgHxRP@kroah.com>
 <0064cb2c-5ca6-e693-2e89-8f045c8f7502@kernel.org>
 <YPf+shNM6cXb3mfe@kroah.com>
 <d853df77-8d36-30b0-dd26-da1bfcb068e0@kernel.org>
 <20210721112531.xvu6ni5ksaehsrjh@mobilestation>
 <CALAqxLViEqSO17P3JGRGYJh-wDoHaJiQQV48zeoRgnar4Xd5Bg@mail.gmail.com>
 <20210722181221.xh3r5kyu7zlcojjx@mobilestation>
 <YPnEO6NVFZDS1s//@yoga>
 <CALAqxLUT0e+mHMVo685oVTxR8y76733cN0yciQ7ePS6GRE+_dg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALAqxLUT0e+mHMVo685oVTxR8y76733cN0yciQ7ePS6GRE+_dg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jul 22, 2021 at 01:09:05PM -0700, John Stultz wrote:
> On Thu, Jul 22, 2021 at 12:17 PM Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> > > On Jul 21, 2021, 1:45 PM +0200, Krzysztof Kozlowski wrote:
> > > > I had impression that kernel defines interfaces which should be used and
> > > > are stable (e.g. syscalls, sysfs and so on). This case is example of
> > > > user-space relying on something not being marked as part of ABI. Instead
> > > > they found something working for them and now it is being used in "we
> > > > cannot break existing systems". Basically, AOSP unilaterally created a
> > > > stable ABI and now kernel has to stick to it.
> > > >
> > > > Really, all normal systems depend on aliases or names and here we have
> > > > dependency on device address. I proposed way how AOSP should be fixed.
> > > > Anything happened? Nope.
> > >
> > > First time he sent a possible solution for the problem:
> > > https://lore.kernel.org/lkml/20201221210423.GA2504@kozik-lap/
> > >
> > > To sum up you could have used one of the more portable approaches
> > > 1. add an udc alias to the controller and use it then to refer to the
> > > corresponding USB controller
> >
> > Is there such a thing as "UDC alias"? Or are you suggesting that we
> > should add such feature?
> >
> > I think it would be wonderful if we could identify the UDCs on our
> > boards as "USB1" and "USB2", or "the one and only USB-C connector". But
> > unless that will fall back to the existing naming it would break John's
> > _existing_ userspace.
> 

> Well, I'd not hold up the existing userspace I'm using as sacrosanct
> (AOSP devices still usually don't have to work cross-kernel versions -
> devboards being the main exception). I'm fine if we can rework
> userland as proposed, so that the issues can be avoided, but I
> honestly don't have enough context to really understand what that
> looks like (no idea what udc aliases are).
> 
> And whatever we do, the main constraint is that userland has to be
> able to work with existing LTS kernels and newer kernels.

As I said in my response to Bjorn even if it is added to the kernel it
won't get to the official LTSes as it would be a new kernel feature.
New features aren't normally backported to the older kernels.

> 
> > > 2. search through DT-nodes looking for a specific compatible/reg
> > > DT-properties.
> > >
> >
> > We could define that this is the way, but again we didn't yesterday so
> > your proposal is not backwards compatible.
> 

> It may be backwards compatible, but I'm still not clear exactly how it
> would work.
> 
> I guess if we look through all
> sys/bus/platform/devices/*/of_node/compatbile strings for the desired
> "snps,dwc3", then find which of the directories have the desired
> address in the string? (The suggestion for looking at reg seems
> better, but I don't get a char value out of the dwc3 of_node/reg
> file).

The algorithm is simple:
1) You know what USB controllers you have on your platform. They are
supposed to be compatible with snps,dwc3 string and have some pre-defined
base address.
2) Find all the files in the directory /sys/class/udc/.
3) Walk through all the directories in /sys/bus/platform/devices/ with
names found in 2) and stop on the device with matching compatible/base
address defined in 1).

In my case the strings could be retrieved like this:
USB_NAME_COMPAT=$(/sys/bus/platform/devices/1f100000.usb/of_node/compatible | tr '\0' '\t' | cut -f1)
USB_DEVICE_ADDR="$(head -c 4 /sys/bus/platform/devices/1f100000.usb/of_node/reg | hexdump -ve '/1 "%02x"' | sed -e 's/^0*//g')"

Regards,
-Sergey

> 
> It seems much more straightforward to do an `ls /sys/class/udc/$GADGET_ADDR.*`
> 
> But again, if folks decide the names can be rearranged to usb.<addr>
> in the future, that would break too.
> 
> thanks
> -john
