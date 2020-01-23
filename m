Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 41DBE147088
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2020 19:14:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728665AbgAWSOF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Jan 2020 13:14:05 -0500
Received: from mail.kernel.org ([198.145.29.99]:32776 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727278AbgAWSOF (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Jan 2020 13:14:05 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 193C32077C;
        Thu, 23 Jan 2020 18:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579803244;
        bh=khqNxXYOqxvr10GxSY4pK/rC4A5nXWgtbLtZjysW0tM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=m6asSqk7k53NoVQqWZp5O/KT6yAK5dk9u05Hvx1NArYa4VN2Z0doJqdrcwhL1Z/4Q
         jiNGysgPQaUqeME0aWbfKEsBmsVQPpFzRFpZo+v9QP5m2NMrYl9w4V2uGXE81Xw42q
         BOh2rwfoJKb26w5YmE4sZdY5MEaK63DADyxq11Lk=
Date:   Thu, 23 Jan 2020 19:14:02 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Jeffrey Hugo <jhugo@codeaurora.org>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        arnd@arndb.de, smohanad@codeaurora.org, kvalo@codeaurora.org,
        bjorn.andersson@linaro.org, hemantk@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 02/16] bus: mhi: core: Add support for registering MHI
 controllers
Message-ID: <20200123181402.GA1897633@kroah.com>
References: <20200123111836.7414-1-manivannan.sadhasivam@linaro.org>
 <20200123111836.7414-3-manivannan.sadhasivam@linaro.org>
 <c8fdf0b0-eaec-9672-4f43-f0254d6dbf0e@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c8fdf0b0-eaec-9672-4f43-f0254d6dbf0e@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jan 23, 2020 at 10:05:50AM -0700, Jeffrey Hugo wrote:
> On 1/23/2020 4:18 AM, Manivannan Sadhasivam wrote:
> > This commit adds support for registering MHI controller drivers with
> > the MHI stack. MHI controller drivers manages the interaction with the
> > MHI client devices such as the external modems and WiFi chipsets. They
> > are also the MHI bus master in charge of managing the physical link
> > between the host and client device.
> > 
> > This is based on the patch submitted by Sujeev Dias:
> > https://lkml.org/lkml/2018/7/9/987
> > 
> > Signed-off-by: Sujeev Dias <sdias@codeaurora.org>
> > Signed-off-by: Siddartha Mohanadoss <smohanad@codeaurora.org>
> > [jhugo: added static config for controllers and fixed several bugs]
> > Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
> > [mani: removed DT dependency, splitted and cleaned up for upstream]
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >   drivers/bus/Kconfig             |   1 +
> >   drivers/bus/Makefile            |   3 +
> >   drivers/bus/mhi/Kconfig         |  14 +
> >   drivers/bus/mhi/Makefile        |   2 +
> >   drivers/bus/mhi/core/Makefile   |   3 +
> >   drivers/bus/mhi/core/init.c     | 404 +++++++++++++++++++++++++++++
> >   drivers/bus/mhi/core/internal.h | 169 ++++++++++++
> >   include/linux/mhi.h             | 438 ++++++++++++++++++++++++++++++++
> >   include/linux/mod_devicetable.h |  12 +
> >   9 files changed, 1046 insertions(+)
> >   create mode 100644 drivers/bus/mhi/Kconfig
> >   create mode 100644 drivers/bus/mhi/Makefile
> >   create mode 100644 drivers/bus/mhi/core/Makefile
> >   create mode 100644 drivers/bus/mhi/core/init.c
> >   create mode 100644 drivers/bus/mhi/core/internal.h
> >   create mode 100644 include/linux/mhi.h
> > 
> > diff --git a/drivers/bus/Kconfig b/drivers/bus/Kconfig
> > index 50200d1c06ea..383934e54786 100644
> > --- a/drivers/bus/Kconfig
> > +++ b/drivers/bus/Kconfig
> > @@ -202,5 +202,6 @@ config DA8XX_MSTPRI
> >   	  peripherals.
> >   source "drivers/bus/fsl-mc/Kconfig"
> > +source "drivers/bus/mhi/Kconfig"
> >   endmenu
> > diff --git a/drivers/bus/Makefile b/drivers/bus/Makefile
> > index 1320bcf9fa9d..05f32cd694a4 100644
> > --- a/drivers/bus/Makefile
> > +++ b/drivers/bus/Makefile
> > @@ -34,3 +34,6 @@ obj-$(CONFIG_UNIPHIER_SYSTEM_BUS)	+= uniphier-system-bus.o
> >   obj-$(CONFIG_VEXPRESS_CONFIG)	+= vexpress-config.o
> >   obj-$(CONFIG_DA8XX_MSTPRI)	+= da8xx-mstpri.o
> > +
> > +# MHI
> > +obj-$(CONFIG_MHI_BUS)		+= mhi/
> > diff --git a/drivers/bus/mhi/Kconfig b/drivers/bus/mhi/Kconfig
> > new file mode 100644
> > index 000000000000..a8bd9bd7db7c
> > --- /dev/null
> > +++ b/drivers/bus/mhi/Kconfig
> > @@ -0,0 +1,14 @@
> > +# SPDX-License-Identifier: GPL-2.0
> 
> first time I noticed this, although I suspect this will need to be corrected
> "everywhere" -
> Per the SPDX website, the "GPL-2.0" label is deprecated.  It's replacement
> is "GPL-2.0-only".
> I think all instances should be updated to "GPL-2.0-only"

No, it is fine, please read Documentation/process/license-rules.rst

thanks,

greg k-h
