Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E65331EA4C3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2020 15:17:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725847AbgFANRQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Jun 2020 09:17:16 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:33347 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725976AbgFANRP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Jun 2020 09:17:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1591017432;
        h=from:from:reply-to:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:mime-version:mime-version:
         content-type:content-type:in-reply-to:in-reply-to:  references:references;
        bh=bTjB8qfrHTSFjfUbutxvl/qwCsz3nerFRx3HPBX7A6Q=;
        b=S/JfOFbasRfNkNF9W59HtZI0O6axEa+LknXGz6r8HXoFLliGjE49Hh2h6eqA+X2J8PfOKG
        jgBzq+ZXHmBfvrN9nJFU2s9QExokmWR60k4p3IHPmlm97W5Bzb2ltqxZpra5aVKL8BXvkP
        rHnOyMuCHLRkjqInqgJ4efV23x+uYsw=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-327-KDNyG12BOhi7GfYjFRcK-Q-1; Mon, 01 Jun 2020 09:17:06 -0400
X-MC-Unique: KDNyG12BOhi7GfYjFRcK-Q-1
Received: by mail-qt1-f197.google.com with SMTP id t24so9925055qtj.15
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2020 06:17:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:reply-to
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=bTjB8qfrHTSFjfUbutxvl/qwCsz3nerFRx3HPBX7A6Q=;
        b=EH1ZpeF6U+Y+mdKKSOYE+prjHr3biWzfKLabXIQDn8k31i66hGL7+1Hg37XDFvIiYL
         UiZiojyfgsguHaieB2RkwA+W7i11hsjPSlkjYWbbkR8ZYfFhjztsrwk0K62cY6ck4+zx
         gx3QKGCCrJdbcYUSU97PNjOrLJ+nYsBuL8TPC7kcN/W8MRN+2Cu8gmTzpsSZj66/F3o8
         yKpyWmCB17vnPmmNGA2SqT/qNMwQUNoeziri1gE8tDPkkC5sP6XRAq0aDdq9Du4Az7yo
         W6Vxnc8N5quG3VJXPVoEF7JBpwqCuQCi9tT+eMn8VaPEGKNErRt+v4othLm3255CxtO6
         HYWQ==
X-Gm-Message-State: AOAM532MBiWO6GMT9JcEQJ0bLbFiCV9qWT3F3VeTqfJfH5btWl9ByBG6
        7LXAFyjYLMYPit/WXIzx3yzJGFd2i5LicAKKTv+RW7TMlVJ5WvEGXqMyfWDS4NDTOmUKG/IQvK1
        z8sYS0EKQCNwesfNbSOhVEt2+/A==
X-Received: by 2002:a0c:ee25:: with SMTP id l5mr20058567qvs.5.1591017425790;
        Mon, 01 Jun 2020 06:17:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxfI03wn2xa5VbguB4ZgxB0Liv4dY32KsoEfpHfoc+ZEMln7Vo+khXJZaEY6bPHZ9c8b/Aysw==
X-Received: by 2002:a0c:ee25:: with SMTP id l5mr20058438qvs.5.1591017424552;
        Mon, 01 Jun 2020 06:17:04 -0700 (PDT)
Received: from localhost (ip70-163-223-149.ph.ph.cox.net. [70.163.223.149])
        by smtp.gmail.com with ESMTPSA id r77sm12075150qke.6.2020.06.01.06.17.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 06:17:03 -0700 (PDT)
Date:   Mon, 1 Jun 2020 06:17:02 -0700
From:   Jerry Snitselaar <jsnitsel@redhat.com>
To:     Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        David Woodhouse <dwmw2@infradead.org>,
        Lu Baolu <baolu.lu@linux.intel.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Clark <robdclark@gmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Gerald Schaefer <gerald.schaefer@de.ibm.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Jean-Philippe Brucker <jean-philippe@linaro.org>,
        linux-s390@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-rockchip@lists.infradead.org,
        iommu@lists.linux-foundation.org,
        linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2 00/33] iommu: Move iommu_group setup to IOMMU core code
Message-ID: <20200601131702.4ksimsjvnsmo3mvn@cantor>
Reply-To: Jerry Snitselaar <jsnitsel@redhat.com>
Mail-Followup-To: Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        David Woodhouse <dwmw2@infradead.org>,
        Lu Baolu <baolu.lu@linux.intel.com>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Clark <robdclark@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
        Gerald Schaefer <gerald.schaefer@de.ibm.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Jean-Philippe Brucker <jean-philippe@linaro.org>,
        linux-s390@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-rockchip@lists.infradead.org,
        iommu@lists.linux-foundation.org,
        linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org
References: <20200414131542.25608-1-joro@8bytes.org>
 <20200529221623.qc6twmpzryh7nkvb@cantor>
 <20200601104240.7f5xhz7gooqhaq4n@cantor>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20200601104240.7f5xhz7gooqhaq4n@cantor>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon Jun 01 20, Jerry Snitselaar wrote:
>On Fri May 29 20, Jerry Snitselaar wrote:
>>On Tue Apr 14 20, Joerg Roedel wrote:
>>>Hi,
>>>
>>>here is the second version of this patch-set. The first version with
>>>some more introductory text can be found here:
>>>
>>>	https://lore.kernel.org/lkml/20200407183742.4344-1-joro@8bytes.org/
>>>
>>>Changes v1->v2:
>>>
>>>	* Rebased to v5.7-rc1
>>>
>>>	* Re-wrote the arm-smmu changes as suggested by Robin Murphy
>>>
>>>	* Re-worked the Exynos patches to hopefully not break the
>>>	  driver anymore
>>>
>>>	* Fixed a missing mutex_unlock() reported by Marek Szyprowski,
>>>	  thanks for that.
>>>
>>>There is also a git-branch available with these patches applied:
>>>
>>>	https://git.kernel.org/pub/scm/linux/kernel/git/joro/linux.git/log/?h=iommu-probe-device-v2
>>>
>>>Please review.
>>>
>>>Thanks,
>>>
>>>	Joerg
>>>
>>>Joerg Roedel (32):
>>>iommu: Move default domain allocation to separate function
>>>iommu/amd: Implement iommu_ops->def_domain_type call-back
>>>iommu/vt-d: Wire up iommu_ops->def_domain_type
>>>iommu/amd: Remove dma_mask check from check_device()
>>>iommu/amd: Return -ENODEV in add_device when device is not handled by
>>>  IOMMU
>>>iommu: Add probe_device() and remove_device() call-backs
>>>iommu: Move default domain allocation to iommu_probe_device()
>>>iommu: Keep a list of allocated groups in __iommu_probe_device()
>>>iommu: Move new probe_device path to separate function
>>>iommu: Split off default domain allocation from group assignment
>>>iommu: Move iommu_group_create_direct_mappings() out of
>>>  iommu_group_add_device()
>>>iommu: Export bus_iommu_probe() and make is safe for re-probing
>>>iommu/amd: Remove dev_data->passthrough
>>>iommu/amd: Convert to probe/release_device() call-backs
>>>iommu/vt-d: Convert to probe/release_device() call-backs
>>>iommu/arm-smmu: Convert to probe/release_device() call-backs
>>>iommu/pamu: Convert to probe/release_device() call-backs
>>>iommu/s390: Convert to probe/release_device() call-backs
>>>iommu/virtio: Convert to probe/release_device() call-backs
>>>iommu/msm: Convert to probe/release_device() call-backs
>>>iommu/mediatek: Convert to probe/release_device() call-backs
>>>iommu/mediatek-v1 Convert to probe/release_device() call-backs
>>>iommu/qcom: Convert to probe/release_device() call-backs
>>>iommu/rockchip: Convert to probe/release_device() call-backs
>>>iommu/tegra: Convert to probe/release_device() call-backs
>>>iommu/renesas: Convert to probe/release_device() call-backs
>>>iommu/omap: Remove orphan_dev tracking
>>>iommu/omap: Convert to probe/release_device() call-backs
>>>iommu/exynos: Use first SYSMMU in controllers list for IOMMU core
>>>iommu/exynos: Convert to probe/release_device() call-backs
>>>iommu: Remove add_device()/remove_device() code-paths
>>>iommu: Unexport iommu_group_get_for_dev()
>>>
>>>Sai Praneeth Prakhya (1):
>>>iommu: Add def_domain_type() callback in iommu_ops
>>>
>>>drivers/iommu/amd_iommu.c       |  97 ++++----
>>>drivers/iommu/amd_iommu_types.h |   1 -
>>>drivers/iommu/arm-smmu-v3.c     |  38 +--
>>>drivers/iommu/arm-smmu.c        |  39 ++--
>>>drivers/iommu/exynos-iommu.c    |  24 +-
>>>drivers/iommu/fsl_pamu_domain.c |  22 +-
>>>drivers/iommu/intel-iommu.c     |  68 +-----
>>>drivers/iommu/iommu.c           | 393 +++++++++++++++++++++++++-------
>>>drivers/iommu/ipmmu-vmsa.c      |  60 ++---
>>>drivers/iommu/msm_iommu.c       |  34 +--
>>>drivers/iommu/mtk_iommu.c       |  24 +-
>>>drivers/iommu/mtk_iommu_v1.c    |  50 ++--
>>>drivers/iommu/omap-iommu.c      |  99 ++------
>>>drivers/iommu/qcom_iommu.c      |  24 +-
>>>drivers/iommu/rockchip-iommu.c  |  26 +--
>>>drivers/iommu/s390-iommu.c      |  22 +-
>>>drivers/iommu/tegra-gart.c      |  24 +-
>>>drivers/iommu/tegra-smmu.c      |  31 +--
>>>drivers/iommu/virtio-iommu.c    |  41 +---
>>>include/linux/iommu.h           |  21 +-
>>>20 files changed, 533 insertions(+), 605 deletions(-)
>>>
>>>-- 
>>>2.17.1
>>>
>>>_______________________________________________
>>>iommu mailing list
>>>iommu@lists.linux-foundation.org
>>>https://lists.linuxfoundation.org/mailman/listinfo/iommu
>>>
>>
>>Hi Joerg,
>>
>>With this patchset, I have an epyc system where if I boot with
>>iommu=nopt and force a dump I will see some io page faults for a nic
>>on the system. The vmcore is harvested and the system reboots. I
>>haven't reproduced it on other systems yet, but without the patchset I
>>don't see the io page faults during the kdump.
>>
>>Regards,
>>Jerry
>
>I just hit an issue on a separate intel based system (kdump iommu=nopt),
>where it panics in during intel_iommu_attach_device, in is_aux_domain,
>due to device_domain_info being DEFER_DEVICE_DOMAIN_INFO. That doesn't
>get set to a valid address until the domain_add_dev_info call.
>
>Is it as simple as the following?
>
>diff --git a/drivers/iommu/intel-iommu.c b/drivers/iommu/intel-iommu.c
>index 29d3940847d3..f1bbeed46a4c 100644
>--- a/drivers/iommu/intel-iommu.c
>+++ b/drivers/iommu/intel-iommu.c
>@@ -5053,8 +5053,8 @@ is_aux_domain(struct device *dev, struct iommu_domain *domain)
> {
>        struct device_domain_info *info = dev->archdata.iommu;
>-       return info && info->auxd_enabled &&
>-                       domain->type == IOMMU_DOMAIN_UNMANAGED;
>+       return info && info != DEFER_DEVICE_DOMAIN_INFO &&
>+               info->auxd_enabled && domain->type == IOMMU_DOMAIN_UNMANAGED;
> }
> static void auxiliary_link_device(struct dmar_domain *domain,
>
>
>Regards,
>Jerry
>

With the patch, I avoid the panic, but I'm seeing an issue similar to the epyc system.
I'm getting dmar faults from a couple of nics and the hp ilo. The addresses in question
were in e820 reserved sections, but there aren't rmrr covering those addresses. The system
manages to harvest the vmcore and reboot like the epyc. Without the patches I don't see
the dmar faults. I needed to give this system back, but I'll try to poke at it some more
in the next couple of days.

Regards,
Jerry

