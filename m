Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C19172EBDF9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Jan 2021 13:57:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726770AbhAFMzZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Jan 2021 07:55:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726730AbhAFMzV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Jan 2021 07:55:21 -0500
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE1CBC061359
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Jan 2021 04:54:32 -0800 (PST)
Received: by mail-pg1-x534.google.com with SMTP id z21so2176489pgj.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Jan 2021 04:54:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iAiTykEwTqgC2GDGerrDJpot3g4zCIaX5OcjpwX6Dk0=;
        b=QLv3NpazDn24d3cKfv+3UBm4MtaJUc5xu3r6G0IxetDZ7n1KtPKfl9ZQpvSwv5pNWi
         p04EpTxqf0ZABi7tgOgYKbLICNNvZ189g0KS6kZJInZQu42J5jaZDzxfWG+IzinRotDa
         0FN+xulq9ZIWQ4uJ7sGPYtZv+kp56hdyd7f7nPRGb84JIFM+5PVA5iGRucGXDZNVXaFF
         jd3CfvYN+u5sado0aBj6ZlJgfuy6SEy/F8OvJ8SixR9KuCaGe/rI8B6h97LlWVJx7hDd
         c80CYFQwLKbkQrnA/awV+C00QHDGRYcNJE5tsOxCR6VsWsqjoq1kvcntH440s87UCdx/
         DE/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iAiTykEwTqgC2GDGerrDJpot3g4zCIaX5OcjpwX6Dk0=;
        b=b6XbmyYgbSA76c0Bf/7KruexcceGuPciW1a24phB9/q2tUeD5zT5JiEQQceb0MvfJr
         IzMR1xBH81ku8vF3FEMyTOBGqBIS90oPiKastOFWWpNFNG2TJGepzX3R/bCsi+rZyo/m
         O0JHL+UBx777AhxIHNdJVql4VnTupsDieMj9Xas+blrRcIAlv1h5a/zRUlFlkcS2bO8E
         fuUV8y/bHoJMXBbDilWI54brcYB2NPrwQ8ytfmIPAEDR5qctb7dMm/J3d3SH0QNZ3SRn
         lg1HJxZD7MMb0E73xTW8B4MO/E45N6mUVnMvW7sbLQ+OQD1KUAOxJZ1i31QIe+7FnIm4
         UIBg==
X-Gm-Message-State: AOAM533gvtM4L26/a9dEZ0ZVf08FQGORinjgvY0PCG/AwTi4GAH/CcPO
        e6QWdfyaMQ9D8UBR5j0ECwkg
X-Google-Smtp-Source: ABdhPJzz8H3GS2lze7AqlikX9G8WvQQkNEksTy97tZpYUjnGQDRhic6pUOV6XIsP0LaeSjwzZHSuyw==
X-Received: by 2002:a62:ca:0:b029:19e:67a9:f0f2 with SMTP id 193-20020a6200ca0000b029019e67a9f0f2mr3733198pfa.60.1609937672439;
        Wed, 06 Jan 2021 04:54:32 -0800 (PST)
Received: from localhost.localdomain ([2409:4072:6102:e7a2:51f0:bf72:bf80:ec88])
        by smtp.gmail.com with ESMTPSA id n128sm2918182pga.55.2021.01.06.04.54.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jan 2021 04:54:31 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vinod Koul <vkoul@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3 13/18] ARM: dts: qcom: sdx55: Add spmi node
Date:   Wed,  6 Jan 2021 18:23:17 +0530
Message-Id: <20210106125322.61840-14-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210106125322.61840-1-manivannan.sadhasivam@linaro.org>
References: <20210106125322.61840-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Vinod Koul <vkoul@kernel.org>

This adds SPMI node to SDX55 dts.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm/boot/dts/qcom-sdx55.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-sdx55.dtsi b/arch/arm/boot/dts/qcom-sdx55.dtsi
index ebcde361c3f3..9911e672b4d2 100644
--- a/arch/arm/boot/dts/qcom-sdx55.dtsi
+++ b/arch/arm/boot/dts/qcom-sdx55.dtsi
@@ -206,6 +206,25 @@ pdc: interrupt-controller@b210000 {
 			interrupt-controller;
 		};
 
+		spmi_bus: qcom,spmi@c440000 {
+			compatible = "qcom,spmi-pmic-arb";
+			reg = <0x0c440000 0x0000d00>,
+			      <0x0c600000 0x2000000>,
+			      <0x0e600000 0x0100000>,
+			      <0x0e700000 0x00a0000>,
+			      <0x0c40a000 0x0000700>;
+			reg-names = "core", "chnls", "obsrvr", "intr", "cnfg";
+			interrupt-names = "periph_irq";
+			interrupts = <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
+			qcom,ee = <0>;
+			qcom,channel = <0>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+			interrupt-controller;
+			#interrupt-cells = <4>;
+			cell-index = <0>;
+		};
+
 		tlmm: pinctrl@f100000 {
 			compatible = "qcom,sdx55-pinctrl";
 			reg = <0xf100000 0x300000>;
-- 
2.25.1

