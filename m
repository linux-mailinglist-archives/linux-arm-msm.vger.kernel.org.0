Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44E6D42C3BE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Oct 2021 16:43:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234081AbhJMOpW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Oct 2021 10:45:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:51490 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236976AbhJMOpR (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Oct 2021 10:45:17 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E667661166;
        Wed, 13 Oct 2021 14:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634136193;
        bh=3YOpUj7zJIjHOwNL7dHDpxdkIPlsudzfvv538+Bhka0=;
        h=From:To:Cc:Subject:Date:From;
        b=ioHRl71JgzZ0mbftYm/WArKiGSk5dzcVQvzsXVP7zv2nWL4M22qfgruxeGeqOkzHO
         +u7kIJ7Af439F+wP9OuveVQDGGLgnD1nwQc3CmOlSsyLO8t4AiyWj0DzN6eZwWTCal
         tnuHzV/3oZaLuOHeGuB0wpxSoNmTRYNA9GHWnA0Qp3uh+p5iaLH6j6Ez/ldAjVxHS1
         vmL2is+oMpacdVpqgx0ymn1tCl+Gx0KEVSnalG5F5eDYtceNwRNUSkLc45R5hdO0Sr
         Udc8D60oJar4TuxLNhJnjjoS391ykJf7K2SswEs6zjPZkTxWxRvvtL0XwgaHQKjDal
         DxliTR8fRQprw==
From:   Arnd Bergmann <arnd@kernel.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Randy Dunlap <rdunlap@infradead.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Alex Elder <elder@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Rajeev Nandan <rajeevny@codeaurora.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm: msm: fix building without CONFIG_COMMON_CLK
Date:   Wed, 13 Oct 2021 16:42:56 +0200
Message-Id: <20211013144308.2248978-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

When CONFIG_COMMON_CLOCK is disabled, the 8996 specific
phy code is left out, which results in a link failure:

ld: drivers/gpu/drm/msm/hdmi/hdmi_phy.o:(.rodata+0x3f0): undefined reference to `msm_hdmi_phy_8996_cfg'

This was only exposed after it became possible to build
test the driver without the clock interfaces.

Make COMMON_CLK a hard dependency for compile testing,
and simplify it a little based on that.

Fixes: b3ed524f84f5 ("drm/msm: allow compile_test on !ARM")
Reported-by: Randy Dunlap <rdunlap@infradead.org>
Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/msm/Kconfig  | 2 +-
 drivers/gpu/drm/msm/Makefile | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
index f5107b6ded7b..cb204912e0f4 100644
--- a/drivers/gpu/drm/msm/Kconfig
+++ b/drivers/gpu/drm/msm/Kconfig
@@ -4,8 +4,8 @@ config DRM_MSM
 	tristate "MSM DRM"
 	depends on DRM
 	depends on ARCH_QCOM || SOC_IMX5 || COMPILE_TEST
+	depends on COMMON_CLK
 	depends on IOMMU_SUPPORT
-	depends on (OF && COMMON_CLK) || COMPILE_TEST
 	depends on QCOM_OCMEM || QCOM_OCMEM=n
 	depends on QCOM_LLCC || QCOM_LLCC=n
 	depends on QCOM_COMMAND_DB || QCOM_COMMAND_DB=n
diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index 904535eda0c4..bbee22b54b0c 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -23,8 +23,10 @@ msm-y := \
 	hdmi/hdmi_i2c.o \
 	hdmi/hdmi_phy.o \
 	hdmi/hdmi_phy_8960.o \
+	hdmi/hdmi_phy_8996.o \
 	hdmi/hdmi_phy_8x60.o \
 	hdmi/hdmi_phy_8x74.o \
+	hdmi/hdmi_pll_8960.o \
 	edp/edp.o \
 	edp/edp_aux.o \
 	edp/edp_bridge.o \
@@ -37,6 +39,7 @@ msm-y := \
 	disp/mdp4/mdp4_dtv_encoder.o \
 	disp/mdp4/mdp4_lcdc_encoder.o \
 	disp/mdp4/mdp4_lvds_connector.o \
+	disp/mdp4/mdp4_lvds_pll.o \
 	disp/mdp4/mdp4_irq.o \
 	disp/mdp4/mdp4_kms.o \
 	disp/mdp4/mdp4_plane.o \
@@ -117,9 +120,6 @@ msm-$(CONFIG_DRM_MSM_DP)+= dp/dp_aux.o \
 	dp/dp_audio.o
 
 msm-$(CONFIG_DRM_FBDEV_EMULATION) += msm_fbdev.o
-msm-$(CONFIG_COMMON_CLK) += disp/mdp4/mdp4_lvds_pll.o
-msm-$(CONFIG_COMMON_CLK) += hdmi/hdmi_pll_8960.o
-msm-$(CONFIG_COMMON_CLK) += hdmi/hdmi_phy_8996.o
 
 msm-$(CONFIG_DRM_MSM_HDMI_HDCP) += hdmi/hdmi_hdcp.o
 
-- 
2.29.2

