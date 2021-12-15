Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 608114751AF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Dec 2021 05:35:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239737AbhLOEfM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Dec 2021 23:35:12 -0500
Received: from sin.source.kernel.org ([145.40.73.55]:46514 "EHLO
        sin.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236512AbhLOEfM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Dec 2021 23:35:12 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 6A57DCE1C1D;
        Wed, 15 Dec 2021 04:35:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45563C34605;
        Wed, 15 Dec 2021 04:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639542908;
        bh=0UJXfbwZTLWPS7ofrVooBY3SOutsZgnk0uYQcrrmfPs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=U9N3y+D7UvMQ/MAtGg8IUbNHiaFe1pkhO4KHXxutc796799vEuYzwEBolSUk5n4qM
         Vyw+9rwtOpQrIbvegfmc3m/H6wQw9KqwsX9ghdnmwEAgZfZp0rBffbaOGkQ7q+BVcd
         JFcR0wHw62hlorCqu3TZ8hbccRiBfkbxh8G0zVnwvwhp1XitqYqJP+ZUPHvF+AIPyL
         Nm3tUn9SjJBsPApF3zIWme83PTMeZ9vKjB8OFb5/nu5GrBOE3XKM4oC58RcF/UvQac
         /CCEDZa4YKeuWoCDlDxE50pyBHWjXsVb/7hug9NoxN7wKHIvXUPiwEvPgYCo7/8AFy
         J6cfvUJ0O0hyQ==
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        devicetree@vger.kernel.org
Subject: [PATCH v3 05/11] arm64: dts: qcom: Add base SM8450 QRD DTS
Date:   Wed, 15 Dec 2021 10:04:34 +0530
Message-Id: <20211215043440.605624-6-vkoul@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211215043440.605624-1-vkoul@kernel.org>
References: <20211215043440.605624-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add DTS for Qualcomm QRD platform which uses SM8450 SoC and mark the
reserved nodes.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 arch/arm64/boot/dts/qcom/Makefile       |  1 +
 arch/arm64/boot/dts/qcom/sm8450-qrd.dts | 33 +++++++++++++++++++++++++
 2 files changed, 34 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sm8450-qrd.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 6b816eb33309..9b37261484cf 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -107,3 +107,4 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8250-sony-xperia-edo-pdx203.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8250-sony-xperia-edo-pdx206.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8350-hdk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8350-mtp.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sm8450-qrd.dtb
diff --git a/arch/arm64/boot/dts/qcom/sm8450-qrd.dts b/arch/arm64/boot/dts/qcom/sm8450-qrd.dts
new file mode 100644
index 000000000000..8dcd41c4e5ab
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sm8450-qrd.dts
@@ -0,0 +1,33 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2021, Linaro Limited
+ */
+
+/dts-v1/;
+
+#include "sm8450.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. SM8450 QRD";
+	compatible = "qcom,sm8450-qrd", "qcom,sm8450";
+
+	aliases {
+		serial0 = &uart7;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
+
+&qupv3_id_0 {
+	status = "okay";
+};
+
+&tlmm {
+	gpio-reserved-ranges = <28 4>, <36 4>;
+};
+
+&uart7 {
+	status = "okay";
+};
-- 
2.31.1

