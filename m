Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 184B41289C4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Dec 2019 16:04:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726716AbfLUPET (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 21 Dec 2019 10:04:19 -0500
Received: from mail-ed1-f66.google.com ([209.85.208.66]:43335 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727056AbfLUPEP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 21 Dec 2019 10:04:15 -0500
Received: by mail-ed1-f66.google.com with SMTP id dc19so11377183edb.10
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Dec 2019 07:04:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tcd-ie.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Wrv1jKXMHqqWHNzOL/6EYVPe/DHxphPiIOsjGB9s2BI=;
        b=neV87FDzcGxEtXMGvHrtTmbUOLtYtU+7I9MOQqfdQ+hsUXA8p8rI9n+KxmtaOLCADC
         oqzQwM+E41sGIEhE26+tkV5wTeVqusoqBdHCsFTHLhlkaDp++P9e9+/8rjVQr/Wsf9hN
         kPbAbKsiSsT63+7OMPlwjagzVfM0swjA056jVZJc1EqBSggoujvgAZK6bAD1VYJYtXeD
         ft7DHsq/EkMf9BhDvmD36g1hqGBWyqNIVG1DfNnWrfT4s1zi4GMzfbjEz0QIobV6kmY1
         laD6eUJQwGoQ0UWRg2PHTAA5VDA0M3C2Amsc74c9QymUHI36GRshkavBOusZCLhvlyeT
         csig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Wrv1jKXMHqqWHNzOL/6EYVPe/DHxphPiIOsjGB9s2BI=;
        b=qJx3tjdgzVQ//TAxfpPxw3ikfJGoYu0/9PweyQZKmsIX41GpYm8yZwB2PRSuIepNc5
         j0JNm95XWzsJN2s39fzQdlZoOy3S3FxaiRU/qmRjjArmqd+VrMB8NAzKiGQPwU3+HcDk
         a8N3UlpRIgBCqYezxEn9LGksi4YX1Py4Kfu0kCwoPN4wzrFrDuuCgBQefNE/YOm8jUvr
         iEqAtIL4gh6ie4lat4U9rFDUjbtkUrj125Oe4Vt/VxGyFVauSuV5jf9oeGqYUh5Bkf7h
         Ty3W2lzQrB4kvLiul2ueMTeufjTxFjptSRO2KyjlncypLPZhLhuMUoT5c1MiZb/RKpaw
         wWVg==
X-Gm-Message-State: APjAAAXbWifHuU7Mufl8YMUYxpbH1hglGtlpMf5gNlPo6H8q2wx1INRP
        G3LoDUJE8sTPS+OKPgLaP6t4BQ==
X-Google-Smtp-Source: APXvYqzVFV+nAZt2efpFSBwn8fHDfarT+lNLK2u/m6P0Ib5tJlSKcUyhpXmrMgKd3Rdn4f4Yf8qeow==
X-Received: by 2002:a17:906:2e53:: with SMTP id r19mr22235209eji.306.1576940652743;
        Sat, 21 Dec 2019 07:04:12 -0800 (PST)
Received: from localhost.localdomain ([80.233.37.20])
        by smtp.googlemail.com with ESMTPSA id u13sm1517639ejz.69.2019.12.21.07.04.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Dec 2019 07:04:12 -0800 (PST)
From:   Tom Murphy <murphyt7@tcd.ie>
To:     iommu@lists.linux-foundation.org
Cc:     Tom Murphy <murphyt7@tcd.ie>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
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
        Alex Williamson <alex.williamson@redhat.com>,
        Cornelia Huck <cohuck@redhat.com>,
        Julien Grall <julien.grall@arm.com>,
        Marc Zyngier <maz@kernel.org>,
        Eric Auger <eric.auger@redhat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-tegra@vger.kernel.org,
        virtualization@lists.linux-foundation.org, kvm@vger.kernel.org
Subject: [PATCH 0/8] Convert the intel iommu driver to the dma-iommu api
Date:   Sat, 21 Dec 2019 15:03:52 +0000
Message-Id: <20191221150402.13868-1-murphyt7@tcd.ie>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patchset converts the intel iommu driver to the dma-iommu api.

While converting the driver I exposed a bug in the intel i915 driver which causes a huge amount of artifacts on the screen of my laptop. You can see a picture of it here:
https://github.com/pippy360/kernelPatches/blob/master/IMG_20191219_225922.jpg

This issue is most likely in the i915 driver and is most likely caused by the driver not respecting the return value of the dma_map_ops::map_sg function. You can see the driver ignoring the return value here:
https://github.com/torvalds/linux/blob/7e0165b2f1a912a06e381e91f0f4e495f4ac3736/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c#L51

Previously this didn’t cause issues because the intel map_sg always returned the same number of elements as the input scatter gather list but with the change to this dma-iommu api this is no longer the case. I wasn’t able to track the bug down to a specific line of code unfortunately.  

Could someone from the intel team look at this?


I have been testing on a lenovo x1 carbon 5th generation. Let me know if there’s any more information you need.

To allow my patch set to be tested I have added a patch (patch 8/8) in this series to disable combining sg segments in the dma-iommu api which fixes the bug but it doesn't fix the actual problem.

As part of this patch series I copied the intel bounce buffer code to the dma-iommu path. The addition of the bounce buffer code took me by surprise. I did most of my development on this patch series before the bounce buffer code was added and my reimplementation in the dma-iommu path is very rushed and not properly tested but I’m running out of time to work on this patch set.

On top of that I also didn’t port over the intel tracing code from this commit:
https://github.com/torvalds/linux/commit/3b53034c268d550d9e8522e613a14ab53b8840d8#diff-6b3e7c4993f05e76331e463ab1fc87e1
So all the work in that commit is now wasted. The code will need to be removed and reimplemented in the dma-iommu path. I would like to take the time to do this but I really don’t have the time at the moment and I want to get these changes out before the iommu code changes any more.


Tom Murphy (8):
  iommu/vt-d: clean up 32bit si_domain assignment
  iommu/vt-d: Use default dma_direct_* mapping functions for direct
    mapped devices
  iommu/vt-d: Remove IOVA handling code from non-dma_ops path
  iommu: Handle freelists when using deferred flushing in iommu drivers
  iommu: Add iommu_dma_free_cpu_cached_iovas function
  iommu: allow the dma-iommu api to use bounce buffers
  iommu/vt-d: Convert intel iommu driver to the iommu ops
  DO NOT MERGE: iommu: disable list appending in dma-iommu

 drivers/iommu/Kconfig           |   1 +
 drivers/iommu/amd_iommu.c       |  14 +-
 drivers/iommu/arm-smmu-v3.c     |   3 +-
 drivers/iommu/arm-smmu.c        |   3 +-
 drivers/iommu/dma-iommu.c       | 183 +++++--
 drivers/iommu/exynos-iommu.c    |   3 +-
 drivers/iommu/intel-iommu.c     | 936 ++++----------------------------
 drivers/iommu/iommu.c           |  39 +-
 drivers/iommu/ipmmu-vmsa.c      |   3 +-
 drivers/iommu/msm_iommu.c       |   3 +-
 drivers/iommu/mtk_iommu.c       |   3 +-
 drivers/iommu/mtk_iommu_v1.c    |   3 +-
 drivers/iommu/omap-iommu.c      |   3 +-
 drivers/iommu/qcom_iommu.c      |   3 +-
 drivers/iommu/rockchip-iommu.c  |   3 +-
 drivers/iommu/s390-iommu.c      |   3 +-
 drivers/iommu/tegra-gart.c      |   3 +-
 drivers/iommu/tegra-smmu.c      |   3 +-
 drivers/iommu/virtio-iommu.c    |   3 +-
 drivers/vfio/vfio_iommu_type1.c |   2 +-
 include/linux/dma-iommu.h       |   3 +
 include/linux/intel-iommu.h     |   1 -
 include/linux/iommu.h           |  32 +-
 23 files changed, 345 insertions(+), 908 deletions(-)

-- 
2.20.1

