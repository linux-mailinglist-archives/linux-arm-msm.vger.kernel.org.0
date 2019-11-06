Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C487F12AA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2019 10:48:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730512AbfKFJsv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Nov 2019 04:48:51 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:34998 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725937AbfKFJsu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Nov 2019 04:48:50 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 52B2361246; Wed,  6 Nov 2019 09:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573033729;
        bh=XRY/kwMTMT+zwTzTrcGVRwdgiKSA/fUzru3IJEPp9ZY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=LkYYPf89j01rJgon/82lGmq6qp3ZUv8EjkdS4YfSAvIOhlohmrGd5P6xGTNIq/bxs
         TyKTwSTwc0870wbSEwA2SPO7D0UZfKtkEB/zuwwRhrv9gE9KLMHU96eCCyNg9jvLPF
         PZvBcR5PdjXSoS4KSiAqa8z3/370UYyl0v7IRRYk=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from bgodavar-linux.qualcomm.com (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bgodavar@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 451D260F81;
        Wed,  6 Nov 2019 09:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573033727;
        bh=XRY/kwMTMT+zwTzTrcGVRwdgiKSA/fUzru3IJEPp9ZY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=gj1b8NrgEvIAMOvTlDHI8eHmeshIx6uaXyN0rJprcw8RvpNiBphwsZ2/cELI/2xqC
         dc+v4x1fYBO9C+Gz5qJYhW8IyPVN9dpZg6w0VI1R/HmKFKlJd/I2fJp9SHWoYEhXCO
         vgtAOhk/YSWQeNnDylk2v1dsvdRk8YK7rYnuXSQs=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 451D260F81
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=bgodavar@codeaurora.org
From:   Balakrishna Godavarthi <bgodavar@codeaurora.org>
To:     marcel@holtmann.org, johan.hedberg@gmail.com
Cc:     mka@chromium.org, linux-kernel@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, hemantg@codeaurora.org,
        linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org,
        tientzu@chromium.org, seanpaul@chromium.org,
        bjorn.andersson@linaro.org
Subject: [PATCH v2 1/2] Bluetooth: btqca: Rename ROME specific variables to generic variables
Date:   Wed,  6 Nov 2019 15:18:31 +0530
Message-Id: <20191106094832.482-2-bgodavar@codeaurora.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191106094832.482-1-bgodavar@codeaurora.org>
References: <20191106094832.482-1-bgodavar@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Variables which are named with rome are commonly used for all the
BT SoC's. Instead of continuing further, renamed them to generic
name.

Signed-off-by: Balakrishna Godavarthi <bgodavar@codeaurora.org>
---
 drivers/bluetooth/btqca.c | 28 ++++++++++++++--------------
 drivers/bluetooth/btqca.h | 22 +++++++++++-----------
 2 files changed, 25 insertions(+), 25 deletions(-)

diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
index 8cc21ad7cf29..1a0f630515a6 100644
--- a/drivers/bluetooth/btqca.c
+++ b/drivers/bluetooth/btqca.c
@@ -18,7 +18,7 @@ int qca_read_soc_version(struct hci_dev *hdev, u32 *soc_version)
 {
 	struct sk_buff *skb;
 	struct edl_event_hdr *edl;
-	struct rome_version *ver;
+	struct qca_btsoc_version *ver;
 	char cmd;
 	int err = 0;
 
@@ -55,11 +55,11 @@ int qca_read_soc_version(struct hci_dev *hdev, u32 *soc_version)
 		goto out;
 	}
 
-	ver = (struct rome_version *)(edl->data);
+	ver = (struct qca_btsoc_version *)(edl->data);
 
 	BT_DBG("%s: Product:0x%08x", hdev->name, le32_to_cpu(ver->product_id));
 	BT_DBG("%s: Patch  :0x%08x", hdev->name, le16_to_cpu(ver->patch_ver));
-	BT_DBG("%s: ROM    :0x%08x", hdev->name, le16_to_cpu(ver->rome_ver));
+	BT_DBG("%s: ROM    :0x%08x", hdev->name, le16_to_cpu(ver->rom_ver));
 	BT_DBG("%s: SOC    :0x%08x", hdev->name, le32_to_cpu(ver->soc_id));
 
 	/* QCA chipset version can be decided by patch and SoC
@@ -67,7 +67,7 @@ int qca_read_soc_version(struct hci_dev *hdev, u32 *soc_version)
 	 * and lower 2 bytes from patch will be used.
 	 */
 	*soc_version = (le32_to_cpu(ver->soc_id) << 16) |
-			(le16_to_cpu(ver->rome_ver) & 0x0000ffff);
+			(le16_to_cpu(ver->rom_ver) & 0x0000ffff);
 	if (*soc_version == 0)
 		err = -EILSEQ;
 
@@ -121,7 +121,7 @@ int qca_send_pre_shutdown_cmd(struct hci_dev *hdev)
 }
 EXPORT_SYMBOL_GPL(qca_send_pre_shutdown_cmd);
 
-static void qca_tlv_check_data(struct rome_config *config,
+static void qca_tlv_check_data(struct qca_fw_config *config,
 				const struct firmware *fw)
 {
 	const u8 *data;
@@ -140,8 +140,8 @@ static void qca_tlv_check_data(struct rome_config *config,
 	BT_DBG("TLV Type\t\t : 0x%x", type_len & 0x000000ff);
 	BT_DBG("Length\t\t : %d bytes", length);
 
-	config->dnld_mode = ROME_SKIP_EVT_NONE;
-	config->dnld_type = ROME_SKIP_EVT_NONE;
+	config->dnld_mode = QCA_SKIP_EVT_NONE;
+	config->dnld_type = QCA_SKIP_EVT_NONE;
 
 	switch (config->type) {
 	case TLV_TYPE_PATCH:
@@ -223,7 +223,7 @@ static void qca_tlv_check_data(struct rome_config *config,
 }
 
 static int qca_tlv_send_segment(struct hci_dev *hdev, int seg_size,
-				 const u8 *data, enum rome_tlv_dnld_mode mode)
+				 const u8 *data, enum qca_tlv_dnld_mode mode)
 {
 	struct sk_buff *skb;
 	struct edl_event_hdr *edl;
@@ -235,7 +235,7 @@ static int qca_tlv_send_segment(struct hci_dev *hdev, int seg_size,
 	cmd[1] = seg_size;
 	memcpy(cmd + 2, data, seg_size);
 
-	if (mode == ROME_SKIP_EVT_VSE_CC || mode == ROME_SKIP_EVT_VSE)
+	if (mode == QCA_SKIP_EVT_VSE_CC || mode == QCA_SKIP_EVT_VSE)
 		return __hci_cmd_send(hdev, EDL_PATCH_CMD_OPCODE, seg_size + 2,
 				      cmd);
 
@@ -301,7 +301,7 @@ static int qca_inject_cmd_complete_event(struct hci_dev *hdev)
 }
 
 static int qca_download_firmware(struct hci_dev *hdev,
-				  struct rome_config *config)
+				  struct qca_fw_config *config)
 {
 	const struct firmware *fw;
 	const u8 *segment;
@@ -328,7 +328,7 @@ static int qca_download_firmware(struct hci_dev *hdev,
 		remain -= segsize;
 		/* The last segment is always acked regardless download mode */
 		if (!remain || segsize < MAX_SIZE_PER_TLV_SEGMENT)
-			config->dnld_mode = ROME_SKIP_EVT_NONE;
+			config->dnld_mode = QCA_SKIP_EVT_NONE;
 
 		ret = qca_tlv_send_segment(hdev, segsize, segment,
 					    config->dnld_mode);
@@ -344,8 +344,8 @@ static int qca_download_firmware(struct hci_dev *hdev,
 	 * decrease the BT in initialization time. Here we will inject a command
 	 * complete event to avoid a command timeout error message.
 	 */
-	if (config->dnld_type == ROME_SKIP_EVT_VSE_CC ||
-	    config->dnld_type == ROME_SKIP_EVT_VSE)
+	if (config->dnld_type == QCA_SKIP_EVT_VSE_CC ||
+	    config->dnld_type == QCA_SKIP_EVT_VSE)
 		ret = qca_inject_cmd_complete_event(hdev);
 
 out:
@@ -382,7 +382,7 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
 		   enum qca_btsoc_type soc_type, u32 soc_ver,
 		   const char *firmware_name)
 {
-	struct rome_config config;
+	struct qca_fw_config config;
 	int err;
 	u8 rom_ver = 0;
 
diff --git a/drivers/bluetooth/btqca.h b/drivers/bluetooth/btqca.h
index 69c5315a65fd..7f7a2b2c0df6 100644
--- a/drivers/bluetooth/btqca.h
+++ b/drivers/bluetooth/btqca.h
@@ -56,24 +56,24 @@ enum qca_baudrate {
 	QCA_BAUDRATE_RESERVED
 };
 
-enum rome_tlv_dnld_mode {
-	ROME_SKIP_EVT_NONE,
-	ROME_SKIP_EVT_VSE,
-	ROME_SKIP_EVT_CC,
-	ROME_SKIP_EVT_VSE_CC
+enum qca_tlv_dnld_mode {
+	QCA_SKIP_EVT_NONE,
+	QCA_SKIP_EVT_VSE,
+	QCA_SKIP_EVT_CC,
+	QCA_SKIP_EVT_VSE_CC
 };
 
-enum rome_tlv_type {
+enum qca_tlv_type {
 	TLV_TYPE_PATCH = 1,
 	TLV_TYPE_NVM
 };
 
-struct rome_config {
+struct qca_fw_config {
 	u8 type;
 	char fwname[64];
 	uint8_t user_baud_rate;
-	enum rome_tlv_dnld_mode dnld_mode;
-	enum rome_tlv_dnld_mode dnld_type;
+	enum qca_tlv_dnld_mode dnld_mode;
+	enum qca_tlv_dnld_mode dnld_type;
 };
 
 struct edl_event_hdr {
@@ -82,10 +82,10 @@ struct edl_event_hdr {
 	__u8 data[0];
 } __packed;
 
-struct rome_version {
+struct qca_btsoc_version {
 	__le32 product_id;
 	__le16 patch_ver;
-	__le16 rome_ver;
+	__le16 rom_ver;
 	__le32 soc_id;
 } __packed;
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

