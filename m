Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C75575414D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jul 2023 19:50:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236426AbjGNRtg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 Jul 2023 13:49:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236410AbjGNRtS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 Jul 2023 13:49:18 -0400
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE72B4219;
        Fri, 14 Jul 2023 10:48:44 -0700 (PDT)
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-3457157a164so9380925ab.1;
        Fri, 14 Jul 2023 10:48:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689356876; x=1691948876;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1YJXN4E7KZ4JH2eWebgn+X/uHO0j9gzpH4B0WSwMnSc=;
        b=iYEc25/6rjDpsCysrpL74zmdu/3ZARntUbv3SerRqbEFgCAJQaOdceBcR7mDv8rkw+
         aXeVaHPz9ww4Qdglc6FWgplT+ezgPlMDkm0TFaLZuFkuAB9g8ZZDQUuNicprO/hSDw4L
         WA9yq4k6BiITgg/k3GfwBSgIjh5zhDHkVd3WC3ODr38VVNNFBlJCLdYnw4E9SYX4U47R
         NVjc06r6pC4zHpV7Vn1q2z60zpqNbs2p8NLCJ3F7OGH6rwSGi4zmV0LN7VC8fnro2rRQ
         DonzjJk9fhaC4KO1Htoqh2p9RxMvjalSy1KjhYI70Yls+qQqVAuDLIeAaqkqdyCHkNjq
         A7hg==
X-Gm-Message-State: ABy/qLb+Oj1+GtuYsJN4G+38J6I9sFIi8GdkBvYKUeXK+KHuZA6Uxhit
        vK7dac+vnIl2cl5ZH3mjRg==
X-Google-Smtp-Source: APBJJlFVc4FZmuW0HR6QeJIUb2k3fI0a7jSi8FCGQeviurwdNqEJcWdkPA4bBme0FPd84wztp985jQ==
X-Received: by 2002:a92:d311:0:b0:346:77f5:116f with SMTP id x17-20020a92d311000000b0034677f5116fmr4939990ila.16.1689356875654;
        Fri, 14 Jul 2023 10:47:55 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id q2-20020a02a302000000b0042b929d3d2fsm2796845jai.86.2023.07.14.10.47.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jul 2023 10:47:55 -0700 (PDT)
Received: (nullmailer pid 4060217 invoked by uid 1000);
        Fri, 14 Jul 2023 17:47:43 -0000
From:   Rob Herring <robh@kernel.org>
To:     Frederic Barrat <fbarrat@linux.ibm.com>,
        Andrew Donnellan <ajd@linux.ibm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Eric Piel <eric.piel@tremplin-utc.net>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Derek Kiernan <derek.kiernan@amd.com>,
        Dragan Cvetic <dragan.cvetic@amd.com>,
        Michal Simek <michal.simek@amd.com>,
        Appana Durga Kedareswara rao 
        <appana.durga.kedareswara.rao@amd.com>
Cc:     devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH] misc: Explicitly include correct DT includes
Date:   Fri, 14 Jul 2023 11:47:34 -0600
Message-Id: <20230714174735.4060016-1-robh@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The DT of_device.h and of_platform.h date back to the separate
of_platform_bus_type before it as merged into the regular platform bus.
As part of that merge prepping Arm DT support 13 years ago, they
"temporarily" include each other. They also include platform_device.h
and of.h. As a result, there's a pretty much random mix of those include
files used throughout the tree. In order to detangle these headers and
replace the implicit includes with struct declarations, users need to
explicitly include the correct includes.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/misc/cxl/base.c            | 1 +
 drivers/misc/fastrpc.c             | 1 +
 drivers/misc/lis3lv02d/lis3lv02d.c | 2 +-
 drivers/misc/qcom-coincell.c       | 1 -
 drivers/misc/sram.c                | 2 +-
 drivers/misc/vcpu_stall_detector.c | 1 -
 drivers/misc/xilinx_sdfec.c        | 4 +++-
 drivers/misc/xilinx_tmr_inject.c   | 3 ++-
 drivers/misc/xilinx_tmr_manager.c  | 3 ++-
 9 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/misc/cxl/base.c b/drivers/misc/cxl/base.c
index cc0caf9192dc..b054562c046e 100644
--- a/drivers/misc/cxl/base.c
+++ b/drivers/misc/cxl/base.c
@@ -7,6 +7,7 @@
 #include <linux/rcupdate.h>
 #include <asm/errno.h>
 #include <misc/cxl-base.h>
+#include <linux/of.h>
 #include <linux/of_platform.h>
 #include "cxl.h"
 
diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 9666d28037e1..1c7c0532da6f 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -13,6 +13,7 @@
 #include <linux/module.h>
 #include <linux/of_address.h>
 #include <linux/of.h>
+#include <linux/platform_device.h>
 #include <linux/sort.h>
 #include <linux/of_platform.h>
 #include <linux/rpmsg.h>
diff --git a/drivers/misc/lis3lv02d/lis3lv02d.c b/drivers/misc/lis3lv02d/lis3lv02d.c
index 299d316f1bda..49868a45c0ad 100644
--- a/drivers/misc/lis3lv02d/lis3lv02d.c
+++ b/drivers/misc/lis3lv02d/lis3lv02d.c
@@ -26,7 +26,7 @@
 #include <linux/miscdevice.h>
 #include <linux/pm_runtime.h>
 #include <linux/atomic.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include "lis3lv02d.h"
 
 #define DRIVER_NAME     "lis3lv02d"
diff --git a/drivers/misc/qcom-coincell.c b/drivers/misc/qcom-coincell.c
index 54d4f6ee8888..3c57f7429147 100644
--- a/drivers/misc/qcom-coincell.c
+++ b/drivers/misc/qcom-coincell.c
@@ -8,7 +8,6 @@
 #include <linux/slab.h>
 #include <linux/of.h>
 #include <linux/regmap.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
 
 struct qcom_coincell {
diff --git a/drivers/misc/sram.c b/drivers/misc/sram.c
index 5757adf418b1..a88f92cf35be 100644
--- a/drivers/misc/sram.c
+++ b/drivers/misc/sram.c
@@ -10,8 +10,8 @@
 #include <linux/genalloc.h>
 #include <linux/io.h>
 #include <linux/list_sort.h>
+#include <linux/of.h>
 #include <linux/of_address.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
diff --git a/drivers/misc/vcpu_stall_detector.c b/drivers/misc/vcpu_stall_detector.c
index 53b5506080e1..6479c962da1a 100644
--- a/drivers/misc/vcpu_stall_detector.c
+++ b/drivers/misc/vcpu_stall_detector.c
@@ -13,7 +13,6 @@
 #include <linux/module.h>
 #include <linux/nmi.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/param.h>
 #include <linux/percpu.h>
 #include <linux/platform_device.h>
diff --git a/drivers/misc/xilinx_sdfec.c b/drivers/misc/xilinx_sdfec.c
index 270ff4c5971a..35941c006552 100644
--- a/drivers/misc/xilinx_sdfec.c
+++ b/drivers/misc/xilinx_sdfec.c
@@ -15,12 +15,14 @@
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
-#include <linux/of_platform.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
 #include <linux/poll.h>
 #include <linux/slab.h>
 #include <linux/clk.h>
 #include <linux/compat.h>
 #include <linux/highmem.h>
+#include <linux/of.h>
 
 #include <uapi/misc/xilinx_sdfec.h>
 
diff --git a/drivers/misc/xilinx_tmr_inject.c b/drivers/misc/xilinx_tmr_inject.c
index d96f6d7cd109..9fc5835bfebc 100644
--- a/drivers/misc/xilinx_tmr_inject.c
+++ b/drivers/misc/xilinx_tmr_inject.c
@@ -11,7 +11,8 @@
 
 #include <asm/xilinx_mb_manager.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
 #include <linux/fault-inject.h>
 
 /* TMR Inject Register offsets */
diff --git a/drivers/misc/xilinx_tmr_manager.c b/drivers/misc/xilinx_tmr_manager.c
index 0ef55e06d3a0..3e4e40c3766f 100644
--- a/drivers/misc/xilinx_tmr_manager.c
+++ b/drivers/misc/xilinx_tmr_manager.c
@@ -15,7 +15,8 @@
 
 #include <asm/xilinx_mb_manager.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
 
 /* TMR Manager Register offsets */
 #define XTMR_MANAGER_CR_OFFSET		0x0
-- 
2.40.1

