Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C1C3B5DB24
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2019 03:50:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727100AbfGCBuV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Jul 2019 21:50:21 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:38685 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726329AbfGCBuV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Jul 2019 21:50:21 -0400
Received: by mail-qt1-f193.google.com with SMTP id n11so826062qtl.5;
        Tue, 02 Jul 2019 18:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aM7TEuKumvUMe3SbB3+XmY4I8aQKFrST7xx8ZApBOcM=;
        b=Y0c3Zbx/HklkB3ZQUMPUnd3cuD2+CXBd/qv6pY0OkEJTg/+z03wi0oF1CvFJYsaUkZ
         4zHdADC6xI/bjao5kJDJAheklnpxnkP641vjkWWAD6dXp83EK+bgIBqRrhp5R+e9GhCz
         zCGy7sAlE3XsPTlqcBMQPxFhUYqm5Yg2JhxtQejc7AlhxkxL1xSYYXRVk6l4V/OzXbVr
         F2N4nVUleb2SyZc8sgC2poSaaQ+CgHZiuCRWIi+78YgA4bpPN5KzS8h7SHnC0qrpdgs/
         YZxrEttZo98QKBCnwb20wNLc3UgkTsaMpeRea2ivIhOm1ixPyotAxAUbQecsF1pxUnqv
         E1Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aM7TEuKumvUMe3SbB3+XmY4I8aQKFrST7xx8ZApBOcM=;
        b=WdoTkpU5Tgrc0jYoCvIk/+u664gzb+skwTTi/c56O9eaQZ0+T85W5dskBAOmrnrhNW
         mfQgDIJHVUpe9uobnMnLfhnocWJMfeaF9CnBnxQQprsFc5NO7wHbKsozH8+KI2Q+etoN
         /PfKntP/PDmi5mk57UKO+ZZs0BRYCMyfHnVWzYr6u+4JV2oLGt66joD57jBgumVQZm1z
         rY7J6bHPya7aWFwA548AtRHPMosjHGu7RzguMatpBziJqUT7QK8aZ4kH/dek1Jk6w4wh
         mpabUIkYEDyzOmsxSHArDDQGuq1/hY6YrvF9IyW6zEVt50vHOceoti00QMIZwzZDR5od
         TbdQ==
X-Gm-Message-State: APjAAAXNigybF3xK/JP6c8AdRgkeUEIyJJ0xaWRlauTIljPm6KEN4wFw
        oCt+VpSIpm+GXzoMEknZrVTKiod2xDnNDg==
X-Google-Smtp-Source: APXvYqxHJBmk2g0xpgV4VUHGsLMtAzHIfVL3nv7QBsGBAXs8stUf9sYJU+dbtd2Yxf85Z4tgzUX1Cw==
X-Received: by 2002:a0c:b755:: with SMTP id q21mr27605171qve.92.1562099204529;
        Tue, 02 Jul 2019 13:26:44 -0700 (PDT)
Received: from localhost ([2601:184:4780:7861:5010:5849:d76d:b714])
        by smtp.gmail.com with ESMTPSA id f6sm6267017qkk.79.2019.07.02.13.26.43
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 02 Jul 2019 13:26:44 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     iommu@lists.linux-foundation.org, dri-devel@lists.freedesktop.org
Cc:     aarch64-laptops@lists.linaro.org,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Boris Brezillon <bbrezillon@kernel.org>,
        Bruce Wang <bzwang@chromium.org>,
        Daniel Mack <daniel@zonque.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Joe Perches <joe@perches.com>, Joerg Roedel <jroedel@suse.de>,
        Jonathan Marek <jonathan@marek.ca>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        linux-kernel@vger.kernel.org (open list),
        Mamta Shukla <mamtashukla555@gmail.com>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Sean Paul <seanpaul@chromium.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>
Subject: [PATCH 0/2] iommu: handle drivers that manage iommu directly
Date:   Tue,  2 Jul 2019 13:26:17 -0700
Message-Id: <20190702202631.32148-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

One of the challenges we need to handle to enable the aarch64 laptops
upstream is dealing with the fact that the bootloader enables the
display and takes the corresponding SMMU context-bank out of BYPASS.
Unfortunately, currently, the IOMMU framework attaches a DMA (or
potentially an IDENTITY) domain before the driver is probed and has
a chance to intervene and shutdown[1] scanout.  Which makes things go
horribly wrong.

This also happens to solve a problem that is blocking us from supporting
per-context pagetables on the GPU, due to domain that is attached before
driver has a chance to attach it's own domain for the GPU.

But since the driver is managing it's own iommu domains directly, and
does not use dev->iommu_group->default_domain at all, the simple
solution to both problems is to just avoid attaching that domain in the
first place.

[1] Eventually we want to be able to do a seemless transition from
    efifb to drm/msm... but first step is to get the core (iommu,
    clk, genpd) pieces in place, so a first step of disabling the
    display before first modeset enables us to get all of the
    dependencies outside of drm/msm in place.  And this at least
    gets us parity with windows (which also appears to do a modeset
    between bootloader and HLSO).  After that there is a bunch of
    drm/msm work that is probably not interesting to folks outside
    of dri-devel.

Rob Clark (2):
  iommu: add support for drivers that manage iommu explicitly
  drm/msm: mark devices where iommu is managed by driver

 drivers/gpu/drm/msm/adreno/adreno_device.c |  1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c    |  1 +
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c   |  1 +
 drivers/gpu/drm/msm/msm_drv.c              |  1 +
 drivers/iommu/iommu.c                      | 11 +++++++++++
 include/linux/device.h                     |  3 ++-
 6 files changed, 17 insertions(+), 1 deletion(-)

-- 
2.20.1

