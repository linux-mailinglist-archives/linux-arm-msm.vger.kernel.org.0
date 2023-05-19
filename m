Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C98FA708DCD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 May 2023 04:30:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229655AbjESCaT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 May 2023 22:30:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229676AbjESCaS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 May 2023 22:30:18 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E21EEE5C
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 May 2023 19:30:16 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2ac831bb762so30065621fa.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 May 2023 19:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684463415; x=1687055415;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DTMoBnu8c03FjNPj9qU+/R0vXknB9qzxYO9GXWdKjog=;
        b=JeSP/gFlVkSYoNqo7EjpTFhfBTSCo4IUuoal5O+mGF90sXIpVGdJMSfV5focJo8qTl
         jwv0o/PBqjDv+SAL44gPeIvNN4EixZw19I7SjDj2WuA4EGxHrl+Co3RF8WDspH3r0O2q
         wZkLjbYcwqR/03k1fLHQVZjjI507zkt35qr4sJ67slvlpAxcimDqL7UWcCvKJHHj7+TG
         vFCJ/6XrZ/CGtFUiYTA9OjgyroKqwoZ5qCJF0/wVP+nS4MV70CzQ6cY2+WCd0w3CiTzD
         oxFa9Ulqbr1N0dxHYkZCXDeK2W/bmCRvQyuHqXHIk2/3ViUBZlzo53T5IVXcs6akd+/d
         QkcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684463415; x=1687055415;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DTMoBnu8c03FjNPj9qU+/R0vXknB9qzxYO9GXWdKjog=;
        b=HMRzgpFEuFz5mbClWJaucP6ZsmtPp77/x4zQW95ZRx/JI0wiNUO0yRoFh7cJdbtGZ3
         g8F7crsInp8SSENUTp9uUvhLe6wHKg5XSuhRFl6ZZieZ6HR/YtbDRbuWFbexq1P8XdiN
         waPHpsmpbRnpX4r5gowbn17JlHzxT8f386ugLL5NoHCF2PUb91kapidyR7NJeqgtmB98
         S1mLI7WRV27E4iY/F4LzqVHbUp3QgXIgzND6+3PhJsh0i1QTNCEAmwG9B1m7/y5Tss17
         fzhud2s6Gpg2y+p5Xo+Q+UWTzm2BIiao9+5LsIgxisTIAKNQV3orqOl3Lf+bidpUyfPT
         XOJQ==
X-Gm-Message-State: AC+VfDyfzTc6NjW/Zz164lkwjZ/2CQZ/82GF6sO441jTslmujEnTL5xE
        trW58KzRNkaXvBOQ4aseZVxeMQ==
X-Google-Smtp-Source: ACHHUZ6Kot9UNOvZVgzIbG+e7WN/U79ck+dSDUf6n/v2yItL6wE/tXaHJcxo//4EjNDKMI7NrXqFgw==
X-Received: by 2002:a2e:740b:0:b0:2ac:80f6:544a with SMTP id p11-20020a2e740b000000b002ac80f6544amr126469ljc.24.1684463415271;
        Thu, 18 May 2023 19:30:15 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id t16-20020a2e9d10000000b002aa3ad9014asm573709lji.54.2023.05.18.19.30.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 May 2023 19:30:14 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 2/2] drm/msm/dpu: drop dpu_encoder_phys_ops::atomic_check()
Date:   Fri, 19 May 2023 05:30:11 +0300
Message-Id: <20230519023011.3837868-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230519023011.3837868-1-dmitry.baryshkov@linaro.org>
References: <20230519023011.3837868-1-dmitry.baryshkov@linaro.org>
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

Writeback was the last user of dpu_encoder_phys_ops's atomic_check()
callback. As the code was moved to the dpu_writeback.c, the callback
becomes unused. Drop it now.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      | 15 ---------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |  4 ----
 2 files changed, 19 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 509b4fc7dbc5..77f476c17829 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -605,7 +605,6 @@ static int dpu_encoder_virt_atomic_check(
 	struct drm_display_mode *adj_mode;
 	struct msm_display_topology topology;
 	struct dpu_global_state *global_state;
-	int i = 0;
 	int ret = 0;
 
 	if (!drm_enc || !crtc_state || !conn_state) {
@@ -626,20 +625,6 @@ static int dpu_encoder_virt_atomic_check(
 
 	trace_dpu_enc_atomic_check(DRMID(drm_enc));
 
-	/* perform atomic check on the first physical encoder (master) */
-	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
-		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
-
-		if (phys->ops.atomic_check)
-			ret = phys->ops.atomic_check(phys, crtc_state,
-					conn_state);
-		if (ret) {
-			DPU_ERROR_ENC(dpu_enc,
-					"mode unsupported, phys idx %d\n", i);
-			return ret;
-		}
-	}
-
 	topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode, crtc_state);
 
 	/*
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
index 67c4b4e0975d..1fcb502f368b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
@@ -70,7 +70,6 @@ struct dpu_encoder_phys;
  *				on split_role and current mode (CMD/VID).
  * @enable:			DRM Call. Enable a DRM mode.
  * @disable:			DRM Call. Disable mode.
- * @atomic_check:		DRM Call. Atomic check new DRM state.
  * @destroy:			DRM Call. Destroy and release resources.
  * @control_vblank_irq		Register/Deregister for VBLANK IRQ
  * @wait_for_commit_done:	Wait for hardware to have flushed the
@@ -97,9 +96,6 @@ struct dpu_encoder_phys_ops {
 	bool (*is_master)(struct dpu_encoder_phys *encoder);
 	void (*enable)(struct dpu_encoder_phys *encoder);
 	void (*disable)(struct dpu_encoder_phys *encoder);
-	int (*atomic_check)(struct dpu_encoder_phys *encoder,
-			    struct drm_crtc_state *crtc_state,
-			    struct drm_connector_state *conn_state);
 	void (*destroy)(struct dpu_encoder_phys *encoder);
 	int (*control_vblank_irq)(struct dpu_encoder_phys *enc, bool enable);
 	int (*wait_for_commit_done)(struct dpu_encoder_phys *phys_enc);
-- 
2.39.2

