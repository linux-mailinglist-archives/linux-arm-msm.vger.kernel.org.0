Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 522BA647E0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jul 2019 16:14:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726957AbfGJOOk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Jul 2019 10:14:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:39390 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726458AbfGJOOk (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Jul 2019 10:14:40 -0400
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DAF772064B;
        Wed, 10 Jul 2019 14:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1562768078;
        bh=DyLQkR+SqZg30UD4WGgKKVBfPXf9H8Fp5j0gQLSjm1M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Uv3XWiYycqQdOA9/aSy6OPad/nv4oF5fG/eYmZR921Lj5iSjaS116QIYDQi5XGtjy
         97SSz7GWaEcn5oTyCpIQR8LU9e7nTbEKOnfCeXSHuxLRdk65zZZrVRN1Yge8y5i6Ec
         DKc/PijLSM5tkGjiPgCKRl5Gv7qFM23n5caCPXH0=
Date:   Wed, 10 Jul 2019 15:14:34 +0100
From:   Will Deacon <will@kernel.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Dan Williams <dan.j.williams@intel.com>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Evan Green <evgreen@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Will Deacon <will.deacon@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH v2 3/5] memremap: Add support for read-only memory
 mappings
Message-ID: <20190710141433.7ama3gncss3y6dcx@willie-the-truck>
References: <20190614203717.75479-1-swboyd@chromium.org>
 <20190614203717.75479-4-swboyd@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190614203717.75479-4-swboyd@chromium.org>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jun 14, 2019 at 01:37:15PM -0700, Stephen Boyd wrote:
> Sometimes we have memories that are supposed to be read-only, but when
> we map these regions the best we can do is map them as write-back with
> MEMREMAP_WB. Introduce a read-only memory mapping (MEMREMAP_RO) that
> allows us to map reserved memory regions as read-only. This way, we're
> less likely to see these special memory regions become corrupted by
> stray writes to them.
> 
> Cc: Evan Green <evgreen@chromium.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Andy Gross <agross@kernel.org>
> Cc: Will Deacon <will.deacon@arm.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Dan Williams <dan.j.williams@intel.com>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  include/linux/io.h |  1 +
>  kernel/iomem.c     | 15 +++++++++++++--
>  2 files changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/io.h b/include/linux/io.h
> index 32e30e8fb9db..16c7f4498869 100644
> --- a/include/linux/io.h
> +++ b/include/linux/io.h
> @@ -159,6 +159,7 @@ enum {
>  	MEMREMAP_WC = 1 << 2,
>  	MEMREMAP_ENC = 1 << 3,
>  	MEMREMAP_DEC = 1 << 4,
> +	MEMREMAP_RO = 1 << 5,
>  };
>  
>  void *memremap(resource_size_t offset, size_t size, unsigned long flags);
> diff --git a/kernel/iomem.c b/kernel/iomem.c
> index 93c264444510..10d5ef0ff09e 100644
> --- a/kernel/iomem.c
> +++ b/kernel/iomem.c
> @@ -19,6 +19,13 @@ static void *arch_memremap_wb(resource_size_t offset, unsigned long size)
>  }
>  #endif
>  
> +#ifndef arch_memremap_ro
> +static void *arch_memremap_ro(resource_size_t offset, unsigned long size)
> +{
> +	return NULL;
> +}
> +#endif
> +
>  #ifndef arch_memremap_can_ram_remap
>  static bool arch_memremap_can_ram_remap(resource_size_t offset, size_t size,
>  					unsigned long flags)
> @@ -84,7 +91,10 @@ void *memremap(resource_size_t offset, size_t size, unsigned long flags)
>  	}
>  
>  	/* Try all mapping types requested until one returns non-NULL */
> -	if (flags & MEMREMAP_WB) {
> +	if ((flags & MEMREMAP_RO) && is_ram != REGION_INTERSECTS)
> +		addr = arch_memremap_ro(offset, size);
> +
> +	if (!addr && (flags & MEMREMAP_WB)) {
>  		/*
>  		 * MEMREMAP_WB is special in that it can be satisfied
>  		 * from the direct map.  Some archs depend on the
> @@ -103,7 +113,8 @@ void *memremap(resource_size_t offset, size_t size, unsigned long flags)
>  	 * address mapping.  Enforce that this mapping is not aliasing
>  	 * System RAM.
>  	 */
> -	if (!addr && is_ram == REGION_INTERSECTS && flags != MEMREMAP_WB) {
> +	if (!addr && is_ram == REGION_INTERSECTS &&
> +	    (flags != MEMREMAP_WB || flags != MEMREMAP_RO)) {
>  		WARN_ONCE(1, "memremap attempted on ram %pa size: %#lx\n",
>  				&offset, (unsigned long) size);
>  		return NULL;

This function seems a little confused about whether 'flags' is really a
bitmap of flags, or whether it is equal to exactly one entry in the enum.
Given that I think it's sensible for somebody to specify 'MEMREMAP_RO |
MEMREMAP_WT', then we probably need to start checking these things a bit
more thoroughly so we can reject unsupported combinations at the very least.

Will
