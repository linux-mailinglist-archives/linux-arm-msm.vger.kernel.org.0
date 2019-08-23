Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC4119A8F3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Aug 2019 09:35:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390392AbfHWHfB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Aug 2019 03:35:01 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:45153 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388420AbfHWHfA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Aug 2019 03:35:00 -0400
Received: by mail-lj1-f196.google.com with SMTP id l1so7920435lji.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Aug 2019 00:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+rL/k87007QFrN6e8/rQoCbxlA21xVkhbLU9RX3RGko=;
        b=kWDp/eQtFpkwvLB6mBWwZMB+kZWqs4saJHbExwKbSt/Iqnpg7B5CI5goPDzEnqhX17
         kdOslO6f4BYjB4EkEK5l+Jl1Tk1wpgHzojh5Fxdxjrqa66AJHSVlYN/M23vcQfr3ByyY
         ya6SAhLe0ZU8zwqxfJW3sN/dfcgxXnFA3InNoY2r7TOKXz6u01JY/RzR5tRo9QonYwUZ
         0dP/Eaij55d+j9YKiF6cZxLuyYcDpDTXHtbYUp+4iX/JDNqkrfpx5PvG/e2IQQkhVN+z
         BfzVleLdfYSycw7GVmo2G3XAcSEhY6AO46nKZD5ND/ITl6v9bFSA8nbS5fDDnSUoGwfM
         qW1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+rL/k87007QFrN6e8/rQoCbxlA21xVkhbLU9RX3RGko=;
        b=CutK7L7/s3f7R9lnuJDSYvmsCcnJHw2yv0ArAQ19IF9oTOtPk0GlCjBBzjaTpL99Eu
         hF+dcZ3V/H1wkIkk5KtuzFrZOmpVobDy5G7bJH3LbZ4LWu6kV/px7uhsfZ2r3YRbsqG6
         ciI2tGk+js75Os/5yHL8GAfUARpgRNdVI6ThpmWy0EgO3+/J+543K+hncZkS0c3WMNia
         S7hAPnGqarUjq70TZsEP2xGHeQ3oL/nzv7IymBWHzvn2P8gnA57FpkDl5GPvLy4zp/nE
         clfnJPoZTX3s2b8nTgMeoBTpIgh1cjUQd7f/mOuOVZWOHHOZHcHuhOTpCW1rFj9uekwR
         YvZA==
X-Gm-Message-State: APjAAAU6PT02QPzlcdEc4uwhYqsZW4UShQdJSjeenPSQMyPrzoFPdkKH
        3baNCna/N3P1I3QbgwgXL9iRWQ==
X-Google-Smtp-Source: APXvYqxjnXzHD039zi6yAqeD5P5LSVZFVpvOrtuYsr7ppbLYLI9K3Q8lh/YIW2xm1hJjGxpWyos0yg==
X-Received: by 2002:a2e:93cc:: with SMTP id p12mr2056927ljh.11.1566545698976;
        Fri, 23 Aug 2019 00:34:58 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id n7sm483780ljh.2.2019.08.23.00.34.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2019 00:34:57 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Cc:     dri-devel@lists.freedesktop.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Brian Masney <masneyb@onstation.org>
Subject: [PATCH 3/6 v2] drm/msm/dpu: Drop unused GPIO code
Date:   Fri, 23 Aug 2019 09:34:45 +0200
Message-Id: <20190823073448.8385-3-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190823073448.8385-1-linus.walleij@linaro.org>
References: <20190823073448.8385-1-linus.walleij@linaro.org>
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
Reviewed-by: Brian Masney <masneyb@onstation.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Rebased on v5.3-rc1
- Collected review tag
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_io_util.c | 1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_io_util.h | 9 ---------
 drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c    | 4 ++++
 3 files changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_io_util.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_io_util.c
index 71b6987bff1e..27fbeb504362 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_io_util.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_io_util.c
@@ -7,6 +7,7 @@
 #include <linux/clk/clk-conf.h>
 #include <linux/err.h>
 #include <linux/delay.h>
+#include <linux/of.h>
 
 #include <drm/drm_print.h>
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_io_util.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_io_util.h
index 09083e9f06bb..e6b5c772fa3b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_io_util.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_io_util.h
@@ -5,7 +5,6 @@
 #ifndef __DPU_IO_UTIL_H__
 #define __DPU_IO_UTIL_H__
 
-#include <linux/gpio.h>
 #include <linux/platform_device.h>
 #include <linux/types.h>
 
@@ -14,12 +13,6 @@
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
@@ -34,8 +27,6 @@ struct dss_clk {
 };
 
 struct dss_module_power {
-	unsigned int num_gpio;
-	struct dss_gpio *gpio_config;
 	unsigned int num_clk;
 	struct dss_clk *clk_config;
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
index 986915bbbc02..c977baddfffd 100644
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
 #include <linux/interconnect.h>
 
-- 
2.21.0

