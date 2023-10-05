Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5AE9F7BABD3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Oct 2023 23:10:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231351AbjJEVKB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Oct 2023 17:10:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231779AbjJEVKA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Oct 2023 17:10:00 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3540493
        for <linux-arm-msm@vger.kernel.org>; Thu,  5 Oct 2023 14:09:59 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-5042bfb4fe9so1834717e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Oct 2023 14:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696540197; x=1697144997; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4l+rmSaO9D8iSzAn40goBP/fmnV3QN4/WS3vTxGlc4Q=;
        b=ix+tsZVPDoOq2VeIVVsLNiOycG6dliA2Lfpvp1NcA7sU90HM1YX1xclyzjb88JaFds
         NFcMo7SMrVFL09aOyprKdB39wSN5q/2uDGehuji1S7otE9kSyy1aSa0aIb8hKvFhdPlT
         KsujJkAqyflXy6ajSInes/grPZXdBcvLA5zRtDngymSbhc7rxjsYGLT51AfvCQDvCRcL
         RZhZJmrmOwR2CL30lwFDfNO06nM+TT8KZuCXg1vq88qDEpuUgn1Y8S6YTgtf5sh8yRep
         iJcqiJSzpi2o5JjGmWGpRidLPtVYuDKWxnVb4EG6QpkUHxGdApOVw6ru0MZhBQe5ZSof
         zUpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696540197; x=1697144997;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4l+rmSaO9D8iSzAn40goBP/fmnV3QN4/WS3vTxGlc4Q=;
        b=c7t1EkiJBy2Z+rDhz6YbU3yYaB+voYDv5t0FqC+M/2Pi6VDuvSl4bCXCHWzXwcLsPD
         2eAEVStJSKF3/acTJJtUF25L7M7K9YkMWCzFl9sUBfB+49a7gtzZxQAB7OthF8An2WRI
         nQQFxRcTK9kx5KG6INAtjnxDhTb4df0HbbsaHrgoTXT3KSatPyX2lg4nlLd6CVZlBNWO
         NUi3vwDEdcNiHWv36JWIr1ITELL+hcyEChyrkZhNk7Zv4bxTl0+fzHPxoDLEkOhahlIZ
         EOToIvNOctZru7BPs2lzIzVGrTADkaqZRdnpTJB/Bk7IYMuoX/DsRT0G2TRjRNHvq1On
         diJQ==
X-Gm-Message-State: AOJu0Yyz6srWRzye8UJEamw0L8PymLnPZ0+RSiQu4AOK2FzSe2aPbfdz
        87iE3nTMAIKp78giTmVimLpU5w==
X-Google-Smtp-Source: AGHT+IEYVg+CSuQrNBKI48gPbxx4BwvxFlxcmM6lxBSIw2BuJU+k4acAlh6XKoVSZnul4P6Nst19Dw==
X-Received: by 2002:a19:2d56:0:b0:505:8075:7c17 with SMTP id t22-20020a192d56000000b0050580757c17mr5077413lft.22.1696540197311;
        Thu, 05 Oct 2023 14:09:57 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id l4-20020ac24304000000b0050481c400e9sm3440lfh.287.2023.10.05.14.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 14:09:56 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH] drm/atomic-helper: rename drm_atomic_helper_check_wb_encoder_state
Date:   Fri,  6 Oct 2023 00:09:56 +0300
Message-Id: <20231005210956.2393366-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The drm_atomic_helper_check_wb_encoder_state() function doesn't use
encoder for anything other than getting the drm_device instance. The
function's description talks about checking the writeback connector
state, not the encoder state. Moreover, there is no such thing as an
encoder state, encoders generally do not have a state on their own.

Drop the first argument and rename the function to
drm_atomic_helper_check_wb_connector_state().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---

Abhinav at [1] pointed me to this function as one of the reasons to keep
WB check state in the encoder part of the MSM driver. However after a
second glance, it looks like this function isn't really concerned with
the encoder state and checks the connector state. Let's rename it to
make this more clear.

[1] https://lore.kernel.org/dri-devel/9a2e3ab2-a95f-3dee-b89c-aa69ffd9387e@quicinc.com/

---
 drivers/gpu/drm/drm_atomic_helper.c   | 10 ++++------
 drivers/gpu/drm/vkms/vkms_writeback.c |  2 +-
 include/drm/drm_atomic_helper.h       |  3 +--
 3 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 71d399397107..f32bf0212453 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -786,8 +786,7 @@ drm_atomic_helper_check_modeset(struct drm_device *dev,
 EXPORT_SYMBOL(drm_atomic_helper_check_modeset);
 
 /**
- * drm_atomic_helper_check_wb_encoder_state() - Check writeback encoder state
- * @encoder: encoder state to check
+ * drm_atomic_helper_check_wb_connector_state() - Check writeback connector state
  * @conn_state: connector state to check
  *
  * Checks if the writeback connector state is valid, and returns an error if it
@@ -797,8 +796,7 @@ EXPORT_SYMBOL(drm_atomic_helper_check_modeset);
  * Zero for success or -errno
  */
 int
-drm_atomic_helper_check_wb_encoder_state(struct drm_encoder *encoder,
-					 struct drm_connector_state *conn_state)
+drm_atomic_helper_check_wb_connector_state(struct drm_connector_state *conn_state)
 {
 	struct drm_writeback_job *wb_job = conn_state->writeback_job;
 	struct drm_property_blob *pixel_format_blob;
@@ -818,11 +816,11 @@ drm_atomic_helper_check_wb_encoder_state(struct drm_encoder *encoder,
 		if (fb->format->format == formats[i])
 			return 0;
 
-	drm_dbg_kms(encoder->dev, "Invalid pixel format %p4cc\n", &fb->format->format);
+	drm_dbg_kms(conn_state->connector->dev, "Invalid pixel format %p4cc\n", &fb->format->format);
 
 	return -EINVAL;
 }
-EXPORT_SYMBOL(drm_atomic_helper_check_wb_encoder_state);
+EXPORT_SYMBOL(drm_atomic_helper_check_wb_connector_state);
 
 /**
  * drm_atomic_helper_check_plane_state() - Check plane state for validity
diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
index d7e63aa14663..56edec6f1634 100644
--- a/drivers/gpu/drm/vkms/vkms_writeback.c
+++ b/drivers/gpu/drm/vkms/vkms_writeback.c
@@ -48,7 +48,7 @@ static int vkms_wb_encoder_atomic_check(struct drm_encoder *encoder,
 		return -EINVAL;
 	}
 
-	ret = drm_atomic_helper_check_wb_encoder_state(encoder, conn_state);
+	ret = drm_atomic_helper_check_wb_connector_state(conn_state);
 	if (ret < 0)
 		return ret;
 
diff --git a/include/drm/drm_atomic_helper.h b/include/drm/drm_atomic_helper.h
index 536a0b0091c3..742ccbcd7809 100644
--- a/include/drm/drm_atomic_helper.h
+++ b/include/drm/drm_atomic_helper.h
@@ -50,8 +50,7 @@ struct drm_private_state;
 int drm_atomic_helper_check_modeset(struct drm_device *dev,
 				struct drm_atomic_state *state);
 int
-drm_atomic_helper_check_wb_encoder_state(struct drm_encoder *encoder,
-					 struct drm_connector_state *conn_state);
+drm_atomic_helper_check_wb_connector_state(struct drm_connector_state *conn_state);
 int drm_atomic_helper_check_plane_state(struct drm_plane_state *plane_state,
 					const struct drm_crtc_state *crtc_state,
 					int min_scale,
-- 
2.39.2

