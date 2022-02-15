Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E4CB94B6E84
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Feb 2022 15:16:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238489AbiBOOQ7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Feb 2022 09:16:59 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:35110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230002AbiBOOQ6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Feb 2022 09:16:58 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEFAB24BF0
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Feb 2022 06:16:47 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id m14so15897767lfu.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Feb 2022 06:16:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hYRG8XeM7V1EDX7uymsrwJU1RATDlAUQXVMD/dRoT3A=;
        b=bXL4YAbSWX9gQVtW2ksFkHQI0+/CYTR2mgdEqd2taCeCFMG6zyWotY96YaUJaHUFSN
         Q6VW1v98o3pf25SBSEnE7vyIbuzrNBB15a34deX2Xdu2ivzVN9Xv0vb/Q/YuOxsZPjqu
         KTGetEh5XBY3FFdOXRVYaE13H6cFmXHZYUD6rsmTIqNXjttWu5f4xg4T1o+q8wMRK67f
         YGQGAtyYHZvUOIDJyKIVW3LFZdoYW1zNxZ+mUwzOWZ4xy8dOgLjCZ6pZaUNDzX/3hvY+
         iHLfF7siobPaPWzKmQ26ENZN41J/CWew1SkXnnWupiNPTJrphSxZT/soOkbZcytVcyur
         tGyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hYRG8XeM7V1EDX7uymsrwJU1RATDlAUQXVMD/dRoT3A=;
        b=kq91WxsBuI/h2uiqgEFn593+KuAnqLBSGnqRPkW2yNigabTpcdNpsfkbkSzDlo5MsE
         EKUZwXA8Waq/H93Ax0VsMle+VU5tAlCggU7QWubi7U7OzJtHp+R9ZDfbIFfR1pBbAuQd
         +XRpzWfqfYfwtUJB6jNY4tb7AR6lk0oUy4fF8Q6zTbutGa+LfFO0gMHYZAoFNzTaCgLi
         wFNXd2ngtJaQV9pc0aAacOzzi0fqE/o2yEy7t7o0RSHk+81tfUKFJscf0eI7rRNz93z2
         G+Aj8pj4ZgpvDfPwXko8AghX4jLzlYb0hUazrfG5u83kpOypOFlWupAW7I4Cf9H4XI1S
         fcqg==
X-Gm-Message-State: AOAM533TxFxFuGKAGbdBTbtkYRuJmw/sNdngSTvL/Mtgbr2kRhT58VGv
        6aDkjvewgJXrs2dXZ5oOqh8HVw==
X-Google-Smtp-Source: ABdhPJwwu3zVcf9Mnn3XL+hLajNMlRfV9Y6lOcliwAQFdg23/Dphv2oJGJr/JrOPKXTaT8TuePWy/g==
X-Received: by 2002:a05:6512:4012:: with SMTP id br18mr3072889lfb.533.1644934606241;
        Tue, 15 Feb 2022 06:16:46 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id m16sm1018044ljb.131.2022.02.15.06.16.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Feb 2022 06:16:45 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v2 2/8] drm/msm: move struct msm_display_info to dpu driver
Date:   Tue, 15 Feb 2022 17:16:37 +0300
Message-Id: <20220215141643.3444941-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220215141643.3444941-1-dmitry.baryshkov@linaro.org>
References: <20220215141643.3444941-1-dmitry.baryshkov@linaro.org>
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

The msm_display_info structure is not used by the rest of msm driver, so
move it into the dpu1 (dpu_encoder.h to be precise).

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h | 18 ++++++++++++++++++
 drivers/gpu/drm/msm/msm_drv.h               | 18 ------------------
 2 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
index e241914a9677..ebe3944355bb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
@@ -34,6 +34,24 @@ struct dpu_encoder_hw_resources {
 void dpu_encoder_get_hw_resources(struct drm_encoder *encoder,
 				  struct dpu_encoder_hw_resources *hw_res);
 
+/**
+ * struct msm_display_info - defines display properties
+ * @intf_type:          DRM_MODE_ENCODER_ type
+ * @capabilities:       Bitmask of display flags
+ * @num_of_h_tiles:     Number of horizontal tiles in case of split interface
+ * @h_tile_instance:    Controller instance used per tile. Number of elements is
+ *                      based on num_of_h_tiles
+ * @is_te_using_watchdog_timer:  Boolean to indicate watchdog TE is
+ *				 used instead of panel TE in cmd mode panels
+ */
+struct msm_display_info {
+	int intf_type;
+	uint32_t capabilities;
+	uint32_t num_of_h_tiles;
+	uint32_t h_tile_instance[MAX_H_TILES_PER_DISPLAY];
+	bool is_te_using_watchdog_timer;
+};
+
 /**
  * dpu_encoder_assign_crtc - Link the encoder to the crtc it's assigned to
  * @encoder:	encoder pointer
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 3ab19775a5c3..57b0cd6f917e 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -109,24 +109,6 @@ struct msm_display_topology {
 	u32 num_dspp;
 };
 
-/**
- * struct msm_display_info - defines display properties
- * @intf_type:          DRM_MODE_ENCODER_ type
- * @capabilities:       Bitmask of display flags
- * @num_of_h_tiles:     Number of horizontal tiles in case of split interface
- * @h_tile_instance:    Controller instance used per tile. Number of elements is
- *                      based on num_of_h_tiles
- * @is_te_using_watchdog_timer:  Boolean to indicate watchdog TE is
- *				 used instead of panel TE in cmd mode panels
- */
-struct msm_display_info {
-	int intf_type;
-	uint32_t capabilities;
-	uint32_t num_of_h_tiles;
-	uint32_t h_tile_instance[MAX_H_TILES_PER_DISPLAY];
-	bool is_te_using_watchdog_timer;
-};
-
 /* Commit/Event thread specific structure */
 struct msm_drm_thread {
 	struct drm_device *dev;
-- 
2.34.1

