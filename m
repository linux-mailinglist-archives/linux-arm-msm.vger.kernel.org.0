Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C0A21A23FF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2020 16:23:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728692AbgDHOXJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Apr 2020 10:23:09 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:41518 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728660AbgDHOXI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Apr 2020 10:23:08 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20200408142306euoutp01c3ede2a603503843f6196161bb7a8fbc~D3i7j5zfR0959509595euoutp01Q
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Apr 2020 14:23:06 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20200408142306euoutp01c3ede2a603503843f6196161bb7a8fbc~D3i7j5zfR0959509595euoutp01Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1586355786;
        bh=fPbQcPR1oF/v5hK09P8uzwfqplWO3pBhbWYE2b0EXHE=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=Q16PeABv1KJDXsi+C6wbSRMnvW0UWxgws6fTgiTAHn8bC8/JzqU+/Rnnt8dOjLYGB
         XruNzZbDx3gU7i2vk7971pGcLF/MO7BdK5t/RGCxyjKDmiVVOaSMJSzpFsn/gyqoH+
         kg3zpOvmQbH5I5lmEVI8kxn8Xs3BHwPbX/NWVT8A=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20200408142306eucas1p2c1e75b5c003294b987b54204f8374a6e~D3i7Bz_u61843118431eucas1p2o;
        Wed,  8 Apr 2020 14:23:06 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id B5.D7.60679.A4EDD8E5; Wed,  8
        Apr 2020 15:23:06 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20200408142305eucas1p1425276324bb62d9d5ce10138dbc91efb~D3i6uRwxk0469604696eucas1p1_;
        Wed,  8 Apr 2020 14:23:05 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200408142305eusmtrp1312d5ec55fb881d4b3abc5bda7d3acb0~D3i6tN3IK1183911839eusmtrp1F;
        Wed,  8 Apr 2020 14:23:05 +0000 (GMT)
X-AuditID: cbfec7f4-0cbff7000001ed07-51-5e8dde4a50e2
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 7C.B7.07950.94EDD8E5; Wed,  8
        Apr 2020 15:23:05 +0100 (BST)
Received: from [106.210.88.143] (unknown [106.210.88.143]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200408142304eusmtip13441c366871541f79223a15a5111bf46~D3i5Y6XIu1251612516eusmtip1B;
        Wed,  8 Apr 2020 14:23:04 +0000 (GMT)
Subject: Re: [RFC PATCH 31/34] iommu/exynos: Create iommu_device in struct
 exynos_iommu_owner
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        David Woodhouse <dwmw2@infradead.org>,
        Lu Baolu <baolu.lu@linux.intel.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Clark <robdclark@gmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Gerald Schaefer <gerald.schaefer@de.ibm.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc:     iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-tegra@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        Joerg Roedel <jroedel@suse.de>
Message-ID: <f59b0bb3-8c08-9cc9-bb1a-e69b7b226f60@samsung.com>
Date:   Wed, 8 Apr 2020 16:23:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
        Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <449e7f16-e719-9617-ec92-63b82c0bc33f@samsung.com>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01SfUzMcRze934v9ysuv070WczLjRAisX0t8zZ//Lw1zJrZiqPfEpV2V8jZ
        tO6GTtHpj3LlVF4KpbpU7pjcUYfbXZGdJKHacC6Z2rwu7vp56b/neT7P830+n+3LEFIjHcIk
        pqTxihR5koz2Jxtavjnnr+vOjVt42kNjZ+8PEtfp6mlsb/pIYt2VfAKbPO9o/KvnA4VLmqJw
        5rU2Cmv0ZSTOLqoR4/xH50T4dO8HAre2eqmuySHG7eZiGrerHyP8+fUvAueVqglc2HpHhLOH
        9DTO0kTit6VfCWz51Efhb2YDicsdBhprupasDOH6LAYRV2moRJylx0pzJv1LMVdXEcYZr2bT
        XJfrNs0ZHm7m6i4e5fI7yhGXq/5Ic40uA8HV2VXcoHHKpoDt/svi+aTEA7xiwfKd/ntavjdQ
        qS2zDuVUW1Emejxdi/wYYBeD4161WIv8GSlbgaDzeQElkCEEDtctQiCDCJov9oj+Rn6eqv7j
        Kkfg0ZpGBlJ2AIHr/gYfHs/ugP6yYcKHaTYCtP1a2hcIYr+QUNJcP/IswXaI4PKAUexzSdjl
        YHrwZiRBsjMgZ7iT9uEJbCw4ezoowRMID8/2kT7sx64AtaNgxEOwU0FdX0QIOBg6+86LfAXA
        vmNAk1f8Z+81UHbBRgt4PLhtN8QCngz2/BxSCKgRvHFWiQWSg6A9qxAJrijocn73phlvxRyo
        Ni8Q5FVgc5aKfTKwAdDRHygsEQBnGgoIQZbAiWNSwR0Ketv1f7WWtidEHpLpR52mH3WOftQ5
        +v+9JYi8ioL5dGVyAq9clMIfDFfKk5XpKQnhu/cnG5H3J9uHbUM3kfnnLitiGSQbK7l7OzdO
        SskPKDOSrQgYQhYkWZ/llSTx8ozDvGL/DkV6Eq+0okkMKQuWRJa9j5WyCfI0fh/Pp/KKv1MR
        4xeSiRpPSKPd3X41QfYrYyauHqtTBaQf2Xt8WlOEwmS/mcpMaA6bRs0cuButcn869qR/S15M
        +fOtS3WFU2wW1aUHA/FtXWGGQUMU9Sx0W0PNwXG1G0PQK7fnS5prTWNt5bwXbRFPn3a7X/xI
        nH1yrSdGpvLoMg5XRYYqYjQL52ImyHwkXEYq98gjwgiFUv4b+k7N28UDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA03Se0hTURwHcM7uwyktblPzJFE2gkJxuc3pscxSKG4FoRZJltpNL2o6J7uz
        p5A5/9DlE8ty1pxiaGpYW1o+8LHKUjMVQ8Q0fAwMTBOL6CGu6Qz873fO9/s5cODHx4SvCXd+
        YoqaVaUwySLSCe9beTvhfexzXrRPZZsX+jDzF0emokYS9XUs4KjocTGGmr9+IZF1eo5Aho4D
        KKNukEBZukoc5ZQ9dUDFvQ95qGBmDkMDA7ZjUUe/AxpueUCiYc0QQEuTVgwVVmgwdH+gnYdy
        fuhIlJklQ7MVvzDUtWgh0O8WPY6q+/UkyhqXH3anLV16Hl2vrwd017SZpJt1Ew60qcaTNtbm
        kPT4SBtJ63vCaFPVTbp4tBrQeZoFkn4xosdoU98N+rtxR+jmSHGgSpmmZj0SlJz6oOicBEnF
        kgAklvoGiCUy/6j9UrloX1BgHJuceJlV7Qu6IE7o/tNEpHbvuZrbYAYZYGiXFjjyIeULl/Mb
        CC1w4gupRwC2PhnF7MF22FOSQdhnZ7g8oiXtpXkAawez1wJnKgbOV66sAZKSQO28veRC/cVh
        1WgruRpg1CgPvqneatezAN6dKOWtBgIqCDa/m1rTOLUb5q6MrQFXKgoWaFqBvbMF9pRa8NXZ
        kToENf331h/1g3qT3WLUTqhpLFuf3eCYpZxXCIS6DVy3geg2EN0GYgB4LXBh0zhFvIKTijlG
        waWlxItjlQojsG1QU/fv5y+BduGUGVB8INok6GzLixYSzGXumsIMIB8TuQhOZNquBHHMteus
        ShmjSktmOTOQ2z5XhLm7xipt+5iijpHIJf4oQOIv85f5IZGbIJvqOi+k4hk1m8Syqazqv+Px
        Hd0zgF9EQZh179nQn955PiLGdMtyybTo0hDuMP7iveFE5oUsw9hQPespHwO3Syev5Nc/Oy0M
        Xo4ypjPZhGwpgqmz7jeGHvpU3h7SHYN9+7nN62NwYHv8QQ3mc7wgPSS9ppLfdNSjvXfqVceZ
        ZcZa1XLkZefFlUjngBlDSWz4yaQ7FWYRziUwEk9MxTH/APyyaD1XAwAA
X-CMS-MailID: 20200408142305eucas1p1425276324bb62d9d5ce10138dbc91efb
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200407184501eucas1p25407bc96e4345df406cf6ba061ae6a82
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200407184501eucas1p25407bc96e4345df406cf6ba061ae6a82
References: <20200407183742.4344-1-joro@8bytes.org>
        <CGME20200407184501eucas1p25407bc96e4345df406cf6ba061ae6a82@eucas1p2.samsung.com>
        <20200407183742.4344-32-joro@8bytes.org>
        <449e7f16-e719-9617-ec92-63b82c0bc33f@samsung.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi again,

On 08.04.2020 14:23, Marek Szyprowski wrote:
> Hi Joerg,
>
> On 07.04.2020 20:37, Joerg Roedel wrote:
>> From: Joerg Roedel <jroedel@suse.de>
>>
>> The 'struct exynos_iommu_owner' is an umbrella for multiple SYSMMU
>> instances attached to one master. As such all these instances are
>> handled the same, they are all configured with the same iommu_domain,
>> for example.
>>
>> The IOMMU core code expects each device to have only one IOMMU
>> attached, so create the IOMMU-device for the umbrella instead of each
>> hardware SYSMMU.
>>
>> Signed-off-by: Joerg Roedel <jroedel@suse.de>
>> ---
>>   drivers/iommu/exynos-iommu.c | 96 +++++++++++++++++++++++++++---------
>>   1 file changed, 73 insertions(+), 23 deletions(-)
>>
>> diff --git a/drivers/iommu/exynos-iommu.c b/drivers/iommu/exynos-iommu.c
>> index 186ff5cc975c..86ecccbf0438 100644
>> --- a/drivers/iommu/exynos-iommu.c
>> +++ b/drivers/iommu/exynos-iommu.c
>> @@ -235,6 +235,8 @@ struct exynos_iommu_owner {
>>       struct list_head controllers;    /* list of 
>> sysmmu_drvdata.owner_node */
>>       struct iommu_domain *domain;    /* domain this device is 
>> attached */
>>       struct mutex rpm_lock;        /* for runtime pm of all sysmmus */
>> +
>> +    struct iommu_device iommu;    /* IOMMU core handle */
>>   };
>>     /*
>> @@ -274,8 +276,6 @@ struct sysmmu_drvdata {
>>       struct list_head owner_node;    /* node for owner controllers 
>> list */
>>       phys_addr_t pgtable;        /* assigned page table structure */
>>       unsigned int version;        /* our version */
>> -
>> -    struct iommu_device iommu;    /* IOMMU core handle */
>>   };
>>     static struct exynos_iommu_domain *to_exynos_domain(struct 
>> iommu_domain *dom)
>> @@ -625,18 +625,6 @@ static int exynos_sysmmu_probe(struct 
>> platform_device *pdev)
>>       data->sysmmu = dev;
>>       spin_lock_init(&data->lock);
>>   -    ret = iommu_device_sysfs_add(&data->iommu, &pdev->dev, NULL,
>> -                     dev_name(data->sysmmu));
>> -    if (ret)
>> -        return ret;
>> -
>> -    iommu_device_set_ops(&data->iommu, &exynos_iommu_ops);
>> -    iommu_device_set_fwnode(&data->iommu, &dev->of_node->fwnode);
>
> The iommu_device_set_fwnode() call is lost during this conversion, 
> what breaks driver operation. Most of the above IOMMU fw calls you 
> have moved to xlate function. I've checked briefly but it looks that 
> there is a chicken-egg problem here. The owner structure is allocated 
> and initialized from of_xlate(), which won't be called without linking 
> the problem iommu structure with the fwnode first, what might be done 
> only in sysmmu_probe(). I will check how to handle this in a different 
> way.

I've played with this a bit and it looks that won't be easy to make it 
working on ARM 32bit.

I need a place to initialize properly all the structures for the given 
master (IOMMU client device, the one which performs DMA operations).

I tried to move all the initialization from xlate() to device_probe(), 
but such approach doesn't work.

On ARM32bit exynos_iommu_device_probe() is called by the device core and 
IOMMU framework very early, before the Exynos SYSMMU platform devices 
(controllers) are probed yet. Even iommu class is not yet initialized 
that time, so returning anything successful from it causes following 
NULL ptr dereference:

Unable to handle kernel NULL pointer dereference at virtual address 0000004c
...

(__iommu_probe_device) from [<c055b334>] (iommu_probe_device+0x18/0x114)
(iommu_probe_device) from [<c055b4ac>] (iommu_bus_notifier+0x7c/0x94)
(iommu_bus_notifier) from [<c014e8ec>] (notifier_call_chain+0x44/0x84)
(notifier_call_chain) from [<c014e9ec>] 
(__blocking_notifier_call_chain+0x48/0x60)
(__blocking_notifier_call_chain) from [<c014ea1c>] 
(blocking_notifier_call_chain+0x18/0x20)
(blocking_notifier_call_chain) from [<c05c8d1c>] (device_add+0x3e8/0x704)
(device_add) from [<c07bafc4>] (of_platform_device_create_pdata+0x90/0xc4)
(of_platform_device_create_pdata) from [<c07bb138>] 
(of_platform_bus_create+0x134/0x48c)
(of_platform_bus_create) from [<c07bb1a4>] 
(of_platform_bus_create+0x1a0/0x48c)
(of_platform_bus_create) from [<c07bb63c>] (of_platform_populate+0x84/0x114)
(of_platform_populate) from [<c1125e9c>] 
(of_platform_default_populate_init+0x90/0xac)
(of_platform_default_populate_init) from [<c010326c>] 
(do_one_initcall+0x80/0x42c)
(do_one_initcall) from [<c1101074>] (kernel_init_freeable+0x15c/0x208)
(kernel_init_freeable) from [<c0afdde0>] (kernel_init+0x8/0x118)
(kernel_init) from [<c01010b4>] (ret_from_fork+0x14/0x20)

I've tried returning ERR_PTR(-EPROBE_DEFER) from device_probe(), but I 
doesn't work there. Some more changes in the framework are needed...

 > ...

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

