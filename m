Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 187C23502CF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Mar 2021 16:55:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235987AbhCaOyh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 Mar 2021 10:54:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:49140 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236161AbhCaOyQ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 Mar 2021 10:54:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 698AA6008E;
        Wed, 31 Mar 2021 14:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1617202456;
        bh=VKBC0u6SvzEz/hmDHlKXojSCcKDOokoLgPAaDdZq3x0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hxuZkrf+pTdHHfYZbTJuEwDjMSkia2OruNXnM1lE3IkgPouUk35W4bUOsu5tGj3Ql
         UosSR5LnlpCXeJLj8bU5hGuLcpOJSsmV/zXOX8SqcFMQJaZMSFBuC60BBGODYCaljW
         9YcIS0MOuF5o0XYAqrMcB9EQpz+is5MbNB8nU9Is=
Date:   Wed, 31 Mar 2021 16:54:13 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     Jakub Kicinski <kuba@kernel.org>,
        David Miller <davem@davemloft.net>,
        Network Development <netdev@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Aleksander Morgado <aleksander@aleksander.es>
Subject: Re: [PATCH net-next v6 1/2] net: Add a WWAN subsystem
Message-ID: <YGSNFS5wl13L4OoU@kroah.com>
References: <1617187150-13727-1-git-send-email-loic.poulain@linaro.org>
 <YGRSdQxTuxIy0Qsc@kroah.com>
 <CAMZdPi-f4wDiFSuib5h17SaFWgORv8q7jKdh8fS_C=iihc0a_A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMZdPi-f4wDiFSuib5h17SaFWgORv8q7jKdh8fS_C=iihc0a_A@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Mar 31, 2021 at 01:35:04PM +0200, Loic Poulain wrote:
> Hi Greg,
> 
> On Wed, 31 Mar 2021 at 12:44, Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > On Wed, Mar 31, 2021 at 12:39:09PM +0200, Loic Poulain wrote:
> > > This change introduces initial support for a WWAN subsystem. Given the
> > > complexity and heterogeneity of existing WWAN hardwares and interfaces,
> > > there is no strict definition of what a WWAN device is and how it should
> > > be represented. It's often a collection of multiple devices that perform
> > > the global WWAN feature (netdev, tty, chardev, etc).
> > >
> > > One usual way to expose modem controls and configuration is via high
> > > level protocols such as the well known AT command protocol, MBIM or
> > > QMI. The USB modems started to expose that as character devices, and
> > > user daemons such as ModemManager learnt how to deal with them. This
> > > initial version adds the concept of WWAN port, which can be created
> > > by any driver to expose one of these protocols. The WWAN core takes
> > > care of the generic part, including character device creation and lets
> > > the driver implementing access (fops) for the selected protocol.
> > >
> > > Since the different components/devices do no necesserarly know about
> > > each others, and can be created/removed in different orders, the
> > > WWAN core ensures that all WAN ports that contribute to the whole
> > > WWAN feature are grouped under the same virtual WWAN device, relying
> > > on the provided parent device (e.g. mhi controller, USB device). It's
> > > a 'trick' I copied from Johannes's earlier WWAN subsystem proposal.
> > >
> > > This initial version is purposely minimalist, it's essentially moving
> > > the generic part of the previously proposed mhi_wwan_ctrl driver inside
> > > a common WWAN framework, but the implementation is open and flexible
> > > enough to allow extension for further drivers.
> > >
> > > Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> > > ---
> > >  v2: update copyright (2021)
> > >  v3: Move driver to dedicated drivers/net/wwan directory
> > >  v4: Rework to use wwan framework instead of self cdev management
> > >  v5: Fix errors/typos in Kconfig
> > >  v6: - Move to new wwan interface, No need dedicated call to wwan_dev_create
> > >      - Cleanup code (remove legacy from mhi_uci, unused defines/vars...)
> > >      - Remove useless write_lock mutex
> > >      - Add mhi_wwan_wait_writable and mhi_wwan_wait_dlqueue_lock_irq helpers
> > >      - Rework locking
> > >      - Add MHI_WWAN_TX_FULL flag
> > >      - Add support for NONBLOCK read/write
> > >
> > >  drivers/net/Kconfig          |   2 +
> > >  drivers/net/Makefile         |   1 +
> > >  drivers/net/wwan/Kconfig     |  22 +++
> > >  drivers/net/wwan/Makefile    |   7 +
> > >  drivers/net/wwan/wwan_core.c | 317 +++++++++++++++++++++++++++++++++++++++++++
> > >  include/linux/wwan.h         |  73 ++++++++++
> > >  6 files changed, 422 insertions(+)
> > >  create mode 100644 drivers/net/wwan/Kconfig
> > >  create mode 100644 drivers/net/wwan/Makefile
> > >  create mode 100644 drivers/net/wwan/wwan_core.c
> > >  create mode 100644 include/linux/wwan.h
> > >
> > > diff --git a/drivers/net/Kconfig b/drivers/net/Kconfig
> > > index 5895905..74dc8e24 100644
> > > --- a/drivers/net/Kconfig
> > > +++ b/drivers/net/Kconfig
> > > @@ -502,6 +502,8 @@ source "drivers/net/wan/Kconfig"
> > >
> > >  source "drivers/net/ieee802154/Kconfig"
> > >
> > > +source "drivers/net/wwan/Kconfig"
> > > +
> > >  config XEN_NETDEV_FRONTEND
> > >       tristate "Xen network device frontend driver"
> > >       depends on XEN
> > > diff --git a/drivers/net/Makefile b/drivers/net/Makefile
> > > index 040e20b..7ffd2d0 100644
> > > --- a/drivers/net/Makefile
> > > +++ b/drivers/net/Makefile
> > > @@ -68,6 +68,7 @@ obj-$(CONFIG_SUNGEM_PHY) += sungem_phy.o
> > >  obj-$(CONFIG_WAN) += wan/
> > >  obj-$(CONFIG_WLAN) += wireless/
> > >  obj-$(CONFIG_IEEE802154) += ieee802154/
> > > +obj-$(CONFIG_WWAN) += wwan/
> > >
> > >  obj-$(CONFIG_VMXNET3) += vmxnet3/
> > >  obj-$(CONFIG_XEN_NETDEV_FRONTEND) += xen-netfront.o
> > > diff --git a/drivers/net/wwan/Kconfig b/drivers/net/wwan/Kconfig
> > > new file mode 100644
> > > index 0000000..545fe54
> > > --- /dev/null
> > > +++ b/drivers/net/wwan/Kconfig
> > > @@ -0,0 +1,22 @@
> > > +# SPDX-License-Identifier: GPL-2.0-only
> > > +#
> > > +# Wireless WAN device configuration
> > > +#
> > > +
> > > +menuconfig WWAN
> > > +     bool "Wireless WAN"
> > > +     help
> > > +       This section contains Wireless WAN driver configurations.
> > > +
> > > +if WWAN
> > > +
> > > +config WWAN_CORE
> > > +     tristate "WWAN Driver Core"
> > > +     help
> > > +       Say Y here if you want to use the WWAN driver core. This driver
> > > +       provides a common framework for WWAN drivers.
> > > +
> > > +       To compile this driver as a module, choose M here: the module will be
> > > +       called wwan.
> > > +
> > > +endif # WWAN
> > > diff --git a/drivers/net/wwan/Makefile b/drivers/net/wwan/Makefile
> > > new file mode 100644
> > > index 0000000..934590b
> > > --- /dev/null
> > > +++ b/drivers/net/wwan/Makefile
> > > @@ -0,0 +1,7 @@
> > > +# SPDX-License-Identifier: GPL-2.0
> > > +#
> > > +# Makefile for the Linux WWAN device drivers.
> > > +#
> > > +
> > > +obj-$(CONFIG_WWAN_CORE) += wwan.o
> > > +wwan-objs += wwan_core.o
> > > diff --git a/drivers/net/wwan/wwan_core.c b/drivers/net/wwan/wwan_core.c
> > > new file mode 100644
> > > index 0000000..7d9e2643
> > > --- /dev/null
> > > +++ b/drivers/net/wwan/wwan_core.c
> > > @@ -0,0 +1,317 @@
> > > +// SPDX-License-Identifier: GPL-2.0-only
> > > +/* Copyright (c) 2021, Linaro Ltd <loic.poulain@linaro.org> */
> > > +
> > > +#include <linux/err.h>
> > > +#include <linux/errno.h>
> > > +#include <linux/fs.h>
> > > +#include <linux/init.h>
> > > +#include <linux/idr.h>
> > > +#include <linux/kernel.h>
> > > +#include <linux/module.h>
> > > +#include <linux/slab.h>
> > > +#include <linux/types.h>
> > > +#include <linux/wwan.h>
> > > +
> > > +#define WWAN_MAX_MINORS 256 /* Allow the whole available cdev range of minors */
> >
> > That's not the "whole range of minors" at all...
> 
> Though minor is 20-bit wide, Is 256 not the maximum number of minors
> when using register_chrdev()?

Using that function, yes, but that is not the minor range allowed at
all.  As you say, it's 20 bits wide.

> > And what are you using this chardev for at all?  All you have is an
> > open() call, but you have nothing to do with it after that.  What is it
> > for?
> >
> > confused,
> 
> The WWAN framework acts a bit like misc or sound frameworks here, the
> fops are not directly implemented by WWAN core but passed by the port
> driver as parameter on WWAN port registration.There is no real benefit
> of having them implemented in WWAN core since it would mostly consist
> in forwarding read/write to the 'port driver' (at least for now).

So, you are going to have a common class and char device node, that
could have any type of device behind it that handles
open/read/write/ioctl/close in different ways?

That sounds like madness, userspace developers will be cursing your name
for eons.  Don't do that, we try to learn from our mistakes, not
duplicate them over and over.

Please make each major number you use, have all minor numbers in that
range operate the same way.  Otherwise again, userspace is going to be
cursing you for a very very long time.

As it is, the code you have here just implements the misc device layer,
but with a new major number?  why???

thanks,

greg k-h
