Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3E80243E33
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Aug 2020 19:22:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726526AbgHMRWP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Aug 2020 13:22:15 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:62456 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726248AbgHMRWM (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Aug 2020 13:22:12 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1597339329; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=qIKdgkUYUFkWOtgvjg89xZEbX4aY5JyJX1B+6+jKJ0w=; b=l2NfQcH+sPRKrKo9n3XEAqACFCatLQu8UYGOrr1RaB5asVm33IzsrQGKC8qSMK9sGAC1mGLS
 qVMAZWMk2crSxMcp6KR2/R0C59ZPFlc206lgOPAfGFOsgDXPHzRbslDlEqtVbPkOsCjPARnA
 TEmGQJlb7v+oUAv7rzcHiZAaV5I=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n09.prod.us-east-1.postgun.com with SMTP id
 5f3576c1247ccc308c288694 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 13 Aug 2020 17:22:09
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 1424CC433CB; Thu, 13 Aug 2020 17:22:08 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from abhinavk-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id DDE79C433C9;
        Thu, 13 Aug 2020 17:22:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org DDE79C433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=abhinavk@codeaurora.org
From:   Abhinav Kumar <abhinavk@codeaurora.org>
To:     dri-devel@lists.freedesktop.org
Cc:     Abhinav Kumar <abhinavk@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, robdclark@gmail.com,
        seanpaul@chromium.org, swboyd@chromium.org, nganji@codeaurora.org,
        aravindh@codeaurora.org, tanmay@codeaurora.org,
        cychiang@chromium.org, khsieh@codeaurora.org,
        vsujithk@codeaurora.org, rohitkr@codeaurora.org
Subject: [PATCH v2 2/4] drm/msm/dp: add audio support for Display Port on MSM
Date:   Thu, 13 Aug 2020 10:21:52 -0700
Message-Id: <20200813172154.24565-3-abhinavk@codeaurora.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200813172154.24565-1-abhinavk@codeaurora.org>
References: <20200813172154.24565-1-abhinavk@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Introduce audio support for Display Port on MSM chipsets.
This change integrates DP audio sub-module with the main
Display Port platform driver.

In addition, this change leverages hdmi_codec_ops to expose
the operations to the audio driver.

Changes in v2: fix up a compilation issue on drm-next branch

Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
---
 drivers/gpu/drm/msm/Makefile                |   3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |   6 +
 drivers/gpu/drm/msm/dp/dp_audio.c           | 583 ++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_audio.h           |  72 +++
 drivers/gpu/drm/msm/dp/dp_catalog.c         | 192 +++++++
 drivers/gpu/drm/msm/dp/dp_catalog.h         |  29 +
 drivers/gpu/drm/msm/dp/dp_display.c         |  48 ++
 drivers/gpu/drm/msm/dp/dp_display.h         |   2 +
 8 files changed, 934 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/msm/dp/dp_audio.c
 create mode 100644 drivers/gpu/drm/msm/dp/dp_audio.h

diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index 6d31188cc776..db1bdd35bbf5 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -111,7 +111,8 @@ msm-$(CONFIG_DRM_MSM_DP)+= dp/dp_aux.o \
 	dp/dp_parser.o \
 	dp/dp_power.o \
 	dp/dp_pll.o \
-	dp/dp_pll_10nm.o
+	dp/dp_pll_10nm.o \
+	dp/dp_audio.o
 
 msm-$(CONFIG_DRM_FBDEV_EMULATION) += msm_fbdev.o
 msm-$(CONFIG_COMMON_CLK) += disp/mdp4/mdp4_lvds_pll.o
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index fe0d538099f9..e6940293086a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1077,6 +1077,12 @@ static void _dpu_encoder_virt_enable_helper(struct drm_encoder *drm_enc)
 		return;
 	}
 
+	if (dpu_enc->disp_info.intf_type == DRM_MODE_CONNECTOR_DisplayPort &&
+		dpu_enc->cur_master->hw_mdptop &&
+		dpu_enc->cur_master->hw_mdptop->ops.intf_audio_select)
+		dpu_enc->cur_master->hw_mdptop->ops.intf_audio_select(
+			dpu_enc->cur_master->hw_mdptop);
+
 	if (dpu_enc->cur_master->hw_mdptop &&
 			dpu_enc->cur_master->hw_mdptop->ops.reset_ubwc)
 		dpu_enc->cur_master->hw_mdptop->ops.reset_ubwc(
diff --git a/drivers/gpu/drm/msm/dp/dp_audio.c b/drivers/gpu/drm/msm/dp/dp_audio.c
new file mode 100644
index 000000000000..75556eea1059
--- /dev/null
+++ b/drivers/gpu/drm/msm/dp/dp_audio.c
@@ -0,0 +1,583 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2016-2020, The Linux Foundation. All rights reserved.
+ */
+
+
+#define pr_fmt(fmt)	"[drm-dp] %s: " fmt, __func__
+
+#include <linux/of_platform.h>
+
+#include <drm/drm_dp_helper.h>
+#include <drm/drm_edid.h>
+#include <sound/hdmi-codec.h>
+
+#include "dp_catalog.h"
+#include "dp_audio.h"
+#include "dp_panel.h"
+#include "dp_display.h"
+
+#define HEADER_BYTE_2_BIT	 0
+#define PARITY_BYTE_2_BIT	 8
+#define HEADER_BYTE_1_BIT	16
+#define PARITY_BYTE_1_BIT	24
+#define HEADER_BYTE_3_BIT	16
+#define PARITY_BYTE_3_BIT	24
+
+struct dp_audio_private {
+	struct platform_device *audio_pdev;
+	struct platform_device *pdev;
+	struct dp_catalog *catalog;
+	struct dp_panel *panel;
+
+	bool engine_on;
+	u32 channels;
+
+	struct dp_audio dp_audio;
+};
+
+static u8 dp_audio_get_g0_value(u8 data)
+{
+	u8 c[4];
+	u8 g[4];
+	u8 ret_data = 0;
+	u8 i;
+
+	for (i = 0; i < 4; i++)
+		c[i] = (data >> i) & 0x01;
+
+	g[0] = c[3];
+	g[1] = c[0] ^ c[3];
+	g[2] = c[1];
+	g[3] = c[2];
+
+	for (i = 0; i < 4; i++)
+		ret_data = ((g[i] & 0x01) << i) | ret_data;
+
+	return ret_data;
+}
+
+static u8 dp_audio_get_g1_value(u8 data)
+{
+	u8 c[4];
+	u8 g[4];
+	u8 ret_data = 0;
+	u8 i;
+
+	for (i = 0; i < 4; i++)
+		c[i] = (data >> i) & 0x01;
+
+	g[0] = c[0] ^ c[3];
+	g[1] = c[0] ^ c[1] ^ c[3];
+	g[2] = c[1] ^ c[2];
+	g[3] = c[2] ^ c[3];
+
+	for (i = 0; i < 4; i++)
+		ret_data = ((g[i] & 0x01) << i) | ret_data;
+
+	return ret_data;
+}
+
+static u8 dp_audio_calculate_parity(u32 data)
+{
+	u8 x0 = 0;
+	u8 x1 = 0;
+	u8 ci = 0;
+	u8 iData = 0;
+	u8 i = 0;
+	u8 parity_byte;
+	u8 num_byte = (data & 0xFF00) > 0 ? 8 : 2;
+
+	for (i = 0; i < num_byte; i++) {
+		iData = (data >> i*4) & 0xF;
+
+		ci = iData ^ x1;
+		x1 = x0 ^ dp_audio_get_g1_value(ci);
+		x0 = dp_audio_get_g0_value(ci);
+	}
+
+	parity_byte = x1 | (x0 << 4);
+
+	return parity_byte;
+}
+
+static u32 dp_audio_get_header(struct dp_catalog *catalog,
+		enum dp_catalog_audio_sdp_type sdp,
+		enum dp_catalog_audio_header_type header)
+{
+	catalog->sdp_type = sdp;
+	catalog->sdp_header = header;
+	dp_catalog_audio_get_header(catalog);
+
+	return catalog->audio_data;
+}
+
+static void dp_audio_set_header(struct dp_catalog *catalog,
+		u32 data,
+		enum dp_catalog_audio_sdp_type sdp,
+		enum dp_catalog_audio_header_type header)
+{
+	catalog->sdp_type = sdp;
+	catalog->sdp_header = header;
+	catalog->audio_data = data;
+	dp_catalog_audio_set_header(catalog);
+}
+
+static void dp_audio_stream_sdp(struct dp_audio_private *audio)
+{
+	struct dp_catalog *catalog = audio->catalog;
+	u32 value, new_value;
+	u8 parity_byte;
+
+	/* Config header and parity byte 1 */
+	value = dp_audio_get_header(catalog,
+			DP_AUDIO_SDP_STREAM, DP_AUDIO_SDP_HEADER_1);
+
+	new_value = 0x02;
+	parity_byte = dp_audio_calculate_parity(new_value);
+	value |= ((new_value << HEADER_BYTE_1_BIT)
+			| (parity_byte << PARITY_BYTE_1_BIT));
+	DRM_DEBUG_DP("Header Byte 1: value = 0x%x, parity_byte = 0x%x\n",
+			value, parity_byte);
+	dp_audio_set_header(catalog, value,
+		DP_AUDIO_SDP_STREAM, DP_AUDIO_SDP_HEADER_1);
+
+	/* Config header and parity byte 2 */
+	value = dp_audio_get_header(catalog,
+			DP_AUDIO_SDP_STREAM, DP_AUDIO_SDP_HEADER_2);
+	new_value = value;
+	parity_byte = dp_audio_calculate_parity(new_value);
+	value |= ((new_value << HEADER_BYTE_2_BIT)
+			| (parity_byte << PARITY_BYTE_2_BIT));
+	DRM_DEBUG_DP("Header Byte 2: value = 0x%x, parity_byte = 0x%x\n",
+			value, parity_byte);
+
+	dp_audio_set_header(catalog, value,
+		DP_AUDIO_SDP_STREAM, DP_AUDIO_SDP_HEADER_2);
+
+	/* Config header and parity byte 3 */
+	value = dp_audio_get_header(catalog,
+			DP_AUDIO_SDP_STREAM, DP_AUDIO_SDP_HEADER_3);
+
+	new_value = audio->channels - 1;
+	parity_byte = dp_audio_calculate_parity(new_value);
+	value |= ((new_value << HEADER_BYTE_3_BIT)
+			| (parity_byte << PARITY_BYTE_3_BIT));
+	DRM_DEBUG_DP("Header Byte 3: value = 0x%x, parity_byte = 0x%x\n",
+		value, parity_byte);
+
+	dp_audio_set_header(catalog, value,
+		DP_AUDIO_SDP_STREAM, DP_AUDIO_SDP_HEADER_3);
+}
+
+static void dp_audio_timestamp_sdp(struct dp_audio_private *audio)
+{
+	struct dp_catalog *catalog = audio->catalog;
+	u32 value, new_value;
+	u8 parity_byte;
+
+	/* Config header and parity byte 1 */
+	value = dp_audio_get_header(catalog,
+			DP_AUDIO_SDP_TIMESTAMP, DP_AUDIO_SDP_HEADER_1);
+
+	new_value = 0x1;
+	parity_byte = dp_audio_calculate_parity(new_value);
+	value |= ((new_value << HEADER_BYTE_1_BIT)
+			| (parity_byte << PARITY_BYTE_1_BIT));
+	DRM_DEBUG_DP("Header Byte 1: value = 0x%x, parity_byte = 0x%x\n",
+		value, parity_byte);
+	dp_audio_set_header(catalog, value,
+		DP_AUDIO_SDP_TIMESTAMP, DP_AUDIO_SDP_HEADER_1);
+
+	/* Config header and parity byte 2 */
+	value = dp_audio_get_header(catalog,
+			DP_AUDIO_SDP_TIMESTAMP, DP_AUDIO_SDP_HEADER_2);
+
+	new_value = 0x17;
+	parity_byte = dp_audio_calculate_parity(new_value);
+	value |= ((new_value << HEADER_BYTE_2_BIT)
+			| (parity_byte << PARITY_BYTE_2_BIT));
+	DRM_DEBUG_DP("Header Byte 2: value = 0x%x, parity_byte = 0x%x\n",
+			value, parity_byte);
+	dp_audio_set_header(catalog, value,
+		DP_AUDIO_SDP_TIMESTAMP, DP_AUDIO_SDP_HEADER_2);
+
+	/* Config header and parity byte 3 */
+	value = dp_audio_get_header(catalog,
+			DP_AUDIO_SDP_TIMESTAMP, DP_AUDIO_SDP_HEADER_3);
+
+	new_value = (0x0 | (0x11 << 2));
+	parity_byte = dp_audio_calculate_parity(new_value);
+	value |= ((new_value << HEADER_BYTE_3_BIT)
+			| (parity_byte << PARITY_BYTE_3_BIT));
+	DRM_DEBUG_DP("Header Byte 3: value = 0x%x, parity_byte = 0x%x\n",
+			value, parity_byte);
+	dp_audio_set_header(catalog, value,
+		DP_AUDIO_SDP_TIMESTAMP, DP_AUDIO_SDP_HEADER_3);
+}
+
+static void dp_audio_infoframe_sdp(struct dp_audio_private *audio)
+{
+	struct dp_catalog *catalog = audio->catalog;
+	u32 value, new_value;
+	u8 parity_byte;
+
+	/* Config header and parity byte 1 */
+	value = dp_audio_get_header(catalog,
+			DP_AUDIO_SDP_INFOFRAME, DP_AUDIO_SDP_HEADER_1);
+
+	new_value = 0x84;
+	parity_byte = dp_audio_calculate_parity(new_value);
+	value |= ((new_value << HEADER_BYTE_1_BIT)
+			| (parity_byte << PARITY_BYTE_1_BIT));
+	DRM_DEBUG_DP("Header Byte 1: value = 0x%x, parity_byte = 0x%x\n",
+			value, parity_byte);
+	dp_audio_set_header(catalog, value,
+		DP_AUDIO_SDP_INFOFRAME, DP_AUDIO_SDP_HEADER_1);
+
+	/* Config header and parity byte 2 */
+	value = dp_audio_get_header(catalog,
+			DP_AUDIO_SDP_INFOFRAME, DP_AUDIO_SDP_HEADER_2);
+
+	new_value = 0x1b;
+	parity_byte = dp_audio_calculate_parity(new_value);
+	value |= ((new_value << HEADER_BYTE_2_BIT)
+			| (parity_byte << PARITY_BYTE_2_BIT));
+	DRM_DEBUG_DP("Header Byte 2: value = 0x%x, parity_byte = 0x%x\n",
+			value, parity_byte);
+	dp_audio_set_header(catalog, value,
+		DP_AUDIO_SDP_INFOFRAME, DP_AUDIO_SDP_HEADER_2);
+
+	/* Config header and parity byte 3 */
+	value = dp_audio_get_header(catalog,
+			DP_AUDIO_SDP_INFOFRAME, DP_AUDIO_SDP_HEADER_3);
+
+	new_value = (0x0 | (0x11 << 2));
+	parity_byte = dp_audio_calculate_parity(new_value);
+	value |= ((new_value << HEADER_BYTE_3_BIT)
+			| (parity_byte << PARITY_BYTE_3_BIT));
+	DRM_DEBUG_DP("Header Byte 3: value = 0x%x, parity_byte = 0x%x\n",
+			new_value, parity_byte);
+	dp_audio_set_header(catalog, value,
+		DP_AUDIO_SDP_INFOFRAME, DP_AUDIO_SDP_HEADER_3);
+}
+
+static void dp_audio_copy_management_sdp(struct dp_audio_private *audio)
+{
+	struct dp_catalog *catalog = audio->catalog;
+	u32 value, new_value;
+	u8 parity_byte;
+
+	/* Config header and parity byte 1 */
+	value = dp_audio_get_header(catalog,
+			DP_AUDIO_SDP_COPYMANAGEMENT, DP_AUDIO_SDP_HEADER_1);
+
+	new_value = 0x05;
+	parity_byte = dp_audio_calculate_parity(new_value);
+	value |= ((new_value << HEADER_BYTE_1_BIT)
+			| (parity_byte << PARITY_BYTE_1_BIT));
+	DRM_DEBUG_DP("Header Byte 1: value = 0x%x, parity_byte = 0x%x\n",
+			value, parity_byte);
+	dp_audio_set_header(catalog, value,
+		DP_AUDIO_SDP_COPYMANAGEMENT, DP_AUDIO_SDP_HEADER_1);
+
+	/* Config header and parity byte 2 */
+	value = dp_audio_get_header(catalog,
+			DP_AUDIO_SDP_COPYMANAGEMENT, DP_AUDIO_SDP_HEADER_2);
+
+	new_value = 0x0F;
+	parity_byte = dp_audio_calculate_parity(new_value);
+	value |= ((new_value << HEADER_BYTE_2_BIT)
+			| (parity_byte << PARITY_BYTE_2_BIT));
+	DRM_DEBUG_DP("Header Byte 2: value = 0x%x, parity_byte = 0x%x\n",
+			value, parity_byte);
+	dp_audio_set_header(catalog, value,
+		DP_AUDIO_SDP_COPYMANAGEMENT, DP_AUDIO_SDP_HEADER_2);
+
+	/* Config header and parity byte 3 */
+	value = dp_audio_get_header(catalog,
+			DP_AUDIO_SDP_COPYMANAGEMENT, DP_AUDIO_SDP_HEADER_3);
+
+	new_value = 0x0;
+	parity_byte = dp_audio_calculate_parity(new_value);
+	value |= ((new_value << HEADER_BYTE_3_BIT)
+			| (parity_byte << PARITY_BYTE_3_BIT));
+	DRM_DEBUG_DP("Header Byte 3: value = 0x%x, parity_byte = 0x%x\n",
+			value, parity_byte);
+	dp_audio_set_header(catalog, value,
+		DP_AUDIO_SDP_COPYMANAGEMENT, DP_AUDIO_SDP_HEADER_3);
+}
+
+static void dp_audio_isrc_sdp(struct dp_audio_private *audio)
+{
+	struct dp_catalog *catalog = audio->catalog;
+	u32 value, new_value;
+	u8 parity_byte;
+
+	/* Config header and parity byte 1 */
+	value = dp_audio_get_header(catalog,
+			DP_AUDIO_SDP_ISRC, DP_AUDIO_SDP_HEADER_1);
+
+	new_value = 0x06;
+	parity_byte = dp_audio_calculate_parity(new_value);
+	value |= ((new_value << HEADER_BYTE_1_BIT)
+			| (parity_byte << PARITY_BYTE_1_BIT));
+	DRM_DEBUG_DP("Header Byte 1: value = 0x%x, parity_byte = 0x%x\n",
+			value, parity_byte);
+	dp_audio_set_header(catalog, value,
+		DP_AUDIO_SDP_ISRC, DP_AUDIO_SDP_HEADER_1);
+
+	/* Config header and parity byte 2 */
+	value = dp_audio_get_header(catalog,
+			DP_AUDIO_SDP_ISRC, DP_AUDIO_SDP_HEADER_2);
+
+	new_value = 0x0F;
+	parity_byte = dp_audio_calculate_parity(new_value);
+	value |= ((new_value << HEADER_BYTE_2_BIT)
+			| (parity_byte << PARITY_BYTE_2_BIT));
+	DRM_DEBUG_DP("Header Byte 2: value = 0x%x, parity_byte = 0x%x\n",
+			value, parity_byte);
+	dp_audio_set_header(catalog, value,
+		DP_AUDIO_SDP_ISRC, DP_AUDIO_SDP_HEADER_2);
+}
+
+static void dp_audio_setup_sdp(struct dp_audio_private *audio)
+{
+	dp_catalog_audio_config_sdp(audio->catalog);
+
+	dp_audio_stream_sdp(audio);
+	dp_audio_timestamp_sdp(audio);
+	dp_audio_infoframe_sdp(audio);
+	dp_audio_copy_management_sdp(audio);
+	dp_audio_isrc_sdp(audio);
+}
+
+static void dp_audio_setup_acr(struct dp_audio_private *audio)
+{
+	u32 select = 0;
+	struct dp_catalog *catalog = audio->catalog;
+
+	switch (audio->dp_audio.bw_code) {
+	case DP_LINK_BW_1_62:
+		select = 0;
+		break;
+	case DP_LINK_BW_2_7:
+		select = 1;
+		break;
+	case DP_LINK_BW_5_4:
+		select = 2;
+		break;
+	case DP_LINK_BW_8_1:
+		select = 3;
+		break;
+	default:
+		DRM_DEBUG_DP("Unknown link rate\n");
+		select = 0;
+		break;
+	}
+
+	catalog->audio_data = select;
+	dp_catalog_audio_config_acr(catalog);
+}
+
+static void dp_audio_safe_to_exit_level(struct dp_audio_private *audio)
+{
+	struct dp_catalog *catalog = audio->catalog;
+	u32 safe_to_exit_level = 0;
+
+	switch (audio->dp_audio.lane_count) {
+	case 1:
+		safe_to_exit_level = 14;
+		break;
+	case 2:
+		safe_to_exit_level = 8;
+		break;
+	case 4:
+		safe_to_exit_level = 5;
+		break;
+	default:
+		DRM_DEBUG_DP("setting the default safe_to_exit_level = %u\n",
+				safe_to_exit_level);
+		safe_to_exit_level = 14;
+		break;
+	}
+
+	catalog->audio_data = safe_to_exit_level;
+	dp_catalog_audio_sfe_level(catalog);
+}
+
+static void dp_audio_enable(struct dp_audio_private *audio, bool enable)
+{
+	struct dp_catalog *catalog = audio->catalog;
+
+	catalog->audio_data = enable;
+	dp_catalog_audio_enable(catalog);
+
+	audio->engine_on = enable;
+}
+
+static struct dp_audio_private *dp_audio_get_data(struct platform_device *pdev)
+{
+	struct dp_audio *dp_audio;
+	struct msm_dp *dp_display;
+
+	if (!pdev) {
+		DRM_ERROR("invalid input\n");
+		return ERR_PTR(-ENODEV);
+	}
+
+	dp_display = platform_get_drvdata(pdev);
+	if (!dp_display) {
+		DRM_ERROR("invalid input\n");
+		return ERR_PTR(-ENODEV);
+	}
+
+	dp_audio = dp_display->dp_audio;
+
+	if (!dp_audio) {
+		DRM_ERROR("invalid dp_audio data\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	return container_of(dp_audio, struct dp_audio_private, dp_audio);
+}
+
+static int dp_audio_get_eld(struct device *dev,
+	void *data, uint8_t *buf, size_t len)
+{
+	struct platform_device *pdev;
+	struct msm_dp *dp_display;
+
+	pdev = to_platform_device(dev);
+
+	if (!pdev) {
+		DRM_ERROR("invalid input\n");
+		return -ENODEV;
+	}
+
+	dp_display = platform_get_drvdata(pdev);
+	if (!dp_display) {
+		DRM_ERROR("invalid input\n");
+		return -ENODEV;
+	}
+
+	memcpy(buf, dp_display->connector->eld,
+		min(sizeof(dp_display->connector->eld), len));
+
+	return 0;
+}
+
+int dp_audio_hw_params(struct device *dev,
+	void *data,
+	struct hdmi_codec_daifmt *daifmt,
+	struct hdmi_codec_params *params)
+{
+	int rc = 0;
+	struct dp_audio_private *audio;
+	struct platform_device *pdev;
+
+	pdev = to_platform_device(dev);
+
+	audio = dp_audio_get_data(pdev);
+	if (IS_ERR(audio)) {
+		rc = PTR_ERR(audio);
+		goto end;
+	}
+
+	audio->channels = params->channels;
+
+	dp_audio_setup_sdp(audio);
+	dp_audio_setup_acr(audio);
+	dp_audio_safe_to_exit_level(audio);
+	dp_audio_enable(audio, true);
+end:
+	return rc;
+}
+
+static void dp_audio_shutdown(struct device *dev, void *data)
+{
+	struct dp_audio_private *audio;
+	struct platform_device *pdev;
+
+	pdev = to_platform_device(dev);
+	audio = dp_audio_get_data(pdev);
+	if (IS_ERR(audio)) {
+		DRM_ERROR("failed to get audio data\n");
+		return;
+	}
+
+	dp_audio_enable(audio, false);
+}
+
+static const struct hdmi_codec_ops dp_audio_codec_ops = {
+	.hw_params = dp_audio_hw_params,
+	.audio_shutdown = dp_audio_shutdown,
+	.get_eld = dp_audio_get_eld,
+};
+
+static struct hdmi_codec_pdata codec_data = {
+	.ops = &dp_audio_codec_ops,
+	.max_i2s_channels = 8,
+	.i2s = 1,
+};
+
+int dp_register_audio_driver(struct device *dev,
+		struct dp_audio *dp_audio)
+{
+	struct dp_audio_private *audio_priv;
+
+	audio_priv = container_of(dp_audio,
+			struct dp_audio_private, dp_audio);
+
+	audio_priv->audio_pdev = platform_device_register_data(dev,
+						HDMI_CODEC_DRV_NAME,
+						PLATFORM_DEVID_AUTO,
+						&codec_data,
+						sizeof(codec_data));
+	return PTR_ERR_OR_ZERO(audio_priv->audio_pdev);
+}
+
+struct dp_audio *dp_audio_get(struct platform_device *pdev,
+			struct dp_panel *panel,
+			struct dp_catalog *catalog)
+{
+	int rc = 0;
+	struct dp_audio_private *audio;
+	struct dp_audio *dp_audio;
+
+	if (!pdev || !panel || !catalog) {
+		DRM_ERROR("invalid input\n");
+		rc = -EINVAL;
+		goto error;
+	}
+
+	audio = devm_kzalloc(&pdev->dev, sizeof(*audio), GFP_KERNEL);
+	if (!audio) {
+		rc = -ENOMEM;
+		goto error;
+	}
+
+	audio->pdev = pdev;
+	audio->panel = panel;
+	audio->catalog = catalog;
+
+	dp_audio = &audio->dp_audio;
+
+	dp_catalog_audio_init(catalog);
+
+	return dp_audio;
+error:
+	return ERR_PTR(rc);
+}
+
+void dp_audio_put(struct dp_audio *dp_audio)
+{
+	struct dp_audio_private *audio;
+
+	if (!dp_audio)
+		return;
+
+	audio = container_of(dp_audio, struct dp_audio_private, dp_audio);
+
+	devm_kfree(&audio->pdev->dev, audio);
+}
diff --git a/drivers/gpu/drm/msm/dp/dp_audio.h b/drivers/gpu/drm/msm/dp/dp_audio.h
new file mode 100644
index 000000000000..84e5f4a5d26b
--- /dev/null
+++ b/drivers/gpu/drm/msm/dp/dp_audio.h
@@ -0,0 +1,72 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2017-2020, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef _DP_AUDIO_H_
+#define _DP_AUDIO_H_
+
+#include <linux/platform_device.h>
+
+#include "dp_panel.h"
+#include "dp_catalog.h"
+#include <sound/hdmi-codec.h>
+
+/**
+ * struct dp_audio
+ * @lane_count: number of lanes configured in current session
+ * @bw_code: link rate's bandwidth code for current session
+ */
+struct dp_audio {
+	u32 lane_count;
+	u32 bw_code;
+};
+
+/**
+ * dp_audio_get()
+ *
+ * Creates and instance of dp audio.
+ *
+ * @pdev: caller's platform device instance.
+ * @panel: an instance of dp_panel module.
+ * @catalog: an instance of dp_catalog module.
+ *
+ * Returns the error code in case of failure, otherwize
+ * an instance of newly created dp_module.
+ */
+struct dp_audio *dp_audio_get(struct platform_device *pdev,
+			struct dp_panel *panel,
+			struct dp_catalog *catalog);
+
+/**
+ * dp_register_audio_driver()
+ *
+ * Registers DP device with hdmi_codec interface.
+ *
+ * @dev: DP device instance.
+ * @dp_audio: an instance of dp_audio module.
+ *
+ *
+ * Returns the error code in case of failure, otherwise
+ * zero on success.
+ */
+int dp_register_audio_driver(struct device *dev,
+		struct dp_audio *dp_audio);
+
+/**
+ * dp_audio_put()
+ *
+ * Cleans the dp_audio instance.
+ *
+ * @dp_audio: an instance of dp_audio.
+ */
+void dp_audio_put(struct dp_audio *dp_audio);
+
+int dp_audio_hw_params(struct device *dev,
+	void *data,
+	struct hdmi_codec_daifmt *daifmt,
+	struct hdmi_codec_params *params);
+
+#endif /* _DP_AUDIO_H_ */
+
+
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index f92a8e37a312..f4f50c6293c0 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -90,6 +90,7 @@ aux_lut_value[PHY_AUX_CFG_MAX][DP_AUX_CFG_MAX_VALUE_CNT] = {
 struct dp_catalog_private {
 	struct device *dev;
 	struct dp_io *io;
+	u32 (*audio_map)[DP_AUDIO_SDP_HEADER_MAX];
 	struct dp_catalog dp_catalog;
 	u8 aux_lut_cfg_index[PHY_AUX_CFG_MAX];
 };
@@ -1055,3 +1056,194 @@ struct dp_catalog *dp_catalog_get(struct device *dev, struct dp_io *io)
 
 	return &catalog->dp_catalog;
 }
+
+void dp_catalog_audio_get_header(struct dp_catalog *dp_catalog)
+{
+	struct dp_catalog_private *catalog;
+	u32 (*sdp_map)[DP_AUDIO_SDP_HEADER_MAX];
+	enum dp_catalog_audio_sdp_type sdp;
+	enum dp_catalog_audio_header_type header;
+
+	if (!dp_catalog)
+		return;
+
+	catalog = container_of(dp_catalog,
+		struct dp_catalog_private, dp_catalog);
+
+	sdp_map = catalog->audio_map;
+	sdp     = dp_catalog->sdp_type;
+	header  = dp_catalog->sdp_header;
+
+	dp_catalog->audio_data = dp_read_link(catalog,
+			sdp_map[sdp][header]);
+}
+
+void dp_catalog_audio_set_header(struct dp_catalog *dp_catalog)
+{
+	struct dp_catalog_private *catalog;
+	u32 (*sdp_map)[DP_AUDIO_SDP_HEADER_MAX];
+	enum dp_catalog_audio_sdp_type sdp;
+	enum dp_catalog_audio_header_type header;
+	u32 data;
+
+	if (!dp_catalog)
+		return;
+
+	catalog = container_of(dp_catalog,
+		struct dp_catalog_private, dp_catalog);
+
+	sdp_map = catalog->audio_map;
+	sdp     = dp_catalog->sdp_type;
+	header  = dp_catalog->sdp_header;
+	data    = dp_catalog->audio_data;
+
+	dp_write_link(catalog, sdp_map[sdp][header], data);
+}
+
+void dp_catalog_audio_config_acr(struct dp_catalog *dp_catalog)
+{
+	struct dp_catalog_private *catalog;
+	u32 acr_ctrl, select;
+
+	if (!dp_catalog)
+		return;
+
+	catalog = container_of(dp_catalog,
+		struct dp_catalog_private, dp_catalog);
+
+	select = dp_catalog->audio_data;
+	acr_ctrl = select << 4 | BIT(31) | BIT(8) | BIT(14);
+
+	DRM_DEBUG_DP("select = 0x%x, acr_ctrl = 0x%x\n", select, acr_ctrl);
+
+	dp_write_link(catalog, MMSS_DP_AUDIO_ACR_CTRL, acr_ctrl);
+}
+
+void dp_catalog_audio_enable(struct dp_catalog *dp_catalog)
+{
+	struct dp_catalog_private *catalog;
+	bool enable;
+	u32 audio_ctrl;
+
+	if (!dp_catalog)
+		return;
+
+	catalog = container_of(dp_catalog,
+		struct dp_catalog_private, dp_catalog);
+
+	enable = !!dp_catalog->audio_data;
+	audio_ctrl = dp_read_link(catalog, MMSS_DP_AUDIO_CFG);
+
+	if (enable)
+		audio_ctrl |= BIT(0);
+	else
+		audio_ctrl &= ~BIT(0);
+
+	DRM_DEBUG_DP("dp_audio_cfg = 0x%x\n", audio_ctrl);
+
+	dp_write_link(catalog, MMSS_DP_AUDIO_CFG, audio_ctrl);
+	/* make sure audio engine is disabled */
+	wmb();
+}
+
+void dp_catalog_audio_config_sdp(struct dp_catalog *dp_catalog)
+{
+	struct dp_catalog_private *catalog;
+	u32 sdp_cfg = 0;
+	u32 sdp_cfg2 = 0;
+
+	if (!dp_catalog)
+		return;
+
+	catalog = container_of(dp_catalog,
+		struct dp_catalog_private, dp_catalog);
+
+	sdp_cfg = dp_read_link(catalog, MMSS_DP_SDP_CFG);
+	/* AUDIO_TIMESTAMP_SDP_EN */
+	sdp_cfg |= BIT(1);
+	/* AUDIO_STREAM_SDP_EN */
+	sdp_cfg |= BIT(2);
+	/* AUDIO_COPY_MANAGEMENT_SDP_EN */
+	sdp_cfg |= BIT(5);
+	/* AUDIO_ISRC_SDP_EN  */
+	sdp_cfg |= BIT(6);
+	/* AUDIO_INFOFRAME_SDP_EN  */
+	sdp_cfg |= BIT(20);
+
+	DRM_DEBUG_DP("sdp_cfg = 0x%x\n", sdp_cfg);
+
+	dp_write_link(catalog, MMSS_DP_SDP_CFG, sdp_cfg);
+
+	sdp_cfg2 = dp_read_link(catalog, MMSS_DP_SDP_CFG2);
+	/* IFRM_REGSRC -> Do not use reg values */
+	sdp_cfg2 &= ~BIT(0);
+	/* AUDIO_STREAM_HB3_REGSRC-> Do not use reg values */
+	sdp_cfg2 &= ~BIT(1);
+
+	DRM_DEBUG_DP("sdp_cfg2 = 0x%x\n", sdp_cfg2);
+
+	dp_write_link(catalog, MMSS_DP_SDP_CFG2, sdp_cfg2);
+}
+
+void dp_catalog_audio_init(struct dp_catalog *dp_catalog)
+{
+	struct dp_catalog_private *catalog;
+
+	static u32 sdp_map[][DP_AUDIO_SDP_HEADER_MAX] = {
+		{
+			MMSS_DP_AUDIO_STREAM_0,
+			MMSS_DP_AUDIO_STREAM_1,
+			MMSS_DP_AUDIO_STREAM_1,
+		},
+		{
+			MMSS_DP_AUDIO_TIMESTAMP_0,
+			MMSS_DP_AUDIO_TIMESTAMP_1,
+			MMSS_DP_AUDIO_TIMESTAMP_1,
+		},
+		{
+			MMSS_DP_AUDIO_INFOFRAME_0,
+			MMSS_DP_AUDIO_INFOFRAME_1,
+			MMSS_DP_AUDIO_INFOFRAME_1,
+		},
+		{
+			MMSS_DP_AUDIO_COPYMANAGEMENT_0,
+			MMSS_DP_AUDIO_COPYMANAGEMENT_1,
+			MMSS_DP_AUDIO_COPYMANAGEMENT_1,
+		},
+		{
+			MMSS_DP_AUDIO_ISRC_0,
+			MMSS_DP_AUDIO_ISRC_1,
+			MMSS_DP_AUDIO_ISRC_1,
+		},
+	};
+
+	if (!dp_catalog)
+		return;
+
+	catalog = container_of(dp_catalog,
+		struct dp_catalog_private, dp_catalog);
+
+	catalog->audio_map = sdp_map;
+}
+
+void dp_catalog_audio_sfe_level(struct dp_catalog *dp_catalog)
+{
+	struct dp_catalog_private *catalog;
+	u32 mainlink_levels, safe_to_exit_level;
+
+	if (!dp_catalog)
+		return;
+
+	catalog = container_of(dp_catalog,
+		struct dp_catalog_private, dp_catalog);
+
+	safe_to_exit_level = dp_catalog->audio_data;
+	mainlink_levels = dp_read_link(catalog, REG_DP_MAINLINK_LEVELS);
+	mainlink_levels &= 0xFE0;
+	mainlink_levels |= safe_to_exit_level;
+
+	DRM_DEBUG_DP("mainlink_level = 0x%x, safe_to_exit_level = 0x%x\n",
+			 mainlink_levels, safe_to_exit_level);
+
+	dp_write_link(catalog, REG_DP_MAINLINK_LEVELS, mainlink_levels);
+}
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
index bcd381bfc9cd..4569c16aa484 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.h
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
@@ -42,12 +42,31 @@ enum dp_phy_aux_config_type {
 	PHY_AUX_CFG_MAX,
 };
 
+enum dp_catalog_audio_sdp_type {
+	DP_AUDIO_SDP_STREAM,
+	DP_AUDIO_SDP_TIMESTAMP,
+	DP_AUDIO_SDP_INFOFRAME,
+	DP_AUDIO_SDP_COPYMANAGEMENT,
+	DP_AUDIO_SDP_ISRC,
+	DP_AUDIO_SDP_MAX,
+};
+
+enum dp_catalog_audio_header_type {
+	DP_AUDIO_SDP_HEADER_1,
+	DP_AUDIO_SDP_HEADER_2,
+	DP_AUDIO_SDP_HEADER_3,
+	DP_AUDIO_SDP_HEADER_MAX,
+};
+
 struct dp_catalog {
 	u32 aux_data;
 	u32 total;
 	u32 sync_start;
 	u32 width_blanking;
 	u32 dp_active;
+	enum dp_catalog_audio_sdp_type sdp_type;
+	enum dp_catalog_audio_header_type sdp_header;
+	u32 audio_data;
 };
 
 /* AUX APIs */
@@ -101,4 +120,14 @@ void dp_catalog_panel_tpg_disable(struct dp_catalog *dp_catalog);
 
 struct dp_catalog *dp_catalog_get(struct device *dev, struct dp_io *io);
 
+/* DP Audio APIs */
+void dp_catalog_audio_get_header(struct dp_catalog *catalog);
+void dp_catalog_audio_set_header(struct dp_catalog *catalog);
+void dp_catalog_audio_config_acr(struct dp_catalog *catalog);
+void dp_catalog_audio_enable(struct dp_catalog *catalog);
+void dp_catalog_audio_enable(struct dp_catalog *catalog);
+void dp_catalog_audio_config_sdp(struct dp_catalog *catalog);
+void dp_catalog_audio_init(struct dp_catalog *catalog);
+void dp_catalog_audio_sfe_level(struct dp_catalog *catalog);
+
 #endif /* _DP_CATALOG_H_ */
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index d32ce6753883..3120e172adc2 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -25,6 +25,7 @@
 #include "dp_display.h"
 #include "dp_drm.h"
 #include "dp_pll.h"
+#include "dp_audio.h"
 
 static struct msm_dp *g_dp_display;
 #define HPD_STRING_SIZE 30
@@ -102,6 +103,8 @@ struct dp_display_private {
 	u32 event_gndx;
 	struct dp_event event_list[DP_EVENT_Q_MAX];
 	spinlock_t event_lock;
+
+	struct dp_audio *audio;
 };
 
 static const struct of_device_id dp_dt_match[] = {
@@ -201,6 +204,13 @@ static int dp_display_bind(struct device *dev, struct device *master,
 		DRM_ERROR("Power client create failed\n");
 		goto end;
 	}
+
+	rc = dp_register_audio_driver(dev, dp->audio);
+	if (rc) {
+		DRM_ERROR("Audio registration Dp failed\n");
+		goto end;
+	}
+
 end:
 	return rc;
 }
@@ -373,8 +383,19 @@ static int dp_display_usbpd_disconnect_cb(struct device *dev)
 	int rc = 0;
 	struct dp_display_private *dp;
 
+	if (!dev) {
+		DRM_ERROR("invalid dev\n");
+		rc = -EINVAL;
+		return rc;
+	}
+
 	dp = container_of(g_dp_display,
 			struct dp_display_private, dp_display);
+	if (!dp) {
+		DRM_ERROR("no driver data found\n");
+		rc = -ENODEV;
+		return rc;
+	}
 
 	dp_add_event(dp, EV_USER_NOTIFICATION, false, 0);
 
@@ -549,6 +570,7 @@ static void dp_display_deinit_sub_modules(struct dp_display_private *dp)
 	dp_panel_put(dp->panel);
 	dp_aux_put(dp->aux);
 	dp_pll_put(dp->pll);
+	dp_audio_put(dp->audio);
 }
 
 static int dp_init_sub_modules(struct dp_display_private *dp)
@@ -648,7 +670,18 @@ static int dp_init_sub_modules(struct dp_display_private *dp)
 		goto error_ctrl;
 	}
 
+	dp->audio = dp_audio_get(dp->pdev, dp->panel, dp->catalog);
+	if (IS_ERR(dp->audio)) {
+		rc = PTR_ERR(dp->audio);
+		pr_err("failed to initialize audio, rc = %d\n", rc);
+		dp->audio = NULL;
+		goto error_audio;
+	}
+
 	return rc;
+
+error_audio:
+	dp_ctrl_put(dp->ctrl);
 error_ctrl:
 	dp_panel_put(dp->panel);
 error_link:
@@ -694,6 +727,18 @@ static int dp_display_enable(struct dp_display_private *dp, u32 data)
 
 static int dp_display_post_enable(struct msm_dp *dp_display)
 {
+	struct dp_display_private *dp;
+	u32 rate;
+
+	dp = container_of(dp_display, struct dp_display_private, dp_display);
+
+	rate = dp->link->link_params.rate;
+
+	if (dp->audio_supported) {
+		dp->audio->bw_code = drm_dp_link_rate_to_bw_code(rate);
+		dp->audio->lane_count = dp->link->link_params.num_lanes;
+	}
+
 	return 0;
 }
 
@@ -1002,6 +1047,9 @@ static int dp_display_probe(struct platform_device *pdev)
 
 	g_dp_display = &dp->dp_display;
 
+	/* Store DP audio handle inside DP display */
+	g_dp_display->dp_audio = dp->audio;
+
 	platform_set_drvdata(pdev, g_dp_display);
 
 	rc = component_add(&pdev->dev, &dp_display_comp_ops);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index 2f2d1279dfc6..1e0d2b9d9a2a 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -14,7 +14,9 @@ struct msm_dp {
 	struct drm_encoder *encoder;
 	bool is_connected;
 	u32 max_pclk_khz;
+
 	u32 max_dp_lanes;
+	struct dp_audio *dp_audio;
 };
 
 int dp_display_validate_mode(struct msm_dp *dp_display, u32 mode_pclk_khz);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

