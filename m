Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3CB04F822
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Apr 2019 14:06:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728865AbfD3MFC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 Apr 2019 08:05:02 -0400
Received: from usa-sjc-mx-foss1.foss.arm.com ([217.140.101.70]:45888 "EHLO
        foss.arm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728465AbfD3MFB (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 Apr 2019 08:05:01 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 82D9680D;
        Tue, 30 Apr 2019 05:05:00 -0700 (PDT)
Received: from [10.1.196.75] (e110467-lin.cambridge.arm.com [10.1.196.75])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CB4A83F5C1;
        Tue, 30 Apr 2019 05:04:56 -0700 (PDT)
Subject: Re: [PATCH v2 3/4] iommu/dma-iommu: Use the dev->coherent_dma_mask
To:     Christoph Hellwig <hch@infradead.org>
Cc:     Tom Murphy <tmurphy@arista.com>, iommu@lists.linux-foundation.org,
        Heiko Stuebner <heiko@sntech.de>,
        Will Deacon <will.deacon@arm.com>,
        David Brown <david.brown@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-s390@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-rockchip@lists.infradead.org, Kukjin Kim <kgene@kernel.org>,
        Gerald Schaefer <gerald.schaefer@de.ibm.com>,
        Andy Gross <andy.gross@linaro.org>,
        linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        murphyt7@tcd.ie, David Woodhouse <dwmw2@infradead.org>
References: <20190430002952.18909-1-tmurphy@arista.com>
 <20190430002952.18909-4-tmurphy@arista.com>
 <20190430111222.GA3191@infradead.org>
 <da835ce2-f73e-3035-e1d7-d3028cc1a838@arm.com>
 <20190430113253.GA23210@infradead.org>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <96ebb6fc-a889-fa94-09ba-65d505b85724@arm.com>
Date:   Tue, 30 Apr 2019 13:04:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190430113253.GA23210@infradead.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30/04/2019 12:32, Christoph Hellwig wrote:
> On Tue, Apr 30, 2019 at 12:27:02PM +0100, Robin Murphy wrote:
>>> Hmm, I don't think we need the DMA mask for the MSI mapping, this
>>> should probably always use a 64-bit mask.
>>
>> If that were true then we wouldn't need DMA masks for regular mappings
>> either. If we have to map the MSI doorbell at all, then we certainly have to
>> place it at an IOVA that the relevant device is actually capable of
>> addressing.
> 
> Well, as shown by the patch below we don't even look at the DMA mask
> for the MSI page - we just allocate from bottom to top.

In the trivial cookie for unmanaged domains, yes, but in that case the 
responsibility is on VFIO to provide a suitable (i.e. sub-32-bit) 
address range for that cookie in the first place. In the managed case, 
allocation uses the streaming mask via iommu_dma_get_msi_page() calling 
__iommu_dma_map(). Admittedly the mask can then get overlooked when 
reusing an existing mapping, which strictly could pose a problem if you 
have multiple devices with incompatible masks in the same group (and 
such that the PCI stuff doesn't already mitigate it), but that's such an 
obscure corner case that I'm reticent to introduce the complication to 
handle it until it's actually proven necessary.

Robin.
