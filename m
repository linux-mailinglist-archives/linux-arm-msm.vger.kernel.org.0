Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4CC22C8796
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Nov 2020 16:19:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726761AbgK3PTJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Nov 2020 10:19:09 -0500
Received: from m42-4.mailgun.net ([69.72.42.4]:33715 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725849AbgK3PTJ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Nov 2020 10:19:09 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1606749528; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=YXAsOYOUrsciF9dQdYiRD/IJQ5xmG9rmdFJE2earlRA=; b=jTvLO3i48svU4iyiHTJAQTDdr5KQHOJZ5d7GuwtpSc0Eq6znT278DMhUsGWhng0s74oELc2y
 7VCiaza7An8xQuXuuYayHRS4ydFEsVTSzc2Rb5AQEkNZ9AV8jrz7q+GLhdImHREIQPTvgXla
 ritM9frSkVT2kF2dprXezmDnVeg=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 5fc50d3bfa67d9becf5af123 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 30 Nov 2020 15:18:19
 GMT
Sender: jhugo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 1A991C43460; Mon, 30 Nov 2020 15:18:19 +0000 (UTC)
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E3C54C433C6;
        Mon, 30 Nov 2020 15:18:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E3C54C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jhugo@codeaurora.org
Subject: Re: [PATCH v2] bus: mhi: Ensure correct ring update ordering with
 memory barrier
To:     Loic Poulain <loic.poulain@linaro.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Hemant Kumar <hemantk@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
References: <1606403201-5656-1-git-send-email-loic.poulain@linaro.org>
 <20201128060331.GH3077@thinkpad>
 <CAMZdPi-kUkoqz2Yx_rWOHfCovk_MjZxoq1QV413y54E7F-QE4w@mail.gmail.com>
From:   Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <c1910853-ff39-535e-79a6-3f9ad9b09d0a@codeaurora.org>
Date:   Mon, 30 Nov 2020 08:18:17 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CAMZdPi-kUkoqz2Yx_rWOHfCovk_MjZxoq1QV413y54E7F-QE4w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/30/2020 1:18 AM, Loic Poulain wrote:
> On Sat, 28 Nov 2020 at 07:03, Manivannan Sadhasivam
> <manivannan.sadhasivam@linaro.org> wrote:
>>
>> On Thu, Nov 26, 2020 at 04:06:41PM +0100, Loic Poulain wrote:
>>> The ring element data, though being part of coherent memory, still need
>>> to be performed before updating the ring context to point to this new
>>> element. That can be guaranteed with a memory barrier (dma_wmb).
>>>
>>> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
>>> ---
>>>   v2: fix comment style
>>>
>>>   drivers/bus/mhi/core/main.c | 7 +++++++
>>>   1 file changed, 7 insertions(+)
>>>
>>> diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
>>> index 67188ea..ea39df0 100644
>>> --- a/drivers/bus/mhi/core/main.c
>>> +++ b/drivers/bus/mhi/core/main.c
>>> @@ -111,7 +111,14 @@ void mhi_ring_chan_db(struct mhi_controller *mhi_cntrl,
>>>        dma_addr_t db;
>>>
>>>        db = ring->iommu_base + (ring->wp - ring->base);
>>> +
>>> +     /*
>>> +      * Writes to the new ring element must be visible to the hardware
>>> +      * before letting h/w know there is new element to fetch.
>>> +      */
>>> +     dma_wmb();
>>>        *ring->ctxt_wp = db;
>>
>> As Jeff pointed out, the barrier should come after updating ctxt_wp.
> 
> Actually, device can poll for the write pointer (e.g. in burst mode),
> so we need to be sure the element data are written before writing this
> write pointer (since it can be accessed at any time on device side,
> not only after doorbell).
> 
> I think that what jeff pointed is that we also need to ensure that
> write pointer is also updated before we ring the doorbell (doorbell
> mode), but this is implicitly done by the MMIO writing (using
> writeX()) of the doorbell register.(cf
> https://www.kernel.org/doc/Documentation/memory-barriers.txt).

If we are using the version of the writeX API that includes a barrier, 
then that would be sufficient.

-- 
Jeffrey Hugo
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
