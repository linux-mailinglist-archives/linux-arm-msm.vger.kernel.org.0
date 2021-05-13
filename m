Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7105837FD1C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 May 2021 20:13:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231654AbhEMSPH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 May 2021 14:15:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231630AbhEMSPF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 May 2021 14:15:05 -0400
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com [IPv6:2607:f8b0:4864:20::82c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2A56C06175F
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 May 2021 11:13:55 -0700 (PDT)
Received: by mail-qt1-x82c.google.com with SMTP id 1so20447447qtb.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 May 2021 11:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HXltQBvkx1uGuMaYPj9g2id51wvtZyhCM+wy/g4T8Fs=;
        b=IqyBLMHPnqOO1aMM6yaIY9uAFQDOUOb9efB8ywVoZQt0QjImKLmxQzp+QG49XLsESj
         jbDe5QoSSAtex00OLxYlHdAIM2i/wKq6HeMr4ytmC/9iQJ26L+RSK2QkQEtT9XbXJtMz
         lsXSc42Txy0pLw/IZK0V3EXPwP1aXfABAJn1YmEavYUNISYuzpdZHyQq92pl2YpCJP1C
         Zwag5XxrjST/OhEAMwstFsn1mlQ2hED1fEA5jGvotTER2luavibFw3rzkxQselJCCiQk
         oi5SsmXPBQ86j0pIXOT/jD0qU06NWC3NlUjJz1HyoGN3RcNi2FgwR8TGs1Zz5XL6EjLF
         JEig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HXltQBvkx1uGuMaYPj9g2id51wvtZyhCM+wy/g4T8Fs=;
        b=tWD4eMZn1X/R14I2W0Y22FzKNzKA5pJgtCyO4hf/FTD9aQPkT9guADKUr4gW8ldFZD
         naVSO/RY8XufPBIPgI9I7DsWVdyebXdxY1Y+pU04PK4ClBruf9/X0TlxfyJ9mH0Tiv5j
         WtF0KYbLAtMGBBR1DWUxfr7HZi6ie92/2Ik3Vr+1HCuw1LDqGfl12UdZb/OW1kTHLVYJ
         dmftuUNvUeh9NPbQeyNqXXMh1CsppCYyy+miPmyALq2Y6yHw6S4lbY5Aa01jH5leJ0JK
         1UXCXSZSW9K+qUCikfseADGSnEzuZU16dkIG0vbn4qfpO1zrw0uULt11CJvzTL4tJCqw
         ClwA==
X-Gm-Message-State: AOAM532HxNEhNwQwuLOeaiKM8O8MRIUS08QKIYcB6GsA/aDH3jx3jCS5
        lEn7vHg4fERe1i7t7T+TAnkACvQf91Ktdb0xTCw=
X-Google-Smtp-Source: ABdhPJyEMR6sukN1MstuFcNht076AryZM0nX8XcmQwhDdctmhiQyIcYhqR3M6/fU8WTw2Cb1h6OzKQ==
X-Received: by 2002:ac8:66da:: with SMTP id m26mr27531909qtp.102.1620929634885;
        Thu, 13 May 2021 11:13:54 -0700 (PDT)
Received: from localhost.localdomain (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
        by smtp.gmail.com with ESMTPSA id y6sm3069492qkd.106.2021.05.13.11.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 May 2021 11:13:54 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/2] arm64: dts: qcom: sm8350: add qupv3_id_1/i2c13 nodes
Date:   Thu, 13 May 2021 14:13:09 -0400
Message-Id: <20210513181309.12491-2-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20210513181309.12491-1-jonathan@marek.ca>
References: <20210513181309.12491-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the qupv3_id_1 node and the i2c13 child node used for i2c devices
connected to gpio0/gpio1.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 38 ++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 76a1df371b17..b7b997dd1475 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -468,6 +468,31 @@ uart3: serial@98c000 {
 			};
 		};
 
+		qupv3_id_1: geniqup@ac0000 {
+			compatible = "qcom,geni-se-qup";
+			reg = <0x0 0x00ac0000 0x0 0x6000>;
+			clock-names = "m-ahb", "s-ahb";
+			clocks = <&gcc GCC_QUPV3_WRAP_1_M_AHB_CLK>,
+				 <&gcc GCC_QUPV3_WRAP_1_S_AHB_CLK>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+			status = "disabled";
+
+			i2c13: i2c@a94000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0 0x00a94000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP1_S5_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_i2c13_default_state>;
+				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+		};
+
 		apps_smmu: iommu@15000000 {
 			compatible = "qcom,sm8350-smmu-500", "arm,mmu-500";
 			reg = <0 0x15000000 0 0x100000>;
@@ -760,6 +785,19 @@ tx {
 					function = "qup3";
 				};
 			};
+
+			qup_i2c13_default_state: qup-i2c13-default-state {
+				mux {
+					pins = "gpio0", "gpio1";
+					function = "qup13";
+				};
+
+				config {
+					pins = "gpio0", "gpio1";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
 		};
 
 		rng: rng@10d3000 {
-- 
2.26.1

