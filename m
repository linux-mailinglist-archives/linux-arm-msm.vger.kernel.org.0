Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4FBC30D868
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Feb 2021 12:20:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234091AbhBCLTW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Feb 2021 06:19:22 -0500
Received: from mail.baikalelectronics.com ([87.245.175.226]:45358 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233865AbhBCLTV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Feb 2021 06:19:21 -0500
Date:   Wed, 3 Feb 2021 14:18:32 +0300
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Serge Semin <fancer.lancer@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Felipe Balbi <balbi@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 09/10] usb: dwc3: qcom: Detect DWC3 DT-nodes with
 "usb"-prefixed names
Message-ID: <20210203111832.a7i56dvd3d6iq5je@mobilestation>
References: <20201205155621.3045-1-Sergey.Semin@baikalelectronics.ru>
 <20201205155621.3045-10-Sergey.Semin@baikalelectronics.ru>
 <YBnZ8O+zI/dzrjDQ@builder.lan>
 <YBpnpj+0KHM1Q8l8@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <YBpnpj+0KHM1Q8l8@kroah.com>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Feb 03, 2021 at 10:06:46AM +0100, Greg Kroah-Hartman wrote:
> On Tue, Feb 02, 2021 at 05:02:08PM -0600, Bjorn Andersson wrote:
> > On Sat 05 Dec 09:56 CST 2020, Serge Semin wrote:
> > 
> > > In accordance with the USB HCD/DRD schema all the USB controllers are
> > > supposed to have DT-nodes named with prefix "^usb(@.*)?".  Since the
> > > existing DT-nodes will be renamed in a subsequent patch let's first make
> > > sure the DWC3 Qualcomm driver supports them and second falls back to the
> > > deprecated naming so not to fail on the legacy DTS-files passed to the
> > > newer kernels.
> > > 
> > 
> > Felipe, will you merge this, so that I can merge the dts patch depending
> > on this into the Qualcomm DT tree?
> 
> Patches this old are long-gone out of our queues.  If it needs to be
> applied to a linux-usb tree, please resend.

Hello Greg,
I'll revise the series and resend the patches, which haven't been
merged in yet, on this week. Sorry for a delay. I should have done
that earlier, but I have been kind of drown with fixes for DW GMAC
(stmmac) driver, so couldn't pay much attention to the rest of the
work.

-Sergey

> 
> thanks,
> 
> greg k-h
