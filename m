Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97C8E288DB6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Oct 2020 18:05:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388882AbgJIQFH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Oct 2020 12:05:07 -0400
Received: from z5.mailgun.us ([104.130.96.5]:54769 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389380AbgJIQFF (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Oct 2020 12:05:05 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1602259504; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=CRr4mmuobyXTTLIv8mSddWm/kl/HZjTgem40TcX5IZM=; b=ETe82+G91chr1poswIFStsaHoeJ87F7h4cufEewahLqrGEqhrNvNbbLPDtFHwSjEX9OOwJ+2
 kkTbo4lzJUP+hOpxw3MLSmFEw/tR3k+hUkcFt8+f0vZy/eret3dd1FROnOKivpnMpmKnkP2H
 IGkj2ocah4VsFWlYEoqefRQDXxo=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 5f8089f53711fec7b1fc36e8 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 09 Oct 2020 16:04:05
 GMT
Sender: jhugo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D0A66C43382; Fri,  9 Oct 2020 16:04:04 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.226.59.216] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C3E89C433C9;
        Fri,  9 Oct 2020 16:04:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C3E89C433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jhugo@codeaurora.org
Subject: Re: [PATCH v1 04/10] bus: mhi: core: Use the IRQF_ONESHOT flag for
 the BHI interrupt line
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        linux-kernel@vger.kernel.org
References: <1600480955-16827-1-git-send-email-bbhatt@codeaurora.org>
 <1600480955-16827-5-git-send-email-bbhatt@codeaurora.org>
 <20201009155706.GE4810@Mani-XPS-13-9360>
From:   Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <26de08b5-b477-c5b9-fdca-eb80bcf98561@codeaurora.org>
Date:   Fri, 9 Oct 2020 10:04:02 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.2.2
MIME-Version: 1.0
In-Reply-To: <20201009155706.GE4810@Mani-XPS-13-9360>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/9/2020 9:57 AM, Manivannan Sadhasivam wrote:
> On Fri, Sep 18, 2020 at 07:02:29PM -0700, Bhaumik Bhatt wrote:
>> Remove the IRQF_SHARED flag as it is not needed for the BHI interrupt
>> and replace it with IRQF_ONESHOT so that host can be sure that the
>> next BHI hard interrupt is triggered only when the threaded interrupt
>> handler has returned. This is to avoid any race conditions we may run
>> into if BHI interrupts fire one after another.
>>
>> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
>> ---
>>   drivers/bus/mhi/core/init.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
>> index ca32563..9ae4c19 100644
>> --- a/drivers/bus/mhi/core/init.c
>> +++ b/drivers/bus/mhi/core/init.c
>> @@ -167,7 +167,7 @@ int mhi_init_irq_setup(struct mhi_controller *mhi_cntrl)
>>   	/* Setup BHI_INTVEC IRQ */
>>   	ret = request_threaded_irq(mhi_cntrl->irq[0], mhi_intvec_handler,
>>   				   mhi_intvec_threaded_handler,
>> -				   IRQF_SHARED | IRQF_NO_SUSPEND,
>> +				   IRQF_ONESHOT | IRQF_NO_SUSPEND,
> 
> Jeff, I believe you're the one requested for shared irq during initial push.
> Are you okay with this?

Nope  :)

AIC100 has a single interrupt for BHI/MHI activity, so this needs to be 
shared.


-- 
Jeffrey Hugo
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
