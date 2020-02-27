Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B54217250D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2020 18:26:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729603AbgB0R05 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Feb 2020 12:26:57 -0500
Received: from mail-pj1-f66.google.com ([209.85.216.66]:52954 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728413AbgB0R05 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Feb 2020 12:26:57 -0500
Received: by mail-pj1-f66.google.com with SMTP id ep11so72812pjb.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2020 09:26:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fQPEnxEYqQKv2J8jDt8sM4BsZoYJJo7zFPvtZvyCIgk=;
        b=M8MQI9kESW8PfwE5agJLV5bI3OzTvFh8DKCAPWjqwaZe0CN9rvaLIsXYDbc/GeS7mu
         reHjzXYGp7vZDEB3M7QDSfdQBssljyNj0UfiVTBa/4LEtT7sOs7xXF4kcEMzsXvNQtNg
         NYoFURLEnX0v+AvxD9MV+kzBQMPbnkvbuuzK0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fQPEnxEYqQKv2J8jDt8sM4BsZoYJJo7zFPvtZvyCIgk=;
        b=Mjv/EibsMxr2Kax+dKmKkuU3ymxo9uS/IedY3oLT8ifGcFZXsEKldaD1oKiLB7E1h9
         hYowYZZLyoLzVF/qLDKZXubUy5/hhzXRbgslHd6+rt5b7CGtOTb1SgqaEcBRcOWuGifd
         y8939G0IZj7+nYV1ajH5adpB/A0+LqHkGf+BBYOXoly/nctpLNZbncsPe/kkvFJjvaBt
         kLgXzHSNX5P7moOKHc1WP5PKu4FwndcgXlSHNRU6hfhU8b4Ux6OPHGcQn/QRF79g/ntg
         CWRxfKBq3OXfQPfiI8fW8/D/Jw69muMiLNQwyvoShPn5TpkqIPcJiqKdcwqvhWbPfdjY
         IDzA==
X-Gm-Message-State: APjAAAXHxmgyvXd6X4V/kft4Vhwn9iAuNIWedzIXYFVNAGMD9J6GBKks
        a9Xx5X0iKoJtft+6WmGfrXzDLQ==
X-Google-Smtp-Source: APXvYqxd8JJX/yJEscJ9jPCi0Hv0aT+HkJGkpNetjAHaTZgfz4jNcf9P6XVCoMR6bZ8KjTNnxvy9xg==
X-Received: by 2002:a17:902:8604:: with SMTP id f4mr768399plo.278.1582824416320;
        Thu, 27 Feb 2020 09:26:56 -0800 (PST)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id p18sm11436922pjo.3.2020.02.27.09.26.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Feb 2020 09:26:55 -0800 (PST)
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
Subject: [PATCH v3] arm64: dts: sc7180: Move venus node to the correct position
Date:   Thu, 27 Feb 2020 09:26:52 -0800
Message-Id: <20200227092649.v3.1.I15e0f7eff0c67a2b49d4992f9d80fc1d2fdadf63@changeid>
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

Changes in v3:
- actually insert the venus node after usb@a6f8800 and not just
  pretend to do it

Changes in v2:
- insert the venus node *after* the usb@a6f8800 node, not before

 arch/arm64/boot/dts/qcom/sc7180.dtsi | 52 ++++++++++++++--------------
 1 file changed, 26 insertions(+), 26 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 253274d5f04cb..31bf210f2e0b1 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -1376,6 +1376,32 @@ usb_1_dwc3: dwc3@a600000 {
 			};
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
 		videocc: clock-controller@ab00000 {
 			compatible = "qcom,sc7180-videocc";
 			reg = <0 0x0ab00000 0 0x10000>;
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

