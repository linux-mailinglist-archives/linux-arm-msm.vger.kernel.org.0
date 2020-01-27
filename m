Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B879D14ACA4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2020 00:40:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726080AbgA0XkZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Jan 2020 18:40:25 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:51821 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725955AbgA0XkZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Jan 2020 18:40:25 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1580168423; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=d74wUAmSb8IYWC70SlwNLpBtbPMqEnwBpMkYDFfe8U0=; b=UEpn94dLdSCNhQstTs+8RvufcfSwiviFVbByiCna73//K3IWhvSH0T3nKlMW4LVMKkYz+SUA
 QL13DzT6Mo2cdTbaIlOMcHTvSUuecDQljkH8vDEvcpiHIaTrO9F5vt8YZ1xmGdibEZWaRrmQ
 aXKeN1FCRx3Uj6kHIVpNyNc95so=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e2f74dd.7f06fc97fce0-smtp-out-n01;
 Mon, 27 Jan 2020 23:40:13 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B3A52C4479C; Mon, 27 Jan 2020 23:40:12 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from abhinavk-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 827AAC43383;
        Mon, 27 Jan 2020 23:40:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 827AAC43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=abhinavk@codeaurora.org
From:   Abhinav Kumar <abhinavk@codeaurora.org>
To:     dri-devel@lists.freedesktop.org
Cc:     Uma Shankar <uma.shankar@intel.com>, linux-arm-msm@vger.kernel.org,
        robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org,
        nganji@codeaurora.org, aravindh@codeaurora.org, adelva@google.com,
        Abhinav Kumar <abhinavk@codeaurora.org>
Subject: [PATCH v2] drm: Parse Colorimetry data block from EDID
Date:   Mon, 27 Jan 2020 15:40:06 -0800
Message-Id: <1580168406-23808-1-git-send-email-abhinavk@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Uma Shankar <uma.shankar@intel.com>

CEA 861.3 spec adds colorimetry data block for HDMI.
Parsing the block to get the colorimetry data from
panel.

This was posted by Uma Shankar at
https://patchwork.kernel.org/patch/10861327/

Modified by Abhinav Kumar:
- Use macros to distinguish the bit fields for clarity

Changes in v2:
- Use the drm_edid.h macros in drm_edid.c (Stephen Boyd)

Signed-off-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
---
 drivers/gpu/drm/drm_edid.c  | 45 +++++++++++++++++++++++++++++++++++++++++++++
 include/drm/drm_connector.h |  3 +++
 include/drm/drm_edid.h      | 14 ++++++++++++++
 3 files changed, 62 insertions(+)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 99769d6..9a82fb8 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -3136,6 +3136,7 @@ static int drm_cvt_modes(struct drm_connector *connector,
 #define VIDEO_BLOCK     0x02
 #define VENDOR_BLOCK    0x03
 #define SPEAKER_BLOCK	0x04
+#define COLORIMETRY_DATA_BLOCK		0x5
 #define HDR_STATIC_METADATA_BLOCK	0x6
 #define USE_EXTENDED_TAG 0x07
 #define EXT_VIDEO_CAPABILITY_BLOCK 0x00
@@ -4199,6 +4200,48 @@ static void fixup_detailed_cea_mode_clock(struct drm_display_mode *mode)
 	mode->clock = clock;
 }
 
+static bool cea_db_is_hdmi_colorimetry_data_block(const u8 *db)
+{
+	if (cea_db_tag(db) != USE_EXTENDED_TAG)
+		return false;
+
+	if (db[1] != COLORIMETRY_DATA_BLOCK)
+		return false;
+
+	if (cea_db_payload_len(db) < 2)
+		return false;
+
+	return true;
+}
+
+static void
+drm_parse_colorimetry_data_block(struct drm_connector *connector, const u8 *db)
+{
+	struct drm_hdmi_info *info = &connector->display_info.hdmi;
+
+	if (db[2] & DRM_EDID_CLRMETRY_xvYCC_601)
+		info->colorimetry |= DRM_EDID_CLRMETRY_xvYCC_601;
+	if (db[2] & DRM_EDID_CLRMETRY_xvYCC_709)
+		info->colorimetry |= DRM_EDID_CLRMETRY_xvYCC_709;
+	if (db[2] & DRM_EDID_CLRMETRY_sYCC_601)
+		info->colorimetry |= DRM_EDID_CLRMETRY_sYCC_601;
+	if (db[2] & DRM_EDID_CLRMETRY_ADBYCC_601)
+		info->colorimetry |= DRM_EDID_CLRMETRY_ADBYCC_601;
+	if (db[2] & DRM_EDID_CLRMETRY_ADB_RGB)
+		info->colorimetry |= DRM_EDID_CLRMETRY_ADB_RGB;
+	if (db[2] & DRM_EDID_CLRMETRY_BT2020_CYCC)
+		info->colorimetry |= DRM_EDID_CLRMETRY_BT2020_CYCC;
+	if (db[2] & DRM_EDID_CLRMETRY_BT2020_YCC)
+		info->colorimetry |= DRM_EDID_CLRMETRY_BT2020_YCC;
+	if (db[2] & DRM_EDID_CLRMETRY_BT2020_RGB)
+		info->colorimetry |= DRM_EDID_CLRMETRY_BT2020_RGB;
+	/* Byte 4 Bit 7: DCI-P3 */
+	if (db[3] & BIT(7))
+		info->colorimetry |= DRM_EDID_CLRMETRY_DCI_P3;
+
+	DRM_DEBUG_KMS("Supported Colorimetry 0x%x\n", info->colorimetry);
+}
+
 static bool cea_db_is_hdmi_hdr_metadata_block(const u8 *db)
 {
 	if (cea_db_tag(db) != USE_EXTENDED_TAG)
@@ -4877,6 +4920,8 @@ static void drm_parse_cea_ext(struct drm_connector *connector,
 			drm_parse_vcdb(connector, db);
 		if (cea_db_is_hdmi_hdr_metadata_block(db))
 			drm_parse_hdr_metadata_block(connector, db);
+		if (cea_db_is_hdmi_colorimetry_data_block(db))
+			drm_parse_colorimetry_data_block(connector, db);
 	}
 }
 
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 2219109..a996ee3 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -207,6 +207,9 @@ struct drm_hdmi_info {
 
 	/** @y420_dc_modes: bitmap of deep color support index */
 	u8 y420_dc_modes;
+
+	/* @colorimetry: bitmap of supported colorimetry modes */
+	u16 colorimetry;
 };
 
 /**
diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
index f0b03d4..4f22f22 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -224,6 +224,20 @@ struct detailed_timing {
 				    DRM_EDID_YCBCR420_DC_36 | \
 				    DRM_EDID_YCBCR420_DC_30)
 
+/*
+ * Supported Colorimetry from colorimetry data block
+ * as per CEA 861-G spec
+ */
+#define DRM_EDID_CLRMETRY_xvYCC_601   (1 << 0)
+#define DRM_EDID_CLRMETRY_xvYCC_709   (1 << 1)
+#define DRM_EDID_CLRMETRY_sYCC_601    (1 << 2)
+#define DRM_EDID_CLRMETRY_ADBYCC_601  (1 << 3)
+#define DRM_EDID_CLRMETRY_ADB_RGB     (1 << 4)
+#define DRM_EDID_CLRMETRY_BT2020_CYCC (1 << 5)
+#define DRM_EDID_CLRMETRY_BT2020_YCC  (1 << 6)
+#define DRM_EDID_CLRMETRY_BT2020_RGB  (1 << 7)
+#define DRM_EDID_CLRMETRY_DCI_P3      (1 << 15)
+
 /* ELD Header Block */
 #define DRM_ELD_HEADER_BLOCK_SIZE	4
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
