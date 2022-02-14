Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 933CC4B54F4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Feb 2022 16:38:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354105AbiBNPhz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Feb 2022 10:37:55 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:32836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355899AbiBNPhz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Feb 2022 10:37:55 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D976EDF9A
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Feb 2022 07:37:46 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id v12so27563165wrv.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Feb 2022 07:37:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=piAsb4t4SD1sv2wty0vPkL+S6vbc8+vlfNWfjljedEY=;
        b=vV37BgTTvSmRurnENtb36TIlJprdlqgUKYZDt7jlyK64Ojo+EJMxry2PABuhUrFxS2
         COzFkCIfXIzbIapPp1bGv/zu5KKwC+L3+cn6ewTn2PiUi8Ql85wjRSgLOOy3hqYoSQbi
         QHA+XGJIbxAVsEYIzADUbJE8frtBVhtQkhohPf0BMMVA6V9d+eagLpFBZ1ZodGKUgdnI
         Ar+JQpAoEXOy3EE8CpNFx+K6L4Y98Abv5fjeWrkLuCdx9s918iimS5hg39Ly+mSg0FIz
         Ck0Ok76uLEZb8Bzc+PP2uf6iCWEl2UNXLLxdcu772PAczO/Il1ms11rrMbBPjgqhEKdC
         0MeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=piAsb4t4SD1sv2wty0vPkL+S6vbc8+vlfNWfjljedEY=;
        b=yfCkIvue4LtXvePrRzzLMocSO8Mbb5CQPoR8I6nIRaLvGHuUUWz8mciyHny9bNVmoe
         wqIg/bCUzJRYzPjKbYC1tBn7vjZZIizp3OyB9WYDmfS9xgQs1g6/++MwdlJPGh6hsCqS
         08VOmHE/NTxDTRiU2Knpze6RjpU8ymWhSyT0GJw4GqAENV9xpc44IqxPXOrTc1c3xI/Q
         JGfKUMc0jve7C0GVqdVK37tGFsdpbu3GHVoX+/6MuyzHeGYDaiIk728aiUak4dmzJGKf
         9DUJqiu/IZsv7DmflIR3O6j/0XH1gVWABLGTZghyTl0mtAPUHxU94SthNEoE6bamCRFQ
         d/jg==
X-Gm-Message-State: AOAM533w7eQzIoNvCE/GsLCvilJGn/XZGrpLoQaNvL3L+zDUGveucTB5
        MJfSLCwClUfTN2ZQOeC8efXaYtMg1eZecA==
X-Google-Smtp-Source: ABdhPJziMz3tE+JW+CSk7fGBvFzWbBfKT7e5GCTRzgFmUfT7gpHXHC0Ov+qdiyvZTJJOKnoenRWifQ==
X-Received: by 2002:a05:6000:188:: with SMTP id p8mr188339wrx.84.1644853065425;
        Mon, 14 Feb 2022 07:37:45 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:82c:5f0:682b:4712:4b40:6814])
        by smtp.gmail.com with ESMTPSA id l26sm12935850wms.24.2022.02.14.07.37.44
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Feb 2022 07:37:44 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     dmitry.baryshkov@linaro.org, robdclark@gmail.com,
        robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, bjorn.andersson@linaro.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v2 2/3] drm/msm/dsi: Add support for qcm2290 dsi controller
Date:   Mon, 14 Feb 2022 16:37:39 +0100
Message-Id: <1644853060-12222-2-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1644853060-12222-1-git-send-email-loic.poulain@linaro.org>
References: <1644853060-12222-1-git-send-email-loic.poulain@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

QCM2290 MDSS includes a Qualcomm DSI controller v2.4.1. Since this
controller version is not SoC specific, and already assigned to sc7180
for auto configuration, we rely on DSI block specific compatible
string "qcom,dsi-ctrl-6g-qcm2290", and use the device's data to point
to the right dsi config handler.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 v2: commit reword

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

