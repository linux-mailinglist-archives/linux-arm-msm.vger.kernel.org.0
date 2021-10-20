Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE169434F67
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Oct 2021 17:56:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230265AbhJTP6W (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Oct 2021 11:58:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229817AbhJTP6V (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Oct 2021 11:58:21 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED7C9C06161C
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Oct 2021 08:56:06 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id s19so13377375ljj.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Oct 2021 08:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=m+ItIczt/we4aCNCLuPDWBIl9eNpeN0Gi5+dFsstjg8=;
        b=PPfHiBhF0CgmaF6jTyOOy20Z/ohxmUG7g5ibNhERJYs885j4aoCdo130v++obE+wZR
         s7m0NosLd1OIOZ6oy65cHw2Z85b58XBequm8WPkA0RQ0ebIa8Oz7HUEDvgrq3UK2W80u
         0N0mduaKzAdLWk3BqIj0vn1t8A19wMCVaYQPvhtSgxP1ovyNKWoZXVQPr32RAkiiTZLQ
         Z2NF9fpyCc/uSfAG2gle/ZCXOY2UAw2DaTZ48abCVqzm3ywGTKnWUmyAA9nZx2tI55iL
         xMEPmCohvB8pXxpnUZh/2iJXHKXvVDQanW6xzz/BvNgfqGavUVsHIPnJCK6jLMY9aJYr
         UerA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=m+ItIczt/we4aCNCLuPDWBIl9eNpeN0Gi5+dFsstjg8=;
        b=UUBqjHhvxU6r6g7VAvBckcbZF0w74dIVl9D03tFN7WLPgQWR6SBHG0iNpHUidwfBwf
         BgiszOkvZbLt/TK0Vy1eDbQwegvMtPMmROiAcqKzhIITd8S/CwBoLzsFFIGQKI/Anxmo
         2ESlEgzrVxbjDje/M2zJl7IVEmhnWJLDd7iahWr2PbCXCeKirG5Q3AwOK65o0rNN8qRi
         OnYNjW5r4tmrI4Wn8aNquEoj+/+1fe2SYw+YbUbI7Pi0NKRDFx6a5GE+tirt3P9pSrtE
         HIFjP/6tAwaj54IN0qN8gmM6I9eFPQsX1jF41+WSX2DLWS64fVHchQCaVGm6bAIKHDgo
         tIxQ==
X-Gm-Message-State: AOAM533AH+sklQyTP8zEETTjifqKCiMwhRf8DlWncRkkeb5NRRcdSznt
        o1P+EmPA/mOxJBpsaBTr2QRYKQ==
X-Google-Smtp-Source: ABdhPJxfdnLSsbBzdIeOpiiyLCWKXSAGHn87WQRfJq9+wpr+WmYiuCbZWZSwJEQYkTD/fYdL1ZUL+Q==
X-Received: by 2002:a2e:b8cd:: with SMTP id s13mr240993ljp.352.1634745365247;
        Wed, 20 Oct 2021 08:56:05 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id k14sm264348ljh.125.2021.10.20.08.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Oct 2021 08:56:04 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH] phy: qcom-qmp: another fix for the sc8180x PCIe definition
Date:   Wed, 20 Oct 2021 18:56:04 +0300
Message-Id: <20211020155604.1374530-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Commit f839f14e24f2 ("phy: qcom-qmp: Add sc8180x PCIe support") added
SC8180X PCIe tables, but used sm8250_qmp_pcie_serdes_tbl as a serdes
table because of the copy paste error. Commit bfccd9a71a08 ("phy:
qcom-qmp: Fix sc8180x PCIe definition") corrected part of this mistake
by pointing serdes_tbl to sc8180x_qmp_pcie_serdes_tbl, however the
serdes_tbl_num field was not updated to use sc8180x table. So let's now
fix the serdes_tbl_num field too.

Fixes: bfccd9a71a08 ("phy: qcom-qmp: Fix sc8180x PCIe definition")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
index f14032170b1c..06b04606dd7e 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
@@ -3632,7 +3632,7 @@ static const struct qmp_phy_cfg sc8180x_pciephy_cfg = {
 	.nlanes = 1,
 
 	.serdes_tbl		= sc8180x_qmp_pcie_serdes_tbl,
-	.serdes_tbl_num		= ARRAY_SIZE(sm8250_qmp_pcie_serdes_tbl),
+	.serdes_tbl_num		= ARRAY_SIZE(sc8180x_qmp_pcie_serdes_tbl),
 	.tx_tbl			= sc8180x_qmp_pcie_tx_tbl,
 	.tx_tbl_num		= ARRAY_SIZE(sc8180x_qmp_pcie_tx_tbl),
 	.rx_tbl			= sc8180x_qmp_pcie_rx_tbl,
-- 
2.33.0

