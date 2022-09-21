Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE2375BF9E3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Sep 2022 10:55:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229562AbiIUIzX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Sep 2022 04:55:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229944AbiIUIzK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Sep 2022 04:55:10 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9975836DD1
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Sep 2022 01:55:08 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id o5so3948507wms.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Sep 2022 01:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=NMm6vbupuNg3e8G1erinu7XgiIOmdNdtykV6wWBx/V8=;
        b=cs5Dvxfm7fd7aaUwKHNDAnKWcNrqMyWvSpCFhYmNjRwKQjf697cP12ef2JVhzS+nTr
         rBiEPfFCAvK18V0b4TPU93sWl3nBICTtuO2MuXRVpLAsvrnPMrSMT8utfj6qRBivTxti
         BXRo7n7yiwy1VFEU65sNSMFb9wbJX0Y01wSWLKT5xxq4/13Ub6Q0C+MSyK+vNliqzKv7
         7DJIhCBeCbjUg+pZttjuEgYoPhQn5piUM0+uqu6ez9uuEzMnz+dnjzErRDjuyGOk/BYS
         UkhbQnQFMY8EjTuZOsOAEbzscpTOQfKIqXeSfDZd9sFya7VbVqAP+h8BvB+DFZ+Idka/
         wnnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=NMm6vbupuNg3e8G1erinu7XgiIOmdNdtykV6wWBx/V8=;
        b=BqPa0N41rowwLdBrtqjdnNQVDp0SDk7X6VtfaljYCRHXjJ6dAqOLJ7E4AYCI561dre
         dX38EjAyjVw/bc++kcCMmkONU1gMvEAinQf+O1iGfZ/xere/2Ns5FqAhBshInDoSv4aZ
         TbwvXhR0nrNIzvEjwyH+CaYsnkLSeKqM1UKJkFL3Ols2ExLY0Ztu71J+DWdDgRiMBGUs
         6sCN4EeE/0ngNGer7LFkQchFoiNnAFDWs3fOLHnK/nQrotr1r7jx1SNAgAC4Kvy12+nM
         Ie/wc7EHTOUv+9lMcYVbgaH7t3TXBSsjHlsd3dApFT1T31feIvhEGvIkOUHUxi1I2yd/
         TaKw==
X-Gm-Message-State: ACrzQf3XqSgyxf6CJMPza6HJNz7fA0JTEzIKvq4BmMGVWc9t69otMxGQ
        qXEuLZ7DvMr4fVADFXDh2+RN9g==
X-Google-Smtp-Source: AMsMyM5v4ccQB/sVn2S/zJDFsH4keJ/VCqNp428gK8IV32RalM87u6d3xbyo/Rp+qs75y4SGFW5eBA==
X-Received: by 2002:a1c:202:0:b0:3a8:4197:eec0 with SMTP id 2-20020a1c0202000000b003a84197eec0mr5125375wmc.83.1663750506995;
        Wed, 21 Sep 2022 01:55:06 -0700 (PDT)
Received: from myrica (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
        by smtp.gmail.com with ESMTPSA id p14-20020a5d48ce000000b0022afbd02c69sm1949060wrs.56.2022.09.21.01.55.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Sep 2022 01:55:06 -0700 (PDT)
Date:   Wed, 21 Sep 2022 09:55:01 +0100
From:   Jean-Philippe Brucker <jean-philippe@linaro.org>
To:     Nicolin Chen <nicolinc@nvidia.com>
Cc:     joro@8bytes.org, suravee.suthikulpanit@amd.com, will@kernel.org,
        robin.murphy@arm.com, robdclark@gmail.com, dwmw2@infradead.org,
        baolu.lu@linux.intel.com, agross@kernel.org,
        bjorn.andersson@linaro.org, matthias.bgg@gmail.com,
        orsonzhai@gmail.com, baolin.wang@linux.alibaba.com,
        zhang.lyra@gmail.com, sricharan@codeaurora.org, jgg@nvidia.com,
        kevin.tian@intel.com, konrad.dybcio@somainline.org,
        yong.wu@mediatek.com, thierry.reding@gmail.com, vdumpa@nvidia.com,
        jonathanh@nvidia.com, tglx@linutronix.de,
        shameerali.kolothum.thodi@huawei.com,
        christophe.jaillet@wanadoo.fr, thunder.leizhen@huawei.com,
        quic_saipraka@quicinc.com, jon@solid-run.com,
        yangyingliang@huawei.com, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-tegra@vger.kernel.org,
        virtualization@lists.linux-foundation.org
Subject: Re: [PATCH v4 0/6] Define EINVAL as device/domain incompatibility
Message-ID: <YyrRZXVWWxBhW3ST@myrica>
References: <cover.1663744983.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1663744983.git.nicolinc@nvidia.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Sep 21, 2022 at 01:22:31AM -0700, Nicolin Chen wrote:
> This series is to replace the previous EMEDIUMTYPE patch in a VFIO series:
> https://lore.kernel.org/kvm/Yxnt9uQTmbqul5lf@8bytes.org/
> 
> The purpose is to regulate all existing ->attach_dev callback functions to
> use EINVAL exclusively for an incompatibility error between a device and a
> domain. This allows VFIO and IOMMUFD to detect such a soft error, and then
> try a different domain with the same device.
[...]
>  drivers/iommu/amd/iommu.c                   | 12 +----
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 11 +---
>  drivers/iommu/arm/arm-smmu/arm-smmu.c       |  3 --
>  drivers/iommu/arm/arm-smmu/qcom_iommu.c     |  7 +--
>  drivers/iommu/fsl_pamu.c                    |  2 +-
>  drivers/iommu/fsl_pamu_domain.c             |  4 +-
>  drivers/iommu/intel/iommu.c                 | 10 ++--
>  drivers/iommu/intel/pasid.c                 |  6 ++-
>  drivers/iommu/iommu.c                       | 22 ++++++++
>  drivers/iommu/ipmmu-vmsa.c                  |  2 -
>  drivers/iommu/msm_iommu.c                   | 59 +++++++++++----------
>  drivers/iommu/mtk_iommu.c                   |  4 +-
>  drivers/iommu/omap-iommu.c                  |  6 +--
>  drivers/iommu/sprd-iommu.c                  |  4 +-
>  drivers/iommu/tegra-gart.c                  |  2 +-
>  drivers/iommu/virtio-iommu.c                |  7 ++-

For virtio-iommu:

Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

>  include/linux/iommu.h                       | 12 +++++
>  17 files changed, 90 insertions(+), 83 deletions(-)
> 
> -- 
> 2.17.1
> 
