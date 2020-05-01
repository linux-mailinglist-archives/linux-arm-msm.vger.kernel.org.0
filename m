Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6090E1C16DF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 May 2020 16:09:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731943AbgEANyG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 May 2020 09:54:06 -0400
Received: from cmccmta2.chinamobile.com ([221.176.66.80]:13148 "EHLO
        cmccmta2.chinamobile.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730661AbgEANyF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 May 2020 09:54:05 -0400
Received: from spf.mail.chinamobile.com (unknown[172.16.121.7]) by rmmx-syy-dmz-app07-12007 (RichMail) with SMTP id 2ee75eac29d8f34-dc397; Fri, 01 May 2020 21:53:31 +0800 (CST)
X-RM-TRANSID: 2ee75eac29d8f34-dc397
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from [192.168.0.104] (unknown[112.1.172.204])
        by rmsmtp-syy-appsvr04-12004 (RichMail) with SMTP id 2ee45eac29d99fd-e9ba9;
        Fri, 01 May 2020 21:53:31 +0800 (CST)
X-RM-TRANSID: 2ee45eac29d99fd-e9ba9
Subject: Re: [PATCH v2]iommu/qcom:fix local_base status check
To:     Joerg Roedel <joro@8bytes.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, robdclark@gmail.com,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
References: <20200418134703.1760-1-tangbin@cmss.chinamobile.com>
 <20200501113745.GE18423@8bytes.org>
From:   Tang Bin <tangbin@cmss.chinamobile.com>
Message-ID: <f59a9807-e804-5331-4ba6-ddcc8cc78f8b@cmss.chinamobile.com>
Date:   Fri, 1 May 2020 21:54:10 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200501113745.GE18423@8bytes.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 2020/5/1 19:37, Joerg Roedel wrote:
> On Sat, Apr 18, 2020 at 09:47:03PM +0800, Tang Bin wrote:
>> The function qcom_iommu_device_probe() does not perform sufficient
>> error checking after executing devm_ioremap_resource(), which can
>> result in crashes if a critical error path is encountered.
>>
>> Fixes: 0ae349a0f33f ("iommu/qcom: Add qcom_iommu")
>>
>> Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
>> ---
>> v2:
>>   - fix commit message and add fixed tag
>> ---
>>   drivers/iommu/qcom_iommu.c | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
> Applied for v5.7, thanks.

Thank you very much.

Tang Bin

>


