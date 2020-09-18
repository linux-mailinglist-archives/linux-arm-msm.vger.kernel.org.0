Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 995A82703CC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Sep 2020 20:14:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726118AbgIRSOo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Sep 2020 14:14:44 -0400
Received: from so254-54.mailgun.net ([198.61.254.54]:49362 "EHLO
        so254-54.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726121AbgIRSOn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Sep 2020 14:14:43 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1600452883; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=O75c0CeERH4wHTd3fACg+X+szRd6Gel5m6fuBbBhOqU=; b=JJFZAO50Z5A8w9U4XKM98UFPnd8371KhWXm4sYp5p7/K4j3Dt4cPuqOGWZj8FkufJBCQ9hYq
 jnO8AVxSvlE1aPrkoo5m6gBr9Mlj+WcAt2vdj4qf3ogaUgDpSgjd51pDhw1gTpYDBswcxQah
 FhfkAZvS0fkuE7uAPOswYQwrzYY=
X-Mailgun-Sending-Ip: 198.61.254.54
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 5f64f8f2ea858627d565f7fc (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 18 Sep 2020 18:14:10
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 115C9C433CB; Fri, 18 Sep 2020 18:14:10 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=ham autolearn_force=no version=3.4.0
Received: from [10.46.162.249] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: hemantk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 422A9C433C8;
        Fri, 18 Sep 2020 18:14:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 422A9C433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=hemantk@codeaurora.org
Subject: Re: [PATCH v6 4/4] bus: mhi: Add userspace client interface driver
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     manivannan.sadhasivam@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, jhugo@codeaurora.org,
        bbhatt@codeaurora.org
References: <1600286167-4432-1-git-send-email-hemantk@codeaurora.org>
 <1600286167-4432-5-git-send-email-hemantk@codeaurora.org>
 <20200917164419.GC721081@kroah.com>
From:   Hemant Kumar <hemantk@codeaurora.org>
Message-ID: <4e60cac3-d680-93ea-922e-bd4f22cf3f0a@codeaurora.org>
Date:   Fri, 18 Sep 2020 11:14:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20200917164419.GC721081@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Greg,

On 9/17/20 9:44 AM, Greg KH wrote:
> On Wed, Sep 16, 2020 at 12:56:07PM -0700, Hemant Kumar wrote:
...
...
>> +
>> +static int mhi_uci_open(struct inode *inode, struct file *filp)
>> +{
>> +	struct uci_dev *udev = NULL;
>> +	unsigned int minor = iminor(inode);
>> +	int ret = -EIO;
>> +	struct uci_buf *buf_itr, *tmp;
>> +	struct uci_chan *dl_chan;
>> +	struct mhi_device *mhi_dev;
>> +	struct device *dev;
>> +
>> +	mutex_lock(&uci_idr_mutex);
>> +	udev = idr_find(&uci_idr, minor);
>> +	mutex_unlock(&uci_idr_mutex);
>> +	if (!udev) {
>> +		pr_err("uci dev: minor %d not found\n", minor);
> 
> Don't spam the kernel log for things that users can do :(
i will change it to a pr_debug, as it helps to debug why open() is failing.
> 
>> +		ret = -ENODEV;
>> +		goto error_no_dev;
>> +	}
>> +
>> +	kref_get(&udev->ref_count);
> 
> Why grab a reference?  What does that help with?
In case open() and driver remove() are racing, it helps to prevent use 
after free of udev in open().
> 
>> +
>> +	mhi_dev = udev->mhi_dev;
>> +	dev = &mhi_dev->dev;
>> +
>> +	mutex_lock(&udev->lock);
>> +	if (kref_read(&udev->ref_count) > 2) {
>> +		dev_dbg(dev, "Node already opened\n");
> 
> Nope, this is NOT doing what you think it is doing.
> 
> I told you before, do not try to keep a device node from being opened
> multiple times, as it will always fail (think about passing file handles
> around between programs...)
> 
> If userspace wants to do this, it will do it.  If your driver can't
> handle that, that's fine, userspace will learn not to do that.  But the
> kernel can not prevent this from happening.
This check is not returning error, instead just setting 
filp->private_data = udev; and return 0; It is skipping channel prepare
and queuing of inbound buffers which was done by first open().
> 
> Also note that reading a kref value is a HUGE sign that the code is
> incorrect, you should never care about the value of a reference.  Maybe
> if it is 0, but that's a special case...
In previous patch this was done using separate open reference count and
after removing that i was relying on udev ref count. MHI channel prepare
and buffer allocation for a give channel suppose to happen at open() and
only for first open() call.
> 
> Anyway, given that you ignored my previous review comments here, I'm
> loath to keep reviewing this patch series.  Please get others to review
> it first before sending it back as I don't like being the only one doing
> this type of work...
Thanks for reviewing my patch series Greg and help making it a better 
driver!
> 
> thanks,
> 
> greg k-h
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
