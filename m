Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E20D32E8C82
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Jan 2021 15:06:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726693AbhACOEx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 3 Jan 2021 09:04:53 -0500
Received: from mail.kernel.org ([198.145.29.99]:36064 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726558AbhACOEw (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 3 Jan 2021 09:04:52 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 482862080D;
        Sun,  3 Jan 2021 14:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609682652;
        bh=Ey75tATsrR5FQShYsC5Hg0ZFtsB2bV+9NEouqmN89Mk=;
        h=From:To:Cc:Subject:Date:From;
        b=RZUXyJwUA7NZie53rvyZdBbLFeSOxzKQZcfBmOgFC1JdnjSEuG7vVqfXdibnm8r22
         /i4uB58bksBlp/Akb0hPM9PREYz7jCCpie9NAm7Knm7LpxUfIEGOnWCtoX3wJjqMSL
         k98kEZKTBsncR8Mpt0Me0o9xfr5GvtV2QtBB6P1NMuIsS7ik144KP4OhQzQnqk9AkR
         KsGCNEiv0YFb37qFQi1EDWX6kzGT3PP+ACn6oHR5g7ZgujyS5cHIkZb7jibkR5FLKk
         M/bQ9lB4ysFAm8rxLl/uQ0DQvr/O47V194vJp3jiIFwcLwiy9zfzT1wTZBxUB4B84h
         ihgqW17Saqxrw==
From:   Arnd Bergmann <arnd@kernel.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        Vara Reddy <varar@codeaurora.org>,
        Tanmay Shah <tanmay@codeaurora.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/msm/a6xx: add CONFIG_QCOM_LLCC dependency
Date:   Sun,  3 Jan 2021 15:03:45 +0100
Message-Id: <20210103140407.3917405-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

When LLCC support is in a loadable module, the adreno support
cannot be built-in:

aarch64-linux-ld: drivers/gpu/drm/msm/adreno/a6xx_gpu.o: in function `a6xx_gpu_init':
a6xx_gpu.c:(.text+0xe0): undefined reference to `llcc_slice_getd'
a6xx_gpu.c:(.text+0xe0): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `llcc_slice_getd'
aarch64-linux-ld: a6xx_gpu.c:(.text+0xec): undefined reference to `llcc_slice_getd'
a6xx_gpu.c:(.text+0xec): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `llcc_slice_getd'
aarch64-linux-ld: drivers/gpu/drm/msm/adreno/a6xx_gpu.o: in function `a6xx_destroy':
a6xx_gpu.c:(.text+0x274): undefined reference to `llcc_slice_putd'
a6xx_gpu.c:(.text+0x274): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `llcc_slice_putd'
aarch64-linux-ld: a6xx_gpu.c:(.text+0x27c): undefined reference to `llcc_slice_putd'

Add a Kconfig dependency that disallows the broken configuration
but allows all working ones.

Fixes: 474dadb8b0d5 ("drm/msm/a6xx: Add support for using system cache(LLC)")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/msm/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
index dabb4a1ccdcf..b8e02859fd92 100644
--- a/drivers/gpu/drm/msm/Kconfig
+++ b/drivers/gpu/drm/msm/Kconfig
@@ -7,6 +7,8 @@ config DRM_MSM
 	depends on IOMMU_SUPPORT
 	depends on OF && COMMON_CLK
 	depends on QCOM_OCMEM || QCOM_OCMEM=n
+	depends on QCOM_LLCC || QCOM_LLCC=n
+	depends on QCOM_COMMAND_DB || QCOM_COMMAND_DB=n
 	select IOMMU_IO_PGTABLE
 	select QCOM_MDT_LOADER if ARCH_QCOM
 	select REGULATOR
@@ -15,7 +17,6 @@ config DRM_MSM
 	select SHMEM
 	select TMPFS
 	select QCOM_SCM if ARCH_QCOM
-	select QCOM_COMMAND_DB if ARCH_QCOM
 	select WANT_DEV_COREDUMP
 	select SND_SOC_HDMI_CODEC if SND_SOC
 	select SYNC_FILE
-- 
2.29.2

