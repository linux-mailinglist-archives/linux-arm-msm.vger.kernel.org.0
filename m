Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5C1E11824F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2019 00:39:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727028AbfEHWj1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 May 2019 18:39:27 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:37574 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726506AbfEHWj1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 May 2019 18:39:27 -0400
Received: by mail-pf1-f194.google.com with SMTP id g3so198193pfi.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 May 2019 15:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=DI+BFwmjWQA6D82QdpD9PwbEn/75l/dnxAFOv7WasL0=;
        b=pN6yEozN+v9qh958i/29zP43Q6Fdk3TyYa3IHeIxW3ZQc+MQg4sQRr/uBZbI6UQ4a6
         GAfCk7erK4RiXgjzX+MxK6HzxZGT7wXRgYY3JWzJuEgf1gMEyCK581h3T+yccNT5wV4h
         6FB68zvGP53iLipyrQu5sT04QMuFG7+3+5pcYVG43J/9drS1hBK46pKgO13tA0CZFthH
         ORGZYZErMUIcFTAiAeW4CzAjuFoc4c68PRSy8uLSvkVH7nF2UZL/OLyGZRgMR13pUzqU
         551X1hdc0P4G4j+P69VWc0WuePLHsciusqaK32Y6ph2WzWxLNrvRzaM4h0namHG3sCYT
         hTqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=DI+BFwmjWQA6D82QdpD9PwbEn/75l/dnxAFOv7WasL0=;
        b=hGJ9AwZOiVJSmVrriCHYVdrDinO69X8j+EEg1XwseLNJ8tGJN5nF/IxRlT0Ql7ED5g
         mf4Iuadrbd7+onndH1dNFPtMk/5xxJ18gla3m109MKGsjeX2Y5L44GA+cj8j5PWT4woB
         L7iYd9Cc58rWUe0GCER8oEB3NArJjD2KBAnu/htILj7iUH5h6HdkA8eWnau7esbp4H0J
         uDS2+7Hc8H3snLxtmTUaKugFq3UU9zINSjqRrxA6hnXGDYFUYF5NRKV0dEGdc+mhFHwn
         J8kFVRi1mhO+83+m1YpNl6GjxEaErbz3RLLcp1noxzTRVKzBO5FOkqaGSeAQdL1jIDb1
         k7hw==
X-Gm-Message-State: APjAAAUdxxeccopfcdHb29/1kSk77tyy3rs2zp5IOCj0kXpp7+egAtKB
        jF5MINMkoPsibH17SrIUVRcgrA==
X-Google-Smtp-Source: APXvYqxZHNcJ7/5iAg404zT2w1lum4XrojyHWZaqJbHdRHScPBbGcVlHEnxcrGXGPLY9D7Uu90GP6w==
X-Received: by 2002:a65:4342:: with SMTP id k2mr883081pgq.178.1557355166187;
        Wed, 08 May 2019 15:39:26 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id p5sm266785pgs.32.2019.05.08.15.39.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 08 May 2019 15:39:25 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v4] clk: gcc-qcs404: Add PCIe resets
Date:   Wed,  8 May 2019 15:39:22 -0700
Message-Id: <20190508223922.5609-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.18.0
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enabling PCIe requires several of the PCIe related resets from GCC, so
add them all.

Reviewed-by: Niklas Cassel <niklas.cassel@linaro.org>
Acked-by: Stephen Boyd <sboyd@kernel.org>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v3:
- Fix rebase mistake in v2

Changes since v2:
- Rebase patch

 drivers/clk/qcom/gcc-qcs404.c               | 7 +++++++
 include/dt-bindings/clock/qcom,gcc-qcs404.h | 7 +++++++
 2 files changed, 14 insertions(+)

diff --git a/drivers/clk/qcom/gcc-qcs404.c b/drivers/clk/qcom/gcc-qcs404.c
index a54807eb3b28..29cf464dd2c8 100644
--- a/drivers/clk/qcom/gcc-qcs404.c
+++ b/drivers/clk/qcom/gcc-qcs404.c
@@ -2766,6 +2766,13 @@ static const struct qcom_reset_map gcc_qcs404_resets[] = {
 	[GCC_PCIE_0_PHY_BCR] = { 0x3e004 },
 	[GCC_PCIE_0_LINK_DOWN_BCR] = { 0x3e038 },
 	[GCC_PCIEPHY_0_PHY_BCR] = { 0x3e03c },
+	[GCC_PCIE_0_AXI_MASTER_STICKY_ARES] = { 0x3e040, 6},
+	[GCC_PCIE_0_AHB_ARES] = { 0x3e040, 5 },
+	[GCC_PCIE_0_AXI_SLAVE_ARES] = { 0x3e040, 4 },
+	[GCC_PCIE_0_AXI_MASTER_ARES] = { 0x3e040, 3 },
+	[GCC_PCIE_0_CORE_STICKY_ARES] = { 0x3e040, 2 },
+	[GCC_PCIE_0_SLEEP_ARES] = { 0x3e040, 1 },
+	[GCC_PCIE_0_PIPE_ARES] = { 0x3e040, 0 },
 	[GCC_EMAC_BCR] = { 0x4e000 },
 };
 
diff --git a/include/dt-bindings/clock/qcom,gcc-qcs404.h b/include/dt-bindings/clock/qcom,gcc-qcs404.h
index 454b3f43f538..2cd62c98561f 100644
--- a/include/dt-bindings/clock/qcom,gcc-qcs404.h
+++ b/include/dt-bindings/clock/qcom,gcc-qcs404.h
@@ -166,5 +166,12 @@
 #define GCC_PCIEPHY_0_PHY_BCR				12
 #define GCC_EMAC_BCR					13
 #define GCC_CDSP_RESTART				14
+#define GCC_PCIE_0_AXI_MASTER_STICKY_ARES		15
+#define GCC_PCIE_0_AHB_ARES				16
+#define GCC_PCIE_0_AXI_SLAVE_ARES			17
+#define GCC_PCIE_0_AXI_MASTER_ARES			18
+#define GCC_PCIE_0_CORE_STICKY_ARES			19
+#define GCC_PCIE_0_SLEEP_ARES				20
+#define GCC_PCIE_0_PIPE_ARES				21
 
 #endif
-- 
2.18.0

