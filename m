Return-Path: <linux-arm-msm+bounces-8370-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2A883D098
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jan 2024 00:23:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 725A3B21BD2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 23:23:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08CEC12E7F;
	Thu, 25 Jan 2024 23:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y2RbKwzW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E46E12E72
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 23:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706224981; cv=none; b=styDBmCwpl1GHTq9h1ltykrbWoSqO7wZSH5NlpX2TmLUk8i9mORbsSsIgKH0acSTjRILBou2YHc1QeyjcYtTU/8QbzrlacqBA+lEOnOAUJP48tP06VkIwTjNTHZlPIrM+7K3xqYVlPWrExh2HLKAVeXAz6LRNdZfIgiE/RblsMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706224981; c=relaxed/simple;
	bh=SZKxdwmgRDVGE2QNU9L/DH0vzSTWk666yp6Yx5cCxbg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DCicXUU7dBsED5VoNcItPoDxYKIz+LGe8oVvwO7zA/wevhW/2fDYv6KS0FNbH8g+C4enNOHuhLRvcoXgC/tV5Pd80rt+NFjc8p3wexcVmcnBOI4uxPV1u3P0ccAia+yMCusx3jPzfsodv9zvSZZ01iaiMWIF3kA29h5hibrfXS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=y2RbKwzW; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5100c3f7df1so4960e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 15:23:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706224978; x=1706829778; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SGy40y+DJhjEMN+AjL1FrBUXPhOZC7PWKk4E9TredW0=;
        b=y2RbKwzWP/aUYSdkOZpAXmIiNXBtEJYRNC/u+G3Bbwq4pbTXt8ZXEizol/Gykpb87s
         YSSo23gs5Xmo5ilg3G2BCsrlS293pEva3lA+ZVCemf5LUko54RkwhLB1W6y2HYdMZLb0
         yUZPzNOi+EOd6Q4AOQ3qY1qTU5xHi02SIdKEpCkZQronyWp504XPoOV2FbTQu6svdJ3x
         3c+JpN9Z63+NidD2P5SfLL8il2GrkG/YTW4lEyXYr89bXToa0uA55n7kpJew08D59rYX
         QfuXd9bT8LVj/6eZyJlvcp0YVdBiwk9//LsmuOZ1uUtRsI2yCEb986adyXTbvess93KY
         LDVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706224978; x=1706829778;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SGy40y+DJhjEMN+AjL1FrBUXPhOZC7PWKk4E9TredW0=;
        b=Y7vFOHjTwuzfihkQRUeKxPE73Hy+WlB88isbTfXMLb+0IWwAFSraCdFbIanDcP/jRG
         t+9aRneAtSOZyiWEODkMIpxWPqSGGtF57MkF9/uPTe2ORizDcDtT1oXuyfgZa8p1cgS2
         zfEnbz12GZm8DPk+hKr1Odq225PihKfgCje8eMhbWdmC1aJcpsqqwWeGt0T7+X2j+Eiq
         HJCbLJ+XRG1+s4+aFqfaGc63nUTFioQDPsO/MJ4voNuJATjUhN3SG1j3dS3/L24UQ0qy
         X+OoDJsM3zmO+8gS95RKXQp0mpdIcNwLO2AHIUMRs/T0hJ2aOi49W2ild193Kz8zY5Co
         nEQg==
X-Gm-Message-State: AOJu0YwCResMSf3VMQ0ETgBtl+OmmlyOqjm9O0jkVj3rmeq3eNFGTQtD
	Yb2z0dlqnkgSYo0PfS2FGG6/4Oo/ICciqt65blNxwz+YWxbjIq1nOnRSq3u602+tlSVcULqk8iN
	J
X-Google-Smtp-Source: AGHT+IE4iGHS9KrnFDCMQyNMoiXmqSv4z76PvJ9VwuHCiM/KROdPzwno+0RBx5vYxu/xHJRuNMlQwQ==
X-Received: by 2002:a05:6512:ba1:b0:50e:76ac:180b with SMTP id b33-20020a0565120ba100b0050e76ac180bmr702849lfv.53.1706224977937;
        Thu, 25 Jan 2024 15:22:57 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id k3-20020a05651210c300b0050e6df07728sm3920lfg.180.2024.01.25.15.22.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jan 2024 15:22:57 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 26 Jan 2024 01:22:35 +0200
Subject: [PATCH v2 1/8] phy: qcom: qmp-usb-legacy: drop single-lane support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240126-phy-qmp-merge-common-v2-1-a463d0b57836@linaro.org>
References: <20240126-phy-qmp-merge-common-v2-0-a463d0b57836@linaro.org>
In-Reply-To: <20240126-phy-qmp-merge-common-v2-0-a463d0b57836@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=3864;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=SZKxdwmgRDVGE2QNU9L/DH0vzSTWk666yp6Yx5cCxbg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlsu1PWfGjiC6cUWEl6nWgeyD9F3APUjr7JF7om
 5gBs391HM+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZbLtTwAKCRCLPIo+Aiko
 1Xp/B/9sRMgxlws4Ls1xVYECXrUiBrHSoDDlztt/vPPyDz/GWSpgnBY0eGPUR+5bNINiXqhY56K
 nRxJV80Zoa13ELWGI1YWt8wYxh40OquT4/HDRTkaMSQwGocUvwm3Z/epiAcbt8DLb9psWZwD+oK
 3EStiAJGfbCgXdbqS5BiVX3lnKukRXk8stto8B/edyX/86mThNhJzz9hqC8WIvGtbxPifRDmrmE
 JdVQF4NNcaShsweEKlbU/nuPikEZCBsOtOQuSgynPtLgQqgqjHV5rrOPu/mzc8opkZsrJYwDvUZ
 l2udoHC20QhNBUhah9fkGuG7ok/7oJ3PekP/wGtamGMntA1F
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


