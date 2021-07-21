Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FB6C3D09EA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jul 2021 09:44:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235143AbhGUHAo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Jul 2021 03:00:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:35954 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235277AbhGUG6k (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Jul 2021 02:58:40 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0082560241;
        Wed, 21 Jul 2021 07:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1626853136;
        bh=HkkgJ8gLSwywFlBk8m9wiXDy6SHIAGv0Zq0t423xyug=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XZ55eHKMGYl2QOgFeLKFT4xeChIjf7byrTouzjjxZ5/f8nQiSUn3a7lzVS8zbs2Wz
         AKohceimcYqPyF2FQIcnooQmgbpD/43iL3ASJHwZrd/Nk4Li3p0mNeG5xj66mtsjyI
         sI2dwwNjB1CaWqpQw/0JEUKAFHXP7aH6xEij48iY=
Date:   Wed, 21 Jul 2021 09:38:54 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     John Stultz <john.stultz@linaro.org>,
        Serge Semin <fancer.lancer@gmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
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
Message-ID: <YPfPDqJhfzbvDLvB@kroah.com>
References: <20201020115959.2658-1-Sergey.Semin@baikalelectronics.ru>
 <20201020115959.2658-30-Sergey.Semin@baikalelectronics.ru>
 <CALAqxLX_FNvFndEDWtGbFPjSzuAbfqxQE07diBJFZtftwEJX5A@mail.gmail.com>
 <20210714124807.o22mottsrg3tv6nt@mobilestation>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210714124807.o22mottsrg3tv6nt@mobilestation>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jul 14, 2021 at 03:48:07PM +0300, Serge Semin wrote:
> Hello John,
> 
> On Tue, Jul 13, 2021 at 05:07:00PM -0700, John Stultz wrote:
> > On Tue, Oct 20, 2020 at 5:10 AM Serge Semin
> > <Sergey.Semin@baikalelectronics.ru> wrote:
> > >
> > > In accordance with the DWC USB3 bindings the corresponding node
> > > name is suppose to comply with the Generic USB HCD DT schema, which
> > > requires the USB nodes to have the name acceptable by the regexp:
> > > "^usb(@.*)?" . Make sure the "snps,dwc3"-compatible nodes are correctly
> > > named.
> > >
> > > Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > 
> 
> > I know folks like to ignore this, but this patch breaks AOSP on db845c. :(
> 
> Sorry to hear that. Alas there is no much can be done about it.

Yes there is, we can revert the change.  We do not break existing
configurations, sorry.

thanks,

greg k-h
