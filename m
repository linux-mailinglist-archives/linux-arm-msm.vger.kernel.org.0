Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 867132CB270
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Dec 2020 02:42:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727533AbgLBBmQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Dec 2020 20:42:16 -0500
Received: from m42-5.mailgun.net ([69.72.42.5]:62614 "EHLO m42-5.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727455AbgLBBmQ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Dec 2020 20:42:16 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1606873314; h=Message-ID: References: In-Reply-To: Reply-To:
 Subject: Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=rOCYGl7gq4kPLvvbLxxonuW8om/DWdztwUEdA4lT/Fc=;
 b=dYCoL6obqakY5mf75J/9UKP+YQcCrSarCU+H0MoAyyNmqUqROe0HoFEJ1xR3FIfkOojR86VR
 7yXu8SOW58qJQrm4SDKZaHPb+NypiKkTNgz1dYbCdiFs3C/6AqVszvaO3ylv/n7YBkSYtMK5
 MDjRE5nCLlZIrG9iOOiKwGb8RyA=
X-Mailgun-Sending-Ip: 69.72.42.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 5fc6f0bc2ef3e1355fc6ce89 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 02 Dec 2020 01:41:16
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 00011C43461; Wed,  2 Dec 2020 01:41:15 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4F4EEC433ED;
        Wed,  2 Dec 2020 01:41:15 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 01 Dec 2020 17:41:15 -0800
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Loic Poulain <loic.poulain@linaro.org>, hemantk@codeaurora.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 1/9] mhi: Add mhi_controller_initialize helper
Organization: Qualcomm Innovation Center, Inc.
Reply-To: bbhatt@codeaurora.org
Mail-Reply-To: bbhatt@codeaurora.org
In-Reply-To: <20201128054219.GA3077@thinkpad>
References: <1606404547-10737-1-git-send-email-loic.poulain@linaro.org>
 <1606404547-10737-2-git-send-email-loic.poulain@linaro.org>
 <20201128054219.GA3077@thinkpad>
Message-ID: <4688319b5b5aa3326f42fbc817bbddaf@codeaurora.org>
X-Sender: bbhatt@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-11-27 09:42 PM, Manivannan Sadhasivam wrote:
> On Thu, Nov 26, 2020 at 04:28:59PM +0100, Loic Poulain wrote:
>> This function allows to initialize a mhi_controller structure.
>> Today, it only zeroing the structure.
>> 
> 
> That's what kzalloc is also doing, right?
> 
> Thanks,
> Mani
> 
>> Use this function from mhi_alloc_controller so that any further
>> initialization can be factorized in initalize function.
>> 
>> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
>> ---
>>  drivers/bus/mhi/core/init.c | 7 +++++++
>>  include/linux/mhi.h         | 6 ++++++
>>  2 files changed, 13 insertions(+)
>> 
>> diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
>> index 96cde9c..4acad28 100644
>> --- a/drivers/bus/mhi/core/init.c
>> +++ b/drivers/bus/mhi/core/init.c
>> @@ -1021,11 +1021,18 @@ void mhi_unregister_controller(struct 
>> mhi_controller *mhi_cntrl)
>>  }
>>  EXPORT_SYMBOL_GPL(mhi_unregister_controller);
>> 
>> +void mhi_initialize_controller(struct mhi_controller *mhi_cntrl)
>> +{
>> +	memset(mhi_cntrl, 0, sizeof(*mhi_cntrl));
>> +}
>> +EXPORT_SYMBOL_GPL(mhi_initialize_controller);
>> +
>>  struct mhi_controller *mhi_alloc_controller(void)
>>  {
>>  	struct mhi_controller *mhi_cntrl;
>> 
>>  	mhi_cntrl = kzalloc(sizeof(*mhi_cntrl), GFP_KERNEL);
>> +	mhi_initialize_controller(mhi_cntrl);
This line is not required here.
>> 
>>  	return mhi_cntrl;
>>  }
>> diff --git a/include/linux/mhi.h b/include/linux/mhi.h
>> index 5721a0a..30c676d 100644
>> --- a/include/linux/mhi.h
>> +++ b/include/linux/mhi.h
>> @@ -537,6 +537,12 @@ struct mhi_driver {
>>  #define to_mhi_device(dev) container_of(dev, struct mhi_device, dev)
>> 
>>  /**
>> + * mhi_initialize_controller - Initialize MHI Controller structure
>> + * @mhi_cntrl: MHI controller structure to initialize
>> + */
>> +void mhi_initialize_controller(struct mhi_controller *mhi_cntrl);
>> +
>> +/**
>>   * mhi_alloc_controller - Allocate the MHI Controller structure
>>   * Allocate the mhi_controller structure using zero initialized 
>> memory
>>   */
>> --
>> 2.7.4
>> 

Thanks,
Bhaumik
---
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum,
a Linux Foundation Collaborative Project
