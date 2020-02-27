Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A8161716B1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2020 13:03:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728928AbgB0MDd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Feb 2020 07:03:33 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:43809 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728882AbgB0MDd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Feb 2020 07:03:33 -0500
Received: by mail-wr1-f67.google.com with SMTP id c13so2969211wrq.10;
        Thu, 27 Feb 2020 04:03:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0cvkhpWMFxiLIeolS0V7/Qo+W3ZK761sN/9Z7LM3iPc=;
        b=Kfug0CJRpde9XowA2nK2NNaW5lx1rUpjSYu8G4JseK84jXXjX6+qOHMxwTsPAlpXXd
         1Z4SYEhLlLyqt+Nn6ZaWsF8Kb+ZX5KnEUIbWJzQF9FAQdruIwhXjli6XAnBUcdvu3hK9
         9EMW5/fZUMYYsUrh8VHokFrfHPL0QDk+t9MNpfp4yBwu2nRwjIT5vdrcXIHhLi898GF3
         u91OBgKR5jGTktue2OzE7RKHow6L0Y4iv6waxFzz1iDCkWLchsuRsVqHzC9hPmg0u3ay
         nHyKdEPcSSCB7CbUgIQHIfQo1SJH5RLwr2SKi7FuTqNwGa5ao7H+MstVcCiJk/GtKmVw
         4Bkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0cvkhpWMFxiLIeolS0V7/Qo+W3ZK761sN/9Z7LM3iPc=;
        b=Fzhf8YwlpEweGjUnPA6NEF13Lz9YPIzoArBFa42uheFXhizxX9TMBxrr4q+5djZwfn
         usIiYn3VIazQqIZZKC/YADrooX+GyrE0mCze+uZ3L2wAiE+xiKwTCE/TCu3z6ykNPNb9
         mQydXa4rbbyFA7c9J11+hJwc54cQwgtjofh93ljGWKuALAH7Up8zAFk8tBOWWgQjVym8
         2zydtTp1alp2DhTcWtnCiGtTVVe5qz16+0776UUf4g8olVZxeYPUZnTTwmMzuGD4UMZV
         f4RLDRm10r+7esrsPNespIH/IIi35PQn9zCBMPWEX/4KWDqIa7biFUA7mTA1uWHWDnHe
         3QGw==
X-Gm-Message-State: APjAAAVsXtn8D/dFG/qpSsVQ1huN+msYtWBJuacBmTra9SDywvLqwtLm
        /f5heYo8qy8cHzT55Q9hD9U=
X-Google-Smtp-Source: APXvYqzcuxChGggWOSGvgfmoFNlVgp9QCuNqVaQ/y8Pchnv7mZ3b6MlfEcjxIgveqSKd5RdWwh0h1Q==
X-Received: by 2002:a05:6000:12d1:: with SMTP id l17mr4335111wrx.327.1582805011298;
        Thu, 27 Feb 2020 04:03:31 -0800 (PST)
Received: from wambui.zuku.co.ke ([197.237.61.225])
        by smtp.googlemail.com with ESMTPSA id t10sm7655017wru.59.2020.02.27.04.03.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2020 04:03:30 -0800 (PST)
From:   Wambui Karuga <wambui.karugax@gmail.com>
To:     daniel@ffwll.ch, airlied@linux.ie, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>
Cc:     linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 12/21] drm/msm: remove checks for return value of drm_debugfs functions.
Date:   Thu, 27 Feb 2020 15:02:23 +0300
Message-Id: <20200227120232.19413-13-wambui.karugax@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200227120232.19413-1-wambui.karugax@gmail.com>
References: <20200227120232.19413-1-wambui.karugax@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Since commit 987d65d01356 (drm: debugfs: make
drm_debugfs_create_files() never fail), drm_debugfs_create_files() does
not fail, and should return void. This change therefore removes the
checks of its return value in drm/msm and subsequent error handling.

These changes also enable the changing of various debugfs_init()
functions to return void.

Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a5xx_debugfs.c | 18 +++++-------------
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c  | 14 +++-----------
 drivers/gpu/drm/msm/msm_debugfs.c         | 21 ++++++---------------
 drivers/gpu/drm/msm/msm_debugfs.h         |  2 +-
 drivers/gpu/drm/msm/msm_gpu.h             |  2 +-
 5 files changed, 16 insertions(+), 41 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_debugfs.c b/drivers/gpu/drm/msm/adreno/a5xx_debugfs.c
index 075ecce4b5e0..8cae2ca4af6b 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_debugfs.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_debugfs.c
@@ -148,27 +148,19 @@ reset_set(void *data, u64 val)
 DEFINE_SIMPLE_ATTRIBUTE(reset_fops, NULL, reset_set, "%llx\n");
 
 
-int a5xx_debugfs_init(struct msm_gpu *gpu, struct drm_minor *minor)
+void a5xx_debugfs_init(struct msm_gpu *gpu, struct drm_minor *minor)
 {
 	struct drm_device *dev;
-	int ret;
 
 	if (!minor)
-		return 0;
+		return;
 
 	dev = minor->dev;
 
-	ret = drm_debugfs_create_files(a5xx_debugfs_list,
-			ARRAY_SIZE(a5xx_debugfs_list),
-			minor->debugfs_root, minor);
-
-	if (ret) {
-		DRM_DEV_ERROR(dev->dev, "could not install a5xx_debugfs_list\n");
-		return ret;
-	}
+	drm_debugfs_create_files(a5xx_debugfs_list,
+				 ARRAY_SIZE(a5xx_debugfs_list),
+				 minor->debugfs_root, minor);
 
 	debugfs_create_file("reset", S_IWUGO, minor->debugfs_root, dev,
 			    &reset_fops);
-
-	return 0;
 }
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 6650f478b226..41b461128bbc 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -259,17 +259,9 @@ static struct drm_info_list mdp5_debugfs_list[] = {
 
 static int mdp5_kms_debugfs_init(struct msm_kms *kms, struct drm_minor *minor)
 {
-	struct drm_device *dev = minor->dev;
-	int ret;
-
-	ret = drm_debugfs_create_files(mdp5_debugfs_list,
-			ARRAY_SIZE(mdp5_debugfs_list),
-			minor->debugfs_root, minor);
-
-	if (ret) {
-		DRM_DEV_ERROR(dev->dev, "could not install mdp5_debugfs_list\n");
-		return ret;
-	}
+	drm_debugfs_create_files(mdp5_debugfs_list,
+				 ARRAY_SIZE(mdp5_debugfs_list),
+				 minor->debugfs_root, minor);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
index 1c74381a4fc9..3c958f311bbc 100644
--- a/drivers/gpu/drm/msm/msm_debugfs.c
+++ b/drivers/gpu/drm/msm/msm_debugfs.c
@@ -214,31 +214,22 @@ int msm_debugfs_late_init(struct drm_device *dev)
 	return ret;
 }
 
-int msm_debugfs_init(struct drm_minor *minor)
+void msm_debugfs_init(struct drm_minor *minor)
 {
 	struct drm_device *dev = minor->dev;
 	struct msm_drm_private *priv = dev->dev_private;
-	int ret;
+	int ret = 0;
 
-	ret = drm_debugfs_create_files(msm_debugfs_list,
-			ARRAY_SIZE(msm_debugfs_list),
-			minor->debugfs_root, minor);
-
-	if (ret) {
-		DRM_DEV_ERROR(dev->dev, "could not install msm_debugfs_list\n");
-		return ret;
-	}
+	drm_debugfs_create_files(msm_debugfs_list,
+				 ARRAY_SIZE(msm_debugfs_list),
+				 minor->debugfs_root, minor);
 
 	debugfs_create_file("gpu", S_IRUSR, minor->debugfs_root,
 		dev, &msm_gpu_fops);
 
 	if (priv->kms && priv->kms->funcs->debugfs_init) {
-		ret = priv->kms->funcs->debugfs_init(priv->kms, minor);
-		if (ret)
-			return ret;
+		priv->kms->funcs->debugfs_init(priv->kms, minor);
 	}
-
-	return ret;
 }
 #endif
 
diff --git a/drivers/gpu/drm/msm/msm_debugfs.h b/drivers/gpu/drm/msm/msm_debugfs.h
index 2b91f8c178ad..ef58f66abbb3 100644
--- a/drivers/gpu/drm/msm/msm_debugfs.h
+++ b/drivers/gpu/drm/msm/msm_debugfs.h
@@ -8,7 +8,7 @@
 #define __MSM_DEBUGFS_H__
 
 #ifdef CONFIG_DEBUG_FS
-int msm_debugfs_init(struct drm_minor *minor);
+void msm_debugfs_init(struct drm_minor *minor);
 #endif
 
 #endif /* __MSM_DEBUGFS_H__ */
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index be5bc2e8425c..6ccae4ba905c 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -57,7 +57,7 @@ struct msm_gpu_funcs {
 	void (*show)(struct msm_gpu *gpu, struct msm_gpu_state *state,
 			struct drm_printer *p);
 	/* for generation specific debugfs: */
-	int (*debugfs_init)(struct msm_gpu *gpu, struct drm_minor *minor);
+	void (*debugfs_init)(struct msm_gpu *gpu, struct drm_minor *minor);
 #endif
 	unsigned long (*gpu_busy)(struct msm_gpu *gpu);
 	struct msm_gpu_state *(*gpu_state_get)(struct msm_gpu *gpu);
-- 
2.25.0

