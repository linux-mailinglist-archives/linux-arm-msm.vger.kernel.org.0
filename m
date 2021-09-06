Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0524B401689
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Sep 2021 08:45:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239400AbhIFGo3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Sep 2021 02:44:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239244AbhIFGo1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Sep 2021 02:44:27 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A283EC061575;
        Sun,  5 Sep 2021 23:43:23 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id c17so5826740pgc.0;
        Sun, 05 Sep 2021 23:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vXyxpFHBcEv4sS2t76pl1COPJ/sZoBUbznBcP7dl+HA=;
        b=MkDdoGqMO1Z/0vDuONb4VGQmsvo0dCFjgiEDcr1th+volaeMLn8sxOtZ4vT+W6VOlY
         CffRWTbYj0HVPbt+Ln3ZmYL76xand44xgy14yGo4WF2eJ1tePbv4Gl0/JKYBdP8JfzDR
         YP5gqO3TqRXhYN1EF8MZMA9MPCFng77f2vsAlsGJx8VyLNUWrkLAvj1iGAc4IJEKLpUU
         SF8Ci+J7/7K7YBNNGmyM5EDdnKSX7u7CfWws9HxkTqynULxhN76vgCz1Vm5QeVaHWYZe
         SOjgvW79VGAeKixTDof1cllWD2SfZ7uMkQsKiERvybuRaCt7MAk4RDhP16R1WlZ7mUcS
         mh1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vXyxpFHBcEv4sS2t76pl1COPJ/sZoBUbznBcP7dl+HA=;
        b=qqBFTlJOsOmNpMs4S+0Rqlg1fmtsac0Z/Kk3sTNIR6wMEpbvAooMpgd3GVgqe0q0K/
         Xe5+cdgy1J6mkjz36RwwOWhSVJADibC3FSCbpuzXRe4kWRLgMsoCO5hggNqob4ylCk3D
         MW5ggmZRAj//IcHU7MkZVafwy8vBRyz3FGG//2ihd9FGCaToxuA4X1wrrRT6TZMawOu3
         HCxxEMhY7wBE6ks7dU57D7uW1qlBAdY1xmT9iLzlRaYnv2LCrWg2W6arO1Fl0mY97hYr
         6HUhe+uNSbwwyFuUZjulPtgQ3D+v4pHyiJcyF6me3dxD8f0jx0mCtR+aQ+EtmEC2SWi2
         QGVw==
X-Gm-Message-State: AOAM53205VqSvXJ1RBKjUloC5Bh9rv69rIz/fV8hEyBkkmbZZ8nfTRpZ
        iQsgSQ+6X8ZC+c/d7B3CXAJ/MpBVpbrvOIAY
X-Google-Smtp-Source: ABdhPJxhCgJQRi7jSe3tZ+uGXk2bms0XFN7UVu1YTeUOVP5h85afqBqXr6ZvBi2mT4wI1Cx6T4vkVw==
X-Received: by 2002:a63:da49:: with SMTP id l9mr10791109pgj.277.1630910603266;
        Sun, 05 Sep 2021 23:43:23 -0700 (PDT)
Received: from localhost.localdomain ([124.126.19.250])
        by smtp.gmail.com with ESMTPSA id c124sm6615033pfc.216.2021.09.05.23.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Sep 2021 23:43:23 -0700 (PDT)
From:   zhaoxiao <long870912@gmail.com>
To:     robdclark@gmail.com, sean@poorly.run, airlied@linux.ie,
        daniel@ffwll.ch
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        zhaoxiao <long870912@gmail.com>
Subject: [PATCH] drm/msm: Remove initialization of static variables
Date:   Mon,  6 Sep 2021 14:43:15 +0800
Message-Id: <20210906064315.4975-1-long870912@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Address the following checkpatch errors:
ERROR: do not initialise statics to false

FILE: :drivers/gpu/drm/msm/msm_drv.c:21:
-static bool reglog = false;

FILE: :drivers/gpu/drm/msm/msm_drv.c:31:
-bool dumpstate = false;

Signed-off-by: zhaoxiao <long870912@gmail.com>
---
 drivers/gpu/drm/msm/msm_drv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 9b8fa2ad0d84..d9ca4bc9620b 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -59,7 +59,7 @@ static const struct drm_mode_config_helper_funcs mode_config_helper_funcs = {
 };
 
 #ifdef CONFIG_DRM_MSM_REGISTER_LOGGING
-static bool reglog = false;
+static bool reglog;
 MODULE_PARM_DESC(reglog, "Enable register read/write logging");
 module_param(reglog, bool, 0600);
 #else
@@ -76,7 +76,7 @@ static char *vram = "16m";
 MODULE_PARM_DESC(vram, "Configure VRAM size (for devices without IOMMU/GPUMMU)");
 module_param(vram, charp, 0);
 
-bool dumpstate = false;
+bool dumpstate;
 MODULE_PARM_DESC(dumpstate, "Dump KMS state on errors");
 module_param(dumpstate, bool, 0600);
 
-- 
2.20.1

