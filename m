Return-Path: <linux-arm-msm+bounces-68830-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F2647B22D9D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 18:31:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9E84A7A9B4B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 16:29:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F1512F90FC;
	Tue, 12 Aug 2025 16:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JY8XcA9j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 926FA2F90F3
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 16:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755016228; cv=none; b=ltfOK2inmtbBZLLLEvk9fwQ5aN5chNDQ9u8tfaMfABBpm7ynmvpSeLqkXAOoctAPnarsln7JtK0qe59sqMot1WlMSqI4jnCHBWnZhmhTt0g7d1F08SjDhJVYWieFddm9ZljojQSz6OFTVpl0+srziRY74Cnvn5sN1Dsjeet9F3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755016228; c=relaxed/simple;
	bh=oSYCFI1iTzymsIUn3PPETl0CVJH+hNZYzC+Nc7UE+i8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=jHf7J+J1MZaD6wIEhUu5U04gE+2bgto8QW5+e1dXtfVP4svF1cX+/pW9u/u19LRJX6WVsNVSRNJfMxjdPuXMl/ib75SkRqnoC9018dKTSc/2N1pdq4m9cLHlSwznTRKNqP0aXW4jU5w7ytGPnFKnoXhUoHIeq1Jbd+6PezPNBEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JY8XcA9j; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-459eb4ae596so52376535e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 09:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755016225; x=1755621025; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CNJTYQpCcdsbSgf4CELO6wfx+k3jz1AKmn5lQQ5LUkc=;
        b=JY8XcA9jgJEQlzsuT9dDEb04/Dd7I6KUskgEAIy/y2aBZZ7xgNgftxsaKveACugUtT
         nNmUKj7XtgpnmrkFDV63NpvmYyPoxbf9iekwuEoTFi90LlRl28YBdfwv+/RDZqoEngeV
         KZFTMCXAYmcNIoRwRTAyGHbZlJELbClCsa4/7W5b03vL6ureFSb+22tGDZNlyeASUKJZ
         D6NtTgpqVONxwRIsGNeqGif5Mvzg+808kWfONa3A1zL6BtzQZQZa/MJrgSieczZ8BDV4
         V0pwLKnJaN7qW22WvydjVQXkudDaFGizXFpaYp/6heXrzdrv9TX1RgFMX7McWQJJ0rZF
         l96A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755016225; x=1755621025;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CNJTYQpCcdsbSgf4CELO6wfx+k3jz1AKmn5lQQ5LUkc=;
        b=vFVWDl/ytUe8O0kA/89k5KPV5mHxx2/wVkahjfX4iNdj63mGHhrlVfQu5LzNjg14+E
         Cyxl7TuFlYxQN8rI1fmh45AagPLmgdlhZBdFevYkyZ51kqTEpPKFT8hnskNRagaQw87p
         9X2gPbIYCwRDD02TZqw2RvrvRNWQQd0ITsW3hDf/M2Ct7S+lw9A7T7ERQFrntOAlkZnG
         g5wZ5MD5enAA988YRX7Ja/4FELb0+sLxSJeYVHvQkWGL0S2c2K6DsgbSvGiUNYE6tNW7
         kOOKLkJ3rmW6U/6jv7dMCBEGMFd4DBerESpbgftV+bihlADKWf4rgRNB4eivfuGtDgZX
         ZFwA==
X-Forwarded-Encrypted: i=1; AJvYcCUTVXQ/JhNRnQmBmo0oQJ/xvxYDccoEyk5a8ANa6ml7ZDuhn9skQO/6dvmr2UwUjEsBeJbCdCFwEJPo16Mi@vger.kernel.org
X-Gm-Message-State: AOJu0YzTUiqtKhxV30Dyo9N86K8vTlcrc+J3CKlHusQh3866vnsBNs5b
	5HKWlu5RZTQzPTpYu5L2JduBaaAzb807HPS1wbHKIBIQ/+FezzgyJ6X3OL+Rq8XGTX4=
X-Gm-Gg: ASbGncsfsMmBRn2aZslaPBOyT5ewubhS58/KYRAcvS8FQ9DNLFjvyp63ZjekL1KgvKX
	gTwYTjxds00LObLsagt8QI6ItQrfaLAmr2fyHMX/A5/AZt2TdarwwLzefz7m+SmbvaYVRDrbKR9
	ShMaHx6zCNoP3U/MTZ4pwDRIchwYS17Gn3FR96cVp5PLjJTlrgtTz+7dmrVrMl3HuT2uqmP7fCD
	ydlLaGdl0iM6Qi4l3kyq4MkIs3EDsPg6Y5FCXMklzLAxGHzEzYPVl3z069EKzbRKV9HtaY+KsZd
	con4CAplis5P5MffSiFv+65J+ZLklvQTgzgChy10zzy0vVmbOR+K26X5egldCIMHaJA00fZKNnV
	4m2QLACzI3lNGGCTUQ0EWb9mNzfDFomIZ+gcKxg==
X-Google-Smtp-Source: AGHT+IGKttqGjU9A0Fpe3dGN2nfDw184nCvOK8JV6Aat2Ur/HPfemJjjc8pzEQn+FGTR50sl9gI5qw==
X-Received: by 2002:a05:600c:1d25:b0:43c:fe5e:f03b with SMTP id 5b1f17b1804b1-45a15b55a73mr4428905e9.30.1755016224641;
        Tue, 12 Aug 2025 09:30:24 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:5574:c911:d648:8bca])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459ebede65asm255302755e9.8.2025.08.12.09.30.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 09:30:24 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Tue, 12 Aug 2025 18:30:19 +0200
Subject: [PATCH] phy: qcom: qmp-pcie: Fix PHY initialization when powered
 down by firmware
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-phy-qcom-qmp-pcie-nocsr-fix-v1-1-9a7d0a5d2b46@linaro.org>
X-B4-Tracking: v=1; b=H4sIABpsm2gC/x3MPQqAMAxA4atIZgNt/UG9ijhIjJrBtrYgSvHuF
 sfvDS9B5CAcYSgSBL4kirMZuiyA9tlujLJkg1GmUZ026PcHT3IHnodHT8JoHcWAq9yoW1Vp1Zq
 +pgXywQfO+b+P0/t+8JKf320AAAA=
X-Change-ID: 20250812-phy-qcom-qmp-pcie-nocsr-fix-1603106294cd
To: Vinod Koul <vkoul@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Wenbin Yao <quic_wenbyao@quicinc.com>, Qiang Yu <qiang.yu@oss.qualcomm.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konradybcio@kernel.org>
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

Cc: stable@vger.kernel.org
Fixes: 0cc22f5a861c ("phy: qcom: qmp-pcie: Add PHY register retention support")
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index 95830dcfdec9b1f68fd55d1cc3c102985cfafcc1..6a469a8f5ae7eba6e4d1d702efaae1c658c4321e 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -4339,10 +4339,12 @@ static int qmp_pcie_init(struct phy *phy)
 	struct qmp_pcie *qmp = phy_get_drvdata(phy);
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
 	void __iomem *pcs = qmp->pcs;
-	bool phy_initialized = !!(readl(pcs + cfg->regs[QPHY_START_CTRL]));
 	int ret;
 
-	qmp->skip_init = qmp->nocsr_reset && phy_initialized;
+	qmp->skip_init = qmp->nocsr_reset &&
+		readl(pcs + cfg->regs[QPHY_START_CTRL]) &&
+		readl(pcs + cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL]);
+
 	/*
 	 * We need to check the existence of init sequences in two cases:
 	 * 1. The PHY doesn't support no_csr reset.

---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250812-phy-qcom-qmp-pcie-nocsr-fix-1603106294cd

Best regards,
-- 
Stephan Gerhold <stephan.gerhold@linaro.org>


