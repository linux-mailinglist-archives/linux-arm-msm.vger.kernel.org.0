Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C5881E8E2E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2020 08:31:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725929AbgE3Gbv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 30 May 2020 02:31:51 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:37789 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728293AbgE3Gbv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 30 May 2020 02:31:51 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1590820310; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=GbL0e/7j+u57H6VWh+bFLrd10kAQvlzotWW8nszjMzo=; b=W/apyRPyvHZS9EGeZ1kl2D612rkinXsEXuRVzQdRraw99Ydf/2eZsyW/qjyVmTuvJbcHqF6W
 Ao9M5FDQlyf9W0TpSxwsggFQtjQzUSYBI5enN8dMNUXI1eHUAO6W6yNT+r9NkLauVCn4hVRW
 KOLT94vPlgBDQSHfUi0+QTx+QgA=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 5ed1fdad44a25e0052306302 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 30 May 2020 06:31:09
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 23025C433CB; Sat, 30 May 2020 06:31:08 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.110.93.207] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id EB2B9C433C9;
        Sat, 30 May 2020 06:31:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org EB2B9C433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=wcheng@codeaurora.org
Subject: Re: [RFC v3 0/3] Re-introduce TX FIFO resize for larger EP bursting
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     robh+dt@kernel.org, bjorn.andersson@linaro.org, balbi@kernel.org,
        agross@kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org
References: <1590630363-3934-1-git-send-email-wcheng@codeaurora.org>
 <20200529101214.GA1321073@kroah.com>
From:   Wesley Cheng <wcheng@codeaurora.org>
Message-ID: <48776606-518a-77b7-fe44-0bb84df5ce58@codeaurora.org>
Date:   Fri, 29 May 2020 23:31:06 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200529101214.GA1321073@kroah.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 5/29/2020 3:12 AM, Greg KH wrote:
> On Wed, May 27, 2020 at 06:46:00PM -0700, Wesley Cheng wrote:
>> Changes in V3:
>>  - Removed "Reviewed-by" tags
>>  - Renamed series back to RFC
>>  - Modified logic to ensure that fifo_size is reset if we pass the minimum
>>    threshold.  Tested with binding multiple FDs requesting 6 FIFOs.
>>
>> Changes in V2:
>>  - Modified TXFIFO resizing logic to ensure that each EP is reserved a
>>    FIFO.
>>  - Removed dev_dbg() prints and fixed typos from patches
>>  - Added some more description on the dt-bindings commit message
>>
>> Currently, there is no functionality to allow for resizing the TXFIFOs, and
>> relying on the HW default setting for the TXFIFO depth.  In most cases, the
>> HW default is probably sufficient, but for USB compositions that contain
>> multiple functions that require EP bursting, the default settings
>> might not be enough.  Also to note, the current SW will assign an EP to a
>> function driver w/o checking to see if the TXFIFO size for that particular
>> EP is large enough. (this is a problem if there are multiple HW defined
>> values for the TXFIFO size)
>>
>> It is mentioned in the SNPS databook that a minimum of TX FIFO depth = 3
>> is required for an EP that supports bursting.  Otherwise, there may be
>> frequent occurences of bursts ending.  For high bandwidth functions,
>> such as data tethering (protocols that support data aggregation), mass
>> storage, and media transfer protocol (over FFS), the bMaxBurst value can be
>> large, and a bigger TXFIFO depth may prove to be beneficial in terms of USB
>> throughput. (which can be associated to system access latency, etc...)  It
>> allows for a more consistent burst of traffic, w/o any interruptions, as
>> data is readily available in the FIFO.
>>
>> With testing done using the mass storage function driver, the results show
>> that with a larger TXFIFO depth, the bandwidth increased significantly.
> 
> Why is this still a "RFC" series?  That implies you don't want this
> applied...
> 

Hi Greg,

As Felipe mentioned, we need to make sure that this TX FIFO resize logic
is carefully thought out, since the behavior could be different based
off the HW configuration as shown in the past.  Eventually, I hope that
this does get applied, but I think the changes needs more detailed
reviews, as there may be potential shortfalls I did not consider due to
my limited knowledge of what happened w/ the previous logic.  That's
pretty much the reason for tagging it as a RFC, since we still need to
hash out if this is the right approach.

Thanks!

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
