Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23D9A3DDB94
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Aug 2021 16:53:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234621AbhHBOxi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Aug 2021 10:53:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:52706 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234525AbhHBOxh (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Aug 2021 10:53:37 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2142D60F9E;
        Mon,  2 Aug 2021 14:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627916008;
        bh=iktsDM1Z7Dg9UJifRq0gxssHsMU80wtAv8bXJM+4Nig=;
        h=From:To:Cc:Subject:Date:From;
        b=a99xmYHuntKVfkrVkRyGjIvdzmAzamKe9nEuOf/TFcpC4p1sCd46pFyu9oMgGW699
         WJmLTi/6ukT8rQST4IauLqB9HSM6QiDUHZKQMAy89fdKht9uLaY5fxR5IqTllDA8Zx
         t1odmu5RiGp0hM4mgD/bqwDRHCco7OMHcAWc1EvmdWB4nbqaHiWspzicWiweqPxo63
         AX3QxwAqMd5XfsTFv9tM+a2R7XAbMzxmI93Z+g31Vrovbg/OSI2tg43ScER7WXJQub
         V1jw+KPPL7TsXHkq4cVziTkAE5gJPGt7xM6zxto388Bf24DGXssFztR6ha2erOYaTz
         2jg6ZTRIBFw1w==
From:   Arnd Bergmann <arnd@kernel.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     John Stultz <john.stultz@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Tanmay Shah <tanmay@codeaurora.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Kees Cook <keescook@chromium.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/msm/gpu: fix link failure with QCOM_SCM=m
Date:   Mon,  2 Aug 2021 16:53:00 +0200
Message-Id: <20210802145321.1153989-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

Another missed dependency when SCM is a loadable module
and adreno is built-in:

drivers/gpu/drm/msm/adreno/adreno_gpu.o: In function `adreno_zap_shader_load':
adreno_gpu.c:(.text+0x1e8): undefined reference to `qcom_scm_is_available'
drivers/gpu/drm/msm/adreno/a5xx_gpu.o: In function `a5xx_hw_init':
a5xx_gpu.c:(.text+0x28a6): undefined reference to `qcom_scm_set_remote_state'

Change it so the dependency on QCOM_SCM and QCOM_MDT_LOADER can be
ignored if we are not building for ARCH_QCOM, but prevent the
link error during compile testing when SCM is a loadable module
and ARCH_QCOM is disabled.

Fixes: a9e2559c931d ("drm/msm/gpu: Move zap shader loading to adreno")
Fixes: 5ea4dba68305 ("drm/msm/a6xx: add CONFIG_QCOM_LLCC dependency")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/msm/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
index 52536e7adb95..69fbfe4568b2 100644
--- a/drivers/gpu/drm/msm/Kconfig
+++ b/drivers/gpu/drm/msm/Kconfig
@@ -9,14 +9,14 @@ config DRM_MSM
 	depends on QCOM_OCMEM || QCOM_OCMEM=n
 	depends on QCOM_LLCC || QCOM_LLCC=n
 	depends on QCOM_COMMAND_DB || QCOM_COMMAND_DB=n
+	depends on QCOM_SCM || (QCOM_SCM=n && ARCH_QCOM=n)
+	depends on QCOM_MDT_LOADER || ARCH_QCOM=n
 	select IOMMU_IO_PGTABLE
-	select QCOM_MDT_LOADER if ARCH_QCOM
 	select REGULATOR
 	select DRM_KMS_HELPER
 	select DRM_PANEL
 	select SHMEM
 	select TMPFS
-	select QCOM_SCM if ARCH_QCOM
 	select WANT_DEV_COREDUMP
 	select SND_SOC_HDMI_CODEC if SND_SOC
 	select SYNC_FILE
-- 
2.29.2

