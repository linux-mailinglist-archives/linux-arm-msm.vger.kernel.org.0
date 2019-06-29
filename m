Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C9A05AB2F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Jun 2019 15:02:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726801AbfF2NCB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 29 Jun 2019 09:02:01 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:46556 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726716AbfF2NCB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 29 Jun 2019 09:02:01 -0400
Received: by mail-lf1-f68.google.com with SMTP id z15so5729277lfh.13
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Jun 2019 06:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ji8jAojLPl8vD+gcsy1dZ2LAcjvPmFSVJ5glNsjtSak=;
        b=nAjmGaNaoXOfVZnFCs0LUWx0cgkIpWqrZKexDYARBy6576kyG3UYP+U3tLv6Z7mbun
         3mza7Rr4HNinHrz/Z+ZS8QeQeD2ig1Wuy5eIgVPImRlRcCxR6UE3d6lvjrMrektszXS+
         0CG3ahmSPlVFxu3mFx0uVQqdq4jNPLcFg8BC+yVu43Um7D3UMfNOpakEUcEVn6MuC8Ry
         X4Gx9ihORnId7aLMGMVG+MYoXUZ7qMgU1CSiYsMEXSOfdUiBe/5UWIg8MwtVDMvToc9k
         2kG/2Li5Bv+dVCPKpJYsQ5s5V65k/L9JNU0oyZMgdR84ds/6gyw5txkGZP6EpXJbSn72
         8DlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ji8jAojLPl8vD+gcsy1dZ2LAcjvPmFSVJ5glNsjtSak=;
        b=l9jc3XcKpbNvBcbuuHxQG2PHW1Jq3YoW/lDL+awbBATZ4c5dkGjcvAAkh5eaDcxqGi
         KPM1jL/+mXNNzR9/PGxkJLOWgzi07UM+ANuMimoEtqyrq1fy4LBbAxEA8oMvUG5EEOnH
         RfpN2qnAPYky1TfKXPI1QLWburCqRNEEzkMw2jAXPHJtqAODudA+59aI0gIvZKqQ9WxB
         p2i+dnUwDBqkf6kAB8wzkgi1LizHLOHfWnPbfhZO80r/P53D7DBbQBBGf2VyS0vwMzlr
         CAAHhs9F9mUeSodxah9V8/vH7ANelLwQUMhtxpFKcuLBtY7kwswrD+3ifbQGV9ftU6gz
         01Eg==
X-Gm-Message-State: APjAAAULfB14GRFQSmfPfBjPpvsrV9mCVYO6eOQ5gMh2UUJnRlfbVqVc
        deZszVdpckXDysczRBOjk6LlYw==
X-Google-Smtp-Source: APXvYqw4JVg2KbWLoxvVW9U6jPqYrcYh2H4AXq4ph9NDkiYzD2Bg7mSbg0zvS+exFIzcUH3D8CLeKg==
X-Received: by 2002:a19:f601:: with SMTP id x1mr7523920lfe.182.1561813318996;
        Sat, 29 Jun 2019 06:01:58 -0700 (PDT)
Received: from localhost.localdomain (c-22cd225c.014-348-6c756e10.bbcust.telenor.se. [92.34.205.34])
        by smtp.gmail.com with ESMTPSA id v2sm1354500lfi.52.2019.06.29.06.01.57
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 29 Jun 2019 06:01:57 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     dri-devel@lists.freedesktop.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Sean Paul <sean@poorly.run>
Cc:     linux-arm-kernel@lists.infradead.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Clark <robdclark@gmail.com>, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 3/7] drm/msm/dpu: Drop unused GPIO code
Date:   Sat, 29 Jun 2019 14:59:29 +0200
Message-Id: <20190629125933.679-3-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190629125933.679-1-linus.walleij@linaro.org>
References: <20190629125933.679-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The DPU has some kind of idea that it wants to be able to
bring up power using GPIO lines. The struct dss_gpio is however
completely unused and should this be done, it should be done
using the GPIO descriptor framework rather than this API
which relies on the global GPIO numberspace. Delete this
code before anyone hurt themselves.

The inclusion of <linux/gpio.h> was abused to get some OF
and IRQ headers implicitly included into the DPU utilities,
make these includes explicit and push them down into the actual
implementation.

Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_io_util.c | 1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_io_util.h | 9 ---------
 drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c    | 4 ++++
 3 files changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_io_util.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_io_util.c
index 78833c2c27f8..78f04147839f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_io_util.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_io_util.c
@@ -15,6 +15,7 @@
 #include <linux/clk/clk-conf.h>
 #include <linux/err.h>
 #include <linux/delay.h>
+#include <linux/of.h>
 
 #include <drm/drm_print.h>
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_io_util.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_io_util.h
index bc07381d7429..a0498c7bd677 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_io_util.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_io_util.h
@@ -13,7 +13,6 @@
 #ifndef __DPU_IO_UTIL_H__
 #define __DPU_IO_UTIL_H__
 
-#include <linux/gpio.h>
 #include <linux/platform_device.h>
 #include <linux/types.h>
 
@@ -22,12 +21,6 @@
 #define DEV_WARN(fmt, args...)  pr_warn(fmt, ##args)
 #define DEV_ERR(fmt, args...)   pr_err(fmt, ##args)
 
-struct dss_gpio {
-	unsigned int gpio;
-	unsigned int value;
-	char gpio_name[32];
-};
-
 enum dss_clk_type {
 	DSS_CLK_AHB, /* no set rate. rate controlled through rpm */
 	DSS_CLK_PCLK,
@@ -42,8 +35,6 @@ struct dss_clk {
 };
 
 struct dss_module_power {
-	unsigned int num_gpio;
-	struct dss_gpio *gpio_config;
 	unsigned int num_clk;
 	struct dss_clk *clk_config;
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
index 7316b4ab1b85..9baabadc62bb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
@@ -3,6 +3,10 @@
  * Copyright (c) 2018, The Linux Foundation
  */
 
+#include <linux/irq.h>
+#include <linux/irqchip.h>
+#include <linux/irqdesc.h>
+#include <linux/irqchip/chained_irq.h>
 #include "dpu_kms.h"
 
 #define to_dpu_mdss(x) container_of(x, struct dpu_mdss, base)
-- 
2.20.1

