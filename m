Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C34D1D407D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2020 00:06:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728131AbgENWG3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 May 2020 18:06:29 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:12530 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726374AbgENWG2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 May 2020 18:06:28 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1589493987; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=Hj1N2jKjKwD50eXMUJusQrggcZuOhDXvmEEUAdk3NOw=; b=wB6s6FL2DFB72f8MOVtqmCGwC2qPggmKeCgE1B78QRVyRTmK23lEGB+gN6tw7IK5cW33nFSG
 rWpNCHnm6xi2+d85FHTkpEgeSix0tfh6QyPJdxTk/4eupt1TBUL+n3doQZUjXQY2E/3PdgrR
 I2C3yhD9+kONoMSDPi8EnwEPCi0=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 5ebdc0e25d62762fd49e92d3 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 14 May 2020 22:06:26
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id DDD20C43637; Thu, 14 May 2020 22:06:25 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.226.58.28] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 90CE3C433F2;
        Thu, 14 May 2020 22:06:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 90CE3C433F2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jhugo@codeaurora.org
Subject: Re: [RFC PATCH 5/8] qaic: Implement data path
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     gregkh <gregkh@linuxfoundation.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        wufan@codeaurora.org, pratanan@codeaurora.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <1589465266-20056-1-git-send-email-jhugo@codeaurora.org>
 <1589465266-20056-6-git-send-email-jhugo@codeaurora.org>
 <CAK8P3a34ks226S9UJMfCNdY3KWiBS+vscYdKwLW7wkLj0H_4Cw@mail.gmail.com>
From:   Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <a22412f9-4717-7097-3011-5be96f59e3c9@codeaurora.org>
Date:   Thu, 14 May 2020 16:06:23 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a34ks226S9UJMfCNdY3KWiBS+vscYdKwLW7wkLj0H_4Cw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Thanks for the review.

On 5/14/2020 3:36 PM, Arnd Bergmann wrote:
> On Thu, May 14, 2020 at 4:09 PM Jeffrey Hugo <jhugo@codeaurora.org> wrote:
>>
>> +struct dbc_req { /* everything must be little endian encoded */
> 
> Instead of the comment, I suppose you want to use __le16 and __le32
> types and let sparse check that you got it right.

Ah yes, I was curious if those should be applied here.  Their use seems 
inconsistent.  I will do that.

> 
>> +       u16     req_id;
>> +       u8      seq_id;
>> +       u8      cmd;
>> +       u32     resv;
>> +       u64     src_addr;
>> +       u64     dest_addr;
>> +       u32     len;
>> +       u32     resv2;
>> +       u64     db_addr; /* doorbell address */
>> +       u8      db_len; /* not a raw value, special encoding */
>> +       u8      resv3;
>> +       u16     resv4;
>> +       u32     db_data;
>> +       u32     sem_cmd0;
>> +       u32     sem_cmd1;
>> +       u32     sem_cmd2;
>> +       u32     sem_cmd3;
>> +} __packed;
> 
> All members are naturally aligned, so better drop the __packed
> annotation get better code, unless the structure itself is
> at an unaligned offset in memory.

I'm going to have to disagree.  While most "sane" compilers would not 
add extra padding, I've debugged enough issues in the past when 
sending/receiving data with foreign environments to never trust anything 
that isn't "packed".

Unless I missed something in the C spec that requires naturally aligned 
structures to have an identical layout in memory, I'll take safety and 
functional correctness over performance.

> 
>> +struct dbc_rsp { /* everything must be little endian encoded */
>> +       u16     req_id;
>> +       u16     status;
>> +} __packed;
> 
> Same here.
> 
>> +       init_completion(&mem->xfer_done);
>> +       list_add_tail(&mem->list, &dbc->xfer_list);
>> +       tail = (tail + mem->nents) % dbc->nelem;
>> +       __raw_writel(cpu_to_le32(tail), dbc->dbc_base + REQTP_OFF);
> 
> What is this __raw accessor for? This generally results in non-portable
> code that should be replaced with writel() or something specific to
> the bus on the architecture you deal with.

The barrier(s) that comes with writel are unnecessary in this case. 
Since this is part of our critical path, we are sensitive to its 
performance.

What are the portability issues around the __raw variant?

> 
>> +       spin_lock_irqsave(&qdev->dbc[exec->dbc_id].xfer_lock, flags);
>> +       req_id = qdev->dbc[exec->dbc_id].next_req_id++;
>> +       queued = mem->queued;
>> +       mem->queued = true;
>> +       spin_unlock_irqrestore(&qdev->dbc[exec->dbc_id].xfer_lock, flags);
> 
> No need for 'irqsave' locks when you know that interrupts are enabled.

Fair enough.

> 
>> +       head = le32_to_cpu(__raw_readl(dbc->dbc_base + RSPHP_OFF));
>> +       tail = le32_to_cpu(__raw_readl(dbc->dbc_base + RSPTP_OFF));
> 
> More __raw accessors to replace.

Same answer as before.

> 
>> +       case QAIC_IOCTL_MEM_NR:
>> +               if (_IOC_DIR(cmd) != (_IOC_READ | _IOC_WRITE) ||
>> +                   _IOC_SIZE(cmd) != sizeof(struct qaic_mem_req)) {
>> +                       ret = -EINVAL;
>> +                       break;
> 
> This looks like a very verbose way to check 'cmd' against a known
> constant. Why not use 'switch (cmd)' like all other drivers?

Huh.  That actually does sound more elegant.  Will do.


-- 
Jeffrey Hugo
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
