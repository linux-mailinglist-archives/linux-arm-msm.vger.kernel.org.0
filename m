Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F5DD3D0D2A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jul 2021 13:11:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234363AbhGUKaU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Jul 2021 06:30:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237922AbhGUJVw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Jul 2021 05:21:52 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD78BC061574;
        Wed, 21 Jul 2021 03:02:25 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id s13so2280499lfi.12;
        Wed, 21 Jul 2021 03:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=uq/BDgHzeQirTDEogKe70scOce4C0cOi5x0MYXrCpbY=;
        b=Ke7nwN3tAtft8VpPMijva70KCg4QgprDjHpK3KURV7Tsib3GmYBjUI6FQAjUWgrhMn
         C6XaCl0VVvViBXLVZWPfh/7TkdpPei4bF8Z59SpvnyKrTHfXqYVpllMPX8Dz+5v6heAD
         4oZPzUCmj3xOtoqpCXCgQ0i+H3/HXujIfqghC+aFA3LmMJ/a7rrDfgtR3hCmQKY/LZMD
         K6Xz1WXQBmNs56GlU+capX+PxgH4zuOFDgJe2Q7MmqrXVDWLOpFELkwbYKQox1fwvZge
         7YZYtsE/6PX/r9CajyrWlSWs7Ts1nlgIBX5zwPKOsnf5lVUwEIPkAfE+VFKGj1FVKMpQ
         GRJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=uq/BDgHzeQirTDEogKe70scOce4C0cOi5x0MYXrCpbY=;
        b=HQbjeQVUxHFgz4wy6POcEyzgWZ3yG1CQFVfTjFjc7bw1GSrQRUHG4ROOa6nnzpLIwt
         tX5jiYOCycbCRlVopMCe6crQAzslGwpMOrQpXSGjEL3e5THEDGyDDsQ47Ppav8ucubK8
         g3oMKxQDgmiVls1o7Go3w4lysb6XZ4kK7HDNsQnN8jUfMvApjoFeKD70pBgzLPQTIqD+
         JXMojHJRWxz/c6rdknYJ4il5HpAXg2kciuVulXHgLC5aY3KjT+VrWZ9Ivz25NAVlX8vh
         5fL9xuu7+/ZChKWvsWsYbqRUnNs4F35zHPe4B/IjadMCrOmkU50HKu3/lnDljSX7HFst
         O2ow==
X-Gm-Message-State: AOAM531KDv0QFzkP4yNxa42lEqfpnA1a4I+U3iRbO54m+VKtH9NYxjcU
        ItS2ESGw8xGiakVwums4o00=
X-Google-Smtp-Source: ABdhPJwJ9oOZ8/cOl8mTGgS93guEhW0BZrD42ndG6/7urMIsSHF10NN5cZsYqdECl0IP7vfCOlqiDw==
X-Received: by 2002:ac2:4107:: with SMTP id b7mr24842540lfi.609.1626861744103;
        Wed, 21 Jul 2021 03:02:24 -0700 (PDT)
Received: from mobilestation ([95.79.127.110])
        by smtp.gmail.com with ESMTPSA id t7sm2138866ljc.81.2021.07.21.03.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jul 2021 03:02:22 -0700 (PDT)
Date:   Wed, 21 Jul 2021 13:02:20 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        John Stultz <john.stultz@linaro.org>,
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
Message-ID: <20210721100220.ddfxwugivsndsedv@mobilestation>
References: <20201020115959.2658-1-Sergey.Semin@baikalelectronics.ru>
 <20201020115959.2658-30-Sergey.Semin@baikalelectronics.ru>
 <CALAqxLX_FNvFndEDWtGbFPjSzuAbfqxQE07diBJFZtftwEJX5A@mail.gmail.com>
 <20210714124807.o22mottsrg3tv6nt@mobilestation>
 <YPfPDqJhfzbvDLvB@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YPfPDqJhfzbvDLvB@kroah.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Greg,
@Krzysztof, @Rob, please join the discussion so to finally get done
with the concerned issue.

On Wed, Jul 21, 2021 at 09:38:54AM +0200, Greg Kroah-Hartman wrote:
> On Wed, Jul 14, 2021 at 03:48:07PM +0300, Serge Semin wrote:
> > Hello John,
> > 
> > On Tue, Jul 13, 2021 at 05:07:00PM -0700, John Stultz wrote:
> > > On Tue, Oct 20, 2020 at 5:10 AM Serge Semin
> > > <Sergey.Semin@baikalelectronics.ru> wrote:
> > > >
> > > > In accordance with the DWC USB3 bindings the corresponding node
> > > > name is suppose to comply with the Generic USB HCD DT schema, which
> > > > requires the USB nodes to have the name acceptable by the regexp:
> > > > "^usb(@.*)?" . Make sure the "snps,dwc3"-compatible nodes are correctly
> > > > named.
> > > >
> > > > Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > > 
> > 
> > > I know folks like to ignore this, but this patch breaks AOSP on db845c. :(
> > 
> > Sorry to hear that. Alas there is no much can be done about it.
> 
> Yes there is, we can revert the change.  We do not break existing
> configurations, sorry.

By reverting this patch we'll get back to the broken dt-bindings
since it won't comply to the current USB DT-nodes requirements
which at this state well describe the latest DT spec:
https://github.com/devicetree-org/devicetree-specification/releases/tag/v0.3
Thus the dtbs_check will fail for these nodes.

Originally this whole patchset was connected with finally getting the
DT-node names in order to comply with the standard requirement and it
was successful mostly except a few patches which still haven't been
merged in.

Anyway @Krzysztof has already responded to the complain regarding this
issue here:
https://lore.kernel.org/lkml/20201221210423.GA2504@kozik-lap/
but noone cared to respond on his reasonable questions in order to
get to a suitable solution for everyone. Instead we are
getting another email with the same request to revert the changes.
Here is the quote from the Krzysztof email so we could continue the
discussion:

On Mon, 21 Dec 2020 13:04:27 -0800 (PST), Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On Mon, Dec 21, 2020 at 12:24:11PM -0800, John Stultz wrote:
> > On Sat, Dec 19, 2020 at 3:06 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > > ...
> > >
> > > The node names are not part of an ABI, are they? I expect only
> > > compatibles and properties to be stable. If user-space looks for
> > > something by name, it's a user-space's mistake.  Not mentioning that you
> > > also look for specific address... Imagine remapping of addresses with
> > > ranges (for whatever reason) - AOSP also would be broken? Addresses are
> > > definitely not an ABI.
> > 
> > Though that is how it's exported through sysfs.
> 
> The ABI is the format of sysfs file for example in /sys/devices. However
> the ABI is not the exact address or node name of each device.
> 
> > In AOSP it is then used to setup the configfs gadget by writing that
> > value into /config/usb_gadget/g1/UDC.
> > 
> > Given there may be multiple controllers on a device, or even if its
> > just one and the dummy hcd driver is enabled, I'm not sure how folks
> > reference the "right" one without the node name?
> 
> I think it is the same type of problem as for all other subsystems, e.g.
> mmc, hwmon/iio.  They usually solve it either with aliases or with
> special property with the name/label.
> 
> > I understand the fuzziness with sysfs ABI, and I get that having
> > consistent naming is important, but like the eth0 -> enp3s0 changes,
> > it seems like this is going to break things.
> 
> One could argue whether interface name is or is not ABI. But please tell
> me how the address of a device in one's representation (for example DT)
> is a part of a stable interface?
> 
> > Greg? Is there some better way AOSP should be doing this?
> 
> If you need to find specific device, maybe go through the given bus and
> check compatibles?
> 
> Best regards,
> Krzysztof

So the main question is how is the DT-node really connected with ABI
and is supposed to be stable in that concern?

As I see it even if it affects the configfs node name, then we may
either need to break that connection and somehow deliver DT-node-name
independent interface to the user-space or we have no choice but to
export the node with an updated name and ask of user-space to deal
with it. In both suggested cases the DT-node name will still conform
to the USB-node name DT spec. Currently we are at the second one.

Regards,
-Sergey

> 
> thanks,
> 
> greg k-h
