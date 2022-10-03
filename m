Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1409A5F2EC8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Oct 2022 12:28:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230074AbiJCK2a (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Oct 2022 06:28:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229881AbiJCK2Z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Oct 2022 06:28:25 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6956E24BCB
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 Oct 2022 03:28:24 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id 83so2840602pfw.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Oct 2022 03:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quanta-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=lX+oj6rmvSOLgFkJ4R/ALtfBKBSvjF9wvr9qaq9s7Es=;
        b=Nh8+bIj3Q9+SLQXMLEQZfrRiO7YfVwcAMifr/Jr5O9scFq7EXvFKQnV6XqJnCSQPlI
         OPqAXvW5HLjasbcJrHvSOUjkxmNmNdzfSHKnoGzoG30gqGplyjdDQXzLvsQxgYvPeLtS
         02eQXq8+g1M6mc0nJ2H/mP2/85a2VzEAkjhCTwxAsSLsvb+aqekjppVwvVNsZgtLgH4y
         q2kc9eUSaOyao3K2Lv9i9uE1ybdBPEInwcN2rwsli00nSEF9IRdYapxFQlPH8lnZIQqR
         V/lNwpDnHCLR4Etuu6NOWgY0Eb2HJxiEy6Hkf2Xuv3Cq4A2AVbYPMDk4HEGBBKhBhjMD
         b+dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=lX+oj6rmvSOLgFkJ4R/ALtfBKBSvjF9wvr9qaq9s7Es=;
        b=A7cf9ZlHP0hdPHhN2FPI3bhRxcOBo2TfyLE6lHSmCzxoT24Va1qL9k+pYG81nZNHec
         Hk6CsEGiToeD1nUk+3samjKXofn8COlXojSl5wW3Jcq62nJPYYYKl7uMcPGrtvsb2REM
         VgORm/M98zMOWGCA2B0hZ5wDpboG+nuDVHYSfmVIWkzM1BEdCjY2cqVVsT93QKDCOzX0
         v4T+4TEu+1uC8/TfJBV0eLLEst3lE+rDj1IVTxy9PUuFj5A55H9dRdx9fYd5HBe/pQuF
         YAPdkv1f74B6KXdFiAXSjGNRUQsiFEePoAinP2p0oCfcvzqM+3SNCtuheTWks0i88QJG
         L5Ng==
X-Gm-Message-State: ACrzQf3ituev9+xAlNseL+hdsW4mRYEawrRoCK293VO+YtA3X27oTLcB
        NupUjEU+ec+LdsAxgbUhm7S4cg==
X-Google-Smtp-Source: AMsMyM48S1WC/3x9VfPH6KQyLJBwL8rocb6TmOeYpGsV2IxPCbe2PPe3FW7eO6FLn5UhW4PZQiUyNQ==
X-Received: by 2002:a65:604d:0:b0:43c:9d8c:813a with SMTP id a13-20020a65604d000000b0043c9d8c813amr18665545pgp.572.1664792903863;
        Mon, 03 Oct 2022 03:28:23 -0700 (PDT)
Received: from liang-Predator-PH517-52.. (60-250-232-247.hinet-ip.hinet.net. [60.250.232.247])
        by smtp.gmail.com with ESMTPSA id y17-20020a170902b49100b00172951ddb12sm6860249plr.42.2022.10.03.03.28.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Oct 2022 03:28:23 -0700 (PDT)
From:   Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.google.com>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     dianders@chromium.org,
        Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.google.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v6 3/3] arm64: dts: qcom: Add touchscreen and touchpad support for evoker
Date:   Mon,  3 Oct 2022 18:27:36 +0800
Message-Id: <20221003182637.v6.3.I50d04dcbe735dda69995cf1078824d671501869e@changeid>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221003102735.39028-1-sheng-liang.pan@quanta.corp-partner.google.com>
References: <20221003102735.39028-1-sheng-liang.pan@quanta.corp-partner.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Change touchpad and touchscreen node for evoker
Touchpad: SA461D-1011
Touchscreen: GT7986U

Signed-off-by: Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.google.com>
---

Changes in v6:
- add removed pinctrl and align touchscreen label with herobrine board

Changes in v5:
- Touchscreen / trackpad patch new for v5

 .../boot/dts/qcom/sc7280-herobrine-evoker.dtsi    | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker.dtsi
index e78072159d54b..d1723fbffae67 100644
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
+		compatible = "goodix,gt7375p";
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

