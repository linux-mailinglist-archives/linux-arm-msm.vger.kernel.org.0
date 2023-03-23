Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A4C36C6F24
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Mar 2023 18:32:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232607AbjCWRcr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Mar 2023 13:32:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232511AbjCWRcS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Mar 2023 13:32:18 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CABF2DE6B
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 10:31:41 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id k15so12254512pgt.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 10:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1679592699;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=atxXW/bb/Kha81+083F6Kw6bAgYeqNPEO1ABZE0wVDw=;
        b=P8BlZdRlVK88iY7jAdBGyiIJ69nn1tyzqQCBr6btUu6Fv2jM5HvV+pUX6AtfzmXfJR
         9/wUGRhjF1pCUzZPbLTZggyLHW2Ipo0RGRG9L2EkH2oDSwFogiPxCfZ6stRuN1ZVYV4X
         6i+o1Y7RiUw+mj+LhDs3s0a2wEGLmwjZCTI4c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679592699;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=atxXW/bb/Kha81+083F6Kw6bAgYeqNPEO1ABZE0wVDw=;
        b=zrRR2i5C/67xM5Unn/yKJZjazZVJWXiGDAC4nu/17M0yHhkc/1KJz85YiqpZp6KI1c
         40f5ZkJw4ywi4FKIqLWHLqK04zIaQnQbYlqRy1cbe5PdvD9S2ssukFuufU8nM3zQGiGr
         NeTPaOseLtFLZNc28Wc/Qenkk52eiRrJAz3JuE552HsPTM3aw8xEi+9RM7h6zeYYP7A9
         vYQ48T4ehnmWovOS4pGjG3iB6E8MberKPO4AZeqb04PkP9uHdSdkfVWNM4Eif4P5BsAR
         7FTp8lMMVPQ6hWRPujGMUsroudvwMVDn5jxk3383dV6a9aMjgojinPnx1OSF1Nc2hV69
         d0DQ==
X-Gm-Message-State: AAQBX9ci97cC9YXumx1DC3Jn2OA++WQ8A2EZWidnAxZ2Ze7ciBWPAsYs
        KU/s3Gbhql+h2qX6rvHfMJm2wg==
X-Google-Smtp-Source: AKy350alGRILKGMzdTzgubUmEWdzm9e6AU+vGaekDr5N8UzorD/EQzHiibjnHJ+LjAsbS4cBpBYUfg==
X-Received: by 2002:a62:5254:0:b0:625:febb:bc25 with SMTP id g81-20020a625254000000b00625febbbc25mr239719pfb.11.1679592699617;
        Thu, 23 Mar 2023 10:31:39 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:16d3:ef20:206a:6521])
        by smtp.gmail.com with ESMTPSA id x13-20020a62fb0d000000b0061a6f4c1b2bsm12613546pfm.171.2023.03.23.10.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 10:31:39 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Matthias Kaehlcke <mka@chromium.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-gpio@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH 14/14] arm64: dts: qcom: sdm845: Fix cheza qspi pin config
Date:   Thu, 23 Mar 2023 10:30:18 -0700
Message-Id: <20230323102605.14.I82951106ab8170f973a4c1c7d9b034655bbe2f60@changeid>
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
In-Reply-To: <20230323173019.3706069-1-dianders@chromium.org>
References: <20230323173019.3706069-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Cheza's SPI flash hookups (qspi) are exactly the same as trogdor's.
Apply the same solution that's described in the patch ("arm64: dts:
qcom: sc7180: Fix trogdor qspi pin config")

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
I think cheza is only very lightly used today (it was never sold, but
there are various people still using the dev boards) and I'm not
personally setup to test this. It's fairly straightforward but has
only been compile-tested.

 arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi | 34 +++++++++++++++++-----
 arch/arm64/boot/dts/qcom/sdm845.dtsi       |  9 ++++--
 2 files changed, 34 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
index 588165ee74b3..64ad8d1ed433 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
@@ -319,8 +319,9 @@ venus_mem: memory@96000000 {
 
 &qspi {
 	status = "okay";
-	pinctrl-names = "default";
-	pinctrl-0 = <&qspi_clk &qspi_cs0 &qspi_data01>;
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&qspi_clk>, <&qspi_cs0>, <&qspi_data0>, <&qspi_data1>;
+	pinctrl-1 = <&qspi_sleep>;
 
 	flash@0 {
 		compatible = "jedec,spi-nor";
@@ -995,16 +996,19 @@ &wifi {
 /* PINCTRL - additions to nodes defined in sdm845.dtsi */
 
 &qspi_cs0 {
-	bias-disable;
+	bias-disable;		/* External pullup */
 };
 
 &qspi_clk {
-	bias-disable;
+	bias-disable;		/* Rely on Cr50 internal pulldown */
 };
 
-&qspi_data01 {
-	/* High-Z when no transfers; nice to park the lines */
-	bias-pull-up;
+&qspi_data0 {
+	bias-disable;		/* Rely on Cr50 internal pulldown */
+};
+
+&qspi_data1 {
+	bias-pull-down;
 };
 
 &qup_i2c3_default {
@@ -1233,6 +1237,22 @@ pen_rst_l: pen-rst-l-state {
 		output-high;
 	};
 
+	qspi_sleep: qspi-sleep-state {
+		pins = "gpio90", "gpio91", "gpio92", "gpio95";
+
+		/*
+		 * When we're not actively transferring we want pins as GPIOs
+		 * with output disabled so that the quad SPI IP block stops
+		 * driving them. We rely on the normal pulls configured in
+		 * the active state and don't redefine them here. Also note
+		 * that we don't need the reverse (output-enable) in the
+		 * normal mode since the "output-enable" only matters for
+		 * GPIO function.
+		 */
+		function = "gpio";
+		output-disable;
+	};
+
 	sdc2_clk: sdc2-clk-state {
 		pins = "sdc2_clk";
 		bias-disable;
diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index aafc7cc7edd8..dce2cb29347b 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -2758,8 +2758,13 @@ qspi_cs1: qspi-cs1-state {
 				function = "qspi_cs";
 			};
 
-			qspi_data01: qspi-data01-state {
-				pins = "gpio91", "gpio92";
+			qspi_data0: qspi-data0-state {
+				pins = "gpio91";
+				function = "qspi_data";
+			};
+
+			qspi_data1: qspi-data1-state {
+				pins = "gpio92";
 				function = "qspi_data";
 			};
 
-- 
2.40.0.348.gf938b09366-goog

