Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB00E658BAD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Dec 2022 11:27:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230320AbiL2K1U (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Dec 2022 05:27:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230287AbiL2K1T (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Dec 2022 05:27:19 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0809226
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Dec 2022 02:27:17 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id bf43so26953109lfb.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Dec 2022 02:27:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ft7gGGKwhqy6onxKMBZrC3Z+780qIINlP0uOCJFvFlc=;
        b=BUXFyO9S9rpPnApfWejJZqSDcBv0h0435eJWDScbk4Z4pvN8iIQGRQy9Ow/alISZhv
         PzROq82Klz9gs8abq7ikGqttVZD8aBscpDMStUPcJmDZs/haNf3v+8xbYtp+pkwHUobS
         Vem7UgxP+YVUJVojU42F7lY1FWk62Qxnl0oUqRmnalRbcvXtYr1A41NGmQFybTd3MXzk
         Jag5nDdoT3FyXKOdIAYK1r1iaOvbIWXcX9UVy5/fJMVMhgYW/R0R7oc1UDtboQh/nqWs
         1oPTbnYl2R7tktw0O2V/gd7O3KXNhwwm1uT8eNjSkAKOYT0LmBvYE0QFzqXlvzOWkiB/
         2gQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ft7gGGKwhqy6onxKMBZrC3Z+780qIINlP0uOCJFvFlc=;
        b=5SBENyI6eGKv+0OjKpPlB2+E2AgKE2MCozzCpv491xI/QPcMCKJGTrc61iLbQ+sOrz
         BwB/nPreWYw7a8XcqgjzgYUegwD0Gbta/nPNjfZqCFOMvJoI8TnURIGbmVPsHufunjJ8
         xtaTv4C8NQ/CMrhrl6VSCes2D4MefXh1TEMkOVlXW1xR41Hq6PGGAjIRi4VLIv29QgL5
         9xcVzwq0XNNOe5IL3v52h5qK8V9/w8j0wdKafVrjTGkJs6XhprVvmK2cIYO3S0vTwZL1
         Qwf7QBzCZ1MkvXgAR+X61n7zql13iRuAFhnZKTnJGXiQonqdHFHMPiL4H05ypHx/YBnT
         89tw==
X-Gm-Message-State: AFqh2kqpDp7SXk4VL9iwOVlW3clQ42vp5yZ7amNY2dxzemeairyyBsJY
        QPv+fk00yTux52aOi6xxZmdPbEI5HoSSyWOb
X-Google-Smtp-Source: AMrXdXtamGDUxEsU769t/Ai4KlYzcdY9lVEKhscj/2izanZMSV7WrhEQFXkwbnF909DQnYOtIDcQ9w==
X-Received: by 2002:ac2:538a:0:b0:4cb:17d0:f05e with SMTP id g10-20020ac2538a000000b004cb17d0f05emr1429586lfh.47.1672309635994;
        Thu, 29 Dec 2022 02:27:15 -0800 (PST)
Received: from localhost.localdomain (abyl184.neoplus.adsl.tpnet.pl. [83.9.31.184])
        by smtp.gmail.com with ESMTPSA id f18-20020a056512361200b004cafd1af647sm2416403lfs.129.2022.12.29.02.27.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Dec 2022 02:27:15 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3] arm64: dts: qcom: sm8350-sagami: Rectify GPIO keys
Date:   Thu, 29 Dec 2022 11:27:12 +0100
Message-Id: <20221229102712.983306-1-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

With enough pins set properly, the hardware buttons now also work
like a charm.

Fixes: c2721b0c23d9 ("arm64: dts: qcom: Add support for Xperia 1 III / 5 III")
Tested-by: Marijn Suijten <marijn.suijten@somainline.org> # On Xperia 1 III and Xperia 5 III
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
v2 -> v3:
- Update tags
- gpio-key,wakeup -> wakeup-source

 .../dts/qcom/sm8350-sony-xperia-sagami.dtsi   | 66 ++++++++++++++++++-
 1 file changed, 64 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi b/arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi
index 41c4101ec8f0..8df6ccbedfae 100644
--- a/arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi
@@ -49,7 +49,35 @@ framebuffer: framebuffer@e1000000 {
 	gpio-keys {
 		compatible = "gpio-keys";
 
-		/* For reasons still unknown, GAssist key and Camera Focus/Shutter don't work.. */
+		pinctrl-names = "default";
+		pinctrl-0 = <&focus_n &snapshot_n &vol_down_n &g_assist_n>;
+
+		key-camera-focus {
+			label = "Camera Focus";
+			linux,code = <KEY_CAMERA_FOCUS>;
+			gpios = <&pm8350b_gpios 8 GPIO_ACTIVE_LOW>;
+			debounce-interval = <15>;
+			linux,can-disable;
+			wakeup-source;
+		};
+
+		key-camera-snapshot {
+			label = "Camera Snapshot";
+			linux,code = <KEY_CAMERA>;
+			gpios = <&pm8350b_gpios 5 GPIO_ACTIVE_LOW>;
+			debounce-interval = <15>;
+			linux,can-disable;
+			wakeup-source;
+		};
+
+		key-google-assist {
+			label = "Google Assistant Key";
+			gpios = <&pm8350_gpios 9 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_LEFTMETA>;
+			debounce-interval = <15>;
+			linux,can-disable;
+			wakeup-source;
+		};
 
 		key-vol-down {
 			label = "Volume Down";
@@ -57,7 +85,7 @@ key-vol-down {
 			gpios = <&pmk8350_gpios 3 GPIO_ACTIVE_LOW>;
 			debounce-interval = <15>;
 			linux,can-disable;
-			gpio-key,wakeup;
+			wakeup-source;
 		};
 	};
 
@@ -545,6 +573,32 @@ &pm8350_gpios {
 			  "NC",
 			  "G_ASSIST_N",
 			  "PM8350_OPTION"; /* GPIO_10 */
+
+	g_assist_n: g-assist-n-state {
+		pins = "gpio9";
+		function = "normal";
+		power-source = <1>;
+		bias-pull-up;
+		input-enable;
+	};
+};
+
+&pm8350b_gpios {
+	snapshot_n: snapshot-n-state {
+		pins = "gpio5";
+		function = "normal";
+		power-source = <0>;
+		bias-pull-up;
+		input-enable;
+	};
+
+	focus_n: focus-n-state {
+		pins = "gpio8";
+		function = "normal";
+		power-source = <0>;
+		input-enable;
+		bias-pull-up;
+	};
 };
 
 &pmk8350_gpios {
@@ -552,6 +606,14 @@ &pmk8350_gpios {
 			  "NC",
 			  "VOL_DOWN_N",
 			  "PMK8350_OPTION";
+
+	vol_down_n: vol-down-n-state {
+		pins = "gpio3";
+		function = "normal";
+		power-source = <0>;
+		bias-pull-up;
+		input-enable;
+	};
 };
 
 &pmk8350_rtc {
-- 
2.39.0

