Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 757D0345CD8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Mar 2021 12:30:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230502AbhCWL3p (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Mar 2021 07:29:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:50402 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230449AbhCWL3U (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Mar 2021 07:29:20 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E9CA261993;
        Tue, 23 Mar 2021 11:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1616498959;
        bh=JixGCqDQYwxzR2j2XzyMGinrYJ8Hxf5aDtbGYttIDO8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fYiV8uKJZyr2mbagpDUn7pqR9onPm4gCK78zM/TquX4ZTi7FqwPzA+5+YWGH2bkon
         z6BCaUl+alS9j3TtAAe2yEN38jIS149H+WEtR2E1cGMRS9677V/XOkkouGM0J3so8c
         MVU+ypdlqmKQiflZ+U8gDjWje1CAUT4roWXkD+bM=
Date:   Tue, 23 Mar 2021 12:29:17 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Serge Semin <fancer.lancer@gmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        Felipe Balbi <felipe.balbi@linux.intel.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/3] usb: dwc3: qcom: Add missing DWC3 OF node
 refcount decrement
Message-ID: <YFnRDaSTKCw4aDuQ@kroah.com>
References: <20210212205521.14280-1-Sergey.Semin@baikalelectronics.ru>
 <20210218152904.75bg2v6uh5ool5h3@mobilestation>
 <YC6IjYlDXWJMyZIP@kroah.com>
 <20210218154051.hqhytxv6poizvfgm@mobilestation>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210218154051.hqhytxv6poizvfgm@mobilestation>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Feb 18, 2021 at 06:40:51PM +0300, Serge Semin wrote:
> On Thu, Feb 18, 2021 at 04:32:29PM +0100, Greg Kroah-Hartman wrote:
> > On Thu, Feb 18, 2021 at 06:29:04PM +0300, Serge Semin wrote:
> > > Bjorn, Greg, Felippe, Andy,
> > > Any comments on this series? Bjorn, Greg you asked me to resend the
> > > patches related with the DW USB3 node name change. I did as you said,
> > > but no news since then. I'd be glad to have this patch accepted in
> > > some -next repo and forget about it.
> > 
> 
> > Sorry, but it's the merge window right now and I can't add anything new
> > until 5.12-rc1 is out.  So can you wait until then?
> 
> Well, I don't think there is another choice but to wait now.)
> Hopefully the patchset won't be forgotten when the merge window closes
> as that happened with the original series...

Can you resend this if still needed?  I don't see them in my queue...

thanks,

greg k-h
