Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4BC94DBBB3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Mar 2022 01:28:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349978AbiCQA3q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Mar 2022 20:29:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245080AbiCQA3p (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Mar 2022 20:29:45 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D91171C93B
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Mar 2022 17:28:30 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id t5so5496232pfg.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Mar 2022 17:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ACtZLOUsEKL3RZmcnEkTB+sHZpJYYlU30MhaK0PAGw0=;
        b=P9pO/F33FUDOqGxMjS34mKrRhzcGWETsme09k+0RobF1mfoPgq5TAkICcVZels4aLC
         5Av4+UZAHAlBE+G8IL61Iv5DthHwXx5b9D/rfLXhYOLkfFZsLG1EAB3shf2IFBRBDktd
         KPvkqRk2YRyiZuv0ipRkSnMXNOzRSmWk8bX5Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ACtZLOUsEKL3RZmcnEkTB+sHZpJYYlU30MhaK0PAGw0=;
        b=3FGO2C97knSflRqdTYtxTVoI/tP3lw/3hzh+a4xqoTGdyWHzZwAL4NyXsYS4aCTeKy
         oYVncnARgu6ef3bCeSr4Eeo30SCvXiTY58YmsRI169DmbvNEJx32EoCFJR9t8sgBUok4
         8y+WflPwaBgIBdhXCgZaRoxnCm3U49qLpbIpcrB2Gmo9cjk1aV/2om6LLS6Ena9gG2vG
         wb1h0ewDA7gYidpHGllhRV/JeULYFqwyM+vf53kFiPHuz4LiDMsst51dlbPGSLCF+5Jd
         od64eizpqiBw1Mgbk1AahFTOjHZzqVLdrTA+darq9P+0WFYukWDSXfTkZxbpP1rO3W4U
         pPAQ==
X-Gm-Message-State: AOAM532vk2brhmookE5+KIx30eWBvKvaQ1zmay7FBJVL/4Ih9ssdcIOY
        K2BThgaTB+7GaNNX28vmLsCIQal4o0QcFg==
X-Google-Smtp-Source: ABdhPJwCPte94KNgJ+auSrzd8vBjXMVP+z2KrTWz+4FAbpEukJ6wXFwWyGNfvKo8XQ5xgt6kWNe+Mw==
X-Received: by 2002:aa7:8211:0:b0:4f7:8b7:239b with SMTP id k17-20020aa78211000000b004f708b7239bmr1827222pfi.64.1647476910416;
        Wed, 16 Mar 2022 17:28:30 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:3314:2f99:65d0:5a73])
        by smtp.gmail.com with UTF8SMTPSA id pi10-20020a17090b1e4a00b001bf9749b95bsm8073837pjb.50.2022.03.16.17.28.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Mar 2022 17:28:30 -0700 (PDT)
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Stephen Boyd <swboyd@chromium.org>, devicetree@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH v1 3/4] arm64: dts: qcom: sc7280: herobrine: disable some regulators by default
Date:   Wed, 16 Mar 2022 17:28:19 -0700
Message-Id: <20220316172814.v1.3.Iad21bd53f3ac14956b8dbbf3825fc7ab29abdf97@changeid>
X-Mailer: git-send-email 2.35.1.723.g4982287a31-goog
In-Reply-To: <20220316172814.v1.1.I2deda8f2cd6adfbb525a97d8fee008a8477b7b0e@changeid>
References: <20220316172814.v1.1.I2deda8f2cd6adfbb525a97d8fee008a8477b7b0e@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Not all herobrine boards have a world facing camera or a fingerprint
sensor, disable the regulators that feed these devices by default and
only enable them for the boards that use them.

Similarly the audio configuration can vary between boards, not all
boards have the regulator pp3300_codec, disable it by default.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---

 .../qcom/sc7280-herobrine-herobrine-r1.dts    | 30 +++++++++++++++++++
 .../arm64/boot/dts/qcom/sc7280-herobrine.dtsi |  6 ++++
 2 files changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dts b/arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dts
index f95273052da0..29c4ca095294 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dts
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dts
@@ -14,6 +14,36 @@ / {
 	compatible = "google,herobrine", "qcom,sc7280";
 };
 
+/*
+ * ADDITIONS TO FIXED REGULATORS DEFINED IN PARENT DEVICE TREE FILES
+ *
+ * Sort order matches the order in the parent files (parents before children).
+ */
+
+&pp3300_codec {
+	status = "okay";
+};
+
+&pp3300_fp_mcu {
+	status = "okay";
+};
+
+&pp2850_vcm_wf_cam {
+	status = "okay";
+};
+
+&pp2850_wf_cam {
+	status = "okay";
+};
+
+&pp1800_wf_cam {
+	status = "okay";
+};
+
+&pp1200_wf_cam {
+	status = "okay";
+};
+
 /* ADDITIONS TO NODES DEFINED IN PARENT DEVICE TREE FILES */
 
 &ap_spi_fp {
diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
index dc17f2079695..40cca69b1414 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
@@ -92,6 +92,7 @@ pp3300_codec: pp3300-codec-regulator {
 		pinctrl-0 = <&en_pp3300_codec>;
 
 		vin-supply = <&pp3300_z1>;
+		status = "disabled";
 	};
 
 	pp3300_left_in_mlb: pp3300-left-in-mlb-regulator {
@@ -132,6 +133,7 @@ pp3300_fp_mcu: pp3300-fp-regulator {
 		pinctrl-0 = <&en_fp_rails>;
 
 		vin-supply = <&pp3300_z1>;
+		status = "disabled";
 	};
 
 	pp3300_hub: pp3300-hub-regulator {
@@ -194,6 +196,7 @@ pp2850_vcm_wf_cam: pp2850-vcm-wf-cam-regulator {
 		pinctrl-0 = <&wf_cam_en>;
 
 		vin-supply = <&pp3300_z1>;
+		status = "disabled";
 	};
 
 	pp2850_wf_cam: pp2850-wf-cam-regulator {
@@ -214,6 +217,7 @@ pp2850_wf_cam: pp2850-wf-cam-regulator {
 		 */
 
 		vin-supply = <&pp3300_z1>;
+		status = "disabled";
 	};
 
 	pp1800_fp: pp1800-fp-regulator {
@@ -258,6 +262,7 @@ pp1800_wf_cam: pp1800-wf-cam-regulator {
 		 */
 
 		vin-supply = <&vreg_l19b_s0>;
+		status = "disabled";
 	};
 
 	pp1200_wf_cam: pp1200-wf-cam-regulator {
@@ -278,6 +283,7 @@ pp1200_wf_cam: pp1200-wf-cam-regulator {
 		 */
 
 		vin-supply = <&pp3300_z1>;
+		status = "disabled";
 	};
 
 	/* BOARD-SPECIFIC TOP LEVEL NODES */
-- 
2.35.1.723.g4982287a31-goog

