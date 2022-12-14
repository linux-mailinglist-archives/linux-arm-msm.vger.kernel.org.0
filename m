Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BFE8364CEA7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Dec 2022 18:12:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237684AbiLNRMw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Dec 2022 12:12:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237525AbiLNRMu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Dec 2022 12:12:50 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F25F2656A
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Dec 2022 09:12:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1671037920;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=A4t1D4tXBAIgEtpKIXuYcJZLp0CgcR2xNILD0s4VGW0=;
        b=jD23NQBWJB7jjlumdA81yQiYH1pPUhAE0aLN9lDothgAumWcPKtEffAKWlRTAKew45untI
        7TjJ6PbGYun0+F3RK1mFxyJqZNaPwLvBA3a+JF3SNt/6pmfq+wf7XU1yYl0vgEMznouyk4
        CdY0dD+v+Uf+sD3L3wKDd3fFH7vbl1o=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-395-0cPhunj6MHWP0da_Rz-DxQ-1; Wed, 14 Dec 2022 12:11:59 -0500
X-MC-Unique: 0cPhunj6MHWP0da_Rz-DxQ-1
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-410f1a84ed2so4202527b3.15
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Dec 2022 09:11:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A4t1D4tXBAIgEtpKIXuYcJZLp0CgcR2xNILD0s4VGW0=;
        b=q74rxTSSWpuoL0L9+rNK9I48VIUqIHkeT95BV13yJ9JUxUS92m8MamHwhQsfpjJRQq
         IIlCGIbcc7KL14N4CSJ3CoCd3zFYktKPY4kK4iU58xaU4psik3fgMUifsXmGuLL5xrlD
         AQ8Lfgm5N3N46k7fj5JucivDzG9FQk7eWT5yDKGl3cCnZFBAw92CmDzATjxGD7k0ywj4
         Kb7ARBf3wAWkQEFlJDatqaS4Ysuk/zwW14JI8fXq8UYB9jxtYrKwuqhfUmOIFITSnTek
         GaSJSVOMfUUP/NtOmE7YYjoy896deBY067Ln5fwKQ9HweimLxxa8hX3n+bdms9SqSGNV
         2COA==
X-Gm-Message-State: ANoB5pm82US4C7dgDJlQULp0Fwz6Gp7w/M6sB5YIUJrgjwL5Dgu3Fkjp
        3pcFdiBwJQ7QMMWauMBN/drpquMpxoA9O1mdzzegOdJx7ITCBrh5dthlj+x0MxDOTzFy2nC3Mqo
        +YzImQegtJ3iyul2EvdhLWCkoUQ==
X-Received: by 2002:a25:cac2:0:b0:714:446:3671 with SMTP id a185-20020a25cac2000000b0071404463671mr22802380ybg.36.1671037918931;
        Wed, 14 Dec 2022 09:11:58 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7D6qoj5A4VtE01xgKeZX00elQ7voZQgb6gJgOZ/RzZzgkSyBN4/HLbWyfthjqV7037e4oDGA==
X-Received: by 2002:a25:cac2:0:b0:714:446:3671 with SMTP id a185-20020a25cac2000000b0071404463671mr22802353ybg.36.1671037918674;
        Wed, 14 Dec 2022 09:11:58 -0800 (PST)
Received: from x1.redhat.com (c-73-214-169-22.hsd1.pa.comcast.net. [73.214.169.22])
        by smtp.gmail.com with ESMTPSA id t30-20020a37ea1e000000b006eef13ef4c8sm10305477qkj.94.2022.12.14.09.11.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Dec 2022 09:11:57 -0800 (PST)
From:   Brian Masney <bmasney@redhat.com>
To:     andersson@kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc:     quic_shazhuss@quicinc.com, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, johan+linaro@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ahalaney@redhat.com,
        echanude@redhat.com
Subject: [PATCH v2 1/7] arm64: dts: qcom: sc8280xp: rename qup2_uart17 to uart17
Date:   Wed, 14 Dec 2022 12:11:39 -0500
Message-Id: <20221214171145.2913557-2-bmasney@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221214171145.2913557-1-bmasney@redhat.com>
References: <20221214171145.2913557-1-bmasney@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
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
---
This is a new patch that's introduced in v2.

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

