Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13F296526F4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Dec 2022 20:30:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234022AbiLTT3v (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Dec 2022 14:29:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229958AbiLTT3v (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Dec 2022 14:29:51 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE03118B05
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Dec 2022 11:29:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1671564547;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=BxJkhXJ88Dr+809fXkqOoDAQkFxQM5nGSrXbKhgpBTk=;
        b=EoLH8U1HL37QCAGZnDJQPXj4BBYyravcqgs2DwKBaKrZB0dKLvZV3OVdulIJZUMwYX7mTd
        HjL04WzkfNQAWqyLD0Qa3tI/IdMWA6h8Y/LXWoOFxQnc2kgXX6U3mTygz1o9Xo2tzEZcpl
        5Fk13Gc7gFpv+jhEGiUviz6Qi2a5TmY=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-567-lhOzkA41Pcelbqob6ZL5OA-1; Tue, 20 Dec 2022 14:29:04 -0500
X-MC-Unique: lhOzkA41Pcelbqob6ZL5OA-1
Received: by mail-qk1-f197.google.com with SMTP id w14-20020a05620a424e00b006fc46116f7dso9967381qko.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Dec 2022 11:29:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BxJkhXJ88Dr+809fXkqOoDAQkFxQM5nGSrXbKhgpBTk=;
        b=G0IOcmjxs0VUdCs2nrg8rysH1uKjXQnIAlAPERu2jzOUwKVC2NYj65vqm/tvP98Tu/
         YSgnq1EGsctvnc+Nc85Oun3P9xADgFxc3BDm8ucLtuzWxNAEMn0SCDpBW25IRCZwfNzA
         J3zfNoGG+63L9Te8Q+sFr8i1Ms8clLzHsTphwEVdMJ+sTByuYJ0aDP/vK7QYDnuUkv4O
         1ZUBC8iVOGX1XBz5rz667Avefvc8ThfcDSvS4lI7vPLETKIi9HhCc1c5NXio2/OdM/3m
         AmNKgGNFGBelfI0nqPiIYC/qiSV3bELSv/Y+sb99vvziaA0kN5Q63H7OxmR+IAX/FvFk
         wJYw==
X-Gm-Message-State: ANoB5pmMtPVIOH/78pUc5dx9tYAd4AdYKSwE6W2Bv3azt0tXqQdngtZ4
        yPHciUaSHl8i6m89Jku3ej1M9pwe5egvRf9GS6AZZ2LulC/LHZr5SHzjwmNN8Wi/1efD0qzfPfm
        Dl2bDhsSv3jl8RzOOi6XHdDLsSg==
X-Received: by 2002:ac8:488e:0:b0:3a8:1793:76d6 with SMTP id i14-20020ac8488e000000b003a8179376d6mr41479717qtq.68.1671564544182;
        Tue, 20 Dec 2022 11:29:04 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4Iq0LU3SMOYgbfAr8eLzK6qtHdFB8ucI+2+US/Q0uIkY/W28YmvX5Ej+e+PRnkMQVuSDKIbQ==
X-Received: by 2002:ac8:488e:0:b0:3a8:1793:76d6 with SMTP id i14-20020ac8488e000000b003a8179376d6mr41479695qtq.68.1671564543948;
        Tue, 20 Dec 2022 11:29:03 -0800 (PST)
Received: from x1.redhat.com (c-73-214-169-22.hsd1.pa.comcast.net. [73.214.169.22])
        by smtp.gmail.com with ESMTPSA id gd15-20020a05622a5c0f00b003a82ca4e81csm744348qtb.80.2022.12.20.11.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Dec 2022 11:29:03 -0800 (PST)
From:   Brian Masney <bmasney@redhat.com>
To:     andersson@kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc:     quic_shazhuss@quicinc.com, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, johan+linaro@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ahalaney@redhat.com,
        echanude@redhat.com
Subject: [PATCH v3 1/7] arm64: dts: qcom: sc8280xp: rename qup2_uart17 to uart17
Date:   Tue, 20 Dec 2022 14:28:48 -0500
Message-Id: <20221220192854.521647-2-bmasney@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221220192854.521647-1-bmasney@redhat.com>
References: <20221220192854.521647-1-bmasney@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In preparation for adding the missing SPI and I2C nodes to
sc8280xp.dtsi, it was decided to rename all of the existing qupX_
uart, spi, and i2c nodes to drop the qupX_ prefix. Let's go ahead
and rename qup2_uart17 to uart17. Note that some nodes are moved in the
file by this patch to preserve the expected sort order in the file.

Signed-off-by: Brian Masney <bmasney@redhat.com>
Link: https://lore.kernel.org/lkml/20221212182314.1902632-1-bmasney@redhat.com/
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Changes from v2 to v3:
- Add Konrad's R-b

Patch introduced in v2

 arch/arm64/boot/dts/qcom/sa8295p-adp.dts  | 12 ++++++------
 arch/arm64/boot/dts/qcom/sa8540p-ride.dts | 12 ++++++------
 arch/arm64/boot/dts/qcom/sc8280xp-crd.dts | 14 +++++++-------
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi    |  2 +-
 4 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sa8295p-adp.dts b/arch/arm64/boot/dts/qcom/sa8295p-adp.dts
index 84cb6f3eeb56..61f2e44e70c1 100644
--- a/arch/arm64/boot/dts/qcom/sa8295p-adp.dts
+++ b/arch/arm64/boot/dts/qcom/sa8295p-adp.dts
@@ -17,7 +17,7 @@ / {
 	compatible = "qcom,sa8295p-adp", "qcom,sa8540p";
 
 	aliases {
-		serial0 = &qup2_uart17;
+		serial0 = &uart17;
 	};
 
 	chosen {
@@ -240,11 +240,6 @@ &qup2 {
 	status = "okay";
 };
 
-&qup2_uart17 {
-	compatible = "qcom,geni-debug-uart";
-	status = "okay";
-};
-
 &remoteproc_adsp {
 	firmware-name = "qcom/sa8540p/adsp.mbn";
 	status = "okay";
@@ -338,6 +333,11 @@ pm8450g_gpios: gpio@c000 {
 	};
 };
 
+&uart17 {
+	compatible = "qcom,geni-debug-uart";
+	status = "okay";
+};
+
 &ufs_mem_hc {
 	reset-gpios = <&tlmm 228 GPIO_ACTIVE_LOW>;
 
diff --git a/arch/arm64/boot/dts/qcom/sa8540p-ride.dts b/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
index 21f3ff024910..b6e0db5508c7 100644
--- a/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
+++ b/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
@@ -17,7 +17,7 @@ / {
 	compatible = "qcom,sa8540p-ride", "qcom,sa8540p";
 
 	aliases {
-		serial0 = &qup2_uart17;
+		serial0 = &uart17;
 	};
 
 	chosen {
@@ -192,11 +192,6 @@ &qup2 {
 	status = "okay";
 };
 
-&qup2_uart17 {
-	compatible = "qcom,geni-debug-uart";
-	status = "okay";
-};
-
 &remoteproc_nsp0 {
 	firmware-name = "qcom/sa8540p/cdsp.mbn";
 	status = "okay";
@@ -207,6 +202,11 @@ &remoteproc_nsp1 {
 	status = "okay";
 };
 
+&uart17 {
+	compatible = "qcom,geni-debug-uart";
+	status = "okay";
+};
+
 &ufs_mem_hc {
 	reset-gpios = <&tlmm 228 GPIO_ACTIVE_LOW>;
 
diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
index 551768f97729..db273face248 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
@@ -17,7 +17,7 @@ / {
 	compatible = "qcom,sc8280xp-crd", "qcom,sc8280xp";
 
 	aliases {
-		serial0 = &qup2_uart17;
+		serial0 = &uart17;
 	};
 
 	backlight {
@@ -363,12 +363,6 @@ keyboard@68 {
 	};
 };
 
-&qup2_uart17 {
-	compatible = "qcom,geni-debug-uart";
-
-	status = "okay";
-};
-
 &remoteproc_adsp {
 	firmware-name = "qcom/sc8280xp/qcadsp8280.mbn";
 
@@ -381,6 +375,12 @@ &remoteproc_nsp0 {
 	status = "okay";
 };
 
+&uart17 {
+	compatible = "qcom,geni-debug-uart";
+
+	status = "okay";
+};
+
 &ufs_mem_hc {
 	reset-gpios = <&tlmm 228 GPIO_ACTIVE_LOW>;
 
diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index 109c9d2b684d..951cb1b6fcc4 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -813,7 +813,7 @@ qup2: geniqup@8c0000 {
 
 			status = "disabled";
 
-			qup2_uart17: serial@884000 {
+			uart17: serial@884000 {
 				compatible = "qcom,geni-uart";
 				reg = <0 0x00884000 0 0x4000>;
 				clocks = <&gcc GCC_QUPV3_WRAP2_S1_CLK>;
-- 
2.38.1

