Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F3B31336E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 May 2019 19:58:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727749AbfECR6r (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 May 2019 13:58:47 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:45334 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727601AbfECR6r (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 May 2019 13:58:47 -0400
Received: by mail-pf1-f195.google.com with SMTP id e24so3227222pfi.12;
        Fri, 03 May 2019 10:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=ooXXaTjW3PGU+EmYpvlg4whjJfgEkcywCH6vUZA4h/w=;
        b=UXRQHQnpge6zu7lkrvOLU/fef+EsvPdq+ZsTPefd47hyCMMjQKxVVQoz5x9INsCiUC
         cex6+hfa798VKtERv8ixv9vUVWfXkumVMxX0XDT+twT+ztLSRfbPiROXswHAeAKi8Sez
         erFhtAedMXclfQttXvIxPwHbdbb+0sfO2jc+By54JzDJTdZYBjSWAEFtv5cOAbIFVMdE
         2M1hSgz7Qs5RHKaV6i5JJR9vTPi0tItrBng8xOVWBmAyotpHGzd348cyMoq9l2sL+hQc
         a/R5alkElgraFZ10WPkV9h1rJGM3elfoSXGzo/HyzNsonno1Ebhv2GTfk7wS/gH3Dye7
         88LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=ooXXaTjW3PGU+EmYpvlg4whjJfgEkcywCH6vUZA4h/w=;
        b=CnEf2OdXCxULnmesI0nNFG6kgblNEc2+5RoRu/SE+CIL52YZt6RfojDlRIg9Kz8bTT
         Sl9k/JM+IwCWqXNWT3D7J1TEIhY2X/TNglvLkf9tV8Xhp3GTfYAxoS6uQAB5HP43H/q8
         9/hJVVQh3POzvI0XECEcFSYYYg4A9nkUFEf4YMAWo9PLGzyUZiO6kemAX1GYbi9RWNd/
         IXbu8xLlww9+/JUTY+6ogMBNvYbLlKzWLcqTDqEQ6lprkKJm/TtNploMYyJ+lZx4VY/B
         5j6p/pwiuVkAEh7vtb6xDEa8mWsDSgEW6Aqw6O7vkLlsB7VIhk0JG3lqO9xeAvx/rHlG
         UgmQ==
X-Gm-Message-State: APjAAAUU1JTEym3XoF2sSRrnW9FLkVtAWU+VbW8rwPL2wkXbBudB/ow/
        rSIdreQhRbL3MR31nhonh/M=
X-Google-Smtp-Source: APXvYqyXJ7yo91DLg3trGKRJzPJZkZarUay0Mj4BFJGWi6q84c8u3OAlKaaNzmKHZkCV8GEJ2jkH9w==
X-Received: by 2002:aa7:83d1:: with SMTP id j17mr12854399pfn.78.1556906325799;
        Fri, 03 May 2019 10:58:45 -0700 (PDT)
Received: from CentOS76.localdomain.localdomain ([183.82.21.188])
        by smtp.gmail.com with ESMTPSA id n18sm7019262pfi.48.2019.05.03.10.58.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 May 2019 10:58:44 -0700 (PDT)
From:   jagdsh.linux@gmail.com
To:     robdclark@gmail.com, sean@poorly.run, airlied@linux.ie,
        daniel@ffwll.ch, bskeggs@redhat.com, hierry.reding@gmail.com,
        jcrouse@codeaurora.org, jsanka@codeaurora.org,
        skolluku@codeaurora.org, paul.burton@mips.com, jrdr.linux@gmail.com
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        nouveau@lists.freedesktop.org,
        Jagadeesh Pagadala <jagdsh.linux@gmail.com>
Subject: [PATCH] gpu/drm: Remove duplicate headers
Date:   Fri,  3 May 2019 23:28:13 +0530
Message-Id: <1556906293-128921-1-git-send-email-jagdsh.linux@gmail.com>
X-Mailer: git-send-email 1.8.3.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Jagadeesh Pagadala <jagdsh.linux@gmail.com>

Remove duplicate headers which are included twice.

Signed-off-by: Jagadeesh Pagadala <jagdsh.linux@gmail.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c             | 1 -
 drivers/gpu/drm/nouveau/nvkm/subdev/bus/nv04.c        | 2 --
 drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c | 1 -
 3 files changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
index 018df2c..45a5bc6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
@@ -15,7 +15,6 @@
 #include "dpu_hwio.h"
 #include "dpu_hw_lm.h"
 #include "dpu_hw_mdss.h"
-#include "dpu_kms.h"
 
 #define LM_OP_MODE                        0x00
 #define LM_OUT_SIZE                       0x04
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bus/nv04.c b/drivers/gpu/drm/nouveau/nvkm/subdev/bus/nv04.c
index c80b967..2b44ba5 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/bus/nv04.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bus/nv04.c
@@ -26,8 +26,6 @@
 
 #include <subdev/gpio.h>
 
-#include <subdev/gpio.h>
-
 static void
 nv04_bus_intr(struct nvkm_bus *bus)
 {
diff --git a/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c b/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c
index 2c9c972..cacf2e0 100644
--- a/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c
+++ b/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c
@@ -53,7 +53,6 @@
 #include <linux/of_graph.h>
 #include <linux/pm.h>
 
-#include <drm/drm_panel.h>
 #include <drm/drmP.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_mipi_dsi.h>
-- 
1.8.3.1

