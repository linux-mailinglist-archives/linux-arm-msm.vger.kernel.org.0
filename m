Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4921F315BB5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Feb 2021 01:57:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234727AbhBJAzU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Feb 2021 19:55:20 -0500
Received: from so15.mailgun.net ([198.61.254.15]:13254 "EHLO so15.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233659AbhBJAxN (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Feb 2021 19:53:13 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1612918361; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=G0bvWlEKDqiOlYHdB6eeD3MkQ8Vhf15qZJwu8KOQLB8=; b=nO2KKd8ETwNVYBX/R6JJjy7fhcmae1h04jpWcOfbzJiX/hMo3L+dgTuw36ERjMhiWInp75Tv
 2pks/w68+7uT3RTKpOtq68IKrDFWLTYxJJ2UGfsQP4IfTcI2E8WgOhpKe8GH3O9O5PQpCGiM
 SCf0Uf/LXhQMKIuMExlpkcxOCi8=
X-Mailgun-Sending-Ip: 198.61.254.15
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 60232e3e81f6c45dce29393b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 10 Feb 2021 00:52:14
 GMT
Sender: jcrouse=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id AB883C43469; Wed, 10 Feb 2021 00:52:13 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from jordan-laptop.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6B253C43461;
        Wed, 10 Feb 2021 00:52:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6B253C43461
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jcrouse@codeaurora.org
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     Akhil P Oommen <akhilpo@codeaurora.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>, Eric Anholt <eric@anholt.net>,
        Jonathan Marek <jonathan@marek.ca>,
        Rob Clark <robdclark@gmail.com>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Sean Paul <sean@poorly.run>,
        Sharat Masetty <smasetty@codeaurora.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/msm: a6xx: Make sure the SQE microcode is safe
Date:   Tue,  9 Feb 2021 17:52:05 -0700
Message-Id: <20210210005205.783377-1-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Most a6xx targets have security issues that were fixed with new versions
of the microcode(s). Make sure that we are booting with a safe version of
the microcode for the target and print a message and error if not.

v2: Add more informative error messages and fix typos

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
---

 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 77 ++++++++++++++++++++++-----
 1 file changed, 64 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index ba8e9d3cf0fe..064b7face504 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -522,28 +522,73 @@ static int a6xx_cp_init(struct msm_gpu *gpu)
 	return a6xx_idle(gpu, ring) ? 0 : -EINVAL;
 }
 
-static void a6xx_ucode_check_version(struct a6xx_gpu *a6xx_gpu,
+/*
+ * Check that the microcode version is new enough to include several key
+ * security fixes. Return true if the ucode is safe.
+ */
+static bool a6xx_ucode_check_version(struct a6xx_gpu *a6xx_gpu,
 		struct drm_gem_object *obj)
 {
+	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
+	struct msm_gpu *gpu = &adreno_gpu->base;
 	u32 *buf = msm_gem_get_vaddr(obj);
+	bool ret = false;
 
 	if (IS_ERR(buf))
-		return;
+		return false;
 
 	/*
-	 * If the lowest nibble is 0xa that is an indication that this microcode
-	 * has been patched. The actual version is in dword [3] but we only care
-	 * about the patchlevel which is the lowest nibble of dword [3]
-	 *
-	 * Otherwise check that the firmware is greater than or equal to 1.90
-	 * which was the first version that had this fix built in
+	 * Targets up to a640 (a618, a630 and a640) need to check for a
+	 * microcode version that is patched to support the whereami opcode or
+	 * one that is new enough to include it by default.
 	 */
-	if (((buf[0] & 0xf) == 0xa) && (buf[2] & 0xf) >= 1)
-		a6xx_gpu->has_whereami = true;
-	else if ((buf[0] & 0xfff) > 0x190)
-		a6xx_gpu->has_whereami = true;
+	if (adreno_is_a618(adreno_gpu) || adreno_is_a630(adreno_gpu) ||
+		adreno_is_a640(adreno_gpu)) {
+		/*
+		 * If the lowest nibble is 0xa that is an indication that this
+		 * microcode has been patched. The actual version is in dword
+		 * [3] but we only care about the patchlevel which is the lowest
+		 * nibble of dword [3]
+		 *
+		 * Otherwise check that the firmware is greater than or equal
+		 * to 1.90 which was the first version that had this fix built
+		 * in
+		 */
+		if ((((buf[0] & 0xf) == 0xa) && (buf[2] & 0xf) >= 1) ||
+			(buf[0] & 0xfff) >= 0x190) {
+			a6xx_gpu->has_whereami = true;
+			ret = true;
+			goto out;
+		}
 
+		DRM_DEV_ERROR(&gpu->pdev->dev,
+			"a630 SQE ucode is too old. Have version %x need at least %x\n",
+			buf[0] & 0xfff, 0x190);
+	}  else {
+		/*
+		 * a650 tier targets don't need whereami but still need to be
+		 * equal to or newer than 1.95 for other security fixes
+		 */
+		if (adreno_is_a650(adreno_gpu)) {
+			if ((buf[0] & 0xfff) >= 0x195) {
+				ret = true;
+				goto out;
+			}
+
+			DRM_DEV_ERROR(&gpu->pdev->dev,
+				"a650 SQE ucode is too old. Have version %x need at least %x\n",
+				buf[0] & 0xfff, 0x195);
+		}
+
+		/*
+		 * When a660 is added those targets should return true here
+		 * since those have all the critical security fixes built in
+		 * from the start
+		 */
+	}
+out:
 	msm_gem_put_vaddr(obj);
+	return ret;
 }
 
 static int a6xx_ucode_init(struct msm_gpu *gpu)
@@ -566,7 +611,13 @@ static int a6xx_ucode_init(struct msm_gpu *gpu)
 		}
 
 		msm_gem_object_set_name(a6xx_gpu->sqe_bo, "sqefw");
-		a6xx_ucode_check_version(a6xx_gpu, a6xx_gpu->sqe_bo);
+		if (!a6xx_ucode_check_version(a6xx_gpu, a6xx_gpu->sqe_bo)) {
+			msm_gem_unpin_iova(a6xx_gpu->sqe_bo, gpu->aspace);
+			drm_gem_object_put(a6xx_gpu->sqe_bo);
+
+			a6xx_gpu->sqe_bo = NULL;
+			return -EPERM;
+		}
 	}
 
 	gpu_write64(gpu, REG_A6XX_CP_SQE_INSTR_BASE_LO,
-- 
2.25.1

