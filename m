Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA4CB1AB83B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2020 08:41:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408088AbgDPGlD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Apr 2020 02:41:03 -0400
Received: from cmccmta2.chinamobile.com ([221.176.66.80]:47499 "EHLO
        cmccmta2.chinamobile.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407974AbgDPGk7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Apr 2020 02:40:59 -0400
Received: from spf.mail.chinamobile.com (unknown[172.16.121.13]) by rmmx-syy-dmz-app06-12006 (RichMail) with SMTP id 2ee65e97fddaad9-7cb5c; Thu, 16 Apr 2020 14:40:28 +0800 (CST)
X-RM-TRANSID: 2ee65e97fddaad9-7cb5c
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from [172.20.145.111] (unknown[112.25.154.146])
        by rmsmtp-syy-appsvr07-12007 (RichMail) with SMTP id 2ee75e97fdda580-29be2;
        Thu, 16 Apr 2020 14:40:28 +0800 (CST)
X-RM-TRANSID: 2ee75e97fdda580-29be2
Subject: Re: [PATCH] iommu/qcom:fix local_base status check
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     agross@kernel.org, robdclark@gmail.com, joro@8bytes.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
References: <20200402063302.20640-1-tangbin@cmss.chinamobile.com>
 <20200402064552.GG663905@yoga>
From:   Tang Bin <tangbin@cmss.chinamobile.com>
Message-ID: <7a565c74-f223-83da-cf32-0474be6c9460@cmss.chinamobile.com>
Date:   Thu, 16 Apr 2020 14:42:23 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200402064552.GG663905@yoga>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bjorn:

On 2020/4/2 14:45, Bjorn Andersson wrote:
> On Wed 01 Apr 23:33 PDT 2020, Tang Bin wrote:
>
>> Release resources when exiting on error.
>>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Thanks for your positive feedback.

I don't know whether the commit message affect this patch's result. If 
so, I think the commit message need more clarification. As follwos:

         The function qcom_iommu_device_probe() does not perform 
sufficient error checking after executing devm_ioremap_resource(), which 
can result in crashes if a critical error path is encountered.

Fixes: 0ae349a0("iommu/qcom: Add qcom_iommu")


I'm waiting for your reply actively.

Thanks,

Tang Bin


>
>> Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
>> ---
>>   drivers/iommu/qcom_iommu.c | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/iommu/qcom_iommu.c b/drivers/iommu/qcom_iommu.c
>> index 4328da0b0..c08aa9651 100644
>> --- a/drivers/iommu/qcom_iommu.c
>> +++ b/drivers/iommu/qcom_iommu.c
>> @@ -813,8 +813,11 @@ static int qcom_iommu_device_probe(struct platform_device *pdev)
>>   	qcom_iommu->dev = dev;
>>   
>>   	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> -	if (res)
>> +	if (res) {
>>   		qcom_iommu->local_base = devm_ioremap_resource(dev, res);
>> +		if (IS_ERR(qcom_iommu->local_base))
>> +			return PTR_ERR(qcom_iommu->local_base);
>> +	}
>>   
>>   	qcom_iommu->iface_clk = devm_clk_get(dev, "iface");
>>   	if (IS_ERR(qcom_iommu->iface_clk)) {
>> -- 
>> 2.20.1.windows.1
>>
>>
>>


