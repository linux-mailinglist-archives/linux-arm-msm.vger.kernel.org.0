Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF6B0359108
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Apr 2021 02:48:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233094AbhDIAs3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Apr 2021 20:48:29 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:16947 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232426AbhDIAs2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Apr 2021 20:48:28 -0400
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 08 Apr 2021 17:48:16 -0700
X-QCInternal: smtphost
Received: from gurus-linux.qualcomm.com (HELO gurus-linux.localdomain) ([10.46.162.81])
  by ironmsg02-sd.qualcomm.com with ESMTP; 08 Apr 2021 17:48:15 -0700
Received: by gurus-linux.localdomain (Postfix, from userid 383780)
        id 8FB551A71; Thu,  8 Apr 2021 17:48:15 -0700 (PDT)
Date:   Thu, 8 Apr 2021 17:48:15 -0700
From:   Guru Das Srinagesh <gurus@codeaurora.org>
To:     Mark Brown <broonie@kernel.org>
Cc:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Markus Elfring <Markus.Elfring@web.de>,
        linux-arm-msm@vger.kernel.org,
        Anirudh Ghayal <aghayal@codeaurora.org>,
        Subbaraman Narayanamurthy <subbaram@codeaurora.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        David Collins <collinsd@codeaurora.org>,
        Joe Perches <joe@perches.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v5 0/2] Add support for Qualcomm MFD PMIC register layout
Message-ID: <20210409004815.GA4345@codeaurora.org>
References: <cover.1616613838.git.gurus@codeaurora.org>
 <161726943419.2413.4844313396830856637.b4-ty@kernel.org>
 <20210406011152.GA27770@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210406011152.GA27770@codeaurora.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Apr 05, 2021 at 06:11:52PM -0700, Guru Das Srinagesh wrote:
> On Thu, Apr 01, 2021 at 11:16:17AM +0100, Mark Brown wrote:
> > On Wed, 24 Mar 2021 12:28:52 -0700, Guru Das Srinagesh wrote:
> > > Changes from v4:
> > > - Only one cosmetic change: Moved the declaration of num_virt_regs under
> > >   num_type_reg instead of under num_main_regs in `struct regmap_irq_chip` so as
> > >   to reinforce the idea that it is related to the type setting of IRQs.
> > > - No other changes.
> > > 
> > > Changes from v3:
> > > - Implemented the scheme proposed in my response to Mark in [4].
> > > - Dropped the RFC tag from this patch series as this series has been tested on
> > >   target with a client driver utilizing these changes.
> > > 
> > > [...]
> > 
> > Applied to
> > 
> >    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git for-next
> > 
> > Thanks!
> > 
> > [1/2] regmap-irq: Introduce virtual regs to handle more config regs
> >       commit: 4c5014456305482412b35a081ca0fb4fefd69764
> > [2/2] regmap-irq: Add driver callback to configure virtual regs
> >       commit: 394409aafd017adfcffd075595cb01cc456a9327
> > 
> 
> Thanks for accepting the patches. I'll send out the driver utilizing
> these changes after code cleanup in the next couple of weeks.

Here it is:

https://lore.kernel.org/lkml/cover.1617927259.git.gurus@codeaurora.org/

Guru Das.
