Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F3FF96F5789
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 May 2023 14:02:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229873AbjECMCU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 May 2023 08:02:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229528AbjECMCT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 May 2023 08:02:19 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 6011359F2;
        Wed,  3 May 2023 05:02:18 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0EA0F2F4;
        Wed,  3 May 2023 05:03:02 -0700 (PDT)
Received: from [10.57.82.232] (unknown [10.57.82.232])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 671F23F5A1;
        Wed,  3 May 2023 05:02:12 -0700 (PDT)
Message-ID: <1a995f30-31fe-354f-ddfe-e944fa36e7a0@arm.com>
Date:   Wed, 3 May 2023 13:01:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 02/20] iommu/terga-gart: Replace set_platform_dma_ops()
 with IOMMU_DOMAIN_PLATFORM
Content-Language: en-GB
To:     Jason Gunthorpe <jgg@nvidia.com>
Cc:     Andy Gross <agross@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Bjorn Andersson <andersson@kernel.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
        Heiko Stuebner <heiko@sntech.de>, iommu@lists.linux.dev,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Joerg Roedel <joro@8bytes.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
        linux-tegra@vger.kernel.org,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Matthew Rosato <mjrosato@linux.ibm.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Rob Clark <robdclark@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Niklas Schnelle <schnelle@linux.ibm.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Chen-Yu Tsai <wens@csie.org>, Will Deacon <will@kernel.org>,
        Yong Wu <yong.wu@mediatek.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Lu Baolu <baolu.lu@linux.intel.com>,
        Kevin Tian <kevin.tian@intel.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Steven Price <steven.price@arm.com>
References: <2-v1-21cc72fcfb22+a7a-iommu_all_defdom_jgg@nvidia.com>
 <1db712d2-9e33-4183-2766-34e32f170507@arm.com> <ZFI/D6mnLKYpdIqx@nvidia.com>
From:   Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <ZFI/D6mnLKYpdIqx@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-8.5 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023-05-03 12:01, Jason Gunthorpe wrote:
> On Wed, May 03, 2023 at 10:17:29AM +0100, Robin Murphy wrote:
>> On 2023-05-01 19:02, Jason Gunthorpe wrote:
>>> tegra-gart seems to be kind of wonky since from the start its 'detach_dev'
>>> op doesn't actually touch hardware. It is supposed to empty the GART of
>>> all translations loaded into it.
>>
>> No, detach should never tear down translations - what if other devices are
>> still using the domain?
> 
> ?? All other drivers do this.

The only driver I'm aware of which effectively tore down mappings by 
freeing its pagetable on detach was sprd-iommu, and that was recently 
fixed on account of it being clearly wrong.

Remember that the GART registers here are literally just its pagetable, 
nothing more.

> The core contract is that this sequence:
> 
>     dom = iommu_domain_alloc()
>     iommu_attach_device(dom, dev)
>     iommu_map(dom,...)
>     iommu_detach_device(dom, dev)
> 
> Will not continue to have the IOVA mapped to the device. We rely on
> this for various error paths.

Yes, I'm not disputing that we expect detach to remove that device's 
*access* to the IOVA (which is what GART can't do...), but it should 
absolutely not destroy the IOVA mapping itself. Follow that sequence 
with iommu_attach_device(dom, dev) again and the caller can expect to be 
able to continue using the same translation.

> If the HW is multi-device then it is supposed to have groups.

Groups are in fact the most practical example: set up a VFIO domain, 
attach two groups to it, map some IOVAs, detach one of the groups, keep 
using the other. If the detach carried an implicit iommu_unmap() there 
would be fireworks.

>>> Call this weirdness PLATFORM which keeps the basic original
>>> ops->detach_dev() semantic alive without needing much special core code
>>> support. I'm guessing it really ends up in a BLOCKING configuration, but
>>> without any forced cleanup it is unsafe.
>>
>> The GART translation aperture is in physical address space, so the truth is
>> that all devices have access to it at the same time as having access to the
>> rest of physical address space. Attach/detach here really are only
>> bookkeeping for which domain currently owns the aperture.
> 
> Oh yuk, that is not an UNMANAGED domain either as we now assume empty
> UNMANAGED domains are blocking in the core...

They are, in the sense that accesses within the aperture won't go 
anywhere. It might help if domain->geometry.force_aperture was 
meaningful, because it's never been clear whether it was supposed to 
reflect a hardware capability (in which case it should be false for 
GART) or be an instruction to the user of the domain (wherein it's a bit 
pointless that everyone always sets it).

Thanks,
Robin.
