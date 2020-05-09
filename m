Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB8881CC15C
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 May 2020 14:39:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726782AbgEIMjO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 9 May 2020 08:39:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726017AbgEIMjN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 9 May 2020 08:39:13 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E4D0C061A0C
        for <linux-arm-msm@vger.kernel.org>; Sat,  9 May 2020 05:39:13 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id u22so1895078plq.12
        for <linux-arm-msm@vger.kernel.org>; Sat, 09 May 2020 05:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=UBfVPrIAEP/brziXj/j+5AZneielsV7rQkY6yeq3xcM=;
        b=zjLMX220WnGuheyAsAr6KibTQcOAvAXjG1f0UDfBkZkZn5dioDKlD81SKRfYkH2zx4
         NdnNKdC0rzFLBCpnnB+KLC/DKyORhVE5+Dl4rs9roSKBuo9ZpnmppFPYNlGl403aoRXG
         V5gkDgr6aWOVkA2Im5nwt+8UaCDU6T/iaHcII37R3zJN2wyGLWiQbiVfiV5t2IBcIkUJ
         z9PLy960yrmTSkhOY66jp6wvofov0iyMGttqrTtjqph5iP9/4zxMuU15pj11dE5TqnMC
         1tJTrRXI/hDq0RtiMitPC0DQeooVsBICHZap3SGoguoUsn8iXxW5jWTgnpSdEOtW8Pze
         pQ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=UBfVPrIAEP/brziXj/j+5AZneielsV7rQkY6yeq3xcM=;
        b=NMElCNpAY/THKtqZxjxPzmAvvM7KqT60EUdBg2ymxwOCmxwL4rQdJcesw8J5Yewy+U
         Ye8KewOGVp/z2A5qQMUlgi9+ykOSpV760xp7D9Tc1M0cMg0J64Gf40DHhxd5xcmCf19y
         52BBjP0mHQeTdRx4gqZ9ndIT1yCJIA8C511kyuGcSHIhDoD+euaY6EZruYby40uILB/4
         MASvaBw7a8GTfjA+nmuX6HlDIKvQEMUNjlOG9B8svXtV4afCk/4ShNpOMusXJQZoRN6b
         NN2KpDSCOSmoG6gOrCpuayCYOqHsnV0Vz72kqMAHiaRWbCa9VMWmdEcZ6V5IInvuYf56
         hVUQ==
X-Gm-Message-State: AGi0PuYFBffRjI/EaYNWD3W53GLDZ50mTyIGdVUoOl8UveT4rU/L1xX/
        zJJtZDV22LNK+f8h72zY9z9khg==
X-Google-Smtp-Source: APiQypLceye+Wufp5TMuhvfgKKh6Ztq3ThomILv3leVPMCH9FNbt1JOgwbotVYVzXjYde2A2H2PtJA==
X-Received: by 2002:a17:90a:fa3:: with SMTP id 32mr11550550pjz.224.1589027952992;
        Sat, 09 May 2020 05:39:12 -0700 (PDT)
Received: from localhost.localdomain ([80.251.214.228])
        by smtp.gmail.com with ESMTPSA id o6sm4447828pfp.172.2020.05.09.05.39.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2020 05:39:12 -0700 (PDT)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Cc:     Brian Masney <masneyb@onstation.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Konrad Dybcio <konradybcio@gmail.com>,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH 1/2] drm/msm/a4xx: add adreno a405 support
Date:   Sat,  9 May 2020 20:38:45 +0800
Message-Id: <20200509123846.27932-2-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200509123846.27932-1-shawn.guo@linaro.org>
References: <20200509123846.27932-1-shawn.guo@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

It adds support for adreno a405 found on MSM8939.  The adreno_is_a430()
check in adreno_submit() needs an extension to cover a405.  The
downstream driver suggests it should cover the whole a4xx generation.
That's why it gets changed to adreno_is_a4xx(), while a420 is not
tested though.

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c      | 29 +++++++++++++---------
 drivers/gpu/drm/msm/adreno/adreno_device.c | 11 ++++++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.c    |  2 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  5 ++++
 4 files changed, 34 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
index 253d8d85daad..70de59751188 100644
--- a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
@@ -66,19 +66,22 @@ static void a4xx_enable_hwcg(struct msm_gpu *gpu)
 		}
 	}
 
-	for (i = 0; i < 4; i++) {
-		gpu_write(gpu, REG_A4XX_RBBM_CLOCK_CTL_MARB_CCU(i),
-				0x00000922);
-	}
+	/* No CCU for A405 */
+	if (!adreno_is_a405(adreno_gpu)) {
+		for (i = 0; i < 4; i++) {
+			gpu_write(gpu, REG_A4XX_RBBM_CLOCK_CTL_MARB_CCU(i),
+					0x00000922);
+		}
 
-	for (i = 0; i < 4; i++) {
-		gpu_write(gpu, REG_A4XX_RBBM_CLOCK_HYST_RB_MARB_CCU(i),
-				0x00000000);
-	}
+		for (i = 0; i < 4; i++) {
+			gpu_write(gpu, REG_A4XX_RBBM_CLOCK_HYST_RB_MARB_CCU(i),
+					0x00000000);
+		}
 
-	for (i = 0; i < 4; i++) {
-		gpu_write(gpu, REG_A4XX_RBBM_CLOCK_DELAY_RB_MARB_CCU_L1(i),
-				0x00000001);
+		for (i = 0; i < 4; i++) {
+			gpu_write(gpu, REG_A4XX_RBBM_CLOCK_DELAY_RB_MARB_CCU_L1(i),
+					0x00000001);
+		}
 	}
 
 	gpu_write(gpu, REG_A4XX_RBBM_CLOCK_MODE_GPC, 0x02222222);
@@ -137,7 +140,9 @@ static int a4xx_hw_init(struct msm_gpu *gpu)
 	uint32_t *ptr, len;
 	int i, ret;
 
-	if (adreno_is_a420(adreno_gpu)) {
+	if (adreno_is_a405(adreno_gpu)) {
+		gpu_write(gpu, REG_A4XX_VBIF_ROUND_ROBIN_QOS_ARB, 0x00000003);
+	} else if (adreno_is_a420(adreno_gpu)) {
 		gpu_write(gpu, REG_A4XX_VBIF_ABIT_SORT, 0x0001001F);
 		gpu_write(gpu, REG_A4XX_VBIF_ABIT_SORT_CONF, 0x000000A4);
 		gpu_write(gpu, REG_A4XX_VBIF_GATE_OFF_WRREQ_EN, 0x00000001);
diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index cb3a6e597d76..b69757383965 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -92,6 +92,17 @@ static const struct adreno_info gpulist[] = {
 		.gmem  = SZ_1M,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.init  = a3xx_gpu_init,
+	}, {
+		.rev   = ADRENO_REV(4, 0, 5, ANY_ID),
+		.revn  = 405,
+		.name  = "A405",
+		.fw = {
+			[ADRENO_FW_PM4] = "a420_pm4.fw",
+			[ADRENO_FW_PFP] = "a420_pfp.fw",
+		},
+		.gmem  = SZ_256K,
+		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.init  = a4xx_gpu_init,
 	}, {
 		.rev   = ADRENO_REV(4, 2, 0, ANY_ID),
 		.revn  = 420,
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 1d5c43c22269..3ddbf507941c 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -459,7 +459,7 @@ void adreno_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit,
 				break;
 			/* fall-thru */
 		case MSM_SUBMIT_CMD_BUF:
-			OUT_PKT3(ring, adreno_is_a430(adreno_gpu) ?
+			OUT_PKT3(ring, adreno_is_a4xx(adreno_gpu) ?
 				CP_INDIRECT_BUFFER_PFE : CP_INDIRECT_BUFFER_PFD, 2);
 			OUT_RING(ring, lower_32_bits(submit->cmd[i].iova));
 			OUT_RING(ring, submit->cmd[i].size);
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 9ff4e550e7bd..35f744834ea9 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -202,6 +202,11 @@ static inline bool adreno_is_a4xx(struct adreno_gpu *gpu)
 	return (gpu->revn >= 400) && (gpu->revn < 500);
 }
 
+static inline int adreno_is_a405(struct adreno_gpu *gpu)
+{
+	return gpu->revn == 405;
+}
+
 static inline int adreno_is_a420(struct adreno_gpu *gpu)
 {
 	return gpu->revn == 420;
-- 
2.17.1

