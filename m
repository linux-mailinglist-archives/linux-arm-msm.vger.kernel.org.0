Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 256D514F439
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Jan 2020 23:00:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726180AbgAaWAq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 31 Jan 2020 17:00:46 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:43020 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726105AbgAaWAq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 31 Jan 2020 17:00:46 -0500
Received: by mail-pl1-f193.google.com with SMTP id p11so3275417plq.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jan 2020 14:00:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=b82MM5TsQ8A9XNdp0Y7iZIjPTfIvG0TXd9OXwa8Voa4=;
        b=ln975L+nUDW8vHW1M3ExHfHLl4zJ6xQ7xAqDPH8kgpaC2M25g/M0mpJXtoR9nZ8+zX
         fCKziGOUYvBuahWMFfMcvJFOCeQJEiH1U3THEAK/GpEkWuPqWgoraNYhdLCyxaDPJZk7
         8hf9/Az5nYC2xFao/C79k4QgNJRVjrt4tf2rc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=b82MM5TsQ8A9XNdp0Y7iZIjPTfIvG0TXd9OXwa8Voa4=;
        b=lOMCD7WuafQtdPu61Z6bdjzPSJk5XMtKHbzJnCepSsbc013TMFyB2oEVfuKv5l87gf
         rKi0ZmYanwewxeMa+ljty4qJ+3VaHxEjIze0qXjki7KkO8PNzB0IUTCtK650uVwu8IUK
         Wg+Wvt4XEwhxeAEbXEK6Lr5Ici5H2MAEBfK51Sub22FFxqwLTiHgJjzQThJsGudRPlv8
         kblhI6sy2s76rOkbZr6uEwHjOkvQB6JyZPEliwtqmd0gqNZ6/bcZbDDJ6wENXXQIi6Rw
         u7laKS1SKRfm9U1KIXvSxuo6JNezpEkYrUUdSb/lzKup3CakfyVqBY0RSjcmjw374+eb
         +93A==
X-Gm-Message-State: APjAAAXi80n8UBEXfAbOokaFN4CF653TGKFPoqzUmLKU8WZAKBvEEBax
        yda7jDLiR657gOn5jW37HxWJQw==
X-Google-Smtp-Source: APXvYqxJ4dABMrxvg8Mkn8WWBjXAgyn0FUDu4pBM/f8rqnl3BFmy/f1OIqxj6WnyNvD4RpAWCJnROA==
X-Received: by 2002:a17:90a:36af:: with SMTP id t44mr14554287pjb.25.1580508045310;
        Fri, 31 Jan 2020 14:00:45 -0800 (PST)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id g2sm11436046pgn.59.2020.01.31.14.00.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jan 2020 14:00:44 -0800 (PST)
Date:   Fri, 31 Jan 2020 14:00:43 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Sharat Masetty <smasetty@codeaurora.org>
Cc:     freedreno@lists.freedesktop.org, dri-devel@freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        will@kernel.org, robin.murphy@arm.com, joro@8bytes.org,
        iommu@lists.linux-foundation.org, jcrouse@codeaurora.org,
        saiprakash.ranjan@codeaurora.org
Subject: Re: [PATCH v2 1/7] iommu/arm-smmu: Pass io_pgtable_cfg to impl
 specific init_context
Message-ID: <20200131220043.GN71044@google.com>
References: <1577962933-13577-1-git-send-email-smasetty@codeaurora.org>
 <1577962933-13577-2-git-send-email-smasetty@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1577962933-13577-2-git-send-email-smasetty@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Jan 02, 2020 at 04:32:07PM +0530, Sharat Masetty wrote:
> From: Jordan Crouse <jcrouse@codeaurora.org>
> 
> Pass the propposed io_pgtable_cfg to the implementation specific
> init_context() function to give the implementation an opportunity to
> to modify it before it gets passed to io-pgtable.
> 
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---
>  drivers/iommu/arm-smmu-impl.c |  3 ++-
>  drivers/iommu/arm-smmu.c      | 11 ++++++-----
>  drivers/iommu/arm-smmu.h      |  3 ++-
>  3 files changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/iommu/arm-smmu-impl.c b/drivers/iommu/arm-smmu-impl.c
> index b2fe72a..33ed682 100644
> --- a/drivers/iommu/arm-smmu-impl.c
> +++ b/drivers/iommu/arm-smmu-impl.c
> @@ -68,7 +68,8 @@ static int cavium_cfg_probe(struct arm_smmu_device *smmu)
>  	return 0;
>  }
> 
> -static int cavium_init_context(struct arm_smmu_domain *smmu_domain)
> +static int cavium_init_context(struct arm_smmu_domain *smmu_domain,
> +		struct io_pgtable_cfg *pgtbl_cfg)
>  {
>  	struct cavium_smmu *cs = container_of(smmu_domain->smmu,
>  					      struct cavium_smmu, smmu);
> diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
> index eee48f9..4f7e0c0 100644
> --- a/drivers/iommu/arm-smmu.c
> +++ b/drivers/iommu/arm-smmu.c
> @@ -758,11 +758,6 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
>  		cfg->asid = cfg->cbndx;
> 
>  	smmu_domain->smmu = smmu;
> -	if (smmu->impl && smmu->impl->init_context) {
> -		ret = smmu->impl->init_context(smmu_domain);
> -		if (ret)
> -			goto out_unlock;
> -	}
> 
>  	smmu_domain->pgtbl_cfg = (struct io_pgtable_cfg) {
>  		.pgsize_bitmap	= smmu->pgsize_bitmap,
> @@ -773,6 +768,12 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
>  		.iommu_dev	= smmu->dev,
>  	};
> 
> +	if (smmu->impl && smmu->impl->init_context) {
> +		ret = smmu->impl->init_context(smmu_domain, &smmu_domain->pgtbl_cfg);

Which patch adds 'pgtbl_cfg' to struct arm_smmu_domain? The field does
not exist in iommu/next.
