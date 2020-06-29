Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C1E420E3EB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2020 00:04:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390841AbgF2VTc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Jun 2020 17:19:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730120AbgF2VSr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Jun 2020 17:18:47 -0400
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com [IPv6:2607:f8b0:4864:20::f42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C3FBC08C5DC
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2020 14:18:47 -0700 (PDT)
Received: by mail-qv1-xf42.google.com with SMTP id g11so8355433qvs.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2020 14:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MEAgnaM7D2mpY2dMCdUXKcsS9ZNQb7s4gUJ6O4bO1VY=;
        b=j06c+TK4S1fn0oZck2Gwc1KSiBZdU3VzeWbe52kcvoOAmS6d8oxh9/Y+S8r5wgjpzv
         ojyzUphELLMYhBQaVtfXWAeWbrFKB0R/XCcDWZkIYN6AMGNBImOdWSGEwE2wpUwJAGhQ
         32dLOabMG6WAy9e9xxqf2yJqsC4/ETbqJwoCMjfvQlnCO0gujChF+/cxAm4nznQztynC
         z47F0EONtsYUxb2ZJZ4xqHymHGQ87wBcl0lwFMcE9vS74TZmyMoXiPrF9EktElrtJrMd
         3FkMedQFcQs9U+YDOFn/i9luo43eClsq1ZsJW5mNOJ9PD3MBb3Rsv/R17ylUTGrRX6kW
         WmKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MEAgnaM7D2mpY2dMCdUXKcsS9ZNQb7s4gUJ6O4bO1VY=;
        b=mK60KTA8l9C5DtOjfGWWQf3WpC7vIZmGMrRguOcHaiQOmY7Axzd6rTvqhEcrKw/WDU
         Ozt8cqxWxhTgCCuabvTXd4m0XRn4plOknACb1qj/BSxK0LqvuE6Qnby653lBOoa9wYJR
         SfqhGMHEcF6F3BtJpy9SAePfHtz+3Zo3A8Sk4mcu0+ld/kLqgH+s5olJV05vR/aD9ucx
         h0H26mHZSbFRrXIO5Posa5IDM4hxbYSAI6w/yfQm3ooEMkswArxUMa2rWJAmaYgH0JTa
         QggwZVYuA4ApwG2juT+cyQ3neMZJPX0hLVB7CaVJECxNPfDPQH5N6krRgqwYjLxzGovQ
         ztnw==
X-Gm-Message-State: AOAM530brfTmpViYJK8V1Y4KQD+q1Xe8ZdpKEcGzP2/p7f2zJfcAhCR/
        M//0KPDaNu7ghTR4qjuGMb7D0BYONrQ=
X-Google-Smtp-Source: ABdhPJwZNlVBkNZy6/8pWDHFPFvR0f15CzcN8wTIjPUqrmYf/cWFSZdMu73ni1ixhZtVUip/i2QOxg==
X-Received: by 2002:a0c:83a5:: with SMTP id k34mr16887476qva.130.1593465526051;
        Mon, 29 Jun 2020 14:18:46 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id b196sm1169078qkg.11.2020.06.29.14.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 14:18:45 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
        linux-kernel@vger.kernel.org (open list)
Subject: [RESEND PATCH v2 08/13] clk: qcom: add common gdsc_gx_do_nothing_enable for gpucc drivers
Date:   Mon, 29 Jun 2020 17:17:14 -0400
Message-Id: <20200629211725.2592-9-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200629211725.2592-1-jonathan@marek.ca>
References: <20200629211725.2592-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

All gpucc drivers need this, so move it to common code instead of
duplicating it in every gpucc driver.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/clk/qcom/gdsc.c         | 25 +++++++++++++++++++++++++
 drivers/clk/qcom/gdsc.h         |  1 +
 drivers/clk/qcom/gpucc-sc7180.c | 27 +--------------------------
 drivers/clk/qcom/gpucc-sdm845.c | 27 +--------------------------
 4 files changed, 28 insertions(+), 52 deletions(-)

diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
index 04944f11659b..628397703717 100644
--- a/drivers/clk/qcom/gdsc.c
+++ b/drivers/clk/qcom/gdsc.c
@@ -433,3 +433,28 @@ void gdsc_unregister(struct gdsc_desc *desc)
 	}
 	of_genpd_del_provider(dev->of_node);
 }
+
+/*
+ * On SDM845+ the GPU GX domain is *almost* entirely controlled by the GMU
+ * running in the CX domain so the CPU doesn't need to know anything about the
+ * GX domain EXCEPT....
+ *
+ * Hardware constraints dictate that the GX be powered down before the CX. If
+ * the GMU crashes it could leave the GX on. In order to successfully bring back
+ * the device the CPU needs to disable the GX headswitch. There being no sane
+ * way to reach in and touch that register from deep inside the GPU driver we
+ * need to set up the infrastructure to be able to ensure that the GPU can
+ * ensure that the GX is off during this super special case. We do this by
+ * defining a GX gdsc with a dummy enable function and a "default" disable
+ * function.
+ *
+ * This allows us to attach with genpd_dev_pm_attach_by_name() in the GPU
+ * driver. During power up, nothing will happen from the CPU (and the GMU will
+ * power up normally but during power down this will ensure that the GX domain
+ * is *really* off - this gives us a semi standard way of doing what we need.
+ */
+int gdsc_gx_do_nothing_enable(struct generic_pm_domain *domain)
+{
+	/* Do nothing but give genpd the impression that we were successful */
+	return 0;
+}
diff --git a/drivers/clk/qcom/gdsc.h b/drivers/clk/qcom/gdsc.h
index c36fc26dcdff..1896bfb2bbd1 100644
--- a/drivers/clk/qcom/gdsc.h
+++ b/drivers/clk/qcom/gdsc.h
@@ -68,6 +68,7 @@ struct gdsc_desc {
 int gdsc_register(struct gdsc_desc *desc, struct reset_controller_dev *,
 		  struct regmap *);
 void gdsc_unregister(struct gdsc_desc *desc);
+int gdsc_gx_do_nothing_enable(struct generic_pm_domain *domain);
 #else
 static inline int gdsc_register(struct gdsc_desc *desc,
 				struct reset_controller_dev *rcdev,
diff --git a/drivers/clk/qcom/gpucc-sc7180.c b/drivers/clk/qcom/gpucc-sc7180.c
index 7b656b6aeced..88a739b6fec3 100644
--- a/drivers/clk/qcom/gpucc-sc7180.c
+++ b/drivers/clk/qcom/gpucc-sc7180.c
@@ -170,37 +170,12 @@ static struct gdsc cx_gdsc = {
 	.flags = VOTABLE,
 };
 
-/*
- * On SC7180 the GPU GX domain is *almost* entirely controlled by the GMU
- * running in the CX domain so the CPU doesn't need to know anything about the
- * GX domain EXCEPT....
- *
- * Hardware constraints dictate that the GX be powered down before the CX. If
- * the GMU crashes it could leave the GX on. In order to successfully bring back
- * the device the CPU needs to disable the GX headswitch. There being no sane
- * way to reach in and touch that register from deep inside the GPU driver we
- * need to set up the infrastructure to be able to ensure that the GPU can
- * ensure that the GX is off during this super special case. We do this by
- * defining a GX gdsc with a dummy enable function and a "default" disable
- * function.
- *
- * This allows us to attach with genpd_dev_pm_attach_by_name() in the GPU
- * driver. During power up, nothing will happen from the CPU (and the GMU will
- * power up normally but during power down this will ensure that the GX domain
- * is *really* off - this gives us a semi standard way of doing what we need.
- */
-static int gx_gdsc_enable(struct generic_pm_domain *domain)
-{
-	/* Do nothing but give genpd the impression that we were successful */
-	return 0;
-}
-
 static struct gdsc gx_gdsc = {
 	.gdscr = 0x100c,
 	.clamp_io_ctrl = 0x1508,
 	.pd = {
 		.name = "gx_gdsc",
-		.power_on = gx_gdsc_enable,
+		.power_on = gdsc_gx_do_nothing_enable,
 	},
 	.pwrsts = PWRSTS_OFF_ON,
 	.flags = CLAMP_IO,
diff --git a/drivers/clk/qcom/gpucc-sdm845.c b/drivers/clk/qcom/gpucc-sdm845.c
index e40efba1bf7d..5663698b306b 100644
--- a/drivers/clk/qcom/gpucc-sdm845.c
+++ b/drivers/clk/qcom/gpucc-sdm845.c
@@ -131,37 +131,12 @@ static struct gdsc gpu_cx_gdsc = {
 	.flags = VOTABLE,
 };
 
-/*
- * On SDM845 the GPU GX domain is *almost* entirely controlled by the GMU
- * running in the CX domain so the CPU doesn't need to know anything about the
- * GX domain EXCEPT....
- *
- * Hardware constraints dictate that the GX be powered down before the CX. If
- * the GMU crashes it could leave the GX on. In order to successfully bring back
- * the device the CPU needs to disable the GX headswitch. There being no sane
- * way to reach in and touch that register from deep inside the GPU driver we
- * need to set up the infrastructure to be able to ensure that the GPU can
- * ensure that the GX is off during this super special case. We do this by
- * defining a GX gdsc with a dummy enable function and a "default" disable
- * function.
- *
- * This allows us to attach with genpd_dev_pm_attach_by_name() in the GPU
- * driver. During power up, nothing will happen from the CPU (and the GMU will
- * power up normally but during power down this will ensure that the GX domain
- * is *really* off - this gives us a semi standard way of doing what we need.
- */
-static int gx_gdsc_enable(struct generic_pm_domain *domain)
-{
-	/* Do nothing but give genpd the impression that we were successful */
-	return 0;
-}
-
 static struct gdsc gpu_gx_gdsc = {
 	.gdscr = 0x100c,
 	.clamp_io_ctrl = 0x1508,
 	.pd = {
 		.name = "gpu_gx_gdsc",
-		.power_on = gx_gdsc_enable,
+		.power_on = gdsc_gx_do_nothing_enable,
 	},
 	.pwrsts = PWRSTS_OFF_ON,
 	.flags = CLAMP_IO | AON_RESET | POLL_CFG_GDSCR,
-- 
2.26.1

