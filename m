Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3414353989
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Apr 2021 21:44:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231453AbhDDTo7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 4 Apr 2021 15:44:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231425AbhDDToz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 4 Apr 2021 15:44:55 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5445FC061756
        for <linux-arm-msm@vger.kernel.org>; Sun,  4 Apr 2021 12:44:43 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id x126so1923123pfc.13
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 Apr 2021 12:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1gVXYTt/wzzvsZpY0S8Ku5EMWZnneAZjbi5/gEN+9Z4=;
        b=Zhg0BOdZ9NRM5lmaM7rboPD1Z3jkVYbpRfCPSIf03TbB19dEc4nt5Qu73HvAsXp7vE
         HpHRkBCR3GB77aZ3m5SeMIe1fHGuLQuzzFuhiDsRyG1FrmVlITz4UP6XDyJDqxqW0QA2
         ORfaLSRFmRz5dzkGOWdCBYwPQ3MWcvLm1lmhFOFcOw8022lRSJiij4Ppq33we3420/LP
         SeNq0qG9g5Rp2qVBb7ou553bcVIrwTr2CJEFfO80qmnu8rkh9OKZdnntZpOttRAzvyOU
         Yjhpc15wFJJC64b0h2p5JGttV+CU4i2r8VagqutGYiHWXEWLRMNtYtwxitHJFn6YlQC9
         3Ddw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1gVXYTt/wzzvsZpY0S8Ku5EMWZnneAZjbi5/gEN+9Z4=;
        b=d3WovaxbbAJC/iPz6iLl1cEXMErnHe/VGAMBeOSAv+/k/gBvZq8NY2sUNe7IAja+OZ
         TS/cGr9pcLUCNc+dRV5EFkuL+sbgw5A45A318ibcHW6sjZy17SsGpzFjt31Y2JmvnJ5Y
         Kiv/oz8WjsDE6GUdQ5n/gUtj8fY/RM8bKLGuGF1LZR2W9orwdt7bhQTJGybXSTFpvRjY
         G68nf8cD7jsbs2fTbv5jCPYflO+cmqjODwjRgvSp23IHxL5Whe2xSUZyY2Gs5YAsG1JM
         2/WoCRq46Mw/vl3FF21p55HNIOuWf1lDBgMGbr/9+Zs59LU5nqJtH6akU3bCuYStTXZE
         WFSQ==
X-Gm-Message-State: AOAM533P3W+10xh4eiWr+FIFF1hgSURRdLhTFQJhP4ZjvATgTf+u1b41
        HRE7UT1l18HjSZ0hE0eVAE0wzA==
X-Google-Smtp-Source: ABdhPJz8MtSWzD2hT6GOsb6g/JBLSmBgcQChZFDAZBBC0Xz879Wf37YxtGusWicuJNGO+VCUn1sx/g==
X-Received: by 2002:aa7:854c:0:b029:20a:68ac:7923 with SMTP id y12-20020aa7854c0000b029020a68ac7923mr21238420pfn.19.1617565482786;
        Sun, 04 Apr 2021 12:44:42 -0700 (PDT)
Received: from localhost.localdomain ([49.207.217.34])
        by smtp.gmail.com with ESMTPSA id r10sm1884057pjf.5.2021.04.04.12.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Apr 2021 12:44:42 -0700 (PDT)
From:   Amit Pundir <amit.pundir@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konradybcio@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>
Cc:     linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dt <devicetree@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>, phone-devel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: [PATCH v4] arm64: dts: qcom: sdm845-xiaomi-beryllium: Add DSI and panel bits
Date:   Mon,  5 Apr 2021 01:14:37 +0530
Message-Id: <20210404194437.537011-1-amit.pundir@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Sumit Semwal <sumit.semwal@linaro.org>

Enabling the Display panel for beryllium requires DSI
labibb regulators and panel dts nodes to be added.
It is also required to keep some of the regulators as
always-on.

Signed-off-by: Sumit Semwal <sumit.semwal@linaro.org>
Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
v4: Added Konrad's reviewed-by from v3. Added over current
    protection, pull-down and soft-start properties. Couldn't
    boot with downstream max-microamp values, so skipped it.
    Smoke tested on v5.12-rc5.
v3: Addressed Konrad's concerns. Configured labibb regulators
    explicitly based on downstream microvolt values. Display
    comes up fine with default discharge-resistor-kohms and
    soft-start-us properties, so didn't touch them.
    Smoke tested on next-20210209.
v2: Rebased to mainline (v5.11-rc6) and fixed build warnings.

 .../boot/dts/qcom/sdm845-xiaomi-beryllium.dts | 71 +++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts
index 86cbae63eaf7..7d029425336e 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts
@@ -157,6 +157,14 @@ vreg_l13a_2p95: ldo13 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
+		vreg_l14a_1p8: ldo14 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-boot-on;
+			regulator-always-on;
+		};
+
 		vreg_l17a_1p3: ldo17 {
 			regulator-min-microvolt = <1304000>;
 			regulator-max-microvolt = <1304000>;
@@ -191,6 +199,7 @@ vreg_l26a_1p2: ldo26 {
 			regulator-min-microvolt = <1200000>;
 			regulator-max-microvolt = <1200000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-boot-on;
 		};
 	};
 };
@@ -200,6 +209,43 @@ &cdsp_pas {
 	firmware-name = "qcom/sdm845/cdsp.mdt";
 };
 
+&dsi0 {
+	status = "okay";
+	vdda-supply = <&vreg_l26a_1p2>;
+
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	panel@0 {
+		compatible = "tianma,fhd-video";
+		reg = <0>;
+		vddi0-supply = <&vreg_l14a_1p8>;
+		vddpos-supply = <&lab>;
+		vddneg-supply = <&ibb>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		reset-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
+
+		port {
+			tianma_nt36672a_in_0: endpoint {
+				remote-endpoint = <&dsi0_out>;
+			};
+		};
+	};
+};
+
+&dsi0_out {
+	remote-endpoint = <&tianma_nt36672a_in_0>;
+	data-lanes = <0 1 2 3>;
+};
+
+&dsi0_phy {
+	status = "okay";
+	vdds-supply = <&vreg_l1a_0p875>;
+};
+
 &gcc {
 	protected-clocks = <GCC_QSPI_CORE_CLK>,
 			   <GCC_QSPI_CORE_CLK_SRC>,
@@ -215,6 +261,31 @@ zap-shader {
 	};
 };
 
+&ibb {
+	regulator-min-microvolt = <4600000>;
+	regulator-max-microvolt = <6000000>;
+	regulator-over-current-protection;
+	regulator-pull-down;
+	regulator-soft-start;
+	qcom,discharge-resistor-kohms = <300>;
+};
+
+&lab {
+	regulator-min-microvolt = <4600000>;
+	regulator-max-microvolt = <6000000>;
+	regulator-over-current-protection;
+	regulator-pull-down;
+	regulator-soft-start;
+};
+
+&mdss {
+	status = "okay";
+};
+
+&mdss_mdp {
+	status = "okay";
+};
+
 &mss_pil {
 	status = "okay";
 	firmware-name = "qcom/sdm845/mba.mbn", "qcom/sdm845/modem.mdt";
-- 
2.25.1

