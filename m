Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A15EA3D3683
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jul 2021 10:19:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234263AbhGWHhr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Jul 2021 03:37:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:56714 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234030AbhGWHhp (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Jul 2021 03:37:45 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 928DB60E8E;
        Fri, 23 Jul 2021 08:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1627028298;
        bh=4CRiX38YF4u1jCf0x64vQjLHd/VXeQ1lk6/OfofjY+s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=wAXTZFP+GiFb2vs71y03nVi9jRaIjPimc/BQSrqWc63m9Uc/cJFftmGw9nH/bRrci
         D+TIJMxumtcsSXlSBtZI5LckuWFgCpdbd0oB1VGiOjsx7bBERHHu8kOEb1b0zUvpC/
         7mP5MheA8crYymeACfB+KSVMbgoHL4RMTWXwS+Y4=
Date:   Fri, 23 Jul 2021 10:18:11 +0200
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
Message-ID: <YPp7Q4IofUYQlrqd@kroah.com>
References: <20201020115959.2658-1-Sergey.Semin@baikalelectronics.ru>
 <20201020115959.2658-30-Sergey.Semin@baikalelectronics.ru>
 <CALAqxLX_FNvFndEDWtGbFPjSzuAbfqxQE07diBJFZtftwEJX5A@mail.gmail.com>
 <20210714124807.o22mottsrg3tv6nt@mobilestation>
 <YPfPDqJhfzbvDLvB@kroah.com>
 <20210721100220.ddfxwugivsndsedv@mobilestation>
 <YPf29+ewbrYgHxRP@kroah.com>
 <YPh/AS5svBk+gddY@yoga>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YPh/AS5svBk+gddY@yoga>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jul 21, 2021 at 03:09:37PM -0500, Bjorn Andersson wrote:
> Which tree did you revert this in? 5.13.stable?)

My usb-linus branch which will go to Linus later today.  Then we can
backport the revert to older kernels as needed.

thanks,

greg k-h
