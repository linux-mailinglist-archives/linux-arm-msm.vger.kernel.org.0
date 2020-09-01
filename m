Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 228DD258715
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Sep 2020 06:56:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726292AbgIAE4L (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Sep 2020 00:56:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725930AbgIAE4I (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Sep 2020 00:56:08 -0400
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B474C061290
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2020 21:56:07 -0700 (PDT)
Received: by mail-ot1-x343.google.com with SMTP id y5so87252otg.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2020 21:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=vtOK+JdyZooaz1NAnQQXA6CpZw+KJadIhTEL2kbj1TY=;
        b=sZM/Hx5YPU8n2Dalo1uiJyMbr745uxuBPAiHY508RWFAugXsnmybzaLCEO2xBNgLhG
         OHE3C4OULSiQYqRcs6BgvhFZC+zZO/VmAeoeqk0k8gB826LBP5qidYnIAYU4rOIrINgM
         TQ+yTWu9Sxp8KC9xZ0TtcnzBbSYCkRapMjBxSKHKoL/KQMvdRc035C9nWtMEqtqRJ36N
         mxJCS9ZoY3Rle9LHVK05/P3R23ouMMKvMCxvJyUkXSUI8qASZExglvLZXweoLVSTAFGu
         Ppbut+TiK/e+1by4PrTo8/2Fewu7TTf0mn3QUYRsvS8RpzJPQ2SJY84gO+/bEYyQ2701
         WYUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vtOK+JdyZooaz1NAnQQXA6CpZw+KJadIhTEL2kbj1TY=;
        b=tghZFXQbU106lf6fWvDHUndu1Pf1Afsb9UymRPXgMV2eq6gAXC47vXPNpiwaPAKhV0
         SL4hVZKnWEkUJW5jym3piwtu2TeV419q8IlUWuZQQSQR3E1eWJCp5q4WOHlLugqGkO8A
         vetM++ydHM1YWpfum3ZzGsUJ+OvBuNoqH16b4dxAKekmBpcb8SrqAxp9Q3lSJJjQXB0d
         ZDmEWHwIdujTmWsEwWANectKJYdH+sCnFQlpoUDYjXpI/Cvx7PQmwHwpuqvKZXv7wE3G
         qqIjkxTIQ/p/W/ylUBQJC6vQKQQK1XHYkwzG3Y5br3QPc4F+yTRwh7645QDptSYttpQP
         gkWA==
X-Gm-Message-State: AOAM532w5MPjpKuv1as2r5we8s14plQrwXUDqjq4i2Cc6KGMCVmdjTN3
        eV9IILlpxATZjaTRlWgdr6Zcyw==
X-Google-Smtp-Source: ABdhPJw+EMv9TyDAnLqJQrXIIowFlV6IK//RYKVec+GZUzuKneC5cn+zskaRocfswvWbn08780xMEw==
X-Received: by 2002:a9d:7e85:: with SMTP id m5mr138888otp.330.1598936166935;
        Mon, 31 Aug 2020 21:56:06 -0700 (PDT)
Received: from yoga ([2605:6000:e5cb:c100:8898:14ff:fe6d:34e])
        by smtp.gmail.com with ESMTPSA id r189sm2033728oih.51.2020.08.31.21.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2020 21:56:06 -0700 (PDT)
Date:   Mon, 31 Aug 2020 23:56:03 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
        linux-arm-msm@vger.kernel.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Will Deacon <will@kernel.org>, freedreno@lists.freedesktop.org,
        Sibi Sankar <sibis@codeaurora.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        linux-arm-kernel@lists.infradead.org,
        Rob Clark <robdclark@chromium.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Pritesh Raithatha <praithatha@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 08/19] iommu/arm-smmu: constify some helpers
Message-ID: <20200901045603.GO3715@yoga>
References: <20200810222657.1841322-1-jcrouse@codeaurora.org>
 <20200814024114.1177553-9-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200814024114.1177553-9-robdclark@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 13 Aug 21:41 CDT 2020, Rob Clark wrote:

> From: Rob Clark <robdclark@chromium.org>
> 
> Sprinkle a few `const`s where helpers don't need write access.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> index 59ff3fc5c6c8..27c83333fc50 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> @@ -377,7 +377,7 @@ struct arm_smmu_master_cfg {
>  	s16				smendx[];
>  };
>  
> -static inline u32 arm_smmu_lpae_tcr(struct io_pgtable_cfg *cfg)
> +static inline u32 arm_smmu_lpae_tcr(const struct io_pgtable_cfg *cfg)
>  {
>  	u32 tcr = FIELD_PREP(ARM_SMMU_TCR_TG0, cfg->arm_lpae_s1_cfg.tcr.tg) |
>  		FIELD_PREP(ARM_SMMU_TCR_SH0, cfg->arm_lpae_s1_cfg.tcr.sh) |
> @@ -398,13 +398,13 @@ static inline u32 arm_smmu_lpae_tcr(struct io_pgtable_cfg *cfg)
>  	return tcr;
>  }
>  
> -static inline u32 arm_smmu_lpae_tcr2(struct io_pgtable_cfg *cfg)
> +static inline u32 arm_smmu_lpae_tcr2(const struct io_pgtable_cfg *cfg)
>  {
>  	return FIELD_PREP(ARM_SMMU_TCR2_PASIZE, cfg->arm_lpae_s1_cfg.tcr.ips) |
>  	       FIELD_PREP(ARM_SMMU_TCR2_SEP, ARM_SMMU_TCR2_SEP_UPSTREAM);
>  }
>  
> -static inline u32 arm_smmu_lpae_vtcr(struct io_pgtable_cfg *cfg)
> +static inline u32 arm_smmu_lpae_vtcr(const struct io_pgtable_cfg *cfg)
>  {
>  	return ARM_SMMU_VTCR_RES1 |
>  	       FIELD_PREP(ARM_SMMU_VTCR_PS, cfg->arm_lpae_s2_cfg.vtcr.ps) |
> -- 
> 2.26.2
> 
