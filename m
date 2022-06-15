Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D3ECD54C942
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jun 2022 14:57:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349376AbiFOM5H (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Jun 2022 08:57:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345613AbiFOM5G (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Jun 2022 08:57:06 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B65BE3F892
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jun 2022 05:57:05 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id r24so974605ljn.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jun 2022 05:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DRnxwAmVFrwYRwDRhIhnKR3tEygFG1xsNvUP8AYSEHM=;
        b=EQPEl9FuLaZGT9FxfR+2AX1NZv4dd5vKmCDoJWBC0MotYbOgPOiULE7Hw9cs8DKtXJ
         PYZeC+uIV+kq3A6BuAZUNqO6UPfIKBUK2WuooepvJ716kbGzbPUBb99E0r9LUf+87sYC
         61nKkeq31S0LeG/ZmMk3fD8SBt9qwnlWtFfCtuOcxQEDklOsCVk+AXcPfYZ28tl0gUZZ
         dGtTGwNVq8yhfjXpHAsfcAZccdux4FosKNzMUH1nNcWJK4nNfRZ6M2vrVmCbESIAyzvn
         XOkEnYUc0EZIoQWGMrNyEyG9BO+TU7qIbZG6R2U4jIClBMkUzfCtFAHzSoO1CzOT9UJv
         eoqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DRnxwAmVFrwYRwDRhIhnKR3tEygFG1xsNvUP8AYSEHM=;
        b=jPFXZKqX6s0RefNtqJv1GYh4t21/1X7q3ow/1SPDXsS6Oxmc3XYkXshZLf9fVys3Xd
         ZtOhV37To3VV+63OAHIy7jKsihwUqbZC29sac/ECGByk0IorjBqps98xqmpByE8TLQaf
         ssndDYjV4VVeZJZ79gmYLbqh8WV7kp7cqw68mV9ADWIgcvX/Ybw42wpyrhgrnWx2fBCk
         8wxHjdE/VKF/gxAVIwvbTHvnBq7yN9YTvuaYeBPBmSN7qC7ZZ3Phg1RPiZ4+uEmocHNV
         5t34QXBAohCvE6yFfjhLbhZuz23rC6/mm8efzMtNC0yEDjjDgP7DlMgHZ7tbMq0kgsPV
         VRRQ==
X-Gm-Message-State: AJIora8rnbxilFl6AVMibJ6VXNj4PvzSMmDY6ocrNaz2AeKz95/0wj1n
        ZNNSExhTNR7J8sSpv/SAlmlAaw==
X-Google-Smtp-Source: AGRyM1sgiwVhO4+byCpZSd7W+z9U5Ik+t3MkkhIdqiQXV6H4hkjeTl1hkIY9v7In9ywQUzRbnNmRaw==
X-Received: by 2002:a05:651c:1793:b0:25a:42f4:2f32 with SMTP id bn19-20020a05651c179300b0025a42f42f32mr1363099ljb.58.1655297824100;
        Wed, 15 Jun 2022 05:57:04 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u13-20020a05651220cd00b0047255d21100sm1798013lfr.47.2022.06.15.05.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jun 2022 05:57:03 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v3 1/3] drm/msm/dpu: index dpu_kms->hw_vbif using vbif_idx
Date:   Wed, 15 Jun 2022 15:57:01 +0300
Message-Id: <20220615125703.24647-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Remove loops over hw_vbif. Instead always VBIF's idx as an index in the
array. This fixes an error in dpu_kms_hw_init(), where we fill
dpu_kms->hw_vbif[i], but check for an error pointer at
dpu_kms->hw_vbif[vbif_idx].

Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  | 12 ++++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c | 29 +++++++++++-------------
 2 files changed, 18 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 2b9d931474e0..1255d00c92cf 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -830,12 +830,10 @@ static void _dpu_kms_hw_destroy(struct dpu_kms *dpu_kms)
 	_dpu_kms_mmu_destroy(dpu_kms);
 
 	if (dpu_kms->catalog) {
-		for (i = 0; i < dpu_kms->catalog->vbif_count; i++) {
-			u32 vbif_idx = dpu_kms->catalog->vbif[i].id;
-
-			if ((vbif_idx < VBIF_MAX) && dpu_kms->hw_vbif[vbif_idx]) {
-				dpu_hw_vbif_destroy(dpu_kms->hw_vbif[vbif_idx]);
-				dpu_kms->hw_vbif[vbif_idx] = NULL;
+		for (i = 0; i < ARRAY_SIZE(dpu_kms->hw_vbif); i++) {
+			if (dpu_kms->hw_vbif[i]) {
+				dpu_hw_vbif_destroy(dpu_kms->hw_vbif[i]);
+				dpu_kms->hw_vbif[i] = NULL;
 			}
 		}
 	}
@@ -1135,7 +1133,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 	for (i = 0; i < dpu_kms->catalog->vbif_count; i++) {
 		u32 vbif_idx = dpu_kms->catalog->vbif[i].id;
 
-		dpu_kms->hw_vbif[i] = dpu_hw_vbif_init(vbif_idx,
+		dpu_kms->hw_vbif[vbif_idx] = dpu_hw_vbif_init(vbif_idx,
 				dpu_kms->vbif[vbif_idx], dpu_kms->catalog);
 		if (IS_ERR_OR_NULL(dpu_kms->hw_vbif[vbif_idx])) {
 			rc = PTR_ERR(dpu_kms->hw_vbif[vbif_idx]);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
index 21d20373eb8b..a18fb649301c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
@@ -11,6 +11,14 @@
 #include "dpu_hw_vbif.h"
 #include "dpu_trace.h"
 
+static struct dpu_hw_vbif *dpu_get_vbif(struct dpu_kms *dpu_kms, enum dpu_vbif vbif_idx)
+{
+	if (vbif_idx < ARRAY_SIZE(dpu_kms->hw_vbif))
+		return dpu_kms->hw_vbif[vbif_idx];
+
+	return NULL;
+}
+
 /**
  * _dpu_vbif_wait_for_xin_halt - wait for the xin to halt
  * @vbif:	Pointer to hardware vbif driver
@@ -148,20 +156,15 @@ static u32 _dpu_vbif_get_ot_limit(struct dpu_hw_vbif *vbif,
 void dpu_vbif_set_ot_limit(struct dpu_kms *dpu_kms,
 		struct dpu_vbif_set_ot_params *params)
 {
-	struct dpu_hw_vbif *vbif = NULL;
+	struct dpu_hw_vbif *vbif;
 	struct dpu_hw_mdp *mdp;
 	bool forced_on = false;
 	u32 ot_lim;
-	int ret, i;
+	int ret;
 
 	mdp = dpu_kms->hw_mdp;
 
-	for (i = 0; i < ARRAY_SIZE(dpu_kms->hw_vbif); i++) {
-		if (dpu_kms->hw_vbif[i] &&
-				dpu_kms->hw_vbif[i]->idx == params->vbif_idx)
-			vbif = dpu_kms->hw_vbif[i];
-	}
-
+	vbif = dpu_get_vbif(dpu_kms, params->vbif_idx);
 	if (!vbif || !mdp) {
 		DRM_DEBUG_ATOMIC("invalid arguments vbif %d mdp %d\n",
 				vbif != NULL, mdp != NULL);
@@ -204,7 +207,7 @@ void dpu_vbif_set_ot_limit(struct dpu_kms *dpu_kms,
 void dpu_vbif_set_qos_remap(struct dpu_kms *dpu_kms,
 		struct dpu_vbif_set_qos_params *params)
 {
-	struct dpu_hw_vbif *vbif = NULL;
+	struct dpu_hw_vbif *vbif;
 	struct dpu_hw_mdp *mdp;
 	bool forced_on = false;
 	const struct dpu_vbif_qos_tbl *qos_tbl;
@@ -216,13 +219,7 @@ void dpu_vbif_set_qos_remap(struct dpu_kms *dpu_kms,
 	}
 	mdp = dpu_kms->hw_mdp;
 
-	for (i = 0; i < ARRAY_SIZE(dpu_kms->hw_vbif); i++) {
-		if (dpu_kms->hw_vbif[i] &&
-				dpu_kms->hw_vbif[i]->idx == params->vbif_idx) {
-			vbif = dpu_kms->hw_vbif[i];
-			break;
-		}
-	}
+	vbif = dpu_get_vbif(dpu_kms, params->vbif_idx);
 
 	if (!vbif || !vbif->cap) {
 		DPU_ERROR("invalid vbif %d\n", params->vbif_idx);
-- 
2.35.1

