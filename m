Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D87D4432CC8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Oct 2021 06:31:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229649AbhJSEdG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Oct 2021 00:33:06 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:48942 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229692AbhJSEdE (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Oct 2021 00:33:04 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1634617852; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=9woJRJCdvTxyTHSeEiuDf/eJRUof627R7Fo3s9JH8WM=; b=hlSroiQjjCp5VtG8qWG8dgcvQkryWBFiN8Qj0X+hGC2wPZnMl2GT38JpqsrfTqAxm+bnNO4b
 iu/Y/g9oz+fRIanETxIF0R51HDcYM1SLOD44ws30D1liTNZ2IsZ8wy8j7WoRmndIeDt0EMMn
 Q51/eyQHnUwBWCS7ByO0897Tq5s=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 616e49f4321f24005125cffc (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 19 Oct 2021 04:30:44
 GMT
Sender: hemantk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id F1B2EC43617; Tue, 19 Oct 2021 04:30:43 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.1.5] (cpe-76-176-73-171.san.res.rr.com [76.176.73.171])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: hemantk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 75CC2C4338F;
        Tue, 19 Oct 2021 04:30:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 75CC2C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: [PATCH 3/3] bus: mhi: replace snprintf in show functions with
 sysfs_emit
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Greg KH <gregkh@linuxfoundation.org>
Cc:     Joe Perches <joe@perches.com>, bbhatt@codeaurora.org,
        loic.poulain@linaro.org, wangqing@vivo.com, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <mani@kernel.org>
References: <20211016065734.28802-1-manivannan.sadhasivam@linaro.org>
 <20211016065734.28802-4-manivannan.sadhasivam@linaro.org>
 <YWqBTj4slHq7HexS@kroah.com>
 <6ddc01b24b1c72f7e92174a037043b5cfffa3431.camel@perches.com>
 <YWrqmiT1pC+SbecM@kroah.com> <20211016161531.GA4048@thinkpad>
From:   Hemant Kumar <hemantk@codeaurora.org>
Message-ID: <c276a912-a382-46af-1573-570c3429be94@codeaurora.org>
Date:   Mon, 18 Oct 2021 21:30:41 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211016161531.GA4048@thinkpad>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 10/16/2021 9:15 AM, Manivannan Sadhasivam wrote:
> On Sat, Oct 16, 2021 at 05:07:06PM +0200, Greg KH wrote:
>> On Sat, Oct 16, 2021 at 03:24:17AM -0700, Joe Perches wrote:
>>> On Sat, 2021-10-16 at 09:37 +0200, Greg KH wrote:
>>>> On Sat, Oct 16, 2021 at 12:27:34PM +0530, Manivannan Sadhasivam wrote:
>>>>> From: Qing Wang <wangqing@vivo.com>
>>>>> coccicheck complains about the use of snprintf() in sysfs show functions.
>>> []
>>>>> diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
>>> []
>>>>> @@ -94,7 +94,7 @@ static ssize_t serial_number_show(struct device *dev,
>>>>>   	struct mhi_device *mhi_dev = to_mhi_device(dev);
>>>>>   	struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
>>>>>   
>>>>> -	return snprintf(buf, PAGE_SIZE, "Serial Number: %u\n",
>>>>> +	return sysfs_emit(buf, "Serial Number: %u\n",
>>>>>   			mhi_cntrl->serial_number);
>>>>
>>>> The text "Serial Number: " should not be in here, right?  It's obvious
>>>> this is a serial number, that's what the documentation and file name
>>>> says.  Userspace should not have to parse sysfs files.
>>>
>>> sysfs is ABI right?  Parsing or not, it's what's already there.
>>
>> If no tools rely on this, and we can change it, we should at least try.
>>
>> We can not change ABI if something breaks.  If nothing relies on it,
>> then it is fine to do so.
>>
> 
> Hemant, Bhaumik, do you guys know if there are any possible users (scripts/apps)
> of this ABI? I'm not 100% inclined to change it but if we are _sure_ that there
> are no users yet, then I'm ok with it.

Mani, i dont know if any script being used by any user to parse "Serial 
Number".

Thanks,
Hemant
> 
> Thanks,
> Mani
> 
>> thanks,
>>
>> greg k-h

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum, a Linux Foundation Collaborative Project
