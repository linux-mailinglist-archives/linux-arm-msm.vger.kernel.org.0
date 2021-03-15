Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD19733C7DF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Mar 2021 21:40:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233072AbhCOUj5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 Mar 2021 16:39:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232079AbhCOUji (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 Mar 2021 16:39:38 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BF49C06174A
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Mar 2021 13:39:38 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id t37so10364147pga.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Mar 2021 13:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZtuGwStEOfXvAgfVL0zHoimqZC57wamAhyfZnTL94Fc=;
        b=PE6NXZMcKTGVLi5ke8/puqqxCZVv50qW0kFzPJ1iH6iTfX4TXLq5DpJD+D9+tbfYT+
         GJ3eFb/0VXeZX38s5Z0EmGGA+7owM7663eyRGGBTZ7uKBbrFHgjX1+WgbHlEs86sA9Vj
         lRtBpe2Uf5LIXdwILbfzYOLyjtxAAWqnSkbL4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZtuGwStEOfXvAgfVL0zHoimqZC57wamAhyfZnTL94Fc=;
        b=cXG2/cQgtQjfXLPxNmeSmsh24oxj3E6LSJTwCNspf2uxuVsSCVkX8+94C7j8uE1yxi
         E3oEtiX7mzyWrYC/Is56R/6z89Zy1LWJmuyey1Sk27o0h4CH3iPdh4kXZ35kBlXT7F0m
         J9TjyWV35Dy2KF1KuPI5lKaADwzFS3o7fSEjxzBHCqJmRXII6ImxqGhSTqtptXyvrG0k
         orHDqIupJKItDgW2CFopUX3+e/poezsX6t8XuNh3ldNU7C3wWsPScEQ9odo35sOgXV3O
         llT/2ZLOTOI7Mwb5Tfl4RyYX/EYBYAiQFCHkwg1mwQHch4VXghBBug9JrhNY0zQrPdc/
         oaIQ==
X-Gm-Message-State: AOAM530Zc21LKWZA+n+U54nRsdlcUmWDkL6s9E0IjVCc+xerimFGOzY4
        u33NT5ucm+9WwgOCntoBNG8kqw==
X-Google-Smtp-Source: ABdhPJw/eSfGAWemEM9omD6B7IpcXhOOIZi9CtYkk6oEd1PXAInWviC8YHwGdm9aj6tjL3botHBZaQ==
X-Received: by 2002:a63:4848:: with SMTP id x8mr728983pgk.447.1615840778175;
        Mon, 15 Mar 2021 13:39:38 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:14ce:2d12:6a1f:f42])
        by smtp.gmail.com with ESMTPSA id bb24sm510619pjb.5.2021.03.15.13.39.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Mar 2021 13:39:37 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Douglas Anderson <dianders@chromium.org>,
        Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        Ajit Pandey <ajitp@codeaurora.org>,
        Judy Hsiao <judyhsiao@chromium.org>,
        Cheng-Yi Chiang <cychiang@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] arm64: dts: qcom: Add "dmic_clk_en" for sc7180-trogdor-coachz
Date:   Mon, 15 Mar 2021 13:39:30 -0700
Message-Id: <20210315133924.v2.1.I601a051cad7cfd0923e55b69ef7e5748910a6096@changeid>
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This was present downstream. Add upstream too. NOTE: upstream I
managed to get some sort of halfway state and got one pinctrl entry in
the coachz-r1 device tree. Remove that as part of this since it's now
in the dtsi.

Cc: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Cc: Ajit Pandey <ajitp@codeaurora.org>
Cc: Judy Hsiao <judyhsiao@chromium.org>
Cc: Cheng-Yi Chiang <cychiang@chromium.org>
Cc: Stephen Boyd <swboyd@chromium.org>
Cc: Matthias Kaehlcke <mka@chromium.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
This applies atop the patch ("arm64: dts: qcom: Add sound node for
sc7180-trogdor-coachz") [1].

NOTE: downstream this property was present in each of the board
revisions. There's actually no longer any reason for this and I'll
shortly post a downstream patch to fix this.

[1] https://lore.kernel.org/r/20210313054654.11693-3-srivasam@codeaurora.org/

Changes in v2:
- Remove the pinctrl from the -r1

 .../boot/dts/qcom/sc7180-trogdor-coachz-r1.dts   | 13 -------------
 .../boot/dts/qcom/sc7180-trogdor-coachz.dtsi     | 16 ++++++++++++++++
 2 files changed, 16 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dts
index 86619f6c1134..1b1dbdb2a82f 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dts
@@ -138,17 +138,4 @@ &tlmm {
 			  "AP_TS_PEN_I2C_SCL",
 			  "DP_HOT_PLUG_DET",
 			  "EC_IN_RW_ODL";
-
-	dmic_clk_en: dmic_clk_en {
-		pinmux {
-			pins = "gpio83";
-			function = "gpio";
-		};
-
-		pinconf {
-			pins = "gpio83";
-			drive-strength = <8>;
-			bias-pull-up;
-		};
-	};
 };
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi
index e2ffe71c2d52..4c6e433c8226 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi
@@ -93,6 +93,9 @@ &sound {
 	compatible = "google,sc7180-coachz";
 	model = "sc7180-adau7002-max98357a";
 	audio-routing = "PDM_DAT", "DMIC";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&dmic_clk_en>;
 };
 
 &sound_multimedia0_codec {
@@ -247,4 +250,17 @@ &tlmm {
 			  "AP_TS_PEN_I2C_SCL",
 			  "DP_HOT_PLUG_DET",
 			  "EC_IN_RW_ODL";
+
+	dmic_clk_en: dmic_clk_en {
+		pinmux {
+			pins = "gpio83";
+			function = "gpio";
+		};
+
+		pinconf {
+			pins = "gpio83";
+			drive-strength = <8>;
+			bias-pull-up;
+		};
+	};
 };
-- 
2.31.0.rc2.261.g7f71774620-goog

