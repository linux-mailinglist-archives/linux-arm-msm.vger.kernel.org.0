Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 50926744DD7
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Jul 2023 15:43:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229984AbjGBNnd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 2 Jul 2023 09:43:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229954AbjGBNnc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 2 Jul 2023 09:43:32 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AD4CE6B
        for <linux-arm-msm@vger.kernel.org>; Sun,  2 Jul 2023 06:43:30 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2b5c2433134so44699351fa.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Jul 2023 06:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688305408; x=1690897408;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ARk0sav3kUERt7qMqi0BE+pFNDzIzWnv5NChxXa+bqQ=;
        b=LSsgr28d+qRVzGIZ4pRO3aYbu5zZMfYEahRw3+A3InrD3M/ELEJTBXLmAKQEpEQFxx
         N2lMS/wthWvr5v+hDyl904+gG4xBLti4jTj6x9Ksb0wugp9Estf52vIIRqFrcwR5csN2
         jWyluZeljse/jBYyt9k3mEsv5V1EgV2IG8117MW8DWoFRcHxrgl3m+UXa/GMMMWVKS2U
         hMOMUaDD8jDRqFpppwdixxKbpX//rJjH9RTRSxg6jBgkZXe7YXs/e/v88K9bw5LIysO2
         tGckA0xUADhLhzWxUzIUffzLNuBhZpOK1S/oVImI4sOzrfV6eHJR0Ia8ZHbb7bBBRBSv
         3aFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688305408; x=1690897408;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ARk0sav3kUERt7qMqi0BE+pFNDzIzWnv5NChxXa+bqQ=;
        b=eCoV9W9xb9nLO8duhq8BrOHbYrIp35dwcy2F1YPWLuNQ8egGj4JS0eRDZvOf2L2fuA
         KxpqPMyBKU1rx1bZ0Sai0eHkiEvbsDwq8sKLNdjIUAZnFQl5Q8SxMTSik4oK2HWhL97i
         sUpG8DEGQq2nfrFZiO3Tf2iBqJGxjEZX/0y/yqbYHeYsPnbnhpPnIaa12fKRQZ2+iEph
         rRmD2zufdpViaYl/+pdXdf3YgZ247Pkubrlf13dczNSWh8hd9g7kvgAaMd8Lez90bLns
         B787oCEYna9dt4fpVyDovdUbZQ2qn3a/3b2Cch8m+9uHWqjjxlgdA90WM4AYQRseeRLw
         7vtg==
X-Gm-Message-State: ABy/qLZswXfN9Dso1k40pSkCG4rgysdceKlj4aBvBWxKiDUNHYVUbM27
        IcRUkW8+73/mJ0otuzKJiJubNA==
X-Google-Smtp-Source: APBJJlH0baeE9/QvY/I40Skgpz17C867z46oonr+k2oO9BssatSQGi4nEDoTwpr0oNMHLhkdniRHLQ==
X-Received: by 2002:a2e:3c19:0:b0:2b6:d0c1:7cd0 with SMTP id j25-20020a2e3c19000000b002b6d0c17cd0mr2078273lja.22.1688305408617;
        Sun, 02 Jul 2023 06:43:28 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id d9-20020a2e96c9000000b002b6988ca476sm4310650ljj.101.2023.07.02.06.43.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jul 2023 06:43:28 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2 09/27] ARM: dts: qcom: msm8660: fix PMIC node labels
Date:   Sun,  2 Jul 2023 16:43:02 +0300
Message-Id: <20230702134320.98831-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230702134320.98831-1-dmitry.baryshkov@linaro.org>
References: <20230702134320.98831-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Change PM8058 node labels to start with pm8058_ prefix, following other
Qualcomm PMIC device nodes.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../boot/dts/qcom/qcom-apq8060-dragonboard.dts   |  4 ++--
 arch/arm/boot/dts/qcom/qcom-msm8660.dtsi         | 16 ++++++++--------
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8060-dragonboard.dts b/arch/arm/boot/dts/qcom/qcom-apq8060-dragonboard.dts
index db4c791b2e2f..48fd1a1feea3 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8060-dragonboard.dts
+++ b/arch/arm/boot/dts/qcom/qcom-apq8060-dragonboard.dts
@@ -72,7 +72,7 @@ cm3605 {
 		/* Trig on both edges - getting close or far away */
 		interrupts-extended = <&pm8058_gpio 34 IRQ_TYPE_EDGE_BOTH>;
 		/* MPP05 analog input to the XOADC */
-		io-channels = <&xoadc 0x00 0x05>;
+		io-channels = <&pm8058_xoadc 0x00 0x05>;
 		io-channel-names = "aout";
 		pinctrl-names = "default";
 		pinctrl-0 = <&dragon_cm3605_gpios>, <&dragon_cm3605_mpps>;
@@ -945,7 +945,7 @@ irq-pins {
 	};
 };
 
-&xoadc {
+&pm8058_xoadc {
 	/* Reference voltage 2.2 V */
 	xoadc-ref-supply = <&pm8058_l18>;
 
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8660.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8660.dtsi
index 78023ed2fdf7..9217ced108c4 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8660.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8660.dtsi
@@ -80,13 +80,13 @@ sleep-clk {
 	 */
 	iio-hwmon {
 		compatible = "iio-hwmon";
-		io-channels = <&xoadc 0x00 0x01>, /* Battery */
-			    <&xoadc 0x00 0x02>, /* DC in (charger) */
-			    <&xoadc 0x00 0x04>, /* VPH the main system voltage */
-			    <&xoadc 0x00 0x0b>, /* Die temperature */
-			    <&xoadc 0x00 0x0c>, /* Reference voltage 1.25V */
-			    <&xoadc 0x00 0x0d>, /* Reference voltage 0.625V */
-			    <&xoadc 0x00 0x0e>; /* Reference voltage 0.325V */
+		io-channels = <&pm8058_xoadc 0x00 0x01>, /* Battery */
+			      <&pm8058_xoadc 0x00 0x02>, /* DC in (charger) */
+			      <&pm8058_xoadc 0x00 0x04>, /* VPH the main system voltage */
+			      <&pm8058_xoadc 0x00 0x0b>, /* Die temperature */
+			      <&pm8058_xoadc 0x00 0x0c>, /* Reference voltage 1.25V */
+			      <&pm8058_xoadc 0x00 0x0d>, /* Reference voltage 0.625V */
+			      <&pm8058_xoadc 0x00 0x0e>; /* Reference voltage 0.325V */
 	};
 
 	soc: soc {
@@ -390,7 +390,7 @@ pm8058_keypad: keypad@148 {
 					row-hold = <91500>;
 				};
 
-				xoadc: xoadc@197 {
+				pm8058_xoadc: xoadc@197 {
 					compatible = "qcom,pm8058-adc";
 					reg = <0x197>;
 					interrupts-extended = <&pm8058 76 IRQ_TYPE_EDGE_RISING>;
-- 
2.39.2

