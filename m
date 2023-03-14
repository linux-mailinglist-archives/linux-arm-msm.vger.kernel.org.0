Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52ED26B89F0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Mar 2023 05:58:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229707AbjCNE6a (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Mar 2023 00:58:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229483AbjCNE63 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Mar 2023 00:58:29 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2867A50F96
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Mar 2023 21:58:26 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id j3so9374780wms.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Mar 2023 21:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678769904;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a2Sinh2U7ZSE8cgzQcOslVc0pkw5JNjtODYOjPT/ggk=;
        b=Gx60z0mzKj1A1AaXOzLWfVAqOC57+Qu2vhXFUhxNzcUHTxn9NuDxFMOk19LIuoWrkx
         DayH9lhzenVrzIdeWr5/O9quW7XVm6QqY3afLa8JAVPGEh7uhIdwEVBvgPJ7I8cntRuE
         k9HaJq3mNTRA6nxkuzWQord/xRHTedahrSGf6qd77rytG9FWoGEG8O4PklLgnAWqmJs1
         NFHNv9q+k0DyyPfPId7vXNdmIhMdM7Zfs092tDtMDzWW90x5rnXGbAl0mu2OTY+nlv8U
         unJQ+bJOY4eyH4tPm8Sojgm5UNP0BkbGut/BZ8Si9hd2rLyievx1//VlpLVqhhu+mj+z
         gN9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678769904;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a2Sinh2U7ZSE8cgzQcOslVc0pkw5JNjtODYOjPT/ggk=;
        b=LvxEy29+lPEiKk3y5keIUuJco2EaAcaSKbDsZWqtHBQrDoVOf1TvwjbKj2Lway6GOb
         F4Xvch+ej1XvYcwVllANRt4eSBjItV1CLLqj6jw3lbmynWZlHuH5ZguDy8n8shcT60iM
         RlPX7j4zpfUXidvFJWvNo5CUI5uZ+iV+5xdX2mlno5YFoqRmPEOdz/XUq6uo4Mq+EvB7
         ZYVJy3FDgsQ2+Z7QuLH87JCgL+fVhofFPme9cVrMOnGGtjDF+rAf0V8qwi7j+6K1TmCY
         DDdU2UsfnaYo96w19xkXQvixzIqI0wWnDA2DU7E2sQ3qibWW73RyU48yso8TbyzEH6Xk
         iF3A==
X-Gm-Message-State: AO0yUKXzFFafd05bN7MZXOWxUBzlQIC+vlaDDww8VFnjGAyj0R9P8NgR
        5OSEaUzK1L1J3dWX/ylM2ULV1g==
X-Google-Smtp-Source: AK7set82+Dr1IU9Q7depCo5R+mYtT2jUbFhtFBAaCD/1aCS6mhhmyLchxQ4bAMEpGbLtce390iXnwA==
X-Received: by 2002:a05:600c:46d3:b0:3ed:2b27:5bcc with SMTP id q19-20020a05600c46d300b003ed2b275bccmr1205409wmo.38.1678769904582;
        Mon, 13 Mar 2023 21:58:24 -0700 (PDT)
Received: from lion.caleb.cas.dev (cpc76484-cwma10-2-0-cust274.7-3.cable.virginm.net. [82.31.201.19])
        by smtp.gmail.com with ESMTPSA id z9-20020a05600c114900b003eae73ee4a1sm1548760wmz.17.2023.03.13.21.58.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 21:58:23 -0700 (PDT)
From:   Caleb Connolly <caleb.connolly@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Caleb Connolly <caleb.connolly@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH 1/2] arm64: dts: qcom: sdm845: add framebuffer reserved memory
Date:   Tue, 14 Mar 2023 04:58:10 +0000
Message-Id: <20230314045812.3673958-1-caleb.connolly@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Almost all of the SDM845 devices actually map the same region for the
continuous splash / framebuffer. de-dup all the devices that specify it
manually and put it in sdm845.dtsi instead.

This now reserves it on the OnePlus 6 where it was not reserved before,
this is intentional.

Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi              | 6 ------
 arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts     | 5 -----
 arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts           | 5 -----
 arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi       | 6 ------
 .../arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi | 6 ------
 arch/arm64/boot/dts/qcom/sdm845.dtsi                        | 5 +++++
 arch/arm64/boot/dts/qcom/sdm850.dtsi                        | 2 ++
 7 files changed, 7 insertions(+), 28 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
index f942c5afea9b..6a1c674a015b 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
@@ -93,12 +93,6 @@ spss_mem: memory@99000000 {
 			no-map;
 		};
 
-		/* Framebuffer region */
-		memory@9d400000 {
-			reg = <0x0 0x9d400000 0x0 0x2400000>;
-			no-map;
-		};
-
 		/* rmtfs lower guard */
 		memory@f0800000 {
 			reg = <0 0xf0800000 0 0x1000>;
diff --git a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
index d37a433130b9..7c2457948a32 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
@@ -55,11 +55,6 @@ vreg_s4a_1p8: pm8998-smps4 {
 	};
 
 	reserved-memory {
-		memory@9d400000 {
-			reg = <0x0 0x9d400000 0x0 0x02400000>;
-			no-map;
-		};
-
 		memory@a1300000 {
 			compatible = "ramoops";
 			reg = <0x0 0xa1300000 0x0 0x100000>;
diff --git a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
index b54e304abf71..4f6b1053c15b 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
@@ -60,11 +60,6 @@ key-vol-up {
 	};
 
 	reserved-memory {
-		framebuffer_region@9d400000 {
-			reg = <0x0 0x9d400000 0x0 (1080 * 2160 * 4)>;
-			no-map;
-		};
-
 		ramoops: ramoops@b0000000 {
 			compatible = "ramoops";
 			reg = <0 0xb0000000 0 0x00400000>;
diff --git a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
index 4984c7496c31..7e273cc0158d 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
@@ -79,12 +79,6 @@ vreg_s4a_1p8: pm8998-smps4 {
 	};
 
 	reserved-memory {
-		/* SONY was cool and didn't diverge from MTP this time, yay! */
-		cont_splash_mem: memory@9d400000 {
-			reg = <0x0 0x9d400000 0x0 0x2400000>;
-			no-map;
-		};
-
 		ramoops@ffc00000 {
 			compatible = "ramoops";
 			reg = <0x0 0xffc00000 0x0 0x100000>;
diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
index e0fda4d754fe..191c2664f721 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
@@ -98,12 +98,6 @@ spss_mem: memory@97f00000 {
 			no-map;
 		};
 
-		/* Cont splash region set up by the bootloader */
-		cont_splash_mem: framebuffer@9d400000 {
-			reg = <0 0x9d400000 0 0x2400000>;
-			no-map;
-		};
-
 		rmtfs_mem: memory@f6301000 {
 			compatible = "qcom,rmtfs-mem";
 			reg = <0 0xf6301000 0 0x200000>;
diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 479859bd8ab3..ecec2ee46683 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -865,6 +865,11 @@ spss_mem: spss@97b00000 {
 			no-map;
 		};
 
+		cont_splash_mem: framebuffer@9d400000 {
+			reg = <0 0x9d400000 0 0x2400000>;
+			no-map;
+		};
+
 		mdata_mem: mpss-metadata {
 			alloc-ranges = <0 0xa0000000 0 0x20000000>;
 			size = <0 0x4000>;
diff --git a/arch/arm64/boot/dts/qcom/sdm850.dtsi b/arch/arm64/boot/dts/qcom/sdm850.dtsi
index da9f6fbe32f6..b787575c77a5 100644
--- a/arch/arm64/boot/dts/qcom/sdm850.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm850.dtsi
@@ -7,6 +7,8 @@
 
 #include "sdm845.dtsi"
 
+/delete-node/ &cont_splash_mem;
+
 &cpu4_opp_table {
 	cpu4_opp33: opp-2841600000 {
 		opp-hz = /bits/ 64 <2841600000>;
-- 
2.39.2

