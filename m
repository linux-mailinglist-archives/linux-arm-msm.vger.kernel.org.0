Return-Path: <linux-arm-msm+bounces-7172-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA79382C9AA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jan 2024 06:43:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 54D53286082
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jan 2024 05:43:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 581E8F9D2;
	Sat, 13 Jan 2024 05:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R5L5QXdh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 851F31A719
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jan 2024 05:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2cd46e7ae8fso80937171fa.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jan 2024 21:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705124569; x=1705729369; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0ECF4xeGyS84BCoz/EcX50y2jLIrAgXZ1cOppZLqEXg=;
        b=R5L5QXdhCF03w4gog16PHiZzBEmx4hYuqRsdWywyyRLOxgjAxnVAVT6XleLLE5GeFU
         YIE5t+bfMWMlOIQwjl+likXGb65+9i52ES1w05pJLw179phWzNcCVFb+/7MgX3BhkcBQ
         RJ68h3l632gink+05GDjN7QN8qGZhBSmOAdOvSI5H4oCcVxbTeI7LOr4eMpQLJO8gfII
         pFQ7tn3rn4iFHBzRV9RB6wAIsn5U7eKM89CIjxbP5YOm1Lwk5WasrEGdsoyInQfvevqy
         iF9h7isAmvPrsKLxTS8m3akoJhkllk6j6KBlDcN228ODZDzz3phZ3fD51T7qPn9u/U39
         2JYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705124569; x=1705729369;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0ECF4xeGyS84BCoz/EcX50y2jLIrAgXZ1cOppZLqEXg=;
        b=gOAX/1z1GZGXMrJ5xqDXAbGgqCDNxRgz5x4cPN7x2tXjnnVNUMjOtwgJkWPp7yySy3
         ++kkQIV1U2ATY1OarEz5FBgl7tO7xFcIeD5W2PslAVgvySl66Do7CGqYDKwRj8rXSDu1
         GfIRZj2F89FWDJcSzM1MCxmdkX4YyualsDH2/I5ya3OogFl/TJJDNCwlRh6C2Nqp0+jj
         +Wmt0oCyeb33JycGdKj4SMx7+Zv7OEjL7lu3N4Un1wYsk5fzrrSF0aUwOQ5wDuaR5hUo
         9bkfzA548pU2DfEOVYCD9yunz1jU+dKrdTY1BsCODNVa72t3HIbSoDXG60xbNj8nceBG
         v44w==
X-Gm-Message-State: AOJu0Yxpnu4kNckosNONtkT1NfGRTW9RXo8609EO2/ZstTf6W+dGdGc3
	Xn3ovUA61lr5KVTV7buH3lHInJUQ5fmleg==
X-Google-Smtp-Source: AGHT+IFuZ8KYIlQ596YAkjwkadTsbP2Ny6UXmX4GYzvavxYOUXI1TIeDKlfdfg5Ug9C2wp2k4J2nUQ==
X-Received: by 2002:a05:651c:213:b0:2cc:f993:e40c with SMTP id y19-20020a05651c021300b002ccf993e40cmr603714ljn.9.1705124569790;
        Fri, 12 Jan 2024 21:42:49 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id r22-20020a2eb616000000b002cc71e9168csm677719ljn.129.2024.01.12.21.42.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jan 2024 21:42:49 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 13 Jan 2024 07:42:46 +0200
Subject: [PATCH 09/13] phy: qcom: qmp-usbc: drop single lane handling
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240113-pmi632-typec-v1-9-de7dfd459353@linaro.org>
References: <20240113-pmi632-typec-v1-0-de7dfd459353@linaro.org>
In-Reply-To: <20240113-pmi632-typec-v1-0-de7dfd459353@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Guenter Roeck <linux@roeck-us.net>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-phy@lists.infradead.org
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=3148;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=UisAuRjDYlccXYZeHJj5rFNlGEZ17JayC7TRBBm7Sck=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBloiLRZvq1ycb60O52UIrEeUpj+JTNyiI2HyQgL
 t4srEbZ8HuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZaIi0QAKCRCLPIo+Aiko
 1VgCB/9HI43MbXB+YW97AUQohOOwQb6A2g8DOEiZ3Be8/tnFby3U3yFmq8DExU0DPviGQQ2NzpJ
 sp+FHuqqln53CNcUXj3s0UPK+LCXPGUqXDNDnJsxNdfvmS+ziI79NnPEf3Uc6nlk16e+rtnWsAE
 twP5mMgDb1o1qDVupT3EH9IC2evoA2QFm59fF8cIf8Ep3Uc9ss3frD92TuldIzi4aLw4NTXrM32
 VCSzgdlgd9zg7oS2cOf8YTtFEBRIgrKx2OS3ASzSMqmU9szEVQQNta0YHymAuVC4rmESOsk8y82
 6tQmcxBOmMetkC8Fdfl0DEwtvb8oOdiETYzAni9yVKUGOl6R
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

All USB-C PHYs use 2 lanes for the USB. Drop single lane handling in
this driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 36 ++++++++++----------------------
 1 file changed, 11 insertions(+), 25 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
index fd2439175cdf..21faed7f648a 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
@@ -332,8 +332,6 @@ struct qmp_usbc_offsets {
 
 /* struct qmp_phy_cfg - per-PHY initialization config */
 struct qmp_phy_cfg {
-	int lanes;
-
 	const struct qmp_usbc_offsets *offsets;
 
 	/* Init sequence for PHY blocks - serdes, tx, rx, pcs */
@@ -444,8 +442,6 @@ static const struct qmp_usbc_offsets qmp_usbc_offsets_v3_qcm2290 = {
 };
 
 static const struct qmp_phy_cfg msm8998_usb3phy_cfg = {
-	.lanes			= 2,
-
 	.offsets		= &qmp_usbc_offsets_v3_qcm2290,
 
 	.serdes_tbl             = msm8998_usb3_serdes_tbl,
@@ -462,8 +458,6 @@ static const struct qmp_phy_cfg msm8998_usb3phy_cfg = {
 };
 
 static const struct qmp_phy_cfg qcm2290_usb3phy_cfg = {
-	.lanes			= 2,
-
 	.offsets		= &qmp_usbc_offsets_v3_qcm2290,
 
 	.serdes_tbl		= qcm2290_usb3_serdes_tbl,
@@ -596,10 +590,8 @@ static int qmp_usbc_power_on(struct phy *phy)
 	qmp_usbc_configure_lane(tx, cfg->tx_tbl, cfg->tx_tbl_num, 1);
 	qmp_usbc_configure_lane(rx, cfg->rx_tbl, cfg->rx_tbl_num, 1);
 
-	if (cfg->lanes >= 2) {
-		qmp_usbc_configure_lane(qmp->tx2, cfg->tx_tbl, cfg->tx_tbl_num, 2);
-		qmp_usbc_configure_lane(qmp->rx2, cfg->rx_tbl, cfg->rx_tbl_num, 2);
-	}
+	qmp_usbc_configure_lane(qmp->tx2, cfg->tx_tbl, cfg->tx_tbl_num, 2);
+	qmp_usbc_configure_lane(qmp->rx2, cfg->rx_tbl, cfg->rx_tbl_num, 2);
 
 	qmp_usbc_configure(pcs, cfg->pcs_tbl, cfg->pcs_tbl_num);
 
@@ -940,19 +932,15 @@ static int qmp_usbc_parse_dt_legacy(struct qmp_usbc *qmp, struct device_node *np
 	if (cfg->pcs_usb_offset)
 		qmp->pcs_usb = qmp->pcs + cfg->pcs_usb_offset;
 
-	if (cfg->lanes >= 2) {
-		qmp->tx2 = devm_of_iomap(dev, np, 3, NULL);
-		if (IS_ERR(qmp->tx2))
-			return PTR_ERR(qmp->tx2);
+	qmp->tx2 = devm_of_iomap(dev, np, 3, NULL);
+	if (IS_ERR(qmp->tx2))
+		return PTR_ERR(qmp->tx2);
 
-		qmp->rx2 = devm_of_iomap(dev, np, 4, NULL);
-		if (IS_ERR(qmp->rx2))
-			return PTR_ERR(qmp->rx2);
+	qmp->rx2 = devm_of_iomap(dev, np, 4, NULL);
+	if (IS_ERR(qmp->rx2))
+		return PTR_ERR(qmp->rx2);
 
-		qmp->pcs_misc = devm_of_iomap(dev, np, 5, NULL);
-	} else {
-		qmp->pcs_misc = devm_of_iomap(dev, np, 3, NULL);
-	}
+	qmp->pcs_misc = devm_of_iomap(dev, np, 5, NULL);
 
 	if (IS_ERR(qmp->pcs_misc)) {
 		dev_vdbg(dev, "PHY pcs_misc-reg not used\n");
@@ -1004,10 +992,8 @@ static int qmp_usbc_parse_dt(struct qmp_usbc *qmp)
 	qmp->tx = base + offs->tx;
 	qmp->rx = base + offs->rx;
 
-	if (cfg->lanes >= 2) {
-		qmp->tx2 = base + offs->tx2;
-		qmp->rx2 = base + offs->rx2;
-	}
+	qmp->tx2 = base + offs->tx2;
+	qmp->rx2 = base + offs->rx2;
 
 	ret = qmp_usbc_clk_init(qmp);
 	if (ret)

-- 
2.39.2


