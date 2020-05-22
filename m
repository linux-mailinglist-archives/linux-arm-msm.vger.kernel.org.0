Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 611461DEEAD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2020 19:56:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730728AbgEVR4k (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 May 2020 13:56:40 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:22190 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730674AbgEVR4k (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 May 2020 13:56:40 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1590170198; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=KsXiQmpLIAN5c5M7YvALpjfUVVNpRDHzU1icueEVx0Q=;
 b=aeyxcFKyIzG1lT8ms+oXhCXd3G5tgBBOhRy8vC6tqHsAVOUKjMw0L4N0YTF4nkjYOIrQNn0R
 KBXBE82VwYDGw2hhvUUBDHD46tgJ9l9+X4Y5ssPpAv+OA/mhhApS+o0wDbhnILthTzZI4akj
 DyzVL/kd2Fe7U42HB31jaK2KVK4=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ec81248.7fe5fac5aa40-smtp-out-n05;
 Fri, 22 May 2020 17:56:24 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 93622C433C8; Fri, 22 May 2020 17:56:24 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A6714C433C6;
        Fri, 22 May 2020 17:56:23 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 22 May 2020 23:26:23 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org
Subject: Re: [PATCHv2 3/4] coresight: replicator: Reset replicator if context
 is lost
In-Reply-To: <20200522174052.GA3379@xps15>
References: <cover.1589894597.git.saiprakash.ranjan@codeaurora.org>
 <c2e02d0c92b081c05b91d07ec17e648c40af3897.1589894597.git.saiprakash.ranjan@codeaurora.org>
 <20200522174052.GA3379@xps15>
Message-ID: <e723febb6f6e794d292423b33efdf3e6@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Mathieu,

On 2020-05-22 23:10, Mathieu Poirier wrote:
> Hi Sai,
> 
> On Tue, May 19, 2020 at 07:06:02PM +0530, Sai Prakash Ranjan wrote:
>> On some QCOM SoCs, replicators in Always-On domain loses its
>> context as soon as the clock is disabled. Currently as a part
>> of pm_runtime workqueue, clock is disabled after the replicator
>> is initialized by amba_pm_runtime_suspend assuming that context
>> is not lost which is not true for replicators with such
>> limitations. So add a new property "qcom,replicator-loses-context"
>> to identify such replicators and reset them.
>> 
>> Suggested-by: Mike Leach <mike.leach@linaro.org>
>> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
>> ---
>> 
>> Added Mike's suggested by for parts other than the DT property.
>> Perhaps I should add Co-developed-by Mike since the full skeletal
>> was given by Mike. I can add that if required on the next version.
> 
>  I will let Mike decide what he wants to do - I'm fine either way.
> 

Mike was ok with suggested-by, so I will go with that.

>> 
>> ---
>>  .../coresight/coresight-replicator.c          | 53 
>> +++++++++++++------
>>  1 file changed, 36 insertions(+), 17 deletions(-)
>> 
>> diff --git a/drivers/hwtracing/coresight/coresight-replicator.c 
>> b/drivers/hwtracing/coresight/coresight-replicator.c
>> index c619b456f55a..ba66160c8140 100644
>> --- a/drivers/hwtracing/coresight/coresight-replicator.c
>> +++ b/drivers/hwtracing/coresight/coresight-replicator.c
>> @@ -38,6 +38,7 @@ struct replicator_drvdata {
>>  	struct clk		*atclk;
>>  	struct coresight_device	*csdev;
>>  	spinlock_t		spinlock;
>> +	bool			check_idfilter_val;
> 
> Please add documentation for the new field, the same way other fields 
> are
> documented.
> 

Sure will add that.

>>  };
>> 
>>  static void dynamic_replicator_reset(struct replicator_drvdata 
>> *drvdata)
>> @@ -66,29 +67,43 @@ static int dynamic_replicator_enable(struct 
>> replicator_drvdata *drvdata,
>>  				     int inport, int outport)
>>  {
>>  	int rc = 0;
>> -	u32 reg;
>> -
>> -	switch (outport) {
>> -	case 0:
>> -		reg = REPLICATOR_IDFILTER0;
>> -		break;
>> -	case 1:
>> -		reg = REPLICATOR_IDFILTER1;
>> -		break;
>> -	default:
>> -		WARN_ON(1);
>> -		return -EINVAL;
>> -	}
>> +	u32 id0val, id1val;
>> 
>>  	CS_UNLOCK(drvdata->base);
>> 
>> -	if ((readl_relaxed(drvdata->base + REPLICATOR_IDFILTER0) == 0xff) &&
>> -	    (readl_relaxed(drvdata->base + REPLICATOR_IDFILTER1) == 0xff))
>> +	id0val = readl_relaxed(drvdata->base + REPLICATOR_IDFILTER0);
>> +	id1val = readl_relaxed(drvdata->base + REPLICATOR_IDFILTER1);
>> +
>> +	/*
>> +	 * Some replicator designs lose context when AMBA clocks are 
>> removed,
>> +	 * so have a check for this.
>> +	 */
>> +	if (drvdata->check_idfilter_val && id0val == 0x0 && id1val == 0x0)
>> +		id0val = id1val = 0xff;
>> +
>> +	if (id0val == 0xff && id1val == 0xff)
>>  		rc = coresight_claim_device_unlocked(drvdata->base);
>> 
>> +	if (!rc) {
>> +		switch (outport) {
>> +		case 0:
>> +			id0val = 0x0;
>> +			break;
>> +		case 1:
>> +			id1val = 0x0;
>> +			break;
>> +		default:
>> +			WARN_ON(1);
>> +			rc = -EINVAL;
>> +		}
>> +	}
>> +
>>  	/* Ensure that the outport is enabled. */
>> -	if (!rc)
>> -		writel_relaxed(0x00, drvdata->base + reg);
>> +	if (!rc) {
>> +		writel_relaxed(id0val, drvdata->base + REPLICATOR_IDFILTER0);
>> +		writel_relaxed(id1val, drvdata->base + REPLICATOR_IDFILTER1);
>> +	}
>> +
>>  	CS_LOCK(drvdata->base);
>> 
>>  	return rc;
>> @@ -239,6 +254,10 @@ static int replicator_probe(struct device *dev, 
>> struct resource *res)
>>  		desc.groups = replicator_groups;
>>  	}
>> 
>> +	if (fwnode_property_present(dev_fwnode(dev),
>> +				    "qcom,replicator-loses-context"))
>> +		drvdata->check_idfilter_val = true;
>> +
> 
> The header <linux/property.h> needs to be added for function
> fwnode_property_present().
> 

Sure will add in next version.

> What is the clock situation with other QC components like funnels?  
> Have they
> also been designed the same way?  If so the binding should probably be
> "qcom,component-loses-context", otherwise what you have suggested will 
> work just
> fine.  My goal here is to avoid having "qcom,replicator-loses-context" 
> and
> "qcom,funnel-loses-context".
> 

Yes I understand it is quite ugly, but AFAIK we do not have any SoCs 
already released
and coming in near future with such limitations in funnels or other 
components. So I will
stick to the replicator specific property.

> Lastly, I have applied patch 1 and 2 of this set to my tree so no need 
> to resend
> them again with the next revision.
> 

Thanks for reviewing these patches.

Thanks,
Sai
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
