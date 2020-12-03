Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84BDD2CE27A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Dec 2020 00:17:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729911AbgLCXOd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Dec 2020 18:14:33 -0500
Received: from mail.kernel.org ([198.145.29.99]:36284 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727848AbgLCXOd (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Dec 2020 18:14:33 -0500
From:   Arnd Bergmann <arnd@kernel.org>
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jordan Crouse <jcrouse@codeaurora.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, Tanmay Shah <tanmay@codeaurora.org>,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        Vara Reddy <varar@codeaurora.org>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Jonathan Marek <jonathan@marek.ca>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/msm: add IOMMU_SUPPORT dependency
Date:   Fri,  4 Dec 2020 00:13:38 +0100
Message-Id: <20201203231346.1483460-1-arnd@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

The iommu pgtable support is only available when IOMMU support
is built into the kernel:

WARNING: unmet direct dependencies detected for IOMMU_IO_PGTABLE
  Depends on [n]: IOMMU_SUPPORT [=n]
  Selected by [y]:
  - DRM_MSM [=y] && HAS_IOMEM [=y] && DRM [=y] && (ARCH_QCOM [=y] || SOC_IMX5 || ARM && COMPILE_TEST [=y]) && OF [=y] && COMMON_CLK [=y] && MMU [=y] && (QCOM_OCMEM [=y] || QCOM_OCMEM [=y]=n)

Fix the dependency accordingly. There is no need for depending on
CONFIG_MMU any more, as that is implied by the iommu support.

Fixes: b145c6e65eb0 ("drm/msm: Add support to create a local pagetable")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/msm/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
index e5816b498494..dabb4a1ccdcf 100644
--- a/drivers/gpu/drm/msm/Kconfig
+++ b/drivers/gpu/drm/msm/Kconfig
@@ -4,8 +4,8 @@ config DRM_MSM
 	tristate "MSM DRM"
 	depends on DRM
 	depends on ARCH_QCOM || SOC_IMX5 || (ARM && COMPILE_TEST)
+	depends on IOMMU_SUPPORT
 	depends on OF && COMMON_CLK
-	depends on MMU
 	depends on QCOM_OCMEM || QCOM_OCMEM=n
 	select IOMMU_IO_PGTABLE
 	select QCOM_MDT_LOADER if ARCH_QCOM
-- 
2.27.0

