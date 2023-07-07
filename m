Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA89574B9DD
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Jul 2023 01:13:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232088AbjGGXNF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Jul 2023 19:13:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231909AbjGGXNE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Jul 2023 19:13:04 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 037CD2127
        for <linux-arm-msm@vger.kernel.org>; Fri,  7 Jul 2023 16:13:03 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-4f954d7309fso3075339e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Jul 2023 16:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688771581; x=1691363581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dFv3+lcwDk1Uuq+D2295Ys294X/whCt/s/teT4doCsU=;
        b=gMsIIQmw3HT15vvgXXf2yEbURrTsTF5xr/Z7LrCnA0nteYlyAoIh+zGoWYdorLbA74
         yACKFgeBOurrwg+SB1COlF5/IOnSilRSDl8JwDS+BdkSvxZ2HUMkjkMgCyrksFFpols8
         AJ9X/CLsHrufi5FuhyJ5PSlf3+UDWT+Jgn7xjv8DF3J+DUIXrEsbw8wr+cP1ymKMgXFo
         SCMoAjUrtQWq/yOpVPvF1lJ4REDn0toKrNyj6FFAPE6XCed1zdY+TLRXtyE3+kR+R4Nd
         +b3hNvTNF9rOTImeNC0NRNJ5Kx/GmPjtUr7lF7rETbJP9kapk0fAjit5AcGE4yR8dnoL
         BowQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688771581; x=1691363581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dFv3+lcwDk1Uuq+D2295Ys294X/whCt/s/teT4doCsU=;
        b=TjqX2PIsB4c7Smp1Vb3Owo2wfzeiInPKf1LZ0rDV6DPxoTrJ04QvgdnCkGHiw+drae
         6VrWsn8ORpha1jy0wCdQ1ayDAOdnNMIjAadTE/nBMYRxAAcAh6qapvv8UIKeMasQRdfJ
         P3gSuqqlUjYbSHyMgBFW4hTCpii3UPgIYsaT/3BVS2Ps2l6rg2PU4pMU5NDlp0Fe6xaW
         2tndaz9YBs/E9Mq13CjxgKiw7F/BtF8+bs4YPe1QUxfXirYlAwQPMR1A0UUv/8IxZku0
         GIvd1a5qGnS3wdEOdQQa7NzsCtw777mkIqiLHrs90g0BCqhriZ+wo4Yfw2Gfvp3dp+fN
         kSfw==
X-Gm-Message-State: ABy/qLbtjqs6h9AYtIydnhaWXCfrfykacANjBw7+GdI+7scpjSm+KTbP
        hK1ICKB1UfsVB3w0uDQ8Kkd7gg==
X-Google-Smtp-Source: APBJJlENFWwIHBaP96UtrPHupIC8v+VytTGCZZ3ACyuvKgYhj2DmQjIoJofwkYO9jXsr1gHOyZdcoQ==
X-Received: by 2002:a05:6512:3111:b0:4f8:52a8:d123 with SMTP id n17-20020a056512311100b004f852a8d123mr2198733lfb.12.1688771581156;
        Fri, 07 Jul 2023 16:13:01 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id d1-20020ac25441000000b004fb7388360esm841643lfn.188.2023.07.07.16.13.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jul 2023 16:13:00 -0700 (PDT)
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
Subject: [PATCH v2 12/13] drm/msm/dpu: drop dpu_encoder_phys_ops::destroy
Date:   Sat,  8 Jul 2023 02:12:50 +0300
Message-Id: <20230707231251.3849701-13-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230707231251.3849701-1-dmitry.baryshkov@linaro.org>
References: <20230707231251.3849701-1-dmitry.baryshkov@linaro.org>
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

