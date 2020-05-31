Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 866601E996A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 May 2020 19:29:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728481AbgEaR3A (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 31 May 2020 13:29:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728234AbgEaR2V (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 31 May 2020 13:28:21 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36DC7C05BD43;
        Sun, 31 May 2020 10:28:21 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id x6so9075179wrm.13;
        Sun, 31 May 2020 10:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zwObqB6A402Y69JUcORVOD9gXxiBIhIVh7/TRDYpLLs=;
        b=Ij2SUK8biarGvM45OugsvYWU5SrgL+PHlfPtXvQ0rqVeO+7HA79G3U7jIgxKOH2Yik
         s0U+nSBYOTZEkYVTZ364l403zrqUTwR528eQTAabV7Gw/i8f27XLa8GfzJ7fOHtPuNee
         lFmH6STWPbYXrI7vYddeSjoc90h4x93v1cfHQvtlhZRMa0uttOOQzYeXHrfLQLVMZoUp
         9PKiF4MRjAugvpUrgKCA9u3dHocz0yv6R4JoEG/I6YEJ60KJrVdgJurNTyuZ7jnn+wjN
         1VrZNBetMqT/a/6I6fskJeSJoF0fopJXBa2CyXx9QY9tNw3YDq0exahWEHS4dxHH8g4J
         D4pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zwObqB6A402Y69JUcORVOD9gXxiBIhIVh7/TRDYpLLs=;
        b=a0zkff4cPTMO9feIsaT2ylEDChtKFqak+ZgHXf652uqtRTUVBP8wqRAViYW5+2nW3O
         AOUgVDrfdkbEYM+l9t1Im1mvFQrSJqmAEF6vwDLLoL4VdUk+5HN4bY+/i/N5Y80e1H1Z
         CXtItUg4sXgOdNNQL7/pp+1/vriWlsxG5mdsv9GFC/0fgJpFXLxCnpA0RNN0j4uYq879
         nFQDFLzxm4pvhmq/WXjhGVo5CwFDlLZPqzrXoGYyNui6XmEmFm/xWxSfkR//y3jZtHD5
         9q9AquMm1GfiiFkjdrLfNyBbFm0QSsWyvUOFCYuafuqyvyKGe3PYDaoEjzDDaIapKEt8
         etow==
X-Gm-Message-State: AOAM532TEWyTdHaKrw1sYXdvu3spPf98bVzDVTOykWd/d55eCRw1LmUQ
        UCOZbOByBZa9/mTa5eILF3k=
X-Google-Smtp-Source: ABdhPJzz0EszZ6GWkKmHMtldEJx+Z8Cidj0vVb1Ks0lTDTMCwOEOpgmbnAfg4BiY4/SdwnoutU/Whg==
X-Received: by 2002:adf:e40c:: with SMTP id g12mr18292981wrm.121.1590946100017;
        Sun, 31 May 2020 10:28:20 -0700 (PDT)
Received: from localhost.localdomain (abad130.neoplus.adsl.tpnet.pl. [83.6.167.130])
        by smtp.googlemail.com with ESMTPSA id b81sm8922326wmc.5.2020.05.31.10.28.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 10:28:19 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
Cc:     Konrad Dybcio <konradybcio@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 06/14] arm64: dts: msm8992: Add a spmi_bus node
Date:   Sun, 31 May 2020 19:27:56 +0200
Message-Id: <20200531172804.256335-7-konradybcio@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200531172804.256335-1-konradybcio@gmail.com>
References: <20200531172804.256335-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This change adds a SPMI bus node so as to
enable PMIC and PMIC peripherals interaction.

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8992.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8992.dtsi b/arch/arm64/boot/dts/qcom/msm8992.dtsi
index 535be60521d8..8f7cdf2b9a1f 100644
--- a/arch/arm64/boot/dts/qcom/msm8992.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8992.dtsi
@@ -253,6 +253,22 @@ msmgpio: pinctrl@fd510000 {
 			#interrupt-cells = <2>;
 		};
 
+		spmi_bus: qcom,spmi@fc4c0000 {
+			compatible = "qcom,spmi-pmic-arb";
+			reg = <0xfc4cf000 0x1000>,
+			      <0xfc4cb000 0x1000>,
+			      <0xfc4ca000 0x1000>;
+			reg-names = "core", "intr", "cnfg";
+			interrupt-names = "periph_irq";
+			interrupts = <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>;
+			qcom,ee = <0>;
+			qcom,channel = <0>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+			interrupt-controller;
+			#interrupt-cells = <4>;
+		};
+
 		blsp1_uart2: serial@f991e000 {
 			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
 			reg = <0xf991e000 0x1000>;
-- 
2.26.2

