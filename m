Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F834AC222
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2019 23:46:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404506AbfIFVqe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Sep 2019 17:46:34 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:33306 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404449AbfIFVqe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Sep 2019 17:46:34 -0400
Received: by mail-pf1-f195.google.com with SMTP id q10so5461471pfl.0;
        Fri, 06 Sep 2019 14:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=X+UKEokhysiEjhebMkmydc3Xut+rkxm/820z0jqk+pw=;
        b=bB+2a2042/w5fLDKgGxSCU63OZJdemRj5lstmeKzyz2kKsymPU9qKVPAWAO5XqEpoX
         NQjWZboO1Xqc9cYWPK+zS0a3/dsBVhTx70hSi7CyLwAMb2LXE/egWyxML/yi+G4vilyP
         nAL/lrr66lcMxFh/V1lf0zajAvVc9b7txxr2NelsFwTbWER/5mfQ/zuuL5HzZO9fMRnn
         jGNd8gO46slJn5TOTEht06yzy1gkw82s82dF+024ICCWEH7H3wPEZO1EkRhjI8sD8ae+
         z38HpfgWvwwlmJc+rBx98Ea9ZmRte4k86rNSkO4ohCvZ0gLKR42divMBeZ74wTyoYj5y
         FgEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=X+UKEokhysiEjhebMkmydc3Xut+rkxm/820z0jqk+pw=;
        b=AHA8r+6AbmFa2DzEeypau87n7a7n4e77z2Bc1a3vMeBt8e7jNwS69pVfo1re/oWxyD
         DgD2e6tEQZpvusi1GxoPwzCyiYsIGJ9Adu/lrOCvTbpTLHfTzccW99utz5NywPvo24Q4
         GyF3jMByn7gJY5kWT0J4zYTNg+1xreLDuQ1RJXuH3Hz65GKjEMfr+xAgOnb7vYVyBfZ6
         JlrMqBppAwsR+KAWdh3ukFzWHTn+22esIgtXiHxcWpvM6Rb7PJWRAcVpoj7BlReRY8Ij
         tsKFhJoyhjmTGjT9K9FtzWAyPJfc4aSsz1SHP/3ecQpSKz8RdpvdJBRHNyyKdOXwnkHu
         3xFw==
X-Gm-Message-State: APjAAAXxu4sYR5GrbDIGAKDfl6rjK7gGOC7I63zh387eyr/tlxPIvsYN
        FPJkDJxQeUROkyT4a4XIsCI=
X-Google-Smtp-Source: APXvYqxAQm+A/TufbfRwRtbAOXBB+uXmA4OqTTf7BWWv93xs12KzKxBrIOgomoXlI9U4Nb+Q86U1eg==
X-Received: by 2002:a17:90a:bf0a:: with SMTP id c10mr11992578pjs.78.1567806393371;
        Fri, 06 Sep 2019 14:46:33 -0700 (PDT)
Received: from localhost ([100.118.89.196])
        by smtp.gmail.com with ESMTPSA id 74sm13108243pfy.78.2019.09.06.14.46.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2019 14:46:32 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     iommu@lists.linux-foundation.org
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Rob Clark <robdclark@chromium.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Alexios Zavras <alexios.zavras@intel.com>,
        Allison Randal <allison@lohutok.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Boris Brezillon <bbrezillon@kernel.org>,
        Bruce Wang <bzwang@chromium.org>,
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), Georgi Djakov <georgi.djakov@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Joe Perches <joe@perches.com>, Joerg Roedel <jroedel@suse.de>,
        Jonathan Marek <jonathan@marek.ca>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        linux-kernel@vger.kernel.org (open list),
        Mamta Shukla <mamtashukla555@gmail.com>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Sean Paul <seanpaul@chromium.org>,
        Sravanthi Kollukuduru <skolluku@codeaurora.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH v3 0/2] iommu: handle drivers that manage iommu directly
Date:   Fri,  6 Sep 2019 14:44:00 -0700
Message-Id: <20190906214409.26677-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

One of the challenges we have to enable the aarch64 laptops upstream
is dealing with the fact that the bootloader enables the display and
takes the corresponding SMMU context-bank out of BYPASS.  Unfortunately,
currently, the IOMMU framework attaches a DMA (or potentially an
IDENTITY) domain before the driver is probed and has a chance to
intervene and shutdown scanout.  Which makes things go horribly wrong.

But in this case, drm/msm is already directly managing it's IOMMUs
directly, the DMA API attached iommu_domain simply gets in the way.
This series adds a way that a driver can indicate to drivers/iommu
that it does not wish to have an DMA managed iommu_domain attached.
This way, drm/msm can shut down scanout cleanly before attaching it's
own iommu_domain.

NOTE that to get things working with arm-smmu on the aarch64 laptops,
you also need a patchset[1] from Bjorn Andersson to inherit SMMU config
at boot, when it is already enabled.

[1] https://www.spinics.net/lists/arm-kernel/msg732246.html

NOTE that in discussion of previous revisions, RMRR came up.  This is
not really a replacement for RMRR (nor does RMRR really provide any
more information than we already get from EFI GOP, or DT in the
simplefb case).  I also don't see how RMRR could help w/ SMMU handover
of CB/SMR config (Bjorn's patchset[1]) without defining new tables.

This perhaps doesn't solve the more general case of bootloader enabled
display for drivers that actually want to use DMA API managed IOMMU.
But it does also happen to avoid a related problem with GPU, caused by
the DMA domain claiming the context bank that the GPU firmware expects
to use.  And it avoids spurious TLB invalidation coming from the unused
DMA domain.  So IMHO this is a useful and necessary change.

Rob Clark (2):
  iommu: add support for drivers that manage iommu explicitly
  drm/msm: mark devices where iommu is managed by driver

 drivers/gpu/drm/msm/adreno/adreno_device.c | 1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c    | 1 +
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c   | 1 +
 drivers/gpu/drm/msm/msm_drv.c              | 1 +
 drivers/iommu/iommu.c                      | 2 +-
 drivers/iommu/of_iommu.c                   | 3 +++
 include/linux/device.h                     | 3 ++-
 7 files changed, 10 insertions(+), 2 deletions(-)

-- 
2.21.0

