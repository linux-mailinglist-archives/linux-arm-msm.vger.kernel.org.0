Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B27643B4A66
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Jun 2021 00:03:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229978AbhFYWFz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Jun 2021 18:05:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230003AbhFYWFy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Jun 2021 18:05:54 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E398C061767
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jun 2021 15:03:29 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id a127so8504975pfa.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jun 2021 15:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=prINlRYKbu6XDrHyKyHoo1qSGCIglO6qKAztYX5cZo8=;
        b=xWYLw2khe8It1X9JVjVczrT6j1lvc6UnQfSriGM7pNd7BLvSkliyqGOCZWqN9KMcyp
         mRcmMhFK0NMZhQzJE60KmRV8NL5d0S3E4an+hK6VaGHSoRkfOBR7ICP+FDOKs3N16KWu
         aJ/J2Bk2jDgV+Gdpo3PkSP+rhmXgl/vb5VuhpeqVf4G7qZ3C3/8Ku6d+epb7Z3mQvb4t
         IrjUR4DIPQdC+4bTAYpMWsZvOeRBGpFwfZS9fcnQhsYwmwf8e8MOYjfteSpmy3x9QI10
         UVhQXRhnUapJO5Rby7U7nwT/Tw+k7cC39gydGp/QonQ4R/Cg4SW7b2HVaHY34QZoWN9d
         JpmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=prINlRYKbu6XDrHyKyHoo1qSGCIglO6qKAztYX5cZo8=;
        b=MK3ksw7aPTJhWKqOHqwrc7Cbr29CbFJ2aIX8yTBHjwBvzKyXnQzS4Juek8wz9xOo1P
         0uweFi0FykGBZ4nYLNF3lGBjw3PvP+MVItBuHZnViAW5TbXHikfX3yyYsOMqXW3JXPFB
         vTx9FPwsJxImWmJE/00B73uCcADQ5768Oo/2obeAv6WNxPYPandVN45khWc/KJGwAUqc
         CrOn+4IzihYJlRQ+tTbLtFJIZ67tcJGlCQitneOnXnv3k1BRhhd0eK96z5EinQanE+KO
         T3F4iPBFGCn1eehCs7q6bSBAE97jB5TviWniQMf55yUPLVi4ZMGt+3qofQY5RMjvD37w
         1iKg==
X-Gm-Message-State: AOAM532esPCbmKnyTtMjapEw/2NG8icniIqddHpmUtSXpIYliNxT1CVj
        9bm1Kn60crLn5rQJ7+vokiGmBCAJ+adRrA==
X-Google-Smtp-Source: ABdhPJxZO3k/nQXbhjX97GIBb6th8H2ZXhtM0Fh3aHIl12oh/+QEX7VYYDn6W+xd0rrqmBdKZwLDbg==
X-Received: by 2002:a63:5809:: with SMTP id m9mr7251692pgb.170.1624658608772;
        Fri, 25 Jun 2021 15:03:28 -0700 (PDT)
Received: from localhost.name ([122.177.20.255])
        by smtp.gmail.com with ESMTPSA id d9sm6374040pjx.13.2021.06.25.15.03.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jun 2021 15:03:28 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        balbi@kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org, agross@kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH 1/2] arm64: dts: qcom: Use consistent naming for dwc3 usb nodes for sm8150
Date:   Sat, 26 Jun 2021 03:33:10 +0530
Message-Id: <20210625220311.527549-2-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210625220311.527549-1-bhupesh.sharma@linaro.org>
References: <20210625220311.527549-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The dwc3 usb nodes in sm8150.dtsi are currently named differently,
leading to some confusion when one sees the entries in sysfs or
dmesg:
[    1.943482] dwc3 a600000.usb: Adding to iommu group 1
[    2.266127] dwc3 a800000.dwc3: Adding to iommu group 2

Name both the nodes as dwc3@<addr> for consistency.

While at it also arrange the two usb controller, hs-phy and
ss-phy nodes closer in the dts for better readability.

Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 30 ++++++++++++++--------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 612dda0fef43..3be6d093a99b 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -2205,6 +2205,20 @@ glink-edge {
 			};
 		};
 
+		dc_noc: interconnect@9160000 {
+			compatible = "qcom,sm8150-dc-noc";
+			reg = <0 0x09160000 0 0x3200>;
+			#interconnect-cells = <1>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+		};
+
+		gem_noc: interconnect@9680000 {
+			compatible = "qcom,sm8150-gem-noc";
+			reg = <0 0x09680000 0 0x3e200>;
+			#interconnect-cells = <1>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+		};
+
 		usb_1_hsphy: phy@88e2000 {
 			compatible = "qcom,sm8150-usb-hs-phy",
 				     "qcom,usb-snps-hs-7nm-phy";
@@ -2266,20 +2280,6 @@ usb_1_ssphy: lanes@88e9200 {
 			};
 		};
 
-		dc_noc: interconnect@9160000 {
-			compatible = "qcom,sm8150-dc-noc";
-			reg = <0 0x09160000 0 0x3200>;
-			#interconnect-cells = <1>;
-			qcom,bcm-voters = <&apps_bcm_voter>;
-		};
-
-		gem_noc: interconnect@9680000 {
-			compatible = "qcom,sm8150-gem-noc";
-			reg = <0 0x09680000 0 0x3e200>;
-			#interconnect-cells = <1>;
-			qcom,bcm-voters = <&apps_bcm_voter>;
-		};
-
 		usb_2_qmpphy: phy@88eb000 {
 			compatible = "qcom,sm8150-qmp-usb3-uni-phy";
 			reg = <0 0x088eb000 0 0x200>;
@@ -2344,7 +2344,7 @@ usb_1: usb@a6f8800 {
 
 			resets = <&gcc GCC_USB30_PRIM_BCR>;
 
-			usb_1_dwc3: usb@a600000 {
+			usb_1_dwc3: dwc3@a600000 {
 				compatible = "snps,dwc3";
 				reg = <0 0x0a600000 0 0xcd00>;
 				interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.31.1

