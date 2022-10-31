Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F297613375
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Oct 2022 11:20:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229716AbiJaKUa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Oct 2022 06:20:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230402AbiJaKU2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Oct 2022 06:20:28 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56BFEDF74
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Oct 2022 03:20:25 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id b29so10247760pfp.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Oct 2022 03:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quanta-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XwU1VZF8+6iJFAuGjdLVREmySRqI+EDvo5yioZX/3UI=;
        b=gi/sUzzWHCD4PNXPKoUxF/DaaOBdsTRMWS/NBfPhZ6M5UbHzP3anRNIkkbFMZTiEP9
         Qeea98izXUorD/O5RtuI4I8TWF7Vu1nIR0iItqeUqPFJXbcuIwuQ5nTRIuo0iDeVOoKh
         09OXVTYj59D+pxrEgrXjcVrkE/hPe2W606KRtyLb1zcCd1bMj0QKP+uqiOcWO3XnQpwT
         XGTSz0FFl+C8W5TaEgP44AMiWKhpHz3Ex1bGY6w0AmE0L37yw1UJrwkERsWs1yRif+iu
         mBLfWaRDrw1/XNZfLyQGutR3HU/PePdolSF7W/O2uN64LUVLUvKkUYm4FA7ADYTIeUtl
         zkiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XwU1VZF8+6iJFAuGjdLVREmySRqI+EDvo5yioZX/3UI=;
        b=W/vVA9xYup5VFH1apPo9XFAuBf1r7SckViz48eBowTs2bHPZoIIt3pHsy7cBYt7jvy
         7axnq3h0N5GRuDOtFet66PrTZUZSGcsH5FbOtdbRzqG0/Mv6FoYQxim3tuFrA21xScmg
         rBpUfZ12YYP8brzFbtCVAT5E7gHo9S9Owcf3X0EfgGPdk6BeTxZXMUftjzol/Ut3PLo/
         K923r325m20BDL6Q3vPYWHUtqRr2y6dxjOMJb0gTg85swoHxdY1AbNLKv5lM9CY2kqgH
         OQ8RCIyGqOCE2DN/9pF85oteYElTM8zw1Yb5hjuAb3wpFjLimdzoAjDomabHwbY8eMTW
         2LaQ==
X-Gm-Message-State: ACrzQf3HDiDrbe2dsU6A8sgD81riaqHI7ZIbwMhYB7c7tEpS1KzSjMG0
        YnrL/+fT3OETJfB5L7lV4NX+aA==
X-Google-Smtp-Source: AMsMyM4rGuKmmC+fs75OTTZnszCQbalPEiLdoDfUxCI4DQ+NdieCXtLOxRP1fgztnlzroClQJuDoYw==
X-Received: by 2002:a63:234c:0:b0:46f:1b7:438b with SMTP id u12-20020a63234c000000b0046f01b7438bmr11977538pgm.516.1667211624985;
        Mon, 31 Oct 2022 03:20:24 -0700 (PDT)
Received: from liang-Predator-PH517-52.. (60-250-232-247.hinet-ip.hinet.net. [60.250.232.247])
        by smtp.gmail.com with ESMTPSA id k12-20020a170902c40c00b00186881e1feasm4136551plk.112.2022.10.31.03.20.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 03:20:24 -0700 (PDT)
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
Subject: [PATCH v9 3/4] arm64: dts: qcom: sc7280: Add touchscreen and touchpad support for evoker
Date:   Mon, 31 Oct 2022 18:20:10 +0800
Message-Id: <20221031181735.v9.3.I3ac715e729f6f9b5a3e3001b155df4f9d14e6186@changeid>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221031102011.136945-1-sheng-liang.pan@quanta.corp-partner.google.com>
References: <20221031102011.136945-1-sheng-liang.pan@quanta.corp-partner.google.com>
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

