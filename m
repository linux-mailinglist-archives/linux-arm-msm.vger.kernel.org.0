Return-Path: <linux-arm-msm+bounces-56689-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D67E3AA86D7
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 May 2025 16:46:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3BF73176095
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 May 2025 14:46:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 364381E260D;
	Sun,  4 May 2025 14:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zug1JI1W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C461DF250;
	Sun,  4 May 2025 14:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746369949; cv=none; b=ryh5vm+NMZAMaiH/JMdt/qAqliIDZD5EdBMEDPdk6wUHSisZynAvo+iX/crGXhFuVapu8NNv8uNmYhz8eXbk7T8GucdoaeeEm9YabpZxyOBn5UnM8nUWrhTMToeTtFcUP0zlINviMFObHbOOG+jqIFLlyQW2GmMA81a80n3NG0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746369949; c=relaxed/simple;
	bh=2yy6EjiXxSAPVufYCa9ePZHsjODKDJ7K9wk6lj3SPyY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O4qWid0QKv/NpJOWFcWU3RnHi+pStnvRPnNiWFV4MlDIUA7VAq2xGoQe2HcBWIyj7ehsXLiZ36XF5zA7j10mdJyUGjU1iwJ7bzF2p4v2x2E6MWuu0yahRxYjtc2I6JVnaqRCa9Q4Tva9zMX4uMYNfeVLKZMZ/dzPLWj/F04nehU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zug1JI1W; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5f6214f189bso6803796a12.2;
        Sun, 04 May 2025 07:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746369945; x=1746974745; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S/2ZMg6LQNzP+WqoJGSl/J+PhbKTk0j0hhnJ6TPVsHY=;
        b=Zug1JI1WRnZ9t5TJQDWSxmic6H6Nu5Xab8TlVH7AlLvO3KNMyq1pv2N2Dn4nxKhnfr
         +LQ0DWBp5uibh6Ul6X6lowkkOhj/xrZ53+E/RMhLWssvVf+dMaRcS+WkIFqk6uf8cI9K
         cIJ50kN16QX/gWHZ9w/ydNo5oVT6tsXAwetdsOai5lTYm691AgBpkDCwFCYmuHvWq+Bi
         Fo0jhSfq81kwWpgKteiS+wXMehaImCoL07cK80oKwqfzGV9nhS7ec9qnnCp9M6cPqr0/
         74I9euDZkO1I66A/wY1jnzOhCCURgnDnNUesTeTZ009LSwnG+DWJ+FfmPlnYv8BiMrgw
         VK7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746369945; x=1746974745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S/2ZMg6LQNzP+WqoJGSl/J+PhbKTk0j0hhnJ6TPVsHY=;
        b=wyo29iTGe4eDc9zEAY7OZ+MzRPNl+HTziySqwj5eNM89YGOiKjxFM1v3oQh7ZdxhwR
         IAuq3Aa8nNScgezXeO0/DwqkVU1Qb7bS8Pa1AlrJ27H3lORlfIr2jhjUVzH0tjjnhqmQ
         cD8G7koEl7tJAeoPuMNQdzCqEnX17ju4kGEQzGzZEx5F01cCPjUfVtsYtjdBP+MevlZy
         Kx72H/07Sz1eeel22fRtLSxD3oWq3FGeSCkQXJVmBwMGa0+LHQi4+3QHouP3dxJLCk8D
         pV4jEWIEJwUbUuJ0qj2w7AX2Zkwr7tNgpsFU6taVb1NJl3tM6Diixq7ifsplRwki5jUE
         72dg==
X-Forwarded-Encrypted: i=1; AJvYcCVB9XNLnAMXnNq03HHCJjBLy/Ygks7BShfI6c1JoBPi5zc1d90KbrEf5xH2M/CmVaNBGncxVvhs1tCZKy+w@vger.kernel.org, AJvYcCVBshxTDxaVxLoyF9EE1ZrKrdYir0spHNnxog89Z5NWiEXNKu4XQcVq1fBejtxvTlX56jkHZr50BgtY4XEDH80B49w=@vger.kernel.org, AJvYcCWNtpC6fL7ZzECzpTsy/WFpyknHHnLVUGpScimhBHaI/uTQo2Cbccq+IsIf8A3hIRYVKbH5ACO9kAjXhyxUSA==@vger.kernel.org, AJvYcCXHWUaLeY1vg016V73+H1/i9kZ9PseS4QAK81Mcu28JFhLJBpNnyDT1VeIJD02cZQicgE1WZ2yDMQIN@vger.kernel.org
X-Gm-Message-State: AOJu0Ywouj9wM3Qz6l+cs7+HKQLFtz/0k1a36GN9WkJxnATXrs2gKrpd
	O2OJ4pa/Vjv/F48lZUF3Aim0tEohmdnyN4hs04ZzkqJc3Ha2IJNa
X-Gm-Gg: ASbGnctzG48/dHGX3Yyr/Fk4zAw4YK5TQ7er4BxKG8nRGSwFA5hTIL/1OWys2lrReVo
	kKROUNSDqm2FTSE2MbjmshSNfhLvsrQ3GfPzkgBKYa6F13reBXzpYf0ASbybQQKdcUqeYykSLBl
	fdyvdWrzZ+O8YoY4jgqmaGz5mB7CWO0/75NTsI7407zSJqFy1ykn8id7fPThkUhea4gyJzjC8a/
	YDHoCHwu0GOLHRSEIzC+dCFWAPiYyTsC51iyqWTY+fdK2g0muQOjbeuvNOmfq4zwCPLpcP2dYqq
	14LwWgveByR8ISuBOQg71BUYTAoxjUmSaqa1IxTPZ+2+JRuD7Cjab2AbsWwoXO8ScYx9hIPXnAr
	PP8nCgq/qmkYEc7O1
X-Google-Smtp-Source: AGHT+IF7AQauSsrNTCBXEecy6z1zSfX3R1XXKCBQWg7IremhkdjxTo5/KPNyh6CLmo9LP5N75FIt7A==
X-Received: by 2002:a05:6402:50ce:b0:5fa:f96d:7a24 with SMTP id 4fb4d7f45d1cf-5faf96d7cd9mr1447167a12.3.1746369945252;
        Sun, 04 May 2025 07:45:45 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5faecf59d31sm1147258a12.77.2025.05.04.07.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 07:45:44 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linux-phy@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 05/10] phy: phy-snps-eusb2: split phy init code
Date: Sun,  4 May 2025 17:45:22 +0300
Message-ID: <20250504144527.1723980-6-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250504144527.1723980-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250504144527.1723980-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The current phy init consists of hardware power-up, as well as
QCOM-specific eUSB2 init code. Split it into two parts, to make room
for such non-QCOM init code.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/phy/phy-snps-eusb2.c | 94 +++++++++++++++++++++++-------------
 1 file changed, 61 insertions(+), 33 deletions(-)

diff --git a/drivers/phy/phy-snps-eusb2.c b/drivers/phy/phy-snps-eusb2.c
index e1b175f48..1933e8440 100644
--- a/drivers/phy/phy-snps-eusb2.c
+++ b/drivers/phy/phy-snps-eusb2.c
@@ -121,6 +121,10 @@ static const char * const eusb2_hsphy_vreg_names[] = {
 
 #define EUSB2_NUM_VREGS		ARRAY_SIZE(eusb2_hsphy_vreg_names)
 
+struct snps_eusb2_phy_drvdata {
+	int (*phy_init)(struct phy *p);
+};
+
 struct snps_eusb2_hsphy {
 	struct phy *phy;
 	void __iomem *base;
@@ -133,6 +137,8 @@ struct snps_eusb2_hsphy {
 	enum phy_mode mode;
 
 	struct phy *repeater;
+
+	const struct snps_eusb2_phy_drvdata *data;
 };
 
 static int snps_eusb2_hsphy_set_mode(struct phy *p, enum phy_mode mode, int submode)
@@ -230,41 +236,11 @@ static int qcom_eusb2_ref_clk_init(struct snps_eusb2_hsphy *phy)
 	return 0;
 }
 
-static int snps_eusb2_hsphy_init(struct phy *p)
+static int qcom_snps_eusb2_hsphy_init(struct phy *p)
 {
 	struct snps_eusb2_hsphy *phy = phy_get_drvdata(p);
 	int ret;
 
-	ret = regulator_bulk_enable(ARRAY_SIZE(phy->vregs), phy->vregs);
-	if (ret)
-		return ret;
-
-	ret = phy_init(phy->repeater);
-	if (ret) {
-		dev_err(&p->dev, "repeater init failed. %d\n", ret);
-		goto disable_vreg;
-	}
-
-	ret = clk_prepare_enable(phy->ref_clk);
-	if (ret) {
-		dev_err(&p->dev, "failed to enable ref clock, %d\n", ret);
-		goto disable_vreg;
-	}
-
-	ret = reset_control_assert(phy->phy_reset);
-	if (ret) {
-		dev_err(&p->dev, "failed to assert phy_reset, %d\n", ret);
-		goto disable_ref_clk;
-	}
-
-	usleep_range(100, 150);
-
-	ret = reset_control_deassert(phy->phy_reset);
-	if (ret) {
-		dev_err(&p->dev, "failed to de-assert phy_reset, %d\n", ret);
-		goto disable_ref_clk;
-	}
-
 	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_CFG0,
 				    CMN_CTRL_OVERRIDE_EN, CMN_CTRL_OVERRIDE_EN);
 
@@ -334,6 +310,52 @@ static int snps_eusb2_hsphy_init(struct phy *p)
 				    USB2_SUSPEND_N_SEL, 0);
 
 	return 0;
+}
+
+static const struct snps_eusb2_phy_drvdata sm8550_snps_eusb2_phy = {
+	.phy_init	= qcom_snps_eusb2_hsphy_init,
+};
+
+static int snps_eusb2_hsphy_init(struct phy *p)
+{
+	struct snps_eusb2_hsphy *phy = phy_get_drvdata(p);
+	int ret;
+
+	ret = regulator_bulk_enable(ARRAY_SIZE(phy->vregs), phy->vregs);
+	if (ret)
+		return ret;
+
+	ret = phy_init(phy->repeater);
+	if (ret) {
+		dev_err(&p->dev, "repeater init failed. %d\n", ret);
+		goto disable_vreg;
+	}
+
+	ret = clk_prepare_enable(phy->ref_clk);
+	if (ret) {
+		dev_err(&p->dev, "failed to enable ref clock, %d\n", ret);
+		goto disable_vreg;
+	}
+
+	ret = reset_control_assert(phy->phy_reset);
+	if (ret) {
+		dev_err(&p->dev, "failed to assert phy_reset, %d\n", ret);
+		goto disable_ref_clk;
+	}
+
+	usleep_range(100, 150);
+
+	ret = reset_control_deassert(phy->phy_reset);
+	if (ret) {
+		dev_err(&p->dev, "failed to de-assert phy_reset, %d\n", ret);
+		goto disable_ref_clk;
+	}
+
+	ret = phy->data->phy_init(p);
+	if (ret)
+		goto disable_ref_clk;
+
+	return 0;
 
 disable_ref_clk:
 	clk_disable_unprepare(phy->ref_clk);
@@ -378,6 +400,10 @@ static int snps_eusb2_hsphy_probe(struct platform_device *pdev)
 	if (!phy)
 		return -ENOMEM;
 
+	phy->data = device_get_match_data(dev);
+	if (!phy->data)
+		return -EINVAL;
+
 	phy->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(phy->base))
 		return PTR_ERR(phy->base);
@@ -424,8 +450,10 @@ static int snps_eusb2_hsphy_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id snps_eusb2_hsphy_of_match_table[] = {
-	{ .compatible = "qcom,sm8550-snps-eusb2-phy", },
-	{ },
+	{
+		.compatible = "qcom,sm8550-snps-eusb2-phy",
+		.data = &sm8550_snps_eusb2_phy,
+	}, { },
 };
 MODULE_DEVICE_TABLE(of, snps_eusb2_hsphy_of_match_table);
 
-- 
2.43.0


