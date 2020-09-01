Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C85F25867E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Sep 2020 05:52:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726117AbgIADwV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Aug 2020 23:52:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726105AbgIADwV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Aug 2020 23:52:21 -0400
Received: from mail-oo1-xc44.google.com (mail-oo1-xc44.google.com [IPv6:2607:f8b0:4864:20::c44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFB60C0612FF
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2020 20:52:20 -0700 (PDT)
Received: by mail-oo1-xc44.google.com with SMTP id k63so2020839oob.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2020 20:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=DHgd1Cn7DbLEoeK4tX+vty8BzXm7n6usmD/UeI07Mrk=;
        b=dyaEu3K2fa7X2g3Iy4XaFmUwFb2VziG9VK8UPB8GwRUXnqKa7ib6yl+CECA0Q1vPLz
         IjQ+mn612HdIbhc5odg6OfaT3Qb/TYbaI5T/zWIex5gVUoWgirWjKb0AvwZRDaqbzzCO
         Y1OtNL+0UUlSJmpsQ0sd9QBKMSwBu6kJ5paH3wPa4P9agbIv6yxHgu7afTYDTEwIeYGH
         DJZ6IsI3RU6NTWK8tqqEnwY3s/hCocMGlybV+ffvg6CgjQt6J50QWplKw+lBIr/ief3F
         psjjzA+evsRqJDJS9fx7ldrRPcAmxLmEOhyENyNuK+ikFrDogOJS+r6DRfJGytxsSq3x
         WDZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=DHgd1Cn7DbLEoeK4tX+vty8BzXm7n6usmD/UeI07Mrk=;
        b=uMmDzZ5+TmBgExWJnvMrEu/l1DmwKE+Smp8sRpj9e01Qft1zhczedOVtL4L6U/4LhM
         7oMPiyC6M72jJ3HPN3eTgUhRf89VrxG78xZjkFheWx1O9K1Ueo5qCFfwhoGjGM45xpgd
         WHjxH8ecgot92LX3lFIlG5j0wp7LtyTmRIMXnbvRwWWAbxzf8X0HTaUU1HzdD/mGY9sY
         /UXvqVsAu/p6xX5wUJTJy2R/QJykJvBVFS5sy9PzUq577bBjeob4m6BNmJBCF/3SbIVJ
         cF8Yg2gJeZFS+8iqdKc2JX3yyich3DVLj0bJgUJCrnCCQXs9y+589tBiazyKtfjMypv3
         46OQ==
X-Gm-Message-State: AOAM531mQPGlRkqPJAx3e08WiLYlDkPu1A4HtvCnjRqq44Wo7O/MwEcm
        A0GXF4uP34P/2D4q2jMvdwBNZA==
X-Google-Smtp-Source: ABdhPJyW82+oNd0uKsSlubviePmT2U0GHcTQ3RDx78hC9s24SzOxGZRfPqGKe1d6Eg2D6goGkTWR0w==
X-Received: by 2002:a4a:aec3:: with SMTP id v3mr2968825oon.69.1598932339869;
        Mon, 31 Aug 2020 20:52:19 -0700 (PDT)
Received: from yoga ([2605:6000:e5cb:c100:8898:14ff:fe6d:34e])
        by smtp.gmail.com with ESMTPSA id u19sm2067501oic.10.2020.08.31.20.52.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2020 20:52:19 -0700 (PDT)
Date:   Mon, 31 Aug 2020 22:52:16 -0500
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
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 05/19] iommu: add private interface for adreno-smmu
Message-ID: <20200901035216.GM3715@yoga>
References: <20200810222657.1841322-1-jcrouse@codeaurora.org>
 <20200814024114.1177553-6-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200814024114.1177553-6-robdclark@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 13 Aug 21:41 CDT 2020, Rob Clark wrote:

> From: Rob Clark <robdclark@chromium.org>
> 
> This interface will be used for drm/msm to coordinate with the
> qcom_adreno_smmu_impl to enable/disable TTBR0 translation.
> 
> Once TTBR0 translation is enabled, the GPU's CP (Command Processor)
> will directly switch TTBR0 pgtables (and do the necessary TLB inv)
> synchronized to the GPU's operation.  But help from the SMMU driver
> is needed to initially bootstrap TTBR0 translation, which cannot be
> done from the GPU.
> 
> Since this is a very special case, a private interface is used to
> avoid adding highly driver specific things to the public iommu
> interface.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  include/linux/adreno-smmu-priv.h | 36 ++++++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 include/linux/adreno-smmu-priv.h
> 
> diff --git a/include/linux/adreno-smmu-priv.h b/include/linux/adreno-smmu-priv.h
> new file mode 100644
> index 000000000000..a889f28afb42
> --- /dev/null
> +++ b/include/linux/adreno-smmu-priv.h
> @@ -0,0 +1,36 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2020 Google, Inc
> + */
> +
> +#ifndef __ADRENO_SMMU_PRIV_H
> +#define __ADRENO_SMMU_PRIV_H
> +
> +#include <linux/io-pgtable.h>
> +
> +/**
> + * struct adreno_smmu_priv - private interface between adreno-smmu and GPU
> + *
> + * @cookie:        An opque token provided by adreno-smmu and passed
> + *                 back into the callbacks
> + * @get_ttbr1_cfg: Get the TTBR1 config for the GPUs context-bank
> + * @set_ttbr0_cfg: Set the TTBR0 config for the GPUs context bank.  A
> + *                 NULL config disables TTBR0 translation, otherwise
> + *                 TTBR0 translation is enabled with the specified cfg
> + *
> + * The GPU driver (drm/msm) and adreno-smmu work together for controlling
> + * the GPU's SMMU instance.  This is by necessity, as the GPU is directly
> + * updating the SMMU for context switches, while on the other hand we do
> + * not want to duplicate all of the initial setup logic from arm-smmu.
> + *
> + * This private interface is used for the two drivers to coordinate.  The
> + * cookie and callback functions are populated when the GPU driver attaches
> + * it's domain.
> + */
> +struct adreno_smmu_priv {
> +    const void *cookie;
> +    const struct io_pgtable_cfg *(*get_ttbr1_cfg)(const void *cookie);
> +    int (*set_ttbr0_cfg)(const void *cookie, const struct io_pgtable_cfg *cfg);
> +};
> +
> +#endif /* __ADRENO_SMMU_PRIV_H */
> \ No newline at end of file
> -- 
> 2.26.2
> 
