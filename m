Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 637CD12757C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2019 07:03:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727201AbfLTGDj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Dec 2019 01:03:39 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:33455 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727198AbfLTGDj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Dec 2019 01:03:39 -0500
Received: by mail-pg1-f195.google.com with SMTP id 6so4406645pgk.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2019 22:03:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BJiMDheEc4Dz3SCcZDWv2TjUR9XTPMA9tJa+wASKwh4=;
        b=sZ9tz0G8P50ktiBWQhBbmVsag2N/7gsuH3ZT/yz8TCooHKqs6eYpCEEPCQy90hKzCY
         OMVYtEYSsKVxXYgsV0Ef/J3L/O4MTAJwPewN9BBKoQ8NypC09VDdOTSNVrbAgib5cjNg
         tFBljfoPPhV3/bvu+0P4Bl+w+UoDY63+rDaPjqWVYmNFcyoJElSQjcPuyQntz68ybOYl
         2AWHZDa1xc5TdeVE6U7Tdicv1oj41Gcj/tBv2U2bttv5KQGxyrBNZzudybJXycxRQw4U
         VbhaSilaxKZZTO7/e+11dNOyr/Imnri3Qh1zruXEqniyCiC7Dqg9ChnNJ6pKU5Ixp9qz
         ldZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BJiMDheEc4Dz3SCcZDWv2TjUR9XTPMA9tJa+wASKwh4=;
        b=Kn69imbOePBYbi4fhwpvnbBAT0PkGzIGp48yBwL8Us8og112sjBj/CPWKDR+k8oFZQ
         T3MRnsPDZS31RwraO/xeUZdIBmO2719JjA+HNmH8U2/sHC1W8dBT1UB7b5zeT6tWdJMd
         TpP3pCsUpn8GMPMgyDoucvMAKQ43o2IQ4B10T7K99UuSxN3bDY09bn8QenrF+8RCdZpS
         NzYV/Of699nFwn7erqprKYt1VDJeWH0ZaaYrpKiDwSyrkNO/OZVrpO0lKkFXW4Rf9N25
         xKkznPHEAqYCXkQ1BL12ZBbSxakKeSupR6hjbHA4NU9o1yYLxx1vmlIQQAts9tcjTCMa
         so1w==
X-Gm-Message-State: APjAAAWjnmlsivMJjAL7VZY/cfyuubXirqeWSfaZgIl0P0eBGG4gecQv
        XeX2yk+6hyP340t7wm7mv56c4g==
X-Google-Smtp-Source: APXvYqw43t5sI6xNXehAhi/tVfRpA0qQfBdsV+7R8+zdX08NvO7qcx0/6jalWLh6phHMfVSFk3NCDw==
X-Received: by 2002:a63:e14b:: with SMTP id h11mr12661045pgk.297.1576821817879;
        Thu, 19 Dec 2019 22:03:37 -0800 (PST)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id l15sm8835710pjl.24.2019.12.19.22.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2019 22:03:37 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v2 2/2] arm64: dts: qcom: msm8996: Use generic QMP driver for UFS
Date:   Thu, 19 Dec 2019 22:03:04 -0800
Message-Id: <20191220060304.1867795-3-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191220060304.1867795-1-bjorn.andersson@linaro.org>
References: <20191220060304.1867795-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

With support for the MSM8996 UFS PHY added to the common QMP driver,
migrate the DTS to use the common QMP binding.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- None

 arch/arm64/boot/dts/qcom/msm8996.dtsi | 33 +++++++++++++++------------
 1 file changed, 18 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index b302d2451007..330a1e7cb7d8 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -1323,27 +1323,30 @@ spmi_bus: qcom,spmi@400f000 {
 			#interrupt-cells = <4>;
 		};
 
-		ufsphy: phy@627000 {
-			compatible = "qcom,msm8996-ufs-phy-qmp-14nm";
-			reg = <0x627000 0xda8>;
-			reg-names = "phy_mem";
-			#phy-cells = <0>;
+		ufs_phy: phy@627000 {
+			compatible = "qcom,msm8996-qmp-ufs-phy";
+			reg = <0x00627000 0x1c4>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
 
 			vdda-phy-supply = <&pm8994_l28>;
 			vdda-pll-supply = <&pm8994_l12>;
-
-			vdda-phy-max-microamp = <18380>;
-			vdda-pll-max-microamp = <9440>;
-
 			vddp-ref-clk-supply = <&pm8994_l25>;
-			vddp-ref-clk-max-microamp = <100>;
-			vddp-ref-clk-always-on;
 
-			clock-names = "ref_clk_src", "ref_clk";
-			clocks = <&rpmcc RPM_SMD_LN_BB_CLK>,
-				 <&gcc GCC_UFS_CLKREF_CLK>;
+			clocks = <&gcc GCC_UFS_CLKREF_CLK>;
+			clock-names = "ref";
+
 			resets = <&ufshc 0>;
+			reset-names = "ufsphy";
 			status = "disabled";
+
+			ufs_phy_lane: lanes@627400 {
+				reg = <0x627400 0x12c>,
+				      <0x627600 0x200>,
+				      <0x627c00 0x1b4>;
+				#phy-cells = <0>;
+			};
 		};
 
 		ufshc: ufshc@624000 {
@@ -1351,7 +1354,7 @@ ufshc: ufshc@624000 {
 			reg = <0x624000 0x2500>;
 			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
 
-			phys = <&ufsphy>;
+			phys = <&ufs_phy_lane>;
 			phy-names = "ufsphy";
 
 			vcc-supply = <&pm8994_l20>;
-- 
2.24.0

