Return-Path: <linux-arm-msm+bounces-52193-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EFBBBA6BC5D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Mar 2025 15:02:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 229533BB11A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Mar 2025 14:00:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E454B1DE3AF;
	Fri, 21 Mar 2025 13:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kdj+jYYD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 093011D88A6;
	Fri, 21 Mar 2025 13:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742565552; cv=none; b=VubBWpuQ5w+WT4Fkhv7AcnM/JaYX3PB5WGXGymKvVfqCImkFUaJGeXDWIArvenvqNxtrp00WdVW3DAv72U5UW5KYAoRxYWFooVRl/LAQbOyPpBbKP2/YK6Ixjk1BJHEjXzRPvW5vUvriKLgPELJvHglUyg+0OChhSRDAQthsj30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742565552; c=relaxed/simple;
	bh=h/V2Ksaq8LPf2QWafaITViF6wassvP4bTVR+DxHPzik=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SSz7PZ2ast0LMfVVjkx6u/5OV8PiqBVXDWP+rNdViz7RhXIZWBbZi6NTrryt4pidDNt2vFXYXFVUBZyIq/u7H7Bmn9W8itSNmBXg4kqZMerRy0EZMuYdKx0XgSFpJN8CKrgGhVhutIAYH358gHyPfZBlt8DG2AFBaSpFIo+ejRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kdj+jYYD; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-39133f709f5so1091194f8f.0;
        Fri, 21 Mar 2025 06:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742565549; x=1743170349; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sbyZcoaajFlmts2XUhsZjMQOjAP2jAbADTedozzwVLU=;
        b=kdj+jYYDnhPxzNcdn0oUrIrrZfLy20qhH0N2OYzoE1/9t/68X5W5bAboRvv2OdK9Y4
         8N3PPL9kNvXuoxsO33POy9/Cme05QNlEIuaCpUFeCAyqvrLZndj3jMT0LKdpBG2SfFBv
         1tbdRs5nGPmRUiubWJQ1UiTflv0XWxpcfDxV7RhjBGz9wxsYN5ORqy0B3PIU9p3st49W
         UDe3gBszyD16iXywmlszj7G9P1JdLzpwAUOzOHugnNGo5KVILSV2JlcUJf2iMnKDgQbD
         ApYPJIQcVzCaWd5fN9W7/j13yDeCCZcu3KbPMsBz4CaRH7PE2nB9kuouty4TKB8xrEgv
         Z6Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742565549; x=1743170349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sbyZcoaajFlmts2XUhsZjMQOjAP2jAbADTedozzwVLU=;
        b=KFhlQpwtxycbVQEVg5NnDvGGrxRYI8yI3l7zsUHjIMLZHMBB9CuKwMPtC0ja6J9I0x
         toYR9oqo0RzyjAmE9qvmrcdyrcb8G+obFOUDlO8on6Ct4c7+/36rpw5NnskRdJ4zNuT+
         CM4GQ1cINhWyztMXiivR29DPl2JsgL8p9e9jWElK6y/7EAK4LvUODfeDRrmH+g5fGGRY
         pAyx2jdB3AUvTTZod5qv9AUy8zg3TZKiZ781TePPv2rYXW1fuDxrNsVQvKaqeg6s2nRR
         FL5hamu94xyLH5bQNsNce7xYwey6H/cYaNa05ZQBJqdDsRDhk0ATNhQLkDTm4de1z6d3
         Q7ww==
X-Forwarded-Encrypted: i=1; AJvYcCVSQTg4YE2WBYDYlRviUi01KjfSIXA/arRjfeCXN+7D9LaYtu9fqoRHpy1xdb4Hh724CsyROcaEpTtN@vger.kernel.org, AJvYcCXMDcaEDJkcKGGPZZ2afAP6IudTk1taLfnihh0xvfjiw0VgXJ7Ye+EYF2SVLsA8X/Ob/vkXJBSHtEnXwKnlsP++oX8=@vger.kernel.org, AJvYcCXq3n5gf46+HrBFu6AzZOPgpIW+TEFSGCJY5Ut/ez+mIsCF4YibH2UzuVRD1u8CmKWcczQwMtADpCLCW7Dk@vger.kernel.org
X-Gm-Message-State: AOJu0YwNTvB7TQUqcC9FjYv4P97tj+a1ZRgMcOgebUVKJLnm+RhahmVb
	z25fJ5KqY85GMPoRhcQ4poUlnrFmOg6/EMsMkbS9W+V1r/wEXc0w
X-Gm-Gg: ASbGncs9nq21xyT9iiCulNb0YGOgUbM1QmW7gQJDZQRtTg3cidoW+jMj8g9FLIzJoCa
	7W2SK/lwRkOTBCxYAfiv7A7yzdvpLNeAwoNqZYp/+yBvCYJog1wbYAFDgq3Oq3aeVHeu6qJ0v39
	KJ2Uzq2PR/T8ncV4NlJGPAqWe4G0WaUQozF2row+AdBEc8UFrSkfkxzKkh+UHdmi3j76dnoe2pM
	bt176CsSeP3N5e+epLE4tKgKxAAltgdA/BOcGoRXFwY4DbDQyTKFOg8UkKviYEZe53qSjMtuKkI
	7a5Rr6eut7JdgMTqr+M51w+FPHf3CfzKB0Q3fagIjSWtZArrp2802wc/g4q6AAV2PJdeyy9jONP
	3PtJqjIpFVPNP3wqbAQKL
X-Google-Smtp-Source: AGHT+IH5K8T4c9k4ekIQnpelX9sEZXchTsHL4Ta9XthUbbS4ibsFVFojmfNk/OO/KF7tgKLwgcCcCA==
X-Received: by 2002:a05:6000:1a8e:b0:391:4559:8773 with SMTP id ffacd0b85a97d-3997f938993mr3360194f8f.51.1742565549242;
        Fri, 21 Mar 2025 06:59:09 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9e6651sm2437162f8f.75.2025.03.21.06.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 06:59:08 -0700 (PDT)
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
Subject: [PATCH v3 08/10] phy: phy-snps-eusb2: refactor reference clock init
Date: Fri, 21 Mar 2025 15:58:52 +0200
Message-ID: <20250321135854.1431375-9-ivo.ivanov.ivanov1@gmail.com>
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

Instead of matching frequencies with a switch and case, introduce
a table-based lookup. This improves readability, reduces redundancy,
and makes it easier to extend support for additional frequencies in
the future.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 drivers/phy/phy-snps-eusb2.c | 61 +++++++++++++++++++-----------------
 1 file changed, 32 insertions(+), 29 deletions(-)

diff --git a/drivers/phy/phy-snps-eusb2.c b/drivers/phy/phy-snps-eusb2.c
index 1e7e75bbc..4ca11860a 100644
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


