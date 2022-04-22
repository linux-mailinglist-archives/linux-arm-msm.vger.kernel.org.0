Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F155450B3CF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Apr 2022 11:16:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233473AbiDVJQ6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 Apr 2022 05:16:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233524AbiDVJOk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 Apr 2022 05:14:40 -0400
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com [199.106.114.39])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A7A451E73;
        Fri, 22 Apr 2022 02:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1650618708; x=1682154708;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=PIckCwnhlQGgsEHvejKSJbPQ9Mrv0qN+cQbB/DYrt/M=;
  b=qOm/QIoyjaDizD4ZEO0o767xbjQuLiBsofbPJVO76a0mpTKqPw4KfZNs
   IIW13CxpcrclJU2JDywRkFTYW6iCPLxdtdLk+ekgSHi545zc1vc0fM7JU
   E2GvBPGZd0KCwXn1OHrJfnC+ut0qEuLwYlmQPBUZv0hoobeddOfY0Y/1c
   0=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 22 Apr 2022 02:11:48 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2022 02:11:46 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 22 Apr 2022 02:11:46 -0700
Received: from sbillaka-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 22 Apr 2022 02:11:40 -0700
From:   Sankeerth Billakanti <quic_sbillaka@quicinc.com>
To:     <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
CC:     Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        <robdclark@gmail.com>, <seanpaul@chromium.org>,
        <swboyd@chromium.org>, <quic_kalyant@quicinc.com>,
        <quic_abhinavk@quicinc.com>, <dianders@chromium.org>,
        <quic_khsieh@quicinc.com>, <bjorn.andersson@linaro.org>,
        <sean@poorly.run>, <airlied@linux.ie>, <daniel@ffwll.ch>,
        <dmitry.baryshkov@linaro.org>, <quic_vproddut@quicinc.com>,
        <quic_aravindh@quicinc.com>, <steev@kali.org>
Subject: [PATCH v9 3/4] drm/msm/dp: wait for hpd high before aux transaction
Date:   Fri, 22 Apr 2022 14:41:05 +0530
Message-ID: <1650618666-15342-4-git-send-email-quic_sbillaka@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1650618666-15342-1-git-send-email-quic_sbillaka@quicinc.com>
References: <1650618666-15342-1-git-send-email-quic_sbillaka@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The source device should ensure the sink is ready before proceeding to
read the sink capability or perform any aux transactions. The sink
will indicate its readiness by asserting the HPD line. The controller
driver needs to wait for the hpd line to be asserted by the sink before
it performs any aux transactions.

The eDP sink is assumed to be always connected. It needs power from the
source and its HPD line will be asserted only after the panel is powered
on. The panel power will be enabled from the panel-edp driver and only
after that, the hpd line will be asserted.

Whereas for DP, the sink can be hotplugged and unplugged anytime. The hpd
line gets asserted to indicate the sink is connected and ready. Hence
there is no need to wait for the hpd line to be asserted for a DP sink.

Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---
These changes may be handled in is_hpd_asserted when
https://lore.kernel.org/r/20220408193536.RFC.3.Icf57bb12233a47727013c6ab69eebf803e22ebc1@changeid/
is accepted upstream.

Changes in v9:
  - none

Changes in v8:
  - correct the indentation

Changes in v7:
  - add a comment to say why the wait is done for eDP
  - correct the commit text

Changes in v6:
  - Wait for hpd high only for eDP
  - Split into smaller patches

 drivers/gpu/drm/msm/dp/dp_aux.c     | 21 ++++++++++++++++++++-
 drivers/gpu/drm/msm/dp/dp_aux.h     |  3 ++-
 drivers/gpu/drm/msm/dp/dp_catalog.c | 13 +++++++++++++
 drivers/gpu/drm/msm/dp/dp_catalog.h |  1 +
 drivers/gpu/drm/msm/dp/dp_display.c |  2 +-
 5 files changed, 37 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_aux.c
index 6d36f63..d030a93 100644
--- a/drivers/gpu/drm/msm/dp/dp_aux.c
+++ b/drivers/gpu/drm/msm/dp/dp_aux.c
@@ -34,6 +34,7 @@ struct dp_aux_private {
 	bool no_send_addr;
 	bool no_send_stop;
 	bool initted;
+	bool is_edp;
 	u32 offset;
 	u32 segment;
 
@@ -337,6 +338,22 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux *dp_aux,
 		goto exit;
 	}
 
+	/*
+	 * For eDP it's important to give a reasonably long wait here for HPD
+	 * to be asserted. This is because the panel driver may have _just_
+	 * turned on the panel and then tried to do an AUX transfer. The panel
+	 * driver has no way of knowing when the panel is ready, so it's up
+	 * to us to wait. For DP we never get into this situation so let's
+	 * avoid ever doing the extra long wait for DP.
+	 */
+	if (aux->is_edp) {
+		ret = dp_catalog_aux_wait_for_hpd_connect_state(aux->catalog);
+		if (ret) {
+			DRM_DEBUG_DP("Panel not ready for aux transactions\n");
+			goto exit;
+		}
+	}
+
 	dp_aux_update_offset_and_segment(aux, msg);
 	dp_aux_transfer_helper(aux, msg, true);
 
@@ -491,7 +508,8 @@ void dp_aux_unregister(struct drm_dp_aux *dp_aux)
 	drm_dp_aux_unregister(dp_aux);
 }
 
-struct drm_dp_aux *dp_aux_get(struct device *dev, struct dp_catalog *catalog)
+struct drm_dp_aux *dp_aux_get(struct device *dev, struct dp_catalog *catalog,
+			      bool is_edp)
 {
 	struct dp_aux_private *aux;
 
@@ -506,6 +524,7 @@ struct drm_dp_aux *dp_aux_get(struct device *dev, struct dp_catalog *catalog)
 
 	init_completion(&aux->comp);
 	aux->cmd_busy = false;
+	aux->is_edp = is_edp;
 	mutex_init(&aux->mutex);
 
 	aux->dev = dev;
diff --git a/drivers/gpu/drm/msm/dp/dp_aux.h b/drivers/gpu/drm/msm/dp/dp_aux.h
index 82afc8d..5a50c08 100644
--- a/drivers/gpu/drm/msm/dp/dp_aux.h
+++ b/drivers/gpu/drm/msm/dp/dp_aux.h
@@ -16,7 +16,8 @@ void dp_aux_init(struct drm_dp_aux *dp_aux);
 void dp_aux_deinit(struct drm_dp_aux *dp_aux);
 void dp_aux_reconfig(struct drm_dp_aux *dp_aux);
 
-struct drm_dp_aux *dp_aux_get(struct device *dev, struct dp_catalog *catalog);
+struct drm_dp_aux *dp_aux_get(struct device *dev, struct dp_catalog *catalog,
+			      bool is_edp);
 void dp_aux_put(struct drm_dp_aux *aux);
 
 #endif /*__DP_AUX_H_*/
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index df9670d..0c6a96e 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -242,6 +242,19 @@ void dp_catalog_aux_update_cfg(struct dp_catalog *dp_catalog)
 	phy_calibrate(phy);
 }
 
+int dp_catalog_aux_wait_for_hpd_connect_state(struct dp_catalog *dp_catalog)
+{
+	u32 state;
+	struct dp_catalog_private *catalog = container_of(dp_catalog,
+				struct dp_catalog_private, dp_catalog);
+
+	/* poll for hpd connected status every 2ms and timeout after 500ms */
+	return readl_poll_timeout(catalog->io->dp_controller.aux.base +
+				REG_DP_DP_HPD_INT_STATUS,
+				state, state & DP_DP_HPD_STATE_STATUS_CONNECTED,
+				2000, 500000);
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
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index dea4de9..f197694 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -805,7 +805,7 @@ static int dp_init_sub_modules(struct dp_display_private *dp)
 		goto error;
 	}
 
-	dp->aux = dp_aux_get(dev, dp->catalog);
+	dp->aux = dp_aux_get(dev, dp->catalog, dp->dp_display.is_edp);
 	if (IS_ERR(dp->aux)) {
 		rc = PTR_ERR(dp->aux);
 		DRM_ERROR("failed to initialize aux, rc = %d\n", rc);
-- 
2.7.4

