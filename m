Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC7D012FCC8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2020 20:02:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728353AbgACTCR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Jan 2020 14:02:17 -0500
Received: from mail-ed1-f67.google.com ([209.85.208.67]:34889 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728279AbgACTCR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Jan 2020 14:02:17 -0500
Received: by mail-ed1-f67.google.com with SMTP id f8so42425918edv.2;
        Fri, 03 Jan 2020 11:02:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TkjoiDoXf+Ju82Ph5GrtKx56lLId5gNQMBVsYU2UV2I=;
        b=O2MUFtAD4ZE08qe5e8wUK40pSV3MWGSqQ9oCAPTvZsEdPCFIN0dnMBZamFXlmw6lEt
         pjbp3ltsNqOVn7rnbJL3TqQGijOBPe5Jkq4gD5dRfySP0YItvvLFTf9mBhrabASlg47a
         2Bm4XFI54uLMXNw/GcTGRethvJsUfjLSYEww68efsuRZlnlAi4KyEx1bqLE+478t/sdf
         wzTGDoAFKcyin76PjFi53Ex/UhOtNaJMwvUOQ16KKmtS9KpIv3NpYuNdfBDbe41oMYaE
         kqPu3OqyaIDoEPWR1htm4+anPvqidSSfXQOKV+wWLhqQYyWv1KVOrDaTpkowvcvxiUGt
         1Azw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TkjoiDoXf+Ju82Ph5GrtKx56lLId5gNQMBVsYU2UV2I=;
        b=cnin5tzS9eyKuzbJ8skkjlrgqZw+ivLdIKJRqg05/FxntyRrxLxXoqz2WjyvQL01ck
         oIItCqxZVJa129tMRzakM+ZJaIJJMh0pJxxTfX0v2iEBj74F3d1D1nbfohRfW5Yn0AUu
         FBSL+eIy2MbjjHfPqe+Cv+hZthpEbc7guKg67JM2bWjEq2MUo213PAnACVaulrA54v0e
         3S1KLrL3ozjhj4mC71/ZKUutdzNIg/7ZMHU1lL2O+CzGyt5GKHTsMrwsUM9kRh0LSOU5
         SO0zGCWYRx6SOx5tZL8OKN6Me0nXvuQuAo4paGRUttP3ZFzCitCPR7iaLgjwXQMPz1LX
         5UpA==
X-Gm-Message-State: APjAAAWAeCSfnykhG6H6oEN7bK/8AhHVYtCa67/3K7BJ+lcSXdzTLY0p
        yu2LJT/V0C3T7vbAoxDjGv/Zj07HCwPLOf/AHg4=
X-Google-Smtp-Source: APXvYqxS55HXS3z8CIX9ctS+VVvu28guenRxGgfT7JZP5HxyppRusJag9NZUaCsJSd1/RAnJOLIyc/xzpyWSZQZVZhs=
X-Received: by 2002:aa7:da03:: with SMTP id r3mr94494730eds.163.1578078134838;
 Fri, 03 Jan 2020 11:02:14 -0800 (PST)
MIME-Version: 1.0
References: <1577962933-13577-1-git-send-email-smasetty@codeaurora.org> <1577962933-13577-3-git-send-email-smasetty@codeaurora.org>
In-Reply-To: <1577962933-13577-3-git-send-email-smasetty@codeaurora.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Fri, 3 Jan 2020 11:02:03 -0800
Message-ID: <CAF6AEGvmrTmjyFsqX+DQNNgXxDw2uGYJv6bA0Y6OGn05m_0WFQ@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH v2 2/7] iommu/arm-smmu: Add domain attribute
 for QCOM system cache
To:     Sharat Masetty <smasetty@codeaurora.org>
Cc:     freedreno <freedreno@lists.freedesktop.org>,
        saiprakash.ranjan@codeaurora.org,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Will Deacon <will@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Joerg Roedel <joro@8bytes.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        dri-devel@freedesktop.org,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jan 2, 2020 at 3:02 AM Sharat Masetty <smasetty@codeaurora.org> wrote:
>
> From: Vivek Gautam <vivek.gautam@codeaurora.org>
>
> Add iommu domain attribute for using system cache aka last level
> cache on QCOM SoCs by client drivers like GPU to set right
> attributes for caching the hardware pagetables into the system cache.
>
> Signed-off-by: Vivek Gautam <vivek.gautam@codeaurora.org>
> Co-developed-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---
>  drivers/iommu/arm-smmu-qcom.c | 10 ++++++++++
>  drivers/iommu/arm-smmu.c      | 14 ++++++++++++++
>  drivers/iommu/arm-smmu.h      |  1 +
>  include/linux/iommu.h         |  1 +
>  4 files changed, 26 insertions(+)
>
> diff --git a/drivers/iommu/arm-smmu-qcom.c b/drivers/iommu/arm-smmu-qcom.c
> index 24c071c..d1d22df 100644
> --- a/drivers/iommu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm-smmu-qcom.c
> @@ -30,7 +30,17 @@ static int qcom_sdm845_smmu500_reset(struct arm_smmu_device *smmu)
>         return ret;
>  }
>
> +static int qcom_smmu_init_context(struct arm_smmu_domain *smmu_domain,
> +                                 struct io_pgtable_cfg *pgtbl_cfg)
> +{
> +       if (smmu_domain->sys_cache)
> +               pgtbl_cfg->coherent_walk = false;

just curious, does coherent walk not work with sys-cache, or is it
just that it is kind of pointless (given that, afaiu, the pagetables
can be cached by the system cache)?

> +
> +       return 0;
> +}
> +
>  static const struct arm_smmu_impl qcom_smmu_impl = {
> +       .init_context = qcom_smmu_init_context,
>         .reset = qcom_sdm845_smmu500_reset,
>  };
>
> diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
> index 4f7e0c0..055b548 100644
> --- a/drivers/iommu/arm-smmu.c
> +++ b/drivers/iommu/arm-smmu.c
> @@ -1466,6 +1466,9 @@ static int arm_smmu_domain_get_attr(struct iommu_domain *domain,
>                 case DOMAIN_ATTR_NESTING:
>                         *(int *)data = (smmu_domain->stage == ARM_SMMU_DOMAIN_NESTED);
>                         return 0;
> +               case DOMAIN_ATTR_QCOM_SYS_CACHE:
> +                       *((int *)data) = smmu_domain->sys_cache;
> +                       return 0;
>                 default:
>                         return -ENODEV;
>                 }
> @@ -1506,6 +1509,17 @@ static int arm_smmu_domain_set_attr(struct iommu_domain *domain,
>                         else
>                                 smmu_domain->stage = ARM_SMMU_DOMAIN_S1;
>                         break;
> +               case DOMAIN_ATTR_QCOM_SYS_CACHE:
> +                       if (smmu_domain->smmu) {
> +                               ret = -EPERM;
> +                               goto out_unlock;
> +                       }
> +
> +                       if (*((int *)data))
> +                               smmu_domain->sys_cache = true;
> +                       else
> +                               smmu_domain->sys_cache = false;
> +                       break;
>                 default:
>                         ret = -ENODEV;
>                 }
> diff --git a/drivers/iommu/arm-smmu.h b/drivers/iommu/arm-smmu.h
> index f57cdbe..8aeaaf0 100644
> --- a/drivers/iommu/arm-smmu.h
> +++ b/drivers/iommu/arm-smmu.h
> @@ -322,6 +322,7 @@ struct arm_smmu_domain {
>         struct mutex                    init_mutex; /* Protects smmu pointer */
>         spinlock_t                      cb_lock; /* Serialises ATS1* ops and TLB syncs */
>         struct iommu_domain             domain;
> +       bool                            sys_cache;
>  };
>
>
> diff --git a/include/linux/iommu.h b/include/linux/iommu.h
> index 0c60e75..bd61c60 100644
> --- a/include/linux/iommu.h
> +++ b/include/linux/iommu.h
> @@ -127,6 +127,7 @@ enum iommu_attr {
>         DOMAIN_ATTR_FSL_PAMUV1,
>         DOMAIN_ATTR_NESTING,    /* two stages of translation */
>         DOMAIN_ATTR_DMA_USE_FLUSH_QUEUE,
> +       DOMAIN_ATTR_QCOM_SYS_CACHE,

Given that IOMMU_QCOM_SYS_CACHE was renamed to IOMMU_SYS_CACHE_ONLY, I
wonder if this domain attr should simply be DOMAIN_ATTR_SYS_CACHE?

But that said, the function of this domain attr seems to simply be to
disable coherent walk.. I wonder if naming the domain attr after what
it does would make more sense?

BR,
-R


>         DOMAIN_ATTR_MAX,
>  };
>
> --
> 1.9.1
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno
