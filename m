Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04ACF21D33C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2020 11:55:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729318AbgGMJzU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Jul 2020 05:55:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727834AbgGMJzT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Jul 2020 05:55:19 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AFA5C061794
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2020 02:55:19 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id d18so12787826edv.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2020 02:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EX/IMErDoxcFcjxLjU7HkV8aJIJA8/hNtsxtvwLEDVQ=;
        b=2BqzUBw7/Z8AjkdfPds8NRm7bDSUM3XsIrf08G4cqiKfWpoCwH1NTL+R5QErw9RMJD
         ruOOmIvhK2azCGi9uTui4vnRgEUtp0bpkPnHMDU11Vkn3wOmHcqW2EV9SaqkOxHV5Fca
         NUWASbM2f6hrjIsVsCk2LOEX1AFlHFS0IQAtONNEn4HJRA0HgBsb+AyCyOH7FVVpoy29
         /h+oPi34xmqCcwXn6mGQunDQDpNDNsV+FVWlBZ8WBwCJ5Bfk0ZwD7tLlXopNogGdJscE
         x5hhD9Q7+FTkS8/x09olpK0PddGcpPQU8Pxzn8gjOKjZB2ssoHAQq8jHqyOjTj2+8lFz
         eGmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EX/IMErDoxcFcjxLjU7HkV8aJIJA8/hNtsxtvwLEDVQ=;
        b=VNMoqR7ss8aFh7PNG7hvsP4qcfga1VYSPg5THP+8ehgQqETcK5E8tu4pTL78w3G3ff
         1wbOEXIY6J8j2Uayf+qspz+5mE3xpo+bd99gJ7ERVppqUZgvZVkLLfv7QvDyerO6KiXw
         slm2VMOk1PBWFU7ccb1fuaAStHn9LIxVy/JTTPm0EBtDV3Jd3FPbZtxZtBeoAXA2H435
         S4xEMDX/qfIp1JMV2uQ8KYKabPgSjb4zY2FvWcjLqgPccVTiDGdyu4VY069ysCPFMGyk
         lN+/kRWA9MWUrYryOpwGwGMVgroMpPOpNfSVUmMnaGYYv2V9GezGPmYRcAwv69RbYEub
         Hikw==
X-Gm-Message-State: AOAM530L71HPVNSLmEo4ULOW20FH/9g0HUgJb+qelScuOzsMpvvyYOt7
        byXmzzQ0ykh7dOF9p3YTLB6Dxg==
X-Google-Smtp-Source: ABdhPJxc6tyvTQYd53XE6resgy8+ALS+JG8waXk5fYpksiyCZf1PTru3ENaDbBHsQP/quKbsa2MCMQ==
X-Received: by 2002:a05:6402:1494:: with SMTP id e20mr77492854edv.2.1594634117908;
        Mon, 13 Jul 2020 02:55:17 -0700 (PDT)
Received: from localhost.localdomain (dh207-98-45.xnet.hr. [88.207.98.45])
        by smtp.googlemail.com with ESMTPSA id w24sm10957046edt.28.2020.07.13.02.55.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 02:55:17 -0700 (PDT)
From:   Robert Marko <robert.marko@sartura.hr>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH] arm64: dts: ipq6018: Add NAND nodes
Date:   Mon, 13 Jul 2020 11:55:08 +0200
Message-Id: <20200713095508.512919-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

IPQ6018 uses the same NAND and controller as IPQ8074 which
is supported by the Qualcomm NANDC driver.
So lets add the NAND node as well as node for the BAM DMA
controller that is supported by the BAM DMA driver.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 arch/arm64/boot/dts/qcom/ipq6018.dtsi | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
index 1aa8d8579463..bd4a1317c4c6 100644
--- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
@@ -274,6 +274,33 @@ i2c_1: i2c@78b7000 { /* BLSP1 QUP2 */
 			status = "disabled";
 		};
 
+		qpic_bam: dma@7984000{
+			compatible = "qcom,bam-v1.7.0";
+			reg = <0x7984000 0x1a000>;
+			interrupts = <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_QPIC_AHB_CLK>;
+			clock-names = "bam_clk";
+			#dma-cells = <1>;
+			qcom,ee = <0>;
+			status = "disabled";
+		};
+
+		nand: qpic-nand@79b0000 {
+			compatible = "qcom,ipq8074-nand";
+			reg = <0x79b0000 0x10000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&gcc GCC_QPIC_CLK>,
+					 <&gcc GCC_QPIC_AHB_CLK>;
+			clock-names = "core", "aon";
+
+			dmas = <&qpic_bam 0>,
+			       <&qpic_bam 1>,
+			       <&qpic_bam 2>;
+			dma-names = "tx", "rx", "cmd";
+			status = "disabled";
+		};
+
 		intc: interrupt-controller@b000000 {
 			compatible = "qcom,msm-qgic2";
 			interrupt-controller;
-- 
2.26.2

