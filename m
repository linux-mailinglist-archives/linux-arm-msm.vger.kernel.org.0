Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC25D1AD6F1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2020 09:07:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728284AbgDQHHh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Apr 2020 03:07:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728171AbgDQHHh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Apr 2020 03:07:37 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B8EFC061A0F
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2020 00:07:37 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id 188so658694pgj.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2020 00:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qhJfbUeC4EGPGMNCAc6hIWc34vSeMK8YZ5XesZD7QMw=;
        b=IBpsataWih4UMa/MPpIuCFZ3NwCO/Q2WO3CEezpUx97vUFHwJ054IMLqL2b9OZ/LIq
         EdsvVy7PwTglM+wESZZrycP2i1pSajs9i1p+F+bkHHj2CntpuATfQ/nZHlI7naLVO2UZ
         DjYFUfk2OMH6xC41SzORrJzmp2BHjh+jWrLEP9IKhkpDLOQ5zWIKiE4FdAuhipwv5ewC
         cdevZNUGT6teQjxXdPeU6wdBRODD+2mgm+LIllVQY9us2iymVXrnqyxyanOtbnz66QYU
         qynFqOAmhQ3Z2SPXckHLP6e/z3eocGRzcXS255R8HUQ9MB/6fwDRpWJ9IHLS5YWWbRF7
         hBVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qhJfbUeC4EGPGMNCAc6hIWc34vSeMK8YZ5XesZD7QMw=;
        b=VOOM6oEI5AARgC01dN6zkau5kgFUe5c4Ijxg8IZbjaEnOzEOrVIGOgYkvdknNL0dkI
         gcuPSeK9ipBr113TtyVBFfkuxBpnMP/sQO8lz4s77VVkp4/6ew7zVZCSCDuiuPud0fuk
         vRvh32CQUbuHDMfMkDUiKkyUeZGuA7TDjgF56o7Yu6UCvqaWmSaaLOz+BA+MALLDuuru
         OKVXKMoGJfncLjURmowo++fVOBJJnL8xiRxRKlY9FZGHWDtB3mkqJnP0KuKvXiXSUOzA
         /LhDody57aWi8ysvH73HYowsMqgHkx/oJT48c5CNNdthJo5PsvuQq6m947Ku/mC7vxbC
         py6Q==
X-Gm-Message-State: AGi0PuZQjvxijG6YvkKKBiQK1IoLnE7mUTF6mPy2zUz3JaigsUgGXRPh
        X0vTED3sNNV5fHi9ElG5sW8UgiBBu1o=
X-Google-Smtp-Source: APiQypIwSAgtT5e9WT2GkKvkvSvFvRObHW2xLgNFhJuVFfaeaEpAdmKJY5FzP4LkWWJp01oSfRLm9g==
X-Received: by 2002:a62:7a82:: with SMTP id v124mr1737521pfc.10.1587107256540;
        Fri, 17 Apr 2020 00:07:36 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id f15sm18614987pfd.215.2020.04.17.00.07.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2020 00:07:35 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: db820c: Fix invalid pm8994 supplies
Date:   Fri, 17 Apr 2020 00:07:12 -0700
Message-Id: <20200417070712.1376355-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

It's uncertain where the "vreg_s8a_l3a_input" comes from, but the supply
for VDD_L3_L11 on PM8994 should be VREG_S3A_1P3, so correct this - and
drop the vreg_s8a_l3a_input.

Fixes: 83d9ed4342a3 ("arm64: dts: qcom: db820c: Use regulator names from schematics")
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi b/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
index 1baf41fbdf6e..46595fb95cce 100644
--- a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
+++ b/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
@@ -117,16 +117,6 @@ vph_pwr: vph-pwr-regulator {
 		regulator-max-microvolt = <3700000>;
 	};
 
-	vreg_s8a_l3a_input: vreg-s8a-l3a-input {
-		compatible = "regulator-fixed";
-		regulator-name = "vreg_s8a_l3a_input";
-		regulator-always-on;
-		regulator-boot-on;
-
-		regulator-min-microvolt = <0>;
-		regulator-max-microvolt = <0>;
-	};
-
 	wlan_en: wlan-en-1-8v {
 		pinctrl-names = "default";
 		pinctrl-0 = <&wlan_en_gpios>;
@@ -720,7 +710,7 @@ pm8994-regulators {
 		vdd_s12-supply = <&vph_pwr>;
 		vdd_l1-supply = <&vreg_s1b_1p025>;
 		vdd_l2_l26_l28-supply = <&vreg_s3a_1p3>;
-		vdd_l3_l11-supply = <&vreg_s8a_l3a_input>;
+		vdd_l3_l11-supply = <&vreg_s3a_1p3>;
 		vdd_l4_l27_l31-supply = <&vreg_s3a_1p3>;
 		vdd_l5_l7-supply = <&vreg_s5a_2p15>;
 		vdd_l6_l12_l32-supply = <&vreg_s5a_2p15>;
@@ -731,7 +721,7 @@ pm8994-regulators {
 		vdd_l17_l29-supply = <&vph_pwr_bbyp>;
 		vdd_l20_l21-supply = <&vph_pwr_bbyp>;
 		vdd_l25-supply = <&vreg_s3a_1p3>;
-		vdd_lvs1_2-supply = <&vreg_s4a_1p8>;
+		vdd_lvs1_lvs2-supply = <&vreg_s4a_1p8>;
 
 		vreg_s3a_1p3: s3 {
 			regulator-name = "vreg_s3a_1p3";
-- 
2.24.0

