Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A479F679F22
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jan 2023 17:46:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233508AbjAXQqZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Jan 2023 11:46:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233842AbjAXQqY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Jan 2023 11:46:24 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EE69124
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jan 2023 08:46:22 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id rl14so37303656ejb.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jan 2023 08:46:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6anXkQhWREYZ7Z+wwNJ+N2b9GEDIU27Fd9BJKH3olz8=;
        b=hmUF4NSx9DwWxuh+5qY9qu3vXkC9Su3E5becp0tyPpN837yiIcN4xF42l8Bf4EEa+9
         SliZMm3HRDA1+eTeu7GZ4KWp5fUs7cXQaHAXQ6AHNcV8/oUvm105igX8pi2S7TV2IKJI
         19lNuuJLGhcM+bb33fpMMZYTlJMyGXOZdLPMj7KJWC5laC3MetrRsawI6Rfwfa5dEqDa
         znzpUabGpsI23R942mnNAAzKZ/RXjAoCWqyFJw6/KKGNOqhBSFiQWCGEqFZuFqPs/zM1
         Z7TJu49nnNuTH+dX2xkLms84mXSOU7YTKNP1Uw87AQLGIQKBNmTBPvcBdnfPmPJvj6d/
         Hi7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6anXkQhWREYZ7Z+wwNJ+N2b9GEDIU27Fd9BJKH3olz8=;
        b=r2YE9TJujf+1Hx2Y9Baqr3ZONlam2NHkyYsXKhGDWf2SY0XtDj+iqmyOgN/Qc0lxlK
         MqqYpxbufdvOjvWzr1sZj82n0hPeDVRmAA19b8Zdls43Ez2f3HHec1i8/rzycEtjHJuj
         I4XyHflyLfhUUMwT9dko4G2Cefm2+iSud3YMnYETmuZ1L4vjrziioRfFHg7UJWz3FGI0
         TBP4BCOqvuw2ipd+Xzj398PwQwLpDqQvc2KdjqQThOeITVA5+Wmh6tQhSTQO1ULZrVBy
         CnqzAlxrl+Ev77xp+G8gsveRBCs8mcmQf5x9MLx9l56u+oB5ZlsJ1dmO8p28F3Ks88Pg
         zDiw==
X-Gm-Message-State: AFqh2krjxT8hInvVQuG9tzM0DCc9g69HRHG0MD6rmPqVMUoi+HQOqhdY
        dne7Jh/9NFUTgc6+ndCCw2zpQ7uqlDiFXFO9
X-Google-Smtp-Source: AMrXdXv1OwKIofcJpXz1pJ4NeedVbdQbdmtmeO818Cw3ayAERbgGVzTc74MxKGKJhhgeQ5+iF2R27Q==
X-Received: by 2002:a17:906:b30f:b0:838:9c66:cd2f with SMTP id n15-20020a170906b30f00b008389c66cd2fmr31112589ejz.74.1674578780819;
        Tue, 24 Jan 2023 08:46:20 -0800 (PST)
Received: from localhost.localdomain (abyl109.neoplus.adsl.tpnet.pl. [83.9.31.109])
        by smtp.gmail.com with ESMTPSA id l4-20020a170906078400b008711cab8875sm1108506ejc.216.2023.01.24.08.46.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 08:46:20 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: sm8250: Disable wsamacro and swr0 by default
Date:   Tue, 24 Jan 2023 17:46:16 +0100
Message-Id: <20230124164616.228619-1-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
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

They are not used on all boards, so disable them by default.
Enable them back on MTP/RB5, which were the only current users.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 6 ++++++
 arch/arm64/boot/dts/qcom/sm8250-mtp.dts  | 6 ++++++
 arch/arm64/boot/dts/qcom/sm8250.dtsi     | 4 ++++
 3 files changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
index 8c64cb060e21..6802d36fb20c 100644
--- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
+++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
@@ -1007,6 +1007,8 @@ can@0 {
 };
 
 &swr0 {
+	status = "okay";
+
 	left_spkr: speaker@0,3 {
 		compatible = "sdw10217211000";
 		reg = <0 3>;
@@ -1322,6 +1324,10 @@ &venus {
 	status = "okay";
 };
 
+&wsamacro {
+	status = "okay";
+};
+
 /* PINCTRL - additions to nodes defined in sm8250.dtsi */
 &qup_spi0_cs_gpio {
 	drive-strength = <6>;
diff --git a/arch/arm64/boot/dts/qcom/sm8250-mtp.dts b/arch/arm64/boot/dts/qcom/sm8250-mtp.dts
index 0991b34a8e49..c0d83fa9a73b 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-mtp.dts
@@ -759,6 +759,8 @@ codec {
 };
 
 &swr0 {
+	status = "okay";
+
 	left_spkr: speaker@0,3 {
 		compatible = "sdw10217211000";
 		reg = <0 3>;
@@ -892,3 +894,7 @@ &usb_2_qmpphy {
 &venus {
 	status = "okay";
 };
+
+&wsamacro {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 95f1a6afcd43..a0ba166f89d8 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -2277,6 +2277,8 @@ wsamacro: codec@3240000 {
 
 			pinctrl-names = "default";
 			pinctrl-0 = <&wsa_swr_active>;
+
+			status = "disabled";
 		};
 
 		swr0: soundwire-controller@3250000 {
@@ -2297,6 +2299,8 @@ swr0: soundwire-controller@3250000 {
 			#sound-dai-cells = <1>;
 			#address-cells = <2>;
 			#size-cells = <0>;
+
+			status = "disabled";
 		};
 
 		audiocc: clock-controller@3300000 {
-- 
2.39.1

