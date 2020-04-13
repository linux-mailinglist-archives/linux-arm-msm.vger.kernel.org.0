Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 569291A6AC9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2020 19:01:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732300AbgDMRB3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Apr 2020 13:01:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1732295AbgDMRB2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Apr 2020 13:01:28 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7241BC008769
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2020 10:01:26 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id c195so10518495wme.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2020 10:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JkyvlKP4pHrJ8AdiuVHbCpIXULnDIYo0wPYklEdrEI0=;
        b=FxHHTce6kUJpnTuVqBEebcyuVduLLI3MDxCnmXLzQvF9W3QrB7+QIxbokfNCr7pLCs
         wrVSaK4KajytYNVxvM1R9kGh4X3+Csq+BtIsmZSauaoYn10y4aE+jS7aUyWmcXN5aB7R
         0y+EDhH8klxRKA1Xa4V48yr2cTSD4ApiPj/p2MFKFoP5ysqHJDi3LDsOmVm5q3dtVUH+
         pbwr9mrv8VEvahdHePsPeO9KF1214yZI22kRz+PTHX+PKRdxkyN3XQcmISb9pFErsEAR
         Ro5vrVW9MJlBzCbsZruCvN1COWWiYI6FXKBlEZyt1ePyq5TzJu5ZL/D64x7xzhEd0V5M
         w5Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JkyvlKP4pHrJ8AdiuVHbCpIXULnDIYo0wPYklEdrEI0=;
        b=aufR+zlJZ/gRglaTxTG+K/9i7Va8cANDY+4vybltyTkxrCWdpws8CV9T5I2E5982h/
         AI6qGu2wBU5WaJy0mU4bZ2tTP8V1H7HK/R/3rTP2QY6gf+dxQjmoYFAhb8BBuE8puLr1
         +d3ag+LjOPQPuCZaFzH+Yfm9ZrE6RXSiB7kMkrE+AhFLR3FyKD1n3nYmiHDCcgGiMnxR
         vQdIyq0mGy48BuvPB6AGDzTX0016Aag4X50tUsBu2ADfjc8krJ4m+8zh2UB08cAEQmbo
         z2+x2l3IRWHyL4IwdUHPzmLAOxTfj+Pk2pKjpdKvuxC/F99f3T90I014v2lb4vFtcBvt
         R0Tw==
X-Gm-Message-State: AGi0PuaTM9EMSIBqFlnKA/G5yLWG3EY8i06lSusMgCvslA/fIwBvqsqZ
        ZE1Uw8h9eXT15fTddYCSQ07wiA==
X-Google-Smtp-Source: APiQypJO8z0SusDHMvM2B2HYR3lG5GDTJa102Xjb6xK/nW9B/iuDf2ZoA7bxlxWdOqWiHzKXzwXxBQ==
X-Received: by 2002:a05:600c:2c04:: with SMTP id q4mr18746719wmg.7.1586797285096;
        Mon, 13 Apr 2020 10:01:25 -0700 (PDT)
Received: from localhost.localdomain ([2001:470:1f1b:192:29fe:7bf:41fe:904d])
        by smtp.googlemail.com with ESMTPSA id q187sm15443268wma.41.2020.04.13.10.01.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2020 10:01:24 -0700 (PDT)
From:   Robert Marko <robert.marko@sartura.hr>
To:     andrew@lunn.ch, f.fainelli@gmail.com, hkallweit1@gmail.com,
        linux@armlinux.org.uk, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org,
        mark.rutland@arm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     Robert Marko <robert.marko@sartura.hr>,
        Christian Lamparter <chunkeey@gmail.com>,
        Luka Perkov <luka.perkov@sartura.hr>
Subject: [PATCH 3/3] dts: ipq4019: add MDIO node
Date:   Mon, 13 Apr 2020 19:01:07 +0200
Message-Id: <20200413170107.246509-3-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200413170107.246509-1-robert.marko@sartura.hr>
References: <20200413170107.246509-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch adds the necessary MDIO interface node
to the Qualcomm IPQ4019 DTSI.

Built-in QCA8337N switch is managed using it,
and since we have a driver for it lets add it.

Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Cc: Luka Perkov <luka.perkov@sartura.hr>
---
 arch/arm/boot/dts/qcom-ipq4019.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-ipq4019.dtsi b/arch/arm/boot/dts/qcom-ipq4019.dtsi
index b4803a428340..80d0a69e9fed 100644
--- a/arch/arm/boot/dts/qcom-ipq4019.dtsi
+++ b/arch/arm/boot/dts/qcom-ipq4019.dtsi
@@ -578,6 +578,34 @@ wifi1: wifi@a800000 {
 			status = "disabled";
 		};
 
+		mdio: mdio@90000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "qcom,ipq40xx-mdio";
+			reg = <0x90000 0x64>;
+			status = "disabled";
+
+			ethphy0: ethernet-phy@0 {
+				reg = <0>;
+			};
+
+			ethphy1: ethernet-phy@1 {
+				reg = <1>;
+			};
+
+			ethphy2: ethernet-phy@2 {
+				reg = <2>;
+			};
+
+			ethphy3: ethernet-phy@3 {
+				reg = <3>;
+			};
+
+			ethphy4: ethernet-phy@4 {
+				reg = <4>;
+			};
+		};
+
 		usb3_ss_phy: ssphy@9a000 {
 			compatible = "qcom,usb-ss-ipq4019-phy";
 			#phy-cells = <0>;
-- 
2.26.0

