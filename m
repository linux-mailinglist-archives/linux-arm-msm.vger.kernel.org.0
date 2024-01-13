Return-Path: <linux-arm-msm+bounces-7223-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD9F82CE95
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jan 2024 21:57:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7CAE4282C79
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jan 2024 20:57:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 116C618AE8;
	Sat, 13 Jan 2024 20:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G4SdBUG3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 328C718633
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jan 2024 20:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-50e759ece35so8500618e87.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jan 2024 12:56:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705179362; x=1705784162; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ocqUmmZ/X296NwFA4flyjkRbWukD7GvTg3YxA6yGitg=;
        b=G4SdBUG3eT2d6Ns1Uhk1g06yK7dzZX4QZBYVqGBzyVUC+PU67honsLrveMss7S42zU
         E5BIpgFHpYqEycWDLujf2HpSD9s/VzCSLEBmjSFmB8nkIZbRi9jKL6WlqydcxEzOOVuH
         0xUmLeosZrKdIWFukb3EKZq6567fX6+KSM67puYw3lSJD/IjXaa2q+bLGIHq+OCuzacy
         qfR4/vEnCOVeWuGhJac+Cz+1036LaSWYByLjGZ21ikAAq8oLTl82DAmsznxXNdrNE7/2
         PVHFPT2Gt2leoLmvouK5o8bSU5iar2hjj9X+Mtm5wLljxT/L8ccLsnZ8q6zUC+neOlcN
         2abw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705179362; x=1705784162;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ocqUmmZ/X296NwFA4flyjkRbWukD7GvTg3YxA6yGitg=;
        b=bfjAMqRnStaEaC7xnEUcMF9VbpC+I88NX9lN+ShDt1sU1hhmliumbc1U+pV/A+/Exw
         B3WUfRTE86o/idYORYCaZ5STxBJgRDCUv52LHPTScyS6H88GvRxPwc1JaOVVHF6nyZDD
         LwukNefWlPzExNLDzqisRr0ehfuGA4ABQswRMPHT9hSUcXQE9PJK33fhyxE98TVPvanS
         qVq3gKIAfIjKkWcMP67AaP8PKaIQzPmnbxdwHh0DObjYKvZ40EDOC1rm3KUN8GTuvZZT
         ftVZbmPNCvKtlczL+zPLX2zWnT/komaxRwGLEgJv7rdCt/AE4IMkcrgGnEH6u6Sl7n+a
         oKjw==
X-Gm-Message-State: AOJu0YwCK5q6CHSLq5/7TyU2X7dCitUdaOlTZkLM0YoGXORoZZhBm/88
	wNxtE721ThDqlcvOyn5btkCPdwAruW349A==
X-Google-Smtp-Source: AGHT+IFq5oyAxNyvZqsebgXqK9XeuFvoy7sczjjQk42iU+4SXCyPiqkCuX4XXzNEeVFM3pzj9qSVAQ==
X-Received: by 2002:a19:4317:0:b0:50e:cbf9:682f with SMTP id q23-20020a194317000000b0050ecbf9682fmr1333728lfa.89.1705179362378;
        Sat, 13 Jan 2024 12:56:02 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id p14-20020a056512328e00b0050e9355d7eesm919802lfe.103.2024.01.13.12.56.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jan 2024 12:56:02 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 13 Jan 2024 22:55:54 +0200
Subject: [PATCH v2 11/15] phy: qcom: qmp-usb: drop dual-lane handling
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240113-pmi632-typec-v2-11-182d9aa0a5b3@linaro.org>
References: <20240113-pmi632-typec-v2-0-182d9aa0a5b3@linaro.org>
In-Reply-To: <20240113-pmi632-typec-v2-0-182d9aa0a5b3@linaro.org>
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
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-phy@lists.infradead.org
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=6460;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=8Dls26g2bshLZ1TTPkRX3m67fZ2HP79XYN3bxXtlmvY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlovjXoLHSPe5bguIF7nWwQTULJ0mFKEIWGZ9uH
 ssM6WbKDu+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZaL41wAKCRCLPIo+Aiko
 1TBcB/4tjZdrNuWkAPNFXEmUdlxAvzKC4QXcW7OQDxsDYCnfU/tlD3s/EYbBgouQ8iiJDa41VxG
 NNQO04oEQHhK4PhxapxxAZgPjKRhXzladm8pFBKdJ3Vi0lRF5LVi57z77maJz1WYuSw7lrEYFFA
 KksvNvJh7rWKveQ+WhOP0R6sBbkR5tuUrRTG7cowz1DKOl4mnwsxqFnsSAU2FSeTogtVMKII+j5
 5Poege+FQcF9opKheZQ6wBbpVlj6kqIDLHb2puznXZw5PV9FSBuguytF5Bc/s0mh+T/7Lx0nfZi
 U+nTpYg9yveN40oaQSAq2faTGcrTEnmi1RWo/D+ZWlbLm9lq
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Now as all dual-lane PHYs have been migrated to a new driver, drop
support for dual lanes configuration. If the PHY uses two lanes for USB,
it is symthom that it should use either a combo USB+DP or a USB-C PHY
driver.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c | 57 +--------------------------------
 1 file changed, 1 insertion(+), 56 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
index c7698369d3dc..e62539ce99a6 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
@@ -1237,15 +1237,10 @@ struct qmp_usb_offsets {
 	u16 pcs_usb;
 	u16 tx;
 	u16 rx;
-	/* for PHYs with >= 2 lanes */
-	u16 tx2;
-	u16 rx2;
 };
 
 /* struct qmp_phy_cfg - per-PHY initialization config */
 struct qmp_phy_cfg {
-	int lanes;
-
 	const struct qmp_usb_offsets *offsets;
 
 	/* Init sequence for PHY blocks - serdes, tx, rx, pcs */
@@ -1285,8 +1280,6 @@ struct qmp_usb {
 	void __iomem *pcs_usb;
 	void __iomem *tx;
 	void __iomem *rx;
-	void __iomem *tx2;
-	void __iomem *rx2;
 
 	struct clk *pipe_clk;
 	struct clk_bulk_data *clks;
@@ -1393,8 +1386,6 @@ static const struct qmp_usb_offsets qmp_usb_offsets_v7 = {
 };
 
 static const struct qmp_phy_cfg ipq8074_usb3phy_cfg = {
-	.lanes			= 1,
-
 	.offsets		= &qmp_usb_offsets_v3,
 
 	.serdes_tbl		= ipq8074_usb3_serdes_tbl,
@@ -1411,8 +1402,6 @@ static const struct qmp_phy_cfg ipq8074_usb3phy_cfg = {
 };
 
 static const struct qmp_phy_cfg ipq9574_usb3phy_cfg = {
-	.lanes			= 1,
-
 	.offsets		= &qmp_usb_offsets_ipq9574,
 
 	.serdes_tbl		= ipq9574_usb3_serdes_tbl,
@@ -1429,8 +1418,6 @@ static const struct qmp_phy_cfg ipq9574_usb3phy_cfg = {
 };
 
 static const struct qmp_phy_cfg msm8996_usb3phy_cfg = {
-	.lanes			= 1,
-
 	.offsets		= &qmp_usb_offsets_v3,
 
 	.serdes_tbl		= msm8996_usb3_serdes_tbl,
@@ -1447,8 +1434,6 @@ static const struct qmp_phy_cfg msm8996_usb3phy_cfg = {
 };
 
 static const struct qmp_phy_cfg sa8775p_usb3_uniphy_cfg = {
-	.lanes			= 1,
-
 	.offsets		= &qmp_usb_offsets_v5,
 
 	.serdes_tbl		= sc8280xp_usb3_uniphy_serdes_tbl,
@@ -1467,8 +1452,6 @@ static const struct qmp_phy_cfg sa8775p_usb3_uniphy_cfg = {
 };
 
 static const struct qmp_phy_cfg sc8280xp_usb3_uniphy_cfg = {
-	.lanes			= 1,
-
 	.offsets		= &qmp_usb_offsets_v5,
 
 	.serdes_tbl		= sc8280xp_usb3_uniphy_serdes_tbl,
@@ -1487,8 +1470,6 @@ static const struct qmp_phy_cfg sc8280xp_usb3_uniphy_cfg = {
 };
 
 static const struct qmp_phy_cfg qmp_v3_usb3_uniphy_cfg = {
-	.lanes			= 1,
-
 	.offsets		= &qmp_usb_offsets_v3,
 
 	.serdes_tbl		= qmp_v3_usb3_uniphy_serdes_tbl,
@@ -1507,8 +1488,6 @@ static const struct qmp_phy_cfg qmp_v3_usb3_uniphy_cfg = {
 };
 
 static const struct qmp_phy_cfg sm8150_usb3_uniphy_cfg = {
-	.lanes			= 1,
-
 	.offsets		= &qmp_usb_offsets_v4,
 
 	.serdes_tbl		= sm8150_usb3_uniphy_serdes_tbl,
@@ -1530,8 +1509,6 @@ static const struct qmp_phy_cfg sm8150_usb3_uniphy_cfg = {
 };
 
 static const struct qmp_phy_cfg sm8250_usb3_uniphy_cfg = {
-	.lanes			= 1,
-
 	.offsets		= &qmp_usb_offsets_v4,
 
 	.serdes_tbl		= sm8150_usb3_uniphy_serdes_tbl,
@@ -1553,8 +1530,6 @@ static const struct qmp_phy_cfg sm8250_usb3_uniphy_cfg = {
 };
 
 static const struct qmp_phy_cfg sdx55_usb3_uniphy_cfg = {
-	.lanes			= 1,
-
 	.offsets		= &qmp_usb_offsets_v4,
 
 	.serdes_tbl		= sm8150_usb3_uniphy_serdes_tbl,
@@ -1576,8 +1551,6 @@ static const struct qmp_phy_cfg sdx55_usb3_uniphy_cfg = {
 };
 
 static const struct qmp_phy_cfg sdx65_usb3_uniphy_cfg = {
-	.lanes			= 1,
-
 	.offsets		= &qmp_usb_offsets_v5,
 
 	.serdes_tbl		= sm8150_usb3_uniphy_serdes_tbl,
@@ -1599,7 +1572,6 @@ static const struct qmp_phy_cfg sdx65_usb3_uniphy_cfg = {
 };
 
 static const struct qmp_phy_cfg sdx75_usb3_uniphy_cfg = {
-	.lanes			= 1,
 	.offsets		= &qmp_usb_offsets_v6,
 
 	.serdes_tbl		= sdx75_usb3_uniphy_serdes_tbl,
@@ -1621,8 +1593,6 @@ static const struct qmp_phy_cfg sdx75_usb3_uniphy_cfg = {
 };
 
 static const struct qmp_phy_cfg sm8350_usb3_uniphy_cfg = {
-	.lanes			= 1,
-
 	.offsets		= &qmp_usb_offsets_v5,
 
 	.serdes_tbl		= sm8150_usb3_uniphy_serdes_tbl,
@@ -1644,8 +1614,6 @@ static const struct qmp_phy_cfg sm8350_usb3_uniphy_cfg = {
 };
 
 static const struct qmp_phy_cfg x1e80100_usb3_uniphy_cfg = {
-	.lanes			= 1,
-
 	.offsets		= &qmp_usb_offsets_v7,
 
 	.serdes_tbl		= x1e80100_usb3_uniphy_serdes_tbl,
@@ -1780,11 +1748,6 @@ static int qmp_usb_power_on(struct phy *phy)
 	qmp_usb_configure_lane(tx, cfg->tx_tbl, cfg->tx_tbl_num, 1);
 	qmp_usb_configure_lane(rx, cfg->rx_tbl, cfg->rx_tbl_num, 1);
 
-	if (cfg->lanes >= 2) {
-		qmp_usb_configure_lane(qmp->tx2, cfg->tx_tbl, cfg->tx_tbl_num, 2);
-		qmp_usb_configure_lane(qmp->rx2, cfg->rx_tbl, cfg->rx_tbl_num, 2);
-	}
-
 	qmp_usb_configure(pcs, cfg->pcs_tbl, cfg->pcs_tbl_num);
 
 	if (pcs_usb)
@@ -2131,7 +2094,6 @@ static int qmp_usb_parse_dt_legacy(struct qmp_usb *qmp, struct device_node *np)
 	/*
 	 * Get memory resources for the PHY:
 	 * Resources are indexed as: tx -> 0; rx -> 1; pcs -> 2.
-	 * For dual lane PHYs: tx2 -> 3, rx2 -> 4, pcs_misc (optional) -> 5
 	 * For single lane PHYs: pcs_misc (optional) -> 3.
 	 */
 	qmp->tx = devm_of_iomap(dev, np, 0, NULL);
@@ -2149,19 +2111,7 @@ static int qmp_usb_parse_dt_legacy(struct qmp_usb *qmp, struct device_node *np)
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
-
-		qmp->pcs_misc = devm_of_iomap(dev, np, 5, NULL);
-	} else {
-		qmp->pcs_misc = devm_of_iomap(dev, np, 3, NULL);
-	}
+	qmp->pcs_misc = devm_of_iomap(dev, np, 3, NULL);
 
 	if (IS_ERR(qmp->pcs_misc)) {
 		dev_vdbg(dev, "PHY pcs_misc-reg not used\n");
@@ -2213,11 +2163,6 @@ static int qmp_usb_parse_dt(struct qmp_usb *qmp)
 	qmp->tx = base + offs->tx;
 	qmp->rx = base + offs->rx;
 
-	if (cfg->lanes >= 2) {
-		qmp->tx2 = base + offs->tx2;
-		qmp->rx2 = base + offs->rx2;
-	}
-
 	ret = qmp_usb_clk_init(qmp);
 	if (ret)
 		return ret;

-- 
2.39.2


