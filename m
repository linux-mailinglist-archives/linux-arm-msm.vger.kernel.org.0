Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B50835053C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Mar 2021 19:10:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233888AbhCaRJz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 Mar 2021 13:09:55 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:49464 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233706AbhCaRJx (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 Mar 2021 13:09:53 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1617210593; h=Message-ID: References: In-Reply-To: Reply-To:
 Subject: Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=MfKGijwIXXVtnvH2VENSm7AOqY2k+W5QF+jruJ1CR3A=;
 b=lPlqlKEPQ7uVpBQlNEoezrrhYcOw0EL7MCDz/hIU++bqmGqDiOQH9aade4uUvaaT1ZXwqQr1
 ZCWllpJOY7d+77XiUqTf1sBMZeDmbSkqC0x3dV5kUIdr4w0T1LuE/Yy6QdlkpTlCqO8u6NoK
 udZ7VIsQl8tmfQOgRdFru2WKy/U=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 6064ace18166b7eff782aeba (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 31 Mar 2021 17:09:53
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 603E8C433ED; Wed, 31 Mar 2021 17:09:52 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 89FDEC433CA;
        Wed, 31 Mar 2021 17:09:51 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 31 Mar 2021 10:09:51 -0700
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        carl.yin@quectel.com, naveen.kumar@quectel.com,
        loic.poulain@linaro.org
Subject: Re: [PATCH v5 1/2] bus: mhi: core: Introduce internal register poll
 helper function
Organization: Qualcomm Innovation Center, Inc.
Reply-To: bbhatt@codeaurora.org
Mail-Reply-To: bbhatt@codeaurora.org
In-Reply-To: <20210331130347.GI15610@work>
References: <1617047583-12104-1-git-send-email-bbhatt@codeaurora.org>
 <1617047583-12104-2-git-send-email-bbhatt@codeaurora.org>
 <20210331130347.GI15610@work>
Message-ID: <c05c1172178816462ceeba0219eaa04c@codeaurora.org>
X-Sender: bbhatt@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Mani,

On 2021-03-31 06:03 AM, Manivannan Sadhasivam wrote:
> On Mon, Mar 29, 2021 at 12:53:02PM -0700, Bhaumik Bhatt wrote:
>> Introduce helper function to allow MHI core driver to poll for
>> a value in a register field. This helps reach a common path to
>> read and poll register values along with a retry time interval.
>> 
>> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
>> ---
>>  drivers/bus/mhi/core/internal.h |  3 +++
>>  drivers/bus/mhi/core/main.c     | 23 +++++++++++++++++++++++
>>  2 files changed, 26 insertions(+)
>> 
>> diff --git a/drivers/bus/mhi/core/internal.h 
>> b/drivers/bus/mhi/core/internal.h
>> index 6f80ec3..005286b 100644
>> --- a/drivers/bus/mhi/core/internal.h
>> +++ b/drivers/bus/mhi/core/internal.h
>> @@ -643,6 +643,9 @@ int __must_check mhi_read_reg(struct 
>> mhi_controller *mhi_cntrl,
>>  int __must_check mhi_read_reg_field(struct mhi_controller *mhi_cntrl,
>>  				    void __iomem *base, u32 offset, u32 mask,
>>  				    u32 shift, u32 *out);
>> +int __must_check mhi_poll_reg_field(struct mhi_controller *mhi_cntrl,
>> +				    void __iomem *base, u32 offset, u32 mask,
>> +				    u32 shift, u32 val, u32 delayus);
>>  void mhi_write_reg(struct mhi_controller *mhi_cntrl, void __iomem 
>> *base,
>>  		   u32 offset, u32 val);
>>  void mhi_write_reg_field(struct mhi_controller *mhi_cntrl, void 
>> __iomem *base,
>> diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
>> index 4e0131b..6f4b630 100644
>> --- a/drivers/bus/mhi/core/main.c
>> +++ b/drivers/bus/mhi/core/main.c
>> @@ -4,6 +4,7 @@
>>   *
>>   */
>> 
>> +#include <linux/delay.h>
>>  #include <linux/device.h>
>>  #include <linux/dma-direction.h>
>>  #include <linux/dma-mapping.h>
>> @@ -37,6 +38,28 @@ int __must_check mhi_read_reg_field(struct 
>> mhi_controller *mhi_cntrl,
>>  	return 0;
>>  }
>> 
>> +int __must_check mhi_poll_reg_field(struct mhi_controller *mhi_cntrl,
>> +				    void __iomem *base, u32 offset,
>> +				    u32 mask, u32 shift, u32 val, u32 delayus)
>> +{
>> +	int ret;
>> +	u32 out, retry = (mhi_cntrl->timeout_ms * 1000) / delayus;
>> +
>> +	while (retry--) {
>> +		ret = mhi_read_reg_field(mhi_cntrl, base, offset, mask, shift,
>> +					 &out);
>> +		if (ret)
>> +			return ret;
>> +
>> +		if (out == val)
>> +			return 0;
>> +
>> +		fsleep(delayus);
>> +	}
>> +
>> +	return -ENOENT;
> 
> Maybe I'm too late on this one, but I don't think -ENOENT is the 
> correct
> error code here. The error code will be returned only when the reg 
> field
> value didn't change as expected, so in that case it should be -EINVAL 
> or
> -ETIMEDOUT, no?
> 
> Thanks,
> Mani
> 

Thanks for pointing that out.

The intention of the error code was despite polling for whatever time 
period,
we were unable to see the value changing as expected. I think the 
-ETIMEDOUT
error code would be appropriate. Will upload a v6.

>> +}
>> +
>>  void mhi_write_reg(struct mhi_controller *mhi_cntrl, void __iomem 
>> *base,
>>  		   u32 offset, u32 val)
>>  {
>> --
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
>> Forum,
>> a Linux Foundation Collaborative Project
>> 

Thanks,
Bhaumik
---
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum,
a Linux Foundation Collaborative Project
