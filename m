Return-Path: <linux-arm-msm+bounces-52190-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F66A6BC53
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Mar 2025 15:01:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 289813B98A4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Mar 2025 14:00:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C8171D5AD4;
	Fri, 21 Mar 2025 13:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nVHQzFzE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1039B1C863C;
	Fri, 21 Mar 2025 13:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742565548; cv=none; b=lh7N0zPJIRgsnO6tqvd4r3tCZxU7dXwYr9OU3KOSyJGeyDHDD9/W02jfNruJNr/x3T9+9+YIkzXMhHIvV+EQOjMpG8jSFvAcqn0GhmebL+fWWNHnEWppDqzkbR7NanIj8wSkVUtcjdoGxVRvbCAf9OD0nIaEUefEvMdLl9CV7Sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742565548; c=relaxed/simple;
	bh=m6hZszT1VHbW/jN06s9zsoAvK38ySkDC7EKMfjH0DpY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ju7SQKIs60VGCDcNcN6QoxeUX1NM+auvRivn0tRZiV3T2ZyPYeen80Sh7wCD1Gf7svC6k49PHqNC3bMQGqkTRsGh4ojusx21O8SR4SUOE5csjWHXcSlLYchw3vo+4NcKgEfjw2jc87RHTGql09NvXaYXXgaiOyXU7rZoCp6vGzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nVHQzFzE; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3912e96c8e8so1236122f8f.2;
        Fri, 21 Mar 2025 06:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742565545; x=1743170345; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dL00t3QE4ASPpAeBNPhfJbN60yp6PFJbIaqm4DRKcSA=;
        b=nVHQzFzEwO3EBSrhlIRFI/XIiPauja+jfpUjEmIPxLa/H8QgcVPDvQmBfq+fn0CoZB
         pLP+BTgX1CFnfzOzGMTsKGVB3oAsn94kkvsQv6OrzteYGMAxYVvJxbTHlOFus2sqKbFU
         zUsSnU5VRiGMPLURhVvQuHwJB4AxnLdaf4h4DiHIrmuNFItIdsEH3ejJsivV2gdD2gwt
         7DA/9lnldx3H2VS1XvWPNlBN3VJHi18BJrQADsJoESMedo7jOeENfgUfLh30wfCgh0sq
         oJuuGmZiJpnwdJE/UPS0CWeXoZMY9Z+i6TleQc3umV4XdiEKgEb0KX4BVSsNBT3eWfgG
         /aGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742565545; x=1743170345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dL00t3QE4ASPpAeBNPhfJbN60yp6PFJbIaqm4DRKcSA=;
        b=A815xKVZ8v3Bj44pZBKUpqa8TbaqgdrV4m/xZVcU+LC+OD/vIO03lqctzwr14BuQCx
         sJToZjbrTxvLxwEOCymkmvbRq7UrVqWc+CoYIHRH4TEKMtXQohmmz3C80A/T4+2LL0rR
         vlrnLso7iXpFixtxlMFg2gmvuBqbNp6BoYi7AtZX4vBO2Tlhvsy2wMrJWUyfc8W/rvVX
         0D1C5d78P/waQ6ww9lGYlGaZo7EEa3oBHvzJuURTKFmaXJe4pMURJeDxoYrOSuvN5IoZ
         U1vaUUa50s50YVYz/me5qjEAFwdFJAPV+JrhO3k2m/OJl915RIuKt7SrPU4mm9zN6xYb
         8xRA==
X-Forwarded-Encrypted: i=1; AJvYcCV/G4EM+ZdIiqCdLTi/RZnT42FxlE25xk8brujMdronq7HmU6Orvj2k+a3TODKsdodfR2sboDQg0lpR@vger.kernel.org, AJvYcCWWmCYvdAJSI1Dfc1cGAvIHyrXWKh6/uETq8v0ihT/meP0CaKENE+r77o0XkJ5JQPhcprR5S1mt6p7CFdmk@vger.kernel.org, AJvYcCX186Nvq9Qu/ghRLbbm2Xjq4YpdgRmhUNjf/l6ddLH+G0SwtkcNrHsHRCHwhw82Hkh+MTD2gJQ9q9eo8eHhROYiKQc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKKU5EFklHV1iXEMy5E1CmlVQhBqJ9U2sjMRbfwuz4H54nmawe
	s1PqMXIZiHUNdsndU91w82/vStvjZ5yl84/lhPxsLFrTgzrnSE1F
X-Gm-Gg: ASbGncvrBLU2wb1YU11DTHH+DQTW8jEXuiStRvfjKrywH85bysWX5z8flX09mwO9ljP
	zydGUNWlSi5ym/VhXV0BsKz3U6rFNZWGhkZJPw5fom6VcuQrC8YON3aFhwRpVW78FUDSF7ud38V
	YGkpDgKcH4of/x+on6g00iht5zo7BKzsciDy/f1WIoSapi/du3YTSjKhADJYAxfvOFWifdWLIJ6
	BxW3C1oge5EvlzRn5HCpWlY0dKvp4QBX5LerUhvi/Ukewp44VpYg/qWmONKoWhws9RIcFEcP/CV
	1VQ4LT5FoOj1ko3aT58GKyeUO32w+nYhMX+0AkyNtW6Whg3ISrV7l6U62s663UvbW75T6RS+pDF
	llwBVni+23v/U9A8ShGlB
X-Google-Smtp-Source: AGHT+IFquZF4hd4nWmTPWqI68wVcBaR6V5d+ZVDKcCwV1vPKm3ReaFGvjX+0+VE46ogmhHCnIcBjWg==
X-Received: by 2002:a5d:64e4:0:b0:38f:3b9b:6f91 with SMTP id ffacd0b85a97d-3997f8fa8f5mr3266881f8f.12.1742565545103;
        Fri, 21 Mar 2025 06:59:05 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9e6651sm2437162f8f.75.2025.03.21.06.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 06:59:04 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Abel Vesa <abel.vesa@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH v3 05/10] phy: phy-snps-eusb2: split phy init code
Date: Fri, 21 Mar 2025 15:58:49 +0200
Message-ID: <20250321135854.1431375-6-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250321135854.1431375-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250321135854.1431375-1-ivo.ivanov.ivanov1@gmail.com>
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
---
 drivers/phy/phy-snps-eusb2.c | 96 +++++++++++++++++++++++-------------
 1 file changed, 63 insertions(+), 33 deletions(-)

diff --git a/drivers/phy/phy-snps-eusb2.c b/drivers/phy/phy-snps-eusb2.c
index 405278c18..fa878389f 100644
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
@@ -371,6 +393,7 @@ static int snps_eusb2_hsphy_probe(struct platform_device *pdev)
 	struct snps_eusb2_hsphy *phy;
 	struct phy_provider *phy_provider;
 	struct phy *generic_phy;
+	const struct snps_eusb2_phy_drvdata *drv_data;
 	int ret, i;
 	int num;
 
@@ -378,6 +401,11 @@ static int snps_eusb2_hsphy_probe(struct platform_device *pdev)
 	if (!phy)
 		return -ENOMEM;
 
+	drv_data = of_device_get_match_data(dev);
+	if (!drv_data)
+		return -EINVAL;
+	phy->data = drv_data;
+
 	phy->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(phy->base))
 		return PTR_ERR(phy->base);
@@ -424,8 +452,10 @@ static int snps_eusb2_hsphy_probe(struct platform_device *pdev)
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


