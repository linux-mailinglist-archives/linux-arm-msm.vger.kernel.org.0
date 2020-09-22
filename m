Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86F5427405A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Sep 2020 13:05:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726554AbgIVLE5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Sep 2020 07:04:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726534AbgIVLE5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Sep 2020 07:04:57 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66B03C0613CF
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2020 04:04:56 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id w1so15788594edr.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2020 04:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Iljx3hlznfUOlzZFRWHMoIF312p8EqGvnsICc6+uq4s=;
        b=m8+pDRT1UYR17DvhL1oirMw7xuK2AaE3Duy8o3mYCTGXGo+hWktKxaNFygKcib58xt
         lM6e184mT5WjUic8yOwR/kh8kaQva0jFZEx1K9phgU9Qfcc6yAEeHtIrYSCpE+TJrQ7X
         A5mE/rsenA4m2mPQgGUU+ykitXKFlMl9/y7N9/bHiNe6ZLKu581Ev/rFN+mTPU1vU5Ed
         m8BuOXol0MX2UGJiUUAAqcOkdoEqTrJhO0XyEBa/H8J4e8669gmgd4n2cUhvjCKUbBhq
         IoB/hkmVATWCfze6SLEOm4KlNwSKCGsv2tF/S+v7cO8CWQGDUgk1k4i/34OCA7fGObNN
         DlVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Iljx3hlznfUOlzZFRWHMoIF312p8EqGvnsICc6+uq4s=;
        b=Tgw6OOJILeEUXBugNon3vKXdCnYkS3ClA1OSlX+YizQHpYU0w6w1MxcPw7s9tRkGjr
         fIb6UPu4SYUr459y8JJ+7fiQDrXstuMm8mq+UHQPDvhSSIJ5YRjRc80b/1f8ymmtL8LM
         BIO6S3hgqny+oEr1PMsnytd16ve29YOHMExcUfgU09cXLSkWvfkm9IzW/U2vPXN0/sCL
         kqLOGCvEVIq8XIDCG6VE9wZCj4nC34g+jTG+dd8PPbSQC5hO1FCZf4fjE+DTq+T8nkKU
         DI7LegLasQpJcabd0fw/V+cXtVA/ZjzJCZ8bVTWc/AoOjCuCo3+IanGk88WobmJ1R7ho
         exhA==
X-Gm-Message-State: AOAM532dGqYzQhmAwH/YZa73HIHyMuHGLfqdFuUqh/UvBUNRVqkuQDkA
        JeXZeiobyALfS2tVAjIjEubl6igzQtuMVyf/DKu+ZA==
X-Google-Smtp-Source: ABdhPJyoZ4shyg8YdvTRpdsw/qs9lya3crCPGnKu9PlTtwPsmdvsPOUphYbLFewzZICDSB9Bh6xuKNXVYdh3v30qi5o=
X-Received: by 2002:aa7:c6cf:: with SMTP id b15mr3372034eds.134.1600772694574;
 Tue, 22 Sep 2020 04:04:54 -0700 (PDT)
MIME-Version: 1.0
References: <1600286167-4432-1-git-send-email-hemantk@codeaurora.org> <1600286167-4432-5-git-send-email-hemantk@codeaurora.org>
In-Reply-To: <1600286167-4432-5-git-send-email-hemantk@codeaurora.org>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Tue, 22 Sep 2020 13:10:07 +0200
Message-ID: <CAMZdPi9yQDCWXwHoYtby=LWbK2i3zrgCuW_+7OT8k6kq0qAJWg@mail.gmail.com>
Subject: Re: [PATCH v6 4/4] bus: mhi: Add userspace client interface driver
To:     Hemant Kumar <hemantk@codeaurora.org>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>, jhugo@codeaurora.org,
        bbhatt@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Hemant,

See comments inline, but globally, the locking and ref counting is
more complicated than it should be.

On Wed, 16 Sep 2020 at 21:57, Hemant Kumar <hemantk@codeaurora.org> wrote:
>
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
>  drivers/bus/mhi/Kconfig  |  13 +
>  drivers/bus/mhi/Makefile |   4 +
>  drivers/bus/mhi/uci.c    | 657 +++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 674 insertions(+)
>  create mode 100644 drivers/bus/mhi/uci.c
>
> diff --git a/drivers/bus/mhi/Kconfig b/drivers/bus/mhi/Kconfig
> index 6a217ff..8aebe8b 100644
> --- a/drivers/bus/mhi/Kconfig
> +++ b/drivers/bus/mhi/Kconfig
> @@ -20,3 +20,16 @@ config MHI_BUS_DEBUG
>          Enable debugfs support for use with the MHI transport. Allows
>          reading and/or modifying some values within the MHI controller
>          for debug and test purposes.
> +
> +config MHI_UCI
> +       tristate "MHI UCI"
> +       depends on MHI_BUS
> +       help
> +        MHI based userspace client interface driver is used for transferring
> +        raw data between host and device using standard file operations from
> +        userspace. Open, read, write, and close operations are supported
> +        by this driver. Please check mhi_uci_match_table for all supported
> +        channels that are exposed to userspace.
> +
> +        To compile this driver as a module, choose M here: the module will be
> +        called mhi_uci.
> diff --git a/drivers/bus/mhi/Makefile b/drivers/bus/mhi/Makefile
> index 19e6443..80feefb 100644
> --- a/drivers/bus/mhi/Makefile
> +++ b/drivers/bus/mhi/Makefile
> @@ -1,2 +1,6 @@
>  # core layer
>  obj-y += core/
> +
> +# MHI client
> +mhi_uci-y := uci.o
> +obj-$(CONFIG_MHI_UCI) += mhi_uci.o
> diff --git a/drivers/bus/mhi/uci.c b/drivers/bus/mhi/uci.c
> new file mode 100644
> index 0000000..d6758f2
> --- /dev/null
> +++ b/drivers/bus/mhi/uci.c
> @@ -0,0 +1,657 @@
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
> +static int uci_dev_major;
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
> +       wait_queue_head_t wq;
> +
> +       /* protects pending and cur_buf members in bh context */
> +       spinlock_t lock;
> +
> +       struct list_head pending;
> +       struct uci_buf *cur_buf;
> +       size_t rx_size;
> +};
> +
> +/**
> + * struct uci_buf - uci buffer
> + * @data: data buffer
> + * @len: length of data buffer
> + * @node: list node of the uci buffer
> + */
> +struct uci_buf {
> +       void *data;
> +       size_t len;
> +       struct list_head node;
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
> + * @open: open called for device node
> + * @enabled: uci device probed
> + * @ref_count: uci_dev reference count
> + */
> +struct uci_dev {
> +       unsigned int minor;
> +       struct mhi_device *mhi_dev;
> +       const char *chan;
> +
> +       /* protects uci_dev struct members */
> +       struct mutex lock;
> +
> +       struct uci_chan ul_chan;
> +       struct uci_chan dl_chan;
> +       size_t mtu;
> +       size_t actual_mtu;
> +       bool enabled;
> +       struct kref ref_count;
> +};
> +
> +static int mhi_queue_inbound(struct uci_dev *udev)
> +{
> +       struct mhi_device *mhi_dev = udev->mhi_dev;
> +       struct device *dev = &mhi_dev->dev;
> +       size_t mtu = udev->mtu;
> +       size_t actual_mtu = udev->actual_mtu;
> +       int nr_trbs, i, ret = -EIO;
> +       void *buf;
> +       struct uci_buf *uci_buf;
> +
> +       nr_trbs = mhi_get_no_free_descriptors(mhi_dev, DMA_FROM_DEVICE);
> +
> +       for (i = 0; i < nr_trbs; i++) {
> +               buf = kmalloc(mtu, GFP_KERNEL);
> +               if (!buf)
> +                       return -ENOMEM;
> +
> +               uci_buf = buf + actual_mtu;
> +               uci_buf->data = buf;
> +
> +               dev_dbg(dev, "Allocated buf %d of %d size %ld\n", i, nr_trbs,
> +                       actual_mtu);
> +
> +               ret = mhi_queue_buf(mhi_dev, DMA_FROM_DEVICE, buf, actual_mtu,
> +                                   MHI_EOT);
> +               if (ret) {
> +                       kfree(buf);
> +                       dev_err(dev, "Failed to queue buffer %d\n", i);
> +                       return ret;
> +               }
> +       }
> +
> +       return ret;
> +}
> +
> +static void mhi_uci_dev_release(struct kref *ref)
> +{
> +       struct uci_dev *udev =
> +               container_of(ref, struct uci_dev, ref_count);
> +
> +       mutex_destroy(&udev->lock);
> +
> +       dev_set_drvdata(&udev->mhi_dev->dev, NULL);
> +
> +       kfree(udev);
> +}
> +
> +static int mhi_uci_release(struct inode *inode, struct file *file)
> +{
> +       struct uci_dev *udev = file->private_data;
> +       struct uci_buf *itr, *tmp;
> +       struct uci_chan *uchan;
> +
> +       if (kref_read(&udev->ref_count) > 2)
> +               goto exit_uci_release;
> +
> +       if (udev->enabled)
> +               mhi_unprepare_from_transfer(udev->mhi_dev);
> +
> +       /* clean inbound channel */
> +       uchan = &udev->dl_chan;
> +
> +       spin_lock_bh(&uchan->lock);
> +       list_for_each_entry_safe(itr, tmp, &uchan->pending, node) {
> +               list_del(&itr->node);
> +               kfree(itr->data);
> +       }
> +
> +       if (uchan->cur_buf)
> +               kfree(uchan->cur_buf->data);
> +
> +       uchan->cur_buf = NULL;
> +       spin_unlock_bh(&uchan->lock);
> +
> +exit_uci_release:
> +       kref_put(&udev->ref_count, mhi_uci_dev_release);
> +
> +       return 0;
> +}
> +
> +static __poll_t mhi_uci_poll(struct file *file, poll_table *wait)
> +{
> +       struct uci_dev *udev = file->private_data;
> +       struct mhi_device *mhi_dev = udev->mhi_dev;
> +       struct device *dev = &mhi_dev->dev;
> +       struct uci_chan *uchan;
> +       __poll_t mask = 0;
> +
> +       poll_wait(file, &udev->dl_chan.wq, wait);
> +       poll_wait(file, &udev->ul_chan.wq, wait);
> +
> +       if (!udev->enabled) {
> +               mask = EPOLLERR;
> +       } else {
> +               uchan = &udev->dl_chan;
> +               spin_lock_bh(&uchan->lock);
> +               if (!list_empty(&uchan->pending) || uchan->cur_buf) {
> +                       dev_dbg(dev, "Client can read from node\n");
> +                       mask |= EPOLLIN | EPOLLRDNORM;
> +               }
> +               spin_unlock_bh(&uchan->lock);
> +       }
> +
> +       if (!udev->enabled) {
> +               mask |= EPOLLERR;
> +       } else if (mhi_get_no_free_descriptors(mhi_dev, DMA_TO_DEVICE) > 0) {
> +               dev_dbg(dev, "Client can write to node\n");
> +               mask |= EPOLLOUT | EPOLLWRNORM;
> +       }
> +
> +       dev_dbg(dev, "Client attempted to poll, returning mask 0x%x\n", mask);
> +
> +       return mask;
> +}
> +
> +static ssize_t mhi_uci_write(struct file *file,
> +                            const char __user *buf,
> +                            size_t count,
> +                            loff_t *offp)
> +{
> +       struct uci_dev *udev = file->private_data;
> +       struct mhi_device *mhi_dev = udev->mhi_dev;
> +       struct device *dev = &mhi_dev->dev;
> +       struct uci_chan *uchan = &udev->ul_chan;
> +       size_t bytes_xfered = 0;
> +       int ret, nr_avail = 0;
> +
> +       if (!buf || !count)
> +               return -EINVAL;
> +
> +       /* confirm channel is active */
> +       mutex_lock(&udev->lock);
> +       if (!udev->enabled) {
> +               ret = -ENODEV;
> +               goto err_mtx_unlock;
> +       }
> +
> +       dev_dbg(dev, "%s: to xfer: %lu bytes\n", __func__, count);
> +
> +       while (count) {
> +               size_t xfer_size;
> +               void *kbuf;
> +               enum mhi_flags flags;
> +
> +               mutex_unlock(&udev->lock);
> +               /* wait for free descriptors */
> +               ret = wait_event_interruptible(uchan->wq,
> +                                              (!udev->enabled) ||
> +                               (nr_avail = mhi_get_no_free_descriptors(mhi_dev,
> +                                              DMA_TO_DEVICE)) > 0);
> +
> +               mutex_lock(&udev->lock);

All this locking unlocking is odd:
- why do you need locking for testing wait_event return code?
- why do you need this udev->enabled?
- The MHI core should be thread safe + mhi_queue_buf should simply
fail if removing is ongoing.

> +               if (ret == -ERESTARTSYS) {
> +                       dev_dbg(dev, "Exit signal caught for node\n");
> +                       goto err_mtx_unlock;
> +               }
> +
> +               if (!udev->enabled) {
> +                       ret = -ENODEV;
> +                       goto err_mtx_unlock;
> +               }
> +
> +               xfer_size = min_t(size_t, count, udev->mtu);
> +               kbuf = kmalloc(xfer_size, GFP_KERNEL);
> +               if (!kbuf) {
> +                       ret = -ENOMEM;
> +                       goto err_mtx_unlock;
> +               }
> +
> +               ret = copy_from_user(kbuf, buf, xfer_size);
> +               if (ret) {
> +                       kfree(kbuf);
> +                       ret = -EFAULT;
> +                       goto err_mtx_unlock;
> +               }
> +
> +               /* if ring is full after this force EOT */
> +               if (nr_avail > 1 && (count - xfer_size))
> +                       flags = MHI_CHAIN;
> +               else
> +                       flags = MHI_EOT;
> +
> +               if (udev->enabled)
> +                       ret = mhi_queue_buf(mhi_dev, DMA_TO_DEVICE, kbuf,
> +                                           xfer_size, flags);
> +               else
> +                       ret = -ENODEV;
> +
> +               if (ret) {
> +                       kfree(kbuf);
> +                       goto err_mtx_unlock;
> +               }
> +
> +               bytes_xfered += xfer_size;
> +               count -= xfer_size;
> +               buf += xfer_size;
> +       }
> +
> +       mutex_unlock(&udev->lock);
> +       dev_dbg(dev, "%s: bytes xferred: %lu\n", __func__, bytes_xfered);
> +
> +       return bytes_xfered;
> +
> +err_mtx_unlock:
> +       mutex_unlock(&udev->lock);
> +
> +       return ret;
> +}
> +
> +static ssize_t mhi_uci_read(struct file *file,
> +                           char __user *buf,
> +                           size_t count,
> +                           loff_t *ppos)
> +{
> +       struct uci_dev *udev = file->private_data;
> +       struct mhi_device *mhi_dev = udev->mhi_dev;
> +       struct uci_chan *uchan = &udev->dl_chan;
> +       struct device *dev = &mhi_dev->dev;
> +       struct uci_buf *ubuf;
> +       char *ptr;
> +       size_t to_copy;
> +       int ret = 0;
> +
> +       if (!buf)
> +               return -EINVAL;
> +
> +       mutex_lock(&udev->lock);
> +       /* confirm channel is active */
> +       if (!udev->enabled) {
> +               ret = -ENODEV;
> +               goto err_mtx_unlock;
> +       }
> +
> +       spin_lock_bh(&uchan->lock);
> +       /* No data available to read, wait */
> +       if (!uchan->cur_buf && list_empty(&uchan->pending)) {
> +               dev_dbg(dev, "No data available to read waiting\n");
> +
> +               spin_unlock_bh(&uchan->lock);
> +               mutex_unlock(&udev->lock);
> +               ret = wait_event_interruptible(uchan->wq,
> +                                              (!udev->enabled ||
> +                                             !list_empty(&uchan->pending)));
> +
> +               mutex_lock(&udev->lock);
> +               if (ret == -ERESTARTSYS) {
> +                       dev_dbg(dev, "Exit signal caught for node\n");
> +                       goto err_mtx_unlock;
> +               }
> +
> +               if (!udev->enabled) {
> +                       ret = -ENODEV;
> +                       goto err_mtx_unlock;
> +               }
> +               spin_lock_bh(&uchan->lock);
> +       }
> +
> +       /* new read, get the next descriptor from the list */
> +       if (!uchan->cur_buf) {
> +               ubuf = list_first_entry_or_null(&uchan->pending,
> +                                               struct uci_buf, node);
> +               if (!ubuf) {
> +                       ret = -EIO;
> +                       goto err_spin_unlock;
> +               }
> +
> +               list_del(&ubuf->node);
> +               uchan->cur_buf = ubuf;
> +               uchan->rx_size = ubuf->len;
> +               dev_dbg(dev, "Got pkt of size: %zu\n", uchan->rx_size);
> +       }
> +
> +       ubuf = uchan->cur_buf;
> +
> +       /* Copy the buffer to user space */
> +       to_copy = min_t(size_t, count, uchan->rx_size);
> +       ptr = ubuf->data + (ubuf->len - uchan->rx_size);
> +       spin_unlock_bh(&uchan->lock);
> +
> +       ret = copy_to_user(buf, ptr, to_copy);
> +       if (ret) {
> +               ret = -EFAULT;
> +               goto err_mtx_unlock;
> +       }
> +
> +       spin_lock_bh(&uchan->lock);
> +
> +       dev_dbg(dev, "Copied %lu of %lu bytes\n", to_copy, uchan->rx_size);
> +       uchan->rx_size -= to_copy;
> +
> +       /* we finished with this buffer, queue it back to hardware */
> +       if (!uchan->rx_size) {
> +               uchan->cur_buf = NULL;
> +
> +               if (udev->enabled)
> +                       ret = mhi_queue_buf(mhi_dev, DMA_FROM_DEVICE,
> +                                           ubuf->data,
> +                                           udev->actual_mtu, MHI_EOT);
> +               else
> +                       ret = -ENODEV;
> +
> +               if (ret) {
> +                       dev_err(dev, "Failed to recycle element: %d\n", ret);
> +                       kfree(ubuf->data);
> +                       goto err_spin_unlock;
> +               }
> +       }
> +       spin_unlock_bh(&uchan->lock);
> +       mutex_unlock(&udev->lock);
> +
> +       dev_dbg(dev, "%s: Returning %lu bytes\n", __func__, to_copy);
> +
> +       return to_copy;
> +
> +err_spin_unlock:
> +       spin_unlock_bh(&uchan->lock);
> +err_mtx_unlock:
> +       mutex_unlock(&udev->lock);
> +       return ret;
> +}
> +
> +static int mhi_uci_open(struct inode *inode, struct file *filp)
> +{
> +       struct uci_dev *udev = NULL;
> +       unsigned int minor = iminor(inode);
> +       int ret = -EIO;
> +       struct uci_buf *buf_itr, *tmp;
> +       struct uci_chan *dl_chan;
> +       struct mhi_device *mhi_dev;
> +       struct device *dev;
> +
> +       mutex_lock(&uci_idr_mutex);
> +       udev = idr_find(&uci_idr, minor);
> +       mutex_unlock(&uci_idr_mutex);
> +       if (!udev) {
> +               pr_err("uci dev: minor %d not found\n", minor);
> +               ret = -ENODEV;
> +               goto error_no_dev;
> +       }
> +
> +       kref_get(&udev->ref_count);
> +
> +       mhi_dev = udev->mhi_dev;
> +       dev = &mhi_dev->dev;
> +
> +       mutex_lock(&udev->lock);
> +       if (kref_read(&udev->ref_count) > 2) {
> +               dev_dbg(dev, "Node already opened\n");
> +               goto exit_uci_open;
> +       }
> +
> +       if (!udev->enabled) {
> +               dev_info(dev, "Node exists, but is not in active state!\n");
> +               goto error_open_chan;
> +       }
> +
> +       dev_dbg(dev, "Starting channel\n");
> +       ret = mhi_prepare_for_transfer(udev->mhi_dev);
> +       if (ret) {
> +               dev_err(dev, "Error starting transfer channels\n");
> +               goto error_open_chan;
> +       }
> +
> +       ret = mhi_queue_inbound(udev);
> +       if (ret)
> +               goto error_rx_queue;
> +
> +exit_uci_open:
> +       filp->private_data = udev;
> +       mutex_unlock(&udev->lock);
> +
> +       return 0;
> +
> +error_rx_queue:
> +       dl_chan = &udev->dl_chan;
> +       mhi_unprepare_from_transfer(udev->mhi_dev);
> +       list_for_each_entry_safe(buf_itr, tmp, &dl_chan->pending, node) {
> +               list_del(&buf_itr->node);
> +               kfree(buf_itr->data);
> +       }
> +error_open_chan:
> +       mutex_unlock(&udev->lock);
> +       kref_put(&udev->ref_count, mhi_uci_dev_release);
> +error_no_dev:
> +       return ret;
> +}
> +
> +static const struct file_operations mhidev_fops = {
> +       .owner = THIS_MODULE,
> +       .open = mhi_uci_open,
> +       .release = mhi_uci_release,
> +       .read = mhi_uci_read,
> +       .write = mhi_uci_write,
> +       .poll = mhi_uci_poll,
> +};
> +
> +static void mhi_ul_xfer_cb(struct mhi_device *mhi_dev,
> +                          struct mhi_result *mhi_result)
> +{
> +       struct uci_dev *udev = dev_get_drvdata(&mhi_dev->dev);
> +       struct uci_chan *uchan = &udev->ul_chan;
> +       struct device *dev = &mhi_dev->dev;
> +
> +       dev_dbg(dev, "status: %d xfer_len: %zu\n",
> +               mhi_result->transaction_status, mhi_result->bytes_xferd);
> +
> +       kfree(mhi_result->buf_addr);
> +
> +       if (!mhi_result->transaction_status)
> +               wake_up(&uchan->wq);
> +}
> +
> +static void mhi_dl_xfer_cb(struct mhi_device *mhi_dev,
> +                          struct mhi_result *mhi_result)
> +{
> +       struct uci_dev *udev = dev_get_drvdata(&mhi_dev->dev);
> +       struct uci_chan *uchan = &udev->dl_chan;
> +       struct device *dev = &mhi_dev->dev;
> +       struct uci_buf *buf;
> +
> +       dev_dbg(dev, "status: %d receive_len: %zu\n",
> +               mhi_result->transaction_status, mhi_result->bytes_xferd);
> +
> +       if (mhi_result->transaction_status == -ENOTCONN) {
> +               kfree(mhi_result->buf_addr);
> +               return;
> +       }
> +
> +       spin_lock_bh(&uchan->lock);
> +       buf = mhi_result->buf_addr + udev->actual_mtu;
> +       buf->data = mhi_result->buf_addr;
> +       buf->len = mhi_result->bytes_xferd;

You don't need to protect buf here, only uchan pending list, right? so
move lock here.

> +       list_add_tail(&buf->node, &uchan->pending);
> +       spin_unlock_bh(&uchan->lock);
> +
> +       wake_up(&uchan->wq);
> +}
> +
> +static int mhi_uci_probe(struct mhi_device *mhi_dev,
> +                        const struct mhi_device_id *id)
> +{
> +       struct uci_dev *udev;
> +       struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
> +       struct device *dev;
> +       int index, dir;
> +
> +       udev = kzalloc(sizeof(*udev), GFP_KERNEL);
> +       if (!udev)
> +               return -ENOMEM;
> +
> +       kref_init(&udev->ref_count);
> +       mutex_init(&udev->lock);
> +       udev->mhi_dev = mhi_dev;
> +
> +       mutex_lock(&udev->lock);

Why locking here? udev has just been created, it cannot be used concurrently.

> +
> +       mutex_lock(&uci_idr_mutex);
> +       index = idr_alloc(&uci_idr, udev, 0, MAX_UCI_MINORS, GFP_KERNEL);
> +       mutex_unlock(&uci_idr_mutex);
> +       if (index < 0) {
> +               mutex_unlock(&udev->lock);
> +               kfree(udev);
> +               return index;
> +       }
> +
> +       udev->minor = index;
> +
> +       /* create device file node /dev/mhi_<cntrl_dev_name>_<mhi_dev_name> */
> +       dev = device_create(uci_dev_class, &mhi_dev->dev,
> +                           MKDEV(uci_dev_major, index), udev,
> +                           DEVICE_NAME "_%s_%s",
> +                           dev_name(mhi_cntrl->cntrl_dev), mhi_dev->name);
> +       if (IS_ERR(dev)) {
> +               mutex_lock(&uci_idr_mutex);
> +               idr_remove(&uci_idr, udev->minor);
> +               mutex_unlock(&uci_idr_mutex);
> +               mutex_unlock(&udev->lock);
> +               kfree(udev);
> +               return PTR_ERR(dev);
> +       }

I would suggest adding the device at the very end of the probe, when
everything has been initialized.

Regards,
Loic



> +
> +       for (dir = 0; dir < 2; dir++) {
> +               struct uci_chan *uchan = (dir) ?
> +                       &udev->ul_chan : &udev->dl_chan;
> +               spin_lock_init(&uchan->lock);
> +               init_waitqueue_head(&uchan->wq);
> +               INIT_LIST_HEAD(&uchan->pending);
> +       }
> +
> +       udev->mtu = min_t(size_t, id->driver_data, MHI_MAX_MTU);
> +       udev->actual_mtu = udev->mtu - sizeof(struct uci_buf);
> +       dev_set_drvdata(&mhi_dev->dev, udev);
> +       udev->enabled = true;
> +
> +       mutex_unlock(&udev->lock);
> +
> +       dev_info(&mhi_dev->dev, "probed uci dev: minor %d\n", index);
> +
> +       return 0;
> +};
> +
> +static void mhi_uci_remove(struct mhi_device *mhi_dev)
> +{
> +       struct uci_dev *udev = dev_get_drvdata(&mhi_dev->dev);
> +
> +       mutex_lock(&udev->lock);
> +
> +       /* disable the node */
> +       udev->enabled = false;
> +
> +       wake_up(&udev->dl_chan.wq);
> +       wake_up(&udev->ul_chan.wq);
> +
> +       /* delete the node to prevent new opens */
> +       device_destroy(uci_dev_class, MKDEV(uci_dev_major, udev->minor));
> +
> +       mutex_lock(&uci_idr_mutex);
> +       idr_remove(&uci_idr, udev->minor);
> +       mutex_unlock(&uci_idr_mutex);
> +
> +       mutex_unlock(&udev->lock);
> +
> +       kref_put(&udev->ref_count, mhi_uci_dev_release);
> +}
> +
> +/* .driver_data stores max mtu */
> +static const struct mhi_device_id mhi_uci_match_table[] = {
> +       { .chan = "LOOPBACK", .driver_data = 0x1000},
> +       {},
> +};
> +MODULE_DEVICE_TABLE(mhi, mhi_uci_match_table);
> +
> +static struct mhi_driver mhi_uci_driver = {
> +       .id_table = mhi_uci_match_table,
> +       .remove = mhi_uci_remove,
> +       .probe = mhi_uci_probe,
> +       .ul_xfer_cb = mhi_ul_xfer_cb,
> +       .dl_xfer_cb = mhi_dl_xfer_cb,
> +       .driver = {
> +               .name = MHI_UCI_DRIVER_NAME,
> +       },
> +};
> +
> +static int mhi_uci_init(void)
> +{
> +       int ret;
> +
> +       ret = register_chrdev(0, MHI_UCI_DRIVER_NAME, &mhidev_fops);
> +       if (ret < 0)
> +               return ret;
> +
> +       uci_dev_major = ret;
> +       uci_dev_class = class_create(THIS_MODULE, MHI_UCI_DRIVER_NAME);
> +       if (IS_ERR(uci_dev_class)) {
> +               unregister_chrdev(uci_dev_major, MHI_UCI_DRIVER_NAME);
> +               return -ENODEV;
> +       }
> +
> +       ret = mhi_driver_register(&mhi_uci_driver);
> +       if (ret) {
> +               class_destroy(uci_dev_class);
> +               unregister_chrdev(uci_dev_major, MHI_UCI_DRIVER_NAME);
> +       }
> +
> +       return ret;
> +}
> +
> +static void __exit mhi_uci_exit(void)
> +{
> +       mhi_driver_unregister(&mhi_uci_driver);
> +       class_destroy(uci_dev_class);
> +       unregister_chrdev(uci_dev_major, MHI_UCI_DRIVER_NAME);
> +}
> +
> +module_init(mhi_uci_init);
> +module_exit(mhi_uci_exit);
> +MODULE_LICENSE("GPL v2");
> +MODULE_DESCRIPTION("MHI UCI Driver");
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
>
