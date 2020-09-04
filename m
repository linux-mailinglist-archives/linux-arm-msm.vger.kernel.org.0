Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BE7325CF46
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Sep 2020 04:04:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729318AbgIDCEH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Sep 2020 22:04:07 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:28392 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729486AbgIDCEG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Sep 2020 22:04:06 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1599185045; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=LstDX6xiLYnZhD0hGqb5VJ5fAqydLKT4PHp42tcf7eg=; b=bSHSiTdPhOij4SIHPrFVH9gMvnuLUZURp8DOf59dlT2ihBevaAeES7maxDVyoL7AgA7jyd/T
 rzjbScEanxqvgIAcgtJE1lEZJtRgbr8yYJ2pi3Xi5PD8rL0qv1Bctb2db7DOKf/DiBcbcgSQ
 MPsbdv5Ynwz0MolLVU52q65URNA=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 5f51a0789f3347551fcf5974 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 04 Sep 2020 02:03:36
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 8CA3BC4344C; Fri,  4 Sep 2020 02:03:35 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jordan-laptop.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A077EC43387;
        Fri,  4 Sep 2020 02:03:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A077EC43387
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Ben Dooks <ben.dooks@codethink.co.uk>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Brian Masney <masneyb@onstation.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Emil Velikov <emil.velikov@collabora.com>,
        Eric Anholt <eric@anholt.net>,
        Jonathan Marek <jonathan@marek.ca>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Shawn Guo <shawn.guo@linaro.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] drm/msm: Disable the RPTR shadow
Date:   Thu,  3 Sep 2020 20:03:13 -0600
Message-Id: <20200904020313.1810988-5-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200904020313.1810988-1-jcrouse@codeaurora.org>
References: <20200904020313.1810988-1-jcrouse@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Disable the RPTR shadow across all targets. It will be selectively
re-enabled later for targets that need it.

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
---

 drivers/gpu/drm/msm/adreno/a2xx_gpu.c   |  5 +++++
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c   | 10 +++++++++
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c   | 10 +++++++++
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c   | 11 ++++++++--
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   |  7 +++++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 27 ++-----------------------
 6 files changed, 43 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
index 6021f8d9efd1..48fa49f69d6d 100644
--- a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
@@ -164,6 +164,11 @@ static int a2xx_hw_init(struct msm_gpu *gpu)
 	if (ret)
 		return ret;
 
+	gpu_write(gpu, REG_AXXX_CP_RB_CNTL,
+		MSM_GPU_RB_CNTL_DEFAULT | AXXX_CP_RB_CNTL_NO_UPDATE);
+
+	gpu_write(gpu, REG_AXXX_CP_RB_BASE, lower_32_bits(gpu->rb[0]->iova));
+
 	/* NOTE: PM4/micro-engine firmware registers look to be the same
 	 * for a2xx and a3xx.. we could possibly push that part down to
 	 * adreno_gpu base class.  Or push both PM4 and PFP but
diff --git a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
index 0a5ea9f56cb8..f6471145a7a6 100644
--- a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
@@ -211,6 +211,16 @@ static int a3xx_hw_init(struct msm_gpu *gpu)
 	if (ret)
 		return ret;
 
+	/*
+	 * Use the default ringbuffer size and block size but disable the RPTR
+	 * shadow
+	 */
+	gpu_write(gpu, REG_AXXX_CP_RB_CNTL,
+		MSM_GPU_RB_CNTL_DEFAULT | AXXX_CP_RB_CNTL_NO_UPDATE);
+
+	/* Set the ringbuffer address */
+	gpu_write(gpu, REG_AXXX_CP_RB_BASE, lower_32_bits(gpu->rb[0]->iova));
+
 	/* setup access protection: */
 	gpu_write(gpu, REG_A3XX_CP_PROTECT_CTRL, 0x00000007);
 
diff --git a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
index b9b26b2bf9c5..954753600625 100644
--- a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
@@ -267,6 +267,16 @@ static int a4xx_hw_init(struct msm_gpu *gpu)
 	if (ret)
 		return ret;
 
+	/*
+	 * Use the default ringbuffer size and block size but disable the RPTR
+	 * shadow
+	 */
+	gpu_write(gpu, REG_A4XX_CP_RB_CNTL,
+		MSM_GPU_RB_CNTL_DEFAULT | AXXX_CP_RB_CNTL_NO_UPDATE);
+
+	/* Set the ringbuffer address */
+	gpu_write(gpu, REG_A4XX_CP_RB_BASE, lower_32_bits(gpu->rb[0]->iova));
+
 	/* Load PM4: */
 	ptr = (uint32_t *)(adreno_gpu->fw[ADRENO_FW_PM4]->data);
 	len = adreno_gpu->fw[ADRENO_FW_PM4]->size / 4;
diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index e718f964d590..ce3c0b5c167b 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -703,8 +703,6 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
 	if (ret)
 		return ret;
 
-	a5xx_preempt_hw_init(gpu);
-
 	if (!adreno_is_a510(adreno_gpu))
 		a5xx_gpmu_ucode_init(gpu);
 
@@ -712,6 +710,15 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
 	if (ret)
 		return ret;
 
+	/* Set the ringbuffer address */
+	gpu_write64(gpu, REG_A5XX_CP_RB_BASE, REG_A5XX_CP_RB_BASE_HI,
+		gpu->rb[0]->iova);
+
+	gpu_write(gpu, REG_A5XX_CP_RB_CNTL,
+		MSM_GPU_RB_CNTL_DEFAULT | AXXX_CP_RB_CNTL_NO_UPDATE);
+
+	a5xx_preempt_hw_init(gpu);
+
 	/* Disable the interrupts through the initial bringup stage */
 	gpu_write(gpu, REG_A5XX_RBBM_INT_0_MASK, A5XX_INT_MASK);
 
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 406efaac95a7..74bc27eb4203 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -695,6 +695,13 @@ static int a6xx_hw_init(struct msm_gpu *gpu)
 	if (ret)
 		goto out;
 
+	/* Set the ringbuffer address */
+	gpu_write64(gpu, REG_A6XX_CP_RB_BASE, REG_A6XX_CP_RB_BASE_HI,
+		gpu->rb[0]->iova);
+
+	gpu_write(gpu, REG_A6XX_CP_RB_CNTL,
+		MSM_GPU_RB_CNTL_DEFAULT | AXXX_CP_RB_CNTL_NO_UPDATE);
+
 	/* Always come up on rb 0 */
 	a6xx_gpu->cur_ring = gpu->rb[0];
 
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index d2dbb6968cba..459f10a3710b 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -400,26 +400,6 @@ int adreno_hw_init(struct msm_gpu *gpu)
 		ring->memptrs->rptr = 0;
 	}
 
-	/*
-	 * Setup REG_CP_RB_CNTL.  The same value is used across targets (with
-	 * the excpetion of A430 that disables the RPTR shadow) - the cacluation
-	 * for the ringbuffer size and block size is moved to msm_gpu.h for the
-	 * pre-processor to deal with and the A430 variant is ORed in here
-	 */
-	adreno_gpu_write(adreno_gpu, REG_ADRENO_CP_RB_CNTL,
-		MSM_GPU_RB_CNTL_DEFAULT |
-		(adreno_is_a430(adreno_gpu) ? AXXX_CP_RB_CNTL_NO_UPDATE : 0));
-
-	/* Setup ringbuffer address - use ringbuffer[0] for GPU init */
-	adreno_gpu_write64(adreno_gpu, REG_ADRENO_CP_RB_BASE,
-		REG_ADRENO_CP_RB_BASE_HI, gpu->rb[0]->iova);
-
-	if (!adreno_is_a430(adreno_gpu)) {
-		adreno_gpu_write64(adreno_gpu, REG_ADRENO_CP_RB_RPTR_ADDR,
-			REG_ADRENO_CP_RB_RPTR_ADDR_HI,
-			rbmemptr(gpu->rb[0], rptr));
-	}
-
 	return 0;
 }
 
@@ -427,11 +407,8 @@ int adreno_hw_init(struct msm_gpu *gpu)
 static uint32_t get_rptr(struct adreno_gpu *adreno_gpu,
 		struct msm_ringbuffer *ring)
 {
-	if (adreno_is_a430(adreno_gpu))
-		return ring->memptrs->rptr = adreno_gpu_read(
-			adreno_gpu, REG_ADRENO_CP_RB_RPTR);
-	else
-		return ring->memptrs->rptr;
+	return ring->memptrs->rptr = adreno_gpu_read(
+		adreno_gpu, REG_ADRENO_CP_RB_RPTR);
 }
 
 struct msm_ringbuffer *adreno_active_ring(struct msm_gpu *gpu)
-- 
2.25.1

