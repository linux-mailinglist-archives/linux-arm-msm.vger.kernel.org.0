Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA84531ED97
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Feb 2021 18:48:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234644AbhBRRrY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Feb 2021 12:47:24 -0500
Received: from mail.baikalelectronics.com ([87.245.175.226]:52512 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232568AbhBRPlk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Feb 2021 10:41:40 -0500
Date:   Thu, 18 Feb 2021 18:40:51 +0300
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
Message-ID: <20210218154051.hqhytxv6poizvfgm@mobilestation>
References: <20210212205521.14280-1-Sergey.Semin@baikalelectronics.ru>
 <20210218152904.75bg2v6uh5ool5h3@mobilestation>
 <YC6IjYlDXWJMyZIP@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <YC6IjYlDXWJMyZIP@kroah.com>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Feb 18, 2021 at 04:32:29PM +0100, Greg Kroah-Hartman wrote:
> On Thu, Feb 18, 2021 at 06:29:04PM +0300, Serge Semin wrote:
> > Bjorn, Greg, Felippe, Andy,
> > Any comments on this series? Bjorn, Greg you asked me to resend the
> > patches related with the DW USB3 node name change. I did as you said,
> > but no news since then. I'd be glad to have this patch accepted in
> > some -next repo and forget about it.
> 

> Sorry, but it's the merge window right now and I can't add anything new
> until 5.12-rc1 is out.  So can you wait until then?

Well, I don't think there is another choice but to wait now.)
Hopefully the patchset won't be forgotten when the merge window closes
as that happened with the original series...

-Sergey

> 
> thanks,
> 
> greg k-h
