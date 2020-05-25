Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 872651E0F00
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2020 15:02:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390596AbgEYNC5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 May 2020 09:02:57 -0400
Received: from mx2.suse.de ([195.135.220.15]:33362 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388757AbgEYNC5 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 May 2020 09:02:57 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 17DBFACDB;
        Mon, 25 May 2020 13:02:58 +0000 (UTC)
Date:   Mon, 25 May 2020 15:02:53 +0200
From:   Joerg Roedel <jroedel@suse.de>
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Evan Green <evgreen@chromium.org>,
        Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH] iommu: Fix group refcount in iommu_alloc_default_domain()
Message-ID: <20200525130253.GH5075@suse.de>
References: <20200522130145.30067-1-saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200522130145.30067-1-saiprakash.ranjan@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, May 22, 2020 at 06:31:45PM +0530, Sai Prakash Ranjan wrote:
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index a4c2f122eb8b..05f7b77c432f 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -1491,6 +1491,7 @@ static int iommu_alloc_default_domain(struct device *dev)
>  {
>  	struct iommu_group *group;
>  	unsigned int type;
> +	int ret;
>  
>  	group = iommu_group_get(dev);
>  	if (!group)
> @@ -1501,7 +1502,11 @@ static int iommu_alloc_default_domain(struct device *dev)
>  
>  	type = iommu_get_def_domain_type(dev);
>  
> -	return iommu_group_alloc_default_domain(dev->bus, group, type);
> +	ret = iommu_group_alloc_default_domain(dev->bus, group, type);
> +
> +	iommu_group_put(group);
> +
> +	return ret;
>  }
>  
>  /**

Thanks for the report and the fix. I think it is better to fix this by
not taking a group reference in iommu_alloc_default_domain() at all and
pass group as a parameter. Please see the patch I just sent out.

Regards,

	Joerg
