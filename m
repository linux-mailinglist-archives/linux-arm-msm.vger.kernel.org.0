Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 838A17009AA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 May 2023 15:59:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241389AbjELN7H (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 May 2023 09:59:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241364AbjELN7C (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 May 2023 09:59:02 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9B9C12EA9
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 May 2023 06:58:55 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-50b383222f7so14795012a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 May 2023 06:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1683899934; x=1686491934;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q+GkMxVZ4HN2CQYFsf4cf6CWvTAfmT2XHzodRt50Yo4=;
        b=eJJyI2CyqlEHutKdDkmDy0PqlrFJyKINVnsICnS6tgca6znravmgQfyYRxeeUUPr9/
         vFUIQ2usV9FHDP7F8NxK4PpbtsK9OD0Ak//ykd3A01X2/BGNXyk++79qNNckjailXSl9
         Eioz35yq7S9T9+/V0RgjtOTkaDk28KVzLs5BSbxDM24yhgdypxLtXaVuOHxSzXlb94PZ
         WeKReezsLpQeVnUVE/n1MoGKxByqlzDCK962lQNKF5glCha4z2ClA+/aBTFoChRdrbZ9
         55QohDxM/e5+EzgKdlKe9LisKyJK8Mdxdd5juzSw0zyIobGheAz9nkX5IFR6YDPA8Qob
         0POw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683899934; x=1686491934;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q+GkMxVZ4HN2CQYFsf4cf6CWvTAfmT2XHzodRt50Yo4=;
        b=jtDAO/Ru4tn2wS11VuPkGXLyIgUklEIKbhQQNh9nBYsPKs7IkNUBrJ3jiiQgzk7dx8
         HuIA/gaVSkQ5aNLNN/c1H4mjmzPLjfk20ML+WkK1k7/xPJGZnI5/mYXmV5BTd55KHoq1
         cMB1Wuw76eXz7ApTJEgMg0zfz5ySROR5KFFdWHSZkCoOr64kfMnVbzlYWR8soRlaLcxW
         /zgzcDu2gr/6KBm46KFLl0lE5+qh/W8seVp674aNSC3lpxHraqr5HItI1hvp9K3D8q9K
         mx9TgOcyOSs5ru9vUcWK59X76wU7J/EuodEkg75qDVxTAr5trskgPHUNUfdRu5/hvRfk
         uScQ==
X-Gm-Message-State: AC+VfDx4vP23UBM1lBz+kK3iceb4wB0yS8ynxrPL7QqkmhNvJwHhU8op
        e7zKEsikQLC5DvDYnntPdDe3+Q==
X-Google-Smtp-Source: ACHHUZ4qJPw6ZIiUkTaCTSFto7leEePDRzw81YJiq3/zIsXWkpSVl7nD0MWuQL0JLH/FOFFJ8FbDTg==
X-Received: by 2002:a17:907:1c23:b0:966:2984:3da0 with SMTP id nc35-20020a1709071c2300b0096629843da0mr22045514ejc.63.1683899934309;
        Fri, 12 May 2023 06:58:54 -0700 (PDT)
Received: from [172.16.240.113] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id mc27-20020a170906eb5b00b00966330021e9sm5399061ejb.47.2023.05.12.06.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 May 2023 06:58:53 -0700 (PDT)
From:   Luca Weiss <luca.weiss@fairphone.com>
Date:   Fri, 12 May 2023 15:58:24 +0200
Subject: [PATCH v2 2/4] Bluetooth: btqca: Add WCN3988 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230421-fp4-bluetooth-v2-2-3de840d5483e@fairphone.com>
References: <20230421-fp4-bluetooth-v2-0-3de840d5483e@fairphone.com>
In-Reply-To: <20230421-fp4-bluetooth-v2-0-3de840d5483e@fairphone.com>
To:     "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.12.2
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for the Bluetooth chip codenamed APACHE which is part of
WCN3988.

The firmware for this chip has a slightly different naming scheme
compared to most others. For ROM Version 0x0200 we need to use
apbtfw10.tlv + apnv10.bin and for ROM version 0x201 apbtfw11.tlv +
apnv11.bin

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/bluetooth/btqca.c   | 13 +++++++++++--
 drivers/bluetooth/btqca.h   | 12 ++++++++++--
 drivers/bluetooth/hci_qca.c | 12 ++++++++++++
 3 files changed, 33 insertions(+), 4 deletions(-)

diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
index fd0941fe8608..3ee1ef88a640 100644
--- a/drivers/bluetooth/btqca.c
+++ b/drivers/bluetooth/btqca.c
@@ -594,14 +594,20 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
 	/* Firmware files to download are based on ROM version.
 	 * ROM version is derived from last two bytes of soc_ver.
 	 */
-	rom_ver = ((soc_ver & 0x00000f00) >> 0x04) | (soc_ver & 0x0000000f);
+	if (soc_type == QCA_WCN3988)
+		rom_ver = ((soc_ver & 0x00000f00) >> 0x05) | (soc_ver & 0x0000000f);
+	else
+		rom_ver = ((soc_ver & 0x00000f00) >> 0x04) | (soc_ver & 0x0000000f);
 
 	if (soc_type == QCA_WCN6750)
 		qca_send_patch_config_cmd(hdev);
 
 	/* Download rampatch file */
 	config.type = TLV_TYPE_PATCH;
-	if (qca_is_wcn399x(soc_type)) {
+	if (soc_type == QCA_WCN3988) {
+		snprintf(config.fwname, sizeof(config.fwname),
+			 "qca/apbtfw%02x.tlv", rom_ver);
+	} else if (qca_is_wcn399x(soc_type)) {
 		snprintf(config.fwname, sizeof(config.fwname),
 			 "qca/crbtfw%02x.tlv", rom_ver);
 	} else if (soc_type == QCA_QCA6390) {
@@ -636,6 +642,9 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
 	if (firmware_name)
 		snprintf(config.fwname, sizeof(config.fwname),
 			 "qca/%s", firmware_name);
+	else if (soc_type == QCA_WCN3988)
+		snprintf(config.fwname, sizeof(config.fwname),
+			 "qca/apnv%02x.bin", rom_ver);
 	else if (qca_is_wcn399x(soc_type)) {
 		if (ver.soc_id == QCA_WCN3991_SOC_ID) {
 			snprintf(config.fwname, sizeof(config.fwname),
diff --git a/drivers/bluetooth/btqca.h b/drivers/bluetooth/btqca.h
index b884095bcd9d..fc6cf314eb0e 100644
--- a/drivers/bluetooth/btqca.h
+++ b/drivers/bluetooth/btqca.h
@@ -142,6 +142,7 @@ enum qca_btsoc_type {
 	QCA_INVALID = -1,
 	QCA_AR3002,
 	QCA_ROME,
+	QCA_WCN3988,
 	QCA_WCN3990,
 	QCA_WCN3998,
 	QCA_WCN3991,
@@ -162,8 +163,15 @@ int qca_set_bdaddr(struct hci_dev *hdev, const bdaddr_t *bdaddr);
 int qca_send_pre_shutdown_cmd(struct hci_dev *hdev);
 static inline bool qca_is_wcn399x(enum qca_btsoc_type soc_type)
 {
-	return soc_type == QCA_WCN3990 || soc_type == QCA_WCN3991 ||
-	       soc_type == QCA_WCN3998;
+	switch (soc_type) {
+	case QCA_WCN3988:
+	case QCA_WCN3990:
+	case QCA_WCN3991:
+	case QCA_WCN3998:
+		return true;
+	default:
+		return false;
+	}
 }
 static inline bool qca_is_wcn6750(enum qca_btsoc_type soc_type)
 {
diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 1b064504b388..5280236d4b96 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -1835,6 +1835,17 @@ static const struct hci_uart_proto qca_proto = {
 	.dequeue	= qca_dequeue,
 };
 
+static const struct qca_device_data qca_soc_data_wcn3988 __maybe_unused = {
+	.soc_type = QCA_WCN3988,
+	.vregs = (struct qca_vreg []) {
+		{ "vddio", 15000  },
+		{ "vddxo", 80000  },
+		{ "vddrf", 300000 },
+		{ "vddch0", 450000 },
+	},
+	.num_vregs = 4,
+};
+
 static const struct qca_device_data qca_soc_data_wcn3990 __maybe_unused = {
 	.soc_type = QCA_WCN3990,
 	.vregs = (struct qca_vreg []) {
@@ -2359,6 +2370,7 @@ static const struct of_device_id qca_bluetooth_of_match[] = {
 	{ .compatible = "qcom,qca6174-bt" },
 	{ .compatible = "qcom,qca6390-bt", .data = &qca_soc_data_qca6390},
 	{ .compatible = "qcom,qca9377-bt" },
+	{ .compatible = "qcom,wcn3988-bt", .data = &qca_soc_data_wcn3988},
 	{ .compatible = "qcom,wcn3990-bt", .data = &qca_soc_data_wcn3990},
 	{ .compatible = "qcom,wcn3991-bt", .data = &qca_soc_data_wcn3991},
 	{ .compatible = "qcom,wcn3998-bt", .data = &qca_soc_data_wcn3998},

-- 
2.40.1

