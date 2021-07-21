Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D36283D1798
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jul 2021 22:10:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240373AbhGUT3G (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Jul 2021 15:29:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240372AbhGUT3E (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Jul 2021 15:29:04 -0400
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 837DAC0613C1
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jul 2021 13:09:40 -0700 (PDT)
Received: by mail-ot1-x32c.google.com with SMTP id b24-20020a9d60d80000b02904d14e47202cso3213314otk.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jul 2021 13:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ryhmjqV2eKLpoirk/rnB/jmjc8Sw5eUN/kn6KkHMSG8=;
        b=f0V8sZc4aqzvTzm9SSyhFzpvTL6ZdbVxPHsnzMtxQXlcraRxoiKzAZYUxg1zQwSw0L
         0t4aBZCwG3QntHJ9LRlAimJWvfxMAU79KZMV6rNopHZb+wI3BjQxhxb6zZ9MbyMmLz/K
         5puTHinQ8S3T01ksLF63skMaFBcnizWmH9zM0DUWtkZ/I5qRcjVXZQfuFGP1nr9I4kCk
         h9l9QMx8FExuaYAHmgnlfrOxarqJ1RNdIjLP01lXcV3Qherns4JHvRqCam3cwqEk5JSf
         wLuGPWm+XbxRoEEVkPbJb5r0jR6y8KTtPriJAR6NomLoou0BKAiRUdAqCS40y9o7qSwi
         L2Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ryhmjqV2eKLpoirk/rnB/jmjc8Sw5eUN/kn6KkHMSG8=;
        b=K9vRPYMbxBGJR2zkqpb6UYZ3vmgD5h28zd5TrhK1SN03x5Tlzq34Fqf1IO1ZWFxcEt
         O6N1RmCgYnA78l0ZE0iK2VXsoLWlkvbQ9UWl4RhETsIzHdsR3C81MrjhsDH8GKqLVotl
         fqYXmed7y07PxRr3QBy2EYKhrQ433qQlg0TBeTerMgri0G3F3Fng/g6QCbDxFuToq8tQ
         PtL67SrAnXL3LmKiROl1cZwEKQdUnzzrjWwG1v0mSvi4dvCj1u1gVBeydtbZBm4gRnO5
         /Pav44UIv8gp6nd4bRuV3hVcP0OGy6tIuw18snu/qZXKJwjUQoSFW6H3mWcIJMH3lSzF
         qM2Q==
X-Gm-Message-State: AOAM531xhE9+ZWDoCBDtdwjdLHj1uVwIyvmzMCK/D3qHaIC2PntdCOXk
        oudPy52xSP/5syax99qgddRRog==
X-Google-Smtp-Source: ABdhPJx/FxM5/zumxzNaWfIehVZW2nKUlw7DpxOp2p3sgrCBOL4NDneF4Gn+AdrfqtxLQvtaMfgcJw==
X-Received: by 2002:a9d:5e15:: with SMTP id d21mr28331811oti.280.1626898179791;
        Wed, 21 Jul 2021 13:09:39 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id o26sm4900456otk.77.2021.07.21.13.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jul 2021 13:09:39 -0700 (PDT)
Date:   Wed, 21 Jul 2021 15:09:37 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Serge Semin <fancer.lancer@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        John Stultz <john.stultz@linaro.org>,
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
Message-ID: <YPh/AS5svBk+gddY@yoga>
References: <20201020115959.2658-1-Sergey.Semin@baikalelectronics.ru>
 <20201020115959.2658-30-Sergey.Semin@baikalelectronics.ru>
 <CALAqxLX_FNvFndEDWtGbFPjSzuAbfqxQE07diBJFZtftwEJX5A@mail.gmail.com>
 <20210714124807.o22mottsrg3tv6nt@mobilestation>
 <YPfPDqJhfzbvDLvB@kroah.com>
 <20210721100220.ddfxwugivsndsedv@mobilestation>
 <YPf29+ewbrYgHxRP@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YPf29+ewbrYgHxRP@kroah.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 21 Jul 05:29 CDT 2021, Greg Kroah-Hartman wrote:

> On Wed, Jul 21, 2021 at 01:02:20PM +0300, Serge Semin wrote:
> > Hi Greg,
> > @Krzysztof, @Rob, please join the discussion so to finally get done
> > with the concerned issue.
> > 
> > On Wed, Jul 21, 2021 at 09:38:54AM +0200, Greg Kroah-Hartman wrote:
> > > On Wed, Jul 14, 2021 at 03:48:07PM +0300, Serge Semin wrote:
> > > > Hello John,
> > > > 
> > > > On Tue, Jul 13, 2021 at 05:07:00PM -0700, John Stultz wrote:
> > > > > On Tue, Oct 20, 2020 at 5:10 AM Serge Semin
> > > > > <Sergey.Semin@baikalelectronics.ru> wrote:
> > > > > >
> > > > > > In accordance with the DWC USB3 bindings the corresponding node
> > > > > > name is suppose to comply with the Generic USB HCD DT schema, which
> > > > > > requires the USB nodes to have the name acceptable by the regexp:
> > > > > > "^usb(@.*)?" . Make sure the "snps,dwc3"-compatible nodes are correctly
> > > > > > named.
> > > > > >
> > > > > > Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > > > > 
> > > > 
> > > > > I know folks like to ignore this, but this patch breaks AOSP on db845c. :(
> > > > 
> > > > Sorry to hear that. Alas there is no much can be done about it.
> > > 
> > > Yes there is, we can revert the change.  We do not break existing
> > > configurations, sorry.
> > 
> > By reverting this patch we'll get back to the broken dt-bindings
> > since it won't comply to the current USB DT-nodes requirements
> > which at this state well describe the latest DT spec:
> > https://github.com/devicetree-org/devicetree-specification/releases/tag/v0.3
> > Thus the dtbs_check will fail for these nodes.
> > 
> > Originally this whole patchset was connected with finally getting the
> > DT-node names in order to comply with the standard requirement and it
> > was successful mostly except a few patches which still haven't been
> > merged in.
> > 
> > Anyway @Krzysztof has already responded to the complain regarding this
> > issue here:
> > https://lore.kernel.org/lkml/20201221210423.GA2504@kozik-lap/
> > but noone cared to respond on his reasonable questions in order to
> > get to a suitable solution for everyone. Instead we are
> > getting another email with the same request to revert the changes.
> > Here is the quote from the Krzysztof email so we could continue the
> > discussion:
> > 
> > On Mon, 21 Dec 2020 13:04:27 -0800 (PST), Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > > On Mon, Dec 21, 2020 at 12:24:11PM -0800, John Stultz wrote:
> > > > On Sat, Dec 19, 2020 at 3:06 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > > > > ...
> > > > >
> > > > > The node names are not part of an ABI, are they? I expect only
> > > > > compatibles and properties to be stable. If user-space looks for
> > > > > something by name, it's a user-space's mistake.  Not mentioning that you
> > > > > also look for specific address... Imagine remapping of addresses with
> > > > > ranges (for whatever reason) - AOSP also would be broken? Addresses are
> > > > > definitely not an ABI.
> > > > 
> > > > Though that is how it's exported through sysfs.
> > > 
> > > The ABI is the format of sysfs file for example in /sys/devices. However
> > > the ABI is not the exact address or node name of each device.
> > > 
> > > > In AOSP it is then used to setup the configfs gadget by writing that
> > > > value into /config/usb_gadget/g1/UDC.
> > > > 
> > > > Given there may be multiple controllers on a device, or even if its
> > > > just one and the dummy hcd driver is enabled, I'm not sure how folks
> > > > reference the "right" one without the node name?
> > > 
> > > I think it is the same type of problem as for all other subsystems, e.g.
> > > mmc, hwmon/iio.  They usually solve it either with aliases or with
> > > special property with the name/label.
> > > 
> > > > I understand the fuzziness with sysfs ABI, and I get that having
> > > > consistent naming is important, but like the eth0 -> enp3s0 changes,
> > > > it seems like this is going to break things.
> > > 
> > > One could argue whether interface name is or is not ABI. But please tell
> > > me how the address of a device in one's representation (for example DT)
> > > is a part of a stable interface?
> > > 
> > > > Greg? Is there some better way AOSP should be doing this?
> > > 
> > > If you need to find specific device, maybe go through the given bus and
> > > check compatibles?
> > > 
> > > Best regards,
> > > Krzysztof
> > 
> > So the main question is how is the DT-node really connected with ABI
> > and is supposed to be stable in that concern?
> > 
> > As I see it even if it affects the configfs node name, then we may
> > either need to break that connection and somehow deliver DT-node-name
> > independent interface to the user-space or we have no choice but to
> > export the node with an updated name and ask of user-space to deal
> > with it. In both suggested cases the DT-node name will still conform
> > to the USB-node name DT spec. Currently we are at the second one.
> 
> I really do not care what you all decide on, but you CAN NOT break
> existing working systems, sorry.  That is why I have reverted this
> change in my tree and will send it to Linus soon.
> 

Which tree did you revert this in? 5.13.stable?)

I'm onboard with us reverting this, but for any 5.14-rc and 5.15 this
will conflict badly with the qcom tree, so I much rather take the revert
in my tree - than have Linus run into this mess down the road.

For stable, I don't mind if you merge something...Perhaps you can point
me to your revert and I can pick it up in my tree?

Regards,
Bjorn
