Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35968445E4D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Nov 2021 04:05:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232071AbhKEDIE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Nov 2021 23:08:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229782AbhKEDIE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Nov 2021 23:08:04 -0400
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com [IPv6:2607:f8b0:4864:20::734])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3867EC061714
        for <linux-arm-msm@vger.kernel.org>; Thu,  4 Nov 2021 20:05:25 -0700 (PDT)
Received: by mail-qk1-x734.google.com with SMTP id bm28so7655641qkb.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Nov 2021 20:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Xv7HG/Q+S/fL5JaTuonxECkNCYcwf+YUpIYNlE1OLuA=;
        b=G0mnld0dMm0VxznH8Ud5Dg05i6jsVWo3+IaaczBhvKR6gHY7wCpK8tSO7uGIInKHVe
         HOJsIx6IEPcx8Dq2No9Ya3LHXW3FYZ6k68YbPbKdwD/4GR44GQmpiVJR6kU6cgFgnUPe
         E+UKZvmj4QoHwE5VbnPjOTaHqWp8ORsKnjL83f7PSh9S8EROPZuW8UMwXu9Eaqgohd4N
         0TC4rakOzWnT9GhZ3nmkzXJQGZegSjliC0ifXn6Aru6lsUHlfyYHjmi69Ws5zWH8vC3l
         AUCmSDtu6udS13HZ+N/JC4K4jV2kdJmQt0aiq5zdXRMoMiTPDNQd1jb6/BPXnW0JwHmM
         JuUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Xv7HG/Q+S/fL5JaTuonxECkNCYcwf+YUpIYNlE1OLuA=;
        b=LsH98UaBL622GZ2zCqJPDmOO8zCwGVoRuaGw0Ydc/mU5moZUS6Ap+MZ9igA+6VVAR1
         C25xU3VUr1GwZpfC98Bd5dKv0RzsvfLmL8fPPVflkPbRzncS3BuOwZ0Axb+MHlTKmYtt
         FMWAOsd+K599ZaoAjJ0r2yOwOyJftxX9aaCoTypP8Nezj0497hAVbxWAVywZJItHZJjB
         jaslb/0RFN3/2AAL7RCord/1l18fmqbbM4DfPxISZ0B9UDPEHZZ8bBsEopTGw6KTw+cZ
         gtMp/F+VJzluwXLnY+0E9QNFjskJ8SEgA/eEvEYSq4CmTaE0YltKDFQhcHowpt6KZrls
         IX+w==
X-Gm-Message-State: AOAM533ExpYquQbiD0XSPSSDOlAXhIa9eZJh5LX8Bk/v1l7AYgFRuMdA
        K5/dXDQsQDsfaDHTyEh8Pwc/Xg==
X-Google-Smtp-Source: ABdhPJygzG95k4Zn6GZwVmYDW+120k0m+f9VXzNWsZgmBSDaREhsbJgYBcWCqYqOZQVrTTNxxcr6Pw==
X-Received: by 2002:a05:620a:20d9:: with SMTP id f25mr12159152qka.54.1636081524408;
        Thu, 04 Nov 2021 20:05:24 -0700 (PDT)
Received: from localhost ([167.100.64.199])
        by smtp.gmail.com with ESMTPSA id bq30sm5052740qkb.6.2021.11.04.20.05.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Nov 2021 20:05:24 -0700 (PDT)
From:   Sean Paul <sean@poorly.run>
To:     dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Cc:     bjorn.andersson@linaro.org, swboyd@chromium.org,
        jani.nikula@intel.com, abhinavk@codeaurora.org,
        Sean Paul <seanpaul@chromium.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org
Subject: [PATCH v4 09/14] drm/msm/dpu: Remove useless checks in dpu_encoder
Date:   Thu,  4 Nov 2021 23:04:26 -0400
Message-Id: <20211105030434.2828845-10-sean@poorly.run>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211105030434.2828845-1-sean@poorly.run>
References: <20211105030434.2828845-1-sean@poorly.run>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Sean Paul <seanpaul@chromium.org>

A couple more useless checks to remove in dpu_encoder.

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20210913175747.47456-10-sean@poorly.run #v1
Link: https://patchwork.freedesktop.org/patch/msgid/20210915203834.1439-10-sean@poorly.run #v2
Link: https://patchwork.freedesktop.org/patch/msgid/20211001151145.55916-10-sean@poorly.run #v3

Changes in v2:
-None
Changes in v3:
-None
Changes in v4:
-None
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index e7ee4cfb8461..cc57c615be67 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1148,10 +1148,6 @@ static void dpu_encoder_virt_enable(struct drm_encoder *drm_enc)
 	struct msm_drm_private *priv;
 	struct drm_display_mode *cur_mode = NULL;
 
-	if (!drm_enc) {
-		DPU_ERROR("invalid encoder\n");
-		return;
-	}
 	dpu_enc = to_dpu_encoder_virt(drm_enc);
 
 	mutex_lock(&dpu_enc->enc_lock);
@@ -1197,14 +1193,6 @@ static void dpu_encoder_virt_disable(struct drm_encoder *drm_enc)
 	struct msm_drm_private *priv;
 	int i = 0;
 
-	if (!drm_enc) {
-		DPU_ERROR("invalid encoder\n");
-		return;
-	} else if (!drm_enc->dev) {
-		DPU_ERROR("invalid dev\n");
-		return;
-	}
-
 	dpu_enc = to_dpu_encoder_virt(drm_enc);
 	DPU_DEBUG_ENC(dpu_enc, "\n");
 
-- 
Sean Paul, Software Engineer, Google / Chromium OS

