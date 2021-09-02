Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05B853FF5CB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Sep 2021 23:47:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244085AbhIBVsO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Sep 2021 17:48:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347526AbhIBVsM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Sep 2021 17:48:12 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAB98C061575;
        Thu,  2 Sep 2021 14:47:13 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id r7so5061751edd.6;
        Thu, 02 Sep 2021 14:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qcG+HyKA1Y8i+Z2Jw3IqzPhdrYZ9oVs7LkF6xRpI/6w=;
        b=Jx21egLuzS9P61dWMI1/PuMwpnMGqcgecpJ5XF1P4gj/NXBWr/OKEzAPe7ksXFBUUw
         5BTKMAT9ohV3RMh0iNkpclriES5lI/arIzig+aqNib1gMg5LhDTiBgSbCoGS9xsEUUxM
         EglEqcSl2wt0VPhNLoB8WM9cnZpM3yO+DEEAxIoV7jQzypH1td+pllkbQcGI+stM/0WR
         hx2zzrfKKXZlGke/fSmQQpYzEhXuukvGraUVpUDlVEV9FbEkGjYG1JlJyovppisuBr4Q
         Dpmbw3ECbPDxQD0x2W5B2hjD3PC4RZThrd/dd4cFKGXxWiYWLxyQuKL2sWAZt+rF0V0z
         Hl2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qcG+HyKA1Y8i+Z2Jw3IqzPhdrYZ9oVs7LkF6xRpI/6w=;
        b=sCQ0JM1NMIWO26LPcCl3anqHDRfcfFa9rOdesG0MAM1x/mmFXosSPTcNGvaLPwH2py
         ux1UcX7vIcVbTKSV/Yxfk76Yc4DAEv79l3BluWXvrmJZUypzwlPtPBN6e2pTL5huxiGs
         w0M1FYNpuo9kYh4rFHDFfY7eQOs1bJO1A9GFxOacHml+BfQcLmLbBVx8F6eoLqNre81a
         wkbJ59hp+qLsRlTx+GMZm3o3UjXP4YuCD5lni0ixWBdlffNxlzlHgvIV0OFXj/u7IPs4
         YODDqwKMN4iaruDeTphofNlE2nRppNqnlzFO/rc62GDKuFrb/qxnxKbQZj9WFlViPUiM
         lkfg==
X-Gm-Message-State: AOAM5323XxOdgYEX/EaDEvAdLwt7BEHKun4ga0PY1qkvXuxEuXgeHuvW
        RKCVUiZDuUb6eU9vV4wufZE=
X-Google-Smtp-Source: ABdhPJxuwlAiNA8w5FFSvXCjj3DJwEcBxEIliMZILWUv3xB6CSvXbe7IdxpdKcF7TXQFcRvgrjOWTw==
X-Received: by 2002:a05:6402:1d05:: with SMTP id dg5mr415159edb.375.1630619232325;
        Thu, 02 Sep 2021 14:47:12 -0700 (PDT)
Received: from localhost.localdomain ([188.252.220.158])
        by smtp.googlemail.com with ESMTPSA id h7sm1888331edr.4.2021.09.02.14.47.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Sep 2021 14:47:11 -0700 (PDT)
From:   Robert Marko <robimarko@gmail.com>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Robert Marko <robimarko@gmail.com>
Subject: [PATCH] arm64: dts: qcom: ipq8074: add SMEM support
Date:   Thu,  2 Sep 2021 23:47:08 +0200
Message-Id: <20210902214708.1776690-1-robimarko@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

IPQ8074 uses SMEM like other modern QCA SoC-s, so since its already
supported by the kernel add the required DT nodes.

Signed-off-by: Robert Marko <robimarko@gmail.com>
---
 arch/arm64/boot/dts/qcom/ipq8074.dtsi | 28 +++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq8074.dtsi b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
index a620ac0d0b19..83e9243046aa 100644
--- a/arch/arm64/boot/dts/qcom/ipq8074.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
@@ -82,6 +82,29 @@ scm {
 		};
 	};
 
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		smem_region: memory@4ab00000 {
+			no-map;
+			reg = <0x0 0x4ab00000 0x0 0x00100000>;
+		};
+	};
+
+	tcsr_mutex: hwlock {
+		compatible = "qcom,tcsr-mutex";
+		syscon = <&tcsr_mutex_regs 0 0x80>;
+		#hwlock-cells = <1>;
+	};
+
+	smem {
+		compatible = "qcom,smem";
+		memory-region = <&smem_region>;
+		hwlocks = <&tcsr_mutex 0>;
+	};
+
 	soc: soc {
 		#address-cells = <0x1>;
 		#size-cells = <0x1>;
@@ -293,6 +316,11 @@ gcc: gcc@1800000 {
 			#reset-cells = <0x1>;
 		};
 
+		tcsr_mutex_regs: syscon@1905000 {
+			compatible = "syscon";
+			reg = <0x01905000 0x8000>;
+		};
+
 		sdhc_1: sdhci@7824900 {
 			compatible = "qcom,sdhci-msm-v4";
 			reg = <0x7824900 0x500>, <0x7824000 0x800>;
-- 
2.31.1

