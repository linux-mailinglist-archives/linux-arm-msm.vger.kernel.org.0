Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 50E79762ABB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jul 2023 07:23:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231403AbjGZFXS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Jul 2023 01:23:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231808AbjGZFXL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Jul 2023 01:23:11 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1F3C212D;
        Tue, 25 Jul 2023 22:23:09 -0700 (PDT)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36Q57GO1011313;
        Wed, 26 Jul 2023 05:23:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=ipnrQ8cFgpTIP8hIpOZh5f/DfJ1VOvven67V9okWLCE=;
 b=J90//YuEX+Bs61LBTbmcDOrBycp2SOkKKQkFeA7A46FZakJJN8TfZ/BKstV5je82xw0Z
 CyPYCSlYAA/FOqs4JPmMOLVn4DV+qTv/Q8RXg/EwTHg29RBpQ/q2EZ4G6+OLc5JZCME7
 ErnGVfau5BDZ13Cfs2c2UP0sKH9DNmAhgTr5s4S7ejkMN4dmav1ps2ed4ynjF8zi0tHL
 FrUEg2tYPbXHulZSbqK7yTHjuhuur14FVf1cA/PrQt1UMtfr8neG/oHVrs3oXvnhBcJn
 NoxoZEF4zDsvZqvQGyk1IC9yLMogeKOn+s1SiFFVxiexDpZSpt7rLT4rttwiebS+bDmm ig== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s2ufm859r-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 26 Jul 2023 05:23:05 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
        by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36Q5N3wD027093
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 26 Jul 2023 05:23:03 GMT
Received: from tjiang-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Tue, 25 Jul 2023 22:23:01 -0700
From:   Tim Jiang <quic_tjiang@quicinc.com>
To:     <marcel@holtmann.org>, <johan@kernel.org>
CC:     <linux-kernel@vger.kernel.org>, <linux-bluetooth@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <quic_tjiang@quicinc.com>,
        <quic_bgodavar@quicinc.com>, <quic_hemantg@quicinc.com>
Subject: [PATCH v12 2/2] Bluetooth: hci_qca: Add support for Qualcomm Bluetooth SoC QCA2066
Date:   Wed, 26 Jul 2023 13:22:45 +0800
Message-ID: <20230726052245.609987-3-quic_tjiang@quicinc.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230726052245.609987-1-quic_tjiang@quicinc.com>
References: <20230726052245.609987-1-quic_tjiang@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: TSzb7Rd-kV9BpKN7W4e0lcV43fMHKWeE
X-Proofpoint-ORIG-GUID: TSzb7Rd-kV9BpKN7W4e0lcV43fMHKWeE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-25_14,2023-07-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 suspectscore=0 spamscore=0
 mlxscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2307260046
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch adds support for QCA2066 firmware patch and NVM downloading.
as the RF performance of QCA2066 SOC chip from different foundries may
vary. Therefore we use different NVM to configure them based on board ID.

Signed-off-by: Tim Jiang <quic_tjiang@quicinc.com>
---
 drivers/bluetooth/btqca.c   | 76 ++++++++++++++++++++++++++++++++++++-
 drivers/bluetooth/btqca.h   |  3 +-
 drivers/bluetooth/hci_qca.c |  7 ++++
 3 files changed, 83 insertions(+), 3 deletions(-)

diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
index e7e58a956d15..834b28706d90 100644
--- a/drivers/bluetooth/btqca.c
+++ b/drivers/bluetooth/btqca.c
@@ -205,6 +205,46 @@ static int qca_send_reset(struct hci_dev *hdev)
 	return 0;
 }
 
+static int qca_read_fw_board_id(struct hci_dev *hdev, u16 *bid)
+{
+	u8 cmd;
+	struct sk_buff *skb;
+	struct edl_event_hdr *edl;
+	int err = 0;
+	u8 bid_len;
+
+	cmd = EDL_GET_BID_REQ_CMD;
+	skb = __hci_cmd_sync_ev(hdev, EDL_PATCH_CMD_OPCODE, EDL_PATCH_CMD_LEN,
+				&cmd, 0, HCI_INIT_TIMEOUT);
+	if (IS_ERR(skb)) {
+		err = PTR_ERR(skb);
+		bt_dev_err(hdev, "Reading QCA board ID failed (%d)", err);
+		return err;
+	}
+
+	edl = skb_pull_data(skb, sizeof(*edl));
+	if (!edl) {
+		bt_dev_err(hdev, "QCA read board ID with no header");
+		err = -EILSEQ;
+		goto out;
+	}
+
+	if (edl->cresp != EDL_CMD_REQ_RES_EVT ||
+	    edl->rtype != EDL_GET_BID_REQ_CMD) {
+		bt_dev_err(hdev, "QCA Wrong packet: %d %d", edl->cresp, edl->rtype);
+		err = -EIO;
+		goto out;
+	}
+
+	bid_len = edl->data[0];
+	*bid = (edl->data[1] << 8) + edl->data[2];
+	bt_dev_dbg(hdev, "%s: bid len = %x, bid = %x", __func__, bid_len, *bid);
+
+out:
+	kfree_skb(skb);
+	return err;
+}
+
 int qca_send_pre_shutdown_cmd(struct hci_dev *hdev)
 {
 	struct sk_buff *skb;
@@ -574,6 +614,29 @@ int qca_set_bdaddr_rome(struct hci_dev *hdev, const bdaddr_t *bdaddr)
 }
 EXPORT_SYMBOL_GPL(qca_set_bdaddr_rome);
 
+static void qca_generate_nvm_name(struct hci_dev *hdev, char *fwname,
+		   size_t max_size, struct qca_btsoc_version ver, u16 bid)
+{
+	u8 rom_ver;
+	u32 soc_ver;
+	const char *variant;
+
+	soc_ver = get_soc_ver(ver.soc_id, ver.rom_ver);
+	rom_ver = ((soc_ver & 0x00000f00) >> 0x04) | (soc_ver & 0x0000000f);
+
+	if ((le32_to_cpu(ver.soc_id) & 0x0000ff00) == QCA_HSP_GF_SOC_ID)  /* hsp gf chip */
+		variant = "g";
+	else
+		variant = "";
+
+	if (bid == 0x0)
+		snprintf(fwname, max_size, "qca/hpnv%02x%s.bin", rom_ver, variant);
+	else
+		snprintf(fwname, max_size, "qca/hpnv%02x%s.%x", rom_ver, variant, bid);
+
+	bt_dev_dbg(hdev, "%s: nvm name is %s", __func__, fwname);
+}
+
 int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
 		   enum qca_btsoc_type soc_type, struct qca_btsoc_version ver,
 		   const char *firmware_name)
@@ -582,6 +645,7 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
 	int err;
 	u8 rom_ver = 0;
 	u32 soc_ver;
+	u16 boardid = 0;
 
 	bt_dev_dbg(hdev, "QCA setup on UART");
 
@@ -604,6 +668,9 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
 	if (qca_is_wcn399x(soc_type)) {
 		snprintf(config.fwname, sizeof(config.fwname),
 			 "qca/crbtfw%02x.tlv", rom_ver);
+	} else if (soc_type == QCA_QCA2066) {
+		snprintf(config.fwname, sizeof(config.fwname),
+			 "qca/hpbtfw%02x.tlv", rom_ver);
 	} else if (soc_type == QCA_QCA6390) {
 		snprintf(config.fwname, sizeof(config.fwname),
 			 "qca/htbtfw%02x.tlv", rom_ver);
@@ -631,6 +698,9 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
 	/* Give the controller some time to get ready to receive the NVM */
 	msleep(10);
 
+	if (soc_type == QCA_QCA2066)
+		qca_read_fw_board_id(hdev, &boardid);
+
 	/* Download NVM configuration */
 	config.type = TLV_TYPE_NVM;
 	if (firmware_name)
@@ -644,8 +714,10 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
 			snprintf(config.fwname, sizeof(config.fwname),
 				 "qca/crnv%02x.bin", rom_ver);
 		}
-	}
-	else if (soc_type == QCA_QCA6390)
+	} else if (soc_type == QCA_QCA2066) {
+		qca_generate_nvm_name(hdev, config.fwname, sizeof(config.fwname),
+				ver, boardid);
+	} else if (soc_type == QCA_QCA6390)
 		snprintf(config.fwname, sizeof(config.fwname),
 			 "qca/htnv%02x.bin", rom_ver);
 	else if (soc_type == QCA_WCN6750)
diff --git a/drivers/bluetooth/btqca.h b/drivers/bluetooth/btqca.h
index 529382f0abb1..4149e290efe6 100644
--- a/drivers/bluetooth/btqca.h
+++ b/drivers/bluetooth/btqca.h
@@ -12,6 +12,7 @@
 #define EDL_PATCH_VER_REQ_CMD		(0x19)
 #define EDL_PATCH_TLV_REQ_CMD		(0x1E)
 #define EDL_GET_BUILD_INFO_CMD		(0x20)
+#define EDL_GET_BID_REQ_CMD			(0x23)
 #define EDL_NVM_ACCESS_SET_REQ_CMD	(0x01)
 #define EDL_PATCH_CONFIG_CMD		(0x28)
 #define MAX_SIZE_PER_TLV_SEGMENT	(243)
@@ -47,7 +48,7 @@
 	((le32_to_cpu(soc_id) << 16) | (le16_to_cpu(rom_ver)))
 
 #define QCA_FW_BUILD_VER_LEN		255
-
+#define QCA_HSP_GF_SOC_ID			0x1200
 
 enum qca_baudrate {
 	QCA_BAUDRATE_115200 	= 0,
diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 453000df7aec..353c775f53ef 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -1939,6 +1939,11 @@ static const struct qca_device_data qca_soc_data_qca6390 __maybe_unused = {
 	.num_vregs = 0,
 };
 
+static const struct qca_device_data qca_soc_data_qca2066 __maybe_unused = {
+	.soc_type = QCA_QCA2066,
+	.num_vregs = 0,
+};
+
 static const struct qca_device_data qca_soc_data_wcn6750 __maybe_unused = {
 	.soc_type = QCA_WCN6750,
 	.vregs = (struct qca_vreg []) {
@@ -2429,6 +2434,7 @@ static const struct of_device_id qca_bluetooth_of_match[] = {
 	{ .compatible = "qcom,wcn3998-bt", .data = &qca_soc_data_wcn3998},
 	{ .compatible = "qcom,wcn6750-bt", .data = &qca_soc_data_wcn6750},
 	{ .compatible = "qcom,wcn6855-bt", .data = &qca_soc_data_wcn6855},
+	{ .compatible = "qcom,qca2066-bt", .data = &qca_soc_data_qca2066},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, qca_bluetooth_of_match);
@@ -2436,6 +2442,7 @@ MODULE_DEVICE_TABLE(of, qca_bluetooth_of_match);
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id qca_bluetooth_acpi_match[] = {
+	{ "QCOM2066", (kernel_ulong_t)&qca_soc_data_qca2066 },
 	{ "QCOM6390", (kernel_ulong_t)&qca_soc_data_qca6390 },
 	{ "DLA16390", (kernel_ulong_t)&qca_soc_data_qca6390 },
 	{ "DLB16390", (kernel_ulong_t)&qca_soc_data_qca6390 },
-- 
2.41.0

