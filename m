Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F30A2354D25
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Apr 2021 08:57:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237784AbhDFG5M (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Apr 2021 02:57:12 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:15912 "EHLO
        szxga06-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233519AbhDFG5M (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Apr 2021 02:57:12 -0400
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4FDyvl3gPFzjYJd;
        Tue,  6 Apr 2021 14:55:15 +0800 (CST)
Received: from [127.0.0.1] (10.40.193.166) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.498.0; Tue, 6 Apr 2021
 14:56:54 +0800
Subject: Re: [PATCH] iommu: Add device name to iommu map/unmap trace events
To:     Joerg Roedel <joro@8bytes.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
References: <20210209123620.19993-1-saiprakash.ranjan@codeaurora.org>
 <20210212105039.GG7302@8bytes.org>
CC:     Will Deacon <will@kernel.org>, <linux-kernel@vger.kernel.org>,
        <iommu@lists.linux-foundation.org>,
        <linux-arm-msm@vger.kernel.org>,
        "Robin Murphy" <robin.murphy@arm.com>,
        <linux-arm-kernel@lists.infradead.org>, <linuxarm@huawei.com>
From:   "chenxiang (M)" <chenxiang66@hisilicon.com>
Message-ID: <626fbcb8-b84f-1522-4ec3-9c7c1f5f7a93@hisilicon.com>
Date:   Tue, 6 Apr 2021 14:56:53 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <20210212105039.GG7302@8bytes.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.40.193.166]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,


在 2021/2/12 18:50, Joerg Roedel 写道:
> On Tue, Feb 09, 2021 at 06:06:20PM +0530, Sai Prakash Ranjan wrote:
>> diff --git a/include/linux/iommu.h b/include/linux/iommu.h
>> index 5e7fe519430a..6064187d9bb6 100644
>> --- a/include/linux/iommu.h
>> +++ b/include/linux/iommu.h
>> @@ -87,6 +87,7 @@ struct iommu_domain {
>>   	void *handler_token;
>>   	struct iommu_domain_geometry geometry;
>>   	void *iova_cookie;
>> +	char dev_name[32];
>>   };
> No, definitly not. A domain is a device DMA address space which can be
> used by more than one device. Just look at IOMMU groups with more than
> one member device, in this case just one device name would be very
> misleading.

Is it possible to use group id to identify different domains?


>
> Regards,
>
> 	Joerg
> _______________________________________________
> iommu mailing list
> iommu@lists.linux-foundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/iommu
>
> .
>


