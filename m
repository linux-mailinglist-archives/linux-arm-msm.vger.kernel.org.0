Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A20E2951DC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Oct 2020 19:55:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405189AbgJURzD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Oct 2020 13:55:03 -0400
Received: from z5.mailgun.us ([104.130.96.5]:51447 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404413AbgJURzD (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Oct 2020 13:55:03 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1603302903; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=LRMUirYzhYY9YlK5k5r6P0ZepRcjoq/tviwqExz3pxk=; b=reyVjsuActxvxHCTAYDI9wO5Ucnl3e7xnAXNhG1uL9jVKrUkDBgmx50qL/GOD57Fq0bEiw/5
 7jVsZ1IVgxUGztJ48YhYeTgCvrxuU6+rXdRFShj18WyW750wdE6osW8Dq7VBHhdJF3fO+5Dm
 NM5LoYboULW2ypvLmQWONevWiOI=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 5f9075f6aad2c3cd1c7975f0 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 21 Oct 2020 17:55:02
 GMT
Sender: hemantk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id EB34DC43385; Wed, 21 Oct 2020 17:55:01 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.46.162.249] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: hemantk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D4153C433C9;
        Wed, 21 Oct 2020 17:55:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D4153C433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=hemantk@codeaurora.org
Subject: Re: [PATCH v7 1/4] bus: mhi: core: Add helper API to return number of
 free TREs
To:     Loic Poulain <loic.poulain@linaro.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Bhaumik Bhatt <bbhatt@codeaurora.org>
References: <1602907457-13680-1-git-send-email-hemantk@codeaurora.org>
 <1602907457-13680-2-git-send-email-hemantk@codeaurora.org>
 <20201021152714.GD3334@Mani-XPS-13-9360>
 <CAMZdPi8xcsrKx2eV5da98fsGt2zO3f6ARMz7WJsyDSb3CnM0FA@mail.gmail.com>
 <20201021162540.GG3334@Mani-XPS-13-9360>
 <CAMZdPi-SY-r2H7RBLKoNk9yfu5umrrwYMr0ckJoxSx-iqYXdQg@mail.gmail.com>
From:   Hemant Kumar <hemantk@codeaurora.org>
Message-ID: <891914f1-13f2-abf8-46a6-d52218d67094@codeaurora.org>
Date:   Wed, 21 Oct 2020 10:55:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAMZdPi-SY-r2H7RBLKoNk9yfu5umrrwYMr0ckJoxSx-iqYXdQg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Loic,

On 10/21/20 9:51 AM, Loic Poulain wrote:
> On Wed, 21 Oct 2020 at 18:25, Manivannan Sadhasivam
> <manivannan.sadhasivam@linaro.org> wrote:
>>
>> On Wed, Oct 21, 2020 at 05:43:14PM +0200, Loic Poulain wrote:
>>> On Wed, 21 Oct 2020 at 17:27, Manivannan Sadhasivam <
>>> manivannan.sadhasivam@linaro.org> wrote:
>>>
>>>> On Fri, Oct 16, 2020 at 09:04:14PM -0700, Hemant Kumar wrote:
>>>>> Introduce mhi_get_free_desc_count() API to return number
>>>>
>>>
>>> Would it not be a good idea to have naming aligned with other methods?
>>> Like mhi_queue_num_free() or mhi_queue_no_free_elem...
>>>
>>
>> 'queue_num_free' doesn't sound like getting the number of available
>> descriptors...
> 
> Right, TBH, just wanted the function to start with mhi_queue since
> it's about getting info about remaining size of the DL or UL 'virtual
> queue'. But AFAIU, this is the number of available ring elements that
> is returned here, not the number of transfer descriptors (that can be
> composed of one or more ring elements), so maybe
> mhi_queue_num_free_elements or something similar, I don't want to be
mhi_get_free_desc_count is the number of TREs available which queue APIs 
can use to queue an transfer ring element. My only concern is if we get 
confused with the name mhi_queue_ part of as number of TREs queued ? 
Transfer ring element is indeed a transfer descriptor.
> picky here.
> 
> Regards,
> Loic
> 
Thanks,
Hemant
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
