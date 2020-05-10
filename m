Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54AE11CCAAD
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 May 2020 14:08:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728315AbgEJMIv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 10 May 2020 08:08:51 -0400
Received: from mx3.molgen.mpg.de ([141.14.17.11]:39023 "EHLO mx1.molgen.mpg.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726863AbgEJMIu (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 10 May 2020 08:08:50 -0400
Received: from hopp.molgen.mpg.de (hopp.molgen.mpg.de [141.14.25.186])
        by mx.molgen.mpg.de (Postfix) with ESMTP id BFC4C2002EE02;
        Sun, 10 May 2020 14:08:47 +0200 (CEST)
From:   Paul Menzel <pmenzel@molgen.mpg.de>
To:     dri-devel@lists.freedesktop.org
Cc:     Paul Menzel <pmenzel@molgen.mpg.de>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alex Deucher <alexander.deucher@amd.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        David Zhou <David1.Zhou@amd.com>, amd-gfx@lists.freedesktop.org
Subject: [PATCH 2/3] gpu/drm: Fix spelling of *frequency*
Date:   Sun, 10 May 2020 14:08:34 +0200
Message-Id: <20200510120835.32054-2-pmenzel@molgen.mpg.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200510120835.32054-1-pmenzel@molgen.mpg.de>
References: <20200510120835.32054-1-pmenzel@molgen.mpg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fix all occurrences with the command below.

    git grep -l frequencey | xargs sed -i 's/frequencey/frequency/g'

Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: David (ChunMing) Zhou <David1.Zhou@amd.com>
Cc: amd-gfx@lists.freedesktop.org
Signed-off-by: Paul Menzel <pmenzel@molgen.mpg.de>
---
 drivers/gpu/drm/amd/include/atombios.h | 4 ++--
 drivers/gpu/drm/msm/dsi/dsi_host.c     | 2 +-
 drivers/gpu/drm/radeon/atombios.h      | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/include/atombios.h b/drivers/gpu/drm/amd/include/atombios.h
index afef574c3b88b..7fe1d0d66701c 100644
--- a/drivers/gpu/drm/amd/include/atombios.h
+++ b/drivers/gpu/drm/amd/include/atombios.h
@@ -6138,7 +6138,7 @@ ucLVDSOffToOnDelay_in4Ms:         LVDS power down sequence time in unit of 4ms.
 
 ucMinAllowedBL_Level:             Lowest LCD backlight PWM level. This is customer platform specific parameters. By default it is 0.
 
-ulNbpStateMemclkFreq[4]:          system memory clock frequencey in unit of 10Khz in different NB pstate.
+ulNbpStateMemclkFreq[4]:          system memory clock frequency in unit of 10Khz in different NB pstate.
 
 **********************************************************************************************************************/
 
@@ -6346,7 +6346,7 @@ ucMinAllowedBL_Level:             Lowest LCD backlight PWM level. This is custom
 
 ulLCDBitDepthControlVal:          GPU display control encoder bit dither control setting, used to program register mmFMT_BIT_DEPTH_CONTROL
 
-ulNbpStateMemclkFreq[4]:          system memory clock frequencey in unit of 10Khz in different NB P-State(P0, P1, P2 & P3).
+ulNbpStateMemclkFreq[4]:          system memory clock frequency in unit of 10Khz in different NB P-State(P0, P1, P2 & P3).
 ulNbpStateNClkFreq[4]:            NB P-State NClk frequency in different NB P-State
 usNBPStateVoltage[4]:             NB P-State (P0/P1 & P2/P3) voltage; NBP3 refers to lowes voltage
 usBootUpNBVoltage:                NB P-State voltage during boot up before driver loaded
diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 11ae5b8444c32..7b50c2b7af74f 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -743,7 +743,7 @@ int dsi_calc_clk_rate_v2(struct msm_dsi_host *msm_host, bool is_dual_dsi)
 	 * esc clock is byte clock followed by a 4 bit divider,
 	 * we need to find an escape clock frequency within the
 	 * mipi DSI spec range within the maximum divider limit
-	 * We iterate here between an escape clock frequencey
+	 * We iterate here between an escape clock frequency
 	 * between 20 Mhz to 5 Mhz and pick up the first one
 	 * that can be supported by our divider
 	 */
diff --git a/drivers/gpu/drm/radeon/atombios.h b/drivers/gpu/drm/radeon/atombios.h
index 4d0f6de32957f..b9d7d54e537cf 100644
--- a/drivers/gpu/drm/radeon/atombios.h
+++ b/drivers/gpu/drm/radeon/atombios.h
@@ -5206,7 +5206,7 @@ ucLVDSOffToOnDelay_in4Ms:         LVDS power down sequence time in unit of 4ms.
 
 ucMinAllowedBL_Level:             Lowest LCD backlight PWM level. This is customer platform specific parameters. By default it is 0. 
 
-ulNbpStateMemclkFreq[4]:          system memory clock frequencey in unit of 10Khz in different NB pstate. 
+ulNbpStateMemclkFreq[4]:          system memory clock frequency in unit of 10Khz in different NB pstate. 
 
 **********************************************************************************************************************/
 
@@ -5413,7 +5413,7 @@ ucMinAllowedBL_Level:             Lowest LCD backlight PWM level. This is custom
 
 ulLCDBitDepthControlVal:          GPU display control encoder bit dither control setting, used to program register mmFMT_BIT_DEPTH_CONTROL
 
-ulNbpStateMemclkFreq[4]:          system memory clock frequencey in unit of 10Khz in different NB P-State(P0, P1, P2 & P3).
+ulNbpStateMemclkFreq[4]:          system memory clock frequency in unit of 10Khz in different NB P-State(P0, P1, P2 & P3).
 ulNbpStateNClkFreq[4]:            NB P-State NClk frequency in different NB P-State
 usNBPStateVoltage[4]:             NB P-State (P0/P1 & P2/P3) voltage; NBP3 refers to lowes voltage
 usBootUpNBVoltage:                NB P-State voltage during boot up before driver loaded 
-- 
2.26.2

