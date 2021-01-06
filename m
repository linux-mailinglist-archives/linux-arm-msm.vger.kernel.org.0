Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F0172EBDED
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Jan 2021 13:57:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726062AbhAFMzC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Jan 2021 07:55:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725836AbhAFMzB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Jan 2021 07:55:01 -0500
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55373C06135A
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Jan 2021 04:53:47 -0800 (PST)
Received: by mail-pl1-x62d.google.com with SMTP id b8so1521895plx.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Jan 2021 04:53:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zkuwXT0BNz/CHQLQCAyTEe+HOvwjU8Q2EN+C4ZwD2SY=;
        b=YZOkkSwceR3x7wzFWyDAzaO6eikKTqdd8NSOX1QNR4SVgiuhiNBSKLJmi27m85dj1g
         YmvoW/v8u1p8yIz56x4Jo02RZgBsdi6gHUoLAOJcC39GH67sBgqJLrDOaftpckOmk0as
         o12XA2rF3/QZ7T0kDmVw65g3vMmLkkBtporGk8fHrWbpQ208ZA9tMv0+g863McjX+xk1
         HxLrYD4JnKiGzVQp1eKv8917mc2JLAXrURbMK/wtu/dORRf+P5Xk9YSei7g8o4hhvfG2
         tUhOzyFTd3ZCwr7r1uglsy0rvk7OcV8Br9zhdvpTvK37JVh4jZkFG5cV8v59Pci1C58H
         5wQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zkuwXT0BNz/CHQLQCAyTEe+HOvwjU8Q2EN+C4ZwD2SY=;
        b=RCyjlq0UYQVmIc52/cNxc0lMOeQLu7bO3NGRV84kQKB+8xTp3EExxepgrPhAJWjwRo
         2i8J+nLRoExQl3Td73tdwsQvrR4Nfig+lWIU2ezU/OQFVvVi1HQpPDpLHG2RiKoTk0pk
         u8RKH7yyp/es/PGbp3+hDTaWwjHYHgDIaoudSWW1iUXowhzewKgclwVlPbH4Gk1DX9ik
         3TO5XXirXRJZH9F/q5qHZZKGPgsE35V0gp5aunWBj8CbjV0dLhCA+dW8txEvCWiGbJck
         CfpqFl+h1Z6KKvMXg2HhADtUInCYGFH5PENNR7qabnRXFaKoCi8ugas7sptkCMJlwJr9
         RMRQ==
X-Gm-Message-State: AOAM530kXmmosYE13aE4SHmvop3PipBO01dA7GOFZCBG89gHKxPBsI+S
        OIxQlBwuUDf3JxLHtwWsNMQU
X-Google-Smtp-Source: ABdhPJxbThKRFHpNIoqGbUaWhezQh9icASU3TnapzOTgJJAs9gUF926EVlgi5YOH4GIYbn9IWAibGw==
X-Received: by 2002:a17:90a:3d0b:: with SMTP id h11mr4102891pjc.188.1609937626867;
        Wed, 06 Jan 2021 04:53:46 -0800 (PST)
Received: from localhost.localdomain ([2409:4072:6102:e7a2:51f0:bf72:bf80:ec88])
        by smtp.gmail.com with ESMTPSA id n128sm2918182pga.55.2021.01.06.04.53.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jan 2021 04:53:46 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vinod Koul <vkoul@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3 02/18] ARM: dts: qcom: sdx55: Add reserved memory nodes
Date:   Wed,  6 Jan 2021 18:23:06 +0530
Message-Id: <20210106125322.61840-3-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210106125322.61840-1-manivannan.sadhasivam@linaro.org>
References: <20210106125322.61840-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Vinod Koul <vkoul@kernel.org>

This adds reserved memory nodes to the SDX55 dtsi as defined by v6 of
the memory map

Signed-off-by: Vinod Koul <vkoul@kernel.org>
[mani: moved modem regions to board dts]
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm/boot/dts/qcom-sdx55-mtp.dts | 21 +++++++++++
 arch/arm/boot/dts/qcom-sdx55.dtsi    | 52 ++++++++++++++++++++++++++++
 2 files changed, 73 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-sdx55-mtp.dts b/arch/arm/boot/dts/qcom-sdx55-mtp.dts
index 262660e6dd11..a5d2e4a3a796 100644
--- a/arch/arm/boot/dts/qcom-sdx55-mtp.dts
+++ b/arch/arm/boot/dts/qcom-sdx55-mtp.dts
@@ -20,6 +20,27 @@ aliases {
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		mpss_debug_mem: memory@8ef00000 {
+			no-map;
+			reg = <0x8ef00000 0x800000>;
+		};
+
+		ipa_fw_mem: memory@8fced000 {
+			no-map;
+			reg = <0x8fced000 0x10000>;
+		};
+
+		mpss_adsp_mem: memory@90c00000 {
+			no-map;
+			reg = <0x90c00000 0xd400000>;
+		};
+	};
 };
 
 &blsp1_uart3 {
diff --git a/arch/arm/boot/dts/qcom-sdx55.dtsi b/arch/arm/boot/dts/qcom-sdx55.dtsi
index 08b4a40338fa..194936064884 100644
--- a/arch/arm/boot/dts/qcom-sdx55.dtsi
+++ b/arch/arm/boot/dts/qcom-sdx55.dtsi
@@ -60,6 +60,58 @@ psci {
 		method = "smc";
 	};
 
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		hyp_mem: memory@8fc00000 {
+			no-map;
+			reg = <0x8fc00000 0x80000>;
+		};
+
+		ac_db_mem: memory@8fc80000 {
+			no-map;
+			reg = <0x8fc80000 0x40000>;
+		};
+
+		secdata_mem: memory@8fcfd000 {
+			no-map;
+			reg = <0x8fcfd000 0x1000>;
+		};
+
+		sbl_mem: memory@8fd00000 {
+			no-map;
+			reg = <0x8fd00000 0x100000>;
+		};
+
+		aop_image: memory@8fe00000 {
+			no-map;
+			reg = <0x8fe00000 0x20000>;
+		};
+
+		aop_cmd_db: memory@8fe20000 {
+			compatible = "qcom,cmd-db";
+			reg = <0x8fe20000 0x20000>;
+			no-map;
+		};
+
+		smem_mem: memory@8fe40000 {
+			no-map;
+			reg = <0x8fe40000 0xc0000>;
+		};
+
+		tz_mem: memory@8ff00000 {
+			no-map;
+			reg = <0x8ff00000 0x100000>;
+		};
+
+		tz_apps_mem: memory@0x90000000 {
+			no-map;
+			reg = <0x90000000 0x500000>;
+		};
+	};
+
 	soc: soc {
 		#address-cells = <1>;
 		#size-cells = <1>;
-- 
2.25.1

