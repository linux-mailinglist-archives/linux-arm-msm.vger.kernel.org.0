Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39B9226C930
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Sep 2020 21:04:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728363AbgIPTED (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Sep 2020 15:04:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727466AbgIPRrx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Sep 2020 13:47:53 -0400
Received: from mo6-p03-ob.smtp.rzone.de (mo6-p03-ob.smtp.rzone.de [IPv6:2a01:238:20a:202:5303::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40C39C061A10;
        Wed, 16 Sep 2020 04:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1600254268;
        s=strato-dkim-0002; d=gerhold.net;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=zk1JgRCfGN8d0WVKK0yFWGZXo6snBrcRKo+H1BWj0g0=;
        b=Z8sXD4e/9IrG0cR/8UdHcx/C8kHdCZr0rOT59UoEadsrNNHHkLMlPvtCfRbVxOPQle
        UOBD/wwAnfXJIQPiG1L2ZSxUuMEU9JwFKmtan08tMPlWYwchXPyC6ObEgyA4L6WNOafi
        E25fEDrHTaGt1cfYbsyHv6JiwZ294F7xPEabklI/9l2/acd8r2Zo3vrQ8d5CAfHGdWHi
        oukDc07XKsXqoliFFXUtr97kyOiQzGlYE4nsCiE+hXBasVCsImLtfNBi2mjAs8K/vFMd
        XEc6eDV3K2JqKRRolboIUDdI6Fiu/ldBFSPKM6UACk02BiA0VeFm880tcDNEI/jOCtZd
        ECnA==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB4W6Nahc="
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain
        by smtp.strato.de (RZmta 46.10.7 DYNA|AUTH)
        with ESMTPSA id g0b6c1w8GAftzlY
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Wed, 16 Sep 2020 12:41:55 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 10/10] arm64: dts: qcom: msm8916-pm8916: Stop using s1/l3 as regulators
Date:   Wed, 16 Sep 2020 12:41:35 +0200
Message-Id: <20200916104135.25085-11-stephan@gerhold.net>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200916104135.25085-1-stephan@gerhold.net>
References: <20200916104135.25085-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

s1 (VDDCX) and l3 (VDDMX) are now managed by rpmpd as power domains.
This allows us to vote for voltage corners instead of voting for raw
voltages. But we cannot manage these as regulator and power domain at
the same time: The votes by rpmpd would conflict with the ones from
the regulator driver.

All users of these regulators have been converted to power domains.
Make sure that no new users are added by removing s1 and l3 from
the regulator definitions.

This also allows us to remove the arbitrary voltage constraints
we have been using for these regulators. Not all of the voltages
listed there would actually have been safe for the boards.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi              | 10 ----------
 arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts   | 10 ----------
 arch/arm64/boot/dts/qcom/msm8916-pm8916.dtsi           |  4 ++--
 .../boot/dts/qcom/msm8916-samsung-a2015-common.dtsi    | 10 ----------
 4 files changed, 2 insertions(+), 32 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
index 3c7f97539390..3a9538e1ec97 100644
--- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
+++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
@@ -417,11 +417,6 @@ &smd_rpm_regulators {
 	vdd_l4_l5_l6-supply = <&pm8916_s4>;
 	vdd_l7-supply = <&pm8916_s4>;
 
-	s1 {
-		regulator-min-microvolt = <375000>;
-		regulator-max-microvolt = <1562000>;
-	};
-
 	s3 {
 		regulator-min-microvolt = <375000>;
 		regulator-max-microvolt = <1562000>;
@@ -445,11 +440,6 @@ l2 {
 		regulator-max-microvolt = <1200000>;
 	};
 
-	l3 {
-		regulator-min-microvolt = <375000>;
-		regulator-max-microvolt = <1525000>;
-	};
-
 	l4 {
 		regulator-min-microvolt = <1750000>;
 		regulator-max-microvolt = <3337000>;
diff --git a/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts b/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts
index b9d3c5d98dd0..2c204d535d66 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts
@@ -98,11 +98,6 @@ &smd_rpm_regulators {
 	vdd_l4_l5_l6-supply = <&pm8916_s4>;
 	vdd_l7-supply = <&pm8916_s4>;
 
-	s1 {
-		regulator-min-microvolt = <500000>;
-		regulator-max-microvolt = <1300000>;
-	};
-
 	s3 {
 		regulator-min-microvolt = <1200000>;
 		regulator-max-microvolt = <1300000>;
@@ -123,11 +118,6 @@ l2 {
 		regulator-max-microvolt = <1200000>;
 	};
 
-	l3 {
-		regulator-min-microvolt = <500000>;
-		regulator-max-microvolt = <1287500>;
-	};
-
 	l4 {
 		regulator-min-microvolt = <2050000>;
 		regulator-max-microvolt = <2050000>;
diff --git a/arch/arm64/boot/dts/qcom/msm8916-pm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916-pm8916.dtsi
index 513e433aa5f3..539823b2c36e 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-pm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916-pm8916.dtsi
@@ -50,13 +50,13 @@ &rpm_requests {
 	smd_rpm_regulators: pm8916-regulators {
 		compatible = "qcom,rpm-pm8916-regulators";
 
-		pm8916_s1: s1 {};
+		/* pm8916_s1 is managed by rpmpd (MSM8916_VDDCX) */
 		pm8916_s3: s3 {};
 		pm8916_s4: s4 {};
 
 		pm8916_l1: l1 {};
 		pm8916_l2: l2 {};
-		pm8916_l3: l3 {};
+		/* pm8916_l3 is managed by rpmpd (MSM8916_VDDMX) */
 		pm8916_l4: l4 {};
 		pm8916_l5: l5 {};
 		pm8916_l6: l6 {};
diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi b/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi
index b18d21e42f59..0b0dfd3059de 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi
@@ -164,11 +164,6 @@ &smd_rpm_regulators {
 	vdd_l4_l5_l6-supply = <&pm8916_s4>;
 	vdd_l7-supply = <&pm8916_s4>;
 
-	s1 {
-		regulator-min-microvolt = <500000>;
-		regulator-max-microvolt = <1300000>;
-	};
-
 	s3 {
 		regulator-min-microvolt = <1200000>;
 		regulator-max-microvolt = <1300000>;
@@ -189,11 +184,6 @@ l2 {
 		regulator-max-microvolt = <1200000>;
 	};
 
-	l3 {
-		regulator-min-microvolt = <500000>;
-		regulator-max-microvolt = <1287500>;
-	};
-
 	l4 {
 		regulator-min-microvolt = <2050000>;
 		regulator-max-microvolt = <2050000>;
-- 
2.28.0

