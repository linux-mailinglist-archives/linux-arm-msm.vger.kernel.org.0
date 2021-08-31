Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF6FA3FC21B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Aug 2021 07:23:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234011AbhHaFY3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 31 Aug 2021 01:24:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229526AbhHaFY3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 31 Aug 2021 01:24:29 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8025BC061575
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Aug 2021 22:23:34 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id r13so13623861pff.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Aug 2021 22:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=29TOratnK2xJst8mXbq92wXeuQ1QgEl/NV9J//FjPgY=;
        b=BfQ3rpDoYSzs79d9Fu3Wt+Vr9SRnp+yY4N3phwgs/YfDy9OHipi7ogcsvB8koD+Xt5
         G3WSyeNcw6WlTOsIFUPbcPcoXWrKZWcpSjXiSSEu8+uVJedjfbo7Vv8Pvh+a2v8pghlk
         Gi1Ub0o3Ia88h3i+MzdV2MeS3YQkYLIdkYFT8MzNaJSlJeMvfXIekNT75zBQ5egFbGch
         Af3jVbYvum/RvZ7ZMIlG+I86ombN2B9RGT9YZAPrEj6brhg7a/3wVWjFZRUGZERW+EYg
         sH2DKz8abj2BqXgNnGae569Rxwc3poCE10VEmiq+ZW84LGcGX25l/aA8fRerp94a8Zm3
         glEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=29TOratnK2xJst8mXbq92wXeuQ1QgEl/NV9J//FjPgY=;
        b=QlQjBpV2Fgxw6yaafTmcIREwhg0y143eEj3GwOEZhOJ4w4lzO8IOI2KX22iQzywMH1
         u4oq6kb6VAt+IiEX32iGMgdjSC8Sp+wm7XgX1qoxZjG64TCJR681TAs3pZfktT7SB3i0
         yTOpdNvVIkHanuJxUyqGvQqkG77nUuTOiB2+WY88mZb9JcArTWVc8QQMIh7jZ6QRcv7C
         lX+yQ3pe1nMlue7cRFoN0QKlPnXBVLAv16+bfzc2u8cbPoTTy9/zdyCx2/ASdqinBjar
         44PbKfzZVvMnjRMWNGyZT9Zfh7Rxkab45FuRHOLQjNqbpUekU0/A2lKL3njX6P+9sah/
         SXew==
X-Gm-Message-State: AOAM530QvIlHb11CfJ4lIFVHFzcXkndUTpL1/TPdVDs0SPrhICNJqf9J
        cZJ/JGfpWAPQ8j/tb+KdMnCZp2wN6xXqHw==
X-Google-Smtp-Source: ABdhPJxZjh6QIbhyJFWmER4NiG9H6sSUfkt4migc4q89klJmPEqfuSx6CvmgdOYanvnSxGuZlxqBpQ==
X-Received: by 2002:a05:6a00:139c:b0:3fd:e818:edc8 with SMTP id t28-20020a056a00139c00b003fde818edc8mr10767317pfg.39.1630387413970;
        Mon, 30 Aug 2021 22:23:33 -0700 (PDT)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id w18sm1293962pjg.50.2021.08.30.22.23.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Aug 2021 22:23:33 -0700 (PDT)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH] arm64: dts: qcom: Update BAM DMA node name per DT schema
Date:   Tue, 31 Aug 2021 13:23:25 +0800
Message-Id: <20210831052325.21229-1-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Follow dma-controller.yaml schema to use `dma-controller` as node name
of BAM DMA devices.

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 arch/arm64/boot/dts/qcom/ipq8074.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 4 ++--
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/sdm845.dtsi  | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq8074.dtsi b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
index 2843bcbce778..2d3860337098 100644
--- a/arch/arm64/boot/dts/qcom/ipq8074.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
@@ -212,7 +212,7 @@
 			status = "disabled";
 		};
 
-		cryptobam: dma@704000 {
+		cryptobam: dma-controller@704000 {
 			compatible = "qcom,bam-v1.7.0";
 			reg = <0x00704000 0x20000>;
 			interrupts = <GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH>;
diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 52df22ab3f6a..390468e1b62e 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -2686,7 +2686,7 @@
 			status = "disabled";
 		 };
 
-		blsp1_dma: dma@7544000 {
+		blsp1_dma: dma-controller@7544000 {
 			compatible = "qcom,bam-v1.7.0";
 			reg = <0x07544000 0x2b000>;
 			interrupts = <GIC_SPI 238 IRQ_TYPE_LEVEL_HIGH>;
@@ -2743,7 +2743,7 @@
 			status = "disabled";
 		};
 
-		blsp2_dma: dma@7584000 {
+		blsp2_dma: dma-controller@7584000 {
 			compatible = "qcom,bam-v1.7.0";
 			reg = <0x07584000 0x2b000>;
 			interrupts = <GIC_SPI 239 IRQ_TYPE_LEVEL_HIGH>;
diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index 34039b5c8017..a46838f1e310 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -2187,7 +2187,7 @@
 			#size-cells = <0>;
 		};
 
-		blsp2_dma: dma@c184000 {
+		blsp2_dma: dma-controller@c184000 {
 			compatible = "qcom,bam-v1.7.0";
 			reg = <0x0c184000 0x25000>;
 			interrupts = <GIC_SPI 239 IRQ_TYPE_LEVEL_HIGH>;
diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 99e023314ae4..0b7cf0c7c22c 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -2307,7 +2307,7 @@
 			};
 		};
 
-		cryptobam: dma@1dc4000 {
+		cryptobam: dma-controller@1dc4000 {
 			compatible = "qcom,bam-v1.7.0";
 			reg = <0 0x01dc4000 0 0x24000>;
 			interrupts = <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.17.1

