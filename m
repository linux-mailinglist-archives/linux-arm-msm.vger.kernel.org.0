Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AEC91D67E4
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2020 14:06:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727999AbgEQMGD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 17 May 2020 08:06:03 -0400
Received: from h2.fbrelay.privateemail.com ([131.153.2.43]:46679 "EHLO
        h2.fbrelay.privateemail.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727912AbgEQMGD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 17 May 2020 08:06:03 -0400
Received: from MTA-05-3.privateemail.com (mta-05.privateemail.com [198.54.127.60])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by h1.fbrelay.privateemail.com (Postfix) with ESMTPS id 1893C80684;
        Sun, 17 May 2020 07:54:47 -0400 (EDT)
Received: from MTA-05.privateemail.com (localhost [127.0.0.1])
        by MTA-05.privateemail.com (Postfix) with ESMTP id 052666004A;
        Sun, 17 May 2020 07:54:45 -0400 (EDT)
Received: from localhost.localdomain (unknown [10.20.151.204])
        by MTA-05.privateemail.com (Postfix) with ESMTPA id 7C95C60049;
        Sun, 17 May 2020 11:54:44 +0000 (UTC)
From:   Eli Riggs <eli@rje.li>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, Eli Riggs <eli@rje.li>
Subject: [PATCH 3/3] arm64: dts: qcom: Add initial support for Xiaomi Redmi Note 8T
Date:   Sun, 17 May 2020 04:54:08 -0700
Message-Id: <20200517115410.3374-3-eli@rje.li>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200517115410.3374-1-eli@rje.li>
References: <20200517115410.3374-1-eli@rje.li>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Adds initial device tree for Xiaomi Redmi Note 8T, codename xiaomi-willow.
It uses the sm6125 SoC. Currently only boots into initrd shell over UART.
Requires appended DTB with qcom,board-id = <0x22 0x0> and
qcom,msm-id = <0x18a 0x10000> to actually boot.

Signed-off-by: Eli Riggs <eli@rje.li>
---
 arch/arm64/boot/dts/qcom/Makefile             |  1 +
 .../boot/dts/qcom/sm6125-xiaomi-willow.dts    | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sm6125-xiaomi-willow.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index cc103f7020fd6..060aa98200e47 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -22,6 +22,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-cheza-r3.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-db845c.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm850-lenovo-yoga-c630.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sm6125-xiaomi-willow.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8150-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8250-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-1000.dtb
diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-willow.dts b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-willow.dts
new file mode 100644
index 0000000000000..444b32ccb9d48
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-willow.dts
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (c) 2020, Eli Riggs <eli@rje.li>
+
+/dts-v1/;
+
+#include "sm6125.dtsi"
+
+/ {
+	model = "Xiaomi Redmi Note 8T";
+	compatible = "xiaomi,willow", "qcom,sm6125";
+
+	aliases {
+		serial0 = &qupv3_se4_2uart;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
-- 
2.20.1

