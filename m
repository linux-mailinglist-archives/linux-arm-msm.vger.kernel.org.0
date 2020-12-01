Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E11CA2CA9D7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Dec 2020 18:37:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387716AbgLARh3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Dec 2020 12:37:29 -0500
Received: from m42-5.mailgun.net ([69.72.42.5]:45369 "EHLO m42-5.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728574AbgLARh3 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Dec 2020 12:37:29 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1606844223; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=lExQYH3Hcu6IMfr6Uk4+ulaceeEs8V2qygtLsani6Fo=; b=jrzHYtyp6agM8LHEjDeF3snAx7m35ABlT/CRFfEmxriWO/aYKj44/BCB48c5nx+RJaG0MFm3
 p+lTthHghb3vlPKOGFM5TS1fgGj3Z0fUwjUoU5ZPvWdg7zY33Qsp7sQGvgEnpwzTe83jS0Ps
 N/6jCTzHDBARfVcWiK2z1Ivgm0s=
X-Mailgun-Sending-Ip: 69.72.42.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 5fc67f3f875646f1e977970c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 01 Dec 2020 17:37:03
 GMT
Sender: jhugo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id CA943C43461; Tue,  1 Dec 2020 17:37:02 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.226.59.216] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 87A5CC43460;
        Tue,  1 Dec 2020 17:37:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 87A5CC43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jhugo@codeaurora.org
Subject: Re: [PATCH v13 4/4] bus: mhi: Add userspace client interface driver
To:     Loic Poulain <loic.poulain@linaro.org>,
        Hemant Kumar <hemantk@codeaurora.org>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Bhaumik Bhatt <bbhatt@codeaurora.org>,
        Network Development <netdev@vger.kernel.org>
References: <1606533966-22821-1-git-send-email-hemantk@codeaurora.org>
 <1606533966-22821-5-git-send-email-hemantk@codeaurora.org>
 <CAMZdPi8z+-qFqgZ7AFJcNAUMbDQtNN5Hz-geMBcp4azrUGm9iA@mail.gmail.com>
 <c47dcd57-7576-e03e-f70b-0c4d25f724b5@codeaurora.org>
 <CAMZdPi8mUV5cFs-76K3kg=hN8ht2SKjJwzbJH-+VH4Y8QabcHQ@mail.gmail.com>
From:   Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <1247e32e-ed67-de6b-81ec-3bde9ad93250@codeaurora.org>
Date:   Tue, 1 Dec 2020 10:37:00 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CAMZdPi8mUV5cFs-76K3kg=hN8ht2SKjJwzbJH-+VH4Y8QabcHQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/1/2020 10:36 AM, Loic Poulain wrote:
> On Tue, 1 Dec 2020 at 02:16, Hemant Kumar <hemantk@codeaurora.org> wrote:
>>
>> Hi Loic,
>>
>> On 11/30/20 10:22 AM, Loic Poulain wrote:
>>> On Sat, 28 Nov 2020 at 04:26, Hemant Kumar <hemantk@codeaurora.org> wrote:
>>>>
>>>> This MHI client driver allows userspace clients to transfer
>>>> raw data between MHI device and host using standard file operations.
>>>> Driver instantiates UCI device object which is associated to device
>>>> file node. UCI device object instantiates UCI channel object when device
>>>> file node is opened. UCI channel object is used to manage MHI channels
>>>> by calling MHI core APIs for read and write operations. MHI channels
>>>> are started as part of device open(). MHI channels remain in start
>>>> state until last release() is called on UCI device file node. Device
>>>> file node is created with format
>>>
>>> [...]
>>>
>>>> +struct uci_chan {
>>>> +       struct uci_dev *udev;
>>>> +       wait_queue_head_t ul_wq;
>>>> +
>>>> +       /* ul channel lock to synchronize multiple writes */
>>>> +       struct mutex write_lock;
>>>> +
>>>> +       wait_queue_head_t dl_wq;
>>>> +
>>>> +       /* dl channel lock to synchronize multiple reads */
>>>> +       struct mutex read_lock;
>>>> +
>>>> +       /*
>>>> +        * protects pending list in bh context, channel release, read and
>>>> +        * poll
>>>> +        */
>>>> +       spinlock_t dl_pending_lock;
>>>> +
>>>> +       struct list_head dl_pending;
>>>> +       struct uci_buf *cur_buf;
>>>> +       size_t dl_size;
>>>> +       struct kref ref_count;
>>>> +};
>>>
>>> [...]
>>>
>>>> + * struct uci_dev - MHI UCI device
>>>> + * @minor: UCI device node minor number
>>>> + * @mhi_dev: associated mhi device object
>>>> + * @uchan: UCI uplink and downlink channel object
>>>> + * @mtu: max TRE buffer length
>>>> + * @enabled: Flag to track the state of the UCI device
>>>> + * @lock: mutex lock to manage uchan object
>>>> + * @ref_count: uci_dev reference count
>>>> + */
>>>> +struct uci_dev {
>>>> +       unsigned int minor;
>>>> +       struct mhi_device *mhi_dev;
>>>> +       struct uci_chan *uchan;
>>>
>>> Why a pointer to uci_chan and not just plainly integrating the
>>> structure here, AFAIU uci_chan describes the channels and is just a
>>> subpart of uci_dev. That would reduce the number of dynamic
>>> allocations you manage and the extra kref. do you even need a separate
>>> structure for this?
>>
>> This goes back to one of my patch versions i tried to address concern
>> from Greg. Since we need to ref count the channel as well as the uci
>> device i decoupled the two objects and used two reference counts for two
>> different objects.
> 
> What Greg complained about is the two kref in the same structure and
> that you were using kref as an open() counter. But splitting your
> struct in two in order to keep the two kref does not make the much
> code better (and simpler). I'm still a bit puzzled about the driver
> complexity, it's supposed to be just a passthrough interface to MHI
> after all.
> 
> I would suggest several changes, that IMHO would simplify reviewing:
> - Use only one structure representing the 'uci' context (uci_dev)
> - Keep the read path simple (mhi_uci_read), do no use an intermediate
> cur_buf pointer, only dequeue the buffer when it is fully consumed.
> - As I commented before, take care of the dl_pending list access
> concurrency, even in wait_event.
> - You don't need to count the number of open() calls, AFAIK,
> mhi_prepare_for_transfer() simply fails if channels are already
> started...

Unless I missed something, you seem to have ignored the root issue that 
Hemant needs to solve, which is when to call 
mhi_unprepare_for_transfer().  You can't just call that when close() is 
called because there might be multiple users, and each one is going to 
trigger a close(), so you need to know how many close() instances to 
expect, and only call mhi_unprepare_for_transfer() for the last one.

-- 
Jeffrey Hugo
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
