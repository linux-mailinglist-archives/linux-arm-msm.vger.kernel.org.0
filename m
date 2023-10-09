Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6BA577BEA14
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Oct 2023 20:50:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378180AbjJISu6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Oct 2023 14:50:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377383AbjJISu6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Oct 2023 14:50:58 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA8D5B4
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Oct 2023 11:50:53 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-503065c4b25so6447869e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Oct 2023 11:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696877452; x=1697482252; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FJl8C6IXpPDsexf1/6XSUISrlVEE9TRaYydcmDxqvy4=;
        b=vH0zo/hebtiv50SG/ztfBA94Wd4vr3TMtA52yr4holcdpdt0GqywvKEdTWfv+H3bev
         ULiM/4wgrtwfo2yWoQJWz93ybldX+8p6+lKA8raPuhkg758ehqoGrtjXZgk1QOGaL2ZG
         wAWgi+rfmLMVEssODC5bzhCnXDffh6vcqGFpOpRE/i6wPZRg1BQgBszcs6hTKwhZHezx
         wb4P4TDiNNvJme/SnElPzWvbtf6h6VtumxcqsWDl/pl8APXDRxBQ+cm64vG1yogXrKVU
         A03Drxy5X1XAmjzIvtI3rb4JUGvZP4dbluY8XngjMf7Nk3ne03kEEsNOKx2+/L0a4e/8
         74Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696877452; x=1697482252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FJl8C6IXpPDsexf1/6XSUISrlVEE9TRaYydcmDxqvy4=;
        b=AWadNlhiGN88VTooSmSrN4yjJwtJW5INX4T3+Y5lv14mA67VbvCG40Hj9XK2EkCBU2
         JQUuartsoui8+aHHBWflvnUnw/79o5O81iOqMuSHKpDzVGz+Er1KMsUJ4BC2+8HSMam4
         Hu+i1VgdfuaLHpwSNR/IJxZQgRHAZjwNs0f0hoK09kJIF3WLTnb2k8y1o6MFPNb3yJlq
         YesUZ3bvIu1PybEh3tvX74OsjlkzeYQPk9IRlzA66yU8HlBMUlY2BnCzuXpcPYFGXGg7
         bNhJfVBCZE2l5CSZuZ4StZWNRU4skAmrXcQEsoEJuosaqLVDqGm0+UI9++2AD7gdqkHS
         MRiA==
X-Gm-Message-State: AOJu0YxnYpdwC1opUOW7OV1CK5NJG6EayW94f3nd++TgloUPNVDZypyU
        vqMJureSpy/0lx7ZRElG4BoFwQ==
X-Google-Smtp-Source: AGHT+IGoylA7fdS9Jxzk9pg6DYBL1YPVHt1uyV4wEaPH95vEW5x7eyzqz91b+mbkdC+++yNVfr8cvw==
X-Received: by 2002:a19:9153:0:b0:503:2089:d3b8 with SMTP id y19-20020a199153000000b005032089d3b8mr12591134lfj.8.1696877452021;
        Mon, 09 Oct 2023 11:50:52 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id u7-20020a056512040700b00501ce0cacb6sm1529262lfk.188.2023.10.09.11.50.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 11:50:51 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 3/3] drm/msm/dpu: move encoder status to standard encoder debugfs dir
Date:   Mon,  9 Oct 2023 21:50:48 +0300
Message-Id: <20231009185048.2758954-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231009185048.2758954-1-dmitry.baryshkov@linaro.org>
References: <20231009185048.2758954-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Now as we have standard per-encoder debugfs directory, move DPU encoder
status file to that directory.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 45 +++------------------
 1 file changed, 6 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 1cf7ff6caff4..498983e62f7e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -184,7 +184,6 @@ struct dpu_encoder_virt {
 	struct drm_crtc *crtc;
 	struct drm_connector *connector;
 
-	struct dentry *debugfs_root;
 	struct mutex enc_lock;
 	DECLARE_BITMAP(frame_busy_mask, MAX_PHYS_ENCODERS_PER_VIRTUAL);
 	void (*crtc_frame_event_cb)(void *, u32 event);
@@ -2108,7 +2107,8 @@ void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
 #ifdef CONFIG_DEBUG_FS
 static int _dpu_encoder_status_show(struct seq_file *s, void *data)
 {
-	struct dpu_encoder_virt *dpu_enc = s->private;
+	struct drm_encoder *drm_enc = s->private;
+	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
 	int i;
 
 	mutex_lock(&dpu_enc->enc_lock);
@@ -2130,48 +2130,16 @@ static int _dpu_encoder_status_show(struct seq_file *s, void *data)
 
 DEFINE_SHOW_ATTRIBUTE(_dpu_encoder_status);
 
-static int _dpu_encoder_init_debugfs(struct drm_encoder *drm_enc)
+static void dpu_encoder_debugfs_init(struct drm_encoder *drm_enc, struct dentry *root)
 {
-	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
-
-	char name[12];
-
-	if (!drm_enc->dev) {
-		DPU_ERROR("invalid encoder or kms\n");
-		return -EINVAL;
-	}
-
-	snprintf(name, sizeof(name), "encoder%u", drm_enc->base.id);
-
-	/* create overall sub-directory for the encoder */
-	dpu_enc->debugfs_root = debugfs_create_dir(name,
-			drm_enc->dev->primary->debugfs_root);
-
 	/* don't error check these */
 	debugfs_create_file("status", 0600,
-		dpu_enc->debugfs_root, dpu_enc, &_dpu_encoder_status_fops);
-
-	return 0;
+			    root, drm_enc, &_dpu_encoder_status_fops);
 }
 #else
-static int _dpu_encoder_init_debugfs(struct drm_encoder *drm_enc)
-{
-	return 0;
-}
+#define dpu_encoder_debugfs_init NULL
 #endif
 
-static int dpu_encoder_late_register(struct drm_encoder *encoder)
-{
-	return _dpu_encoder_init_debugfs(encoder);
-}
-
-static void dpu_encoder_early_unregister(struct drm_encoder *encoder)
-{
-	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(encoder);
-
-	debugfs_remove_recursive(dpu_enc->debugfs_root);
-}
-
 static int dpu_encoder_virt_add_phys_encs(
 		struct msm_display_info *disp_info,
 		struct dpu_encoder_virt *dpu_enc,
@@ -2355,8 +2323,7 @@ static const struct drm_encoder_helper_funcs dpu_encoder_helper_funcs = {
 
 static const struct drm_encoder_funcs dpu_encoder_funcs = {
 		.destroy = dpu_encoder_destroy,
-		.late_register = dpu_encoder_late_register,
-		.early_unregister = dpu_encoder_early_unregister,
+		.debugfs_init = dpu_encoder_debugfs_init,
 };
 
 struct drm_encoder *dpu_encoder_init(struct drm_device *dev,
-- 
2.39.2

