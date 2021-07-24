Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 636D33D4624
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Jul 2021 09:50:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234232AbhGXHJo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 24 Jul 2021 03:09:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:40992 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234216AbhGXHJn (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 24 Jul 2021 03:09:43 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6C9D060E96;
        Sat, 24 Jul 2021 07:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1627113014;
        bh=Mv1/eRYBc1I9fHOa8WKJt5bRfdu+6ed/06JZaNQIYQk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vPEwRgGF3bV/0durqSpg8K1A8aNhEFHln8YmJvdQdfNHa9HSG3islM4dJvx1TsltO
         lWvwt0dCrvb71Kep06m5e4ub5MEAOjeh9+BSDiS9aLiHG1ufQxAfNTKB4XpnW+CPG+
         Vd3ErK5k6Ssw3FvZTvdBDWueIP5BWEM0ynH0BLdE=
Date:   Sat, 24 Jul 2021 09:50:10 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
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
Message-ID: <YPvGMtuP/ZpwTKN2@kroah.com>
References: <CALAqxLX_FNvFndEDWtGbFPjSzuAbfqxQE07diBJFZtftwEJX5A@mail.gmail.com>
 <20210714124807.o22mottsrg3tv6nt@mobilestation>
 <YPfPDqJhfzbvDLvB@kroah.com>
 <20210721100220.ddfxwugivsndsedv@mobilestation>
 <YPf29+ewbrYgHxRP@kroah.com>
 <YPh/AS5svBk+gddY@yoga>
 <YPp7Q4IofUYQlrqd@kroah.com>
 <YPrTbC7fNOY3qCcJ@yoga>
 <YPrmTYQJ33AIxcwP@kroah.com>
 <YPsejtV31WrYJX7e@yoga>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YPsejtV31WrYJX7e@yoga>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jul 23, 2021 at 02:54:54PM -0500, Bjorn Andersson wrote:
> On Fri 23 Jul 10:54 CDT 2021, Greg Kroah-Hartman wrote:
> 
> > On Fri, Jul 23, 2021 at 09:34:20AM -0500, Bjorn Andersson wrote:
> > > On Fri 23 Jul 03:18 CDT 2021, Greg Kroah-Hartman wrote:
> > > 
> > > > On Wed, Jul 21, 2021 at 03:09:37PM -0500, Bjorn Andersson wrote:
> > > > > Which tree did you revert this in? 5.13.stable?)
> > > > 
> > > > My usb-linus branch which will go to Linus later today.  Then we can
> > > > backport the revert to older kernels as needed.
> > > > 
> > > 
> > > I'm not worried about the backports, I'm worried about conflicts you're
> > > causing because you're taking a non-usb patch through the usb tree.
> > > 
> > > I was about to push a revert (to this and the other Qualcomm platforms),
> > > but as you're taking some set of reverts through the usb tree we're just
> > > in for a bunch of merge conflicts.
> > 
> > It shouldn't be a merge conflict as you can apply the same revert to
> > your tree now and keep on merging.  When you pick up 5.14-rc3 from Linus
> > it should merge "correctly", right?
> > 
> 
> I typically don't merge back the -rcs into my -next branch, is that
> common practice?

I do it when Linus takes patches from my -linus branch in order to
ensure they end up in my -next branch for testing and merge issues.

> But I still don't understand why you insist on driving this through your
> tree. I've asked you several times to show me on the patch so I at least
> can Ack it. I made a mistake, but why do you insist on keeping me - the
> maintainer - out of the loop?

I had already done the revert, I wasn't trying to keep anyone out of the
loop here, sorry if it came across that way.  I just wanted to ensure
this got resolved quickly so I could move on to other issues.

This is now 1f958f3dff42 ("Revert "arm64: dts: qcom: Harmonize DWC USB3
DT nodes name"") in Linus's tree if you wish to cherry-pick it into your
tree to resolve merge issues, sorry for the confusion.

thanks,

greg k-h
