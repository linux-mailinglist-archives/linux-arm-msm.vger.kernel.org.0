Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 15FD3149CEF
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Jan 2020 22:00:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727141AbgAZVAQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 26 Jan 2020 16:00:16 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:13933 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726252AbgAZVAP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 26 Jan 2020 16:00:15 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1580072414; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=Hz11HlXbttHrNktsF36XdxslZ5eQec29mApDdAB4Q7A=; b=Nk2o6z7JXax4Uy/oS3akYZFQShRodP/2a0C8uD/teM18edUMO+DSn1vGegvUOl6SC3A3rXAa
 SyUZRNDUSplj7u+7AJmzdxWFvw9P+hsW8GFLGlIR6pC1bhKI8EUGy5+LhyScPVmxZQSnWndn
 I1jfs1c0pBQu7WzGPb5znq2Zflc=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e2dfdd7.7f7338b0f650-smtp-out-n02;
 Sun, 26 Jan 2020 21:00:07 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 5BB43C4479F; Sun, 26 Jan 2020 21:00:07 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.226.58.28] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E9AADC43383;
        Sun, 26 Jan 2020 21:00:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E9AADC43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jhugo@codeaurora.org
Subject: Re: [PATCH 02/16] bus: mhi: core: Add support for registering MHI
 controllers
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        arnd@arndb.de, smohanad@codeaurora.org, kvalo@codeaurora.org,
        bjorn.andersson@linaro.org, hemantk@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200123111836.7414-1-manivannan.sadhasivam@linaro.org>
 <20200123111836.7414-3-manivannan.sadhasivam@linaro.org>
 <20200124082939.GA2921617@kroah.com>
 <42c79181-9d97-3542-c6b0-1e37f9b2ff39@codeaurora.org>
 <20200124174707.GB3417153@kroah.com>
 <e32b0a53-ce95-6d73-46c6-76d17af37146@codeaurora.org>
 <20200125132615.GA3516435@kroah.com>
From:   Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <21a513d8-225b-9543-1b61-bcb1e77a1b1e@codeaurora.org>
Date:   Sun, 26 Jan 2020 14:00:05 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20200125132615.GA3516435@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 1/25/2020 6:26 AM, Greg KH wrote:
> On Fri, Jan 24, 2020 at 11:12:57AM -0700, Jeffrey Hugo wrote:
>> On 1/24/2020 10:47 AM, Greg KH wrote:
>>> On Fri, Jan 24, 2020 at 07:24:43AM -0700, Jeffrey Hugo wrote:
>>>>>> +/**
>>>>>> + * struct mhi_result - Completed buffer information
>>>>>> + * @buf_addr: Address of data buffer
>>>>>> + * @dir: Channel direction
>>>>>> + * @bytes_xfer: # of bytes transferred
>>>>>> + * @transaction_status: Status of last transaction
>>>>>> + */
>>>>>> +struct mhi_result {
>>>>>> +	void *buf_addr;
>>>>>
>>>>> Why void *?
>>>>
>>>> Because its not possible to resolve this more clearly.  The client provides
>>>> the buffer and knows what the structure is.  The bus does not. Its just an
>>>> opaque pointer (hence void *) to the bus, and the client needs to decode it.
>>>> This is the struct that is handed to the client to allow them to decode the
>>>> activity (either a received buf, or a confirmation that a transmitted buf
>>>> has been consumed).
>>>
>>> Then shouldn't this be a "u8 *" instead as you are saying how many bytes
>>> are here?
>>
>> I'm sorry, I don't see the benefit of that.  Can you elaborate on why you
>> think that u8 * is a better type?
>>
>> Sure, its an arbitrary byte stream from the perspective of the bus, but to
>> the client, 99% of the time its going to have some structure.
> 
> So which side is in control here, the "bus" or the "client"?  For the
> bus to care, it's a bytestream and should be represented as such (like
> you have) with a number of bytes in the "packet". >
> If you already know the structure types, just make a union of all of the
> valid ones and be done with it.  In other words, try to avoid using void
> * as much as is ever possible please.

The client is in control.  Perhaps if you think of this like a NIC - the 
NIC is a dumb pipe that you shove bytes into and get bytes out of.  The 
NIC doesn't know or care what the bytes are, only that it performs its 
responsibilities of successfully moving those bytes through the pipe. 
The bytes could be a TCP packet, UDP packet, raw IP packet, or something 
entirely different.  The NIC doesn't need to know, nor care.

MHI is a little one sided because its designed so that the Host is in 
control for the most part.

In the transmit path, the client on the Host gives the bus a stream of 
bytes.  The DMA-able address of that stream of bytes is put into the bus 
structures, and the doorbell is rung.  Then the device pulls in the data.

In the receive path, the client on the host gives the bus a receive 
buffer.  The DMA-able address of that buffer is put into the bus 
structures.  When the device wants to send data to the host, it picks up 
the buffer address, copies the data into it, and then flags an event to 
the Host.

This structure we are discussing is used in the callback from the bus to 
the client to either signal that the TX buffer has been consumed by the 
device and is now back under the control of the client, or that the 
device has consumed a queued RX buffer, and now the buffer is back under 
the control of the client and can be read to determine what data the 
device sent.

In both cases, its impossible for the bus to know the structure or 
content of the data.  All the bus knows or cares about is the location 
and size of the buffer.  Its entirely up to the control of the client. 
The client could be the network stack, in which case the data is 
probably an IP packet.  The client could be entirely something else 
where the client protocol running over MHI is entirely unique to that 
client.

Since MHI supports arbitrary clients, its impossible to come up with 
some kind of union that describes every possible client's structure 
definitions from now until the end of time.

void * is the only type that makes realistic sense.

-- 
Jeffrey Hugo
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
