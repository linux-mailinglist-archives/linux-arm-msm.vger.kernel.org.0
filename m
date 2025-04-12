Return-Path: <linux-arm-msm+bounces-54118-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 944D8A86F7A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Apr 2025 22:28:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A4B9817F9C1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Apr 2025 20:28:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4A0B23315C;
	Sat, 12 Apr 2025 20:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NfbnsuJ6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCDA1230BF7;
	Sat, 12 Apr 2025 20:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744489630; cv=none; b=uiffMfhlRklrw0/uIlrK6z9uZUqLg0Aft/IRRPli20u8yy8FbiUL38YC7QIIcTHNCdSx+VAr1EfnxaTi6WfrXwVC3+TH/Wksc7TNtV1ergvsMQ0RS7uORZ/y6P4jgEL4vw+7A5pUKDtYZ39IsckNTrlLfIu+q9JR+vuOy/Kfmg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744489630; c=relaxed/simple;
	bh=AkBmi3smSWITHl2bmr29dOmbgvhXHgDHeSc21unzXPg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mxVTFY6lg18qqBUKBFyLyVWtbPFvhJ0nK04CJgeLiobLRPcwRUiakTkE08U51WKeWXKquoMDR0SYUiJm1B1gtbiFFmo74cOazqwZ7q5elrrz+VEBUep8o4/3O+qiBTJqvoBJaGfdpa+BIurGVcKyAnmgW0n8y8g4wzggopBidWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NfbnsuJ6; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cfa7e7f54so19467525e9.1;
        Sat, 12 Apr 2025 13:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744489627; x=1745094427; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H8Z64jhMWr4f68K+GRZRK+Jca5FzqJ7OziWBl/OdXKA=;
        b=NfbnsuJ6Tg4ypbzr5rpH48BGiVCXqe+NZ5PKNAI5qZ9C6vS7Zh+cPZlsEvG/h0Hu3o
         JgdFnG6VHdT5S3WOP2Afq9u6ergPBSODLDeHK2SVcw14M1MTkzPObb2OKSRG44ajQSsn
         4PXXYHcNhPqNRogV+zu2IzMoX7bdlv9pAMyYZsQrWiY6BN6PCrGbjWGzIdgkSdzhSjGI
         F1CbtSVK8WtVHyBeznSuWM5y5+abCDUuTBkXtgF97ZSyKwwUK6VU99d848V8+cp1gdXT
         XGYkMKsRkaqEAL5AlVWtapfzdZpHGhVDRGaG4qAz94E0VQq6ptCT90g1gVFWAMWvZ74e
         1xhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744489627; x=1745094427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H8Z64jhMWr4f68K+GRZRK+Jca5FzqJ7OziWBl/OdXKA=;
        b=rhLDiU21aVkcPnhL4Ta9FAsFDpKiKnr/gg1OdUkO54oO050dOl6mmVc6I3iUUzlRLk
         GlFH6Bnui9/aVaoBiqyJjp9ZyPElM5+HO+5QKqFXbqxE3mxJ497K+coCawMp4ynkzjBX
         Te2SxJWosckMcNvN/7u+WXcuBJjfsOHvgjZYzPRSpHBeE4E4eUBE2r1ptm3sDcm2z5T5
         HBqCObEOemBBZZJf7WrhYrsqTa0Jiso7HEm2S36KWIzvbR5MSGi0tPeS8sblK0Y42jcK
         ECtBToNISr82gA54sx/iEcdboxS99fnWwDTttP/V2JhyIoKFBJQrZq3YjKqB3I+aIVQR
         GXMA==
X-Forwarded-Encrypted: i=1; AJvYcCVAUEraGwcnzhTMVcXCjbM81hF1iSTCIQS4v4W/P8vM4cqFmEZD/8wQTw2vgLYTRwz+Qg/TTCeTxJ9fj9ZqWg==@vger.kernel.org, AJvYcCVPL3RaLOj1CTComffMbUZMeVzxEc86IYodZMHu0L+odmORI8WR1OKv2WCLNjGFrdIQlGG9HvDqQP85@vger.kernel.org, AJvYcCXawgnrbvc0tdZEXpeANPEh/fH6aZUc4IrGfvAfTClMVAViz3911fdkt39dWz/HwogRIbjbHFoUcyrK77Lt@vger.kernel.org
X-Gm-Message-State: AOJu0YxbtFYcvSsXWSd3ef31vqhEZjcBKsdOPOiNPDzwiNyu4rvyNrXV
	A4Sf+daVhiSk5K9gi1zxb+RBMAM4B1+2BLY+1NAb0mudFzpeTVeI
X-Gm-Gg: ASbGncvb3cQp4fZZgRasRvlQNYoQj/AcPjZWySTnqbFmE3RNBC5ePEamsIC27u6NbsB
	T5YOwQ3ermRiILQaIzjibV8uX13kg6q/OZpx0sb+d+oJPcVvkgL5l7KHIy5IXMg0YIr6/z8rQLI
	/biG/4RV15e2LgDCEYvbr4q8MLsHrzr+FnwrhFcYIKkDT1u8uL4rsYaLPwv+4+pB6kgN5XkNKow
	ocrU8tZB2COaoPVJMDTQ1ZWCGADTv/CqkdDbaKW3yTbdQYY2J8f5H7o2Gl1vl/8ga5lrN/qIQl1
	8NYusvWfL99MBV2sNQR+DLw58xoaKCAY0ctNQiGQvatPo83x0unvajyTWLt7jKLwUvmAskHsE0R
	xxr0wptzrClAN0H4AAJUT/LJ3xCg=
X-Google-Smtp-Source: AGHT+IG73wjyA14hJiUHlYys0uHoP/Gq7sjSROhJNkoVVZBSO2iuHMJltm4VuHHk5qyF/mQobHC8yg==
X-Received: by 2002:a05:600c:1e1c:b0:43d:1bf6:15e1 with SMTP id 5b1f17b1804b1-43f39622728mr61973155e9.1.1744489627005;
        Sat, 12 Apr 2025 13:27:07 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f2338d802sm131797845e9.1.2025.04.12.13.27.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Apr 2025 13:27:06 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-samsung-soc@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v4 08/10] phy: phy-snps-eusb2: refactor reference clock init
Date: Sat, 12 Apr 2025 23:26:18 +0300
Message-ID: <20250412202620.738150-9-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250412202620.738150-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250412202620.738150-1-ivo.ivanov.ivanov1@gmail.com>
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


