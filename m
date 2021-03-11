Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DFB433760F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Mar 2021 15:47:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233493AbhCKOqz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Mar 2021 09:46:55 -0500
Received: from m42-2.mailgun.net ([69.72.42.2]:14831 "EHLO m42-2.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231695AbhCKOqn (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Mar 2021 09:46:43 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1615474002; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=hVCux1IP+63a/Tc0z8TpqO5DKuu2bPUr6dNeCK6P1Sw=; b=QrxDPd7fyUwGXqqgAEdxHygur5ke9Z6iAKvNspU76Xen4eSiSeIeES1sGJw2K/VqZGh00doH
 agsRt82jlOzhaB1hnAMtzmKkY6uaVBQCyxZCY3F3mjKOLvze5B0y0j5bvsAo5AbUh5HOc0wb
 3f7qAugJubrTjqLoUvBtC7tODrM=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 604a2d43bb6300df75e5d6bf (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 11 Mar 2021 14:46:27
 GMT
Sender: jhugo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A3961C433CA; Thu, 11 Mar 2021 14:46:27 +0000 (UTC)
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 28585C433C6;
        Thu, 11 Mar 2021 14:46:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 28585C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jhugo@codeaurora.org
Subject: Re: [PATCH] bus: mhi: Command completion workaround
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Hemant Kumar <hemantk@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
References: <1615376308-1941-1-git-send-email-loic.poulain@linaro.org>
 <781d27cf-f9a6-eecc-8832-341a9a5fbb3a@codeaurora.org>
 <CAMZdPi-krgO4QrEoAzbciB4Ph1TnRqkFC3RQWb8R74ihCAvmPQ@mail.gmail.com>
From:   Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <81d1bd1b-6f69-1fd8-6a2a-d823145e692c@codeaurora.org>
Date:   Thu, 11 Mar 2021 07:46:25 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAMZdPi-krgO4QrEoAzbciB4Ph1TnRqkFC3RQWb8R74ihCAvmPQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 3/11/2021 1:05 AM, Loic Poulain wrote:
> Hi Jeffrey,
> 
> On Wed, 10 Mar 2021 at 17:19, Jeffrey Hugo <jhugo@codeaurora.org> wrote:
>>
>> On 3/10/2021 4:38 AM, Loic Poulain wrote:
>>> Some buggy hardwares (e.g sdx24) may report the current command
>>> ring wp pointer instead of the command completion pointer. It's
>>> obviously wrong, causing completion timeout. We can however deal
>>> with that situation by completing the cmd n-1 element, which is
>>> what the device actually completes.
>>>
>>> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
>>> ---
>>>    drivers/bus/mhi/core/main.c | 18 ++++++++++++++++++
>>>    1 file changed, 18 insertions(+)
>>>
>>> diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
>>> index 16b9640..3e3c520 100644
>>> --- a/drivers/bus/mhi/core/main.c
>>> +++ b/drivers/bus/mhi/core/main.c
>>> @@ -707,6 +707,7 @@ static void mhi_process_cmd_completion(struct mhi_controller *mhi_cntrl,
>>>    {
>>>        dma_addr_t ptr = MHI_TRE_GET_EV_PTR(tre);
>>>        struct mhi_cmd *cmd_ring = &mhi_cntrl->mhi_cmd[PRIMARY_CMD_RING];
>>> +     struct device *dev = &mhi_cntrl->mhi_dev->dev;
>>>        struct mhi_ring *mhi_ring = &cmd_ring->ring;
>>>        struct mhi_tre *cmd_pkt;
>>>        struct mhi_chan *mhi_chan;
>>> @@ -714,6 +715,23 @@ static void mhi_process_cmd_completion(struct mhi_controller *mhi_cntrl,
>>>
>>>        cmd_pkt = mhi_to_virtual(mhi_ring, ptr);
>>>
>>> +     if (unlikely(cmd_pkt == mhi_ring->wp)) {
>>> +             /* Some buggy hardwares (e.g sdx24) sometimes report the current
>>> +              * command ring wp pointer instead of the command completion
>>> +              * pointer. It's obviously wrong, causing completion timeout. We
>>> +              * can however deal with that situation by completing the cmd
>>> +              * n-1 element.
>>> +              */
>>> +             void *ring_ptr = (void *)cmd_pkt - mhi_ring->el_size;
>>> +
>>> +             if (ring_ptr < mhi_ring->base)
>>> +                     ring_ptr += mhi_ring->len;
>>> +
>>> +             cmd_pkt = ring_ptr;
>>> +
>>> +             dev_warn(dev, "Bad completion pointer (ptr == ring_wp)\n");
>>
>> Is there value in having this warning every time?  I wonder if a _once
>> version would be better to not flood the kernel log.  Although this is
>> only for commands, which shouldn't be frequent, so maybe that is the
>> implicit rate limiter.
>>
>> What do you think?
> 
> As you said it's kind of self rate-limited because of the unfrequent
> command operations, mostly for starting and stopping channels. A _once
> variant would hide the issue a bit, and probably not annoying enough
> to raise curiosity.

Thats fair.

I happened to notice just now that the block comment you have above is 
not the proper style.  That looks like the netdev style, but we are not 
in the netdev area.

I'm curious to see where you and Hemant land on his comment.

-- 
Jeffrey Hugo
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
