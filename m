Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 570176DE4E6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Apr 2023 21:22:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229491AbjDKTWw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Apr 2023 15:22:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229503AbjDKTWt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Apr 2023 15:22:49 -0400
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B4D149D4
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Apr 2023 12:22:22 -0700 (PDT)
Received: by mail-yb1-xb2b.google.com with SMTP id z9so9370310ybs.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Apr 2023 12:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1681240938; x=1683832938;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JFo0f1Sr1+yQ3QLGhxacntBMMbw5RN6UTvDoJXnJ62I=;
        b=TZaKx2rXjMc21Y4my2mBA4jL0jyAer+mbqDp8QoGtRjrNGem9TlX1fVPhTssc/Px8H
         tW2S0kiDgvMDS+Axm3/dirG8aRVg1MbRrM4gUd1a3FeP4Nqmv5Xuv1RUfvRPlUVMjIzm
         1/TZIiL5uUVgJR5P0wGplJYy5qPd4D8Yjg2c4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681240938; x=1683832938;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JFo0f1Sr1+yQ3QLGhxacntBMMbw5RN6UTvDoJXnJ62I=;
        b=wha5dqe1o+8W2USj9Q+6vT9swLGobFjRC1QXD0+j8h++ZN1Skr9JwmAvZU7gI9qZFm
         NeLsn0ASlZ9l/5J3qjHCJWHJTlJ5mzunGzloKw9RBH/02TtqO3fuy+uvSRB2dsl+MDdz
         FsIBJLFJYVPUeDsFzgnVnjJFOmEYboCBWQI7HCuIMp9v6xX3X2Kw62M6SWStb6cTgOmm
         GtiCmJflMZ61t7L5KvWjMlFf1cD2SceJxhmZIjHddbdV8q725QkO2Rbd7LcFUqNcdMZp
         cB3E7X+ZfXmbUzPcJpUtfMzqGN4MLm6OQF41AnjUGEgi6ksYN5N9w4YYdpsqGjRCt2AK
         kxkw==
X-Gm-Message-State: AAQBX9dllqf+7tJVYhAylh+0Uvo/pS40QbCqPjS55K9SQWMG+LHh4PVH
        g0H227kjq14J/ISIROO1+Y5VwA==
X-Google-Smtp-Source: AKy350YewVx7oxQIWCkA3iv9V+QhEdGnsSj/AULCRKYUBlUOrdw8ND56WLkjy17pgkx1IAZ/unzHrQ==
X-Received: by 2002:a25:ae08:0:b0:b73:1eab:1723 with SMTP id a8-20020a25ae08000000b00b731eab1723mr9519126ybj.29.1681240938528;
        Tue, 11 Apr 2023 12:22:18 -0700 (PDT)
Received: from localhost ([2620:0:1035:15:2991:9b76:4e62:65bf])
        by smtp.gmail.com with UTF8SMTPSA id 130-20020a250a88000000b00b8bd10ad9b0sm3847876ybk.11.2023.04.11.12.22.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Apr 2023 12:22:18 -0700 (PDT)
From:   Mark Yacoub <markyacoub@chromium.org>
X-Google-Original-From: Mark Yacoub <markyacoub@google.com>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     seanpaul@chromium.org, suraj.kandpal@intel.com,
        dianders@chromium.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        Stephen Boyd <swboyd@chromium.org>,
        Mark Yacoub <markyacoub@chromium.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v9 10/10] drm/msm: Implement HDCP 1.x using the new drm HDCP helpers
Date:   Tue, 11 Apr 2023 15:21:34 -0400
Message-Id: <20230411192134.508113-11-markyacoub@google.com>
X-Mailer: git-send-email 2.40.0.577.gac1e443424-goog
In-Reply-To: <20230411192134.508113-1-markyacoub@google.com>
References: <20230411192134.508113-1-markyacoub@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Sean Paul <seanpaul@chromium.org>

Add HDCP 1.x support to msm DP bridges using the new HDCP
helpers.

Cc: Stephen Boyd <swboyd@chromium.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
Signed-off-by: Mark Yacoub <markyacoub@chromium.org>

---

Changes in v2:
-Squash [1] into this patch with the following changes (Stephen)
  -Update the sc7180 dtsi file
  -Remove resource names and just use index (Stephen)
Changes in v3:
-Split out the dtsi change from v2 (Stephen)
-Fix set-but-unused warning identified by 0-day
-Fix up a couple of style nits (Stephen)
-Store HDCP key directly in dp_hdcp struct (Stephen)
-Remove wmb in HDCP key initialization, move an_seed (Stephen)
-Use FIELD_PREP for bstatus/bcaps (Stephen)
-#define read_poll_timeout values (Stephen)
-Remove unnecessary parentheses in dp_hdcp_store_ksv_fifo (Stephen)
-Add compatible string for hdcp (Stephen)
-Rename dp_hdcp_write_* functions (Abhinav)
-Add 1us delay between An reads (Abhinav)
-Delete unused dp_hdcp_read_* functions
Changes in v4:
-Rebase on Bjorn's multi-dp patchset
Changes in v5:
-Change return check of drm_hdcp_helper_initialize_dp() (Stephen)
Changes in v6:
-Change the tracking of the state from connector state to bridge as
state as drm_connector_state is no longer tracked and the functionality
has moved to msm_dp_bridge
Changes in v7:
-Use dp bridge to maintain the state with no use for connector
Changes in v8:
-Move the hdcp read/write to dp_catalog
Changes in v9:
-Remove display type specific helper funcs init from driver

 drivers/gpu/drm/msm/Kconfig         |   1 +
 drivers/gpu/drm/msm/Makefile        |   1 +
 drivers/gpu/drm/msm/dp/dp_catalog.c | 156 +++++++++++
 drivers/gpu/drm/msm/dp/dp_catalog.h |  18 ++
 drivers/gpu/drm/msm/dp/dp_debug.c   |  46 +++-
 drivers/gpu/drm/msm/dp/dp_debug.h   |  11 +-
 drivers/gpu/drm/msm/dp/dp_display.c |  39 ++-
 drivers/gpu/drm/msm/dp/dp_display.h |   5 +
 drivers/gpu/drm/msm/dp/dp_drm.c     |  39 ++-
 drivers/gpu/drm/msm/dp/dp_drm.h     |   7 +
 drivers/gpu/drm/msm/dp/dp_hdcp.c    | 389 ++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_hdcp.h    |  33 +++
 drivers/gpu/drm/msm/dp/dp_parser.c  |  14 +
 drivers/gpu/drm/msm/dp/dp_parser.h  |   4 +
 drivers/gpu/drm/msm/dp/dp_reg.h     |  30 ++-
 drivers/gpu/drm/msm/msm_atomic.c    |  19 ++
 16 files changed, 800 insertions(+), 12 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/dp/dp_hdcp.c
 create mode 100644 drivers/gpu/drm/msm/dp/dp_hdcp.h

diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
index 4d8fddbdcd9e0..1c369ca2ea6e3 100644
--- a/drivers/gpu/drm/msm/Kconfig
+++ b/drivers/gpu/drm/msm/Kconfig
@@ -15,6 +15,7 @@ config DRM_MSM
 	select REGULATOR
 	select DRM_DP_AUX_BUS
 	select DRM_DISPLAY_DP_HELPER
+	select DRM_DISPLAY_HDCP_HELPER
 	select DRM_DISPLAY_HELPER
 	select DRM_KMS_HELPER
 	select DRM_PANEL
diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index 7274c41228ed9..a73e7b858af27 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -122,6 +122,7 @@ msm-$(CONFIG_DRM_MSM_DP)+= dp/dp_aux.o \
 	dp/dp_ctrl.o \
 	dp/dp_display.o \
 	dp/dp_drm.o \
+	dp/dp_hdcp.o \
 	dp/dp_hpd.o \
 	dp/dp_link.o \
 	dp/dp_panel.o \
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index 676279d0ca8d9..a1395e0c67d56 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -16,6 +16,8 @@
 #include "dp_catalog.h"
 #include "dp_reg.h"
 
+#include <linux/bitfield.h>
+
 #define POLLING_SLEEP_US			1000
 #define POLLING_TIMEOUT_US			10000
 
@@ -47,6 +49,14 @@
 #define DP_INTERRUPT_STATUS2_MASK \
 	(DP_INTERRUPT_STATUS2 << DP_INTERRUPT_STATUS_MASK_SHIFT)
 
+#define DP_AN_READ_DELAY_US 1
+/* Key offsets based on hdcp_key mmio */
+#define DP_HDCP_KEY_BASE 0x30
+#define DP_HDCP_KEY_MSB(x) (DP_HDCP_KEY_BASE + (x * 8))
+#define DP_HDCP_KEY_LSB(x) (DP_HDCP_KEY_MSB(x) + 4)
+#define DP_HDCP_KEY_VALID 0x170
+#define DP_HDCP_SW_KEY_VALID BIT(0)
+
 struct dp_catalog_private {
 	struct device *dev;
 	struct drm_device *drm_dev;
@@ -133,6 +143,18 @@ static inline void dp_write_link(struct dp_catalog_private *catalog,
 	writel(data, catalog->io->dp_controller.link.base + offset);
 }
 
+static inline void dp_write_hdcp_key(struct dp_catalog_private *catalog,
+				     u32 offset, u32 val)
+{
+	writel(val, catalog->io->dp_controller.hdcp_key.base + offset);
+}
+
+static inline void dp_write_hdcp_tz(struct dp_catalog_private *catalog,
+				    u32 offset, u32 val)
+{
+	writel(val, catalog->io->dp_controller.hdcp_tz.base + offset);
+}
+
 /* aux related catalog functions */
 u32 dp_catalog_aux_read_data(struct dp_catalog *dp_catalog)
 {
@@ -1094,3 +1116,137 @@ void dp_catalog_audio_sfe_level(struct dp_catalog *dp_catalog)
 
 	dp_write_link(catalog, REG_DP_MAINLINK_LEVELS, mainlink_levels);
 }
+
+u32 dp_catalog_hdcp_read_ahb(struct dp_catalog *dp_catalog, u32 offset)
+{
+	struct dp_catalog_private *catalog =
+		container_of(dp_catalog, struct dp_catalog_private, dp_catalog);
+
+	return dp_read_ahb(catalog, offset);
+}
+
+void dp_catalog_hdcp_write_ahb(struct dp_catalog *dp_catalog, u32 offset,
+			       u32 val)
+{
+	struct dp_catalog_private *catalog =
+		container_of(dp_catalog, struct dp_catalog_private, dp_catalog);
+
+	dp_write_ahb(catalog, offset, val);
+}
+
+void dp_catalog_hdcp_disable_hdcp1(struct dp_catalog *dp_catalog)
+{
+	struct dp_catalog_private *catalog =
+		container_of(dp_catalog, struct dp_catalog_private, dp_catalog);
+
+	u32 val = dp_read_ahb(catalog, REG_DP_SW_RESET);
+	dp_write_ahb(catalog, REG_DP_SW_RESET, val | DP_HDCP_SW_RESET);
+
+	/* Disable encryption and disable the HDCP block */
+	dp_write_ahb(catalog, DP_HDCP_CTRL, 0);
+	dp_write_ahb(catalog, REG_DP_SW_RESET, val);
+}
+
+void dp_catalog_hdcp_read_aksv(struct dp_catalog *dp_catalog, u32 *aksv)
+{
+	struct dp_catalog_private *catalog =
+		container_of(dp_catalog, struct dp_catalog_private, dp_catalog);
+
+	aksv[0] = dp_read_aux(catalog, DP_HDCP_RCVPORT_DATA3);
+	aksv[1] = GENMASK(7, 0) & dp_read_aux(catalog, DP_HDCP_RCVPORT_DATA4);
+}
+
+void dp_catalog_hdcp_write_aksv(struct dp_catalog *dp_catalog, u32 *aksv)
+{
+	struct dp_catalog_private *catalog =
+		container_of(dp_catalog, struct dp_catalog_private, dp_catalog);
+	dp_write_aux(catalog, DP_HDCP_SW_LOWER_AKSV, aksv[0]);
+	dp_write_aux(catalog, DP_HDCP_SW_UPPER_AKSV, aksv[1]);
+}
+
+void dp_catalog_hdcp_read_an(struct dp_catalog *dp_catalog, u32 *an)
+{
+	struct dp_catalog_private *catalog =
+		container_of(dp_catalog, struct dp_catalog_private, dp_catalog);
+	/*
+	 * Get An from hardware, for unknown reasons we need to read the reg
+	 * twice to get valid data.
+	 */
+	dp_read_ahb(catalog, DP_HDCP_RCVPORT_DATA5);
+	an[0] = dp_read_ahb(catalog, DP_HDCP_RCVPORT_DATA5);
+
+	udelay(DP_AN_READ_DELAY_US);
+
+	dp_read_ahb(catalog, DP_HDCP_RCVPORT_DATA6);
+	an[1] = dp_read_ahb(catalog, DP_HDCP_RCVPORT_DATA6);
+}
+
+void dp_catalog_hdcp_clear_a_info(struct dp_catalog *dp_catalog)
+{
+	struct dp_catalog_private *catalog =
+		container_of(dp_catalog, struct dp_catalog_private, dp_catalog);
+	dp_write_ahb(catalog, DP_HDCP_RCVPORT_DATA4, 0);
+}
+
+void dp_catalog_hdcp_write_key_words(struct dp_catalog *dp_catalog,
+				     int key_offset, u32 *words)
+{
+	struct dp_catalog_private *catalog =
+		container_of(dp_catalog, struct dp_catalog_private, dp_catalog);
+
+	dp_write_hdcp_key(catalog, DP_HDCP_KEY_LSB(key_offset), words[0]);
+	dp_write_hdcp_key(catalog, DP_HDCP_KEY_MSB(key_offset), words[1]);
+}
+
+void dp_catalog_hdcp_post_write_key(struct dp_catalog *dp_catalog)
+{
+	struct dp_catalog_private *catalog =
+		container_of(dp_catalog, struct dp_catalog_private, dp_catalog);
+	u64 an_seed = get_random_u64();
+
+	dp_write_hdcp_key(catalog, DP_HDCP_KEY_VALID, DP_HDCP_SW_KEY_VALID);
+
+	dp_write_link(catalog, DP_HDCP_ENTROPY_CTRL0,
+		      FIELD_GET(GENMASK(31, 0), an_seed));
+	dp_write_link(catalog, DP_HDCP_ENTROPY_CTRL1,
+		      FIELD_GET(GENMASK_ULL(63, 32), an_seed));
+}
+
+void dp_catalog_hdcp_hdcp1_store_receiver_info(struct dp_catalog *dp_catalog,
+					       u32 *ksv, u32 status, u8 bcaps)
+{
+	struct dp_catalog_private *catalog =
+		container_of(dp_catalog, struct dp_catalog_private, dp_catalog);
+
+	u32 val;
+
+	dp_write_hdcp_tz(catalog, HDCP_SEC_DP_TZ_HV_HLOS_HDCP_RCVPORT_DATA0,
+			 ksv[0]);
+	dp_write_hdcp_tz(catalog, HDCP_SEC_DP_TZ_HV_HLOS_HDCP_RCVPORT_DATA1,
+			 ksv[1]);
+
+	val = FIELD_PREP(GENMASK(23, 8), status) |
+	      FIELD_PREP(GENMASK(7, 0), bcaps);
+
+	dp_write_hdcp_tz(catalog, HDCP_SEC_DP_TZ_HV_HLOS_HDCP_RCVPORT_DATA12,
+			 val);
+}
+
+void dp_catalog_hdcp_reset_sha_comp_block(struct dp_catalog *dp_catalog)
+{
+	struct dp_catalog_private *catalog =
+		container_of(dp_catalog, struct dp_catalog_private, dp_catalog);
+
+	dp_write_hdcp_tz(catalog, HDCP_SEC_DP_TZ_HV_HLOS_HDCP_SHA_CTRL,
+			 DP_HDCP_SHA_CTRL_RESET);
+	dp_write_hdcp_tz(catalog, HDCP_SEC_DP_TZ_HV_HLOS_HDCP_SHA_CTRL, 0);
+}
+
+void dp_catalog_hdcp_write_tz(struct dp_catalog *dp_catalog, u32 offset,
+			      u32 val)
+{
+	struct dp_catalog_private *catalog =
+		container_of(dp_catalog, struct dp_catalog_private, dp_catalog);
+
+	dp_write_hdcp_tz(catalog, offset, val);
+}
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
index 1f717f45c1158..565dbe3d802e3 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.h
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
@@ -135,4 +135,22 @@ void dp_catalog_audio_config_sdp(struct dp_catalog *catalog);
 void dp_catalog_audio_init(struct dp_catalog *catalog);
 void dp_catalog_audio_sfe_level(struct dp_catalog *catalog);
 
+/* HDCP APIs */
+u32 dp_catalog_hdcp_read_ahb(struct dp_catalog *dp_catalog, u32 offset);
+void dp_catalog_hdcp_write_ahb(struct dp_catalog *dp_catalog, u32 offset,
+			       u32 val);
+void dp_catalog_hdcp_disable_hdcp1(struct dp_catalog *dp_catalog);
+void dp_catalog_hdcp_read_aksv(struct dp_catalog *dp_catalog, u32 *aksv);
+void dp_catalog_hdcp_write_aksv(struct dp_catalog *dp_catalog, u32 *aksv);
+void dp_catalog_hdcp_read_an(struct dp_catalog *dp_catalog, u32 *an);
+void dp_catalog_hdcp_clear_a_info(struct dp_catalog *dp_catalog);
+void dp_catalog_hdcp_write_key_words(struct dp_catalog *dp_catalog,
+				     int key_offset, u32 *words);
+void dp_catalog_hdcp_post_write_key(struct dp_catalog *dp_catalog);
+void dp_catalog_hdcp_hdcp1_store_receiver_info(struct dp_catalog *dp_catalog,
+					       u32 *ksv, u32 status, u8 bcaps);
+void dp_catalog_hdcp_reset_sha_comp_block(struct dp_catalog *dp_catalog);
+void dp_catalog_hdcp_write_tz(struct dp_catalog *dp_catalog, u32 offset,
+			      u32 val);
+
 #endif /* _DP_CATALOG_H_ */
diff --git a/drivers/gpu/drm/msm/dp/dp_debug.c b/drivers/gpu/drm/msm/dp/dp_debug.c
index 5e35033ba3e43..bfef65b0c0f92 100644
--- a/drivers/gpu/drm/msm/dp/dp_debug.c
+++ b/drivers/gpu/drm/msm/dp/dp_debug.c
@@ -8,6 +8,7 @@
 #include <linux/debugfs.h>
 #include <drm/drm_connector.h>
 #include <drm/drm_file.h>
+#include <drm/display/drm_hdcp_helper.h>
 
 #include "dp_parser.h"
 #include "dp_catalog.h"
@@ -15,6 +16,7 @@
 #include "dp_ctrl.h"
 #include "dp_debug.h"
 #include "dp_display.h"
+#include "dp_hdcp.h"
 
 #define DEBUG_NAME "msm_dp"
 
@@ -25,6 +27,7 @@ struct dp_debug_private {
 	struct dp_link *link;
 	struct dp_panel *panel;
 	struct drm_connector *connector;
+	struct dp_hdcp *hdcp;
 	struct device *dev;
 	struct drm_device *drm_dev;
 
@@ -196,6 +199,35 @@ static int dp_test_active_open(struct inode *inode,
 			inode->i_private);
 }
 
+static ssize_t dp_hdcp_key_write(struct file *file, const char __user *ubuf,
+				 size_t len, loff_t *offp)
+{
+	char *input_buffer;
+	int ret;
+	struct dp_debug_private *debug = file->private_data;
+
+	if (len != (DRM_HDCP_KSV_LEN + DP_HDCP_NUM_KEYS * DP_HDCP_KEY_LEN))
+		return -EINVAL;
+
+	if (!debug->hdcp)
+		return -ENOENT;
+
+	input_buffer = memdup_user_nul(ubuf, len);
+	if (IS_ERR(input_buffer))
+		return PTR_ERR(input_buffer);
+
+	ret = dp_hdcp_ingest_key(debug->hdcp, input_buffer, len);
+
+	kfree(input_buffer);
+	if (ret < 0) {
+		DRM_ERROR("Could not ingest HDCP key, ret=%d\n", ret);
+		return ret;
+	}
+
+	*offp += len;
+	return len;
+}
+
 static const struct file_operations test_active_fops = {
 	.owner = THIS_MODULE,
 	.open = dp_test_active_open,
@@ -205,6 +237,12 @@ static const struct file_operations test_active_fops = {
 	.write = dp_test_active_write
 };
 
+static const struct file_operations dp_hdcp_key_fops = {
+	.owner = THIS_MODULE,
+	.open = simple_open,
+	.write = dp_hdcp_key_write,
+};
+
 static void dp_debug_init(struct dp_debug *dp_debug, struct drm_minor *minor)
 {
 	char path[64];
@@ -229,11 +267,14 @@ static void dp_debug_init(struct dp_debug *dp_debug, struct drm_minor *minor)
 	debugfs_create_file("msm_dp_test_type", 0444,
 			debug->root,
 			debug, &dp_test_type_fops);
+
+	debugfs_create_file("msm_dp_hdcp_key", 0222, minor->debugfs_root, debug,
+			    &dp_hdcp_key_fops);
 }
 
 struct dp_debug *dp_debug_get(struct device *dev, struct dp_panel *panel,
-		struct dp_usbpd *usbpd, struct dp_link *link,
-		struct drm_connector *connector, struct drm_minor *minor)
+			      struct dp_usbpd *usbpd, struct dp_link *link, struct dp_hdcp *hdcp,
+			      struct drm_connector *connector, struct drm_minor *minor)
 {
 	struct dp_debug_private *debug;
 	struct dp_debug *dp_debug;
@@ -255,6 +296,7 @@ struct dp_debug *dp_debug_get(struct device *dev, struct dp_panel *panel,
 	debug->usbpd = usbpd;
 	debug->link = link;
 	debug->panel = panel;
+	debug->hdcp = hdcp;
 	debug->dev = dev;
 	debug->drm_dev = minor->dev;
 	debug->connector = connector;
diff --git a/drivers/gpu/drm/msm/dp/dp_debug.h b/drivers/gpu/drm/msm/dp/dp_debug.h
index 8c0d0b5178fdf..ab6c5e8e5ea63 100644
--- a/drivers/gpu/drm/msm/dp/dp_debug.h
+++ b/drivers/gpu/drm/msm/dp/dp_debug.h
@@ -6,6 +6,7 @@
 #ifndef _DP_DEBUG_H_
 #define _DP_DEBUG_H_
 
+#include "dp_hdcp.h"
 #include "dp_panel.h"
 #include "dp_link.h"
 
@@ -34,6 +35,7 @@ struct dp_debug {
  * @panel: instance of panel module
  * @usbpd: instance of usbpd module
  * @link: instance of link module
+ * @hdcp: instance of hdcp module
  * @connector: double pointer to display connector
  * @minor: pointer to drm minor number after device registration
  * return: pointer to allocated debug module data
@@ -42,9 +44,10 @@ struct dp_debug {
  * for debugfs input to be communicated with existing modules
  */
 struct dp_debug *dp_debug_get(struct device *dev, struct dp_panel *panel,
-		struct dp_usbpd *usbpd, struct dp_link *link,
-		struct drm_connector *connector,
-		struct drm_minor *minor);
+			      struct dp_usbpd *usbpd, struct dp_link *link,
+			      struct dp_hdcp *hdcp,
+			      struct drm_connector *connector,
+			      struct drm_minor *minor);
 
 /**
  * dp_debug_put()
@@ -59,7 +62,7 @@ void dp_debug_put(struct dp_debug *dp_debug);
 
 static inline
 struct dp_debug *dp_debug_get(struct device *dev, struct dp_panel *panel,
-		struct dp_usbpd *usbpd, struct dp_link *link,
+		struct dp_usbpd *usbpd, struct dp_link *link, struct dp_hdcp *hdcp,
 		struct drm_connector *connector, struct drm_minor *minor)
 {
 	return ERR_PTR(-EINVAL);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index bde1a7ce442ff..7c90d7cefedbc 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -27,6 +27,7 @@
 #include "dp_drm.h"
 #include "dp_audio.h"
 #include "dp_debug.h"
+#include "dp_hdcp.h"
 
 #define HPD_STRING_SIZE 30
 
@@ -97,6 +98,7 @@ struct dp_display_private {
 	struct dp_panel   *panel;
 	struct dp_ctrl    *ctrl;
 	struct dp_debug   *debug;
+	struct dp_hdcp *hdcp;
 
 	struct dp_usbpd_cb usbpd_cb;
 	struct dp_display_mode dp_mode;
@@ -190,6 +192,14 @@ static struct dp_display_private *dev_get_dp_display_private(struct device *dev)
 	return container_of(dp, struct dp_display_private, dp_display);
 }
 
+struct dp_hdcp *dp_display_bridge_to_hdcp(struct drm_bridge *bridge)
+{
+	struct msm_dp *dp_display = msm_dp_from_bridge(bridge);
+	struct dp_display_private *dp =
+		container_of(dp_display, struct dp_display_private, dp_display);
+	return dp->hdcp;
+}
+
 static int dp_add_event(struct dp_display_private *dp_priv, u32 event,
 						u32 data, u32 delay)
 {
@@ -752,6 +762,7 @@ static int dp_irq_hpd_handle(struct dp_display_private *dp, u32 data)
 static void dp_display_deinit_sub_modules(struct dp_display_private *dp)
 {
 	dp_debug_put(dp->debug);
+	dp_hdcp_put(dp->hdcp);
 	dp_audio_put(dp->audio);
 	dp_panel_put(dp->panel);
 	dp_aux_put(dp->aux);
@@ -852,8 +863,18 @@ static int dp_init_sub_modules(struct dp_display_private *dp)
 	dp->ctrl->wide_bus_en = dp->wide_bus_en;
 	dp->catalog->wide_bus_en = dp->wide_bus_en;
 
+	dp->hdcp = dp_hdcp_get(dp->parser, dp->aux);
+	if (IS_ERR(dp->hdcp)) {
+		rc = PTR_ERR(dp->hdcp);
+		DRM_ERROR("failed to initialize hdcp, rc = %d\n", rc);
+		dp->hdcp = NULL;
+		goto error_hdcp;
+	}
+
 	return rc;
 
+error_hdcp:
+	dp_audio_put(dp->audio);
 error_ctrl:
 	dp_panel_put(dp->panel);
 error_link:
@@ -965,6 +986,15 @@ int dp_display_set_plugged_cb(struct msm_dp *dp_display,
 	return 0;
 }
 
+void dp_display_hdcp_commit(struct msm_dp *dp, struct drm_atomic_state *state)
+{
+	struct dp_display_private *dp_display =
+		container_of(dp, struct dp_display_private, dp_display);
+
+	if (dp_display->hdcp)
+		dp_hdcp_commit(dp_display->hdcp, state);
+}
+
 /**
  * dp_bridge_mode_valid - callback to determine if specified mode is valid
  * @bridge: Pointer to drm bridge structure
@@ -1528,7 +1558,7 @@ void msm_dp_debugfs_init(struct msm_dp *dp_display, struct drm_minor *minor)
 	dev = &dp->pdev->dev;
 
 	dp->debug = dp_debug_get(dev, dp->panel, dp->usbpd,
-					dp->link, dp->dp_display.connector,
+					dp->link, dp->hdcp, dp->dp_display.connector,
 					minor);
 	if (IS_ERR(dp->debug)) {
 		rc = PTR_ERR(dp->debug);
@@ -1649,6 +1679,13 @@ int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
 
 	dp_priv->panel->connector = dp_display->connector;
 
+	ret = dp_hdcp_attach(dp_priv->hdcp, dp_display->connector,
+			     dp_display->bridge, dp_priv->catalog);
+	if (ret) {
+		DRM_ERROR("Failed to attach hdcp, ret=%d\n", ret);
+		return ret;
+	}
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index 371337d0fae26..1d64b86b0b354 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -31,8 +31,13 @@ struct msm_dp {
 	struct dp_audio *dp_audio;
 };
 
+struct drm_atomic_state;
+
 int dp_display_set_plugged_cb(struct msm_dp *dp_display,
 		hdmi_codec_plugged_cb fn, struct device *codec_dev);
+struct dp_hdcp *dp_display_bridge_to_hdcp(struct drm_bridge *bridge);
+void dp_display_hdcp_commit(struct msm_dp *dp_display,
+			    struct drm_atomic_state *state);
 int dp_display_get_modes(struct msm_dp *dp_display);
 int dp_display_request_irq(struct msm_dp *dp_display);
 bool dp_display_check_video_test(struct msm_dp *dp_display);
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index 275370f211159..6bf3b224ccaef 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -7,11 +7,19 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_bridge_connector.h>
+#include <drm/drm_connector.h>
 #include <drm/drm_crtc.h>
+#include <drm/display/drm_hdcp_helper.h>
 
 #include "msm_drv.h"
 #include "msm_kms.h"
 #include "dp_drm.h"
+#include "dp_hdcp.h"
+
+struct msm_dp *msm_dp_from_bridge(struct drm_bridge *bridge)
+{
+	return to_dp_bridge(bridge)->dp_display;
+}
 
 /**
  * dp_bridge_detect - callback to determine if connector is connected
@@ -37,8 +45,8 @@ static int dp_bridge_atomic_check(struct drm_bridge *bridge,
 			    struct drm_connector_state *conn_state)
 {
 	struct msm_dp *dp;
-
-	dp = to_dp_bridge(bridge)->dp_display;
+	struct msm_dp_bridge *dp_bridge = to_dp_bridge(bridge);
+	dp = dp_bridge->dp_display;
 
 	drm_dbg_dp(dp->drm_dev, "is_connected = %s\n",
 		(dp->is_connected) ? "true" : "false");
@@ -54,8 +62,11 @@ static int dp_bridge_atomic_check(struct drm_bridge *bridge,
 	 * disabled by the hardware and thus all access to it should be forbidden.
 	 * After that this piece of code can be removed.
 	 */
-	if (bridge->ops & DRM_BRIDGE_OP_HPD)
-		return (dp->is_connected) ? 0 : -ENOTCONN;
+	if (bridge->ops & DRM_BRIDGE_OP_HPD && !dp->is_connected)
+		return -ENOTCONN;
+
+	dp_bridge->hdcp_transition =
+		drm_hdcp_has_changed(conn_state->connector, conn_state->state);
 
 	return 0;
 }
@@ -107,6 +118,25 @@ static const struct drm_bridge_funcs dp_bridge_ops = {
 	.hpd_notify   = dp_bridge_hpd_notify,
 };
 
+bool dp_drm_is_bridge_msm_dp(struct drm_bridge *bridge)
+{
+	return bridge->funcs == &dp_bridge_ops;
+}
+
+void dp_drm_atomic_commit(struct drm_bridge *bridge,
+			  struct drm_atomic_state *state)
+{
+	struct msm_dp_bridge *dp_bridge = to_dp_bridge(bridge);
+	struct msm_dp *dp_disp;
+
+	if (!dp_bridge->hdcp_transition)
+		return;
+
+	dp_disp = msm_dp_from_bridge(bridge);
+
+	dp_display_hdcp_commit(dp_disp, state);
+}
+
 struct drm_bridge *dp_bridge_init(struct msm_dp *dp_display, struct drm_device *dev,
 			struct drm_encoder *encoder)
 {
@@ -119,6 +149,7 @@ struct drm_bridge *dp_bridge_init(struct msm_dp *dp_display, struct drm_device *
 		return ERR_PTR(-ENOMEM);
 
 	dp_bridge->dp_display = dp_display;
+	dp_bridge->hdcp_transition = false;
 
 	bridge = &dp_bridge->bridge;
 	bridge->funcs = &dp_bridge_ops;
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.h b/drivers/gpu/drm/msm/dp/dp_drm.h
index 250f7c66201f2..9b3f81cf2e139 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.h
+++ b/drivers/gpu/drm/msm/dp/dp_drm.h
@@ -15,11 +15,18 @@
 struct msm_dp_bridge {
 	struct drm_bridge bridge;
 	struct msm_dp *dp_display;
+	bool hdcp_transition;
 };
 
 #define to_dp_bridge(x)     container_of((x), struct msm_dp_bridge, bridge)
 
+struct msm_dp *msm_dp_from_bridge(struct drm_bridge *bridge);
+
 struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display, struct drm_encoder *encoder);
+bool dp_drm_is_bridge_msm_dp(struct drm_bridge *bridge);
+void dp_drm_atomic_commit(struct drm_bridge *bridge,
+			  struct drm_atomic_state *state);
+
 struct drm_bridge *dp_bridge_init(struct msm_dp *dp_display, struct drm_device *dev,
 			struct drm_encoder *encoder);
 
diff --git a/drivers/gpu/drm/msm/dp/dp_hdcp.c b/drivers/gpu/drm/msm/dp/dp_hdcp.c
new file mode 100644
index 0000000000000..191340971f943
--- /dev/null
+++ b/drivers/gpu/drm/msm/dp/dp_hdcp.c
@@ -0,0 +1,389 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright (C) 2023 Google, Inc.
+ *
+ * Authors:
+ * Sean Paul <seanpaul@chromium.org>
+ */
+
+#include "dp_display.h"
+#include "dp_drm.h"
+#include "dp_hdcp.h"
+#include "dp_reg.h"
+
+#include <drm/drm_connector.h>
+#include <drm/drm_device.h>
+#include <drm/display/drm_dp_helper.h>
+#include <drm/display/drm_hdcp_helper.h>
+#include <drm/drm_print.h>
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/iopoll.h>
+#include <linux/mutex.h>
+#include <linux/random.h>
+#include <linux/slab.h>
+
+/* Timeouts */
+#define DP_KEYS_VALID_SLEEP_US (20 * 1000)
+#define DP_KEYS_VALID_TIMEOUT_US (100 * 1000)
+#define DP_AN_READY_SLEEP_US 100
+#define DP_AN_READY_TIMEOUT_US (10 * 1000)
+#define DP_R0_READY_SLEEP_US 100
+#define DP_R0_READY_TIMEOUT_US (10 * 1000)
+#define DP_RI_MATCH_SLEEP_US (20 * 1000)
+#define DP_RI_MATCH_TIMEOUT_US (100 * 1000)
+#define DP_KSV_WRITTEN_SLEEP_US 100
+#define DP_KSV_WRITTEN_TIMEOUT_US (100 * 1000)
+#define DP_SHA_COMPUTATION_SLEEP_US 100
+#define DP_SHA_COMPUTATION_TIMEOUT_US (100 * 1000)
+
+/*
+ * dp_hdcp_key - structure which contains an HDCP key set
+ * @ksv: The key selection vector
+ * @keys: Contains 40 keys
+ */
+struct dp_hdcp_key {
+	struct drm_hdcp_ksv ksv;
+	union {
+		u32 words[2];
+		u8 bytes[DP_HDCP_KEY_LEN];
+	} keys[DP_HDCP_NUM_KEYS];
+	bool valid;
+};
+
+struct dp_hdcp {
+	struct drm_device *dev;
+	struct drm_connector *connector;
+
+	struct drm_dp_aux *aux;
+	struct dp_parser *parser;
+
+	struct drm_hdcp_helper_data *helper_data;
+
+	struct mutex key_lock;
+	struct dp_hdcp_key key;
+
+	struct dp_catalog *catalog;
+};
+
+int dp_hdcp_ingest_key(struct dp_hdcp *hdcp, const u8 *raw_key, int raw_len)
+{
+	unsigned int ksv_weight;
+	int i, ret = 0;
+	int expected_len =
+		DRM_HDCP_KSV_LEN + DP_HDCP_NUM_KEYS * DP_HDCP_KEY_LEN;
+
+	if (raw_len != expected_len) {
+		DRM_ERROR("Invalid HDCP key length expected=%d actual=%d\n",
+			  expected_len, raw_len);
+		return -EINVAL;
+	}
+
+	mutex_lock(&hdcp->key_lock);
+
+	memcpy(hdcp->key.ksv.bytes, raw_key, DRM_HDCP_KSV_LEN);
+	ksv_weight = hweight32(hdcp->key.ksv.words[0]) +
+		     hweight32(hdcp->key.ksv.words[1]);
+	if (ksv_weight != 20) {
+		DRM_ERROR("Invalid ksv weight, expected=20 actual=%d\n",
+			  ksv_weight);
+		ret = -EINVAL;
+		goto out;
+	}
+
+	raw_key += DRM_HDCP_KSV_LEN;
+	for (i = 0; i < DP_HDCP_NUM_KEYS; i++) {
+		memcpy(hdcp->key.keys[i].bytes, raw_key, DP_HDCP_KEY_LEN);
+		raw_key += DP_HDCP_KEY_LEN;
+	}
+
+	DRM_DEBUG_DRIVER("Successfully ingested HDCP key\n");
+	hdcp->key.valid = true;
+
+out:
+	mutex_unlock(&hdcp->key_lock);
+	return ret;
+}
+
+static bool dp_hdcp_are_keys_valid(struct drm_connector *connector,
+				   void *driver_data)
+{
+	struct drm_bridge *bridge = (struct drm_bridge *)driver_data;
+	struct dp_hdcp *hdcp = dp_display_bridge_to_hdcp(bridge);
+	u32 val;
+
+	val = dp_catalog_hdcp_read_ahb(hdcp->catalog, DP_HDCP_STATUS);
+	return FIELD_GET(DP_HDCP_KEY_STATUS, val) == DP_HDCP_KEY_STATUS_VALID;
+}
+
+static int dp_hdcp_load_keys(struct drm_connector *connector, void *driver_data)
+{
+	struct drm_bridge *bridge = (struct drm_bridge *)driver_data;
+	struct dp_hdcp *hdcp = dp_display_bridge_to_hdcp(bridge);
+	int i, ret = 0;
+
+	mutex_lock(&hdcp->key_lock);
+
+	if (!hdcp->key.valid) {
+		ret = -ENOENT;
+		goto out;
+	}
+
+	dp_catalog_hdcp_write_aksv(hdcp->catalog, hdcp->key.ksv.words);
+
+
+	for (i = 0; i < DP_HDCP_NUM_KEYS; i++) {
+		dp_catalog_hdcp_write_key_words(hdcp->catalog, i,
+						hdcp->key.keys[i].words);
+	}
+	dp_catalog_hdcp_post_write_key(hdcp->catalog);
+
+out:
+	mutex_unlock(&hdcp->key_lock);
+	return ret;
+}
+
+static int dp_hdcp_hdcp2_capable(struct drm_connector *connector, bool *capable,
+				 void *driver_data)
+{
+	*capable = false;
+	return 0;
+}
+
+static int dp_hdcp_hdcp1_read_an_aksv(struct drm_connector *connector, u32 *an,
+				      u32 *aksv, void *driver_data)
+{
+	struct drm_bridge *bridge = (struct drm_bridge *)driver_data;
+	struct dp_hdcp *hdcp = dp_display_bridge_to_hdcp(bridge);
+	bool keys_valid;
+	int ret;
+	u32 val;
+
+	dp_catalog_hdcp_write_ahb(hdcp->catalog, DP_HDCP_CTRL, 1);
+
+	ret = read_poll_timeout(dp_hdcp_are_keys_valid, keys_valid, keys_valid,
+				DP_KEYS_VALID_SLEEP_US,
+				DP_KEYS_VALID_TIMEOUT_US, false, connector,
+				driver_data);
+	if (ret) {
+		drm_err(hdcp->dev, "HDCP keys invalid %d\n", ret);
+		return ret;
+	}
+
+	/* Clear AInfo */
+	dp_catalog_hdcp_clear_a_info(hdcp->catalog);
+
+	dp_catalog_hdcp_read_aksv(hdcp->catalog, aksv);
+
+	ret = read_poll_timeout(dp_catalog_hdcp_read_ahb, val,
+				(val & DP_HDCP_AN_READY_MASK) ==
+					DP_HDCP_AN_READY_MASK,
+				DP_AN_READY_SLEEP_US, DP_AN_READY_TIMEOUT_US,
+				false, hdcp->catalog, DP_HDCP_STATUS);
+	if (ret) {
+		drm_err(hdcp->dev, "AN failed to become ready %x/%d\n", val,
+			ret);
+		return ret;
+	}
+
+	dp_catalog_hdcp_read_an(hdcp->catalog, an);
+
+	return 0;
+}
+
+static int dp_hdcp_hdcp1_store_receiver_info(struct drm_connector *connector,
+					     u32 *ksv, u32 status, u8 bcaps,
+					     bool is_repeater,
+					     void *driver_data)
+{
+	struct drm_bridge *bridge = (struct drm_bridge *)driver_data;
+	struct dp_hdcp *hdcp = dp_display_bridge_to_hdcp(bridge);
+
+	dp_catalog_hdcp_hdcp1_store_receiver_info(hdcp->catalog, ksv, status,
+						  bcaps);
+
+	return 0;
+}
+
+static int dp_hdcp_hdcp1_enable_encryption(struct drm_connector *connector,
+					   void *driver_data)
+{
+	/*
+	 * On Qcom hardware, there is nothing explicit about enabling encryption
+	 * like it is the case in other drivers. It gets enabled by default.
+	 */
+	return 0;
+}
+
+static int dp_hdcp_hdcp1_wait_for_r0(struct drm_connector *connector,
+				     void *driver_data)
+{
+	struct drm_bridge *bridge = (struct drm_bridge *)driver_data;
+	struct dp_hdcp *hdcp = dp_display_bridge_to_hdcp(bridge);
+	int ret;
+	u32 val;
+
+	ret = read_poll_timeout(dp_catalog_hdcp_read_ahb, val,
+				(val & DP_HDCP_R0_READY), DP_R0_READY_SLEEP_US,
+				DP_R0_READY_TIMEOUT_US, false, hdcp->catalog,
+				DP_HDCP_STATUS);
+	if (ret) {
+		drm_err(hdcp->dev, "HDCP R0 not ready %x/%d\n", val, ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int dp_hdcp_hdcp1_match_ri(struct drm_connector *connector, u32 ri_prime,
+				  void *driver_data)
+{
+	struct drm_bridge *bridge = (struct drm_bridge *)driver_data;
+	struct dp_hdcp *hdcp = dp_display_bridge_to_hdcp(bridge);
+	int ret;
+	u32 val;
+
+	dp_catalog_hdcp_write_ahb(hdcp->catalog, DP_HDCP_RCVPORT_DATA2_0,
+				  ri_prime);
+
+	ret = read_poll_timeout(dp_catalog_hdcp_read_ahb, val,
+				(val & DP_HDCP_RI_MATCH), DP_RI_MATCH_SLEEP_US,
+				DP_RI_MATCH_TIMEOUT_US, false, hdcp->catalog,
+				DP_HDCP_STATUS);
+	if (ret) {
+		drm_err(hdcp->dev,
+			"Failed to match Ri and Ri` (%08x) %08x/%d\n", ri_prime,
+			val, ret);
+		return ret;
+	}
+	return 0;
+}
+
+static int dp_hdcp_hdcp1_store_ksv_fifo(struct drm_connector *connector,
+					u8 *ksv_fifo, u8 num_downstream,
+					u8 *bstatus, u32 *vprime,
+					void *driver_data)
+{
+	struct drm_bridge *bridge = (struct drm_bridge *)driver_data;
+	struct dp_hdcp *hdcp = dp_display_bridge_to_hdcp(bridge);
+	int num_bytes = num_downstream * DRM_HDCP_KSV_LEN;
+	int ret, i;
+	u32 val;
+
+	dp_catalog_hdcp_reset_sha_comp_block(hdcp->catalog);
+
+	/*
+	 * KSV info gets written a byte at a time in the same order it was
+	 * received. Every 64 bytes, we need to wait for the SHA_BLOCK_DONE
+	 * bit to be set in SHA_CTRL.
+	 */
+	for (i = 0; i < num_bytes; i++) {
+		val = FIELD_PREP(DP_HDCP_SHA_DATA_MASK, ksv_fifo[i]);
+
+		if (i == (num_bytes - 1))
+			val |= DP_HDCP_SHA_DATA_DONE;
+
+		dp_catalog_hdcp_write_tz(hdcp->catalog,
+					 HDCP_SEC_DP_TZ_HV_HLOS_HDCP_SHA_DATA,
+					 val);
+
+		if ((i + 1) % 64 != 0)
+			continue;
+
+		ret = read_poll_timeout(dp_catalog_hdcp_read_ahb, val,
+					(val & DP_HDCP_SHA_DONE),
+					DP_KSV_WRITTEN_SLEEP_US,
+					DP_KSV_WRITTEN_TIMEOUT_US, false,
+					hdcp->catalog, DP_HDCP_SHA_STATUS);
+		if (ret) {
+			drm_err(hdcp->dev, "SHA block incomplete %d\n", ret);
+			return ret;
+		}
+	}
+
+	ret = read_poll_timeout(dp_catalog_hdcp_read_ahb, val,
+				(val & DP_HDCP_SHA_COMP_DONE),
+				DP_SHA_COMPUTATION_SLEEP_US,
+				DP_SHA_COMPUTATION_TIMEOUT_US, false,
+				hdcp->catalog, DP_HDCP_SHA_STATUS);
+	if (ret) {
+		drm_err(hdcp->dev, "SHA computation incomplete %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int dp_hdcp_hdcp1_disable(struct drm_connector *connector,
+				 void *driver_data)
+{
+	struct drm_bridge *bridge = (struct drm_bridge *)driver_data;
+	struct dp_hdcp *hdcp = dp_display_bridge_to_hdcp(bridge);
+	dp_catalog_hdcp_disable_hdcp1(hdcp->catalog);
+	return 0;
+}
+
+void dp_hdcp_commit(struct dp_hdcp *hdcp, struct drm_atomic_state *state)
+{
+	drm_hdcp_helper_atomic_commit(hdcp->helper_data, state, NULL);
+}
+
+static const struct drm_hdcp_helper_funcs dp_hdcp_funcs = {
+	.are_keys_valid = dp_hdcp_are_keys_valid,
+	.load_keys = dp_hdcp_load_keys,
+	.hdcp2_capable = dp_hdcp_hdcp2_capable,
+	.hdcp1_read_an_aksv = dp_hdcp_hdcp1_read_an_aksv,
+	.hdcp1_store_receiver_info = dp_hdcp_hdcp1_store_receiver_info,
+	.hdcp1_enable_encryption = dp_hdcp_hdcp1_enable_encryption,
+	.hdcp1_wait_for_r0 = dp_hdcp_hdcp1_wait_for_r0,
+	.hdcp1_match_ri = dp_hdcp_hdcp1_match_ri,
+	.hdcp1_store_ksv_fifo = dp_hdcp_hdcp1_store_ksv_fifo,
+	.hdcp1_disable = dp_hdcp_hdcp1_disable
+};
+
+int dp_hdcp_attach(struct dp_hdcp *hdcp, struct drm_connector *connector,
+		   struct drm_bridge *bridge, struct dp_catalog *catalog)
+{
+	struct drm_hdcp_helper_data *helper_data;
+
+	/* HDCP is not configured for this device */
+	if (!hdcp->parser->io.dp_controller.hdcp_key.base)
+		return 0;
+
+	helper_data = drm_hdcp_helper_initialize_dp(connector, hdcp->aux,
+						    &dp_hdcp_funcs, false);
+	if (IS_ERR(helper_data))
+		return PTR_ERR(helper_data);
+
+	helper_data->driver_data = bridge;
+	hdcp->dev = connector->dev;
+	hdcp->connector = connector;
+	hdcp->helper_data = helper_data;
+	hdcp->catalog = catalog;
+
+	return 0;
+}
+
+struct dp_hdcp *dp_hdcp_get(struct dp_parser *parser, struct drm_dp_aux *aux)
+{
+	struct device *dev = &parser->pdev->dev;
+	struct dp_hdcp *hdcp;
+
+	hdcp = devm_kzalloc(dev, sizeof(*hdcp), GFP_KERNEL);
+	if (!hdcp)
+		return ERR_PTR(-ENOMEM);
+
+	hdcp->parser = parser;
+	hdcp->aux = aux;
+
+	mutex_init(&hdcp->key_lock);
+
+	return hdcp;
+}
+
+void dp_hdcp_put(struct dp_hdcp *hdcp)
+{
+	if (hdcp)
+		drm_hdcp_helper_destroy(hdcp->helper_data);
+}
diff --git a/drivers/gpu/drm/msm/dp/dp_hdcp.h b/drivers/gpu/drm/msm/dp/dp_hdcp.h
new file mode 100644
index 0000000000000..4586e45d14d26
--- /dev/null
+++ b/drivers/gpu/drm/msm/dp/dp_hdcp.h
@@ -0,0 +1,33 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright (C) 2021 Google, Inc.
+ *
+ * Authors:
+ * Sean Paul <seanpaul@chromium.org>
+ */
+
+#ifndef DP_HDCP_H_
+#define DP_HDCP_H_
+
+#include <drm/display/drm_hdcp_helper.h>
+#include <drm/drm_bridge.h>
+
+#include "dp_catalog.h"
+
+#define DP_HDCP_KEY_LEN 7
+#define DP_HDCP_NUM_KEYS 40
+
+struct dp_hdcp;
+struct dp_parser;
+struct drm_atomic_state;
+struct drm_dp_aux;
+
+struct dp_hdcp *dp_hdcp_get(struct dp_parser *parser, struct drm_dp_aux *aux);
+void dp_hdcp_put(struct dp_hdcp *hdcp);
+
+int dp_hdcp_attach(struct dp_hdcp *hdcp, struct drm_connector *connector,
+		   struct drm_bridge *bridgem, struct dp_catalog *catalog);
+int dp_hdcp_ingest_key(struct dp_hdcp *hdcp, const u8 *raw_key, int raw_len);
+void dp_hdcp_commit(struct dp_hdcp *hdcp, struct drm_atomic_state *state);
+
+#endif /* _DP_HDCP_H_ */
diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
index 7032dcc8842b3..1f9bb001aebc3 100644
--- a/drivers/gpu/drm/msm/dp/dp_parser.c
+++ b/drivers/gpu/drm/msm/dp/dp_parser.c
@@ -39,6 +39,8 @@ static int dp_parser_ctrl_res(struct dp_parser *parser)
 	struct platform_device *pdev = parser->pdev;
 	struct dp_io *io = &parser->io;
 	struct dss_io_data *dss = &io->dp_controller;
+	void __iomem *dss_hdcp_key;
+	size_t dss_hdcp_key_len;
 
 	dss->ahb.base = dp_ioremap(pdev, 0, &dss->ahb.len);
 	if (IS_ERR(dss->ahb.base))
@@ -84,6 +86,18 @@ static int dp_parser_ctrl_res(struct dp_parser *parser)
 		}
 	}
 
+	dss_hdcp_key = dp_ioremap(pdev, 5, &dss_hdcp_key_len);
+	if (!IS_ERR(dss_hdcp_key)) {
+		dss->hdcp_key.base = dss_hdcp_key;
+		dss->hdcp_key.len = dss_hdcp_key_len;
+		dss->hdcp_tz.base = dp_ioremap(pdev, 6, &dss->hdcp_tz.len);
+		if (IS_ERR(dss->hdcp_tz.base)) {
+			DRM_ERROR("unable to remap hdcp_tz region: %pe\n",
+				  dss->hdcp_tz.base);
+			return PTR_ERR(dss->hdcp_tz.base);
+		}
+	}
+
 	io->phy = devm_phy_get(&pdev->dev, "dp");
 	if (IS_ERR(io->phy))
 		return PTR_ERR(io->phy);
diff --git a/drivers/gpu/drm/msm/dp/dp_parser.h b/drivers/gpu/drm/msm/dp/dp_parser.h
index 1f068626d445e..8b5dd3deb85ff 100644
--- a/drivers/gpu/drm/msm/dp/dp_parser.h
+++ b/drivers/gpu/drm/msm/dp/dp_parser.h
@@ -35,6 +35,8 @@ struct dss_io_data {
 	struct dss_io_region aux;
 	struct dss_io_region link;
 	struct dss_io_region p0;
+	struct dss_io_region hdcp_key;
+	struct dss_io_region hdcp_tz;
 };
 
 static inline const char *dp_parser_pm_name(enum dp_pm_type module)
@@ -69,6 +71,8 @@ struct dp_display_data {
  * struct dp_ctrl_resource - controller's IO related data
  *
  * @dp_controller: Display Port controller mapped memory address
+ * @hdcp_key: mapped memory for HDCP key ingestion
+ * @hdcp_tz: mapped memory for HDCP TZ interaction
  * @phy_io: phy's mapped memory address
  */
 struct dp_io {
diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
index 268602803d9a3..d2ac60ce7ae50 100644
--- a/drivers/gpu/drm/msm/dp/dp_reg.h
+++ b/drivers/gpu/drm/msm/dp/dp_reg.h
@@ -10,7 +10,8 @@
 #define REG_DP_HW_VERSION			(0x00000000)
 
 #define REG_DP_SW_RESET				(0x00000010)
-#define DP_SW_RESET				(0x00000001)
+#define DP_SW_RESET 				BIT(0)
+#define DP_HDCP_SW_RESET 			BIT(1)
 
 #define REG_DP_PHY_CTRL				(0x00000014)
 #define DP_PHY_CTRL_SW_RESET_PLL		(0x00000001)
@@ -283,19 +284,46 @@
 /* DP HDCP 1.3 registers */
 #define DP_HDCP_CTRL                                   (0x0A0)
 #define DP_HDCP_STATUS                                 (0x0A4)
+#define DP_HDCP_KEY_STATUS 	    					   GENMASK(18, 16)
+#define DP_HDCP_KEY_STATUS_NO_KEYS 					   0
+#define DP_HDCP_KEY_STATUS_NOT_CHECKED 				   1
+#define DP_HDCP_KEY_STATUS_CHECKING 				   2
+#define DP_HDCP_KEY_STATUS_VALID 					   3
+#define DP_HDCP_KEY_STATUS_INVALID_AKSV 			   4
+#define DP_HDCP_KEY_STATUS_BAD_CHECKSUM 			   5
+#define DP_HDCP_KEY_STATUS_PROD_AKSV 				   6
+#define DP_HDCP_KEY_STATUS_RESV 					   7
+#define DP_HDCP_R0_READY 							   BIT(14)
+#define DP_HDCP_SHA_V_MATCH 						   BIT(13)
+#define DP_HDCP_RI_MATCH 							   BIT(12)
+#define DP_HDCP_AN_MSB_READY 						   BIT(9)
+#define DP_HDCP_AN_LSB_READY 						   BIT(8)
+#define DP_HDCP_AN_READY_MASK 						   (DP_HDCP_AN_MSB_READY | DP_HDCP_AN_LSB_READY)
+#define DP_HDCP_AUTH_FAIL_INFO 						   GENMASK(7, 4)
+#define DP_HDCP_AUTH_FAIL_INVALID_AKSV 				   3
+#define DP_HDCP_AUTH_FAIL_INVALID_BKSV 				   4
+#define DP_HDCP_AUTH_FAIL_RI_MISMATCH 				   5
+#define DP_HDCP_AUTH_FAIL 							   BIT(2)
+#define DP_HDCP_AUTH_SUCCESS 						   BIT(0)
 #define DP_HDCP_SW_UPPER_AKSV                          (0x098)
 #define DP_HDCP_SW_LOWER_AKSV                          (0x09C)
 #define DP_HDCP_ENTROPY_CTRL0                          (0x350)
 #define DP_HDCP_ENTROPY_CTRL1                          (0x35C)
 #define DP_HDCP_SHA_STATUS                             (0x0C8)
+#define DP_HDCP_SHA_COMP_DONE 						   BIT(4)
+#define DP_HDCP_SHA_DONE 							   BIT(0)
 #define DP_HDCP_RCVPORT_DATA2_0                        (0x0B0)
 #define DP_HDCP_RCVPORT_DATA3                          (0x0A4)
 #define DP_HDCP_RCVPORT_DATA4                          (0x0A8)
 #define DP_HDCP_RCVPORT_DATA5                          (0x0C0)
 #define DP_HDCP_RCVPORT_DATA6                          (0x0C4)
+#define DP_HDCP_RCVPORT_DATA7 						   (0x0C8)
 
 #define HDCP_SEC_DP_TZ_HV_HLOS_HDCP_SHA_CTRL           (0x024)
+#define DP_HDCP_SHA_CTRL_RESET 						   BIT(0)
 #define HDCP_SEC_DP_TZ_HV_HLOS_HDCP_SHA_DATA           (0x028)
+#define DP_HDCP_SHA_DATA_MASK 						   GENMASK(23, 16)
+#define DP_HDCP_SHA_DATA_DONE 						   BIT(0)
 #define HDCP_SEC_DP_TZ_HV_HLOS_HDCP_RCVPORT_DATA0      (0x004)
 #define HDCP_SEC_DP_TZ_HV_HLOS_HDCP_RCVPORT_DATA1      (0x008)
 #define HDCP_SEC_DP_TZ_HV_HLOS_HDCP_RCVPORT_DATA7      (0x00C)
diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
index 1686fbb611fd7..f5ca7fab083d2 100644
--- a/drivers/gpu/drm/msm/msm_atomic.c
+++ b/drivers/gpu/drm/msm/msm_atomic.c
@@ -5,8 +5,11 @@
  */
 
 #include <drm/drm_atomic_uapi.h>
+#include <drm/drm_bridge.h>
+#include <drm/drm_device.h>
 #include <drm/drm_vblank.h>
 
+#include "dp_drm.h"
 #include "msm_atomic_trace.h"
 #include "msm_drv.h"
 #include "msm_gem.h"
@@ -179,6 +182,20 @@ static unsigned get_crtc_mask(struct drm_atomic_state *state)
 	return mask;
 }
 
+static void msm_atomic_commit_connectors(struct drm_atomic_state *state)
+{
+	struct drm_device *dev = state->dev;
+	struct msm_drm_private *priv = dev->dev_private;
+	int i;
+
+	for (i = 0; i < priv->num_bridges; ++i) {
+		struct drm_bridge *bridge = priv->bridges[i];
+		if (dp_drm_is_bridge_msm_dp(bridge)) {
+			dp_drm_atomic_commit(bridge, state);
+		}
+	}
+}
+
 void msm_atomic_commit_tail(struct drm_atomic_state *state)
 {
 	struct drm_device *dev = state->dev;
@@ -215,6 +232,8 @@ void msm_atomic_commit_tail(struct drm_atomic_state *state)
 	drm_atomic_helper_commit_planes(dev, state, 0);
 	drm_atomic_helper_commit_modeset_enables(dev, state);
 
+	msm_atomic_commit_connectors(state);
+
 	if (async) {
 		struct msm_pending_timer *timer =
 			&kms->pending_timers[drm_crtc_index(async_crtc)];
-- 
2.40.0.577.gac1e443424-goog

