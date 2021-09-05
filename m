Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2F624010F7
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Sep 2021 18:58:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238092AbhIEQ72 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 5 Sep 2021 12:59:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231804AbhIEQ72 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 5 Sep 2021 12:59:28 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5540C061575;
        Sun,  5 Sep 2021 09:58:24 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id t19so8370862ejr.8;
        Sun, 05 Sep 2021 09:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kZ3/8isN7aB5wQkkG7Kcq2wcJN33Wyg4fWu0p0VvB7I=;
        b=JlSC2leaYdOQpkN3ZHceJCTOYRVYSZ6mWBNriXHhfp7ykXw/LD8+p7cQLU44xXJ2Z7
         RK0Tk+ndRhkqU3VRcd6k5F+igc885IPnEmo8DXRZk2VDd2VsS682oroDS84bx8WKqdPb
         cUwPjU3ghyzpxCONyCPG0YstXozDv5HFAbvjCwqdRQZ8ZuxYCV1p4LTL3+QLfgIvNDBP
         koAYRzgvoHI9dULpyilXqCBtCvX/yuYf0xS8Or+ifK69/mXC+hEH0ds9961t42rZUFKx
         qHBl1OCzYAwR8azYOb8xwqs5qxf4/Rctx5P1G99fS+uahwurmdj1zisZ5vReXExOnGcU
         HDcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kZ3/8isN7aB5wQkkG7Kcq2wcJN33Wyg4fWu0p0VvB7I=;
        b=W+Jophq+IKpVQKNveyh9LPyXXMvGmM8DV9SFSpZjS8K8j3AinHgOCu9NWdmNVSXmBK
         UkfrzvUW2xu8DBPp0ysAtx1pU/r/hB+O5zF3Z9wG801q17XeaUapvs0YnR8MaR54nZve
         kMZbDfT4lh+qnCuYKlaEHuxIOgCYODutsjFmWNgY6ZwnyF2DCkSZw1Ujpf8z4PZ8aBVd
         T8Vfs3Wsf7gYSLXCVr01eJieY8fFsZjVPf1jGTdg7H8LzATJo5LJFONdpOy9t/qwm00e
         1y20mL8ra6+iU1NP1tKNp7L4vGoOUBMZmaNRn1SbBJO2dQmdQkSvxlKmDwhp/QU4iqMF
         0gfQ==
X-Gm-Message-State: AOAM530wJWh+dHkZ5dIouFpbvDFmZUKHilV+mUNzYxbpUWKo5zoORwUw
        I0WfNnB76kIpgy/j2f8TgMOjMd9NC0E5sw==
X-Google-Smtp-Source: ABdhPJywPHMKWuiiH9GLjB/zOTnT72qVIApNdSCjEmloLJ+NHnP8/Sq5QdSbJ2sf5S/EuR0i/87Hgw==
X-Received: by 2002:a17:906:3148:: with SMTP id e8mr9421310eje.240.1630861103212;
        Sun, 05 Sep 2021 09:58:23 -0700 (PDT)
Received: from fedora.. (dh207-97-6.xnet.hr. [88.207.97.6])
        by smtp.googlemail.com with ESMTPSA id t1sm3122920edq.31.2021.09.05.09.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Sep 2021 09:58:22 -0700 (PDT)
From:   Robert Marko <robimarko@gmail.com>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Robert Marko <robimarko@gmail.com>
Subject: [PATCH] arm64: dts: qcom: ipq8074: add SPMI bus
Date:   Sun,  5 Sep 2021 18:58:16 +0200
Message-Id: <20210905165816.655275-1-robimarko@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

IPQ8074 uses SPMI for communication with the PMIC, so
since its already supported add the DT node for it.

Signed-off-by: Robert Marko <robimarko@gmail.com>
---
 arch/arm64/boot/dts/qcom/ipq8074.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq8074.dtsi b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
index ab124dc7538c..dafbde4ba5d5 100644
--- a/arch/arm64/boot/dts/qcom/ipq8074.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
@@ -321,6 +321,25 @@ tcsr_mutex_regs: syscon@1905000 {
 			reg = <0x01905000 0x8000>;
 		};
 
+		spmi_bus: spmi@200f000 {
+			compatible = "qcom,spmi-pmic-arb";
+			reg = <0x0200f000 0x001000>,
+			      <0x02400000 0x800000>,
+			      <0x02c00000 0x800000>,
+			      <0x03800000 0x200000>,
+			      <0x0200a000 0x000700>;
+			reg-names = "core", "chnls", "obsrvr", "intr", "cnfg";
+			interrupts = <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "periph_irq";
+			qcom,ee = <0>;
+			qcom,channel = <0>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+			interrupt-controller;
+			#interrupt-cells = <4>;
+			cell-index = <0>;
+		};
+
 		sdhc_1: sdhci@7824900 {
 			compatible = "qcom,sdhci-msm-v4";
 			reg = <0x7824900 0x500>, <0x7824000 0x800>;
-- 
2.31.1

