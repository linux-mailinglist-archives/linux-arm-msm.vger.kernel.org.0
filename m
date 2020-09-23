Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDDE4275F8E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Sep 2020 20:17:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726599AbgIWSRg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Sep 2020 14:17:36 -0400
Received: from m42-4.mailgun.net ([69.72.42.4]:16181 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726487AbgIWSRg (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Sep 2020 14:17:36 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1600885054; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=SDKBdIFY4e4dTxg3pIiARwfkCX8iKvAW8kzJj7I6JKQ=; b=bbOJcA6imINOlnnsoYz31d22SAA8aOLsR77Z9YEJTHMg1WP8lOmIlAsK4U862I4j85YDAOQ6
 pitQm1vPAa2xlpP87xII5QzSnldYfdR+T2LQKXTxFuY6uFb79Jt84LMnbG2za27shkGwTPFI
 fQXnBqSLjUhmIPgmUgOG5p6lseQ=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 5f6b913e722ceb0327ac03fb (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 23 Sep 2020 18:17:34
 GMT
Sender: hemantk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 70DE1C433C8; Wed, 23 Sep 2020 18:17:33 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.46.162.249] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: hemantk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 33AE5C433CA;
        Wed, 23 Sep 2020 18:17:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 33AE5C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=hemantk@codeaurora.org
Subject: Re: [PATCH v6 4/4] bus: mhi: Add userspace client interface driver
To:     Jeffrey Hugo <jhugo@codeaurora.org>,
        manivannan.sadhasivam@linaro.org
Cc:     gregkh@linuxfoundation.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, bbhatt@codeaurora.org
References: <1600286167-4432-1-git-send-email-hemantk@codeaurora.org>
 <1600286167-4432-5-git-send-email-hemantk@codeaurora.org>
 <d6a8e9a4-e87b-5dd5-04fc-870fac37c20b@codeaurora.org>
From:   Hemant Kumar <hemantk@codeaurora.org>
Message-ID: <3040396c-dd4c-5c24-bee4-92062a189233@codeaurora.org>
Date:   Wed, 23 Sep 2020 11:17:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <d6a8e9a4-e87b-5dd5-04fc-870fac37c20b@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Jeff,

On 9/18/20 1:08 PM, Jeffrey Hugo wrote:
> On 9/16/2020 1:56 PM, Hemant Kumar wrote:
>> This MHI client driver allows userspace clients to transfer
>> raw data between MHI device and host using standard file operations.
>> Device file node is created with format
>>
>> /dev/mhi_<controller_name>_<mhi_device_name>
>>
>> Currently it supports LOOPBACK channel.
>>
>> Signed-off-by: Hemant Kumar <hemantk@codeaurora.org>
...
...
>> +
>> +static ssize_t mhi_uci_write(struct file *file,
>> +                 const char __user *buf,
>> +                 size_t count,
>> +                 loff_t *offp)
>> +{
>> +    struct uci_dev *udev = file->private_data;
>> +    struct mhi_device *mhi_dev = udev->mhi_dev;
>> +    struct device *dev = &mhi_dev->dev;
>> +    struct uci_chan *uchan = &udev->ul_chan;
>> +    size_t bytes_xfered = 0;
>> +    int ret, nr_avail = 0;
>> +
>> +    if (!buf || !count)
>> +        return -EINVAL;
>> +
>> +    /* confirm channel is active */
>> +    mutex_lock(&udev->lock);
>> +    if (!udev->enabled) {
>> +        ret = -ENODEV;
>> +        goto err_mtx_unlock;
>> +    }
>> +
>> +    dev_dbg(dev, "%s: to xfer: %lu bytes\n", __func__, count);
>> +
>> +    while (count) {
>> +        size_t xfer_size;
>> +        void *kbuf;
>> +        enum mhi_flags flags;
>> +
>> +        mutex_unlock(&udev->lock);
>> +        /* wait for free descriptors */
>> +        ret = wait_event_interruptible(uchan->wq,
>> +                           (!udev->enabled) ||
>> +                (nr_avail = mhi_get_no_free_descriptors(mhi_dev,
>> +                           DMA_TO_DEVICE)) > 0);
>> +
>> +        mutex_lock(&udev->lock);
> 
> It feels like there is a race here.  What if we wait because there are 
> no free descriptors, one becomes available, but someone else manages to 
> grab the mutex before we do, and consume it?  mhi_queue_buf() will fail 
> later on, and I don't think thats intended.
I agree Jeff, one option i can think of having separate read and write 
lock so that writer can hold lock if TREs are not available but reader 
can continue.
> 
>> +        if (ret == -ERESTARTSYS) {
>> +            dev_dbg(dev, "Exit signal caught for node\n");
>> +            goto err_mtx_unlock;
>> +        }
>> +
>> +        if (!udev->enabled) {
>> +            ret = -ENODEV;
>> +            goto err_mtx_unlock;
>> +        }
>> +
>> +        xfer_size = min_t(size_t, count, udev->mtu);
>> +        kbuf = kmalloc(xfer_size, GFP_KERNEL);
>> +        if (!kbuf) {
>> +            ret = -ENOMEM;
>> +            goto err_mtx_unlock;
>> +        }
>> +
>> +        ret = copy_from_user(kbuf, buf, xfer_size);
>> +        if (ret) {
>> +            kfree(kbuf);
>> +            ret = -EFAULT;
>> +            goto err_mtx_unlock;
>> +        }
>> +
>> +        /* if ring is full after this force EOT */
>> +        if (nr_avail > 1 && (count - xfer_size))
>> +            flags = MHI_CHAIN;
>> +        else
>> +            flags = MHI_EOT;
>> +
>> +        if (udev->enabled)
>> +            ret = mhi_queue_buf(mhi_dev, DMA_TO_DEVICE, kbuf,
>> +                        xfer_size, flags);
>> +        else
>> +            ret = -ENODEV;
>> +
>> +        if (ret) {
>> +            kfree(kbuf);
>> +            goto err_mtx_unlock;
>> +        }
>> +
>> +        bytes_xfered += xfer_size;
>> +        count -= xfer_size;
>> +        buf += xfer_size;
>> +    }
>> +
>> +    mutex_unlock(&udev->lock);
>> +    dev_dbg(dev, "%s: bytes xferred: %lu\n", __func__, bytes_xfered);
>> +
>> +    return bytes_xfered;
>> +
>> +err_mtx_unlock:
>> +    mutex_unlock(&udev->lock);
>> +
>> +    return ret;
>> +}
>> +
>> +static ssize_t mhi_uci_read(struct file *file,
>> +                char __user *buf,
>> +                size_t count,
>> +                loff_t *ppos)
>> +{
>> +    struct uci_dev *udev = file->private_data;
>> +    struct mhi_device *mhi_dev = udev->mhi_dev;
>> +    struct uci_chan *uchan = &udev->dl_chan;
>> +    struct device *dev = &mhi_dev->dev;
>> +    struct uci_buf *ubuf;
>> +    char *ptr;
>> +    size_t to_copy;
>> +    int ret = 0;
>> +
>> +    if (!buf)
>> +        return -EINVAL;
>> +
>> +    mutex_lock(&udev->lock);
>> +    /* confirm channel is active */
>> +    if (!udev->enabled) {
>> +        ret = -ENODEV;
>> +        goto err_mtx_unlock;
>> +    }
>> +
>> +    spin_lock_bh(&uchan->lock);
>> +    /* No data available to read, wait */
>> +    if (!uchan->cur_buf && list_empty(&uchan->pending)) {
>> +        dev_dbg(dev, "No data available to read waiting\n");
>> +
>> +        spin_unlock_bh(&uchan->lock);
>> +        mutex_unlock(&udev->lock);
>> +        ret = wait_event_interruptible(uchan->wq,
>> +                           (!udev->enabled ||
>> +                          !list_empty(&uchan->pending)));
>> +
>> +        mutex_lock(&udev->lock);
>> +        if (ret == -ERESTARTSYS) {
>> +            dev_dbg(dev, "Exit signal caught for node\n");
>> +            goto err_mtx_unlock;
>> +        }
>> +
>> +        if (!udev->enabled) {
>> +            ret = -ENODEV;
>> +            goto err_mtx_unlock;
>> +        }
>> +        spin_lock_bh(&uchan->lock);
>> +    }
>> +
>> +    /* new read, get the next descriptor from the list */
>> +    if (!uchan->cur_buf) {
>> +        ubuf = list_first_entry_or_null(&uchan->pending,
>> +                        struct uci_buf, node);
>> +        if (!ubuf) {
>> +            ret = -EIO;
>> +            goto err_spin_unlock;
>> +        }
>> +
>> +        list_del(&ubuf->node);
>> +        uchan->cur_buf = ubuf;
>> +        uchan->rx_size = ubuf->len;
>> +        dev_dbg(dev, "Got pkt of size: %zu\n", uchan->rx_size);
>> +    }
>> +
>> +    ubuf = uchan->cur_buf;
>> +
>> +    /* Copy the buffer to user space */
>> +    to_copy = min_t(size_t, count, uchan->rx_size);
>> +    ptr = ubuf->data + (ubuf->len - uchan->rx_size);
>> +    spin_unlock_bh(&uchan->lock);
>> +
>> +    ret = copy_to_user(buf, ptr, to_copy);
>> +    if (ret) {
>> +        ret = -EFAULT;
>> +        goto err_mtx_unlock;
>> +    }
>> +
>> +    spin_lock_bh(&uchan->lock);
>> +
>> +    dev_dbg(dev, "Copied %lu of %lu bytes\n", to_copy, uchan->rx_size);
>> +    uchan->rx_size -= to_copy;
>> +
>> +    /* we finished with this buffer, queue it back to hardware */
>> +    if (!uchan->rx_size) {
>> +        uchan->cur_buf = NULL;
>> +
>> +        if (udev->enabled)
>> +            ret = mhi_queue_buf(mhi_dev, DMA_FROM_DEVICE,
>> +                        ubuf->data,
>> +                        udev->actual_mtu, MHI_EOT);
>> +        else
>> +            ret = -ENODEV;
>> +
>> +        if (ret) {
>> +            dev_err(dev, "Failed to recycle element: %d\n", ret);
>> +            kfree(ubuf->data);
>> +            goto err_spin_unlock;
>> +        }
>> +    }
>> +    spin_unlock_bh(&uchan->lock);
>> +    mutex_unlock(&udev->lock);
>> +
>> +    dev_dbg(dev, "%s: Returning %lu bytes\n", __func__, to_copy);
>> +
>> +    return to_copy;
>> +
>> +err_spin_unlock:
>> +    spin_unlock_bh(&uchan->lock);
>> +err_mtx_unlock:
>> +    mutex_unlock(&udev->lock);
>> +    return ret;
>> +}
>> +
>> +static int mhi_uci_open(struct inode *inode, struct file *filp)
>> +{
>> +    struct uci_dev *udev = NULL;
>> +    unsigned int minor = iminor(inode);
>> +    int ret = -EIO;
>> +    struct uci_buf *buf_itr, *tmp;
>> +    struct uci_chan *dl_chan;
>> +    struct mhi_device *mhi_dev;
>> +    struct device *dev;
>> +
>> +    mutex_lock(&uci_idr_mutex);
>> +    udev = idr_find(&uci_idr, minor);
>> +    mutex_unlock(&uci_idr_mutex);
>> +    if (!udev) {
>> +        pr_err("uci dev: minor %d not found\n", minor);
>> +        ret = -ENODEV;
>> +        goto error_no_dev;
>> +    }
>> +
>> +    kref_get(&udev->ref_count);
>> +
>> +    mhi_dev = udev->mhi_dev;
> 
> mhi_dev never gets used.  You could use it down at the 
> prepare_for_transfer, but you don't.  Might as well just remove this 
> from the stack.
this was done to pass dev pointer instead of udev->mhi_dev->dev.
> 
>> +    dev = &mhi_dev->dev;
>> +
>> +    mutex_lock(&udev->lock);
>> +    if (kref_read(&udev->ref_count) > 2) {
>> +        dev_dbg(dev, "Node already opened\n");
>> +        goto exit_uci_open;
>> +    }
>> +
>> +    if (!udev->enabled) {
>> +        dev_info(dev, "Node exists, but is not in active state!\n");
>> +        goto error_open_chan;
>> +    }
>> +
>> +    dev_dbg(dev, "Starting channel\n");
>> +    ret = mhi_prepare_for_transfer(udev->mhi_dev);
>> +    if (ret) {
>> +        dev_err(dev, "Error starting transfer channels\n");
>> +        goto error_open_chan;
>> +    }
>> +
>> +    ret = mhi_queue_inbound(udev);
>> +    if (ret)
>> +        goto error_rx_queue;
>> +
>> +exit_uci_open:
>> +    filp->private_data = udev;
>> +    mutex_unlock(&udev->lock);
>> +
>> +    return 0;
>> +
>> +error_rx_queue:
>> +    dl_chan = &udev->dl_chan;
>> +    mhi_unprepare_from_transfer(udev->mhi_dev);
>> +    list_for_each_entry_safe(buf_itr, tmp, &dl_chan->pending, node) {
>> +        list_del(&buf_itr->node);
>> +        kfree(buf_itr->data);
>> +    }
>> +error_open_chan:
>> +    mutex_unlock(&udev->lock);
>> +    kref_put(&udev->ref_count, mhi_uci_dev_release);
>> +error_no_dev:
>> +    return ret;
>> +}
>> +
>> +static const struct file_operations mhidev_fops = {
>> +    .owner = THIS_MODULE,
>> +    .open = mhi_uci_open,
>> +    .release = mhi_uci_release,
>> +    .read = mhi_uci_read,
>> +    .write = mhi_uci_write,
>> +    .poll = mhi_uci_poll,
>> +};
>> +
>> +static void mhi_ul_xfer_cb(struct mhi_device *mhi_dev,
>> +               struct mhi_result *mhi_result)
>> +{
>> +    struct uci_dev *udev = dev_get_drvdata(&mhi_dev->dev);
>> +    struct uci_chan *uchan = &udev->ul_chan;
>> +    struct device *dev = &mhi_dev->dev;
>> +
>> +    dev_dbg(dev, "status: %d xfer_len: %zu\n",
>> +        mhi_result->transaction_status, mhi_result->bytes_xferd);
>> +
>> +    kfree(mhi_result->buf_addr);
>> +
>> +    if (!mhi_result->transaction_status)
>> +        wake_up(&uchan->wq);
>> +}
>> +
>> +static void mhi_dl_xfer_cb(struct mhi_device *mhi_dev,
>> +               struct mhi_result *mhi_result)
>> +{
>> +    struct uci_dev *udev = dev_get_drvdata(&mhi_dev->dev);
>> +    struct uci_chan *uchan = &udev->dl_chan;
>> +    struct device *dev = &mhi_dev->dev;
>> +    struct uci_buf *buf;
>> +
>> +    dev_dbg(dev, "status: %d receive_len: %zu\n",
>> +        mhi_result->transaction_status, mhi_result->bytes_xferd);
>> +
>> +    if (mhi_result->transaction_status == -ENOTCONN) {
>> +        kfree(mhi_result->buf_addr);
>> +        return;
>> +    }
>> +
>> +    spin_lock_bh(&uchan->lock);
>> +    buf = mhi_result->buf_addr + udev->actual_mtu;
>> +    buf->data = mhi_result->buf_addr;
>> +    buf->len = mhi_result->bytes_xferd;
>> +    list_add_tail(&buf->node, &uchan->pending);
>> +    spin_unlock_bh(&uchan->lock);
>> +
>> +    wake_up(&uchan->wq);
>> +}
>> +
>> +static int mhi_uci_probe(struct mhi_device *mhi_dev,
>> +             const struct mhi_device_id *id)
>> +{
>> +    struct uci_dev *udev;
>> +    struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
>> +    struct device *dev;
>> +    int index, dir;
>> +
>> +    udev = kzalloc(sizeof(*udev), GFP_KERNEL);
> 
> What if you defer creating the udev until the first open(), and tie the 
> xfer prepare state to the ref count of the udev instance?
With current implementation udev and minor are mapped using idr_alloc.
i was thinking about another option of adding kref for uci_chann object
to take care of channel and buffer ref count.
> 
>> +    if (!udev)
>> +        return -ENOMEM;
>> +
>> +    kref_init(&udev->ref_count);
>> +    mutex_init(&udev->lock);
>> +    udev->mhi_dev = mhi_dev;
>> +
>> +    mutex_lock(&udev->lock);
>> +
>> +    mutex_lock(&uci_idr_mutex);
>> +    index = idr_alloc(&uci_idr, udev, 0, MAX_UCI_MINORS, GFP_KERNEL);
>> +    mutex_unlock(&uci_idr_mutex);
>> +    if (index < 0) {
>> +        mutex_unlock(&udev->lock);
>> +        kfree(udev);
>> +        return index;
>> +    }
>> +
>> +    udev->minor = index;
>> +
>> +    /* create device file node 
>> /dev/mhi_<cntrl_dev_name>_<mhi_dev_name> */
>> +    dev = device_create(uci_dev_class, &mhi_dev->dev,
>> +                MKDEV(uci_dev_major, index), udev,
>> +                DEVICE_NAME "_%s_%s",
> 
> DEVICE_NAME is only used here.  Doesn't seem like having a macro is 
> providing much value.  I suggest just inlining the value.
> 
>> +                dev_name(mhi_cntrl->cntrl_dev), mhi_dev->name);
>> +    if (IS_ERR(dev)) {
>> +        mutex_lock(&uci_idr_mutex);
>> +        idr_remove(&uci_idr, udev->minor);
>> +        mutex_unlock(&uci_idr_mutex);
>> +        mutex_unlock(&udev->lock);
>> +        kfree(udev);
>> +        return PTR_ERR(dev);
>> +    }
>> +
>> +    for (dir = 0; dir < 2; dir++) {
>> +        struct uci_chan *uchan = (dir) ?
>> +            &udev->ul_chan : &udev->dl_chan;
>> +        spin_lock_init(&uchan->lock);
>> +        init_waitqueue_head(&uchan->wq);
>> +        INIT_LIST_HEAD(&uchan->pending);
>> +    }
>> +
>> +    udev->mtu = min_t(size_t, id->driver_data, MHI_MAX_MTU);
>> +    udev->actual_mtu = udev->mtu - sizeof(struct uci_buf);
> 
> "mtu" vs "actual_mtu" seems to be very confusing.  To start, why not 
> "tx_mtu" and "rx_mtu"?  But going from there, why have different mtus 
> for tx and rx?  Why not just increase the rx allocations by the required 
> "header" (struct uci_buf) as needed to keep symetry?
in past we had issues with order of 3 allocation failures for bigger mtu 
size, so we decided to use memory within the mtu buffer. i can add 
tx_mtu and rx_mtu if that makes it clear.
> 
>> +    dev_set_drvdata(&mhi_dev->dev, udev);
>> +    udev->enabled = true;
>> +
>> +    mutex_unlock(&udev->lock);
>> +
>> +    dev_info(&mhi_dev->dev, "probed uci dev: minor %d\n", index);
>> +
>> +    return 0;
>> +};
>> +
>> +static void mhi_uci_remove(struct mhi_device *mhi_dev)
>> +{
>> +    struct uci_dev *udev = dev_get_drvdata(&mhi_dev->dev);
>> +
>> +    mutex_lock(&udev->lock);
>> +
>> +    /* disable the node */
>> +    udev->enabled = false;
>> +
>> +    wake_up(&udev->dl_chan.wq);
>> +    wake_up(&udev->ul_chan.wq);
>> +
>> +    /* delete the node to prevent new opens */
>> +    device_destroy(uci_dev_class, MKDEV(uci_dev_major, udev->minor));
>> +
>> +    mutex_lock(&uci_idr_mutex);
>> +    idr_remove(&uci_idr, udev->minor);
>> +    mutex_unlock(&uci_idr_mutex);
>> +
>> +    mutex_unlock(&udev->lock);
>> +
>> +    kref_put(&udev->ref_count, mhi_uci_dev_release);
>> +}
>> +
>> +/* .driver_data stores max mtu */
>> +static const struct mhi_device_id mhi_uci_match_table[] = {
>> +    { .chan = "LOOPBACK", .driver_data = 0x1000},
>> +    {},
>> +};
>> +MODULE_DEVICE_TABLE(mhi, mhi_uci_match_table);
>> +
>> +static struct mhi_driver mhi_uci_driver = {
>> +    .id_table = mhi_uci_match_table,
>> +    .remove = mhi_uci_remove,
>> +    .probe = mhi_uci_probe,
>> +    .ul_xfer_cb = mhi_ul_xfer_cb,
>> +    .dl_xfer_cb = mhi_dl_xfer_cb,
>> +    .driver = {
>> +        .name = MHI_UCI_DRIVER_NAME,
>> +    },
>> +};
>> +
>> +static int mhi_uci_init(void)
>> +{
>> +    int ret;
>> +
>> +    ret = register_chrdev(0, MHI_UCI_DRIVER_NAME, &mhidev_fops);
>> +    if (ret < 0)
>> +        return ret;
>> +
>> +    uci_dev_major = ret;
>> +    uci_dev_class = class_create(THIS_MODULE, MHI_UCI_DRIVER_NAME);
>> +    if (IS_ERR(uci_dev_class)) {
>> +        unregister_chrdev(uci_dev_major, MHI_UCI_DRIVER_NAME);
>> +        return -ENODEV;
>> +    }
>> +
>> +    ret = mhi_driver_register(&mhi_uci_driver);
>> +    if (ret) {
>> +        class_destroy(uci_dev_class);
>> +        unregister_chrdev(uci_dev_major, MHI_UCI_DRIVER_NAME);
>> +    }
>> +
>> +    return ret;
>> +}
>> +
>> +static void __exit mhi_uci_exit(void)
>> +{
>> +    mhi_driver_unregister(&mhi_uci_driver);
>> +    class_destroy(uci_dev_class);
>> +    unregister_chrdev(uci_dev_major, MHI_UCI_DRIVER_NAME);
> 
> I think you need an idr_destroy() of uci_idr here.
Done.
> 
>> +}
>> +
>> +module_init(mhi_uci_init);
>> +module_exit(mhi_uci_exit);
>> +MODULE_LICENSE("GPL v2");
>> +MODULE_DESCRIPTION("MHI UCI Driver");
>>
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
