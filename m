Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF5495072E7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Apr 2022 18:21:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354543AbiDSQXT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Apr 2022 12:23:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354558AbiDSQXS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Apr 2022 12:23:18 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA7B52D1FC
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Apr 2022 09:20:34 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id w1so6920798lfa.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Apr 2022 09:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8Y386dymL2VIdENRDMYwnFni9IYIl2XYFT+P/ZpM9Wo=;
        b=RPKT5v3MzS/QFT4rX+d5z6++oE+7O/vF4Xn/lrBTpFAd8DIn/mVCaSR7oXE1YYL3xg
         H0D5In+S26kW9saleEO6/FhY7UB7MG4EgW3mVY9QhPxh8HxI30kPBOedur0NPswKa/oS
         xcGWq9LRLuGPxZ+szn6PUoxpJOb2XC/z6Jq5kmUac62GZ4ROdZxscc2s2vbzPYGqXJDY
         eZAbnvoak0sgiNieSky+cANHIKzFYPhovEBE12QmB0mAJborODkTN1vL5Ebv+jU6ZSrU
         CuXQUsRxnGAjz0O8z+AwzKP4q/kMywiTa7+nOi04BLx3WcitpYo6D5c1WuSHPQ4pCaRL
         S3LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8Y386dymL2VIdENRDMYwnFni9IYIl2XYFT+P/ZpM9Wo=;
        b=vIc4Vxi3uHLKUcj0PdVU2eutN9s9S0gurV6X4QN68pfHl1nJ87AvcoGUrHvoWvqwAf
         alIXvWIaerFAM2u5dgdZctBSs+3T1u9BprJIEZKUxQpL8a6gGmNm83fN/uM8ub71u+c9
         Scvz4zpovlwrurnCUFVBz/IZjNPUTJIHlBRMDlwrLtN9QTSGbOrvc9msOTbay+JiFPsp
         92jRPlV7p9OUZ53naNZrcvBgo2QnZP4QRHf8g1Aqv2zsg9/S4Q7tfHqft3SjxWG50QaC
         xAn76LrrAksGkfJOsFjXzXeORMLbdCqWiQJWg6bOb619AO0DOHI6Z7k7vJw+b4geDjwQ
         yLKQ==
X-Gm-Message-State: AOAM531eauJlJ2ITdaTiJEbGnMPMCQblvCSsNhsMOYbB/LC50ET6K+AZ
        FiY9/M1b31DhT3KYuYQmlvd38A==
X-Google-Smtp-Source: ABdhPJzdDrIUM59TTCAicyjrfvPd/DiMKEY1iS0FzjI22Kxg5QOcJ22OHecE2AkXb5ZYBxkW1rr4Eg==
X-Received: by 2002:ac2:484c:0:b0:46d:28f:cc03 with SMTP id 12-20020ac2484c000000b0046d028fcc03mr11354581lfy.235.1650385232726;
        Tue, 19 Apr 2022 09:20:32 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id k15-20020a2e92cf000000b002493cc687f3sm1495153ljh.45.2022.04.19.09.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Apr 2022 09:20:32 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v2 1/3] drm/msm/dpu: index dpu_kms->hw_vbif using vbif_idx
Date:   Tue, 19 Apr 2022 19:20:28 +0300
Message-Id: <20220419162030.1287562-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220419162030.1287562-1-dmitry.baryshkov@linaro.org>
References: <20220419162030.1287562-1-dmitry.baryshkov@linaro.org>
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
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  | 10 ++++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c | 29 +++++++++++-------------
 2 files changed, 17 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index e29796c4f27b..aadf032a190b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -790,11 +790,9 @@ static void _dpu_kms_hw_destroy(struct dpu_kms *dpu_kms)
 	_dpu_kms_mmu_destroy(dpu_kms);
 
 	if (dpu_kms->catalog) {
-		for (i = 0; i < dpu_kms->catalog->vbif_count; i++) {
-			u32 vbif_idx = dpu_kms->catalog->vbif[i].id;
-
-			if ((vbif_idx < VBIF_MAX) && dpu_kms->hw_vbif[vbif_idx])
-				dpu_hw_vbif_destroy(dpu_kms->hw_vbif[vbif_idx]);
+		for (i = 0; i < ARRAY_SIZE(dpu_kms->hw_vbif); i++) {
+			if (dpu_kms->hw_vbif[i])
+				dpu_hw_vbif_destroy(dpu_kms->hw_vbif[i]);
 		}
 	}
 
@@ -1102,7 +1100,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
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

