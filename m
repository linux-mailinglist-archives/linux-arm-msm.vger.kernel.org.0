Return-Path: <linux-arm-msm+bounces-6702-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 16CE2827D2E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jan 2024 04:04:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2449BB21660
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jan 2024 03:04:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 148BF4430;
	Tue,  9 Jan 2024 03:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Rg37foo2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AEE633EA
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jan 2024 03:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2cd46e7ae8fso24498791fa.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jan 2024 19:04:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704769443; x=1705374243; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SGy40y+DJhjEMN+AjL1FrBUXPhOZC7PWKk4E9TredW0=;
        b=Rg37foo2Hh/9E6SqyZgu/pm7+C4FYzG6DDySqZTgQpVuQb3f0+ayIpdQ2OFPHW6bQ+
         DHSly7w0OItMK6rbSjrfuzmaSqNesWMIuKX0WvCsb3ctaFld7AInl0WUKo2J2sFOkZ6c
         F9V+MpWIx0IDTQJprakIldBsy5bQuacUEBhWyE5sf3VvfoA6I1p5xLG85HCAjYcskNC4
         h7e/+59LiEMjmYgBzHpnPDKyUc3XYPQHiCDJ9Wcftlg5IKaokwju1SemT3mPRl4mDfmr
         Tb4fJbJJun/ywkaBSDcXt+J+/mLq3IRBjv/7XB/Zj0tec11A0kiViWnXR7f65qa/55Wd
         xKbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704769443; x=1705374243;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SGy40y+DJhjEMN+AjL1FrBUXPhOZC7PWKk4E9TredW0=;
        b=W+3OPR1PyqL0uQGoODBEwXdf5RC/o+ejgnhHTWR/F/Fx4XK4aHnarj9uU/72abxZgc
         nVh8fnZPWv8aTDvzogHDo6YiZ9FXkBzGMVm7dzv+dYhwJQ0k6ziRo7V/VEoyOd3VCTJb
         D68+NoBxg+b8bRQoAKk8tFg3Fx63QiRaO06EudiwLIMyw5Gg3lMkOKfJA+P9D+lTg7yE
         nGlwyXvg9x+WE50ljYBUXPt9v/LotgkToVV3VzaqzB5bAIu7r2FNvIAVoO8On9TtM47M
         l6X9YaMo1dVog0gKGdG9cWs+di1trqW6N9mUKJsk9bBuKiKFzUVy1ebPyu3ZYEfWUYpm
         MK7A==
X-Gm-Message-State: AOJu0Ywyt08YpIempXagkNCEOjQm9T8uKX4DKoKC8SXMnFt5+dkEcxPT
	zCDP+LwcBvS7UlxeadkNU/heyKzNB6nznmCXUCB4O9XgSCtjmg==
X-Google-Smtp-Source: AGHT+IGqo535kQT18Z6ElJJhpTvAsLtX7Pi/Cy/n+Rddw5q20dSNefDAlZkXMUDG+zNCkjOQ9U+zkA==
X-Received: by 2002:a2e:7c03:0:b0:2cd:c2c:1c5 with SMTP id x3-20020a2e7c03000000b002cd0c2c01c5mr892727ljc.158.1704769443329;
        Mon, 08 Jan 2024 19:04:03 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id g30-20020a2e391e000000b002cd1ad3b11csm176920lja.42.2024.01.08.19.04.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 19:04:02 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 09 Jan 2024 05:03:59 +0200
Subject: [PATCH 1/8] phy: qcom: qmp-usb-legacy: drop single-lane support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240109-phy-qmp-merge-common-v1-1-572899a14318@linaro.org>
References: <20240109-phy-qmp-merge-common-v1-0-572899a14318@linaro.org>
In-Reply-To: <20240109-phy-qmp-merge-common-v1-0-572899a14318@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=3864;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=SZKxdwmgRDVGE2QNU9L/DH0vzSTWk666yp6Yx5cCxbg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlnLegjj+E2M6XrnsswGGZ8Gvs4QQHOLUtxrPwO
 6rblChhb4yJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZZy3oAAKCRCLPIo+Aiko
 1QTJCACzkxaoZ5f3DnbMPEQP9iSx4/mQ8yi5L4ZfUvEFBNnAggu5/ArXZNTPqZP5PfiXhag8O4p
 q2VMhgFsbtzOCvPl6Fb4jfvKHS8NdnemCMlVIADOePvpwyV6CcVlFFRr1ax4N6yCXpflsIeW1De
 z2YmkjQk7rsjm250Oz9ln500RRzKPw+KciCe//fooKcfbO1h4UM90Oyaus6Hqoi/cZfQCJmqUh1
 78jMpwz1m6N2Fj72Qrhb6P3RZJ28va4EI1txy/cgMKH9A0VSoTSUaHzdfW7u5dIW9BQKIG6Nvkt
 IVS4XluKr0Lpk+Kukrk/jUeICXqIGkW+sR2hWDpOnk6CJYQi
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

All PHYs supported by usb-legacy have two lanes. Drop support for
single-lane configuration.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c | 37 +++++++-------------------
 1 file changed, 9 insertions(+), 28 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c b/drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c
index cf466f6df94d..2f8891bc3da8 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c
@@ -507,8 +507,6 @@ struct qmp_usb_legacy_offsets {
 
 /* struct qmp_phy_cfg - per-PHY initialization config */
 struct qmp_phy_cfg {
-	int lanes;
-
 	const struct qmp_usb_legacy_offsets *offsets;
 
 	/* Init sequence for PHY blocks - serdes, tx, rx, pcs */
@@ -621,8 +619,6 @@ static const char * const qmp_phy_vreg_l[] = {
 };
 
 static const struct qmp_phy_cfg qmp_v3_usb3phy_cfg = {
-	.lanes			= 2,
-
 	.serdes_tbl		= qmp_v3_usb3_serdes_tbl,
 	.serdes_tbl_num		= ARRAY_SIZE(qmp_v3_usb3_serdes_tbl),
 	.tx_tbl			= qmp_v3_usb3_tx_tbl,
@@ -641,8 +637,6 @@ static const struct qmp_phy_cfg qmp_v3_usb3phy_cfg = {
 };
 
 static const struct qmp_phy_cfg sc7180_usb3phy_cfg = {
-	.lanes			= 2,
-
 	.serdes_tbl		= qmp_v3_usb3_serdes_tbl,
 	.serdes_tbl_num		= ARRAY_SIZE(qmp_v3_usb3_serdes_tbl),
 	.tx_tbl			= qmp_v3_usb3_tx_tbl,
@@ -661,8 +655,6 @@ static const struct qmp_phy_cfg sc7180_usb3phy_cfg = {
 };
 
 static const struct qmp_phy_cfg sm8150_usb3phy_cfg = {
-	.lanes			= 2,
-
 	.serdes_tbl		= sm8150_usb3_serdes_tbl,
 	.serdes_tbl_num		= ARRAY_SIZE(sm8150_usb3_serdes_tbl),
 	.tx_tbl			= sm8150_usb3_tx_tbl,
@@ -684,8 +676,6 @@ static const struct qmp_phy_cfg sm8150_usb3phy_cfg = {
 };
 
 static const struct qmp_phy_cfg sm8250_usb3phy_cfg = {
-	.lanes			= 2,
-
 	.serdes_tbl		= sm8150_usb3_serdes_tbl,
 	.serdes_tbl_num		= ARRAY_SIZE(sm8150_usb3_serdes_tbl),
 	.tx_tbl			= sm8250_usb3_tx_tbl,
@@ -707,8 +697,6 @@ static const struct qmp_phy_cfg sm8250_usb3phy_cfg = {
 };
 
 static const struct qmp_phy_cfg sm8350_usb3phy_cfg = {
-	.lanes			= 2,
-
 	.serdes_tbl		= sm8150_usb3_serdes_tbl,
 	.serdes_tbl_num		= ARRAY_SIZE(sm8150_usb3_serdes_tbl),
 	.tx_tbl			= sm8350_usb3_tx_tbl,
@@ -874,10 +862,8 @@ static int qmp_usb_legacy_power_on(struct phy *phy)
 	qmp_usb_legacy_configure_lane(tx, cfg->tx_tbl, cfg->tx_tbl_num, 1);
 	qmp_usb_legacy_configure_lane(rx, cfg->rx_tbl, cfg->rx_tbl_num, 1);
 
-	if (cfg->lanes >= 2) {
-		qmp_usb_legacy_configure_lane(qmp->tx2, cfg->tx_tbl, cfg->tx_tbl_num, 2);
-		qmp_usb_legacy_configure_lane(qmp->rx2, cfg->rx_tbl, cfg->rx_tbl_num, 2);
-	}
+	qmp_usb_legacy_configure_lane(qmp->tx2, cfg->tx_tbl, cfg->tx_tbl_num, 2);
+	qmp_usb_legacy_configure_lane(qmp->rx2, cfg->rx_tbl, cfg->rx_tbl_num, 2);
 
 	qmp_usb_legacy_configure(pcs, cfg->pcs_tbl, cfg->pcs_tbl_num);
 
@@ -1231,20 +1217,15 @@ static int qmp_usb_legacy_parse_dt_legacy(struct qmp_usb *qmp, struct device_nod
 	if (cfg->pcs_usb_offset)
 		qmp->pcs_usb = qmp->pcs + cfg->pcs_usb_offset;
 
-	if (cfg->lanes >= 2) {
-		qmp->tx2 = devm_of_iomap(dev, np, 3, NULL);
-		if (IS_ERR(qmp->tx2))
-			return PTR_ERR(qmp->tx2);
-
-		qmp->rx2 = devm_of_iomap(dev, np, 4, NULL);
-		if (IS_ERR(qmp->rx2))
-			return PTR_ERR(qmp->rx2);
+	qmp->tx2 = devm_of_iomap(dev, np, 3, NULL);
+	if (IS_ERR(qmp->tx2))
+		return PTR_ERR(qmp->tx2);
 
-		qmp->pcs_misc = devm_of_iomap(dev, np, 5, NULL);
-	} else {
-		qmp->pcs_misc = devm_of_iomap(dev, np, 3, NULL);
-	}
+	qmp->rx2 = devm_of_iomap(dev, np, 4, NULL);
+	if (IS_ERR(qmp->rx2))
+		return PTR_ERR(qmp->rx2);
 
+	qmp->pcs_misc = devm_of_iomap(dev, np, 5, NULL);
 	if (IS_ERR(qmp->pcs_misc)) {
 		dev_vdbg(dev, "PHY pcs_misc-reg not used\n");
 		qmp->pcs_misc = NULL;

-- 
2.39.2


