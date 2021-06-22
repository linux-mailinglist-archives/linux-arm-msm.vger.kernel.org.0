Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF7C13AFC9A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jun 2021 07:27:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229955AbhFVF3u (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Jun 2021 01:29:50 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:59770 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230052AbhFVF3t (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Jun 2021 01:29:49 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1624339648; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=kX/KWqvomt6ymo0vZ4ejVIxk4DjhHljAq6y2gDsHnm0=; b=EOpgb4WB2stGxLxte3MUpoXNgx34QFidqozSoDB/anVc5zWIFR5JTG8lB+nXmIRgnwqpBeqn
 VXXLouXJ+wet6l6kqEz3z75I1z6KtkWlNd2puZpQD6/MHPgSkQNF1GCi+N4fWoL1HYwDGxK8
 0iDBbSCDz62XNq8smYpA0z+WfKE=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 60d174ad2eaeb98b5ee5818e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 22 Jun 2021 05:27:09
 GMT
Sender: wcheng=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 65C7AC4360C; Tue, 22 Jun 2021 05:27:09 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.110.90.136] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3255DC433F1;
        Tue, 22 Jun 2021 05:27:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3255DC433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=wcheng@codeaurora.org
Subject: Re: [PATCH v10 1/6] usb: gadget: udc: core: Introduce check_config to
 verify USB configuration
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     balbi@kernel.org, robh+dt@kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, frowand.list@gmail.com,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        jackp@codeaurora.org, fntoth@gmail.com,
        heikki.krogerus@linux.intel.com, andy.shevchenko@gmail.com
References: <1623923899-16759-1-git-send-email-wcheng@codeaurora.org>
 <1623923899-16759-2-git-send-email-wcheng@codeaurora.org>
 <YMstVXuwAQm5Cea/@kroah.com>
From:   Wesley Cheng <wcheng@codeaurora.org>
Message-ID: <241aeca7-3c24-29be-c9db-7e8da0b65baa@codeaurora.org>
Date:   Mon, 21 Jun 2021 22:27:06 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YMstVXuwAQm5Cea/@kroah.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 6/17/2021 4:09 AM, Greg KH wrote:
> On Thu, Jun 17, 2021 at 02:58:14AM -0700, Wesley Cheng wrote:
>> Some UDCs may have constraints on how many high bandwidth endpoints it can
>> support in a certain configuration.  This API allows for the composite
>> driver to pass down the total number of endpoints to the UDC so it can verify
>> it has the required resources to support the configuration.
>>
>> Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
>> ---
>>  drivers/usb/gadget/udc/core.c | 25 +++++++++++++++++++++++++
>>  include/linux/usb/gadget.h    |  5 +++++
>>  2 files changed, 30 insertions(+)
>>
>> diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/core.c
>> index b7f0b1e..e33ae2d 100644
>> --- a/drivers/usb/gadget/udc/core.c
>> +++ b/drivers/usb/gadget/udc/core.c
>> @@ -1003,6 +1003,31 @@ int usb_gadget_ep_match_desc(struct usb_gadget *gadget,
>>  }
>>  EXPORT_SYMBOL_GPL(usb_gadget_ep_match_desc);
>>  
>> +/**
>> + * usb_gadget_check_config - checks if the UDC can support the number of eps
>> + * @gadget: controller to check the USB configuration
>> + * @ep_map: bitmap of endpoints being requested by a USB configuration

Hi Greg,

> 
> Will a u64 really hold all of the possible endpoints?
> 

Ah, should be a u32 bitmap, and that is enough as USB spec only allows
32 EPs (IN+OUT eps) total.  That hasn't changed since USB2, so I assume
that will stay the same moving forward.  I can fix that.

> Why make it odd like this, why not just provide a list like we do in the
> USB core with the structure that USB drivers use?  What can a driver do
> with a bitmap only?
> 

I didn't want the ep bookeeping here to be too complicated.  For
example, in the TXFIFO resize situation, just knowing the number of
endpoints used can help determine if we have enough internal controller
memory to allocate per endpoint. (at minimum 1 FIFO per EP)  If the USB
configuration is going to be requesting more endpoints than FIFO memory
it has (unlikely), then it will fail the config bind.  Otherwise, we'd
end up enumerating w/ the host w/ the interfaces that were starved of
FIFO memory to be broken/non-functional.  This was one of the concerns
that Felipe had in our initial discussions.

In addition, at the time of function driver binding, the amount of
information we have is minimal per endpoint, as most of it is populated
once the host places the device into the CONFIGURED state. (ie when the
device knows which configuration is being enabled, hence which EPs are
being used)

Thanks
Wesley Cheng

> 
> thanks,
> 
> greg k-h
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
