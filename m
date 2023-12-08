Return-Path: <linux-arm-msm+bounces-3901-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9D1809EE3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 10:11:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DB2491F20ECB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 09:11:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1ED612E44;
	Fri,  8 Dec 2023 09:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="oePBDBDJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E112D1986
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Dec 2023 01:10:36 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3332e351670so1723765f8f.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Dec 2023 01:10:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1702026635; x=1702631435; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=abIGam56kSZ3DhSDuEO3BjQb5HXWW5MMfEQ3kw2b1bA=;
        b=oePBDBDJ0hWA47MUtbrdqGt8RXbD6BJlZOhrNvbdepjE2sd1ueDG6RspnS2QDJ0vik
         w2MQXu87pC/opdB+1sp98DShtYdppLC8UaGWiEyCIeEA8XQOr1Jo/FWf7GAClzaXiJab
         /wNTXn/yhR6GNjtxCKorxufU/rjkeIDnEoQ3RHIU0rPSpRtSdALJnMOSLd3lIRaR2Hjo
         3YTXYVjdkYpPGRR0xz0GYTdKb+LMzD9a5nDZLvpU2n+3LGcec0xnyahBf/Z28QXgdcWg
         25Gh+/JbNRtY5RFF5xAeXZWmyDj8OQ7f4QdPKix+X1u9zridv9IKVPkJiWzyyPz+DQqa
         y+HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702026635; x=1702631435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=abIGam56kSZ3DhSDuEO3BjQb5HXWW5MMfEQ3kw2b1bA=;
        b=eXWQY4GQnbqgidCV9tK6JJeCSmSWn+dLKerYX7OAkKJy9owYUywFPq45e1iAf5qWF4
         prRoUmm9dtLeGueAkpvoaow3VpeubMYNK5RffFHahqZoEpS5byT1/CZ1PSPuR3rjZ4GR
         qKEEywfysgFr0sEkP+hT/XUpNHg4ZGejP/Ffk8jAdHivajxwF2AHsLJO5LYT2WbMpz41
         +kvkptTejcoazt9YxL5jaV6swGljEyHHp1knzlmUODDKGT9pMUVvodbBhyyPnDI87R4J
         ahmfoPNDOGzqJ4/Lj3h0Y4qCiH/ouxsZsw6D0stgA8q4VRObPDxszp6KgJv+5C6HHV3g
         JupQ==
X-Gm-Message-State: AOJu0Yz6WTFkpZlvUuw0tABHxJpHjIJpOI7UHfEpm7J168rh4ruXem79
	KnTFRjq8KEAULVW6265bf0IhBA==
X-Google-Smtp-Source: AGHT+IEffTxMrB0wVXm8iKV0mWClhcJ3Rprr261syCocmzE/zRP7gqxm1rAxN42bfZ6Xqn9vwOI4fg==
X-Received: by 2002:a5d:668a:0:b0:333:4635:c914 with SMTP id l10-20020a5d668a000000b003334635c914mr1260391wru.82.1702026635358;
        Fri, 08 Dec 2023 01:10:35 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:b162:2510:4488:c0c3])
        by smtp.gmail.com with ESMTPSA id a18-20020a5d5092000000b00333415503a7sm1572705wrt.22.2023.12.08.01.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 01:10:35 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Marcel Holtmann <marcel@holtmann.org>,
	Johan Hedberg <johan.hedberg@gmail.com>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
	Rocky Liao <quic_rjliao@quicinc.com>,
	Alex Elder <elder@linaro.org>,
	Srini Kandagatla <srinivas.kandagatla@linaro.org>
Cc: linux-bluetooth@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [RESEND PATCH v2 3/3] Bluetooth: qca: run the power-on/off sequence for QCA6390 too
Date: Fri,  8 Dec 2023 10:09:36 +0100
Message-Id: <20231208090936.27769-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231208090936.27769-1-brgl@bgdev.pl>
References: <20231208090936.27769-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The Bluetooth module on QCA6390 needs to be powered-on by enabling the
relevant regulators and driving the enable GPIO high. We can reuse the
power sequence for the WNC models if we add the list of required
regulators to the OF match data.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/bluetooth/hci_qca.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 35f74f209d1f..b27be08a1f6f 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -1788,6 +1788,7 @@ static int qca_power_on(struct hci_dev *hdev)
 	case QCA_WCN6750:
 	case QCA_WCN6855:
 	case QCA_WCN7850:
+	case QCA_QCA6390:
 		ret = qca_regulator_init(hu);
 		break;
 
@@ -2044,7 +2045,15 @@ static const struct qca_device_data qca_soc_data_qca2066 __maybe_unused = {
 
 static const struct qca_device_data qca_soc_data_qca6390 __maybe_unused = {
 	.soc_type = QCA_QCA6390,
-	.num_vregs = 0,
+	.vregs = (struct qca_vreg []) {
+		{ "vddio", 20000 },
+		{ "vddaon", 100000 },
+		{ "vddpmu", 1250000 },
+		{ "vddrfa0p9", 200000 },
+		{ "vddrfa1p3", 400000 },
+		{ "vddrfa1p9", 400000 },
+	},
+	.num_vregs = 6,
 };
 
 static const struct qca_device_data qca_soc_data_wcn6750 __maybe_unused = {
@@ -2129,6 +2138,7 @@ static void qca_power_shutdown(struct hci_uart *hu)
 
 	case QCA_WCN6750:
 	case QCA_WCN6855:
+	case QCA_QCA6390:
 		gpiod_set_value_cansleep(qcadev->bt_en, 0);
 		msleep(100);
 		qca_regulator_disable(qcadev);
@@ -2276,6 +2286,7 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 	case QCA_WCN6750:
 	case QCA_WCN6855:
 	case QCA_WCN7850:
+	case QCA_QCA6390:
 		qcadev->bt_power = devm_kzalloc(&serdev->dev,
 						sizeof(struct qca_power),
 						GFP_KERNEL);
@@ -2386,6 +2397,7 @@ static void qca_serdev_remove(struct serdev_device *serdev)
 	case QCA_WCN6750:
 	case QCA_WCN6855:
 	case QCA_WCN7850:
+	case QCA_QCA6390:
 		if (power->vregs_on) {
 			qca_power_shutdown(&qcadev->serdev_hu);
 			break;
-- 
2.40.1


