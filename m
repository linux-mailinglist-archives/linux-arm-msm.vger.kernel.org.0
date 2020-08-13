Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98B47243AA6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Aug 2020 15:14:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726777AbgHMNOS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Aug 2020 09:14:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:35218 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726768AbgHMNOR (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Aug 2020 09:14:17 -0400
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DC2C2207DA;
        Thu, 13 Aug 2020 13:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597324457;
        bh=HCr4ngCWjVKb+xxBnt5CGWnhlxXwqewqquSGs6gY/tQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=g2OzoqK45R4qfqF8Or+HHI5oAJY2/0O4pieaNJoQbathqNBIzeNkh1vtAjW4OK5/w
         gynmT/frIe0nHJN/Vqsht7fKwsdZZLszjSo+BMWCaVjLbOmDO1myd2i2r/L+IkhBYx
         1HI6Mj4LGSBFsM7RcW5SewzVPhXmfbxDe+qTqOm4=
Date:   Thu, 13 Aug 2020 14:14:12 +0100
From:   Will Deacon <will@kernel.org>
To:     Jordan Crouse <jcrouse@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        iommu@lists.linux-foundation.org, freedreno@lists.freedesktop.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v12 04/13] iommu: Add a domain attribute to get/set a
 pagetable configuration
Message-ID: <20200813131412.GB10256@willie-the-truck>
References: <20200810222657.1841322-1-jcrouse@codeaurora.org>
 <20200810222657.1841322-5-jcrouse@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200810222657.1841322-5-jcrouse@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Aug 10, 2020 at 04:26:48PM -0600, Jordan Crouse wrote:
> Add domain attribute DOMAIN_ATTR_PGTABLE_CFG. This will be used by
> arm-smmu to share the current pagetable configuration with the
> leaf driver and to allow the leaf driver to set up a new pagetable
> configuration under certain circumstances.
> 
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> ---
> 
>  include/linux/iommu.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/linux/iommu.h b/include/linux/iommu.h
> index fee209efb756..995ab8c47ef2 100644
> --- a/include/linux/iommu.h
> +++ b/include/linux/iommu.h
> @@ -118,6 +118,7 @@ enum iommu_attr {
>  	DOMAIN_ATTR_FSL_PAMUV1,
>  	DOMAIN_ATTR_NESTING,	/* two stages of translation */
>  	DOMAIN_ATTR_DMA_USE_FLUSH_QUEUE,
> +	DOMAIN_ATTR_PGTABLE_CFG,
>  	DOMAIN_ATTR_MAX,
>  };

Nobody other than the adreno gpu uses this, so can we avoid exposing it
in the IOMMU API, please? Given that you have a reference to the adreno
GPU device in the SMMU implementation code thanks to .alloc_context_bank(),
can you squirrel some function pointers away in the driver data (i.e. with
dev_set_drvdata()) instead?

Will
