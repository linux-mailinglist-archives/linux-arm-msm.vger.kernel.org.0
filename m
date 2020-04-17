Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5B961AD6C9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2020 09:03:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728192AbgDQHD2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Apr 2020 03:03:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728098AbgDQHD1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Apr 2020 03:03:27 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DB16C061A10
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2020 00:03:27 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id k15so641360pfh.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2020 00:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=r1lo/KjYdlHW1B6KauS14pcMDOjbPoKhISw8ay5HipA=;
        b=AolHcYqWLKNq46i9aUR3OEvbQ/gxmiSHz8gYBNmNyxLY6vjoC72Mu8KnUESH7Mz1CW
         uirBVy7GdDtLxLUySl2pC0ZUieSsPGPRWmZsXY6UiY03lUY50pPytVNwcxo+LwjxDTty
         k2wYC/JS+xuzwfrycSM6E2eU+yASVtf2gJ2RVcdvI6z6W/Xu1aNxFuWo8ZRDIZ5ErL5k
         gB4h9pnHysvL/gKZheQKjbuQ125wm7lkh0HVIuANMTrB/u6A/RoXXJC6nr49R7acX6UZ
         8SqBGbQgPxKOiG6SO1t+GlG1N4tkKiUJwbB6iGT9MjFPgkRRZ9YSfN+EIRRMyGMSI+32
         j10Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=r1lo/KjYdlHW1B6KauS14pcMDOjbPoKhISw8ay5HipA=;
        b=rS8tLyky2lm7mwzwdl2sy1AoaSogx/SdRhCZTdcHgDFtfBX2AXYPgLe2qiHt/llZTm
         fCb4TibJOaBmKVprktIeOqQVKEd9qOHhJD8dfK7PJjOC0M9H7r6eMFUqtYPZ+uubd/71
         gxd5asNO/S2Tz1kzmosSv1a5HVwKzZwvzn7m8HGOYtxsRbdIGDxVRiPl1KJsZnaRgwVs
         YXI+BGsDBTBY2kerrB64WkPsZpx867HIW/wn0rMcbV5auEWeeuZFqkuL47lUlZyibmcu
         ldYJQ9hXjY1RQXQaxR2mfgdJaZOf4nxrmwCg9qwRGaSUd9cWmT6th6dxkrrqzX5y4v9m
         19wQ==
X-Gm-Message-State: AGi0Pub/9KZTIRrHdRX1nGJq8mmfkgqVmPOKJ+ahe7RptYYviXAZfhiP
        u3y3v5HtEhyi/FgCo5uKXIPYaQ==
X-Google-Smtp-Source: APiQypJG70+MFZ+kuIBOZ6lEaW7FlG5lH/m55Qa4Jzz/SSvZaWYde7OKUco7A1CqzdSYpxiS20aRcw==
X-Received: by 2002:a63:e60a:: with SMTP id g10mr1600021pgh.51.1587107007102;
        Fri, 17 Apr 2020 00:03:27 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id o99sm4683714pjo.8.2020.04.17.00.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2020 00:03:26 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: db820c: Add pmi8994 RPM regulators
Date:   Fri, 17 Apr 2020 00:03:03 -0700
Message-Id: <20200417070303.1376290-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The PMI8994 provides 3 SPMS regulators and one boost/bypass regulator.
Define s1 and the boot/bypass and update pm8994 to appropriately
describe the supply from PMI8994.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi | 26 ++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi b/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
index fc23b381c5e4..1baf41fbdf6e 100644
--- a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
+++ b/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
@@ -718,13 +718,18 @@ pm8994-regulators {
 		vdd_s10-supply = <&vph_pwr>;
 		vdd_s11-supply = <&vph_pwr>;
 		vdd_s12-supply = <&vph_pwr>;
+		vdd_l1-supply = <&vreg_s1b_1p025>;
 		vdd_l2_l26_l28-supply = <&vreg_s3a_1p3>;
 		vdd_l3_l11-supply = <&vreg_s8a_l3a_input>;
 		vdd_l4_l27_l31-supply = <&vreg_s3a_1p3>;
 		vdd_l5_l7-supply = <&vreg_s5a_2p15>;
 		vdd_l6_l12_l32-supply = <&vreg_s5a_2p15>;
 		vdd_l8_l16_l30-supply = <&vph_pwr>;
+		vdd_l9_l10_l18_l22-supply = <&vph_pwr_bbyp>;
+		vdd_l13_l19_l23_l24-supply = <&vph_pwr_bbyp>;
 		vdd_l14_l15-supply = <&vreg_s5a_2p15>;
+		vdd_l17_l29-supply = <&vph_pwr_bbyp>;
+		vdd_l20_l21-supply = <&vph_pwr_bbyp>;
 		vdd_l25-supply = <&vreg_s3a_1p3>;
 		vdd_lvs1_2-supply = <&vreg_s4a_1p8>;
 
@@ -909,6 +914,27 @@ vreg_lvs2a_1p8: lvs2 {
 			regulator-name = "vreg_lvs2a_1p8";
 		};
 	};
+
+	pmi8994-regulators {
+		compatible = "qcom,rpm-pmi8994-regulators";
+
+		vdd_s1-supply = <&vph_pwr>;
+		vdd_s2-supply = <&vph_pwr>;
+		vdd_s3-supply = <&vph_pwr>;
+		vdd_bst_byp-supply = <&vph_pwr>;
+
+		vph_pwr_bbyp: boost-bypass {
+			regulator-name = "vph_pwr_bbyp";
+			regulator-min-microvolt = <3300000>;
+			regulator-max-microvolt = <3300000>;
+		};
+
+		vreg_s1b_1p025: s1 {
+			regulator-name = "vreg_s1b_1p025";
+			regulator-min-microvolt = <1025000>;
+			regulator-max-microvolt = <1025000>;
+		};
+	};
 };
 
 &sdhc2 {
-- 
2.24.0

