Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49A6E5744EA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Jul 2022 08:12:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233069AbiGNGMX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Jul 2022 02:12:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234296AbiGNGMU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Jul 2022 02:12:20 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA2A031901
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Jul 2022 23:12:16 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id z12-20020a17090a7b8c00b001ef84000b8bso7416600pjc.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Jul 2022 23:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zLOmIzqk+HGBt1D+cGUfV9piUY0n5kXmvXhCjDJwhFA=;
        b=Nn8vsShLjzWBkXRdXuO/W8yt26Kxjfc8AM569i9B6KkJgYJ10d7/dbXpVdo21lUClK
         By+y26gVhL9Jbdnytfh1hCRYWPUfWMwFxSlihY+AV4AY5wIEmLcMukpwzPxQXt0fjxER
         uoAib4YO47uDyjxuRNOYvl3FEwrjUWLPUt0tI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zLOmIzqk+HGBt1D+cGUfV9piUY0n5kXmvXhCjDJwhFA=;
        b=z0Gpg52mh531SiZaK42kfM+Pjds3V/dPDzjHue7ET0fGA4m7aIjqOGbigx3Iv+iyNM
         /OfDJgJGnApz4V/YPuMqfxuoXbnSZkQ7ZFL4EoNGvZYIXeG4j32RBD/TiuUySPS3tQnN
         xsu2gIFhKsHdtrHD560a1SzzxXh1pexkmOWiYCEvYvYJjXduIMghZY7QGIfxdtm5Yknl
         jenVnMXsst2Jxv1/m/aNS9YBj42SfvOC64Bfzog3jJtglKZ2nDJRWgWl7HHWOvEL/0se
         mgBDfzS/sUdet/yvbjKs4lVVZT/YQ8zRANtRkNQo0MJEQpq4p2kak6qPP+Hc3k9k0HOE
         IC0Q==
X-Gm-Message-State: AJIora/hqVn2YYxsxETQlya/il5UO+yFhv9NcYCFu6tyyniZovK48o/M
        hawl4JiErmjMs97TC2uD3flv7w==
X-Google-Smtp-Source: AGRyM1seML2C6cExQXr/yx9Kz5AE8FNTtpnbRBYUZah3TZh/OgFOlrjAABXtZQVPMVW3CR249ci2mg==
X-Received: by 2002:a17:903:1108:b0:168:fa61:1456 with SMTP id n8-20020a170903110800b00168fa611456mr7157115plh.162.1657779136504;
        Wed, 13 Jul 2022 23:12:16 -0700 (PDT)
Received: from judyhsiao0523.c.googlers.com.com (0.223.81.34.bc.googleusercontent.com. [34.81.223.0])
        by smtp.gmail.com with ESMTPSA id j10-20020a170902690a00b0016a17da4ad4sm509683plk.39.2022.07.13.23.12.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jul 2022 23:12:15 -0700 (PDT)
From:   Judy Hsiao <judyhsiao@chromium.org>
To:     Andy Gross <agross@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        dianders@chromium.org, mka@chromium.org, cychiang@google.com,
        judyhsiao@google.com, swboyd@chromium.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Judy Hsiao <judyhsiao@chromium.org>
Subject: [PATCH v1 2/3] arm64: dts: qcom: sc7280: Add sc7280-herobrine-audio-rt5682.dtsi
Date:   Thu, 14 Jul 2022 06:11:50 +0000
Message-Id: <20220714061151.2126288-3-judyhsiao@chromium.org>
X-Mailer: git-send-email 2.37.0.144.g8ac04bfd2-goog
In-Reply-To: <20220714061151.2126288-1-judyhsiao@chromium.org>
References: <20220714061151.2126288-1-judyhsiao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Audio dtsi for sc7280 boards that using rt5682 headset codec:
1. Add dt nodes for sound card which use I2S playback and record
   through rt5682s and I2S playback through max98357a.
2. Enable lpass cpu node and add pin control and dai-links.

Signed-off-by: Judy Hsiao <judyhsiao@chromium.org>
Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>

---
 .../qcom/sc7280-herobrine-audio-rt5682.dtsi   | 121 ++++++++++++++++++
 1 file changed, 121 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sc7280-herobrine-audio-rt5682.dtsi

diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-audio-rt5682.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine-audio-rt5682.dtsi
new file mode 100644
index 000000000000..ec8f2e555a14
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-audio-rt5682.dtsi
@@ -0,0 +1,121 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ *
+ * This file defines the common audio settings for the child boards using rt5682 codec.
+ *
+ * Copyright 2022 Google LLC.
+ */
+
+/ {
+	/* BOARD-SPECIFIC TOP LEVEL NODES */
+	sound: sound {
+		compatible = "google,sc7280-herobrine";
+		model = "sc7280-rt5682-max98360a-1mic";
+
+		status = "okay";
+		audio-routing =
+			"Headphone Jack", "HPOL",
+			"Headphone Jack", "HPOR";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		dai-link@0 {
+			link-name = "MAX98360";
+			reg = <0>;
+
+			cpu {
+				sound-dai = <&lpass_cpu MI2S_SECONDARY>;
+			};
+
+			codec {
+				sound-dai = <&max98360a>;
+			};
+		};
+
+		dai-link@1 {
+			link-name = "ALC5682";
+			reg = <1>;
+
+			cpu {
+				sound-dai = <&lpass_cpu MI2S_PRIMARY>;
+			};
+
+			codec {
+				sound-dai = <&alc5682 0 /* aif1 */>;
+			};
+		};
+	};
+};
+
+hp_i2c: &i2c2 {
+	status = "okay";
+	clock-frequency = <400000>;
+
+	alc5682: codec@1a {
+		compatible = "realtek,rt5682s";
+		reg = <0x1a>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&hp_irq>;
+
+		#sound-dai-cells = <1>;
+
+		interrupt-parent = <&tlmm>;
+		interrupts = <101 IRQ_TYPE_EDGE_BOTH>;
+
+		AVDD-supply = <&pp1800_alc5682>;
+		MICVDD-supply = <&pp3300_codec>;
+
+		realtek,dmic1-data-pin = <1>;
+		realtek,dmic1-clk-pin = <2>;
+		realtek,jd-src = <1>;
+		realtek,dmic-clk-rate-hz = <2048000>;
+	};
+};
+
+&lpass_cpu {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&mi2s0_data0 &mi2s0_data1 &mi2s0_mclk &mi2s0_sclk &mi2s0_ws
+		     &mi2s1_data0 &mi2s1_sclk &mi2s1_ws>;
+
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	dai-link@0 {
+		reg = <MI2S_PRIMARY>;
+		qcom,playback-sd-lines = <1>;
+		qcom,capture-sd-lines = <0>;
+	};
+
+	dai-link@1 {
+		reg = <MI2S_SECONDARY>;
+		qcom,playback-sd-lines = <0>;
+	};
+};
+
+&mi2s0_data0 {
+	drive-strength = <6>;
+	bias-disable;
+};
+
+&mi2s0_data1 {
+	drive-strength = <6>;
+	bias-disable;
+};
+
+&mi2s0_mclk {
+	drive-strength = <6>;
+	bias-disable;
+};
+
+&mi2s0_sclk {
+	drive-strength = <6>;
+	bias-disable;
+};
+
+&mi2s0_ws {
+	drive-strength = <6>;
+	bias-disable;
+};
-- 
2.37.0.144.g8ac04bfd2-goog

