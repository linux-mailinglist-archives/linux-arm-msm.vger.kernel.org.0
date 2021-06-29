Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60AB53B7837
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jun 2021 21:05:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235193AbhF2THV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Jun 2021 15:07:21 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:14293 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234903AbhF2THU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Jun 2021 15:07:20 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1624993492; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=ZeFu6sGT74ihWouBRIryqiyIEXHKywFaEdwk3Fhn5og=; b=FHhFDzEd0rFlRPeGmQ0zMKBRNQiVyU4GHmeCa53uAXchItYP8cri73+oM3OxT2r05vrSxyXF
 rHK6uwFf4nI7CUB73KoRkoIUkT/lqzKYGZI9UwBZxAotqkdck+ne26RTXbikrP7W0O77Jtbq
 gTjoxE44H0DgLv0yUDVT67v6UDM=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 60db6ec22a2a9a9761bbc374 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 29 Jun 2021 19:04:34
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 0972EC43217; Tue, 29 Jun 2021 19:04:34 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from abhinavk-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 692F8C433D3;
        Tue, 29 Jun 2021 19:04:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 692F8C433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=abhinavk@codeaurora.org
From:   Abhinav Kumar <abhinavk@codeaurora.org>
To:     dri-devel@lists.freedesktop.org
Cc:     Abhinav Kumar <abhinavk@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org,
        nganji@codeaurora.org, aravindh@codeaurora.org,
        khsieh@codeaurora.org, dmitry.baryshkov@linaro.org
Subject: [PATCH] drm/msm/dsi: add support for dsi test pattern generator
Date:   Tue, 29 Jun 2021 12:04:24 -0700
Message-Id: <1624993464-20447-1-git-send-email-abhinavk@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

During board bringups its useful to have a DSI test pattern
generator to isolate a DPU vs a DSI issue and focus on the relevant
hardware block.

To facilitate this, add an API which triggers the DSI controller
test pattern. The expected output is a rectangular checkered pattern.

This has been validated on a single DSI video mode panel by calling it
right after drm_panel_enable() which is also the ideal location to use
this as the DSI host and the panel have been initialized by then.

Further validation on dual DSI and command mode panel is pending.
If there are any fix ups needed for those, it shall be applied on top
of this change.

Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
---
 drivers/gpu/drm/msm/dsi/dsi.h         |  3 ++
 drivers/gpu/drm/msm/dsi/dsi.xml.h     |  9 ++++++
 drivers/gpu/drm/msm/dsi/dsi_host.c    | 53 +++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/dsi/dsi_manager.c | 13 +++++++++
 4 files changed, 78 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
index 9b8e9b0..663ccbd 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.h
@@ -84,6 +84,7 @@ void msm_dsi_manager_setup_encoder(int id);
 int msm_dsi_manager_register(struct msm_dsi *msm_dsi);
 void msm_dsi_manager_unregister(struct msm_dsi *msm_dsi);
 bool msm_dsi_manager_validate_current_config(u8 id);
+void msm_dsi_manager_tpg_enable(void);
 
 /* msm dsi */
 static inline bool msm_dsi_device_connected(struct msm_dsi *msm_dsi)
@@ -148,6 +149,8 @@ int dsi_clk_init_6g_v2(struct msm_dsi_host *msm_host);
 int dsi_calc_clk_rate_v2(struct msm_dsi_host *msm_host, bool is_dual_dsi);
 int dsi_calc_clk_rate_6g(struct msm_dsi_host *msm_host, bool is_dual_dsi);
 void msm_dsi_host_snapshot(struct msm_disp_state *disp_state, struct mipi_dsi_host *host);
+void msm_dsi_host_test_pattern_en(struct mipi_dsi_host *host);
+
 /* dsi phy */
 struct msm_dsi_phy;
 struct msm_dsi_phy_shared_timings {
diff --git a/drivers/gpu/drm/msm/dsi/dsi.xml.h b/drivers/gpu/drm/msm/dsi/dsi.xml.h
index eadbcc7..f7dcf49 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.xml.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.xml.h
@@ -624,6 +624,15 @@ static inline uint32_t DSI_RDBK_DATA_CTRL_COUNT(uint32_t val)
 #define REG_DSI_VERSION						0x000001f0
 #define DSI_VERSION_MAJOR__MASK					0xff000000
 #define DSI_VERSION_MAJOR__SHIFT				24
+
+#define REG_DSI_TEST_PATTERN_GEN_VIDEO_INIT_VAL 0x00000160
+#define REG_DSI_TPG_MAIN_CONTROL				0x00000198
+#define REG_DSI_TPG_VIDEO_CONFIG				0x000001a0
+#define REG_DSI_TEST_PATTERN_GEN_CTRL			0x00000158
+#define REG_DSI_TEST_PATTERN_GEN_CMD_MDP_INIT_VAL0	0x00000168
+#define REG_DSI_TEST_PATTERN_GEN_CMD_STREAM0_TRIGGER	0x00000180
+#define REG_DSI_TPG_MAIN_CONTROL2				0x0000019c
+
 static inline uint32_t DSI_VERSION_MAJOR(uint32_t val)
 {
 	return ((val) << DSI_VERSION_MAJOR__SHIFT) & DSI_VERSION_MAJOR__MASK;
diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index ed504fe..24d44b0 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -2495,3 +2495,56 @@ void msm_dsi_host_snapshot(struct msm_disp_state *disp_state, struct mipi_dsi_ho
 
 	pm_runtime_put_sync(&msm_host->pdev->dev);
 }
+
+static void msm_dsi_host_video_test_pattern_setup(struct msm_dsi_host *msm_host)
+{
+	u32 reg;
+
+	reg = dsi_read(msm_host, REG_DSI_TEST_PATTERN_GEN_CTRL);
+
+	dsi_write(msm_host, REG_DSI_TEST_PATTERN_GEN_VIDEO_INIT_VAL, 0xff);
+	/* draw checkered rectangle pattern */
+	dsi_write(msm_host, REG_DSI_TPG_MAIN_CONTROL, 0x100);
+	/* use 24-bit RGB test pttern */
+	dsi_write(msm_host, REG_DSI_TPG_VIDEO_CONFIG, 0x5);
+
+	reg |= (0x3 << 4);
+	dsi_write(msm_host, REG_DSI_TEST_PATTERN_GEN_CTRL, reg);
+
+	DBG("Video test pattern setup done\n");
+}
+
+static void msm_dsi_host_cmd_test_pattern_setup(struct msm_dsi_host *msm_host)
+{
+	u32 reg;
+
+	reg = dsi_read(msm_host, REG_DSI_TEST_PATTERN_GEN_CTRL);
+
+	dsi_write(msm_host, REG_DSI_TEST_PATTERN_GEN_CMD_MDP_INIT_VAL0, 0xff);
+
+	reg |= (0x3 << 0x8);
+	dsi_write(msm_host, REG_DSI_TEST_PATTERN_GEN_CTRL, reg);
+	/* draw checkered rectangle pattern */
+	dsi_write(msm_host, REG_DSI_TPG_MAIN_CONTROL2, (0x1 << 0x7));
+	DBG("Cmd test pattern setup done\n");
+}
+
+void msm_dsi_host_test_pattern_en(struct mipi_dsi_host *host)
+{
+	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
+	bool is_video_mode = !!(msm_host->mode_flags & MIPI_DSI_MODE_VIDEO);
+	u32 reg;
+
+	if (is_video_mode)
+		msm_dsi_host_video_test_pattern_setup(msm_host);
+	else
+		msm_dsi_host_cmd_test_pattern_setup(msm_host);
+
+	reg = dsi_read(msm_host, REG_DSI_TEST_PATTERN_GEN_CTRL);
+	/* enable the test pattern generator */
+	dsi_write(msm_host, REG_DSI_TEST_PATTERN_GEN_CTRL, (reg | BIT(0)));
+
+	/* for command mode need to trigger one frame from tpg */
+	if (!is_video_mode)
+		dsi_write(msm_host, REG_DSI_TEST_PATTERN_GEN_CMD_STREAM0_TRIGGER, 0x1);
+}
diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index 4ebfedc..db80de6 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -441,6 +441,19 @@ static void dsi_mgr_bridge_pre_enable(struct drm_bridge *bridge)
 	return;
 }
 
+void msm_dsi_manager_tpg_enable(void)
+{
+	struct msm_dsi *m_dsi = dsi_mgr_get_dsi(DSI_0);
+	struct msm_dsi *s_dsi = dsi_mgr_get_dsi(DSI_1);
+
+	/* if dual dsi, trigger tpg on master first then slave */
+	if (m_dsi) {
+		msm_dsi_host_test_pattern_en(m_dsi->host);
+		if (IS_DUAL_DSI() && s_dsi)
+			msm_dsi_host_test_pattern_en(s_dsi->host);
+	}
+}
+
 static void dsi_mgr_bridge_enable(struct drm_bridge *bridge)
 {
 	int id = dsi_mgr_bridge_get_id(bridge);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

