Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 428D974B7F9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jul 2023 22:37:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231967AbjGGUhg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Jul 2023 16:37:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231953AbjGGUhf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Jul 2023 16:37:35 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 979A519B2
        for <linux-arm-msm@vger.kernel.org>; Fri,  7 Jul 2023 13:37:34 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-4fbc0314a7bso3768745e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Jul 2023 13:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688762253; x=1691354253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dFv3+lcwDk1Uuq+D2295Ys294X/whCt/s/teT4doCsU=;
        b=kgZFMB+ELN1wei6aE58OzyWyPyql/tNhUvHvhTpJFG7yKwFgE/QMincpXV34qAfQc1
         td2sHNqqBTYOncYcPkkEOyRWcSflAlLXOqhv0xcv1ti9UEZbDqAJOTEinFLLPLh8gMVT
         1u5cfALhIgSFuMgGcZRRdTC2BOnq3pC5d6ibruXuTprJkTzJy3XLDykTNunNzdz0kbTT
         wFy1tJlkND3hn8uRK5wgEGFQ/FEXXLXXYaWwZcscw0xNL+ef8wzv5XM+QIC3R/V9kb21
         5H1gpwMeatZj/pNxXNe2BedIHb2xuTBUKoIaX3oyL2acG+5ooxLNg+CT/9lr0tDHX4Zk
         hujA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688762253; x=1691354253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dFv3+lcwDk1Uuq+D2295Ys294X/whCt/s/teT4doCsU=;
        b=GmW2lGs74M9GFPGN9eOX8xesWAUmfGP3cgPDKBgUkJ8MrGas9Q+9/9SEDUkPkP67As
         Pot2lyYqY8inm6gauHMGZZiqtge9uLbuaa49JFKTTJHsKEWvAHKd0mJpbpVhJHOSDzT3
         NRjFDSMxD4cABr3lf5g3csE7epL6PU0e04Au7z0nEr3ztRG23ujSop9lfjg/C6eHQYBH
         U8eXGuFSBmBfdEE85VI4Bbye6I0T0zMR/j1GbidEYVYY7OSYX/GF1OT1SFw33eO57U3g
         GK3uy4RUABZY5xKY97U6j1MRZ8KVfNdzPTE900jD85k8kMKrhMlnyzvgGDBYS9B1GyJb
         gXKg==
X-Gm-Message-State: ABy/qLZitmoHfqu6/2O5ve4NPPwzNIp9pNcsg8uBd8KvLqWTxY8GYgGG
        I5Njh53WHRjyov6e2q46K11X2A==
X-Google-Smtp-Source: APBJJlGvuWvJ5N3gOBkDNhbyICqTGYuYG4vm3a25hMsZigs4e0WGxsmQblJrpD5FWNBQkxNtnkjPKg==
X-Received: by 2002:a19:7702:0:b0:4fb:8bea:f5f6 with SMTP id s2-20020a197702000000b004fb8beaf5f6mr3957743lfc.34.1688762252908;
        Fri, 07 Jul 2023 13:37:32 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id d4-20020ac244c4000000b004fb738796casm808899lfm.40.2023.07.07.13.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jul 2023 13:37:32 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 12/13] drm/msm/dpu: drop dpu_encoder_phys_ops::destroy
Date:   Fri,  7 Jul 2023 23:37:23 +0300
Message-Id: <20230707203724.3820757-13-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230707203724.3820757-1-dmitry.baryshkov@linaro.org>
References: <20230707203724.3820757-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Drop the dpu_encoder_phys_ops' destroy() callback. No phys backend
implements it anymore, so it is useless.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c    | 18 ------------------
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   |  2 --
 2 files changed, 20 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 7c2cd9ce8acd..b42176ce4a3a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -456,24 +456,6 @@ static void dpu_encoder_destroy(struct drm_encoder *drm_enc)
 	dpu_enc = to_dpu_encoder_virt(drm_enc);
 	DPU_DEBUG_ENC(dpu_enc, "\n");
 
-	mutex_lock(&dpu_enc->enc_lock);
-
-	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
-		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
-
-		if (phys->ops.destroy) {
-			phys->ops.destroy(phys);
-			--dpu_enc->num_phys_encs;
-			dpu_enc->phys_encs[i] = NULL;
-		}
-	}
-
-	if (dpu_enc->num_phys_encs)
-		DPU_ERROR_ENC(dpu_enc, "expected 0 num_phys_encs not %d\n",
-				dpu_enc->num_phys_encs);
-	dpu_enc->num_phys_encs = 0;
-	mutex_unlock(&dpu_enc->enc_lock);
-
 	drm_encoder_cleanup(drm_enc);
 	mutex_destroy(&dpu_enc->enc_lock);
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
index 4fb0d95f3061..757ce58f958b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
@@ -72,7 +72,6 @@ struct dpu_encoder_phys;
  * @enable:			DRM Call. Enable a DRM mode.
  * @disable:			DRM Call. Disable mode.
  * @atomic_check:		DRM Call. Atomic check new DRM state.
- * @destroy:			DRM Call. Destroy and release resources.
  * @control_vblank_irq		Register/Deregister for VBLANK IRQ
  * @wait_for_commit_done:	Wait for hardware to have flushed the
  *				current pending frames to hardware
@@ -102,7 +101,6 @@ struct dpu_encoder_phys_ops {
 	int (*atomic_check)(struct dpu_encoder_phys *encoder,
 			    struct drm_crtc_state *crtc_state,
 			    struct drm_connector_state *conn_state);
-	void (*destroy)(struct dpu_encoder_phys *encoder);
 	int (*control_vblank_irq)(struct dpu_encoder_phys *enc, bool enable);
 	int (*wait_for_commit_done)(struct dpu_encoder_phys *phys_enc);
 	int (*wait_for_tx_complete)(struct dpu_encoder_phys *phys_enc);
-- 
2.39.2

