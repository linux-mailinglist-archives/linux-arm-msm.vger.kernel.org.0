Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7F15301225
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Jan 2021 02:56:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726024AbhAWBz4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 Jan 2021 20:55:56 -0500
Received: from a1.mail.mailgun.net ([198.61.254.60]:59165 "EHLO
        a1.mail.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726048AbhAWBzy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 Jan 2021 20:55:54 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1611366935; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=PSuBZhuZUbMXWczL8TbyXTEbtdPcTovEfVwdjNUqKUs=; b=C5fLy4FxsEIZWO64M7L8gtbRcsTp48S7HZRsRbe89F4Ttq8oaF/KIPPWUdcxT3zo0zF2lC6z
 V6+OU0lOrerFS+SXat7oD0/bNUlGeCKnEzf397Am035jwgt9gK9F5WCLtV4OOGYzg32UQvsD
 5REVkhoJ/0lJRY7yu/mcR5kDHaM=
X-Mailgun-Sending-Ip: 198.61.254.60
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 600b81f8beacd1a2525bd85e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 23 Jan 2021 01:55:04
 GMT
Sender: collinsd=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 4671BC43461; Sat, 23 Jan 2021 01:55:03 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.46.160.165] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: collinsd)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4F7ECC433CA;
        Sat, 23 Jan 2021 01:54:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4F7ECC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=collinsd@codeaurora.org
Subject: Re: [PATCH] regulator: core: avoid regulator_resolve_supply() race
 condition
To:     Mark Brown <broonie@kernel.org>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        'Linux Samsung SOC' <linux-samsung-soc@vger.kernel.org>
References: <1610068562-4410-1-git-send-email-collinsd@codeaurora.org>
 <CGME20210112213419eucas1p24231e4d0ac11c31184f2f8f3f20cbd9d@eucas1p2.samsung.com>
 <e512ee85-7fa6-e5fe-eb30-f088bb83cf23@samsung.com>
 <20210118204958.GS4455@sirena.org.uk>
 <5f37ae96-c5f9-6619-d88f-21c5e483ff8e@samsung.com>
 <20210121154418.GE4588@sirena.org.uk>
 <e7e4b633-21cb-54e6-f75c-fac28147396c@samsung.com>
From:   David Collins <collinsd@codeaurora.org>
Message-ID: <5d02de1f-a6f4-c564-6738-2ca46b5d5cc0@codeaurora.org>
Date:   Fri, 22 Jan 2021 17:54:56 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <e7e4b633-21cb-54e6-f75c-fac28147396c@samsung.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello Mark,

On 1/21/21 12:30 PM, Marek Szyprowski wrote:
> Hi Mark,
> 
> On 21.01.2021 16:44, Mark Brown wrote:
>> On Thu, Jan 21, 2021 at 10:41:59AM +0100, Marek Szyprowski wrote:
>>> On 18.01.2021 21:49, Mark Brown wrote:
>>>> Does this help (completely untested):
>>> Sadly nope. I get same warning:
>> Try this instead:
>>
>> diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
>> index 3ae5ccd9277d..31503776dbd7 100644
>> --- a/drivers/regulator/core.c
>> +++ b/drivers/regulator/core.c
>> @@ -1823,17 +1823,6 @@ static int regulator_resolve_supply(struct regulator_dev *rdev)
>>    	if (rdev->supply)
>>    		return 0;
>>    
>> -	/*
>> -	 * Recheck rdev->supply with rdev->mutex lock held to avoid a race
>> -	 * between rdev->supply null check and setting rdev->supply in
>> -	 * set_supply() from concurrent tasks.
>> -	 */
>> -	regulator_lock(rdev);
>> -
>> -	/* Supply just resolved by a concurrent task? */
>> -	if (rdev->supply)
>> -		goto out;
>> -
>>    	r = regulator_dev_lookup(dev, rdev->supply_name);
>>    	if (IS_ERR(r)) {
>>    		ret = PTR_ERR(r);
>> @@ -1885,12 +1874,29 @@ static int regulator_resolve_supply(struct regulator_dev *rdev)
>>    		goto out;
>>    	}
>>    
>> +	/*
>> +	 * Recheck rdev->supply with rdev->mutex lock held to avoid a race
>> +	 * between rdev->supply null check and setting rdev->supply in
>> +	 * set_supply() from concurrent tasks.
>> +	 */
>> +	regulator_lock(rdev);
>> +
>> +	/* Supply just resolved by a concurrent task? */
>> +	if (rdev->supply) {
>> +		regulator_unlock(rdev);
>> +		put_device(&r->dev);
>> +		return ret;
>> +	}
>> +
>>    	ret = set_supply(rdev, r);
>>    	if (ret < 0) {
>> +		regulator_unlock(rdev);
>>    		put_device(&r->dev);
>> -		goto out;
>> +		return ret;
>>    	}
>>    
>> +	regulator_unlock(rdev);
>> +
>>    	/*
>>    	 * In set_machine_constraints() we may have turned this regulator on
>>    	 * but we couldn't propagate to the supply if it hadn't been resolved
>> @@ -1901,12 +1907,11 @@ static int regulator_resolve_supply(struct regulator_dev *rdev)
>>    		if (ret < 0) {
>>    			_regulator_put(rdev->supply);
>>    			rdev->supply = NULL;
>> -			goto out;
>> +			goto out_rdev_lock;
> 
> drivers/regulator/core.c:1910:4: error: label ‘out_rdev_lock’ used but
> not defined
> 
>>    		}
>>    	}
>>    
>>    out:
>> -	regulator_unlock(rdev);
>>    	return ret;
>>    }
>>    
> 
> It looks that it finally fixes the locking issue, with the above goto
> removed completely to fix build. Feel free to add:
> 
> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> 
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

Thank you for making this fix.  I'm sorry that I missed the potential 
deadlock issue resulting from the regulator_enable() call inside 
regulator_resolve_supply() with rdev->mutex locked.  Your fix avoids 
deadlock while still ensuring that the there isn't a set supply race 
condition.

Take care,
David

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
