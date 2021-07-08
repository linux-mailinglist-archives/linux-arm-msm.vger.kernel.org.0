Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3693E3BF5D9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jul 2021 08:56:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230428AbhGHG7D (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Jul 2021 02:59:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229735AbhGHG7C (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Jul 2021 02:59:02 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 193EFC061574
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jul 2021 23:56:21 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id a127so4595377pfa.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jul 2021 23:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/BAyx8HGJRdLOBdbNiU99QlY+5w2alIzKC7hMMjJk8E=;
        b=NHKTbL1+5esONkdEeIVUEHanUegxhWFq3mH2qGjsXdj1X4CnZ25OcIeCnh1Cz26/fD
         kX0pEMz5+wuULkM4jGkngh+2zCZzZ//MWkaMBjnnQj1BxLgsg02dZLG+cN7b2Z+y8sow
         h7S6o4wsaeft1bc7Ih5xOyZb+/4dtQEJdUkPQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/BAyx8HGJRdLOBdbNiU99QlY+5w2alIzKC7hMMjJk8E=;
        b=eAJqh9LnXB1IYz/yLZUIp8zTx55HwiRPyuk9rsFPwhEktlgyOu5lZ7qn5ikfQw9kh6
         7gwkcZrBpgcM5Lyds0fgujwZ6XJncJa8ASsnY6WpTARxowQ/zb0EN6EA5+P1nuUV8fZD
         PFOp6lwQ53UuWPANGkqaOsLeKQFu/6gtkTiukI8Jlt2CpvO8uY4A7w+SrxeG2rKnGapE
         dSh73PFZJFcGBd5uG6Ksspeh8eFidT9gKfe92F6Ld9+7+ZJITNARjlsgtt0hwBqBpgPh
         PsUUqKPsddkFXd6N3JuHSBz/qc5TOXQhgFObsVS1boyObJ5VJIn8rOVmSzrw3ID8zxRA
         P6rA==
X-Gm-Message-State: AOAM533eQkAXWjz/iuovehNAXxA5u0NDSPK5kXLahJJ2BLCDnmko8IHh
        F+x2Z+VY71ELbjOEjQSlhSSfqZGbCvawJA==
X-Google-Smtp-Source: ABdhPJxigodUsLw90BixpU3dO51TKFxRvaaErkAE8oVzv77ily6wyBUHpPvwY3JTNwAh2mxe/+P+EQ==
X-Received: by 2002:a63:e043:: with SMTP id n3mr6974211pgj.106.1625727380608;
        Wed, 07 Jul 2021 23:56:20 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:82ce:1825:c0a5:9605])
        by smtp.gmail.com with ESMTPSA id a23sm1120910pfa.16.2021.07.07.23.56.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jul 2021 23:56:20 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Rob Clark <robdclark@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH] drm/msm/dpu: Add newlines to printks
Date:   Wed,  7 Jul 2021 23:56:19 -0700
Message-Id: <20210708065619.999199-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.32.0.93.g670b81a890-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add some missing newlines to the various DRM printks in this file.
Noticed while looking at logs. While we're here unbreak quoted
strings so grepping them is easier.

Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 1c04b7cce43e..0e9d3fa1544b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -274,20 +274,20 @@ int dpu_encoder_helper_wait_for_irq(struct dpu_encoder_phys *phys_enc,
 
 	/* return EWOULDBLOCK since we know the wait isn't necessary */
 	if (phys_enc->enable_state == DPU_ENC_DISABLED) {
-		DRM_ERROR("encoder is disabled id=%u, intr=%d, irq=%d",
+		DRM_ERROR("encoder is disabled id=%u, intr=%d, irq=%d\n",
 			  DRMID(phys_enc->parent), intr_idx,
 			  irq->irq_idx);
 		return -EWOULDBLOCK;
 	}
 
 	if (irq->irq_idx < 0) {
-		DRM_DEBUG_KMS("skip irq wait id=%u, intr=%d, irq=%s",
+		DRM_DEBUG_KMS("skip irq wait id=%u, intr=%d, irq=%s\n",
 			      DRMID(phys_enc->parent), intr_idx,
 			      irq->name);
 		return 0;
 	}
 
-	DRM_DEBUG_KMS("id=%u, intr=%d, irq=%d, pp=%d, pending_cnt=%d",
+	DRM_DEBUG_KMS("id=%u, intr=%d, irq=%d, pp=%d, pending_cnt=%d\n",
 		      DRMID(phys_enc->parent), intr_idx,
 		      irq->irq_idx, phys_enc->hw_pp->idx - PINGPONG_0,
 		      atomic_read(wait_info->atomic_cnt));
@@ -303,8 +303,7 @@ int dpu_encoder_helper_wait_for_irq(struct dpu_encoder_phys *phys_enc,
 		if (irq_status) {
 			unsigned long flags;
 
-			DRM_DEBUG_KMS("irq not triggered id=%u, intr=%d, "
-				      "irq=%d, pp=%d, atomic_cnt=%d",
+			DRM_DEBUG_KMS("irq not triggered id=%u, intr=%d, irq=%d, pp=%d, atomic_cnt=%d\n",
 				      DRMID(phys_enc->parent), intr_idx,
 				      irq->irq_idx,
 				      phys_enc->hw_pp->idx - PINGPONG_0,
@@ -315,8 +314,7 @@ int dpu_encoder_helper_wait_for_irq(struct dpu_encoder_phys *phys_enc,
 			ret = 0;
 		} else {
 			ret = -ETIMEDOUT;
-			DRM_DEBUG_KMS("irq timeout id=%u, intr=%d, "
-				      "irq=%d, pp=%d, atomic_cnt=%d",
+			DRM_DEBUG_KMS("irq timeout id=%u, intr=%d, irq=%d, pp=%d, atomic_cnt=%d\n",
 				      DRMID(phys_enc->parent), intr_idx,
 				      irq->irq_idx,
 				      phys_enc->hw_pp->idx - PINGPONG_0,

base-commit: e9f1cbc0c4114880090c7a578117d3b9cf184ad4
-- 
https://chromeos.dev

