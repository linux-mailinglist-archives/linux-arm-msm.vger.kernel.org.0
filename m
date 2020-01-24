Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5CABE148D9F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2020 19:13:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403873AbgAXSNB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Jan 2020 13:13:01 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:59880 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2390883AbgAXSNB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Jan 2020 13:13:01 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1579889580; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=b3rQPo2ZO9T4a2ztTx0JcuZNEwjKNFB8Ft1Jm7KJLrw=; b=ubUPEF6yJqrqS5xC4ASozuSC3UOBS42l5b4zACRh06rj9oHiSF8Myl+B3G4IMliX3UZzewVF
 iEPFd9PYapCpr5BOpHKopXeRtobJiuYOqrjOIiv2PwEQijUeFjsE6cvkNFASVVFzjakraTMV
 lPD7Vks0ABkx/GowX/eI2eudIL4=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e2b33ab.7f7dca68cce0-smtp-out-n01;
 Fri, 24 Jan 2020 18:12:59 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 0F2BFC447A1; Fri, 24 Jan 2020 18:12:59 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.0
Received: from [10.226.58.28] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 1724FC447A9;
        Fri, 24 Jan 2020 18:12:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 1724FC447A9
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
From:   Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <e32b0a53-ce95-6d73-46c6-76d17af37146@codeaurora.org>
Date:   Fri, 24 Jan 2020 11:12:57 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20200124174707.GB3417153@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 1/24/2020 10:47 AM, Greg KH wrote:
> On Fri, Jan 24, 2020 at 07:24:43AM -0700, Jeffrey Hugo wrote:
>>>> +/**
>>>> + * struct mhi_result - Completed buffer information
>>>> + * @buf_addr: Address of data buffer
>>>> + * @dir: Channel direction
>>>> + * @bytes_xfer: # of bytes transferred
>>>> + * @transaction_status: Status of last transaction
>>>> + */
>>>> +struct mhi_result {
>>>> +	void *buf_addr;
>>>
>>> Why void *?
>>
>> Because its not possible to resolve this more clearly.  The client provides
>> the buffer and knows what the structure is.  The bus does not. Its just an
>> opaque pointer (hence void *) to the bus, and the client needs to decode it.
>> This is the struct that is handed to the client to allow them to decode the
>> activity (either a received buf, or a confirmation that a transmitted buf
>> has been consumed).
> 
> Then shouldn't this be a "u8 *" instead as you are saying how many bytes
> are here?

I'm sorry, I don't see the benefit of that.  Can you elaborate on why 
you think that u8 * is a better type?

Sure, its an arbitrary byte stream from the perspective of the bus, but 
to the client, 99% of the time its going to have some structure.

In the call back, the first thing the client is likely to do is:
struct my_struct *s = buf_addr;

This works great when its a void *.  If buf_addr is a u8 *, that's not 
valid, and will result in a compiler error (at-least per gcc 5.4.0).
With u8 *, the client has to do:
struct my_struct *s = (struct my_struct *)buf_addr;

I don't see a benefit to u8 * over void * in this case.

The only possibly benefit I might see is if the client wants to use 
buf_addr as an array to poke into it and maybe check a magic number, but 
that assumes said magic number is a u8.  Otherwise the client has to do 
an explicit cast.  It seems like such a small amount of the time that 
usecase would be valid, that its not worth it to cater to it.

rpmsg, as one example, does the exact same thing where the received 
buffer is a void *, and there is a size parameter.

-- 
Jeffrey Hugo
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
