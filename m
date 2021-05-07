Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EB1C376BB1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 May 2021 23:25:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229812AbhEGV0O (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 May 2021 17:26:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229789AbhEGV0N (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 May 2021 17:26:13 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D98F3C061761
        for <linux-arm-msm@vger.kernel.org>; Fri,  7 May 2021 14:25:09 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id i13so8917469pfu.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 May 2021 14:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=w7qU0L4Ghb4CDxo7QXwP01EaDZwAPCg8iNdM0vaFanE=;
        b=XdgUX9BU0EfF9iq2Mk1qPxb4M/jFLVcOTOOyxD2foBPY44oz9rXJk3Kq3i89V2iGLW
         8XxDpYb/vIFYQbe8Njb7uHTHqUE6JheauBLmHiUbew7fMZS/gEb6x7z3iUt8NhloLm38
         9DLvJNyuY8XNbfbVPV+jjpAP8P8w2RSRkAeNo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=w7qU0L4Ghb4CDxo7QXwP01EaDZwAPCg8iNdM0vaFanE=;
        b=FcJ8b1/D3OS7nf7VGFkbVOvrrcqupJu0IpqeAzRjXiGTbzt4LBWb+umiJVk/VtW+Wv
         2rvcooBldrjw2DLoOPTlV3aA4f2gIqiQzx+ucXFcDnwtcn/mUMjd/FIlVFCJvqSFLXCs
         ogpEeu7qey3wi5vGN6tr9TFnJ78lWxCqFOmHeXQObRSBcbEexca2omN0rzt6Mdy8lrWh
         CeRCin4vxrzLUQTdrbb8TzytznQZOLhWWhbvUjgjYY3JEydJWOesxWApQTgrTWSBBwbR
         N9O67+vFNLhJ0QlMCbNbYxqOmGIHN+/JtcUkabapfBIiJEV8YAfxYQTwnNtdJce//wPW
         yBUg==
X-Gm-Message-State: AOAM532w5uJT6Xy+Aenfn5pmktMMrSCxM19HMNAz6DC+VBOrCKEBGVAN
        oGgyhVzOSD6qj5YhahguN152gw==
X-Google-Smtp-Source: ABdhPJzuXnkaex5EPKxyYb3+tGce0cj1UnpTZAtXkCnSy3u/dQq7nXNraVXLIaMKOLAN0jEAZSUr7w==
X-Received: by 2002:a63:a64:: with SMTP id z36mr12037116pgk.342.1620422709512;
        Fri, 07 May 2021 14:25:09 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:ab8b:4a3d:46ab:361c])
        by smtp.gmail.com with ESMTPSA id t1sm4996298pjo.33.2021.05.07.14.25.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 May 2021 14:25:09 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Rob Clark <robdclark@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Kuogee Hsieh <khsieh@codeaurora.org>, aravindh@codeaurora.org,
        Sean Paul <sean@poorly.run>
Subject: [PATCH 2/3] drm/msm/dp: Shrink locking area of dp_aux_transfer()
Date:   Fri,  7 May 2021 14:25:04 -0700
Message-Id: <20210507212505.1224111-3-swboyd@chromium.org>
X-Mailer: git-send-email 2.31.1.607.g51e8a6a459-goog
In-Reply-To: <20210507212505.1224111-1-swboyd@chromium.org>
References: <20210507212505.1224111-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

We don't need to hold the lock to inspect the message we're going to
transfer, and we don't need to clear the busy flag either. Take the lock
later and bail out earlier if conditions aren't met.

Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Abhinav Kumar <abhinavk@codeaurora.org>
Cc: Kuogee Hsieh <khsieh@codeaurora.org>
Cc: aravindh@codeaurora.org
Cc: Sean Paul <sean@poorly.run>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/msm/dp/dp_aux.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_aux.c
index 91188466cece..b49810396513 100644
--- a/drivers/gpu/drm/msm/dp/dp_aux.c
+++ b/drivers/gpu/drm/msm/dp/dp_aux.c
@@ -329,30 +329,29 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux *dp_aux,
 	ssize_t ret;
 	int const aux_cmd_native_max = 16;
 	int const aux_cmd_i2c_max = 128;
-	struct dp_aux_private *aux = container_of(dp_aux,
-		struct dp_aux_private, dp_aux);
+	struct dp_aux_private *aux;
 
-	mutex_lock(&aux->mutex);
+	aux = container_of(dp_aux, struct dp_aux_private, dp_aux);
 
 	aux->native = msg->request & (DP_AUX_NATIVE_WRITE & DP_AUX_NATIVE_READ);
 
 	/* Ignore address only message */
-	if ((msg->size == 0) || (msg->buffer == NULL)) {
+	if (msg->size == 0 || !msg->buffer) {
 		msg->reply = aux->native ?
 			DP_AUX_NATIVE_REPLY_ACK : DP_AUX_I2C_REPLY_ACK;
-		ret = msg->size;
-		goto unlock_exit;
+		return msg->size;
 	}
 
 	/* msg sanity check */
-	if ((aux->native && (msg->size > aux_cmd_native_max)) ||
-		(msg->size > aux_cmd_i2c_max)) {
+	if ((aux->native && msg->size > aux_cmd_native_max) ||
+	    msg->size > aux_cmd_i2c_max) {
 		DRM_ERROR("%s: invalid msg: size(%zu), request(%x)\n",
 			__func__, msg->size, msg->request);
-		ret = -EINVAL;
-		goto unlock_exit;
+		return -EINVAL;
 	}
 
+	mutex_lock(&aux->mutex);
+
 	dp_aux_update_offset_and_segment(aux, msg);
 	dp_aux_transfer_helper(aux, msg, true);
 
-- 
https://chromeos.dev

