Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87C3634782D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Mar 2021 13:19:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229666AbhCXMTY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Mar 2021 08:19:24 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:36462 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232109AbhCXMTO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Mar 2021 08:19:14 -0400
Date:   Wed, 24 Mar 2021 15:18:58 +0300
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Serge Semin <fancer.lancer@gmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        <devicetree@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        Felipe Balbi <felipe.balbi@linux.intel.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 1/3] usb: dwc3: qcom: Add missing DWC3 OF node
 refcount decrement
Message-ID: <20210324121858.b2hwbm6vmklbbt7c@mobilestation>
References: <20210212205521.14280-1-Sergey.Semin@baikalelectronics.ru>
 <20210218152904.75bg2v6uh5ool5h3@mobilestation>
 <YC6IjYlDXWJMyZIP@kroah.com>
 <20210218154051.hqhytxv6poizvfgm@mobilestation>
 <YFnRDaSTKCw4aDuQ@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <YFnRDaSTKCw4aDuQ@kroah.com>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Greg,

On Tue, Mar 23, 2021 at 12:29:17PM +0100, Greg Kroah-Hartman wrote:
> On Thu, Feb 18, 2021 at 06:40:51PM +0300, Serge Semin wrote:
> > On Thu, Feb 18, 2021 at 04:32:29PM +0100, Greg Kroah-Hartman wrote:
> > > On Thu, Feb 18, 2021 at 06:29:04PM +0300, Serge Semin wrote:
> > > > Bjorn, Greg, Felippe, Andy,
> > > > Any comments on this series? Bjorn, Greg you asked me to resend the
> > > > patches related with the DW USB3 node name change. I did as you said,
> > > > but no news since then. I'd be glad to have this patch accepted in
> > > > some -next repo and forget about it.
> > > 
> > 
> > > Sorry, but it's the merge window right now and I can't add anything new
> > > until 5.12-rc1 is out.  So can you wait until then?
> > 
> > Well, I don't think there is another choice but to wait now.)
> > Hopefully the patchset won't be forgotten when the merge window closes
> > as that happened with the original series...
> 

> Can you resend this if still needed?  I don't see them in my queue...

I see the very first patch of this series has already been merged in 
somewhere between v5.12-rc3 and v5.12-rc2. See commit 1cffb1c66499 ("usb: 
dwc3: qcom: Add missing DWC3 OF node refcount decrement"). But the rest of
the patches still hanging up unattended. I'll resend them in a few minutes.
Could you merge them in too?

-Sergey

> 
> thanks,
> 
> greg k-h
