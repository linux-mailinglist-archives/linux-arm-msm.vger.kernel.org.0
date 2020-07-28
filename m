Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8895E231083
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jul 2020 19:09:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731580AbgG1RJJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Jul 2020 13:09:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:35008 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731510AbgG1RJH (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Jul 2020 13:09:07 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.213])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D79B220792;
        Tue, 28 Jul 2020 17:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595956147;
        bh=VAI8WP8+wW4qJ9tQCB41NOf7v1n5wUijWbIgNFmDwXo=;
        h=From:To:Cc:Subject:Date:From;
        b=BVVHKM1hkuYqzDbdJY7kVXUv0ivAY/LK1Dv96e+cQ+PqTB7JE8fjQP0QgWeTqV8Ye
         yfUgaaDqu/cJ5WTGUXX9j4p3Ux++RApP4b3XtVy93aOP5Sr6phKNzmJwr1lIhyz1Xw
         LflB5f5oj03w3YvssSPJ5y1jV1y4FETmM78HYmPA=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Joerg Roedel <joro@8bytes.org>,
        David Woodhouse <dwmw2@infradead.org>,
        Lu Baolu <baolu.lu@linux.intel.com>,
        Rob Clark <robdclark@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 1/3] iommu: amd: Fix kerneldoc
Date:   Tue, 28 Jul 2020 19:08:57 +0200
Message-Id: <20200728170859.28143-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fix W=1 compile warnings (invalid kerneldoc):

    drivers/iommu/amd/init.c:1586: warning: Function parameter or member 'ivrs' not described in 'get_highest_supported_ivhd_type'
    drivers/iommu/amd/init.c:1938: warning: Function parameter or member 'iommu' not described in 'iommu_update_intcapxt'

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/iommu/amd/init.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/amd/init.c b/drivers/iommu/amd/init.c
index 958050c213f9..4a37169b1b1b 100644
--- a/drivers/iommu/amd/init.c
+++ b/drivers/iommu/amd/init.c
@@ -1578,7 +1578,7 @@ static int __init init_iommu_one(struct amd_iommu *iommu, struct ivhd_header *h)
 
 /**
  * get_highest_supported_ivhd_type - Look up the appropriate IVHD type
- * @ivrs          Pointer to the IVRS header
+ * @ivrs: Pointer to the IVRS header
  *
  * This function search through all IVDB of the maximum supported IVHD
  */
@@ -1929,7 +1929,7 @@ static int iommu_setup_msi(struct amd_iommu *iommu)
 #define XT_INT_VEC(x)		(((x) & 0xFFULL) << 32)
 #define XT_INT_DEST_HI(x)	((((x) >> 24) & 0xFFULL) << 56)
 
-/**
+/*
  * Setup the IntCapXT registers with interrupt routing information
  * based on the PCI MSI capability block registers, accessed via
  * MMIO MSI address low/hi and MSI data registers.
-- 
2.17.1

