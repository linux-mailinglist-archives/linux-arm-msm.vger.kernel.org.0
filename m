Return-Path: <linux-arm-msm+bounces-56692-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D9DBAA86E9
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 May 2025 16:47:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1B15D3B66B7
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 May 2025 14:47:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E62D1EFFB5;
	Sun,  4 May 2025 14:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GMG+Epy2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1587B1E7C11;
	Sun,  4 May 2025 14:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746369952; cv=none; b=r91JqF8FjbDfDd0iIQ7QchULX/rCb2DJYOoiBVVKl7bSFxSfTDNYBWo6N3Mh5OGeCCmxSYc85IBpGpDNK/mi3RNxGEn5JzTxutlahzmzNQZvh0cclxB3qT7l9LkltwPkTEPfcSR4QmhcNcZ5nl3oE03r6HWau3sbHBRS3h9yG/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746369952; c=relaxed/simple;
	bh=AkBmi3smSWITHl2bmr29dOmbgvhXHgDHeSc21unzXPg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TjDtcU3WTwp4Tb0YYBaONucKBLPJe5w9iUhrlJLHRbzTDhKz0P9Fsw0CNDvBh4IdlKeaQ7YY6TLPjAW6lZKFFdC38Zv34SBUyfiTOjFNvhN0Mhl16ipOA2elfjjeDz6n9IkdVeAeF+XzdGarywlNOSzFimS4Y4mCD3z9rrdFF5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GMG+Epy2; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5fab81d6677so1710949a12.1;
        Sun, 04 May 2025 07:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746369949; x=1746974749; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H8Z64jhMWr4f68K+GRZRK+Jca5FzqJ7OziWBl/OdXKA=;
        b=GMG+Epy2OidA6r7ZszXaaj0iMjcHITwKoU9N6pivnC6P+yT7h+dVIRLcuvG2WOOtjP
         qMEDmIUfOvhBVZKziZCnQ0jqtplHpKpLuRw2i6BvHEFBAY0ySy8/Z9qAB8YeybAE6uDF
         vFoBBEAnYVPUaPTCV6ZKLe//Z9O0rSzThaGVwrm9NAGPHOSW40iJw57zb5aETzpWmoos
         VZAZpjMnJdC3QqqCAXODNWQm7PfTUjIBgnBDCXCCnjorgpaTX0bihoTW3Yu1leF5aItC
         G+sz/fkbO0QGypyIc/uq6oHYDjPvudHUhWPnYYeq6PYjSzIdXQICJKCg03mfBGtN20ez
         hmtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746369949; x=1746974749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H8Z64jhMWr4f68K+GRZRK+Jca5FzqJ7OziWBl/OdXKA=;
        b=fpKwicw/YcM6XqF4TRG0PBtUmj7VX8LlOjTKrUQLcc4uC7lzNloLviBGAV4MBK1x86
         qNKSbCp2yFFs5J4t1wSzoQTYzk0Bd0Bdlg8wwMDXhNSnjNendO6FMGlo0LJFGs49s7jL
         BaGCFqxDDCBfRIOXhjMzdHXoZvitM2pVWW/E8xkB4MUF3pNaC/sSacghTbRfwvyyUjsV
         XZAWyk0RUex+9nfNycWuirZWdbP8vmaHvBPPrVs8Z2BqYULsfIg0y1QTI9dL8o4/eSll
         Qu2To8m73v4t0sIBVqjT2JquQKRerl+U2MkkeXyQd82vM+ykyDuGo1vCRdGo9E6a3Iyo
         yKxw==
X-Forwarded-Encrypted: i=1; AJvYcCU7vpcm3alyjgYX5Bt0bKQBYSw6CtuVygR3S6wOEFuTCb+H0t5ZuJmn0tfjIKDxZKDaWZKfTUBeQ95VYc8afA==@vger.kernel.org, AJvYcCUVL68z9XqWno4SsQn0xuXEHh/zmeyBK8Jsfq45t/20jlyRxKFcM13+AIZB06RwZqy0s6qL1vxOmU91Bnzv@vger.kernel.org, AJvYcCW50F8zPYRCqsiqC36H5Mweynf1QOSyONwB3D+8JuZfKwm5zwD8mnhxHONFtT6vRhz2aAX8YtaFL7w2yDw/sOdpsQA=@vger.kernel.org, AJvYcCXYxPZFi7As79vAglVFswV637usGCfzEVSoXeBr2PPV/46UIFsTbReCL0vtPsqkcst9XoJHkq80HZvh@vger.kernel.org
X-Gm-Message-State: AOJu0YwnExyVlnAYDigNW8f3kaX0t8MlibRT4jQgJiL/J+aFdD02xpRh
	vQ2sy3CcnA3tNYeA0dPblRbw/MnlCsczoqnpdizzEk8XA8ExWnAN
X-Gm-Gg: ASbGncusZfNm0Kz7TLltt0a1Iasc+YOCirwDSxmcRdFyKrMsTghm5siiCANHpANZoiW
	ROpwaG8r33E0zK2DK+lZDY8RxZtKbb98aSi9N24lLmkdyGigKD4JJcPbWcAY4wJbyjPNLYAWE4l
	zDCCpuWBl/SFaOpKkNt7qRqydgkCHGP33YzkJZvEgQ6di6XBUXbkyLqktPOJlPhXgcCE3PJ85FO
	ORzUXxQIOqDLv9yanWejrQ42JhYXd3MT4yRjeI6Jp9hazBx5iu54wz1W1pnSLvftIGyiImfgQCx
	n7Hsgb0pxzyLymvsLlquXHSnCuHmJvVzMaSy2uk0qwhiEYfR3jRt8B2+8xDngIJ9H0FvgCvfBAu
	cALA7SaeYRHGX4p5ehez9jABOqWA=
X-Google-Smtp-Source: AGHT+IHLAPcmE4D8uUqNIDaDTGoj/0IoKeVQe1JZfKk7Q4vsF1Q3KnS4KP0HYO6oATvrVjuDaOVFJA==
X-Received: by 2002:a05:6402:5cb:b0:5f6:20c4:3b0d with SMTP id 4fb4d7f45d1cf-5fab0576293mr3229682a12.8.1746369949176;
        Sun, 04 May 2025 07:45:49 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5faecf59d31sm1147258a12.77.2025.05.04.07.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 07:45:48 -0700 (PDT)
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
Subject: [PATCH v5 08/10] phy: phy-snps-eusb2: refactor reference clock init
Date: Sun,  4 May 2025 17:45:25 +0300
Message-ID: <20250504144527.1723980-9-ivo.ivanov.ivanov1@gmail.com>
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

Instead of matching frequencies with a switch and case, introduce
a table-based lookup. This improves readability, reduces redundancy,
and makes it easier to extend support for additional frequencies in
the future.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/phy/phy-snps-eusb2.c | 61 +++++++++++++++++++-----------------
 1 file changed, 32 insertions(+), 29 deletions(-)

diff --git a/drivers/phy/phy-snps-eusb2.c b/drivers/phy/phy-snps-eusb2.c
index f05333901..8caa62c0b 100644
--- a/drivers/phy/phy-snps-eusb2.c
+++ b/drivers/phy/phy-snps-eusb2.c
@@ -192,44 +192,47 @@ static void qcom_eusb2_default_parameters(struct snps_eusb2_hsphy *phy)
 				    FIELD_PREP(PHY_CFG_TX_HS_XV_TUNE_MASK, 0x0));
 }
 
+struct snps_eusb2_ref_clk {
+	unsigned long freq;
+	u32 fsel_val;
+	u32 div_7_0_val;
+	u32 div_11_8_val;
+};
+
+static const struct snps_eusb2_ref_clk qcom_eusb2_ref_clk[] = {
+	{ 19200000, FSEL_19_2_MHZ_VAL, DIV_7_0_19_2_MHZ_VAL, DIV_11_8_19_2_MHZ_VAL },
+	{ 38400000, FSEL_38_4_MHZ_VAL, DIV_7_0_38_4_MHZ_VAL, DIV_11_8_38_4_MHZ_VAL },
+};
+
 static int qcom_eusb2_ref_clk_init(struct snps_eusb2_hsphy *phy)
 {
+	const struct snps_eusb2_ref_clk *config = NULL;
 	unsigned long ref_clk_freq = clk_get_rate(phy->ref_clk);
 
-	switch (ref_clk_freq) {
-	case 19200000:
-		snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_HS_PHY_CTRL_COMMON0,
-					    FSEL_MASK,
-					    FIELD_PREP(FSEL_MASK, FSEL_19_2_MHZ_VAL));
-
-		snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_CFG_CTRL_2,
-					    PHY_CFG_PLL_FB_DIV_7_0_MASK,
-					    DIV_7_0_19_2_MHZ_VAL);
-
-		snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_CFG_CTRL_3,
-					    PHY_CFG_PLL_FB_DIV_11_8_MASK,
-					    DIV_11_8_19_2_MHZ_VAL);
-		break;
-
-	case 38400000:
-		snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_HS_PHY_CTRL_COMMON0,
-					    FSEL_MASK,
-					    FIELD_PREP(FSEL_MASK, FSEL_38_4_MHZ_VAL));
-
-		snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_CFG_CTRL_2,
-					    PHY_CFG_PLL_FB_DIV_7_0_MASK,
-					    DIV_7_0_38_4_MHZ_VAL);
-
-		snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_CFG_CTRL_3,
-					    PHY_CFG_PLL_FB_DIV_11_8_MASK,
-					    DIV_11_8_38_4_MHZ_VAL);
-		break;
+	for (int i = 0; i < ARRAY_SIZE(qcom_eusb2_ref_clk); i++) {
+		if (qcom_eusb2_ref_clk[i].freq == ref_clk_freq) {
+			config = &qcom_eusb2_ref_clk[i];
+			break;
+		}
+	}
 
-	default:
+	if (!config) {
 		dev_err(&phy->phy->dev, "unsupported ref_clk_freq:%lu\n", ref_clk_freq);
 		return -EINVAL;
 	}
 
+	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_HS_PHY_CTRL_COMMON0,
+				    FSEL_MASK,
+				    FIELD_PREP(FSEL_MASK, config->fsel_val));
+
+	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_CFG_CTRL_2,
+				    PHY_CFG_PLL_FB_DIV_7_0_MASK,
+				    config->div_7_0_val);
+
+	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_CFG_CTRL_3,
+				    PHY_CFG_PLL_FB_DIV_11_8_MASK,
+				    config->div_11_8_val);
+
 	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_CFG_CTRL_3,
 				    PHY_CFG_PLL_REF_DIV, PLL_REF_DIV_VAL);
 
-- 
2.43.0


