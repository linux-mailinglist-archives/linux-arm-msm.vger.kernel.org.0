Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E00A216BA3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2020 13:34:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727827AbgGGLea (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Jul 2020 07:34:30 -0400
Received: from foss.arm.com ([217.140.110.172]:42380 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726540AbgGGLe3 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Jul 2020 07:34:29 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 155AC1FB;
        Tue,  7 Jul 2020 04:34:29 -0700 (PDT)
Received: from [10.57.21.32] (unknown [10.57.21.32])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 842DE3F71E;
        Tue,  7 Jul 2020 04:34:27 -0700 (PDT)
Subject: Re: [PATCH v2 2/6] iommu/io-pgtable: Allow a pgtable implementation
 to skip TLB operations
To:     Jordan Crouse <jcrouse@codeaurora.org>,
        linux-arm-msm@vger.kernel.org
Cc:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        iommu@lists.linux-foundation.org,
        John Stultz <john.stultz@linaro.org>,
        freedreno@lists.freedesktop.org, Joerg Roedel <jroedel@suse.de>,
        Will Deacon <will@kernel.org>, Yong Wu <yong.wu@mediatek.com>,
        linux-kernel@vger.kernel.org
References: <20200626200414.14382-1-jcrouse@codeaurora.org>
 <20200626200414.14382-3-jcrouse@codeaurora.org>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <99ecd948-7476-b9b4-12b4-1ced0084654f@arm.com>
Date:   Tue, 7 Jul 2020 12:34:26 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200626200414.14382-3-jcrouse@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-06-26 21:04, Jordan Crouse wrote:
> Allow a io-pgtable implementation to skip TLB operations by checking for
> NULL pointers in the helper functions. It will be up to to the owner
> of the io-pgtable instance to make sure that they independently handle
> the TLB correctly.

I don't really understand what this is for - tricking the IOMMU driver 
into not performing its TLB maintenance at points when that maintenance 
has been deemed necessary doesn't seem like the appropriate way to 
achieve anything good :/

Robin.

> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> ---
> 
>   include/linux/io-pgtable.h | 11 +++++++----
>   1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/include/linux/io-pgtable.h b/include/linux/io-pgtable.h
> index 53d53c6c2be9..bbed1d3925ba 100644
> --- a/include/linux/io-pgtable.h
> +++ b/include/linux/io-pgtable.h
> @@ -210,21 +210,24 @@ struct io_pgtable {
>   
>   static inline void io_pgtable_tlb_flush_all(struct io_pgtable *iop)
>   {
> -	iop->cfg.tlb->tlb_flush_all(iop->cookie);
> +	if (iop->cfg.tlb)
> +		iop->cfg.tlb->tlb_flush_all(iop->cookie);
>   }
>   
>   static inline void
>   io_pgtable_tlb_flush_walk(struct io_pgtable *iop, unsigned long iova,
>   			  size_t size, size_t granule)
>   {
> -	iop->cfg.tlb->tlb_flush_walk(iova, size, granule, iop->cookie);
> +	if (iop->cfg.tlb)
> +		iop->cfg.tlb->tlb_flush_walk(iova, size, granule, iop->cookie);
>   }
>   
>   static inline void
>   io_pgtable_tlb_flush_leaf(struct io_pgtable *iop, unsigned long iova,
>   			  size_t size, size_t granule)
>   {
> -	iop->cfg.tlb->tlb_flush_leaf(iova, size, granule, iop->cookie);
> +	if (iop->cfg.tlb)
> +		iop->cfg.tlb->tlb_flush_leaf(iova, size, granule, iop->cookie);
>   }
>   
>   static inline void
> @@ -232,7 +235,7 @@ io_pgtable_tlb_add_page(struct io_pgtable *iop,
>   			struct iommu_iotlb_gather * gather, unsigned long iova,
>   			size_t granule)
>   {
> -	if (iop->cfg.tlb->tlb_add_page)
> +	if (iop->cfg.tlb && iop->cfg.tlb->tlb_add_page)
>   		iop->cfg.tlb->tlb_add_page(gather, iova, granule, iop->cookie);
>   }
>   
> 
