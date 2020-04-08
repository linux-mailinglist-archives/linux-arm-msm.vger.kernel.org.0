Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7884E1A22B3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2020 15:11:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728401AbgDHNLK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Apr 2020 09:11:10 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:39793 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729069AbgDHNKv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Apr 2020 09:10:51 -0400
Received: by mail-wm1-f65.google.com with SMTP id y24so1316319wma.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2020 06:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NlDlRv555GH3IWzPThM2PIkVo5dnbd1J1aXXNjhdRgU=;
        b=aFWPOjD+POZxqE+i+gRicc1Ttn6UlDSIUKWVEXYrw6mfX2v20gZgt82l4KRhjiIe9A
         b7eh6/OF5TAIN8zLoLVxFZu6TXaYtFE7/efNaS8sZKDyPnHEaYTT/n35OdxMY05APuOt
         rlWYwUne8HTx4HnFmTSaPsuQsXqpfgebNO4ZoJARRorQ9DkoYG3cYPagjmaYqCRxy/5p
         rnFMxw1K+6Rzmgrq1DW3Fnq4at0dmmS01p0cbFLJdKNnxjXp8BkfZrycWl7oUXu+s+cK
         d/adjUK3FZcpZfWktEdbNJoad3EocqLejBbg1sRQ265bF0LqSaopWWshBlwmpvodh1TX
         BEag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NlDlRv555GH3IWzPThM2PIkVo5dnbd1J1aXXNjhdRgU=;
        b=dGSRgOg0qS+6ih3s2kOwbvMU5AHWyu37qOtJ9l09GJgPgaqmpUDq8oM/27UWKhaD1j
         Ts3hoUga3nMTwgNWz9j7ta1ctsdy6jWLeO9+0i8P68lxKVGFmFhM8j1OGCX6SMYEowh+
         AOrBh5E060WFzitPkh9cn1quhcgK+TN/6ZrZqxOSEUZYoolloufBRNNNDyxXvLne+BFK
         P4DPuu01nNgjK+zVD2BVf7kaP7YMo0jSaPG2WCO0IE5oaZ3QBy/YTHdR/08jb6fySWLy
         kop6KnVgvPRyTQa/Q6KmGeIpvW3grVeBQXEIl2UL9xPiYe6QvT+G+HA/n4CVr+hNatoZ
         qxOA==
X-Gm-Message-State: AGi0Puayp1B5SWxH9rvyGzzApGPYggWNDvNL9IaGjQNvxx3EYfRp90F2
        twvmeigY6puR4DIs96YCLu0/vw==
X-Google-Smtp-Source: APiQypKFGiJ+gX60BLbUE1LDlC51Duk6XfC5j/frP0y9C+JdDx5KsdFSZwr18YptOjMFQlBlrJHuCg==
X-Received: by 2002:a7b:c1da:: with SMTP id a26mr3107514wmj.125.1586351446839;
        Wed, 08 Apr 2020 06:10:46 -0700 (PDT)
Received: from localhost.localdomain ([37.120.50.78])
        by smtp.gmail.com with ESMTPSA id f4sm18428044wrp.80.2020.04.08.06.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2020 06:10:46 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        catalin.marinas@arm.com, will@kernel.org, shawnguo@kernel.org,
        leoyang.li@nxp.com, Anson.Huang@nxp.com, olof@lixom.net,
        leonard.crestez@nxp.com, geert+renesas@glider.be,
        marcin.juszkiewicz@linaro.org, valentin.schneider@arm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Loic Poulain <loic.poulain@linaro.org>,
        Luca Weiss <luca@z3ntu.xyz>
Cc:     Robert Foss <robert.foss@linaro.org>
Subject: [PATCH v4 1/6] arm64: dts: msm8916: Add i2c-qcom-cci node
Date:   Wed,  8 Apr 2020 15:09:54 +0200
Message-Id: <20200408130959.2717409-2-robert.foss@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200408130959.2717409-1-robert.foss@linaro.org>
References: <20200408130959.2717409-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Loic Poulain <loic.poulain@linaro.org>

The msm8916 CCI controller provides one CCI/I2C bus.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
Signed-off-by: Robert Foss <robert.foss@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
 - Add label to cci node
 - Sort cci node by address
 - Relabel cci0 i2c bus to cci-i2c0

 arch/arm64/boot/dts/qcom/msm8916.dtsi | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index a88a15f2352b..cad0ac482367 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -1603,6 +1603,33 @@ ports {
 		};
 	};
 
+	cci: cci@1b0c000 {
+		compatible = "qcom,msm8916-cci";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x1b0c000 0x1000>;
+		interrupts = <GIC_SPI 50 IRQ_TYPE_EDGE_RISING>;
+		clocks = <&gcc GCC_CAMSS_TOP_AHB_CLK>,
+			<&gcc GCC_CAMSS_CCI_AHB_CLK>,
+			<&gcc GCC_CAMSS_CCI_CLK>,
+			<&gcc GCC_CAMSS_AHB_CLK>;
+		clock-names = "camss_top_ahb", "cci_ahb",
+				  "cci", "camss_ahb";
+		assigned-clocks = <&gcc GCC_CAMSS_CCI_AHB_CLK>,
+				  <&gcc GCC_CAMSS_CCI_CLK>;
+		assigned-clock-rates = <80000000>, <19200000>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&cci0_default>;
+		status = "disabled";
+
+		cci_i2c0: i2c-bus@0 {
+			reg = <0>;
+			clock-frequency = <400000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+	};
+
 	smd {
 		compatible = "qcom,smd";
 
-- 
2.25.1

