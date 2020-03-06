Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6A64517B871
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2020 09:40:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725923AbgCFIkS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Mar 2020 03:40:18 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:57958 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725855AbgCFIkS (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Mar 2020 03:40:18 -0500
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id C12553D46A0248898ACC;
        Fri,  6 Mar 2020 16:40:12 +0800 (CST)
Received: from [127.0.0.1] (10.177.223.23) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.439.0; Fri, 6 Mar 2020
 16:40:05 +0800
Subject: Re: [PATCH 00/14] iommu: Move iommu_fwspec out of 'struct device'
To:     Joerg Roedel <joro@8bytes.org>, <iommu@lists.linux-foundation.org>
CC:     <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <virtualization@lists.linux-foundation.org>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jean-Philippe Brucker <jean-philippe@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linuxarm <linuxarm@huawei.com>
References: <20200228150820.15340-1-joro@8bytes.org>
From:   Hanjun Guo <guohanjun@huawei.com>
Message-ID: <ea839f32-194a-29ea-57fc-22caea40b981@huawei.com>
Date:   Fri, 6 Mar 2020 16:39:37 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <20200228150820.15340-1-joro@8bytes.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.223.23]
X-CFilter-Loop: Reflected
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Joerg,

On 2020/2/28 23:08, Joerg Roedel wrote:
> Hi,
> 
> here is a patch-set to rename iommu_param to dev_iommu and
> establish it as a struct for generic per-device iommu-data.
> Also move the iommu_fwspec pointer from struct device into
> dev_iommu to have less iommu-related pointers in struct
> device.
> 
> The bigger part of this patch-set moves the iommu_priv
> pointer from struct iommu_fwspec to dev_iommu, making is
> usable for iommu-drivers which do not use fwspecs.
> 
> The changes for that were mostly straightforward, except for
> the arm-smmu (_not_ arm-smmu-v3) and the qcom iommu driver.
> Unfortunatly I don't have the hardware for those, so any
> testing of these drivers is greatly appreciated.

I tested this patch set on Kunpeng 920 ARM64 server which
using smmu-v3 with ACPI booting, but triggered a NULL
pointer dereference and panic at boot:

[   14.832752] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000010
[   14.851425] Mem abort info:
[   14.858940]   ESR = 0x96000004
[   14.866519]   EC = 0x25: DABT (current EL), IL = 32 bits
[   14.876580]   SET = 0, FnV = 0
[   14.884412]   EA = 0, S1PTW = 0
[   14.892275] Data abort info:
[   14.899802]   ISV = 0, ISS = 0x00000004
[   14.908141]   CM = 0, WnR = 0
[   14.915401] [0000000000000010] user address but active_mm is swapper
[   14.926367] Internal error: Oops: 96000004 [#1] SMP
[   14.935992] Modules linked in:
[   14.943724] CPU: 36 PID: 1 Comm: swapper/0 Not tainted 5.6.0-rc2+ #4
[   14.955020] Hardware name: Huawei TaiShan 2280 V2/BC82AMDC, BIOS 0.81 07/10/2019
[   14.972008] pstate: 80c00009 (Nzcv daif +PAN +UAO)
[   14.981774] pc : iort_iommu_configure+0xdc/0x230
[   14.991481] lr : iort_iommu_configure+0xcc/0x230
[   15.001075] sp : ffff800011b3bad0
[   15.009338] x29: ffff800011b3bad0 x28: ffff8000110a8968
[   15.019483] x27: ffff800011540000 x26: ffff8000110004c8
[   15.029390] x25: 0000000000000006 x24: 0000000000000000
[   15.039336] x23: 0000000000000000 x22: 0000000000000000
[   15.049270] x21: ffff8000113f9000 x20: ffff00002f5b0414
[   15.059038] x19: ffff002fdc8f90b0 x18: ffffffffffffffff
[   15.068590] x17: 0000000000000008 x16: 0000000000000005
[   15.078182] x15: ffff8000113f9948 x14: ffff2027d993e91c
[   15.087824] x13: ffff2027d993e16d x12: 0000000000000000
[   15.097440] x11: 0101010101010101 x10: 00000000ffffff76
[   15.106995] x9 : 0000000000000000 x8 : ffff2027d9a79b80
[   15.116629] x7 : 0000000000000000 x6 : 000000000000003f
[   15.126252] x5 : 0000000000000001 x4 : 0000000000000000
[   15.135781] x3 : 0000000000000600 x2 : 0000000000000040
[   15.145221] x1 : 0000000000000004 x0 : 0000000000000001
[   15.154472] Call trace:
[   15.160674]  iort_iommu_configure+0xdc/0x230
[   15.168752]  acpi_dma_configure+0x88/0xb8
[   15.176461]  pci_dma_configure+0xc0/0xe0
[   15.183935]  really_probe+0xbc/0x498
[   15.190853]  driver_probe_device+0x12c/0x148
[   15.198426]  device_driver_attach+0x74/0x98
[   15.205860]  __driver_attach+0xc4/0x178
[   15.213045]  bus_for_each_dev+0x84/0xd8
[   15.220185]  driver_attach+0x30/0x40
[   15.227051]  bus_add_driver+0x170/0x258
[   15.234241]  driver_register+0x64/0x118
[   15.241432]  __pci_register_driver+0x58/0x68
[   15.249202]  hibmc_pci_driver_init+0x28/0x30
[   15.256966]  do_one_initcall+0x54/0x250
[   15.264301]  kernel_init_freeable+0x24c/0x2e0
[   15.272164]  kernel_init+0x18/0x110
[   15.279068]  ret_from_fork+0x10/0x18
[   15.286033] Code: 2a0003f6 35000840 b9401a80 360005a0 (b94012e0)
[   15.295791] ---[ end trace 881fe61747538fd0 ]---
[   15.304039] Kernel panic - not syncing: Fatal exception

I don't have a time slot to do the detail investigation, but seems
that we don't have the iommu_fwspec properly initialized with ACPI
booting after applying this patch set.

Thanks
Hanjun

