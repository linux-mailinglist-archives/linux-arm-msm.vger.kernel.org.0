Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A919202C2F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Jun 2020 21:28:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729974AbgFUT23 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 21 Jun 2020 15:28:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729810AbgFUT22 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 21 Jun 2020 15:28:28 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A8C1C061795
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Jun 2020 12:28:28 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id e4so16922011ljn.4
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Jun 2020 12:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=L9TQFVzt0zHBbW68TgkD9/2LYR7mWH10co/0ufY2ehU=;
        b=n++c/NF/Z6xfvP/Iz7CkJwiZGUaDTCQwxJ8qc/1KFTqM1ZNZbi7CgXg0lRsZy4skON
         lsO+t0GNd1OKfE4sWMep9SrSrxieTMmo1GRsgk1S9kfRJeJt6ArmKGeaAHT113WMdhAy
         6oGN5mqV1ouATT7XIXmJW4ejIOKBchSM/wOmQHqFNdaCEbLknalJKaleAa/SqbAsjEPu
         5LH1aNSeKouhxnL0KrK7gyqncIAi9clvdKw5shKuzXXLAm7o+66GsePXbq8tTIK2d6ot
         KjjuWYL3m7NJafw8jY6bYCOrsyrGbkIDfuLG/2ze/kBnn48sktTr9pxExPpER0bFrrcj
         bHoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=L9TQFVzt0zHBbW68TgkD9/2LYR7mWH10co/0ufY2ehU=;
        b=NPTQKyrSNAM+p3KxHsSga7CW35/83g/S0LRe5QyN+6RdUwrr7fCTOEUXe7AfLnkSN2
         b1KQg30gve3o8gc2/KYjIZQ6Rdu21tgAZnimITBAVCA6ouYPLiF29cHWMELucr2UtDhV
         mJuE0wWYGGLbsFjqXT3WczKPoppsYyNopVU4pGMLcA5QRX+6FiaW7Jsr3VLJ3uba0LSq
         uNynPFBBfatHg9RVVJyAF4BAzh95ij9oBSVCAPo0XA9QgpUe9too2taNcGA7WC9gOzE3
         haIneWPWpS9UIbPngvBY8FI/dUlGFhkwjnhFwzsw16G7Xi4ilaqHBz6666KW/Ddh9RMD
         k+oA==
X-Gm-Message-State: AOAM533pwGr3eJu8SYiKZ3k9hMu5BuygBN0PnJ6zOvXYWOoIESQEL7zS
        YnbCCkxNAKXAxrKM3X1f46fWpr0kiVo=
X-Google-Smtp-Source: ABdhPJwjXFpUeB2IOebJxfj3AE4fMZNgbwgEcO1wGFqhfp2TqUKJBAGG8TCth8ZfnQmKMsvoUL631A==
X-Received: by 2002:a2e:b4b6:: with SMTP id q22mr6250647ljm.53.1592767706603;
        Sun, 21 Jun 2020 12:28:26 -0700 (PDT)
Received: from eriador.lan ([188.162.65.109])
        by smtp.gmail.com with ESMTPSA id o201sm2917205lff.8.2020.06.21.12.28.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2020 12:28:26 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Vinod Koul <vkoul@kernel.org>
Subject: [PATCH 1/3] arm64: dts: qcom: pm8009: Add base dts file
Date:   Sun, 21 Jun 2020 22:28:22 +0300
Message-Id: <20200621192824.2069145-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add base DTS file for pm8009 along with GPIOs and power-on nodes.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/pm8009.dtsi | 37 ++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/pm8009.dtsi

diff --git a/arch/arm64/boot/dts/qcom/pm8009.dtsi b/arch/arm64/boot/dts/qcom/pm8009.dtsi
new file mode 100644
index 000000000000..cb1a10e72474
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/pm8009.dtsi
@@ -0,0 +1,37 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2017-2019, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2020, Linaro Limited
+ */
+
+#include <dt-bindings/spmi/spmi.h>
+
+&spmi_bus {
+	pmic@a {
+		compatible = "qcom,pm8009", "qcom,spmi-pmic";
+		reg = <0xa SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pon@800 {
+			compatible = "qcom,pm8916-pon";
+			reg = <0x0800>;
+		};
+
+		pm8009_gpios: gpio@c000 {
+			compatible = "qcom,pm8005-gpio";
+			reg = <0xc000>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
+	pmic@b {
+		compatible = "qcom,pm8009", "qcom,spmi-pmic";
+		reg = <0xb SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+	};
+};
-- 
2.27.0

