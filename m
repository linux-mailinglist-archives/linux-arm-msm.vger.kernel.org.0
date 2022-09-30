Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D70915F0ECB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Sep 2022 17:28:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230152AbiI3P1e (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Sep 2022 11:27:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231660AbiI3P10 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Sep 2022 11:27:26 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99AA9182759
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 08:27:24 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id c24so4274138plo.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 08:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=JHh+MG4OU/+wjbCiWOKQq0gX7ZmA4UN476SmJdYV9kg=;
        b=YMAk24HUwNDxL3bDEN2dhyiKOJkUb+QU/ozy8e8WuG8m7jPZmIDYzmZoXIpD3/Uo4W
         pU2fqD7yefm417C9jv6Hk4Jr5v02ZEfL0kQ2FGgsF9RUJO83N1YYTW+EvLbYPF39Eg1s
         Enkg+F4vL4NQDfD3blZle+Pp4azJL79HTDgvA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=JHh+MG4OU/+wjbCiWOKQq0gX7ZmA4UN476SmJdYV9kg=;
        b=Q9FDwtydccdRP95HP4kp2UZeflU1RWT/iieybeE8ckcBej4fbHgrJnsx5+/LPt14HX
         ebyoPmw+znmE1e3WVx7qxrfgg4XBGz4qyR1Xlz1zxXBuMD+4017eNUHQB9KR8wRMeP1N
         BHLZ9rvuezp2S/nl1cYs07TYpcbwq7d5CGHUJ/Ngag5oevHSDjvpW4lSuJHXdQDlYP+K
         2DihazIdg5ogMrCfv8bDNiNxv7Wq5nYiFA7dh0TSPPlP4LbCiD93fB+OM/XnxS46j+HA
         2g4wv+dI8i46CCkeV/OBLUSRs8l6DLSeH2+2BAqduEGOyrKgu27T9ZgyBy0gq8IecKE6
         WM9g==
X-Gm-Message-State: ACrzQf2HOV7JRZyv4aQHi1fBAhgKiBccbkQKjGxRsENvzudi0Se2Rmws
        A9v+H8fju97Z+1c/nmo2/NrhDA==
X-Google-Smtp-Source: AMsMyM7OIId8/h7z8OZQSkUBPgMd27urLwUNGJTOim1jBxhYL6adp0bUtqhq+TeRjDMUSxukM41YSA==
X-Received: by 2002:a17:902:d3c6:b0:178:37e0:2e72 with SMTP id w6-20020a170902d3c600b0017837e02e72mr9452877plb.28.1664551644141;
        Fri, 30 Sep 2022 08:27:24 -0700 (PDT)
Received: from judyhsiao0523.c.googlers.com.com (21.160.199.104.bc.googleusercontent.com. [104.199.160.21])
        by smtp.gmail.com with ESMTPSA id o9-20020a170902d4c900b0016dbdf7b97bsm2006133plg.266.2022.09.30.08.27.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Sep 2022 08:27:23 -0700 (PDT)
From:   Judy Hsiao <judyhsiao@chromium.org>
To:     bjorn.andersson@linaro.org
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        dianders@chromium.org, mka@chromium.org, cychiang@google.com,
        judyhsiao@google.com, swboyd@chromium.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Judy Hsiao <judyhsiao@chromium.org>
Subject: [PATCH v5 2/3] arm64: dts: qcom: sc7280: Add sc7280-herobrine-audio-rt5682.dtsi
Date:   Fri, 30 Sep 2022 15:26:12 +0000
Message-Id: <20220930152613.2018360-3-judyhsiao@chromium.org>
X-Mailer: git-send-email 2.38.0.rc1.362.ged0d419d3c-goog
In-Reply-To: <20220930152613.2018360-1-judyhsiao@chromium.org>
References: <20220930152613.2018360-1-judyhsiao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
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
 .../qcom/sc7280-herobrine-audio-rt5682.dtsi   | 122 ++++++++++++++++++
 1 file changed, 122 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sc7280-herobrine-audio-rt5682.dtsi

diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-audio-rt5682.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine-audio-rt5682.dtsi
new file mode 100644
index 000000000000..2dbdeeb29ece
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-audio-rt5682.dtsi
@@ -0,0 +1,122 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ *
+ * This file defines the common audio settings for the child boards
+ * using rt5682 codec.
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
+	pinctrl-0 = <&mi2s0_data0>, <&mi2s0_data1>, <&mi2s0_mclk>, <&mi2s0_sclk>, <&mi2s0_ws>,
+			<&mi2s1_data0>, <&mi2s1_sclk>, <&mi2s1_ws>;
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
2.37.3.998.g577e59143f-goog

