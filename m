Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D785C29679F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Oct 2020 01:25:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S373335AbgJVXZP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Oct 2020 19:25:15 -0400
Received: from m42-4.mailgun.net ([69.72.42.4]:37984 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S373361AbgJVXZO (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Oct 2020 19:25:14 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1603409113; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=7RS3WmnFO6lzb/dbTyH+68KVi2Ps4HU4TjXSx+rxCds=; b=mFq79LaCNr7/szlOKBh599xpA0rGfZ+FtmzV5RkeFfjEULFN9XJEy2z6JxMtUXGp1zCf+n/Z
 kEq1vrUfxbmsfyi1XUcJcc+p2DzCAgk2FkVC2hb9FNF/14cvG8MV5ZmvJvdi8+Xp2JN6TUkY
 BzVP78pzUUEuVzDMFmCIbPoUd+Y=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 5f9214d76308b7b0f94c2e54 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 22 Oct 2020 23:25:11
 GMT
Sender: hemantk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D4347C433FE; Thu, 22 Oct 2020 23:25:10 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.46.162.249] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: hemantk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 91CEFC433C9;
        Thu, 22 Oct 2020 23:25:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 91CEFC433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=hemantk@codeaurora.org
Subject: Re: [PATCH v8 4/4] bus: mhi: Add userspace client interface driver
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Bhaumik Bhatt <bbhatt@codeaurora.org>
References: <1603354958-24025-1-git-send-email-hemantk@codeaurora.org>
 <1603354958-24025-5-git-send-email-hemantk@codeaurora.org>
 <CAMZdPi_e4V+Bs5FSqZ4G=CTxJfJi5AZY1kXJESWMxEtT=TwNZg@mail.gmail.com>
From:   Hemant Kumar <hemantk@codeaurora.org>
Message-ID: <737e3445-ba4c-b80c-2da4-d33d499d96c6@codeaurora.org>
Date:   Thu, 22 Oct 2020 16:25:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAMZdPi_e4V+Bs5FSqZ4G=CTxJfJi5AZY1kXJESWMxEtT=TwNZg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Loic,

On 10/22/20 3:20 AM, Loic Poulain wrote:
> Hi Hemant,
> 
> A few comments inline.
> 
> On Thu, 22 Oct 2020 at 10:22, Hemant Kumar <hemantk@codeaurora.org> wrote:
>>
>> This MHI client driver allows userspace clients to transfer
>> raw data between MHI device and host using standard file operations.
>> Driver instantiates UCI device object which is associated to device
>> file node. UCI device object instantiates UCI channel object when device
>> file node is opened. UCI channel object is used to manage MHI channels
>> by calling MHI core APIs for read and write operations. MHI channels
>> are started as part of device open(). MHI channels remain in start
>> state until last release() is called on UCI device file node. Device
>> file node is created with format
>>
[..]
>> +
>> +/**
>> + * struct uci_chan - MHI channel for a UCI device
>> + * @udev: associated UCI device object
>> + * @ul_wq: wait queue for writer
>> + * @write_lock: mutex write lock for ul channel
>> + * @dl_wq: wait queue for reader
>> + * @read_lock: mutex read lock for dl channel
>> + * @dl_lock: spin lock
>> + * @pending: list of dl buffers userspace is waiting to read
>> + * @cur_buf: current buffer userspace is reading
>> + * @dl_size: size of the current dl buffer userspace is reading
>> + * @ref_count: uci_chan reference count
>> + */
>> +struct uci_chan {
>> +       struct uci_dev *udev;
>> +       wait_queue_head_t ul_wq;
>> +
>> +       /* ul channel lock to synchronize multiple writes */
>> +       struct mutex write_lock;
>> +
>> +       wait_queue_head_t dl_wq;
>> +
>> +       /* dl channel lock to synchronize multiple reads */
>> +       struct mutex read_lock;
>> +
>> +       /*
>> +        * protects pending and cur_buf members in bh context, channel release,
>> +        * read and poll
>> +        */
>> +       spinlock_t dl_lock;
> 
> Maybe I'm wrong, but I think it would be clearer and simpler for
> dl_lock to be only a lock for the pending RX list (e.g. pending_lock),
> for protecting against concurrent access in chardev read ops
> (consumer) and MHI download callback (producer). cur_buf is the
> currently read buffer, and so could be simply protected by the
> read_lock mutex (never accessed from bh/irq callback context).
You have a good point. I can protect pending list related operations 
using spin lock and call it pending_lock which would be used in dl_xfer 
call back, channel release, read and poll. Use read lock for cur_buf in 
read().
> 
>> +
>> +       struct list_head pending;
>> +       struct uci_buf *cur_buf;
>> +       size_t dl_size;
>> +       struct kref ref_count;
>> +};
>> +
>> +/**
[..]
>> +static void mhi_dl_xfer_cb(struct mhi_device *mhi_dev,
>> +                          struct mhi_result *mhi_result)
>> +{
>> +       struct uci_dev *udev = dev_get_drvdata(&mhi_dev->dev);
>> +       struct uci_chan *uchan = udev->uchan;
>> +       struct device *dev = &mhi_dev->dev;
>> +       struct uci_buf *ubuf;
>> +       size_t dl_buf_size = udev->mtu - sizeof(*ubuf);
>> +
>> +       dev_dbg(dev, "status: %d receive_len: %zu\n",
>> +               mhi_result->transaction_status, mhi_result->bytes_xferd);
>> +
>> +       if (mhi_result->transaction_status == -ENOTCONN) {
>> +               kfree(mhi_result->buf_addr);
>> +               return;
>> +       }
> 
> It would be more robust to test only transaction_status values that
> allow you to consider the buffer as valid, AFAIU 0 and -EOVERFLOW.
> That would prevent breaking that code if new transaction_status errors
> are returned in the futur (e.g. -EIO...).
I agree, will use this instead
if (mhi_result->transaction_status &&
		mhi_result->transaction_status != -EOVERFLOW)
> 
> 
>> +
>> +       ubuf = mhi_result->buf_addr + dl_buf_size;
>> +       ubuf->data = mhi_result->buf_addr;
>> +       ubuf->len = mhi_result->bytes_xferd;
>> +       spin_lock_bh(&uchan->dl_lock);
>> +       list_add_tail(&ubuf->node, &uchan->pending);
>> +       spin_unlock_bh(&uchan->dl_lock);
>> +
>> +       wake_up(&uchan->dl_wq);
>> +}
>> +

Thanks,
Hemant
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
