Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 03FE55690DE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Jul 2022 19:42:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233945AbiGFRm3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Jul 2022 13:42:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233937AbiGFRmY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Jul 2022 13:42:24 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 0186DB87C
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Jul 2022 10:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1657129342;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Bm6ni0e0Z3ZqDaHM6VmzfCaa2VxT43x1YW4zQJliK1o=;
        b=ARIhqBTzHZQ3VgDQMRTAdHi9Y8jPgiIXohT0OxHDSwtw6gl1N1h3ET1DRL3mNkdAKR4gl6
        XQbWPvIJwfAF+rAqbPWyMz8zjxbXnMlgxddojke0zmTnLcIx8i0t1Pk9r4FXhENIQ8ANqy
        gM0XkDbbUUOpgle8EGk3Q9y5Rv5Z12k=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-216-UdZ-f08BPvi55cmvco9HOw-1; Wed, 06 Jul 2022 13:42:21 -0400
X-MC-Unique: UdZ-f08BPvi55cmvco9HOw-1
Received: by mail-io1-f72.google.com with SMTP id k1-20020a5d8741000000b00678ad1103e7so2470803iol.21
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Jul 2022 10:42:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:organization:mime-version:content-transfer-encoding;
        bh=Bm6ni0e0Z3ZqDaHM6VmzfCaa2VxT43x1YW4zQJliK1o=;
        b=VraKFXw1G5WZ7KQB8YnG+vbhu7rgq7azu0nLPUaAoHgicYkZKJpLKct4dd6+bgEZh1
         Bz5yYf13i8mGuN/RvRvcsf60KKMG+Gf6vQ+q2ZrV9SUzh2jS7vVn4ewfbBkOn1RELfP1
         jZ2iWqyCOXL7Zv5v287c122Xx22vC90KdAn3cvP8zp6oE/FwuJVkq2CppQvvg9wpVzPF
         jK2+655IOox2xCElg8JIXxFYs9db4Mp+2+rXy4rvUv6ISlcWtfNsge9gvxuuoCG+foNV
         C47yCADI+8HqTnqusUZsEsIhMaxTGGIDFVcRDyzHqig09tt/ekSJvaocK4ixbbcALQC2
         nJiQ==
X-Gm-Message-State: AJIora9lN2Llj+WQj+pc4GGqUej28/pyaLjRNrJynXkA/2HlyuGVl+xO
        t78xFqav2rEceKxV8wc8au3A/dGtuyRyMQHJZ0kdixGqqHHlpPVcpSwBuPkhwrERrJ8UbmokAKS
        htEZh48Gyal21EkolI3i6sh3sGA==
X-Received: by 2002:a05:6e02:1be6:b0:2db:ea7f:10c4 with SMTP id y6-20020a056e021be600b002dbea7f10c4mr17220897ilv.248.1657129340263;
        Wed, 06 Jul 2022 10:42:20 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tKW5hHrIbN8D8MKAPlov0FsaTgJJCZrivyPi82ikNP5NQmibHb26OWtdHiMispm5nOi3tbJA==
X-Received: by 2002:a05:6e02:1be6:b0:2db:ea7f:10c4 with SMTP id y6-20020a056e021be600b002dbea7f10c4mr17220872ilv.248.1657129339926;
        Wed, 06 Jul 2022 10:42:19 -0700 (PDT)
Received: from redhat.com ([38.15.36.239])
        by smtp.gmail.com with ESMTPSA id i83-20020a6bb856000000b0065a47e16f53sm17005663iof.37.2022.07.06.10.42.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 10:42:19 -0700 (PDT)
Date:   Wed, 6 Jul 2022 11:42:17 -0600
From:   Alex Williamson <alex.williamson@redhat.com>
To:     Nicolin Chen <nicolinc@nvidia.com>
Cc:     <joro@8bytes.org>, <will@kernel.org>, <marcan@marcan.st>,
        <sven@svenpeter.dev>, <robin.murphy@arm.com>,
        <robdclark@gmail.com>, <baolu.lu@linux.intel.com>,
        <orsonzhai@gmail.com>, <baolin.wang7@gmail.com>,
        <zhang.lyra@gmail.com>, <jean-philippe@linaro.org>,
        <jgg@nvidia.com>, <kevin.tian@intel.com>,
        <suravee.suthikulpanit@amd.com>, <alyssa@rosenzweig.io>,
        <dwmw2@infradead.org>, <mjrosato@linux.ibm.com>,
        <gerald.schaefer@linux.ibm.com>, <thierry.reding@gmail.com>,
        <vdumpa@nvidia.com>, <jonathanh@nvidia.com>, <cohuck@redhat.com>,
        <thunder.leizhen@huawei.com>, <christophe.jaillet@wanadoo.fr>,
        <chenxiang66@hisilicon.com>, <john.garry@huawei.com>,
        <yangyingliang@huawei.com>, <iommu@lists.linux.dev>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-s390@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>,
        <virtualization@lists.linux-foundation.org>, <kvm@vger.kernel.org>
Subject: Re: [PATCH v5 0/5] cover-letter: Simplify vfio_iommu_type1
 attach/detach routine
Message-ID: <20220706114217.105f4f61.alex.williamson@redhat.com>
In-Reply-To: <20220701214455.14992-1-nicolinc@nvidia.com>
References: <20220701214455.14992-1-nicolinc@nvidia.com>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 1 Jul 2022 14:44:50 -0700
Nicolin Chen <nicolinc@nvidia.com> wrote:

> This is a preparatory series for IOMMUFD v2 patches. It enforces error
> code -EMEDIUMTYPE in iommu_attach_device() and iommu_attach_group() when
> an IOMMU domain and a device/group are incompatible. It also drops the
> useless domain->ops check since it won't fail in current environment.
> 
> These allow VFIO iommu code to simplify its group attachment routine, by
> avoiding the extra IOMMU domain allocations and attach/detach sequences
> of the old code.
> 
> Worths mentioning the exact match for enforce_cache_coherency is removed
> with this series, since there's very less value in doing that as KVM will
> not be able to take advantage of it -- this just wastes domain memory.
> Instead, we rely on Intel IOMMU driver taking care of that internally.
> 
> This is on github:
> https://github.com/nicolinc/iommufd/commits/vfio_iommu_attach

How do you foresee this going in, I'm imagining Joerg would merge the
first patch via the IOMMU tree and provide a topic branch that I'd
merge into the vfio tree along with the remaining patches.  Sound
right?  Thanks,

Alex

 
> Changelog
> v5:
>  * Rebased on top of Robin's "Simplify bus_type determination".
>  * Fixed a wrong change returning -EMEDIUMTYPE in arm-smmu driver.
>  * Added Baolu's "Reviewed-by".
> v4:
>  * Dropped -EMEDIUMTYPE change in mtk_v1 driver per Robin's input
>  * Added Baolu's and Kevin's Reviewed-by lines
> v3: https://lore.kernel.org/kvm/20220623200029.26007-1-nicolinc@nvidia.com/
>  * Dropped all dev_err since -EMEDIUMTYPE clearly indicates what error.
>  * Updated commit message of enforce_cache_coherency removing patch.
>  * Updated commit message of domain->ops removing patch.
>  * Replaced "goto out_unlock" with simply mutex_unlock() and return.
>  * Added a line of comments for -EMEDIUMTYPE return check.
>  * Moved iommu_get_msi_cookie() into alloc_attach_domain() as a cookie
>    should be logically tied to the lifetime of a domain itself.
>  * Added Kevin's "Reviewed-by".
> v2: https://lore.kernel.org/kvm/20220616000304.23890-1-nicolinc@nvidia.com/
>  * Added -EMEDIUMTYPE to more IOMMU drivers that fit the category.
>  * Changed dev_err to dev_dbg for -EMEDIUMTYPE to avoid kernel log spam.
>  * Dropped iommu_ops patch, and removed domain->ops in VFIO directly,
>    since there's no mixed-driver use case that would fail the sanity.
>  * Updated commit log of the patch removing enforce_cache_coherency.
>  * Fixed a misplace of "num_non_pinned_groups--" in detach_group patch.
>  * Moved "num_non_pinned_groups++" in PATCH-5 to the common path between
>    domain-reusing and new-domain pathways, like the code previously did.
>  * Fixed a typo in EMEDIUMTYPE patch.
> v1: https://lore.kernel.org/kvm/20220606061927.26049-1-nicolinc@nvidia.com/
> 
> Jason Gunthorpe (1):
>   vfio/iommu_type1: Prefer to reuse domains vs match enforced cache
>     coherency
> 
> Nicolin Chen (4):
>   iommu: Return -EMEDIUMTYPE for incompatible domain and device/group
>   vfio/iommu_type1: Remove the domain->ops comparison
>   vfio/iommu_type1: Clean up update_dirty_scope in detach_group()
>   vfio/iommu_type1: Simplify group attachment
> 
>  drivers/iommu/amd/iommu.c                   |   2 +-
>  drivers/iommu/apple-dart.c                  |   4 +-
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c |  15 +-
>  drivers/iommu/arm/arm-smmu/arm-smmu.c       |   5 +-
>  drivers/iommu/arm/arm-smmu/qcom_iommu.c     |   9 +-
>  drivers/iommu/intel/iommu.c                 |  10 +-
>  drivers/iommu/iommu.c                       |  28 ++
>  drivers/iommu/ipmmu-vmsa.c                  |   4 +-
>  drivers/iommu/omap-iommu.c                  |   3 +-
>  drivers/iommu/s390-iommu.c                  |   2 +-
>  drivers/iommu/sprd-iommu.c                  |   6 +-
>  drivers/iommu/tegra-gart.c                  |   2 +-
>  drivers/iommu/virtio-iommu.c                |   3 +-
>  drivers/vfio/vfio_iommu_type1.c             | 352 ++++++++++----------
>  14 files changed, 229 insertions(+), 216 deletions(-)
> 

