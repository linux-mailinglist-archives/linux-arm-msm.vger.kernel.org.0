Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 420C51ABDA6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2020 12:11:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2441115AbgDPKL1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Apr 2020 06:11:27 -0400
Received: from cmccmta2.chinamobile.com ([221.176.66.80]:11705 "EHLO
        cmccmta2.chinamobile.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2436915AbgDPKL0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Apr 2020 06:11:26 -0400
Received: from spf.mail.chinamobile.com (unknown[172.16.121.3]) by rmmx-syy-dmz-app07-12007 (RichMail) with SMTP id 2ee75e982f35121-843c8; Thu, 16 Apr 2020 18:11:01 +0800 (CST)
X-RM-TRANSID: 2ee75e982f35121-843c8
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from [172.20.145.111] (unknown[112.25.154.146])
        by rmsmtp-syy-appsvr02-12002 (RichMail) with SMTP id 2ee25e982f3465a-49ba9;
        Thu, 16 Apr 2020 18:11:01 +0800 (CST)
X-RM-TRANSID: 2ee25e982f3465a-49ba9
Subject: Re: [PATCH] iommu/qcom:fix local_base status check
To:     Robin Murphy <robin.murphy@arm.com>, agross@kernel.org,
        bjorn.andersson@linaro.org, robdclark@gmail.com
Cc:     linux-arm-msm@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
References: <20200402063302.20640-1-tangbin@cmss.chinamobile.com>
 <7f8cadbf-2568-19f5-610f-6ae7d9846ec6@arm.com>
From:   Tang Bin <tangbin@cmss.chinamobile.com>
Message-ID: <252fecfd-28bc-7331-c17e-70032cdb980e@cmss.chinamobile.com>
Date:   Thu, 16 Apr 2020 18:12:56 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <7f8cadbf-2568-19f5-610f-6ae7d9846ec6@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 2020/4/16 18:05, Robin Murphy wrote:
> On 2020-04-02 7:33 am, Tang Bin wrote:
>> Release resources when exiting on error.
>>
>> Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
>> ---
>>   drivers/iommu/qcom_iommu.c | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/iommu/qcom_iommu.c b/drivers/iommu/qcom_iommu.c
>> index 4328da0b0..c08aa9651 100644
>> --- a/drivers/iommu/qcom_iommu.c
>> +++ b/drivers/iommu/qcom_iommu.c
>> @@ -813,8 +813,11 @@ static int qcom_iommu_device_probe(struct 
>> platform_device *pdev)
>>       qcom_iommu->dev = dev;
>>         res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> -    if (res)
>> +    if (res) {
>>           qcom_iommu->local_base = devm_ioremap_resource(dev, res);
>> +        if (IS_ERR(qcom_iommu->local_base))
>> +            return PTR_ERR(qcom_iommu->local_base);
>> +    }
>
> ...or just use devm_platform_ioremap_resource() to make the whole 
> thing simpler.
Yes, I was going to simplify the code here, but status check is still 
required.

So I'm waiting.

Thanks,

Tang Bin



