Return-Path: <linux-arm-msm+bounces-15037-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 681DB88A766
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Mar 2024 16:46:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8AFDC1C3EAA2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Mar 2024 15:46:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ACD715AABB;
	Mon, 25 Mar 2024 13:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="TCWRUUf9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B375157A69
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Mar 2024 13:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711372645; cv=none; b=gwwAUDV2b5pDrZDV6Goo06oyVZ7//OngmhoilwKqgcpJ+Sb8HXiM4qKJBsqyGeVbhBgRZKorBMNiFwdGfacp5BRgOfvB1o+1C7D6EuguKCRmEMgklNII6BBX/cYuBequ/PndJQKEK75Qp63VKqwqFGm2bN1bBuuExDESs3xh1O4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711372645; c=relaxed/simple;
	bh=Zu9qHogsjwwvS76RuRykV3Cyl3hZFd1eYZO5KYwA5Tk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lfUf6/o4N9Nrd5cDCBGEs8JPda9tlPSSALLKCSMORx8TimyOyOCPP3XXs/GwyMBQ331eaWZm42AlYm+Gpmti6sFdC5fTAux6TgBIMXV7QCfwhL2yOvETtt3kin3fNH6KUgFxyL3M/xnIkKsWrSK6ebllcAdUJkCX7l/dU7BZ1ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=TCWRUUf9; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4148bc73069so3194085e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Mar 2024 06:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1711372639; x=1711977439; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z6NUiX8vyJKElOCOKE+vXKfTmxYyyFPuN3p6ttUZMX0=;
        b=TCWRUUf91blGzGPBYGy/yjX5PRskP+/zJqpZTQMfiy7HNicgd7NPsBdnKxu50in0xM
         7VBEitn9ksoyhXgNWJPWUdwp+xQoJes2pXwWyYkmyLmj8CgZBvcY3ay/dkewrGtVgz/2
         fAy2RnnJEEQHS3UdXD1lP/g+0LloI3vCehN/721VVU40zHS/Ix7pJlGH43N2VY4s3mHf
         fPo6ZFp9r/xmlPNStVvIe9ojVHsc78VUmuFSDd8Y41VoOrV/UPM+Pynh1mkZqGI5U2tH
         +1B2DiQdlR2wz8d/vU+p+QRsUrSREIIvWhTOk2LDoMwJ8Psa7uSHDlShbUKHXSZzqtvq
         Ql/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711372639; x=1711977439;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z6NUiX8vyJKElOCOKE+vXKfTmxYyyFPuN3p6ttUZMX0=;
        b=P1tx715M0MfDbhZuj0fYW1I7cz5n9rnh/8npr0Q0DUD6jsBeQvkrqTx9wfo8NdPAVB
         +9WqjsiI9B6CNDLsgGIr44kaNJLV7xw1AB/fUC6uduJM0OeGqbpXq6cV2JXJ9BydmkZt
         yyWpF0d7VwUPyFazCEJO3h8X2rngnhfxqKhqIOcpUlzAijE7bLb4DlFuAneDTA21qxnW
         m3k67zw6d7xMWnWr5Mh3a7L+WqdgsD1bgrKk9BPESYzbfRUS1llXwR0sXmp8HnUAHU20
         agu6ULNU4UursjRM1pYyJvsqeghmEl97AOZQ7sHh0BOY0ZfydDLm/mCFrdahEM6K4RKN
         PyCA==
X-Forwarded-Encrypted: i=1; AJvYcCX69OcNU9zg8VCF+iYEbWLEeCOFI7YM7bx/AyjPhhhSpoT/dpZ3yBTWwDhAPs4KuRGSlU0Gr1C3Da7vp28/ab+qfZCtVuP8L/cg2VBW0g==
X-Gm-Message-State: AOJu0YyBc08OIe2ZYkTFqLXeIdaqyDPMtE13jDzvcbCN/b2JQ7sOkqRz
	3HJ00bckPYweLfTitij19H03nA9VOSEygtTwawb37AZauWIp0zcmXKuUlY+DBQQ=
X-Google-Smtp-Source: AGHT+IGplibW2rPlAAjnQL9sObEnEZwVK6gcoiaHcEbAGyGcbuZT+b3GNUpQhb2YKD5liRnzXnHTNw==
X-Received: by 2002:a05:600c:3113:b0:413:ee55:8bba with SMTP id g19-20020a05600c311300b00413ee558bbamr6671288wmo.4.1711372639502;
        Mon, 25 Mar 2024 06:17:19 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:75a:e000:861d:8b72:a859:4ce9])
        by smtp.gmail.com with ESMTPSA id p11-20020a056000018b00b0033e75e5f280sm9485245wrx.113.2024.03.25.06.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 06:17:19 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kalle Valo <kvalo@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Saravana Kannan <saravanak@google.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Arnd Bergmann <arnd@arndb.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Alex Elder <elder@linaro.org>,
	Srini Kandagatla <srinivas.kandagatla@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Lukas Wunner <lukas@wunner.de>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-bluetooth@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v6 15/16] Bluetooth: qca: use the power sequencer for QCA6390
Date: Mon, 25 Mar 2024 14:16:23 +0100
Message-Id: <20240325131624.26023-16-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240325131624.26023-1-brgl@bgdev.pl>
References: <20240325131624.26023-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Use the pwrseq subsystem's consumer API to run the power-up sequence for
the Bluetooth module of the QCA6390 package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/bluetooth/hci_qca.c | 74 +++++++++++++++++++++++++++++--------
 1 file changed, 59 insertions(+), 15 deletions(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 8a60ad7acd70..d31dcea650c1 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -29,6 +29,7 @@
 #include <linux/of.h>
 #include <linux/acpi.h>
 #include <linux/platform_device.h>
+#include <linux/pwrseq/consumer.h>
 #include <linux/regulator/consumer.h>
 #include <linux/serdev.h>
 #include <linux/mutex.h>
@@ -215,6 +216,7 @@ struct qca_power {
 	struct regulator_bulk_data *vreg_bulk;
 	int num_vregs;
 	bool vregs_on;
+	struct pwrseq_desc *pwrseq;
 };
 
 struct qca_serdev {
@@ -1682,6 +1684,27 @@ static bool qca_wakeup(struct hci_dev *hdev)
 	return wakeup;
 }
 
+static int qca_port_reopen(struct hci_uart *hu)
+{
+	int ret;
+
+	/* Now the device is in ready state to communicate with host.
+	 * To sync host with device we need to reopen port.
+	 * Without this, we will have RTS and CTS synchronization
+	 * issues.
+	 */
+	serdev_device_close(hu->serdev);
+	ret = serdev_device_open(hu->serdev);
+	if (ret) {
+		bt_dev_err(hu->hdev, "failed to open port");
+		return ret;
+	}
+
+	hci_uart_set_flow_control(hu, false);
+
+	return 0;
+}
+
 static int qca_regulator_init(struct hci_uart *hu)
 {
 	enum qca_btsoc_type soc_type = qca_soc_type(hu);
@@ -1750,21 +1773,7 @@ static int qca_regulator_init(struct hci_uart *hu)
 		break;
 	}
 
-	/* Now the device is in ready state to communicate with host.
-	 * To sync host with device we need to reopen port.
-	 * Without this, we will have RTS and CTS synchronization
-	 * issues.
-	 */
-	serdev_device_close(hu->serdev);
-	ret = serdev_device_open(hu->serdev);
-	if (ret) {
-		bt_dev_err(hu->hdev, "failed to open port");
-		return ret;
-	}
-
-	hci_uart_set_flow_control(hu, false);
-
-	return 0;
+	return qca_port_reopen(hu);
 }
 
 static int qca_power_on(struct hci_dev *hdev)
@@ -1792,6 +1801,17 @@ static int qca_power_on(struct hci_dev *hdev)
 		ret = qca_regulator_init(hu);
 		break;
 
+	case QCA_QCA6390:
+		qcadev = serdev_device_get_drvdata(hu->serdev);
+		ret = pwrseq_power_on(qcadev->bt_power->pwrseq);
+		if (ret)
+			return ret;
+
+		ret = qca_port_reopen(hu);
+		if (ret)
+			return ret;
+		break;
+
 	default:
 		qcadev = serdev_device_get_drvdata(hu->serdev);
 		if (qcadev->bt_en) {
@@ -2170,6 +2190,10 @@ static void qca_power_shutdown(struct hci_uart *hu)
 		}
 		break;
 
+	case QCA_QCA6390:
+		pwrseq_power_off(qcadev->bt_power->pwrseq);
+		break;
+
 	default:
 		gpiod_set_value_cansleep(qcadev->bt_en, 0);
 	}
@@ -2308,12 +2332,25 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 	case QCA_WCN6750:
 	case QCA_WCN6855:
 	case QCA_WCN7850:
+	case QCA_QCA6390:
 		qcadev->bt_power = devm_kzalloc(&serdev->dev,
 						sizeof(struct qca_power),
 						GFP_KERNEL);
 		if (!qcadev->bt_power)
 			return -ENOMEM;
+		break;
+	default:
+		break;
+	}
 
+	switch (qcadev->btsoc_type) {
+	case QCA_WCN3988:
+	case QCA_WCN3990:
+	case QCA_WCN3991:
+	case QCA_WCN3998:
+	case QCA_WCN6750:
+	case QCA_WCN6855:
+	case QCA_WCN7850:
 		qcadev->bt_power->dev = &serdev->dev;
 		err = qca_init_regulators(qcadev->bt_power, data->vregs,
 					  data->num_vregs);
@@ -2354,6 +2391,13 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 		}
 		break;
 
+	case QCA_QCA6390:
+		qcadev->bt_power->pwrseq = devm_pwrseq_get(&serdev->dev,
+							   "bluetooth");
+		if (IS_ERR(qcadev->bt_power->pwrseq))
+			return PTR_ERR(qcadev->bt_power->pwrseq);
+		fallthrough;
+
 	default:
 		qcadev->bt_en = devm_gpiod_get_optional(&serdev->dev, "enable",
 					       GPIOD_OUT_LOW);
-- 
2.40.1


