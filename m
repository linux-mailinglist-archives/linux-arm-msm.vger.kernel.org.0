Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 898684DB75F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Mar 2022 18:37:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357689AbiCPRij (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Mar 2022 13:38:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357690AbiCPRih (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Mar 2022 13:38:37 -0400
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7013C6A01F;
        Wed, 16 Mar 2022 10:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1647452239; x=1678988239;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=1/vw01xPYl6+0Qd5KFm/eUk1WDovz8Ly9daE3YutSSI=;
  b=XpLIVms+u1cmMq349B2u0S4XYJkaA0pQPOznvc6degsgt2zg9lPvrLhw
   B1arORsvdseTYXuhpL+4bBre1A4pkn6FS98pAgyeMDxNnJILwMdfLxFzz
   wwyHUD6PI2cxvrdLpjhJbiyYOzO7wYb0FiMs9S2WRRDnqA8KaKNpIh6KB
   k=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 16 Mar 2022 10:37:19 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2022 10:37:18 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 16 Mar 2022 10:37:17 -0700
Received: from sbillaka-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 16 Mar 2022 10:37:10 -0700
From:   Sankeerth Billakanti <quic_sbillaka@quicinc.com>
To:     <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
CC:     Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        <robdclark@gmail.com>, <seanpaul@chromium.org>,
        <swboyd@chromium.org>, <quic_kalyant@quicinc.com>,
        <quic_abhinavk@quicinc.com>, <dianders@chromium.org>,
        <quic_khsieh@quicinc.com>, <agross@kernel.org>,
        <bjorn.andersson@linaro.org>, <robh+dt@kernel.org>,
        <krzk+dt@kernel.org>, <sean@poorly.run>, <airlied@linux.ie>,
        <daniel@ffwll.ch>, <thierry.reding@gmail.com>, <sam@ravnborg.org>,
        <dmitry.baryshkov@linaro.org>, <quic_vproddut@quicinc.com>
Subject: [PATCH v5 6/9] drm/msm/dp: wait for hpd high before any sink interaction
Date:   Wed, 16 Mar 2022 23:05:51 +0530
Message-ID: <1647452154-16361-7-git-send-email-quic_sbillaka@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1647452154-16361-1-git-send-email-quic_sbillaka@quicinc.com>
References: <1647452154-16361-1-git-send-email-quic_sbillaka@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

	The source device should ensure the sink is ready before
proceeding to read the sink capability or performing any aux transactions.
The sink will indicate its readiness by asserting the HPD line.

	The eDP sink requires power from the source and its HPD line will
be asserted only after the panel is powered on. The panel power will be
enabled from the panel-edp driver.

	The controller driver needs to wait for the hpd line to be asserted
by the sink.

Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_aux.c     |  6 ++++++
 drivers/gpu/drm/msm/dp/dp_catalog.c | 23 +++++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_catalog.h |  1 +
 drivers/gpu/drm/msm/dp/dp_reg.h     |  7 ++++++-
 4 files changed, 36 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_aux.c
index 6d36f63..2ddc303 100644
--- a/drivers/gpu/drm/msm/dp/dp_aux.c
+++ b/drivers/gpu/drm/msm/dp/dp_aux.c
@@ -337,6 +337,12 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux *dp_aux,
 		goto exit;
 	}
 
+	ret = dp_catalog_aux_wait_for_hpd_connect_state(aux->catalog);
+	if (ret) {
+		DRM_DEBUG_DP("DP sink not ready for aux transactions\n");
+		goto exit;
+	}
+
 	dp_aux_update_offset_and_segment(aux, msg);
 	dp_aux_transfer_helper(aux, msg, true);
 
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index fac815f..2c3b0f7 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -242,6 +242,29 @@ void dp_catalog_aux_update_cfg(struct dp_catalog *dp_catalog)
 	phy_calibrate(phy);
 }
 
+int dp_catalog_aux_wait_for_hpd_connect_state(struct dp_catalog *dp_catalog)
+{
+	u32 state, hpd_en, timeout;
+	struct dp_catalog_private *catalog = container_of(dp_catalog,
+				struct dp_catalog_private, dp_catalog);
+
+	hpd_en = dp_read_aux(catalog, REG_DP_DP_HPD_CTRL) &
+					DP_DP_HPD_CTRL_HPD_EN;
+
+	/* no-hpd case */
+	if (!hpd_en)
+		return 0;
+
+	/* Poll for HPD connected status */
+	timeout = dp_read_aux(catalog, REG_DP_DP_HPD_EVENT_TIME_0) &
+					DP_HPD_CONNECT_TIME_MASK;
+
+	return readl_poll_timeout(catalog->io->dp_controller.aux.base +
+				REG_DP_DP_HPD_INT_STATUS,
+				state, state & DP_DP_HPD_STATE_STATUS_CONNECTED,
+				2000, timeout);
+}
+
 static void dump_regs(void __iomem *base, int len)
 {
 	int i;
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
index 7dea101..45140a3 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.h
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
@@ -84,6 +84,7 @@ int dp_catalog_aux_clear_hw_interrupts(struct dp_catalog *dp_catalog);
 void dp_catalog_aux_reset(struct dp_catalog *dp_catalog);
 void dp_catalog_aux_enable(struct dp_catalog *dp_catalog, bool enable);
 void dp_catalog_aux_update_cfg(struct dp_catalog *dp_catalog);
+int dp_catalog_aux_wait_for_hpd_connect_state(struct dp_catalog *dp_catalog);
 u32 dp_catalog_aux_get_irq(struct dp_catalog *dp_catalog);
 
 /* DP Controller APIs */
diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
index 2686028..d68c71b 100644
--- a/drivers/gpu/drm/msm/dp/dp_reg.h
+++ b/drivers/gpu/drm/msm/dp/dp_reg.h
@@ -53,9 +53,14 @@
 #define DP_DP_HPD_REFTIMER_ENABLE		(1 << 16)
 
 #define REG_DP_DP_HPD_EVENT_TIME_0		(0x0000001C)
-#define REG_DP_DP_HPD_EVENT_TIME_1		(0x00000020)
 #define DP_DP_HPD_EVENT_TIME_0_VAL		(0x3E800FA)
+#define DP_HPD_GLITCH_TIME_MASK			(0xFFFC0000)
+#define DP_HPD_CONNECT_TIME_MASK		(0x0003FFFF)
+
+#define REG_DP_DP_HPD_EVENT_TIME_1		(0x00000020)
 #define DP_DP_HPD_EVENT_TIME_1_VAL		(0x1F407D0)
+#define DP_HPD_DISCONNECT_TIME_MASK		(0xFFFFC000)
+#define DP_IRQ_HPD_MAX_TIME_MASK		(0x00003FFF)
 
 #define REG_DP_AUX_CTRL				(0x00000030)
 #define DP_AUX_CTRL_ENABLE			(0x00000001)
-- 
2.7.4

