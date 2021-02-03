Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2E3C30D6E7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Feb 2021 11:00:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233586AbhBCKAO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Feb 2021 05:00:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233562AbhBCKAG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Feb 2021 05:00:06 -0500
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EEECC0613D6
        for <linux-arm-msm@vger.kernel.org>; Wed,  3 Feb 2021 01:59:23 -0800 (PST)
Received: by mail-pg1-x529.google.com with SMTP id b21so16974728pgk.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Feb 2021 01:59:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=b/R050Y1V5Ge6RgQndzOtSwrUqfobK01w5MWFMoCoZ8=;
        b=LKVycDXu0rsyOBfww/WsyR7fnRDdngTyJ0nhdbiq7M5uOFBrBJ9KNZqfmMbVDQL9Sr
         866hPIsso4aRMM+hkbxVJZ8o/4Pm/6Cti1gadMSOAGnnk6Sfsa463M6nR4eHS178Glbk
         +35ZJ6gMP9bSlDGW7UVIPsEVWaTPtIlbZjjOxQYwUmy9moXwqZ6NCrqtiLl8g+q2uJ5h
         /lsPqhs6EaVup+ACAU0KGc0FSwl8Cy5AfzBWiT6z828uJGegzpNX+iVieSc3/HSCEnMA
         OBfXswsLbTp15zuTgO2pSQtwOgYHSjP/rNR+2SMDFpVHhv2/NGy2yLKK/H+PhpYoIe2I
         uiHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=b/R050Y1V5Ge6RgQndzOtSwrUqfobK01w5MWFMoCoZ8=;
        b=Qs7d84SZddH5Q8Yl1nWjcLH5hNh/7KhMPLqRHqTqSvnROXV+j20JLHplmChDeafFXH
         rYOxABJF593IX9eyUwneGMGNyu9Nk7PNAwU6yxnqSr5HxxQPA426KMp/rJYxW3xjf9dW
         M+iCezaJP1nmdKh7EsviGPCulsPPa96M3ZvpKFy08JqXAmfSFWseMBn/Hp6HBvdbvv4N
         Ri1aIb+M5ufNOZZDmlTw3p6YiglEXLoHJCMpf0NZjqTbT/YLmPn6sgaXVaEzgxSCtNWL
         9rpF2o5OCP9/bvjXEd51/dIDNJZvEzh7ovdNQm3aqtSqRAk1CBiR0AkEnKNSZD+IRUGm
         Er7g==
X-Gm-Message-State: AOAM533SD1utGrgZWcwqoLD6Akt7l3xYOtH740atxsK6NTzUo3uIRjgi
        Jx4+DjV4P9qH44H453/w0Jn+Hw==
X-Google-Smtp-Source: ABdhPJzt+iVFoaJcjuLKZlhysrfskisg5TT52CJKFKEDsjf4a4huk6neQOw5FYOuABb5d83ch1bfsA==
X-Received: by 2002:a63:db03:: with SMTP id e3mr2733397pgg.225.1612346362659;
        Wed, 03 Feb 2021 01:59:22 -0800 (PST)
Received: from localhost.localdomain ([2405:201:6803:610b:1c6f:cebf:a887:dd42])
        by smtp.gmail.com with ESMTPSA id p16sm1757182pfq.28.2021.02.03.01.59.19
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Feb 2021 01:59:22 -0800 (PST)
From:   Amit Pundir <amit.pundir@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konradybcio@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>
Cc:     linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dt <devicetree@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>, phone-devel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: sdm845-xiaomi-beryllium: Add DSI and panel bits
Date:   Wed,  3 Feb 2021 15:29:16 +0530
Message-Id: <1612346356-26445-1-git-send-email-amit.pundir@linaro.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Sumit Semwal <sumit.semwal@linaro.org>

Enabling the Display panel for beryllium phone (Xiaomi
Pocophone F1) requires DSI labibb regulators and panel
dts nodes to be added. It is also required to keep some
of the regulators as always-on.

Signed-off-by: Sumit Semwal <sumit.semwal@linaro.org>
Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
---
 .../boot/dts/qcom/sdm845-xiaomi-beryllium.dts      | 55 ++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts
index cd15ae0347e8..e09effa555f1 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts
@@ -160,6 +160,14 @@
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
+		vreg_l14a_1p88: ldo14 {
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
@@ -194,6 +202,7 @@
 			regulator-min-microvolt = <1200000>;
 			regulator-max-microvolt = <1200000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-boot-on;
 		};
 	};
 };
@@ -207,6 +216,44 @@
 	firmware-name = "qcom/sdm845/cdsp.mdt";
 };
 
+&dsi0 {
+	status = "okay";
+	vdda-supply = <&vreg_l26a_1p2>;
+
+	ports {
+		port@1 {
+			endpoint {
+				remote-endpoint = <&tianma_nt36672a_in_0>;
+				data-lanes = <0 1 2 3>;
+			};
+		};
+	};
+
+	panel@0 {
+		compatible = "tianma,fhd-video";
+		reg = <0>;
+		vddi0-supply = <&vreg_l14a_1p88>;
+		vddpos-supply = <&lab>;
+		vddneg-supply = <&ibb>;
+
+		reset-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port {
+			tianma_nt36672a_in_0: endpoint {
+				remote-endpoint = <&dsi0_out>;
+			};
+		};
+	};
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
@@ -274,6 +321,14 @@
 
 };
 
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
2.7.4

