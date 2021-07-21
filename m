Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89A803D09EB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jul 2021 09:44:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234346AbhGUHAp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Jul 2021 03:00:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:36074 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234706AbhGUG7C (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Jul 2021 02:59:02 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 02EE961181;
        Wed, 21 Jul 2021 07:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1626853179;
        bh=2+aIADsNMywloffWsQ/EH6AZceZU2TxZe1S4FGZ6kg8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=zEtb9gnJ+bjNEB+fmDcY8H8GFfC9Sh7vBRvRCP+DWQkuykeIQeI8bi8ohRI2ffFb3
         uqt2Fh4ddpXzGoWB0c4mleMIq73g2vszkErNQ+8uvJ3UjLXxLS/rm6YdSEKMXz2ISn
         8tczLJppYpdWXwsRNDQU1PpGzMKZt26hgC3hM7ts=
Date:   Wed, 21 Jul 2021 09:39:37 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     John Stultz <john.stultz@linaro.org>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Felipe Balbi <balbi@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux USB List <linux-usb@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Serge Semin <fancer.lancer@gmail.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Amit Pundir <amit.pundir@linaro.org>
Subject: Re: [PATCH 29/29] arm64: dts: qcom: Harmonize DWC USB3 DT nodes name
Message-ID: <YPfPOWcczdQTmGR0@kroah.com>
References: <20201020115959.2658-1-Sergey.Semin@baikalelectronics.ru>
 <20201020115959.2658-30-Sergey.Semin@baikalelectronics.ru>
 <CALAqxLX_FNvFndEDWtGbFPjSzuAbfqxQE07diBJFZtftwEJX5A@mail.gmail.com>
 <YO5Lm0zMEEP5uSSl@yoga>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YO5Lm0zMEEP5uSSl@yoga>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jul 13, 2021 at 09:27:39PM -0500, Bjorn Andersson wrote:
> On Tue 13 Jul 19:07 CDT 2021, John Stultz wrote:
> 
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
> > I know folks like to ignore this, but this patch breaks AOSP on db845c. :(
> > 
> 
> Sorry, I totally forgot that the name of that node is part of the USB
> gadget configfs interface.

Yes, and as such, it's a user-visible change, so I will go revert this.

thanks,

greg k-h
