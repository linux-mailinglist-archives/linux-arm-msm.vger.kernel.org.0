Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3143B1D9973
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2020 16:23:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728837AbgESOXp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 May 2020 10:23:45 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:32425 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728725AbgESOXp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 May 2020 10:23:45 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1589898224; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=zgED/ndZHabjc446rJZWog4aE0Cl1Q+S59WZU+Bl6ws=; b=tBIesUtQkd5ggdeugfvw5AVp2BsCh80sS1bw35oxMUPSYgHLLYt90Q6pnvox8eq/l1bExnzj
 LKip3ptQfh1KiLuX07BWDcHgPFCt8EL704DSQWcnlOJNEB5nybvEll1pCDoTBsRkgo3n1KJI
 Ir019BPhYOkAdUdbXySBCudkyWg=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ec3ebe0.7f0bdba0aab0-smtp-out-n01;
 Tue, 19 May 2020 14:23:28 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id CC62FC43636; Tue, 19 May 2020 14:23:27 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.226.58.28] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 92721C432C2;
        Tue, 19 May 2020 14:23:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 92721C432C2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jhugo@codeaurora.org
Subject: Re: [PATCH v1 3/3] bus: mhi: clients: Add user space client interface
 driver
To:     Hemant Kumar <hemantk@codeaurora.org>,
        manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        bbhatt@codeaurora.org
References: <1589840619-18520-1-git-send-email-hemantk@codeaurora.org>
 <1589840619-18520-4-git-send-email-hemantk@codeaurora.org>
From:   Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <3ee9c396-d1e3-d50a-cd27-7b88f84cb37f@codeaurora.org>
Date:   Tue, 19 May 2020 08:23:25 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <1589840619-18520-4-git-send-email-hemantk@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 5/18/2020 4:23 PM, Hemant Kumar wrote:
> +static ssize_t mhi_uci_read(struct file *file,
> +			    char __user *buf,
> +			    size_t count,
> +			    loff_t *ppos)
> +{
> +	struct uci_dev *uci_dev = file->private_data;
> +	struct mhi_device *mhi_dev = uci_dev->mhi_dev;
> +	struct uci_chan *uci_chan = &uci_dev->dl_chan;
> +	struct device *dev = &mhi_dev->dev;
> +	struct uci_buf *uci_buf;
> +	char *ptr;
> +	size_t to_copy;
> +	int ret = 0;
> +
> +	if (!buf)
> +		return -EINVAL;
> +
> +	dev_dbg(dev, "Client provided buf len:%lu\n", count);
> +
> +	/* confirm channel is active */
> +	spin_lock_bh(&uci_chan->lock);
> +	if (!uci_dev->enabled) {
> +		spin_unlock_bh(&uci_chan->lock);
> +		return -ERESTARTSYS;
> +	}
> +
> +	/* No data available to read, wait */
> +	if (!uci_chan->cur_buf && list_empty(&uci_chan->pending)) {
> +		dev_dbg(dev, "No data available to read waiting\n");
> +
> +		spin_unlock_bh(&uci_chan->lock);
> +		ret = wait_event_interruptible(uci_chan->wq,
> +					       (!uci_dev->enabled ||
> +					      !list_empty(&uci_chan->pending)));
> +		if (ret == -ERESTARTSYS) {
> +			dev_dbg(dev, "Exit signal caught for node\n");
> +			return -ERESTARTSYS;
> +		}
> +
> +		spin_lock_bh(&uci_chan->lock);
> +		if (!uci_dev->enabled) {
> +			dev_dbg(dev, "node is disabled\n");
> +			ret = -ERESTARTSYS;
> +			goto read_error;
> +		}
> +	}
> +
> +	/* new read, get the next descriptor from the list */
> +	if (!uci_chan->cur_buf) {
> +		uci_buf = list_first_entry_or_null(&uci_chan->pending,
> +						   struct uci_buf, node);
> +		if (unlikely(!uci_buf)) {
> +			ret = -EIO;
> +			goto read_error;
> +		}
> +
> +		list_del(&uci_buf->node);
> +		uci_chan->cur_buf = uci_buf;
> +		uci_chan->rx_size = uci_buf->len;
> +		dev_dbg(dev, "Got pkt of size:%zu\n", uci_chan->rx_size);
> +	}
> +
> +	uci_buf = uci_chan->cur_buf;
> +
> +	/* Copy the buffer to user space */
> +	to_copy = min_t(size_t, count, uci_chan->rx_size);
> +	ptr = uci_buf->data + (uci_buf->len - uci_chan->rx_size);
> +	spin_unlock_bh(&uci_chan->lock);

This presents a race condition.  Imagine if you will, two processes are 
in read() at the same time.  They will be contending for the lock.  One 
will win, and enter the above critical section.  As soon as the winner 
gets here and unlocks the lock, the loser will get the lock and enter 
the critical section.  There is a possibility that both processes get to 
this point at roughly the same time, and thus both have a cached version 
of the identical cur_buf pointer.  At this point, bad things can happen.

If both processes consume the entire buffer, they will then both 
re-queue the buffer to MHI.  You then can cause memory corruption, and a 
kernel crash if the buffer is consumed, then freed, then the memory is 
allocated to somewhere else in the kernel, then MHI consumed the buffer 
again (memory corruption).  If the buffer gets freed again, slub may 
trigger a BUG_ON if the allocation for elsewhere is completely different 
in structure.

I think you need a mutex covering the entire read() operation to 
serialize it.

> +
> +	ret = copy_to_user(buf, ptr, to_copy);
> +	if (ret)
> +		return ret;
> +
> +	spin_lock_bh(&uci_chan->lock);
> +
> +	/* Buffer already queued from diff thread while we dropped lock */
> +	if (to_copy && !uci_chan->rx_size) {
> +		dev_dbg(dev, "Bailout as buffer already queued (%lu %lu)\n",
> +			to_copy, uci_chan->rx_size);
> +		goto read_error;
> +	}
> +
> +	dev_dbg(dev, "Copied %lu of %lu bytes\n", to_copy, uci_chan->rx_size);
> +	uci_chan->rx_size -= to_copy;
> +
> +	/* we finished with this buffer, queue it back to hardware */
> +	if (!uci_chan->rx_size) {
> +		uci_chan->cur_buf = NULL;
> +
> +		if (uci_dev->enabled)
> +			ret = mhi_queue_buf(mhi_dev, DMA_FROM_DEVICE,
> +					    uci_buf->data,
> +					    uci_dev->actual_mtu, MHI_EOT);
> +		else
> +			ret = -ERESTARTSYS;
> +
> +		if (ret) {
> +			dev_err(dev, "Failed to recycle element\n");
> +			kfree(uci_buf->data);
> +			goto read_error;
> +		}
> +	}
> +	spin_unlock_bh(&uci_chan->lock);
> +
> +	dev_dbg(dev, "Returning %lu bytes\n", to_copy);
> +
> +	return to_copy;
> +
> +read_error:
> +	spin_unlock_bh(&uci_chan->lock);
> +
> +	return ret;
> +}
> +



-- 
Jeffrey Hugo
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
