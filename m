Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 79863619111
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Nov 2022 07:28:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229756AbiKDG2o (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Nov 2022 02:28:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229481AbiKDG2n (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Nov 2022 02:28:43 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40F3F1EADC
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Nov 2022 23:28:43 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id h193so3581802pgc.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Nov 2022 23:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quanta-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XwU1VZF8+6iJFAuGjdLVREmySRqI+EDvo5yioZX/3UI=;
        b=3rkkgT/m2ZMg9HxDIIO8mEURZiqHTfSFqA/iOzp3s+I7nR0leeuva4qDhA2sZ54Ji6
         LKIsV2C0h3gKkDXe0iK0kZFepAyWf3z9UvqNdGLFLG89pIJU/uqayy7DVFZwV9iLrn3z
         aFwLmMjwhbUgZAh2rPLxMy9p8hPrI3jJB4Js14DZhYbEToOTZcqtS3yt8DowlFnWXtJo
         cCempueSMQpHEGf1UMYyhKVWeivdAS4iVEWqjHwUS0ZXEKMCMvCrRISKzDj2I0Zh9JHY
         BfZjMPPumWrenTL9ThjuDOB4I33umuAVbk5lmQ46H8uNRD8tT3BgGPxwEWRmZmTzDkE7
         q7NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XwU1VZF8+6iJFAuGjdLVREmySRqI+EDvo5yioZX/3UI=;
        b=jFI8sjbnRc6dGCE1seUrbAv6FUH8K/BIRAxlh8lONkWtFzK27GrMKMs9L21TDgSBBx
         oeyadL7XeUbewjEL2Cxp5x6JxSsFxmvIOjcGr6uzolWTRSlwOeY5HkJBlFuG0qBkL8aH
         jPCcfK3eJ4VDdoGmazxLroFnecMbfu25Q5xaRr6tsCbyCChK2v7Bp+8UTGpLTa6iB4VB
         vPLe3VIyl7jXQ1HF+tNAt/SHJld5bWcuqw11lanySU69zVU/aHtXqCcJqvSms4Ols0hH
         b6NpodspP8faw086NCrFX02/MM5Ap7gEomKQrFhA6FTT1qoCVsKK2ABFLm1oU+h9XkNT
         ZC2A==
X-Gm-Message-State: ACrzQf1mLN1vj6GJtamWM1RN0TYbhBZQruOo13CScEXh914e7uHwul7/
        oKOyGkXUp6tVApgqlB754xP8Bg==
X-Google-Smtp-Source: AMsMyM72X8JFynUdAN6IASTpfoYmQSmTuX7LJOkhAKEfhqJnKQTxtnR2kwPbvpMmdK5a2mQG7pz5bw==
X-Received: by 2002:a63:1c52:0:b0:470:a4a:66b3 with SMTP id c18-20020a631c52000000b004700a4a66b3mr10021540pgm.573.1667543322692;
        Thu, 03 Nov 2022 23:28:42 -0700 (PDT)
Received: from liang-Predator-PH517-52.. (2001-b400-e306-842b-9ec5-b6d1-6a82-aa11.emome-ip6.hinet.net. [2001:b400:e306:842b:9ec5:b6d1:6a82:aa11])
        by smtp.gmail.com with ESMTPSA id r18-20020aa79892000000b0056bf24f0837sm1764687pfl.166.2022.11.03.23.28.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 23:28:42 -0700 (PDT)
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
Subject: [PATCH v10 3/4] arm64: dts: qcom: sc7280: Add touchscreen and touchpad support for evoker
Date:   Fri,  4 Nov 2022 14:19:40 +0800
Message-Id: <20221104141515.v10.3.I3ac715e729f6f9b5a3e3001b155df4f9d14e6186@changeid>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221104061941.2739938-1-sheng-liang.pan@quanta.corp-partner.google.com>
References: <20221104061941.2739938-1-sheng-liang.pan@quanta.corp-partner.google.com>
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

