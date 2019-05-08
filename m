Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 742CD18133
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2019 22:43:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727221AbfEHUnJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 May 2019 16:43:09 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:41960 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727026AbfEHUnJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 May 2019 16:43:09 -0400
Received: by mail-qt1-f194.google.com with SMTP id c13so20156qtn.8;
        Wed, 08 May 2019 13:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RRhM4Xbewkp84+4O0OA6RBzWB6C2RH/TXCxkHZjcu/w=;
        b=EhgO+A7mM5OH5ywjsc4Flm52opT8cFnN0bYm+Ey5K+s0D734CcX2grfd2aBVoQPx9A
         AtlnQNa34TCNNd2bEFfnu4p6qZwrfhADZsTlo2HB/oJywgq/ChIqtIbhJoRJAeHG6Pkd
         MHNqbLY2Ojiml/wX8JYRwcwDafnxVDg09UhpvicERfBeUpVqVoiIp3GjnqNW8YCEDs/5
         RuFSqrb/4cJTcQwp7Vm+yRwQHiNwhXh6qINEDt30Mn7hkhY5JUrlIAM3J1IPfryBCKuG
         bn+mXQVv+05/MZhU531HCdX6NLPn/byU5PYi2OQAMVtxCMtAaqB4nKKGaMbMBpquvcXv
         rJtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RRhM4Xbewkp84+4O0OA6RBzWB6C2RH/TXCxkHZjcu/w=;
        b=btGh0UkofYK14yk+3GbpW5H89XizNDDWH3lTyvIElwBE/VlXrr695I7noRHUelKubs
         CoG+nSqiDUByLkBwfN7HzZ6ux+xn5raODTchsTU9sWxf0JwDtSUfcmZTE1vmpvlNMBem
         CLSlS60CceQVW3ybrreylZNxt9op7lkJA6KWLW4Icc1Su3z6Mo1NpZk+baUDIxE5iB2P
         BuWMp8NaAZlu6D3/cTC1BTGZKuAzJg7fH1gldzc4zIApENPAfLujXYhKhn+OHg/r7/J9
         EXmpMDWyfWVoZjyNcKKBgAauLDCK+19eAdDcnM2xVeAdOtZ1sNsL3sivtiTnW5WM09mh
         /3Zg==
X-Gm-Message-State: APjAAAUlmWxBJgNxwWkd+Nci2WNZ0xIgWFevwabVAoQvr8O8FRPGhnYj
        t78AG7bWg47YpIWm98QQTvU=
X-Google-Smtp-Source: APXvYqzWMbSN5tIzdiNbnibON+I+cQ3djcOhCYT7fH8Nmvtln/IfuF7S8fSj5uG3RPGuIMPwDqtBiA==
X-Received: by 2002:a0c:ff0b:: with SMTP id w11mr207357qvt.33.1557348187795;
        Wed, 08 May 2019 13:43:07 -0700 (PDT)
Received: from localhost ([2601:184:4780:7861:6268:7a0b:50be:cebc])
        by smtp.gmail.com with ESMTPSA id r47sm9064085qte.70.2019.05.08.13.43.06
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 May 2019 13:43:07 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Jayant Shekhar <jshekhar@codeaurora.org>,
        Sravanthi Kollukuduru <skolluku@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] drm/msm/dpu: Integrate interconnect API in MDSS
Date:   Wed,  8 May 2019 13:42:12 -0700
Message-Id: <20190508204219.31687-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190508204219.31687-1-robdclark@gmail.com>
References: <20190508204219.31687-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Jayant Shekhar <jshekhar@codeaurora.org>

The interconnect framework is designed to provide a
standard kernel interface to control the settings of
the interconnects on a SoC.

The interconnect API uses a consumer/provider-based model,
where the providers are the interconnect buses and the
consumers could be various drivers.

MDSS is one of the interconnect consumers which uses the
interconnect APIs to get the path between endpoints and
set its bandwidth requirement for the given interconnected
path.

Changes in v2:
	- Remove error log and unnecessary check (Jordan Crouse)

Changes in v3:
	- Code clean involving variable name change, removal
	  of extra paranthesis and variables (Matthias Kaehlcke)

Changes in v4:
	- Add comments, spacings, tabs, proper port name
	  and icc macro (Georgi Djakov)

Changes in v5:
	- Commit text and parenthesis alignment (Georgi Djakov)

Changes in v6:
	- Change to new icc_set API's (Doug Anderson)

Changes in v7:
	- Fixed a typo

Signed-off-by: Sravanthi Kollukuduru <skolluku@codeaurora.org>
Signed-off-by: Jayant Shekhar <jshekhar@codeaurora.org>
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c | 49 ++++++++++++++++++++++--
 1 file changed, 45 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
index 7316b4ab1b85..e3c56ccd7357 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
@@ -4,11 +4,15 @@
  */
 
 #include "dpu_kms.h"
+#include <linux/interconnect.h>
 
 #define to_dpu_mdss(x) container_of(x, struct dpu_mdss, base)
 
 #define HW_INTR_STATUS			0x0010
 
+/* Max BW defined in KBps */
+#define MAX_BW				6800000
+
 struct dpu_irq_controller {
 	unsigned long enabled_mask;
 	struct irq_domain *domain;
@@ -21,8 +25,30 @@ struct dpu_mdss {
 	u32 hwversion;
 	struct dss_module_power mp;
 	struct dpu_irq_controller irq_controller;
+	struct icc_path *path[2];
+	u32 num_paths;
 };
 
+static int dpu_mdss_parse_data_bus_icc_path(struct drm_device *dev,
+						struct dpu_mdss *dpu_mdss)
+{
+	struct icc_path *path0 = of_icc_get(dev->dev, "mdp0-mem");
+	struct icc_path *path1 = of_icc_get(dev->dev, "mdp1-mem");
+
+	if (IS_ERR(path0))
+		return PTR_ERR(path0);
+
+	dpu_mdss->path[0] = path0;
+	dpu_mdss->num_paths = 1;
+
+	if (!IS_ERR(path1)) {
+		dpu_mdss->path[1] = path1;
+		dpu_mdss->num_paths++;
+	}
+
+	return 0;
+}
+
 static void dpu_mdss_irq(struct irq_desc *desc)
 {
 	struct dpu_mdss *dpu_mdss = irq_desc_get_handler_data(desc);
@@ -134,7 +160,11 @@ static int dpu_mdss_enable(struct msm_mdss *mdss)
 {
 	struct dpu_mdss *dpu_mdss = to_dpu_mdss(mdss);
 	struct dss_module_power *mp = &dpu_mdss->mp;
-	int ret;
+	int ret, i;
+	u64 avg_bw = dpu_mdss->num_paths ? MAX_BW / dpu_mdss->num_paths : 0;
+
+	for (i = 0; i < dpu_mdss->num_paths; i++)
+		icc_set_bw(dpu_mdss->path[i], avg_bw, kBps_to_icc(MAX_BW));
 
 	ret = msm_dss_enable_clk(mp->clk_config, mp->num_clk, true);
 	if (ret)
@@ -147,12 +177,15 @@ static int dpu_mdss_disable(struct msm_mdss *mdss)
 {
 	struct dpu_mdss *dpu_mdss = to_dpu_mdss(mdss);
 	struct dss_module_power *mp = &dpu_mdss->mp;
-	int ret;
+	int ret, i;
 
 	ret = msm_dss_enable_clk(mp->clk_config, mp->num_clk, false);
 	if (ret)
 		DPU_ERROR("clock disable failed, ret:%d\n", ret);
 
+	for (i = 0; i < dpu_mdss->num_paths; i++)
+		icc_set_bw(dpu_mdss->path[i], 0, 0);
+
 	return ret;
 }
 
@@ -163,6 +196,7 @@ static void dpu_mdss_destroy(struct drm_device *dev)
 	struct dpu_mdss *dpu_mdss = to_dpu_mdss(priv->mdss);
 	struct dss_module_power *mp = &dpu_mdss->mp;
 	int irq;
+	int i;
 
 	pm_runtime_suspend(dev->dev);
 	pm_runtime_disable(dev->dev);
@@ -172,6 +206,9 @@ static void dpu_mdss_destroy(struct drm_device *dev)
 	msm_dss_put_clk(mp->clk_config, mp->num_clk);
 	devm_kfree(&pdev->dev, mp->clk_config);
 
+	for (i = 0; i < dpu_mdss->num_paths; i++)
+		icc_put(dpu_mdss->path[i]);
+
 	if (dpu_mdss->mmio)
 		devm_iounmap(&pdev->dev, dpu_mdss->mmio);
 	dpu_mdss->mmio = NULL;
@@ -211,6 +248,10 @@ int dpu_mdss_init(struct drm_device *dev)
 	}
 	dpu_mdss->mmio_len = resource_size(res);
 
+	ret = dpu_mdss_parse_data_bus_icc_path(dev, dpu_mdss);
+	if (ret)
+		return ret;
+
 	mp = &dpu_mdss->mp;
 	ret = msm_dss_parse_clock(pdev, mp);
 	if (ret) {
@@ -232,14 +273,14 @@ int dpu_mdss_init(struct drm_device *dev)
 	irq_set_chained_handler_and_data(irq, dpu_mdss_irq,
 					 dpu_mdss);
 
+	priv->mdss = &dpu_mdss->base;
+
 	pm_runtime_enable(dev->dev);
 
 	pm_runtime_get_sync(dev->dev);
 	dpu_mdss->hwversion = readl_relaxed(dpu_mdss->mmio);
 	pm_runtime_put_sync(dev->dev);
 
-	priv->mdss = &dpu_mdss->base;
-
 	return ret;
 
 irq_error:
-- 
2.20.1

