Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 507194942E3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jan 2022 23:16:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357532AbiASWQV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Jan 2022 17:16:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236635AbiASWQV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Jan 2022 17:16:21 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C384C06161C
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Jan 2022 14:16:20 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id m3so14196179lfu.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Jan 2022 14:16:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=12uuow7778XV9In4fyeSWkSK2fcajo2YhG6nP2XCnuo=;
        b=oRANZytiUkULtkc/kZsihHeTif+N2gvEmOq8UngRG88HInYNQwEq1anyETDsabVgn3
         XdhQ/vUgecyTaSgV/fV13AuIJhsDg7dyw5hyyh7Te2bUIcnnXj9XTqexpQzVTyNFRl6y
         qo0LcmEnufMdhqlCA7ftikQQE9kjX2Zt7fs+Giu6kAexZw/JoNs7LpmnlGZMJtKRVWxf
         vMzwEW1gWTA1Wvxumf5I047QIPMzNegBPi39NfQMwLZUY3iHkha9WXfQ6+agYDpu8Lkx
         jCXwsAlPD5+FGOFLfcp7bky/pY2KcrmpfZuzm6Yqei0YRBEou+dyoZ81L45kubXYCRxX
         wTvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=12uuow7778XV9In4fyeSWkSK2fcajo2YhG6nP2XCnuo=;
        b=WD1idXFppi3R2qyBTZT7bmuhilEA9kX6mKTiZP3ZlbFFvN1r3VoLq1laAgLPgoRRAl
         bWAbJP5I7e+h/CiK9NFzaZ1EOkoENJQErxbhq+LuFmv/6hryIHNLahb6tkYJUGIrVksg
         6WehFVog5OUnbIKeKKWwj4ICKXj2zJ20onJgVaS6CCNXSUdNZicyEQgiY8kOKsVXk6as
         72BLo3XOBtuIeix2WItVOiSdLqEAEMPZulycX332yLEdx9Yt/LY3tfCz6DNZu/UEC4nK
         L/vNzQam6YWKhMLdVmRSTshzLhTYq8TL0YptpluDHV46KeoTU1OYE/6nOBhfGpZDjyYc
         Ot7w==
X-Gm-Message-State: AOAM533Hru0iwJlThNFgDEZRs2t3+gtjeFyoI4lp54Q0EplCRHz2FgYh
        0OOnX0QsEhKHqoaBXJhEFN3Agw==
X-Google-Smtp-Source: ABdhPJxZuDAnt1LMpoDRS6BjuXzuGWPalNbBv8T/B7cAmOIzvgzOVI7zzwyvjL94tVcbPpQOnenVBw==
X-Received: by 2002:a05:651c:1a29:: with SMTP id by41mr16859847ljb.151.1642630578692;
        Wed, 19 Jan 2022 14:16:18 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id b11sm89053lfb.277.2022.01.19.14.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jan 2022 14:16:18 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v3 1/3] drm/msm: move utility functions from msm_drv.c
Date:   Thu, 20 Jan 2022 01:16:14 +0300
Message-Id: <20220119221616.3089119-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220119221616.3089119-1-dmitry.baryshkov@linaro.org>
References: <20220119221616.3089119-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Move clock/IO/hrtimer utility functions from msm_drv.c to new
msm_io_utils.c file.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/Makefile       |   1 +
 drivers/gpu/drm/msm/msm_drv.c      | 118 ---------------------------
 drivers/gpu/drm/msm/msm_io_utils.c | 126 +++++++++++++++++++++++++++++
 3 files changed, 127 insertions(+), 118 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/msm_io_utils.c

diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index 03ab55c37beb..5b6e37477079 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -87,6 +87,7 @@ msm-y := \
 	msm_gem_vma.o \
 	msm_gpu.o \
 	msm_gpu_devfreq.o \
+	msm_io_utils.o \
 	msm_iommu.o \
 	msm_perf.o \
 	msm_rd.o \
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index fd62a4da14a1..30c44c395a24 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -75,124 +75,6 @@ static bool modeset = true;
 MODULE_PARM_DESC(modeset, "Use kernel modesetting [KMS] (1=on (default), 0=disable)");
 module_param(modeset, bool, 0600);
 
-/*
- * Util/helpers:
- */
-
-struct clk *msm_clk_bulk_get_clock(struct clk_bulk_data *bulk, int count,
-		const char *name)
-{
-	int i;
-	char n[32];
-
-	snprintf(n, sizeof(n), "%s_clk", name);
-
-	for (i = 0; bulk && i < count; i++) {
-		if (!strcmp(bulk[i].id, name) || !strcmp(bulk[i].id, n))
-			return bulk[i].clk;
-	}
-
-
-	return NULL;
-}
-
-struct clk *msm_clk_get(struct platform_device *pdev, const char *name)
-{
-	struct clk *clk;
-	char name2[32];
-
-	clk = devm_clk_get(&pdev->dev, name);
-	if (!IS_ERR(clk) || PTR_ERR(clk) == -EPROBE_DEFER)
-		return clk;
-
-	snprintf(name2, sizeof(name2), "%s_clk", name);
-
-	clk = devm_clk_get(&pdev->dev, name2);
-	if (!IS_ERR(clk))
-		dev_warn(&pdev->dev, "Using legacy clk name binding.  Use "
-				"\"%s\" instead of \"%s\"\n", name, name2);
-
-	return clk;
-}
-
-static void __iomem *_msm_ioremap(struct platform_device *pdev, const char *name,
-				  bool quiet, phys_addr_t *psize)
-{
-	struct resource *res;
-	unsigned long size;
-	void __iomem *ptr;
-
-	if (name)
-		res = platform_get_resource_byname(pdev, IORESOURCE_MEM, name);
-	else
-		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-
-	if (!res) {
-		if (!quiet)
-			DRM_DEV_ERROR(&pdev->dev, "failed to get memory resource: %s\n", name);
-		return ERR_PTR(-EINVAL);
-	}
-
-	size = resource_size(res);
-
-	ptr = devm_ioremap(&pdev->dev, res->start, size);
-	if (!ptr) {
-		if (!quiet)
-			DRM_DEV_ERROR(&pdev->dev, "failed to ioremap: %s\n", name);
-		return ERR_PTR(-ENOMEM);
-	}
-
-	if (psize)
-		*psize = size;
-
-	return ptr;
-}
-
-void __iomem *msm_ioremap(struct platform_device *pdev, const char *name)
-{
-	return _msm_ioremap(pdev, name, false, NULL);
-}
-
-void __iomem *msm_ioremap_quiet(struct platform_device *pdev, const char *name)
-{
-	return _msm_ioremap(pdev, name, true, NULL);
-}
-
-void __iomem *msm_ioremap_size(struct platform_device *pdev, const char *name,
-			  phys_addr_t *psize)
-{
-	return _msm_ioremap(pdev, name, false, psize);
-}
-
-static enum hrtimer_restart msm_hrtimer_worktimer(struct hrtimer *t)
-{
-	struct msm_hrtimer_work *work = container_of(t,
-			struct msm_hrtimer_work, timer);
-
-	kthread_queue_work(work->worker, &work->work);
-
-	return HRTIMER_NORESTART;
-}
-
-void msm_hrtimer_queue_work(struct msm_hrtimer_work *work,
-			    ktime_t wakeup_time,
-			    enum hrtimer_mode mode)
-{
-	hrtimer_start(&work->timer, wakeup_time, mode);
-}
-
-void msm_hrtimer_work_init(struct msm_hrtimer_work *work,
-			   struct kthread_worker *worker,
-			   kthread_work_func_t fn,
-			   clockid_t clock_id,
-			   enum hrtimer_mode mode)
-{
-	hrtimer_init(&work->timer, clock_id, mode);
-	work->timer.function = msm_hrtimer_worktimer;
-	work->worker = worker;
-	kthread_init_work(&work->work, fn);
-}
-
 static irqreturn_t msm_irq(int irq, void *arg)
 {
 	struct drm_device *dev = arg;
diff --git a/drivers/gpu/drm/msm/msm_io_utils.c b/drivers/gpu/drm/msm/msm_io_utils.c
new file mode 100644
index 000000000000..7b504617833a
--- /dev/null
+++ b/drivers/gpu/drm/msm/msm_io_utils.c
@@ -0,0 +1,126 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2016-2018, 2020-2021 The Linux Foundation. All rights reserved.
+ * Copyright (C) 2013 Red Hat
+ * Author: Rob Clark <robdclark@gmail.com>
+ */
+
+#include "msm_drv.h"
+
+/*
+ * Util/helpers:
+ */
+
+struct clk *msm_clk_bulk_get_clock(struct clk_bulk_data *bulk, int count,
+		const char *name)
+{
+	int i;
+	char n[32];
+
+	snprintf(n, sizeof(n), "%s_clk", name);
+
+	for (i = 0; bulk && i < count; i++) {
+		if (!strcmp(bulk[i].id, name) || !strcmp(bulk[i].id, n))
+			return bulk[i].clk;
+	}
+
+
+	return NULL;
+}
+
+struct clk *msm_clk_get(struct platform_device *pdev, const char *name)
+{
+	struct clk *clk;
+	char name2[32];
+
+	clk = devm_clk_get(&pdev->dev, name);
+	if (!IS_ERR(clk) || PTR_ERR(clk) == -EPROBE_DEFER)
+		return clk;
+
+	snprintf(name2, sizeof(name2), "%s_clk", name);
+
+	clk = devm_clk_get(&pdev->dev, name2);
+	if (!IS_ERR(clk))
+		dev_warn(&pdev->dev, "Using legacy clk name binding.  Use "
+				"\"%s\" instead of \"%s\"\n", name, name2);
+
+	return clk;
+}
+
+static void __iomem *_msm_ioremap(struct platform_device *pdev, const char *name,
+				  bool quiet, phys_addr_t *psize)
+{
+	struct resource *res;
+	unsigned long size;
+	void __iomem *ptr;
+
+	if (name)
+		res = platform_get_resource_byname(pdev, IORESOURCE_MEM, name);
+	else
+		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+
+	if (!res) {
+		if (!quiet)
+			DRM_DEV_ERROR(&pdev->dev, "failed to get memory resource: %s\n", name);
+		return ERR_PTR(-EINVAL);
+	}
+
+	size = resource_size(res);
+
+	ptr = devm_ioremap(&pdev->dev, res->start, size);
+	if (!ptr) {
+		if (!quiet)
+			DRM_DEV_ERROR(&pdev->dev, "failed to ioremap: %s\n", name);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	if (psize)
+		*psize = size;
+
+	return ptr;
+}
+
+void __iomem *msm_ioremap(struct platform_device *pdev, const char *name)
+{
+	return _msm_ioremap(pdev, name, false, NULL);
+}
+
+void __iomem *msm_ioremap_quiet(struct platform_device *pdev, const char *name)
+{
+	return _msm_ioremap(pdev, name, true, NULL);
+}
+
+void __iomem *msm_ioremap_size(struct platform_device *pdev, const char *name,
+			  phys_addr_t *psize)
+{
+	return _msm_ioremap(pdev, name, false, psize);
+}
+
+static enum hrtimer_restart msm_hrtimer_worktimer(struct hrtimer *t)
+{
+	struct msm_hrtimer_work *work = container_of(t,
+			struct msm_hrtimer_work, timer);
+
+	kthread_queue_work(work->worker, &work->work);
+
+	return HRTIMER_NORESTART;
+}
+
+void msm_hrtimer_queue_work(struct msm_hrtimer_work *work,
+			    ktime_t wakeup_time,
+			    enum hrtimer_mode mode)
+{
+	hrtimer_start(&work->timer, wakeup_time, mode);
+}
+
+void msm_hrtimer_work_init(struct msm_hrtimer_work *work,
+			   struct kthread_worker *worker,
+			   kthread_work_func_t fn,
+			   clockid_t clock_id,
+			   enum hrtimer_mode mode)
+{
+	hrtimer_init(&work->timer, clock_id, mode);
+	work->timer.function = msm_hrtimer_worktimer;
+	work->worker = worker;
+	kthread_init_work(&work->work, fn);
+}
-- 
2.34.1

