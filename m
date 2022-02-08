Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3DE854AE17C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Feb 2022 19:51:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353077AbiBHSvT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Feb 2022 13:51:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239828AbiBHSvT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Feb 2022 13:51:19 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6493FC0613CB
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Feb 2022 10:51:18 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id s18so17740wrv.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Feb 2022 10:51:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=5ALVzrTKLAEPJC1Xi/eint/DQ6mkJeJEeqYUi1S2gxY=;
        b=nKDB50aVVHjB1xgWZTsMctY0IInrnCloiEnmZGApHrjfNKbfOX7XqZh6Qev38Sg+35
         VUErEzlCn++Vs5HrxvjP0pTwLIeXdMnjeYxwajgHRwisBHIEfdHzlCobLDOGcgzw4Y9C
         dDIB46Ewy+27TE6xQMiZZlTRnk70Icj2v+rO+/v0rDsnYFnAUtjGmBG3N0lMroJ5aQA8
         Awvdsw+k0RfvLnLWXI5TlxMICjeM1GJdwyZtNWnhJJg3HyfNGOrM8RQePTWrw8Y3qihS
         rz9SuH1IAHbFpliJJVUCCOvpj//i1QHQ3vZxe8FGygtrA/CQhoBcRKHDy+zGR85XqAov
         Yo2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=5ALVzrTKLAEPJC1Xi/eint/DQ6mkJeJEeqYUi1S2gxY=;
        b=nVoeM6qwxbs/cc1insyCnp3rO9Ni88BOHoGbJl4K8Xo70gCSvEZ0LUE1kxoBQddbwF
         7ZKKJ4WWq9jpGYdA4rMbJY9hxPWTmXDTZKRDvwcs2k3foEPcsYkuZ8pQOJcky50TvI4U
         1Cx9BhUgvFiBIag+Ezwo+kCVaKnIUsSuq8xCA5PqvlWddGGlV01IYJ0ZAhCl9XqIikHt
         KHFYOv0G3+lufPo4k9xQanCITo+AAkV/ANpzmz9b0quNUFOpzBmHPKjuaa4Tam4uRKll
         CtnnbAMqRGgEOtFpX/BrXSrDZgN4TmqMJlt7P+UPy3ZU2X1NGdrX0UplDJ20RsOeBmYE
         n1Xg==
X-Gm-Message-State: AOAM53202U9162I202hvrvUlSJefqSFwohqXOrYb7KgSENsIxqR3awhI
        sqrX/fchy3VOs/n2uVHiXQBOdg==
X-Google-Smtp-Source: ABdhPJz/tUn5rWWb97PhmCF/3fHm+0f1rFa7bKgE8Zk9tgOGKsk+jQPJMmJOWUsCtocsRv3sJZFR2Q==
X-Received: by 2002:a05:6000:3c6:: with SMTP id b6mr4536758wrg.12.1644346276133;
        Tue, 08 Feb 2022 10:51:16 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:82c:5f0:682b:4712:4b40:6814])
        by smtp.gmail.com with ESMTPSA id z17sm2762725wmf.11.2022.02.08.10.51.15
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Feb 2022 10:51:15 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     robdclark@gmail.com, sean@poorly.run, robh+dt@kernel.org,
        dmitry.baryshkov@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH 2/3] drm/msm/dsi: Add support for qcm2290 dsi controller
Date:   Tue,  8 Feb 2022 19:51:11 +0100
Message-Id: <1644346272-3403-2-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1644346272-3403-1-git-send-email-loic.poulain@linaro.org>
References: <1644346272-3403-1-git-send-email-loic.poulain@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Using exact version of the block as compatible string.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi.c     |  2 ++
 drivers/gpu/drm/msm/dsi/dsi_cfg.c | 23 +++++++++++++++++++++++
 drivers/gpu/drm/msm/dsi/dsi_cfg.h |  3 +++
 3 files changed, 28 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
index 06a9008..bed8b24b 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.c
+++ b/drivers/gpu/drm/msm/dsi/dsi.c
@@ -4,6 +4,7 @@
  */
 
 #include "dsi.h"
+#include "dsi_cfg.h"
 
 struct drm_encoder *msm_dsi_get_encoder(struct msm_dsi *msm_dsi)
 {
@@ -171,6 +172,7 @@ static int dsi_dev_remove(struct platform_device *pdev)
 
 static const struct of_device_id dt_match[] = {
 	{ .compatible = "qcom,mdss-dsi-ctrl", .data = NULL /* autodetect cfg */ },
+	{ .compatible = "qcom,dsi-ctrl-6g-qcm2290", .data = &qcm2290_dsi_cfg_handler },
 	{}
 };
 
diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
index 96bbc8b..2c23324 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
@@ -213,6 +213,24 @@ static const struct msm_dsi_config sc7280_dsi_cfg = {
 	.num_dsi = 1,
 };
 
+static const char * const dsi_qcm2290_bus_clk_names[] = {
+	"iface", "bus",
+};
+
+static const struct msm_dsi_config qcm2290_dsi_cfg = {
+	.io_offset = DSI_6G_REG_SHIFT,
+	.reg_cfg = {
+		.num = 1,
+		.regs = {
+			{"vdda", 21800, 4 },	/* 1.2 V */
+		},
+	},
+	.bus_clk_names = dsi_qcm2290_bus_clk_names,
+	.num_bus_clks = ARRAY_SIZE(dsi_qcm2290_bus_clk_names),
+	.io_start = { 0x5e94000 },
+	.num_dsi = 1,
+};
+
 static const struct msm_dsi_host_cfg_ops msm_dsi_v2_host_ops = {
 	.link_clk_set_rate = dsi_link_clk_set_rate_v2,
 	.link_clk_enable = dsi_link_clk_enable_v2,
@@ -300,3 +318,8 @@ const struct msm_dsi_cfg_handler *msm_dsi_cfg_get(u32 major, u32 minor)
 	return cfg_hnd;
 }
 
+/*  Non autodetect configs */
+const struct msm_dsi_cfg_handler qcm2290_dsi_cfg_handler = {
+	.cfg = &qcm2290_dsi_cfg,
+	.ops = &msm_dsi_6g_v2_host_ops,
+};
diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.h b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
index 41e99a9..fe54a99 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.h
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
@@ -60,5 +60,8 @@ struct msm_dsi_cfg_handler {
 
 const struct msm_dsi_cfg_handler *msm_dsi_cfg_get(u32 major, u32 minor);
 
+/* Non autodetect configs */
+extern const struct msm_dsi_cfg_handler qcm2290_dsi_cfg_handler;
+
 #endif /* __MSM_DSI_CFG_H__ */
 
-- 
2.7.4

