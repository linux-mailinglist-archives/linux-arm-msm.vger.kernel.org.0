Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE85B315416
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Feb 2021 17:41:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232983AbhBIQkk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Feb 2021 11:40:40 -0500
Received: from so15.mailgun.net ([198.61.254.15]:44179 "EHLO so15.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232972AbhBIQkX (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Feb 2021 11:40:23 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1612888793; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=mQCwxFFSXafw6XxuGbR0UZRSX80djScErIhHBoGB1Xs=;
 b=lR+Sj2jLPur3Bsp7z3tyL1G1PS/BGBWvTFmANBE+CxKGvjKUQHUxuwWX6GlgDCtWuUTyCXII
 uWmqab3cbBmMSDzgbU0Fp+1XXWAQiqtsNY90x1Ls2Ql78bitWc0ubZRiS4FfTb+1oL/V5q9w
 rXteVGJ+mXCqjoryGwPabbo3/Hw=
X-Mailgun-Sending-Ip: 198.61.254.15
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 6022babae4842e91282939aa (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 09 Feb 2021 16:39:22
 GMT
Sender: mdalam=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 17AC9C43463; Tue,  9 Feb 2021 16:39:22 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: mdalam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0C837C433ED;
        Tue,  9 Feb 2021 16:39:20 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 09 Feb 2021 22:09:20 +0530
From:   mdalam@codeaurora.org
To:     Vinod Koul <vkoul@kernel.org>
Cc:     corbet@lwn.net, agross@kernel.org, bjorn.andersson@linaro.org,
        dan.j.williams@intel.com, dmaengine@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, sricharan@codeaurora.org,
        mdalam=codeaurora.org@codeaurora.org
Subject: Re: [PATCH] dmaengine: qcom: bam_dma: Add LOCK and UNLOCK flag bit
 support
In-Reply-To: <73c871d3d674607fafc7b79e602ec587@codeaurora.org>
References: <efcc74bbdf36b4ddbf764eb6b4ed99f2@codeaurora.org>
 <f7de0117c8ff2e61c09f58acdea0e5b0@codeaurora.org>
 <20210112101056.GI2771@vkoul-mobl>
 <e3cf7c4fc02c54d17fd2fd213f39005b@codeaurora.org>
 <20210115055806.GE2771@vkoul-mobl>
 <97ce29b230164a5848a38f6448d1be60@codeaurora.org>
 <20210119164511.GE2771@vkoul-mobl>
 <534308caab7c18730ad0cc25248d116f@codeaurora.org>
 <20210201060508.GK2771@vkoul-mobl>
 <9d33d73682f24d92338757e1823ccd88@codeaurora.org>
 <20210201064314.GM2771@vkoul-mobl>
 <73c871d3d674607fafc7b79e602ec587@codeaurora.org>
Message-ID: <755d79fe46d819a4c5aaab245ab00634@codeaurora.org>
X-Sender: mdalam@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-02-01 21:20, mdalam@codeaurora.org wrote:
> On 2021-02-01 12:13, Vinod Koul wrote:
>> On 01-02-21, 11:52, mdalam@codeaurora.org wrote:
>>> On 2021-02-01 11:35, Vinod Koul wrote:
>>> > On 27-01-21, 23:56, mdalam@codeaurora.org wrote:
>> 
>>> > >   The actual LOCK/UNLOCK flag should be set on hardware command
>>> > > descriptor.
>>> > >   so this flag setting should be done in DMA engine driver. The user
>>> > > of the
>>> > > DMA
>>> > >   driver like (in case of IPQ5018) Crypto can use flag
>>> > > "DMA_PREP_LOCK" &
>>> > > "DMA_PREP_UNLOCK"
>>> > >   while preparing CMD descriptor before submitting to the DMA
>>> > > engine. In DMA
>>> > > engine driver
>>> > >   we are checking these flasgs on CMD descriptor and setting actual
>>> > > LOCK/UNLOCK flag on hardware
>>> > >   descriptor.
>>> >
>>> >
>>> > I am not sure I comprehend this yet.. when is that we would need to do
>>> > this... is this for each txn submitted to dmaengine.. or something
>>> > else..
>>> 
>>>  Its not for each transaction submitted to dmaengine. We have to set 
>>> this
>>> only
>>>  once on CMD descriptor. So when A53 crypto driver need to change the 
>>> crypto
>>> configuration
>>>  then first it will lock the all other pipes using setting the LOCK 
>>> flag bit
>>> on CMD
>>>  descriptor and then it can start the transaction , on data 
>>> descriptor this
>>> flag will
>>>  not get set once all transaction will be completed the A53 crypto 
>>> driver
>>> release the lock on
>>>  all other pipes using UNLOCK flag on CMD descriptor. So LOCK/UNLOCK 
>>> will be
>>> only once and not for
>>>  the each transaction.
>> 
>> Okay so why cant the bam driver check cmd descriptor and do 
>> lock/unlock
>> as below, why do we need users to do this.
>> 
>>         if (flags & DMA_PREP_CMD) {
>>                 do_lock_bam();
> 
>  User will not decide to do this LOCK/UNLOCK mechanism. It depends on 
> use case.
>  This LOCK/UNLOCK mechanism not required always. It needs only when
> hardware will be shared
>  between different core with different driver.
>  The LOCK/UNLOCK flags provides SW to enter ordering between pipes 
> execution.
>  (Generally, the BAM pipes are total independent from each other and
> work in parallel manner).
>  This LOCK/UNLOCK flags are part of actual pipe hardware descriptor.
> 
>  Pipe descriptor having the following flags:
>  INT : Interrupt
>  EOT: End of transfer
>  EOB: End of block
>  NWD: Notify when done
>  CMD: Command
>  LOCK: Lock
>  UNLOCK: Unlock
>  etc.
> 
>  Here the BAM driver is common driver for (QPIC, Crypto, QUP etc. in 
> IPQ5018)
>  So here only Crypto will be shared b/w multiple cores so For crypto
> request only the LOCK/UNLOCK
>  mechanism required.
>  For other request like for QPIC driver, QUPT driver etc. its not
> required. So Crypto driver has to raise the flag for
>  LOCK/UNLOCK while preparing CMD descriptor. The actual locking will
> happen in BAM driver only using condition
>  if (flags & DMA_PREP_CMD) {
>      if (flags & DMA_PREP_LOCK)
>         desc->flags |= cpu_to_le16(DESC_FLAG_LOCK);
>  }
> 
>  So Crypto driver should set this flag DMA_PREP_LOCK while preparing
> CMD descriptor.
>  So LOCK should be set on actual hardware pipe descriptor with
> descriptor type CMD.
> 
>> 
>> The point here is that this seems to be internal to dma and should be
>> handled by dma driver.
>> 
>   This LOCK/UNLOK flags are part of actual hardware descriptor so this
> should be handled by BAM driver only.
>   If we set condition like this
>   if (flags & DMA_PREP_CMD) {
>                 do_lock_bam();
>   Then LOCK/UNLOCK will be applied for all the CMD descriptor
> including (QPIC driver, QUP driver , Crypto driver etc.).
>   So this is not our intension. So we need to set this LOCK/UNLOCK
> only for the drivers it needs. So Crypto driver needs
>   locking mechanism so we will set LOCK/UNLOCK flag on Crypto driver
> request only for other driver request like QPIC driver,
>   QUP driver will not set this.
> 

    ping! Do you need any further info on this?

>> Also if we do this, it needs to be done for specific platforms..
>> 
> 
> 
> 
> 
> 
> 
> 
>> Thanks
