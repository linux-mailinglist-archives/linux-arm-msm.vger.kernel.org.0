Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 621D7F2697
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2019 05:33:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733152AbfKGEdp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Nov 2019 23:33:45 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:40004 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727279AbfKGEdp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Nov 2019 23:33:45 -0500
Received: by mail-pl1-f194.google.com with SMTP id e3so548981plt.7;
        Wed, 06 Nov 2019 20:33:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=WGFqHVbK1SfENXofL3oDwndtYsDfptUfRJZYF1mpT5k=;
        b=UJzQf/fTNaLBclIKMN3E2ogMM6IA1yL3zApsm5XIu33j8J/CdaDWqobIs/lYuH+yUg
         LeUfuGjMLjpZRqB3kOAJRPMhTxxpwOXgL2m7n3glqriMi+60kiOBzMbBw2IC/wicUBsC
         XU5d+s6DsZt3keCMCF9hzY5Vh2nhUlNmjDDpMoDpFmH9/rmVBc+TG5HaykHjgkhL6WpC
         R6GGEM+e4fIF96pCl7Ay4/lUiai3+Bu+UFqTrJtCs4YuaDZVlVHkLCw9rq0//upCKq53
         yjYe3ZvOK26cvU36wV1KsYcdgrnQlnwqi2kaKpInr17dezRIZAKSx8KGtj18NnV0AHeB
         MuEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=WGFqHVbK1SfENXofL3oDwndtYsDfptUfRJZYF1mpT5k=;
        b=ggJpB3DyZ3G9kPhDr5F5l04q6J9nXl1ywa5rHYIGgd4pkU6EXB5HXSbTJsmAGjSnKH
         muYwRAC1AwvC0Qdu7lGRb1TtQueFj5wySLwZ7PXLsb2EdR2RQNnStky5J+E29Dd/aWNZ
         PjDCosxUVFc0y9+QdY9m8CjIfUS1qWlLDW77hyA5KFRVfrEdvnFr4eJDEitPWBDOocSn
         pPh3ypUOJJeNIOu/sNU7CGgYA8choxJppLKqec3WCBfKcsX8c2yCY0rDxdKW24tRKbbK
         9Av3YwhB5ku9Fkhlmuxx435p6YPeFMpGzGofu4hzS5p3wEHVh/1wMFIeOZNa4P+H4CcY
         wH2w==
X-Gm-Message-State: APjAAAWa4q2tqffsdVY1kBYEaZBAj+JyUUsf/O5IRVNM+9rq3jtOS/Em
        mr0oP4QVnJuEc+eMClXRQMw=
X-Google-Smtp-Source: APXvYqymJu8QOi3PbALe/ALDO0m2ctz1BVzVAFa9xo8MYft/YaykeD5BRJmMUse7od3Jzo6tXkxzTw==
X-Received: by 2002:a17:902:4e:: with SMTP id 72mr1549152pla.270.1573101224534;
        Wed, 06 Nov 2019 20:33:44 -0800 (PST)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id r22sm737524pfg.54.2019.11.06.20.33.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2019 20:33:44 -0800 (PST)
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To:     agross@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH 2/2] arm64: dts: qcom: msm8998: Add wifi node
Date:   Wed,  6 Nov 2019 20:33:13 -0800
Message-Id: <20191107043313.4055-3-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191107043313.4055-1-jeffrey.l.hugo@gmail.com>
References: <20191107043313.4055-1-jeffrey.l.hugo@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the wifi node and required reserved memory to enable the wlan
hardware.  Enable the wifi node in both the mtp and clamshell platforms
after adding the relevant regulators for each platform.

Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
---
 .../boot/dts/qcom/msm8998-clamshell.dtsi      |  9 ++++++
 arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi     |  9 ++++++
 arch/arm64/boot/dts/qcom/msm8998.dtsi         | 31 +++++++++++++++++++
 3 files changed, 49 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8998-clamshell.dtsi b/arch/arm64/boot/dts/qcom/msm8998-clamshell.dtsi
index 6138b58db6d2..0f84fa0894a4 100644
--- a/arch/arm64/boot/dts/qcom/msm8998-clamshell.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998-clamshell.dtsi
@@ -292,3 +292,12 @@
 	vdda-phy-supply = <&vreg_l1a_0p875>;
 	vdda-pll-supply = <&vreg_l2a_1p2>;
 };
+
+&wifi {
+	status = "okay";
+
+	vdd-0.8-cx-mx-supply = <&vreg_l5a_0p8>;
+	vdd-1.8-xo-supply = <&vreg_l7a_1p8>;
+	vdd-1.3-rfa-supply = <&vreg_l17a_1p3>;
+	vdd-3.3-ch0-supply = <&vreg_l25a_3p3>;
+};
diff --git a/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi b/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
index 5f101a20a20a..1220756fb5b3 100644
--- a/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
@@ -364,3 +364,12 @@
 	vdda-phy-supply = <&vreg_l1a_0p875>;
 	vdda-pll-supply = <&vreg_l2a_1p2>;
 };
+
+&wifi {
+	status = "okay";
+
+	vdd-0.8-cx-mx-supply = <&vreg_l5a_0p8>;
+	vdd-1.8-xo-supply = <&vreg_l7a_1p8>;
+	vdd-1.3-rfa-supply = <&vreg_l17a_1p3>;
+	vdd-3.3-ch0-supply = <&vreg_l25a_3p3>;
+};
diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index d5263e4f64ce..e624f0323d23 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -43,6 +43,11 @@
 			no-map;
 		};
 
+		wlan_msa_mem: memory@95700000 {
+			reg = <0x0 0x95700000 0x0 0x100000>;
+			no-map;
+		};
+
 		rmtfs {
 			compatible = "qcom,rmtfs-mem";
 
@@ -1889,6 +1894,32 @@
 			redistributor-stride = <0x0 0x20000>;
 			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
 		};
+
+		wifi: wifi@18800000 {
+			compatible = "qcom,wcn3990-wifi";
+			status = "disabled";
+			reg = <0x18800000 0x800000>;
+			reg-names = "membase";
+			memory-region = <&wlan_msa_mem>;
+			clocks = <&rpmcc RPM_SMD_RF_CLK2_PIN>;
+			clock-names = "cxo_ref_clk_pin";
+			interrupts =
+				<GIC_SPI 413 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 414 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 415 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 416 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 417 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 418 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 420 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 421 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH>;
+			iommus = <&anoc2_smmu 0x1900>,
+				 <&anoc2_smmu 0x1901>;
+			qcom,snoc-host-cap-8bit-quirk;
+		};
 	};
 };
 
-- 
2.17.1

