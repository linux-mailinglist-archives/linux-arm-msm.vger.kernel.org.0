Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 43430170A31
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2020 22:05:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727578AbgBZVFC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Feb 2020 16:05:02 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:34702 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727501AbgBZVFC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Feb 2020 16:05:02 -0500
Received: by mail-pl1-f196.google.com with SMTP id j7so197304plt.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Feb 2020 13:05:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ACUPnfRs+B0AixBhqicJFirvOfw04PSorPFO08K1XPM=;
        b=b1h+jw5xvLfpwa+81eovYYEJi6VmH4SIolSQZvYhQZRZvv3SjNbBbraaGJCnRspqlT
         ubFVcKmj4Whh7g1ABpck2L0sOj+vXO3iwj/pwgLpkwBzXo8W6YLDk0ulLFNDkNowBLcF
         oPWR35l4uwxwSsfVVZW7xk5m8Ng8SO4NREIus=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ACUPnfRs+B0AixBhqicJFirvOfw04PSorPFO08K1XPM=;
        b=t+fintjXFAcpaSD/hzXFgDQktYRPndeNx27ShoulW1WJ9w9vUZ6+4dBTlRSvNX21Yf
         122hSz5S0AJPF1EczP9rsv2cCer09CqeRkiEKROZEfY8GgVedzQO4XDJR+8xo/5AYj1U
         gmTQwrycDaifi1uhHjbL+c8kRgKVYb2uhpNXn5bFPTgrl16dN1MeJCZFTqD++TUlL+Uw
         DkNNMfeakMRI12LH4IY63OrFMrhqAa9ChPsE9xKU5vhZGl4bq1D2V2WfALyofINSNv23
         gyNKhNZxdFdmYy2wnbKrspHE27aG4EisLVRCfWl96nvH6qZ2CWLgrDOGwVT2r0AHQ6Ds
         qKig==
X-Gm-Message-State: APjAAAXOU4UIUemlH0IOaxvA6IZBc9TZrNifuhnbjhzyhdbWbFFXQ/Q2
        8l44xIxfeA+d0Yjb+RdCT/45lA==
X-Google-Smtp-Source: APXvYqz5OZ/7iJEwlyyHRvnBC50QVZ4cl/O+psBc+djXwLFf/hH1Nx+qFYROeCDiSB4p8GzYotV3mQ==
X-Received: by 2002:a17:902:528:: with SMTP id 37mr1205955plf.322.1582751100330;
        Wed, 26 Feb 2020 13:05:00 -0800 (PST)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id v29sm3636477pgc.72.2020.02.26.13.04.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Feb 2020 13:04:58 -0800 (PST)
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Dikshita Agarwal <dikshita@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH v2] arm64: dts: sc7180: Move venus node to the correct position
Date:   Wed, 26 Feb 2020 13:04:55 -0800
Message-Id: <20200226130438.v2.1.I15e0f7eff0c67a2b49d4992f9d80fc1d2fdadf63@changeid>
X-Mailer: git-send-email 2.25.1.481.gfbce0eb801-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Per convention device nodes for SC7180 should be ordered by address.
This is currently not the case for the venus node, move it to the
correct position.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---
Excuses for sending v2 so shortly after v1, it seems ok in this case
since v1 is obviously wrong and the patch is not likely to be
controversial otherwise.

Changes in v2:
- insert the venus node *after* the usb@a6f8800 node, not before

 arch/arm64/boot/dts/qcom/sc7180.dtsi | 52 ++++++++++++++--------------
 1 file changed, 26 insertions(+), 26 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 253274d5f04c..5f97945e16a4 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -1332,6 +1332,32 @@ system-cache-controller@9200000 {
 			interrupts = <GIC_SPI 582 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		venus: video-codec@aa00000 {
+			compatible = "qcom,sc7180-venus";
+			reg = <0 0x0aa00000 0 0xff000>;
+			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+			power-domains = <&videocc VENUS_GDSC>,
+					<&videocc VCODEC0_GDSC>;
+			power-domain-names = "venus", "vcodec0";
+			clocks = <&videocc VIDEO_CC_VENUS_CTL_CORE_CLK>,
+				 <&videocc VIDEO_CC_VENUS_AHB_CLK>,
+				 <&videocc VIDEO_CC_VENUS_CTL_AXI_CLK>,
+				 <&videocc VIDEO_CC_VCODEC0_CORE_CLK>,
+				 <&videocc VIDEO_CC_VCODEC0_AXI_CLK>;
+			clock-names = "core", "iface", "bus",
+				      "vcodec0_core", "vcodec0_bus";
+			iommus = <&apps_smmu 0x0c00 0x60>;
+			memory-region = <&venus_mem>;
+
+			video-decoder {
+				compatible = "venus-decoder";
+			};
+
+			video-encoder {
+				compatible = "venus-encoder";
+			};
+		};
+
 		usb_1: usb@a6f8800 {
 			compatible = "qcom,sc7180-dwc3", "qcom,dwc3";
 			reg = <0 0x0a6f8800 0 0x400>;
@@ -1538,32 +1564,6 @@ dispcc: clock-controller@af00000 {
 			#power-domain-cells = <1>;
 		};
 
-		venus: video-codec@aa00000 {
-			compatible = "qcom,sc7180-venus";
-			reg = <0 0x0aa00000 0 0xff000>;
-			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
-			power-domains = <&videocc VENUS_GDSC>,
-					<&videocc VCODEC0_GDSC>;
-			power-domain-names = "venus", "vcodec0";
-			clocks = <&videocc VIDEO_CC_VENUS_CTL_CORE_CLK>,
-				 <&videocc VIDEO_CC_VENUS_AHB_CLK>,
-				 <&videocc VIDEO_CC_VENUS_CTL_AXI_CLK>,
-				 <&videocc VIDEO_CC_VCODEC0_CORE_CLK>,
-				 <&videocc VIDEO_CC_VCODEC0_AXI_CLK>;
-			clock-names = "core", "iface", "bus",
-				      "vcodec0_core", "vcodec0_bus";
-			iommus = <&apps_smmu 0x0c00 0x60>;
-			memory-region = <&venus_mem>;
-
-			video-decoder {
-				compatible = "venus-decoder";
-			};
-
-			video-encoder {
-				compatible = "venus-encoder";
-			};
-		};
-
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sc7180-pdc", "qcom,pdc";
 			reg = <0 0x0b220000 0 0x30000>;
-- 
2.25.1.481.gfbce0eb801-goog

