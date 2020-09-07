Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB02025F69F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Sep 2020 11:37:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728367AbgIGJhP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Sep 2020 05:37:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:40136 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727122AbgIGJhN (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Sep 2020 05:37:13 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AAB1D2075A;
        Mon,  7 Sep 2020 09:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599471432;
        bh=RAVFYWF61yZlm6poHvins/OPqRcDNk08eg76v4/LKL8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=1pzelSJBh78G4TJVa+ssVPFnvppPJlArhl8uvfTueDaoKEukMhUcFHmh0GGgi7IjU
         Y/OQ+hLcrXC3kFsm7f4UGA6fQwiuSw9klndxNBnVMzVdsIgxwGB91GakJHK7N2TKuA
         4/ts+DVvYdHve8/i2YIZdmUMsra8jhK3/D8l+nbY=
Date:   Mon, 7 Sep 2020 11:37:25 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Hemant Kumar <hemantk@codeaurora.org>
Cc:     manivannan.sadhasivam@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, jhugo@codeaurora.org,
        bbhatt@codeaurora.org
Subject: Re: [PATCH v5 4/4] bus: mhi: clients: Add userspace client interface
 driver
Message-ID: <20200907093725.GC1393659@kroah.com>
References: <1596696063-17802-1-git-send-email-hemantk@codeaurora.org>
 <1596696063-17802-5-git-send-email-hemantk@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1596696063-17802-5-git-send-email-hemantk@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Aug 05, 2020 at 11:41:03PM -0700, Hemant Kumar wrote:
> This MHI client driver allows userspace clients to transfer
> raw data between MHI device and host using standard file operations.
> Device file node is created with format
> 
> /dev/mhi_<controller_name>_<mhi_device_name>
> 
> Currently it supports LOOPBACK channel.
> 
> Signed-off-by: Hemant Kumar <hemantk@codeaurora.org>
> ---
>  drivers/bus/mhi/Kconfig          |   6 +
>  drivers/bus/mhi/Makefile         |   1 +
>  drivers/bus/mhi/clients/Kconfig  |  15 +

Why a whole new subdirectory for just one file?

Please keep it in the same directory until you get too many different
files.

>  drivers/bus/mhi/clients/Makefile |   3 +
>  drivers/bus/mhi/clients/uci.c    | 662 +++++++++++++++++++++++++++++++++++++++
>  5 files changed, 687 insertions(+)
>  create mode 100644 drivers/bus/mhi/clients/Kconfig
>  create mode 100644 drivers/bus/mhi/clients/Makefile
>  create mode 100644 drivers/bus/mhi/clients/uci.c
> 
> diff --git a/drivers/bus/mhi/Kconfig b/drivers/bus/mhi/Kconfig
> index 6a217ff..927c392 100644
> --- a/drivers/bus/mhi/Kconfig
> +++ b/drivers/bus/mhi/Kconfig
> @@ -20,3 +20,9 @@ config MHI_BUS_DEBUG
>  	 Enable debugfs support for use with the MHI transport. Allows
>  	 reading and/or modifying some values within the MHI controller
>  	 for debug and test purposes.
> +
> +if MHI_BUS
> +
> +source "drivers/bus/mhi/clients/Kconfig"
> +
> +endif
> diff --git a/drivers/bus/mhi/Makefile b/drivers/bus/mhi/Makefile
> index 19e6443..48f6028 100644
> --- a/drivers/bus/mhi/Makefile
> +++ b/drivers/bus/mhi/Makefile
> @@ -1,2 +1,3 @@
>  # core layer
>  obj-y += core/
> +obj-y += clients/
> diff --git a/drivers/bus/mhi/clients/Kconfig b/drivers/bus/mhi/clients/Kconfig
> new file mode 100644
> index 0000000..37aaf51
> --- /dev/null
> +++ b/drivers/bus/mhi/clients/Kconfig
> @@ -0,0 +1,15 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +menu "MHI clients support"
> +
> +config MHI_UCI
> +       tristate "MHI UCI"
> +       depends on MHI_BUS
> +       help
> +	 MHI based userspace client interface driver is used for transferring
> +	 raw data between host and device using standard file operations from
> +	 userspace. Open, read, write, and close operations are supported
> +	 by this driver. Please check mhi_uci_match_table for all supported
> +	 channels that are exposed to userspace.
> +

Module name information?


> +endmenu
> diff --git a/drivers/bus/mhi/clients/Makefile b/drivers/bus/mhi/clients/Makefile
> new file mode 100644
> index 0000000..cd34282
> --- /dev/null
> +++ b/drivers/bus/mhi/clients/Makefile
> @@ -0,0 +1,3 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +obj-$(CONFIG_MHI_UCI) += uci.o

Why not mhi_ as a prefix?  This is a very generic module name, right?

> diff --git a/drivers/bus/mhi/clients/uci.c b/drivers/bus/mhi/clients/uci.c
> new file mode 100644
> index 0000000..a25d5d0
> --- /dev/null
> +++ b/drivers/bus/mhi/clients/uci.c
> @@ -0,0 +1,662 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/* Copyright (c) 2018-2020, The Linux Foundation. All rights reserved.*/
> +
> +#include <linux/kernel.h>
> +#include <linux/mhi.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/poll.h>
> +
> +#define DEVICE_NAME "mhi"
> +#define MHI_UCI_DRIVER_NAME "mhi_uci"
> +#define MAX_UCI_MINORS (128)
> +
> +static DEFINE_IDR(uci_idr);
> +static DEFINE_MUTEX(uci_idr_mutex);
> +static struct class *uci_dev_class;
> +static int uci_dev_major = -1;

Why init this to -1?

> +
> +/**
> + * struct uci_chan - MHI channel for a uci device
> + * @wq: wait queue for reader/writer
> + * @lock: spin lock
> + * @pending: list of rx buffers userspace is waiting to read
> + * @cur_buf: current buffer userspace is reading
> + * @rx_size: size of the current rx buffer userspace is reading
> + */
> +struct uci_chan {
> +	wait_queue_head_t wq;
> +
> +	/* protects pending and cur_buf members */
> +	spinlock_t lock;
> +
> +	struct list_head pending;
> +	struct uci_buf *cur_buf;
> +	size_t rx_size;
> +};
> +
> +/**
> + * struct uci_buf - uci buffer
> + * @data: data buffer
> + * @len: length of data buffer
> + * @node: list node of the uci buffer
> + */
> +struct uci_buf {
> +	void *data;
> +	size_t len;
> +	struct list_head node;
> +};
> +
> +/**
> + * struct uci_dev - MHI uci device
> + * @minor: uci device node minor number
> + * @mhi_dev: associated mhi device object
> + * @chan: MHI channel name
> + * @lock: mutex lock
> + * @ul_chan: uplink uci channel object
> + * @dl_chan: downlink uci channel object
> + * @mtu: max tx buffer length
> + * @actual_mtu: maximum size of incoming buffer
> + * @ref_count: uci_dev reference count
> + * @open_count: device node open count
> + * @enabled: uci device probed
> + */
> +struct uci_dev {
> +	unsigned int minor;
> +	struct mhi_device *mhi_dev;
> +	const char *chan;
> +
> +	/* protects uci_dev struct members */
> +	struct mutex lock;
> +
> +	struct uci_chan ul_chan;
> +	struct uci_chan dl_chan;
> +	size_t mtu;
> +	size_t actual_mtu;
> +	struct kref ref_count;
> +	struct kref open_count;

I'm stopping right here.  A structure can only have ONE reference count
to control its lifespan.  You have 2 here, which guarantees that either
you are using a kref incorrectly, or your code is totally confused and
will break easily.

Please fix this as this is not how to do this.

Also, why does anyone need to care about the number of times that open()
is called?  The vfs layer should handle all of that for you, right?

No other misc driver has to deal with this multi-layered reference
counting, so perhaps you are making this a lot more complex than it
really has to be?

thanks,

greg k-h
