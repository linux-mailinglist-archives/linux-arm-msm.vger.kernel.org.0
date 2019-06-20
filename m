Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 735384CB95
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2019 12:10:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726081AbfFTKKa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Jun 2019 06:10:30 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:35824 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726294AbfFTKKa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Jun 2019 06:10:30 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id DC3966028D; Thu, 20 Jun 2019 10:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1561025429;
        bh=JDAdwFAipZV2jVx82jTK+bZWQvaO9/abwFKD1uLSyHQ=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=Zxp7LkKrLBCcWoS6Q5xxFfI+vTbU+M5PIwL++saxdRk29QrsTsQVgulZOxWaOM0Uw
         huUaxj053zA+6yprWyMnHQ6WPwk/oY/Qx3SBBN47MAvWhbk3Uji1zKqXXi7cf2PCL3
         kzu0HwMWaw9Y6CDk93pVSFzY8vTzxn3t9NAk8PHk=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.79.136.27] (blr-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6457A6028D;
        Thu, 20 Jun 2019 10:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1561025429;
        bh=JDAdwFAipZV2jVx82jTK+bZWQvaO9/abwFKD1uLSyHQ=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=Zxp7LkKrLBCcWoS6Q5xxFfI+vTbU+M5PIwL++saxdRk29QrsTsQVgulZOxWaOM0Uw
         huUaxj053zA+6yprWyMnHQ6WPwk/oY/Qx3SBBN47MAvWhbk3Uji1zKqXXi7cf2PCL3
         kzu0HwMWaw9Y6CDk93pVSFzY8vTzxn3t9NAk8PHk=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6457A6028D
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=saiprakash.ranjan@codeaurora.org
Subject: Re: Coresight causes synchronous external abort on msm8916
To:     Suzuki K Poulose <suzuki.poulose@arm.com>, stephan@gerhold.net,
        mathieu.poirier@linaro.org
Cc:     david.brown@linaro.org, sibis@codeaurora.org,
        rnayak@codeaurora.org, vivek.gautam@codeaurora.org,
        agross@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, mike.leach@linaro.org
References: <20190618202623.GA53651@gerhold.net>
 <a51f117f-c48d-d3f4-c3d1-9b584e3a055f@arm.com>
 <20190619183904.GB937@gerhold.net>
 <0dcea9a1-999d-7d85-267e-c3bfcfcfa95a@codeaurora.org>
 <6589bf4d-5b39-c95e-0ee5-aaf35a87b40e@arm.com>
 <78b67245-9053-6175-9f9e-dbb12e5fb55c@codeaurora.org>
 <8742555a-e39e-6e10-6c4b-d0d1f271d158@arm.com>
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Message-ID: <1e9b470e-64e2-b4af-1a96-4907497ad950@codeaurora.org>
Date:   Thu, 20 Jun 2019 15:40:24 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <8742555a-e39e-6e10-6c4b-d0d1f271d158@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 6/20/2019 3:38 PM, Suzuki K Poulose wrote:
> Hi Sai,
> 
> On 20/06/2019 10:51, Sai Prakash Ranjan wrote:
> 
> ...
> 
>>>> diff --git a/drivers/hwtracing/coresight/coresight-etm4x.c
>>>> b/drivers/hwtracing/coresight/coresight-etm4x.c
>>>> index 8bb0092c7ec2..660432acbac0 100644
>>>> --- a/drivers/hwtracing/coresight/coresight-etm4x.c
>>>> +++ b/drivers/hwtracing/coresight/coresight-etm4x.c
>>>> @@ -1107,7 +1107,10 @@ static int etm4_probe(struct amba_device *adev,
>>>> const struct amba_id *id)
>>>>
>>>>         spin_lock_init(&drvdata->spinlock);
>>>>
>>>> -    drvdata->cpu = pdata ? pdata->cpu : 0;
>>>
>>> I believe, we should simply abort when we don't have pdata. There is no
>>> point
>>> in registering this ETM unless we know where this is connected to.
>>>
>>
>> I did not understand this comment since I am returning with ENODEV here
>> and not registering this ETM.
> 
> I meant,
> 
>      /* fail the probe, as we don't know where this is connected to */
>      if (pdata)
>          return -ENOENT;
> 
> 
> Cheers
> Suzuki

Thanks Suzuki, got it :)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
