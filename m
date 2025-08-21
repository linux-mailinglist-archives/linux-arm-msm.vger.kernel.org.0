Return-Path: <linux-arm-msm+bounces-70073-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA7EB2F06B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 10:03:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8F9533A0737
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 08:02:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51E782E9ECC;
	Thu, 21 Aug 2025 08:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XDYl1nBG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 562A2242D76
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 08:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755763329; cv=none; b=CAL7GAfe3KHKVaISkx/Q9ZlrlCCkY+PvZHBCgMNwPD2Zg0AowMNKDG3zguK3O2MGe4bhJGZUhDKqQMm/aqempurIJQ4f1aMrLkHafcTiPsu7tsaf93SJZOSnS5MDgQlZ73CBBlgz5zdkvFvH7HqYpY/ESEJLZuS4Hl+F7Yuar6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755763329; c=relaxed/simple;
	bh=zt6yiLOQI7rD9+6jP0vFg/flZSuMXk7SuTB5NlV0LnU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=DtsLRiYXkpGT1kLICW0KKhFXBFwxS/Hlt/PEJTMaade4eiYqiPwzt/LdoGEFCJ/f/qjTVIub2dK7IDO8KtKCMf3INQ8TPUqY7+76x5/E111UmBUUtrG0qM2E+fOXKfXnEn4xji64Nna/75lCxEHjW7qCdEGRTRSNAS8/Kg6+VHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XDYl1nBG; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-45a1b00f23eso3639175e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 01:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755763326; x=1756368126; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Hn27vZnhIqBSicegyUAo/osnGXFM0EzIXplvQ6HEFls=;
        b=XDYl1nBGC7cgi4GNwJ6oo8gQVwBT6qbeiQHbkUbkgGjRicCK9AG0XNOl3GDuGsM5FC
         qE104L5ZQ6AWQxI8+StKkGobp+DXNH0a6CxX8SXH6/sbHsUb6+h8wAeOOqnADYsGNuOh
         qig02b3sALChrzn92ul+zfulw009/lHiQTjX17d3G85TGfkia3a+B09PY6wiZ1q8Q9ND
         0S3hWVoW3fvoBRqmOWcecl+XSlYfDVzDLhfCiQDd/yHOx+wkDsZeaHS3D4OyOtZlzyEf
         pIQqKP+k3/cx4kj3yYo+DNTt9y0ejXdcdIHDYftZtcYmvmIhozuwgiEAbYbb0diE49+5
         CJJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755763326; x=1756368126;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hn27vZnhIqBSicegyUAo/osnGXFM0EzIXplvQ6HEFls=;
        b=ldFq1k5689/5cqOffeU1BJUPRvpXgfF2HKUipFT9PjRDHL9pLhDCtc5YWTR8DTm+sW
         TmORtlY5U8WKPmeeF6d0VF8+Qaq3z/RUMRWKYAfE2s/BcBH4Ne+j0zaHpjFjCnsq27EQ
         eu11wsuYEFVc6328STibVmDdlvkdN0L812KRhvE4AamObzlZud+oVU+uaBCjfgV1AAUD
         DxiPCaMOyEMFyBtFW0UqCC9+JWvItrF6DlU+cNwAgduz+yOhyZ79Iy4fWRZBRLFs5OZJ
         +yip9W4IWmVsDbXAv7hKm6I7dsWL645Sds7G4txZiEO3f3ns/G5wzvCe6PpQbzErv+3A
         r6Fg==
X-Forwarded-Encrypted: i=1; AJvYcCWQ0MuFsC53NOCQtSckYczjrXyxmy0uJGBI6gL9W5rs1gV6qKcvNZ486z3jlZ7mPry1LrseNJMx2UXsk/YQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzatBcPxFSyw/ztEek8yfonH0FO1hB7X4K7Pu/aEg7ZzoKX3cA8
	YF6+ztBIs9Ep7uT0nN7490QchvGjs54oiec0ADcsdndpMi2W8Es9+I03fbMa4qcy+3A=
X-Gm-Gg: ASbGncsa2cLBOE4T2XpGludPG3Z7vrn6ySbEmurXcfBKiSoomO4nmwztECoR4oDF3aB
	vkgwNHDiSV6IDkY2FetVuE87h/5IeWjozPzm51MDG+aY/8SqMc1jSA8vEFwFucVZdVf4E8LOvgv
	BEJ+joF9Iin31YR0H9iu5Cya3qKnDNSIYCTOBpXNoF9OFlmiStzPA4XQhn2DQNTNJ6/sOZF8exv
	Qy0G2nTRyhMDG/K3VLV5tXnyfbATWlvRPvMZYU/RMSaG/UrhxTm8rUlS9PWgqxmPo+so4FHDsze
	b6KF7gyuXBSOrNhnodq3yRLqpMRmroei5s4ORVevn5/9N1mR5Ch14RHVsd1+EExT1eOsYKcIp3l
	fRPWRaFXO03+qlPBHFt4LWBrXpHrIY5TIy5+7
X-Google-Smtp-Source: AGHT+IFyf4GxZUgfH24ON3BuA2aO3p7JoOEyz8RGPT602L+yh2FycWNW4H1ldr6Xsp2nsN+1IQ/uyQ==
X-Received: by 2002:a05:600c:138f:b0:456:1824:4808 with SMTP id 5b1f17b1804b1-45b4d8779camr9361005e9.32.1755763325420;
        Thu, 21 Aug 2025 01:02:05 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:a59f:f2cf:3ca3:965])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b4dc28fc8sm16337285e9.24.2025.08.21.01.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 01:02:05 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Thu, 21 Aug 2025 10:01:47 +0200
Subject: [PATCH v3] phy: qcom: qmp-pcie: Fix PHY initialization when
 powered down by firmware
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250821-phy-qcom-qmp-pcie-nocsr-fix-v3-1-4898db0cc07c@linaro.org>
X-B4-Tracking: v=1; b=H4sIAGrSpmgC/43NsQ6DIBSF4VcxzL0NXIXWTn2PpgMCKkkVhIbUG
 N+96NQuTcf/DN9ZSDTBmkguxUKCSTZaN+YoDwVRvRw7A1bnJkiR0zND8P0Mk3IDTIMHr6yB0ak
 YoLUvYIKWjAqsK6VJFnwwed712z13b+PThXk/S2xb/3MTAwa1PGkqucamEteHHWVwRxc6ssEJP
 7HqN4YZaw0X2HBNUbIvbF3XN3EVRhcUAQAA
X-Change-ID: 20250812-phy-qcom-qmp-pcie-nocsr-fix-1603106294cd
To: Vinod Koul <vkoul@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Wenbin Yao <quic_wenbyao@quicinc.com>, Qiang Yu <qiang.yu@oss.qualcomm.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>
X-Mailer: b4 0.14.2

Commit 0cc22f5a861c ("phy: qcom: qmp-pcie: Add PHY register retention
support") added support for using the "no_csr" reset to skip configuration
of the PHY if the init sequence was already applied by the boot firmware.
The expectation is that the PHY is only turned on/off by using the "no_csr"
reset, instead of powering it down and re-programming it after a full
reset.

The boot firmware on X1E does not fully conform to this expectation: If the
PCIe3 link fails to come up (e.g. because no PCIe card is inserted), the
firmware powers down the PHY using the QPHY_PCS_POWER_DOWN_CONTROL
register. The QPHY_START_CTRL register is kept as-is, so the driver assumes
the PHY is already initialized and skips the configuration/power up
sequence. The PHY won't come up again without clearing the
QPHY_PCS_POWER_DOWN_CONTROL, so eventually initialization fails:

  qcom-qmp-pcie-phy 1be0000.phy: phy initialization timed-out
  phy phy-1be0000.phy.0: phy poweron failed --> -110
  qcom-pcie 1bd0000.pcie: cannot initialize host
  qcom-pcie 1bd0000.pcie: probe with driver qcom-pcie failed with error -110

This can be reliably reproduced on the X1E CRD, QCP and Devkit when no card
is inserted for PCIe3.

Fix this by checking the QPHY_PCS_POWER_DOWN_CONTROL register in addition
to QPHY_START_CTRL. If the PHY is powered down with the register, it
doesn't conform to the expectations for using the "no_csr" reset, so we
fully re-initialize with the normal reset sequence.

Also check the register more carefully to ensure all of the bits we expect
are actually set. A simple !!(readl()) is not enough, because the PHY might
be only partially set up with some of the expected bits set.

Cc: stable@vger.kernel.org
Fixes: 0cc22f5a861c ("phy: qcom: qmp-pcie: Add PHY register retention support")
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
Changes in v3:
- Move up existing comment block and clarify it, so that it is more obvious
  what the additional checks really do (Bjorn)
- Link to v2: https://lore.kernel.org/r/20250814-phy-qcom-qmp-pcie-nocsr-fix-v2-1-fe562b5d02a1@linaro.org

Changes in v2:
- Ensure that all expected bits are set (Konrad)
- Link to v1: https://lore.kernel.org/r/20250812-phy-qcom-qmp-pcie-nocsr-fix-v1-1-9a7d0a5d2b46@linaro.org
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index 95830dcfdec9b1f68fd55d1cc3c102985cfafcc1..0fa63b734b67b8f44580b56555950bb5d74ef94c 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -3067,6 +3067,14 @@ struct qmp_pcie {
 	struct clk_fixed_rate aux_clk_fixed;
 };
 
+static bool qphy_checkbits(const void __iomem *base, u32 offset, u32 val)
+{
+	u32 reg;
+
+	reg = readl(base + offset);
+	return (reg & val) == val;
+}
+
 static inline void qphy_setbits(void __iomem *base, u32 offset, u32 val)
 {
 	u32 reg;
@@ -4339,16 +4347,21 @@ static int qmp_pcie_init(struct phy *phy)
 	struct qmp_pcie *qmp = phy_get_drvdata(phy);
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
 	void __iomem *pcs = qmp->pcs;
-	bool phy_initialized = !!(readl(pcs + cfg->regs[QPHY_START_CTRL]));
 	int ret;
 
-	qmp->skip_init = qmp->nocsr_reset && phy_initialized;
 	/*
-	 * We need to check the existence of init sequences in two cases:
-	 * 1. The PHY doesn't support no_csr reset.
-	 * 2. The PHY supports no_csr reset but isn't initialized by bootloader.
-	 * As we can't skip init in these two cases.
+	 * We can skip PHY initialization if all of the following conditions
+	 * are met:
+	 *  1. The PHY supports the nocsr_reset that preserves the PHY config.
+	 *  2. The PHY was started (and not powered down again) by the
+	 *     bootloader, with all of the expected bits set correctly.
+	 * In this case, we can continue without having the init sequence
+	 * defined in the driver.
 	 */
+	qmp->skip_init = qmp->nocsr_reset &&
+		qphy_checkbits(pcs, cfg->regs[QPHY_START_CTRL], SERDES_START | PCS_START) &&
+		qphy_checkbits(pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL], cfg->pwrdn_ctrl);
+
 	if (!qmp->skip_init && !cfg->tbls.serdes_num) {
 		dev_err(qmp->dev, "Init sequence not available\n");
 		return -ENODATA;

---
base-commit: aac1256a41cfbbaca12d6c0a5753d1e3b8d2d8bf
change-id: 20250812-phy-qcom-qmp-pcie-nocsr-fix-1603106294cd

Best regards,
-- 
Stephan Gerhold <stephan.gerhold@linaro.org>


