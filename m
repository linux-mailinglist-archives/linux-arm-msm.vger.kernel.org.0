Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5D93C44517
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2019 18:41:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392841AbfFMQl4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Jun 2019 12:41:56 -0400
Received: from foss.arm.com ([217.140.110.172]:46448 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731742AbfFMQlx (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Jun 2019 12:41:53 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 23D96367;
        Thu, 13 Jun 2019 09:41:53 -0700 (PDT)
Received: from [10.1.197.57] (e110467-lin.cambridge.arm.com [10.1.197.57])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9B7EF3F694;
        Thu, 13 Jun 2019 09:41:49 -0700 (PDT)
Subject: Re: [PATCH 05/10] iommu/dma-iommu: convert to SPDX license tags
To:     Yangtao Li <tiny.windzz@gmail.com>, joro@8bytes.org,
        m.szyprowski@samsung.com, kgene@kernel.org, krzk@kernel.org,
        will.deacon@arm.com, agross@kernel.org, david.brown@linaro.org,
        robdclark@gmail.com, heiko@sntech.de, thierry.reding@gmail.com,
        jonathanh@nvidia.com
Cc:     iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org
References: <20190613162703.986-1-tiny.windzz@gmail.com>
 <20190613162703.986-5-tiny.windzz@gmail.com>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <867e7308-7ef7-b2a3-e088-7e9419878b76@arm.com>
Date:   Thu, 13 Jun 2019 17:41:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190613162703.986-5-tiny.windzz@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 13/06/2019 17:26, Yangtao Li wrote:
> Updates license to use SPDX-License-Identifier.

A more complete version of this (which also covers the header) is 
already queued in -next.

Robin.

> Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
> ---
>   drivers/iommu/dma-iommu.c | 13 +------------
>   1 file changed, 1 insertion(+), 12 deletions(-)
> 
> diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
> index 129c4badf9ae..2d76bac43b82 100644
> --- a/drivers/iommu/dma-iommu.c
> +++ b/drivers/iommu/dma-iommu.c
> @@ -1,3 +1,4 @@
> +// SPDX-License-Identifier: GPL-2.0
>   /*
>    * A fairly generic DMA-API to IOMMU-API glue layer.
>    *
> @@ -5,18 +6,6 @@
>    *
>    * based in part on arch/arm/mm/dma-mapping.c:
>    * Copyright (C) 2000-2004 Russell King
> - *
> - * This program is free software; you can redistribute it and/or modify
> - * it under the terms of the GNU General Public License version 2 as
> - * published by the Free Software Foundation.
> - *
> - * This program is distributed in the hope that it will be useful,
> - * but WITHOUT ANY WARRANTY; without even the implied warranty of
> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> - * GNU General Public License for more details.
> - *
> - * You should have received a copy of the GNU General Public License
> - * along with this program.  If not, see <http://www.gnu.org/licenses/>.
>    */
>   
>   #include <linux/acpi_iort.h>
> 
