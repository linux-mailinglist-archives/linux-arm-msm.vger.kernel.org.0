Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED7DF607588
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Oct 2022 12:57:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230244AbiJUK5V (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 Oct 2022 06:57:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230208AbiJUK5N (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 Oct 2022 06:57:13 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 257813C8E4
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Oct 2022 03:57:12 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id i3so2221724pfk.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Oct 2022 03:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quanta-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XwU1VZF8+6iJFAuGjdLVREmySRqI+EDvo5yioZX/3UI=;
        b=r5gBS2fsD1++YH1wNtzJF0AfDCDUK8gEMTDVom6HPOh/pvqX5sUCNbZ1HyZlqe+6MM
         apUZcZjl7ZtVfiaB1t6hMXBuT0lAKGxk825LQobHHEPJ3AFS9IIUL6Hn6W5ivEh7EqFw
         mVDGMXStqzjE86yuuih8gxFp+/fek+ErLAh1JQtmAkYPY3AkCW2MlcBEGZ4vA/Zzn+af
         7oCISJaln5kHqnMsNqhMKdbNmXnNxjutQHVWNo5l0iidgauh2j5eUEMCc7VV+f3h/1Kf
         3PIwFl5quethxgr7OOQ8XHDjqwNsBjPC6N2LqYqpjgtFL/hOz75m3lq339CHqbaqE6Pb
         CWdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XwU1VZF8+6iJFAuGjdLVREmySRqI+EDvo5yioZX/3UI=;
        b=DYzgoYu3DjVKS7oNYOn/g4AIIZMtO0X59kDAlfwWQIlJkiR1KrPxRucJZd3JCaTgG8
         M8X7T4uOOycCYW5q78bNJe63ze6NRCRR6p3IJ1xrFxYXR1egUrfFGF+2h6FGzAsfmHo/
         p/6YebFtMtn4clMqktxNQZv88OY5UbAxxaZ19gDbdOhWpjEhvUAVEGCvCqZ1CXUSCfxe
         khcdbBMewsLqYqN1or6VU8oI3j4fUeoUHHcOFNFdXVC43jnFIwjPwM6VQWgu81l4p2ST
         L4xzWFpEXnozja9oH1COE4bLlnoCmKe662aReMDuXFDYLQ1G4smGqfZQBFdqFgNifrps
         4Gvg==
X-Gm-Message-State: ACrzQf3Ydtf8PA1ynp0t8ctlZCiTpumOTF9fYj18Bm6nIAMeLJNQFuDH
        7aL6NJ6m/ZAOj6ohwlTJhIVocUjpfe27Mg==
X-Google-Smtp-Source: AMsMyM7zq0aOY+XkV/Cu34hN7J81Ec6TfMM4pUZSyDrHgcSBRtQsInt2EprzBx8nsAJqT6FDjEZC5A==
X-Received: by 2002:a62:5252:0:b0:562:eef6:402f with SMTP id g79-20020a625252000000b00562eef6402fmr18739943pfb.79.1666349831597;
        Fri, 21 Oct 2022 03:57:11 -0700 (PDT)
Received: from liang-Predator-PH517-52.. (2001-b400-e339-bb7d-a809-3af0-ee98-4fc4.emome-ip6.hinet.net. [2001:b400:e339:bb7d:a809:3af0:ee98:4fc4])
        by smtp.gmail.com with ESMTPSA id 2-20020a620602000000b0052d4cb47339sm14822957pfg.151.2022.10.21.03.57.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Oct 2022 03:57:11 -0700 (PDT)
From:   Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.google.com>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     dianders@chromium.org,
        Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.google.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v8 4/4] arm64: dts: qcom: sc7280: Add touchscreen and touchpad support for evoker
Date:   Fri, 21 Oct 2022 18:56:23 +0800
Message-Id: <20221021185331.v8.4.I3ac715e729f6f9b5a3e3001b155df4f9d14e6186@changeid>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221021105623.3520859-1-sheng-liang.pan@quanta.corp-partner.google.com>
References: <20221021105623.3520859-1-sheng-liang.pan@quanta.corp-partner.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Change touchpad and touchscreen node for evoker
Touchpad: SA461D-1011
Touchscreen: GT7986U

Signed-off-by: Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.google.com>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v8:
- updated patch subjects

Changes in v7:
- add compiatable for gt7986

Changes in v6:
- add removed pinctrl and align touchscreen label with herobrine board

Changes in v5:
- new patch for Touchscreen/trackpad in v5

 .../boot/dts/qcom/sc7280-herobrine-evoker.dtsi    | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker.dtsi
index a6015491c6082..706dd82a70138 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker.dtsi
@@ -23,16 +23,15 @@ ap_tp_i2c: &i2c0 {
 	status = "okay";
 	clock-frequency = <400000>;
 
-	trackpad: trackpad@2c {
-		compatible = "hid-over-i2c";
-		reg = <0x2c>;
+	trackpad: trackpad@15 {
+		compatible = "elan,ekth3000";
+		reg = <0x15>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&tp_int_odl>;
 
 		interrupt-parent = <&tlmm>;
 		interrupts = <7 IRQ_TYPE_EDGE_FALLING>;
 
-		hid-descr-addr = <0x20>;
 		vcc-supply = <&pp3300_z1>;
 
 		wakeup-source;
@@ -43,9 +42,9 @@ ts_i2c: &i2c13 {
 	status = "okay";
 	clock-frequency = <400000>;
 
-	ap_ts: touchscreen@10 {
-		compatible = "elan,ekth6915";
-		reg = <0x10>;
+	ap_ts: touchscreen@5d {
+		compatible = "goodix,gt7986u", "goodix,gt7375p";
+		reg = <0x5d>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&ts_int_conn>, <&ts_rst_conn>;
 
@@ -54,7 +53,7 @@ ap_ts: touchscreen@10 {
 
 		reset-gpios = <&tlmm 54 GPIO_ACTIVE_LOW>;
 
-		vcc33-supply = <&ts_avdd>;
+		vdd-supply = <&ts_avdd>;
 	};
 };
 
-- 
2.34.1

