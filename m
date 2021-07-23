Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96D583D3CF3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jul 2021 17:55:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235781AbhGWPOd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Jul 2021 11:14:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:51646 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235702AbhGWPOX (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Jul 2021 11:14:23 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 592D260725;
        Fri, 23 Jul 2021 15:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1627055696;
        bh=gGq+nFNtYhXh8+LTHNU1d09X9anaFb/jJcdQ6OGEm6w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=w7TXf5P/3VOLNqa3IGJS+/tL1WqsO3lubM2fNseWUGtviwChA0JbxioddqK5Xebzu
         VBKcT7W2dFhFjKmcOBccaxPRa5CzvwMBY/+1zUDb1IQTjrxjksklcYYYeIcEmsMOL3
         /z4TEJgfF9/B/bm0KWjIW9F/WJgTnJpsvFiJnY0U=
Date:   Fri, 23 Jul 2021 17:54:53 +0200
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
Message-ID: <YPrmTYQJ33AIxcwP@kroah.com>
References: <20201020115959.2658-1-Sergey.Semin@baikalelectronics.ru>
 <20201020115959.2658-30-Sergey.Semin@baikalelectronics.ru>
 <CALAqxLX_FNvFndEDWtGbFPjSzuAbfqxQE07diBJFZtftwEJX5A@mail.gmail.com>
 <20210714124807.o22mottsrg3tv6nt@mobilestation>
 <YPfPDqJhfzbvDLvB@kroah.com>
 <20210721100220.ddfxwugivsndsedv@mobilestation>
 <YPf29+ewbrYgHxRP@kroah.com>
 <YPh/AS5svBk+gddY@yoga>
 <YPp7Q4IofUYQlrqd@kroah.com>
 <YPrTbC7fNOY3qCcJ@yoga>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YPrTbC7fNOY3qCcJ@yoga>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jul 23, 2021 at 09:34:20AM -0500, Bjorn Andersson wrote:
> On Fri 23 Jul 03:18 CDT 2021, Greg Kroah-Hartman wrote:
> 
> > On Wed, Jul 21, 2021 at 03:09:37PM -0500, Bjorn Andersson wrote:
> > > Which tree did you revert this in? 5.13.stable?)
> > 
> > My usb-linus branch which will go to Linus later today.  Then we can
> > backport the revert to older kernels as needed.
> > 
> 
> I'm not worried about the backports, I'm worried about conflicts you're
> causing because you're taking a non-usb patch through the usb tree.
> 
> I was about to push a revert (to this and the other Qualcomm platforms),
> but as you're taking some set of reverts through the usb tree we're just
> in for a bunch of merge conflicts.

It shouldn't be a merge conflict as you can apply the same revert to
your tree now and keep on merging.  When you pick up 5.14-rc3 from Linus
it should merge "correctly", right?

thanks,

greg k-h
