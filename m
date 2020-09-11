Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B50B265956
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Sep 2020 08:28:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725616AbgIKG2G (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Sep 2020 02:28:06 -0400
Received: from a27-185.smtp-out.us-west-2.amazonses.com ([54.240.27.185]:49936
        "EHLO a27-185.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725468AbgIKG2D (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Sep 2020 02:28:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1599805682;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
        bh=pAeAgsozou67WOAJChdNX/t/bzVhVhOA2kc1P+Z3QgA=;
        b=MAkWIzxn7bQdDab0KD/fq+B62/zhFAf9pZLBI1PmwoxW+mq8o722Igkq20VVHoOU
        Ejs/wPnMWamiSDOmeGdpqBLm/OjoRTUbfeDK8vlXXlEnhC8Tp3TfbSSrB4MWeCvYJan
        mNGcl3NACGTm0ZFkeuMm+iBwRbHwYeK1VdhM3iRY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1599805682;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID;
        bh=pAeAgsozou67WOAJChdNX/t/bzVhVhOA2kc1P+Z3QgA=;
        b=bPQ+DqR7xSLQYjLFf4sSlxXnfxUyr2WC3EgIDLaYgucvB9w1TH9EMsE4XUZtnNvZ
        9njIrZxr0nOMUDy+Phu3mLax5O98x2+Eq/jJ1jmuKu1L5hFg3q0U0AMyBD0kEY1uYX4
        OnAWT2A70cptRTmG9PZoaMwHkMRLBOvx3a0z9jdI=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
        version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 52044C433F0
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=hemantk@codeaurora.org
Subject: Re: [PATCH v5 4/4] bus: mhi: clients: Add userspace client interface
 driver
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     manivannan.sadhasivam@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, jhugo@codeaurora.org,
        bbhatt@codeaurora.org
References: <1596696063-17802-1-git-send-email-hemantk@codeaurora.org>
 <1596696063-17802-5-git-send-email-hemantk@codeaurora.org>
 <20200907093725.GC1393659@kroah.com>
From:   Hemant Kumar <hemantk@codeaurora.org>
Message-ID: <010101747bd97299-764fe97e-b047-4729-bd3d-5324002af106-000000@us-west-2.amazonses.com>
Date:   Fri, 11 Sep 2020 06:28:02 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20200907093725.GC1393659@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SES-Outgoing: 2020.09.11-54.240.27.185
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Greg,

On 9/7/20 2:37 AM, Greg KH wrote:
> On Wed, Aug 05, 2020 at 11:41:03PM -0700, Hemant Kumar wrote:
>> This MHI client driver allows userspace clients to transfer
>> raw data between MHI device and host using standard file operations.
>> Device file node is created with format
>>
>> /dev/mhi_<controller_name>_<mhi_device_name>
>>
>> Currently it supports LOOPBACK channel.
>>
>> Signed-off-by: Hemant Kumar <hemantk@codeaurora.org>
>> ---
>>   drivers/bus/mhi/Kconfig          |   6 +
>>   drivers/bus/mhi/Makefile         |   1 +
>>   drivers/bus/mhi/clients/Kconfig  |  15 +
> 
> Why a whole new subdirectory for just one file?
> 
> Please keep it in the same directory until you get too many different
> files.
Currently MHI core driver files are under bus/mhi/core. Since MHI 
clients sit on top of core layer of MHI driver, i can move uci.c 
directly under /bus/mhi/.

> 
>>   drivers/bus/mhi/clients/Makefile |   3 +
>>   drivers/bus/mhi/clients/uci.c    | 662 +++++++++++++++++++++++++++++++++++++++
>>   5 files changed, 687 insertions(+)
>>   create mode 100644 drivers/bus/mhi/clients/Kconfig
>>   create mode 100644 drivers/bus/mhi/clients/Makefile
>>   create mode 100644 drivers/bus/mhi/clients/uci.c
>>
>> diff --git a/drivers/bus/mhi/Kconfig b/drivers/bus/mhi/Kconfig
>> index 6a217ff..927c392 100644
>> --- a/drivers/bus/mhi/Kconfig
>> +++ b/drivers/bus/mhi/Kconfig
>> @@ -20,3 +20,9 @@ config MHI_BUS_DEBUG
>>   	 Enable debugfs support for use with the MHI transport. Allows
>>   	 reading and/or modifying some values within the MHI controller
>>   	 for debug and test purposes.
>> +
>> +if MHI_BUS
>> +
>> +source "drivers/bus/mhi/clients/Kconfig"
>> +
>> +endif
>> diff --git a/drivers/bus/mhi/Makefile b/drivers/bus/mhi/Makefile
>> index 19e6443..48f6028 100644
>> --- a/drivers/bus/mhi/Makefile
>> +++ b/drivers/bus/mhi/Makefile
>> @@ -1,2 +1,3 @@
>>   # core layer
>>   obj-y += core/
>> +obj-y += clients/
>> diff --git a/drivers/bus/mhi/clients/Kconfig b/drivers/bus/mhi/clients/Kconfig
>> new file mode 100644
>> index 0000000..37aaf51
>> --- /dev/null
>> +++ b/drivers/bus/mhi/clients/Kconfig
>> @@ -0,0 +1,15 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
>> +
>> +menu "MHI clients support"
>> +
>> +config MHI_UCI
>> +       tristate "MHI UCI"
>> +       depends on MHI_BUS
>> +       help
>> +	 MHI based userspace client interface driver is used for transferring
>> +	 raw data between host and device using standard file operations from
>> +	 userspace. Open, read, write, and close operations are supported
>> +	 by this driver. Please check mhi_uci_match_table for all supported
>> +	 channels that are exposed to userspace.
>> +
> 
> Module name information?
Thanks for pointing it out, will add in next patch set.
> 
> 
>> +endmenu
>> diff --git a/drivers/bus/mhi/clients/Makefile b/drivers/bus/mhi/clients/Makefile
>> new file mode 100644
>> index 0000000..cd34282
>> --- /dev/null
>> +++ b/drivers/bus/mhi/clients/Makefile
>> @@ -0,0 +1,3 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
>> +
>> +obj-$(CONFIG_MHI_UCI) += uci.o
> 
> Why not mhi_ as a prefix?  This is a very generic module name, right?
how about adding
mhi_uci-y		:= uci.o
obj-$(CONFIG_MHI_UCI)	+= mhi_uci.o

> 
>> diff --git a/drivers/bus/mhi/clients/uci.c b/drivers/bus/mhi/clients/uci.c
>> new file mode 100644
>> index 0000000..a25d5d0
>> --- /dev/null
>> +++ b/drivers/bus/mhi/clients/uci.c
>> @@ -0,0 +1,662 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/* Copyright (c) 2018-2020, The Linux Foundation. All rights reserved.*/
>> +
>> +#include <linux/kernel.h>
>> +#include <linux/mhi.h>
>> +#include <linux/mod_devicetable.h>
>> +#include <linux/module.h>
>> +#include <linux/poll.h>
>> +
>> +#define DEVICE_NAME "mhi"
>> +#define MHI_UCI_DRIVER_NAME "mhi_uci"
>> +#define MAX_UCI_MINORS (128)
>> +
>> +static DEFINE_IDR(uci_idr);
>> +static DEFINE_MUTEX(uci_idr_mutex);
>> +static struct class *uci_dev_class;
>> +static int uci_dev_major = -1;
> 
> Why init this to -1?
Idea was to initialize with invalid value, i can leave it zero initialized.
> 
>> +
>> +/**
>> + * struct uci_chan - MHI channel for a uci device
>> + * @wq: wait queue for reader/writer
>> + * @lock: spin lock
>> + * @pending: list of rx buffers userspace is waiting to read
>> + * @cur_buf: current buffer userspace is reading
>> + * @rx_size: size of the current rx buffer userspace is reading
>> + */
>> +struct uci_chan {
>> +	wait_queue_head_t wq;
>> +
>> +	/* protects pending and cur_buf members */
>> +	spinlock_t lock;
>> +
>> +	struct list_head pending;
>> +	struct uci_buf *cur_buf;
>> +	size_t rx_size;
>> +};
>> +
>> +/**
>> + * struct uci_buf - uci buffer
>> + * @data: data buffer
>> + * @len: length of data buffer
>> + * @node: list node of the uci buffer
>> + */
>> +struct uci_buf {
>> +	void *data;
>> +	size_t len;
>> +	struct list_head node;
>> +};
>> +
>> +/**
>> + * struct uci_dev - MHI uci device
>> + * @minor: uci device node minor number
>> + * @mhi_dev: associated mhi device object
>> + * @chan: MHI channel name
>> + * @lock: mutex lock
>> + * @ul_chan: uplink uci channel object
>> + * @dl_chan: downlink uci channel object
>> + * @mtu: max tx buffer length
>> + * @actual_mtu: maximum size of incoming buffer
>> + * @ref_count: uci_dev reference count
>> + * @open_count: device node open count
>> + * @enabled: uci device probed
>> + */
>> +struct uci_dev {
>> +	unsigned int minor;
>> +	struct mhi_device *mhi_dev;
>> +	const char *chan;
>> +
>> +	/* protects uci_dev struct members */
>> +	struct mutex lock;
>> +
>> +	struct uci_chan ul_chan;
>> +	struct uci_chan dl_chan;
>> +	size_t mtu;
>> +	size_t actual_mtu;
>> +	struct kref ref_count;
>> +	struct kref open_count;
> 
> I'm stopping right here.  A structure can only have ONE reference count
> to control its lifespan.  You have 2 here, which guarantees that either
> you are using a kref incorrectly, or your code is totally confused and
> will break easily.
> 
> Please fix this as this is not how to do this.
> 
> Also, why does anyone need to care about the number of times that open()
> is called?  The vfs layer should handle all of that for you, right?
Reason for using open_count was to allow start MHI channel only when 
first open() was called and stop the MHI channel when last release() is 
called. Since uci driver just need to handle one open() from user space
other calls to open can simply return -EBUSY. i will get rid of 
open_count and does not let multiple threads to open same file node.
> 
> No other misc driver has to deal with this multi-layered reference
> counting, so perhaps you are making this a lot more complex than it
> really has to be?
> 
> thanks,
> 
> greg k-h
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
