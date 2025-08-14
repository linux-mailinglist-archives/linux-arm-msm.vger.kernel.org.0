Return-Path: <linux-arm-msm+bounces-69181-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E5AB26102
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 11:33:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 986893A59DF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 09:31:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 560BD2F3C3E;
	Thu, 14 Aug 2025 09:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="loRxQ2Ta"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 770412F39BB
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 09:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755163648; cv=none; b=ou7QDJOrBs0jewlxnGYdgT+PsVOTCxhunOSYjzwVrNYFSME7dCDED5zMrrMXuNR9tHLJATor5d5seaZrg99wAYlmeM0WUfqlN0g3KXZkLwpovB39q6lC20Y7r4XuOiGMUhuYVbg7zc4aoBhmJ3dMOU91qTO4VOjJjl97g/j5uII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755163648; c=relaxed/simple;
	bh=YdEsh9QrnxVUJ6j5Jg4QecwD0EyZRBdHjXrYunFZiEM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=GttBdxbW9Cw36GM9/vWilbGEmq3dfHJkmECcNfundTAKWdusz079joo1gDUT3MBYlWWkK9lFEIosaXfE9FXQ9ck0O8awvHaXOPr0cT5jkykxg94WcrcULFNVaQytRtEC99vql5Gd8LeW308pocjFBgAterf3cMXG8U4/jB9UqBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=loRxQ2Ta; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-45a1b05ac1eso3131065e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 02:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755163644; x=1755768444; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XqAuWv6c6I6Tmj7XNLmRavDkRG/hDMAr96wkLjEqxuw=;
        b=loRxQ2TafEZPIaUTwYcLzIvL6wEILQ3Pke5dfBq8Ne+NOo5DiRbMF2XDV5Xa43PfcM
         xTCj5zZia6h3rpjlKblcUj8r5wx8bjeXSJWrbNGktpU6ntdj6UJk8XdP1Bcz48ybxNt1
         wxB88/GLt2sqNBObFx1WTk9yW4Ajxdbkeof7XAS5sZnhk9di3CbDGm6Pq/iJWZbZxj9s
         /wDNkpafVIeugAibkRb8qhyNsp5gGzqf8n9jwWVJR0Xc1BiIAHgO2fxk21F3VRwmkrLS
         QOqpvh6OLk7i1sFAeKO/Q1NRsqF/BILifNyxXwAgDznqEN98M7lg6VvfsWVai28asEuY
         lHjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755163644; x=1755768444;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XqAuWv6c6I6Tmj7XNLmRavDkRG/hDMAr96wkLjEqxuw=;
        b=XApmeKKLQCx7YpErzSwHMbsypjhKASr+h8sgOq3wxheSdl6akHBeAgNqjl81xBY1EC
         foj9Sk7UiNyex3LZ7PX1mIRa2HT4I0wUK3zeQuLXhCG70XuT8J6gTSdry2q+3K+C9IOM
         J3CgOOROtFHuOloRRGPtqA+dY7YRjVASE58jYACIggx+vGEaWXxBLM0FEjGRxbSt96zS
         zga18trEdKFXCwYABS1WJN6KgYJT8SzIFt2RjSTKzl5S3QzpbWhGE4vKpC4fFa4BUdhw
         tB6+EBuWC98VNiJtUn0kh+yRFOt6B4mTmTt2ZaHwruCYW8u+zhxknZvy07k8BT6nn+a6
         T1wA==
X-Forwarded-Encrypted: i=1; AJvYcCWGb2xbp0hEyhhJVLEDqAbQMQdVM+DegdLxVF4/af76cj/IsI3eHJCy7/slZpajJPSdq+BClJwjUIKeF74u@vger.kernel.org
X-Gm-Message-State: AOJu0YyAZwA0+CbfjLuIfJT/4Yy4q0bm9SXZEHX0lt9SVCDQS8rETisI
	zsIU4l8aYZsM3KUFRXKv6LuKI+Lm3iLzTidjQsMg07yejng7dCkejPOPS2skV5klW+4=
X-Gm-Gg: ASbGncu6wO+LPh06+aHVqyvLvAJEx0PEk4dP7k+6njKGu60z8h0s0xRvVbqlCUQVBNU
	JQ49OyadtWCUmJi6G7RRaO8nXsOeWhUfEBMNUPGCQDXmk5UxjQ55imkGYiOrehjO8/0JtXmSzLU
	cuNR+0Q0aYVoMvp/L9tXkqBJ1aBIKtCPmqChx+xvKRqYnbXJ87BSGRZhMkXHw52t1bTWfZN/HcP
	/0jQ0UhiB1KF/gx4JapUHGWTC9BASx6ffSVOq4fmePycUrNUpRIYR1pXdOyOEN6IYMwFyylI+aH
	tu1y5FlkhdkNhuERkSJrANj/p++UMjzls492WG2gt5VCxBlYSdqTpwVg5XoPaVo+7SQKDVWR2jE
	am1hIuGn0W1/UamtFg6fbi/uvm6ZnF/mokh6T
X-Google-Smtp-Source: AGHT+IHd8S//p6vOsVTG4x5VxdE8TgAqYiOfk7VAHWwTIJ/ja0G7fBRZA7iqBF/C2V/BVdk/rCDUYQ==
X-Received: by 2002:a05:600c:3507:b0:458:ba04:fe6d with SMTP id 5b1f17b1804b1-45a1b60ce04mr17300535e9.14.1755163643794;
        Thu, 14 Aug 2025 02:27:23 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:ea13:2485:4711:708])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1c790689sm14706025e9.28.2025.08.14.02.27.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 02:27:23 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Thu, 14 Aug 2025 11:27:10 +0200
Subject: [PATCH v2] phy: qcom: qmp-pcie: Fix PHY initialization when
 powered down by firmware
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250814-phy-qcom-qmp-pcie-nocsr-fix-v2-1-fe562b5d02a1@linaro.org>
X-B4-Tracking: v=1; b=H4sIAO2rnWgC/42NQQ6CMBAAv0L27Jq2Aoon/2E41LbCJtKWrSES0
 r9beYHHmcPMBskxuQTXagN2CyUKvoA6VGBG7QeHZAuDEqoRF6kwjivOJkw4TxGjIYc+mMT4pA/
 KVpykaFVXGwulENkVvdfvfeGR0jvwus8W+bP/dReJEjt9tkI3Vj3q9vYirzkcAw/Q55y/t94P3
 ccAAAA=
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

Also check the register more carefully to ensure all of the bits we expect
are actually set. A simple !!(readl()) is not enough, because the PHY might
be only partially set up with some of the expected bits set.

Cc: stable@vger.kernel.org
Fixes: 0cc22f5a861c ("phy: qcom: qmp-pcie: Add PHY register retention support")
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
Changes in v2:
- Ensure that all expected bits are set (Konrad)
- Link to v1: https://lore.kernel.org/r/20250812-phy-qcom-qmp-pcie-nocsr-fix-v1-1-9a7d0a5d2b46@linaro.org
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index 95830dcfdec9b1f68fd55d1cc3c102985cfafcc1..80973527fafcb294273dff1864828532dab738db 100644
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
@@ -4339,10 +4347,12 @@ static int qmp_pcie_init(struct phy *phy)
 	struct qmp_pcie *qmp = phy_get_drvdata(phy);
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
 	void __iomem *pcs = qmp->pcs;
-	bool phy_initialized = !!(readl(pcs + cfg->regs[QPHY_START_CTRL]));
 	int ret;
 
-	qmp->skip_init = qmp->nocsr_reset && phy_initialized;
+	qmp->skip_init = qmp->nocsr_reset &&
+		qphy_checkbits(pcs, cfg->regs[QPHY_START_CTRL], SERDES_START | PCS_START) &&
+		qphy_checkbits(pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL], cfg->pwrdn_ctrl);
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


