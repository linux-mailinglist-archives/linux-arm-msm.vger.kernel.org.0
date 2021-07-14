Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E53B3C84D4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jul 2021 14:55:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231391AbhGNM6B (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Jul 2021 08:58:01 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:47070 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231384AbhGNM6B (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Jul 2021 08:58:01 -0400
X-Greylist: delayed 416 seconds by postgrey-1.27 at vger.kernel.org; Wed, 14 Jul 2021 08:58:00 EDT
Date:   Wed, 14 Jul 2021 15:48:07 +0300
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     John Stultz <john.stultz@linaro.org>
CC:     Serge Semin <fancer.lancer@gmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
Message-ID: <20210714124807.o22mottsrg3tv6nt@mobilestation>
References: <20201020115959.2658-1-Sergey.Semin@baikalelectronics.ru>
 <20201020115959.2658-30-Sergey.Semin@baikalelectronics.ru>
 <CALAqxLX_FNvFndEDWtGbFPjSzuAbfqxQE07diBJFZtftwEJX5A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CALAqxLX_FNvFndEDWtGbFPjSzuAbfqxQE07diBJFZtftwEJX5A@mail.gmail.com>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello John,

On Tue, Jul 13, 2021 at 05:07:00PM -0700, John Stultz wrote:
> On Tue, Oct 20, 2020 at 5:10 AM Serge Semin
> <Sergey.Semin@baikalelectronics.ru> wrote:
> >
> > In accordance with the DWC USB3 bindings the corresponding node
> > name is suppose to comply with the Generic USB HCD DT schema, which
> > requires the USB nodes to have the name acceptable by the regexp:
> > "^usb(@.*)?" . Make sure the "snps,dwc3"-compatible nodes are correctly
> > named.
> >
> > Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> 

> I know folks like to ignore this, but this patch breaks AOSP on db845c. :(

Sorry to hear that. Alas there is no much can be done about it.
DT-nodes name is a subject of DT-schema convention and as we've finally
unified USB-controller nodes it shouldn't be reverted back. You can
find the final USB-controller bindings in:
Documentation/devicetree/bindings/usb/usb.yaml
It strictly defines to have USB-nodes with names like "usb(@.*)".
Reverting this patch will cause the DT-bindings check procedure
failure. You can also find the naming convention defined in the
latest DT spec:
https://github.com/devicetree-org/devicetree-specification/releases/tag/v0.3

See also device-tree bindings requirements listed in the file:
Documentation/devicetree/bindings/writing-bindings.rst
It says: "DO use node names matching the class of the device. Many
standard names are defined in the DT Spec. If there isn't one,
consider adding it."

> 
> In the exact same way an earlier patch broke HiKey960:
>   https://lore.kernel.org/lkml/CALAqxLWGujgR7p8Vb5S_RimRVYxwm5XF-c4NkKgMH-43wEBaWg@mail.gmail.com/
> 
> (which I still have to carry a revert for).
> 
> I get that this change is useful so more dynamic userland can find
> devices using consistent naming with future kernels (but doesn't the
> dynamic userland have to handle the case for older kernels as well?)
> But for userland that uses static configs, its painful as updating
> userland to use the new node ids then causes older kernels to fail.
> 
> I'm looking into how we might be able to probe and set the property
> dynamically, but AOSP's init system is far more aligned to static
> configs.
> 

As Krzysztof said in
https://lore.kernel.org/lkml/20201221210423.GA2504@kozik-lap/
and Bjorn noted in his response to your email, the only way to solve
the problem is to fix the user-land app so one would be able to deal
with both old and new DT-nodes name. Alternatively you can just
replace the dts with older one, where the name still have
the "dwc3"-prefix.

-Sergey

> This will probably be ignored again, but it would be nice if we could
> have a release where DTS changes don't break userland for one of my
> boards. As it feels like its been awhile.
> 
> thanks
> -john
