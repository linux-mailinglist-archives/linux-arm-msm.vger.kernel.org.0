Return-Path: <linux-arm-msm+bounces-3058-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B2DDF801F44
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Dec 2023 23:56:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 10E57B20AAB
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Dec 2023 22:56:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29C2019448;
	Sat,  2 Dec 2023 22:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GIJuWrUL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06C3EE5
	for <linux-arm-msm@vger.kernel.org>; Sat,  2 Dec 2023 14:55:56 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-50bc2e7f1e4so4596032e87.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 02 Dec 2023 14:55:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701557754; x=1702162554; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZjGFlHjx1ZkElLYY29NmAfOWv9VBYLIcznU6RxLMTLw=;
        b=GIJuWrULoHw9Z/pJPhtmZ3lvLoGF37hTwJeeJHqC2hZbJKKikNKoUjqlGaVDLf+00H
         Hya12Ic8zBdrKSR18bQXtvUhHbsBMaYo8G/oZa9wiixD04QopahCtdcglz0XKmodtb3F
         01iZgofLaugBnxT+RVKZL420xqKdnCYXOgertOAH1Djdsnaln97BFXk3mZHfw0BWMF2Y
         8cmqOuRauuQOm/sR9+/G8sRMipFCth4Sp0l1De1AfbLkvscHsuoUA71QY8jngN5he2yM
         gZhDrRUibxn5BoDSdHld06GrMun/t2jgJQs6MkU1yr5VWBRZwJJwswjLXkx4OGKKHcte
         xQdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701557754; x=1702162554;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZjGFlHjx1ZkElLYY29NmAfOWv9VBYLIcznU6RxLMTLw=;
        b=YUT6xMN75931lxJewGHAFidrSwlLgSM63fcs8kPpiVokYmz6NL8Eqss22QvCGQlMdx
         9t4ivSt3TTWHNURjpp7vTBTa8slMUu0xCU7jv1IwDR5lU/7GAGLDJwuazecVceWuupPt
         AD3f461vmqGYQVgwDgzxbd/ap8A7v7i00CWCFgXjcvLrc4Ccru/UDyESu/CO1nFYAAnl
         TezD4uKfLKsBTb93HxhV40c88cV9QqbfLjQ/PcdoU/Z5ox35NfZsKvlWyGukqEZJJbRG
         GoSUmvw/Nv/8CfujUlEZairWLhgYTYBDgeb3OBLmWauT25/3jqLRdOp1sZSITLfQQhUT
         OCbQ==
X-Gm-Message-State: AOJu0YyGyXzpgQC4IWtTTRGucuZ2ZzWa1/5NWaASNCBloJ61OeVMqSgs
	w3A7eJFPAOJcwyjt2c5/+NqmJQ==
X-Google-Smtp-Source: AGHT+IGK8BfhMZ07nbApQncwJAPh0Wwi4l8K1+n8mmoCubtUPG7R1hOs5Bo1yS2Gyp9tFAuZFbUUDw==
X-Received: by 2002:a05:6512:1250:b0:50b:c541:bcd7 with SMTP id fb16-20020a056512125000b0050bc541bcd7mr2548153lfb.60.1701557753906;
        Sat, 02 Dec 2023 14:55:53 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id z13-20020a19650d000000b0050bf06c8098sm93515lfb.116.2023.12.02.14.55.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Dec 2023 14:55:53 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>
Cc: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH RESEND] drm/drv: propagate errors from drm_modeset_register_all()
Date: Sun,  3 Dec 2023 01:55:52 +0300
Message-Id: <20231202225552.1283638-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In case the drm_modeset_register_all() function fails, its error code
will be ignored. Instead make the drm_dev_register() bail out in case of
such an error.

Fixes: 79190ea2658a ("drm: Add callbacks for late registering")
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_drv.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 535f16e7882e..3c835c99daad 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -949,8 +949,11 @@ int drm_dev_register(struct drm_device *dev, unsigned long flags)
 			goto err_minors;
 	}
 
-	if (drm_core_check_feature(dev, DRIVER_MODESET))
-		drm_modeset_register_all(dev);
+	if (drm_core_check_feature(dev, DRIVER_MODESET)) {
+		ret = drm_modeset_register_all(dev);
+		if (ret)
+			goto err_unload;
+	}
 
 	DRM_INFO("Initialized %s %d.%d.%d %s for %s on minor %d\n",
 		 driver->name, driver->major, driver->minor,
@@ -960,6 +963,9 @@ int drm_dev_register(struct drm_device *dev, unsigned long flags)
 
 	goto out_unlock;
 
+err_unload:
+	if (dev->driver->unload)
+		dev->driver->unload(dev);
 err_minors:
 	remove_compat_control_link(dev);
 	drm_minor_unregister(dev, DRM_MINOR_ACCEL);
-- 
2.39.2


