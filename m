Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54AE92C6AA4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Nov 2020 18:34:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732175AbgK0Ra7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Nov 2020 12:30:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732164AbgK0Ra6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Nov 2020 12:30:58 -0500
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 864D5C0613D2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2020 09:30:58 -0800 (PST)
Received: by mail-pf1-x442.google.com with SMTP id b10so3735935pfo.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2020 09:30:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jRPKms8czRyZejPs/escCcopkjcFF901XVGwJamtDJM=;
        b=CyR6dpR4c/4mgxkm4VQV7A/44VO1b41ki4UsBKPRL2o1PbTiDTDQFa15XdC9OWgXU3
         wk9Jk8suxz2Xr5ZodttuyL+ujl0A6rG7cwN1PawFsn/WO9XyiIS7hsJF/f5SSUjQot+G
         CAb5QAPJoNsRys41Cb20fsiopuvsGESc71r5Rxn+3NaRG9J/9saS62b1TG4yPF3z1iT1
         K9lft/uUOKyGbhLx3N0aVpiue2EF5WFhZtTNvLY8GFLY5He0DcKBXcHz6yTCDcFmQ0Zs
         /sw/IrMuEKqUpBmJYZqr5d2b0vpNTKwP+9f/wO5HdLHpw+dhsSFXfmxfYbvExaP/5h+q
         Zyzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jRPKms8czRyZejPs/escCcopkjcFF901XVGwJamtDJM=;
        b=k8WeHGuornOsw9484WwOy7ziLZOBjfr7mXV4hCiRHxCAlMVNaRbaX91eAcPu7Tvi+r
         F9tFYZ5J1PiFIIb5Vub6WoHxRvIjOfDpezvwbVWr8igraAnwHmcfQwjyUonWf9xwCqVH
         A6yBmAUIDqdWTBBMvmTzoNWX09NadPAJOQMtbNx+Aa0P4GGx2khfJ8QunN3nUxACDdsC
         4yVzT9o13QvEQzTuusJh+CIxRW5wmtaBmzHZ7ngzx0yAWeMEBH8/puDz8FatT58afwN6
         knOa79cOWH3BvGuosiDqlc8q9dld04+vhZ9yJWO77I6V2SOEoj600pM51ITVpcHTzfxi
         tOZQ==
X-Gm-Message-State: AOAM5338OL3lCm0VeziNRX0mRTQoreHdOIu9ITamMbLSdaGw5QzHSSlL
        SHK/SBW/GnU+NYn1evzS2hir
X-Google-Smtp-Source: ABdhPJwfLGmlIUKMw8ei/AYaI3sgaDIXBh/Qz4I2792/jWB4QCs3BU8vYLcAgylkImbpqUUucPO6Ow==
X-Received: by 2002:a63:6f4c:: with SMTP id k73mr7354000pgc.319.1606498257787;
        Fri, 27 Nov 2020 09:30:57 -0800 (PST)
Received: from localhost.localdomain ([2409:4072:88d:6f0d:1941:b53e:6208:a8c9])
        by smtp.gmail.com with ESMTPSA id j8sm7847014pgb.55.2020.11.27.09.30.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2020 09:30:57 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmitry.baryshkov@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH] arm64: dts: qcom: qrb5165-rb5: Add support for MCP2518FD
Date:   Fri, 27 Nov 2020 23:00:44 +0530
Message-Id: <20201127173044.55144-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for onboard MCP2518FD SPI CAN transceiver attached to SPI0
of RB5.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
index d9f52703ba2a..ce22d4fa383e 100644
--- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
+++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
@@ -25,6 +25,13 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	/* Fixed crystal oscillator dedicated to MCP2518FD */
+	clk40M: can_clock {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <40000000>;
+	};
+
 	dc12v: dc12v-regulator {
 		compatible = "regulator-fixed";
 		regulator-name = "DC12V";
@@ -493,6 +500,16 @@ &sdhc_2 {
 /* CAN */
 &spi0 {
 	status = "okay";
+
+	can@0 {
+		compatible = "microchip,mcp2518fd";
+		reg = <0>;
+		clocks = <&clk40M>;
+		interrupts-extended = <&tlmm 15 IRQ_TYPE_LEVEL_LOW>;
+		spi-max-frequency = <10000000>;
+		vdd-supply = <&vdc_5v>;
+		xceiver-supply = <&vdc_5v>;
+	};
 };
 
 &tlmm {
-- 
2.25.1

