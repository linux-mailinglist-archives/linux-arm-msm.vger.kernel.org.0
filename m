Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8582F2C46F4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Nov 2020 18:41:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729964AbgKYRlT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Nov 2020 12:41:19 -0500
Received: from z5.mailgun.us ([104.130.96.5]:49926 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729655AbgKYRlS (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Nov 2020 12:41:18 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1606326078; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=ZZH2/l4COfDCZLaZAtru+TGY8d9NJqcWcqA8U04+fTs=; b=W7E/2flPeK0iSCy2uBZet1v3IuWOP6XLKpVQ7zQDjeSFMtMyfDREyE0ZzljzQK3ebl27wPnd
 V8TMQkcojDo0tEd09WtuCXgqJ1xnxnmloAg7sXlzkYGo8p1nMXeoVuDBlyw/ODhF9c8zxgon
 orD7rrLkJBaxtFhAhbUm6HE1tjo=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n10.prod.us-east-1.postgun.com with SMTP id
 5fbe9737d64ea0b7030d5a48 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 25 Nov 2020 17:41:11
 GMT
Sender: jhugo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A8A88C43460; Wed, 25 Nov 2020 17:41:10 +0000 (UTC)
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 09F07C433ED;
        Wed, 25 Nov 2020 17:41:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 09F07C433ED
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jhugo@codeaurora.org
Subject: Re: [PATCH 2/8] mhi: pci-generic: Perform hard reset on remove
To:     Loic Poulain <loic.poulain@linaro.org>,
        Hemant Kumar <hemantk@codeaurora.org>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
References: <1605279602-18749-1-git-send-email-loic.poulain@linaro.org>
 <1605279602-18749-3-git-send-email-loic.poulain@linaro.org>
 <ad4fa874-163a-227b-3291-727b1ee27f06@codeaurora.org>
 <CAMZdPi8pOVB6rsERsbyLEkRuf4tjNaC-eZa1mFnyiTBws1K9=Q@mail.gmail.com>
From:   Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <f964e9ff-b2f3-dde4-13d8-9fc711b899da@codeaurora.org>
Date:   Wed, 25 Nov 2020 10:41:08 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CAMZdPi8pOVB6rsERsbyLEkRuf4tjNaC-eZa1mFnyiTBws1K9=Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/19/2020 2:21 AM, Loic Poulain wrote:
> Hi Hemant,
> 
> On Thu, 19 Nov 2020 at 02:46, Hemant Kumar <hemantk@codeaurora.org> wrote:
>>
>> Hi Loic,
>>
>> On 11/13/20 6:59 AM, Loic Poulain wrote:
>>> Ensure that the device is hard-reset on remove to restore its initial
>>> state and avoid further issues on subsequent probe.
>>>
>>> This has been tested with Telit FN980m module.
>>>
>>> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
>>> ---
>>>    drivers/bus/mhi/pci_generic.c | 11 +++++++++++
>>>    1 file changed, 11 insertions(+)
>>>
>>> diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
>>> index 13a7e4f..09c6b26 100644
>>> --- a/drivers/bus/mhi/pci_generic.c
>>> +++ b/drivers/bus/mhi/pci_generic.c
>>> @@ -15,6 +15,8 @@
>>>
>>>    #define MHI_PCI_DEFAULT_BAR_NUM 0
>>>
>>> +#define DEV_RESET_REG (0xB0)
>>> +
>>>    /**
>>>     * struct mhi_pci_dev_info - MHI PCI device specific information
>>>     * @config: MHI controller configuration
>>> @@ -166,6 +168,11 @@ static void mhi_pci_status_cb(struct mhi_controller *mhi_cntrl,
>>>        /* Nothing to do for now */
>>>    }
>>>
>>> +static inline void mhi_pci_reset(struct mhi_controller *mhi_cntrl)
>>> +{
>>> +     writel(1, mhi_cntrl->regs + DEV_RESET_REG);
>>> +}
>>> +
>>>    static int mhi_pci_claim(struct mhi_controller *mhi_cntrl,
>>>                         unsigned int bar_num, u64 dma_mask)
>>>    {
>>> @@ -329,6 +336,10 @@ static void mhi_pci_remove(struct pci_dev *pdev)
>>>        mhi_power_down(mhi_cntrl, true);
>>>        mhi_unprepare_after_power_down(mhi_cntrl);
>>>        mhi_unregister_controller(mhi_cntrl);
>>> +
>>> +     /* MHI-layer reset could not be enough, always hard-reset the device */
>>> +     mhi_pci_reset(mhi_cntrl);
>>
>> Referring to MHI spec:
>> Hosts writes this register to trigger a reset. This can be used when the
>> host detects a timeout in the MHI protocol and can use the reset as a
>> last resort to recover the device. Host should first attempt an MHI
>> Reset procedure before resetting the entire device.
>>
>> What issue are you facing which requires you to do full device reset ?
>> Based on the spec recommendation, looks like this should be a last resort.
> 
> On module unload/reload, the device does not go through cold reset and
> can be in error state on further reload, causing mhi power up to fail.
> This patch simply resets the device in remove so that it is in the
> exact same condition as before probing (not only MHI layer, but all
> the device context), I think it makes sense and prevents any
> unexpected state on further reloading. Note also that unloading the
> module (or unbinding the device) is not something that usually
> happens, except when the user does it explicitly for any reason.

This seems unnecessary to me.  Qaic has the same usecase, and the MHI 
state machine reset is sufficient.  Perhaps you have a unique edge case 
though.

However, you are implementing the soc_reset functionality in your 
driver, when its a common MHI functionality, and is something I would 
like to use.  If you dig back, I proposed a sysfs extension to expose 
that to userspace, but I have a desire to use it from my driver, same as 
you.

Would you please make MHI core changes to expose the soc_reset 
functionality out so that multiple drivers can use a common implementation?


-- 
Jeffrey Hugo
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
