Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D44C17FDFE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2020 14:31:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729058AbgCJNbw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Mar 2020 09:31:52 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:54833 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727231AbgCJNbv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Mar 2020 09:31:51 -0400
Received: by mail-wm1-f65.google.com with SMTP id n8so1415767wmc.4;
        Tue, 10 Mar 2020 06:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=So9oahFlaIrjXJ1ThfWP2juPDd9ojTlsnsFX+n5YzPw=;
        b=ZR5XmKWXAiVhg6VG1/Vmtep0lZbswooyXZZekEskl/4hMs8H8hmu8TQmapw4thSe9S
         1PqqwAiuPIiw0yz9cD015t9Ym7CrspB440ZxA2kESP3VYUQx0kf5uopRY68k8TV+Zrft
         IPNglbS1TWYH53kveAVrvIPdZUWfEWBTcstVw+AvPzbio5SwEOWhbUZ5chS55ITYLbvm
         pAMhSf8O+pAOLEva3PqR2JHLUJou92a4sWk2nELeI/xddBDC9wDzGRyrsqo75pQxRi2/
         Mv05poS1mbraXU5Ot+kce1QiRcMywfEHOJg1D1FpfKuD9l3q4IiWs7mZseZiLpp84V3g
         etuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=So9oahFlaIrjXJ1ThfWP2juPDd9ojTlsnsFX+n5YzPw=;
        b=PN29AvKzkq+DKcHB3SvQHp2TUVGg62QmnIP+uLvFyOqk1ZFaYZyuQv/1qO30Wpxw0/
         4zFPAv9KkJnNm0PaCQcdre/GFGgtuRYmQYYt7hI2I1k5wleBulZJuTIP654OjcRGil+u
         l8QmOcLQ+zjY3hKez6MbyFG8SVqh7lt+kr2ZTQKuIh7Q4o85SxQxidzbPG6+NquEHv2I
         HdaHej8WMx8OTX00SjsVjtBPZjNC7KjkIKZXoPrfTs5S+NP9dueKALavF5A/L+UGg1/T
         MSrJU2I3MxFL+jGqYZ/k0mtY9nmiGr8Lfq0SqW71ZmBSCw/Ewtau7P3CJBOnVPrKOHgQ
         wkWw==
X-Gm-Message-State: ANhLgQ3XqfcM8rx4Oz2E4uwPlygpy+bPexLMBvUnf/cCWKPZHWwhYD5U
        hSn1tU8hdDofp7W6tE4GsqU=
X-Google-Smtp-Source: ADFU+vtja3eYb7rLsUWgA36oh7IksgzfIab6tcOPnIf1FXzQ1UNtr9SvKt/Yjk3hcvSpuXQV4ezoTw==
X-Received: by 2002:a1c:f009:: with SMTP id a9mr2200685wmb.73.1583847108295;
        Tue, 10 Mar 2020 06:31:48 -0700 (PDT)
Received: from localhost.localdomain ([197.248.222.210])
        by smtp.googlemail.com with ESMTPSA id o7sm14047141wrx.60.2020.03.10.06.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2020 06:31:47 -0700 (PDT)
From:   Wambui Karuga <wambui.karugax@gmail.com>
To:     airlied@linux.ie, daniel@ffwll.ch, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>
Cc:     dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        gregkh@linuxfoundation.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 08/17] drm/msm: remove checks for return value of drm_debugfs_create_files()
Date:   Tue, 10 Mar 2020 16:31:12 +0300
Message-Id: <20200310133121.27913-9-wambui.karugax@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200310133121.27913-1-wambui.karugax@gmail.com>
References: <20200310133121.27913-1-wambui.karugax@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Since commit 987d65d01356 (drm: debugfs: make
drm_debugfs_create_files() never fail), drm_debugfs_create_files never
fails and only returns 0. Therefore, the unnecessary checks for its
return value and error handling in various debugfs_init() functions in
drm/msm and have the functions return 0 directly.

v2: have debug functions return 0 instead of void to avoid build
breakage and ensure standalone compilation.

References: https://lists.freedesktop.org/archives/dri-devel/2020-February/257183.html
Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a5xx_debugfs.c | 12 +++---------
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c  | 14 +++-----------
 drivers/gpu/drm/msm/msm_debugfs.c         | 13 ++++---------
 3 files changed, 10 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_debugfs.c b/drivers/gpu/drm/msm/adreno/a5xx_debugfs.c
index 075ecce4b5e0..011ab6353dbb 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_debugfs.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_debugfs.c
@@ -151,21 +151,15 @@ DEFINE_SIMPLE_ATTRIBUTE(reset_fops, NULL, reset_set, "%llx\n");
 int a5xx_debugfs_init(struct msm_gpu *gpu, struct drm_minor *minor)
 {
 	struct drm_device *dev;
-	int ret;
 
 	if (!minor)
 		return 0;
 
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
index 1c74381a4fc9..6378157e1fff 100644
--- a/drivers/gpu/drm/msm/msm_debugfs.c
+++ b/drivers/gpu/drm/msm/msm_debugfs.c
@@ -220,14 +220,9 @@ int msm_debugfs_init(struct drm_minor *minor)
 	struct msm_drm_private *priv = dev->dev_private;
 	int ret;
 
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
@@ -238,7 +233,7 @@ int msm_debugfs_init(struct drm_minor *minor)
 			return ret;
 	}
 
-	return ret;
+	return 0;
 }
 #endif
 
-- 
2.25.1

