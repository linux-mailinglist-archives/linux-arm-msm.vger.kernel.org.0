Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB1411DA011
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2020 20:57:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726632AbgESS56 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 May 2020 14:57:58 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:35588 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726567AbgESS56 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 May 2020 14:57:58 -0400
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 19 May 2020 11:57:57 -0700
Received: from gurus-linux.qualcomm.com ([10.46.162.81])
  by ironmsg02-sd.qualcomm.com with ESMTP; 19 May 2020 11:57:57 -0700
Received: by gurus-linux.qualcomm.com (Postfix, from userid 383780)
        id A91324CCD; Tue, 19 May 2020 11:57:57 -0700 (PDT)
Date:   Tue, 19 May 2020 11:57:57 -0700
From:   Guru Das Srinagesh <gurus@codeaurora.org>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     devicetree@vger.kernel.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Subbaraman Narayanamurthy <subbaram@codeaurora.org>,
        David Collins <collinsd@codeaurora.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] mfd: Introduce QTI I2C PMIC controller
Message-ID: <20200519185757.GA13992@codeaurora.org>
Mail-Followup-To: Lee Jones <lee.jones@linaro.org>,
        devicetree@vger.kernel.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Subbaraman Narayanamurthy <subbaram@codeaurora.org>,
        David Collins <collinsd@codeaurora.org>,
        linux-kernel@vger.kernel.org
References: <cover.1588115326.git.gurus@codeaurora.org>
 <5644dea146f8b49a5b827c56392ff916bfb343e9.1588115326.git.gurus@codeaurora.org>
 <20200429075010.GX3559@dell>
 <20200501011319.GA28441@codeaurora.org>
 <20200515104520.GK271301@dell>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200515104520.GK271301@dell>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, May 15, 2020 at 11:45:20AM +0100, Lee Jones wrote:
> On Thu, 30 Apr 2020, Guru Das Srinagesh wrote:
> 
> > On Wed, Apr 29, 2020 at 08:50:10AM +0100, Lee Jones wrote:
> > > On Tue, 28 Apr 2020, Guru Das Srinagesh wrote:
> > > 
> > > > The Qualcomm Technologies, Inc. I2C PMIC Controller is used by
> > > > multi-function PMIC devices which communicate over the I2C bus.  The
> > > > controller enumerates all child nodes as platform devices, and
> > > > instantiates a regmap interface for them to communicate over the I2C
> > > > bus.
> > > > 
> > > > The controller also controls interrupts for all of the children platform
> > > > devices.  The controller handles the summary interrupt by deciphering
> > > > which peripheral triggered the interrupt, and which of the peripheral
> > > > interrupts were triggered.  Finally, it calls the interrupt handlers for
> > > > each of the virtual interrupts that were registered.
> > > > 
> > > > Nicholas Troast is the original author of this driver.
> > > > 
> > > > Signed-off-by: Guru Das Srinagesh <gurus@codeaurora.org>
> > > > ---
> > > >  drivers/mfd/Kconfig         |  11 +
> > > >  drivers/mfd/Makefile        |   1 +
> > > >  drivers/mfd/qcom-i2c-pmic.c | 737 ++++++++++++++++++++++++++++++++++++++++++++
> > > 
> > > The vast majority of this driver deals with IRQ handling.  Why can't
> > > this be split out into its own IRQ Chip driver and moved to
> > > drivers/irqchip?
> > 
> > There appear to be quite a few in-tree MFD drivers that register IRQ
> > controllers, like this driver does:
> > 
> > $ grep --exclude-dir=.git -rnE "irq_domain_(add|create).+\(" drivers/mfd | wc -l
> > 23
> > 
> > As a further example, drivers/mfd/stpmic1.c closely resembles this
> > driver in that it uses both devm_regmap_add_irq_chip() as well as
> > devm_of_platform_populate().
> > 
> > As such, it seems like this driver is in line with some of the
> > architectural choices that have been accepted in already-merged drivers.
> > Could you please elaborate on your concerns?
> 
> It is true that *basic* IRQ domain support has been added to these
> drivers in the past.  However, IMHO the support added to this driver
> goes beyond those realms such that it would justify a driver of its
> own.

I am exploring an option to see if the regmap-irq APIs may be used in
this driver, similar to stpmic1.c. Just to let you know, it might be a
few days before I am able to post my next patchset as I'll have to make
the necessary changes and test them out first.

Thank you.

Guru Das.
