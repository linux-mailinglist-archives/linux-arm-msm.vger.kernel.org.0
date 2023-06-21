Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2ACC1738315
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jun 2023 14:13:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232484AbjFULWM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Jun 2023 07:22:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232235AbjFULWL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Jun 2023 07:22:11 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3260E57
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jun 2023 04:22:09 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4f8775126d3so3509427e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jun 2023 04:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687346528; x=1689938528;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UXNuFRDfRONCX2Ljf/J131jhsnM7rjkKz5kmnnhI4f0=;
        b=K5cY6G2UdenPbTZAhwSH6wrhFO2S6ptD5opmszG+fPTMf6aUF6l2NPPLNcp82YbA7H
         sCgmm9xjePfsGc+ykgIS7QtiOgC964gXAvT1EGSkGIfnwgW77E9N3AAG7XzuYV+tv7N1
         tBjsnFBiWvB+gwpWprq5qJiRTAExFgXIS+k5Rhe6Gwqevna4bR0vZ5K+Pcs3rKNcV1Wq
         IKaFprFZPqmkQb3ABuOh1Bfp4q1v6ihaGgnw4xzx2Uc4kIdCdz1fyXRrSHvZqY6FpJ2T
         L30ZCOBHkmFa+M3GPE5um7qZssgWKtoJqhNQ5SHu9j9MWVBSTBXqUB+So6STuQGKce1j
         RGIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687346528; x=1689938528;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UXNuFRDfRONCX2Ljf/J131jhsnM7rjkKz5kmnnhI4f0=;
        b=ki+613zY5EB7vTI32wU8orsN4jk6VAErDfZdVQcR5iFEOX3FnJZKVlzh1IDSKieQWv
         FnMRNk7DN21YyuMNpxYfGWbel/6FaxwCxVLXN1oyPuLxrDZcBLY7K8p7ksxbUU8RhTjg
         1vZOz2UjBjBT8HeYHbyy0bdleLtspzjJXNYPLeWYuGcy6Mjsvp1VX+cwzk0rJhH+c0E9
         6KWm6ZWvqwFrc6YROQ/5L3IrYuAF2WKY8o/F0VbygXKD/O+Nboujd/L6XfXUXzW+AnDw
         f80vGH27v/joJ0HYQ68hTLY5XCAHf0xcXYllbLFsmVEt3sq065efSaSxj5utRXzGDOLV
         hm5w==
X-Gm-Message-State: AC+VfDxjnNnplkB5018yjUMb/EAOMTe6lbnCWrckc9if6Fg6YLav+506
        9gtp+xfYE2hWq2+DGXHZIIcHOkXwpQ0EEMgCbDo=
X-Google-Smtp-Source: ACHHUZ6sIg/H1QS00s0qUvpH2v09GsiDcQSo3Bn5S0uJGUJsFn1IkEowr/VitrT5CfxiEpGd4w/W5A==
X-Received: by 2002:a2e:8893:0:b0:2b1:e8f8:e0ff with SMTP id k19-20020a2e8893000000b002b1e8f8e0ffmr10305167lji.10.1687346527749;
        Wed, 21 Jun 2023 04:22:07 -0700 (PDT)
Received: from [192.168.1.101] (abxj193.neoplus.adsl.tpnet.pl. [83.9.3.193])
        by smtp.gmail.com with ESMTPSA id l4-20020a05651c10c400b002b22a1a21easm866171ljn.110.2023.06.21.04.22.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 04:22:07 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Wed, 21 Jun 2023 13:21:53 +0200
Subject: [PATCH v2 2/4] arm64: dts: qcom: sm6115p-j606f: Hook up display
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230620-topic-gpu_tablet_disp-v2-2-0538ea1beb0b@linaro.org>
References: <20230620-topic-gpu_tablet_disp-v2-0-0538ea1beb0b@linaro.org>
In-Reply-To: <20230620-topic-gpu_tablet_disp-v2-0-0538ea1beb0b@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1687346515; l=2335;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=zqiuY9v4CCMTGwogxkI9VdCQQdRQbDXhOrWQh4SQdKg=;
 b=+Dsso/rqDQqEogRq4wvoXfyca4HLi/fgHhps6JAAQAZpGRyaHdEpa+BF81sYKtoiL3LPEBupJ
 ZjC13YcP6U/At8+a+AKsId2j1jnSnpLExr0dL+zHFbe9cgwzVEMgIsJ
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable the required nodes, add the required pins and tweak a
regulator to enable non-simplefb display on the Tab P11.

Do note that there exists a second SKU with a different panel+touch
combo, but due to insufficient information, that will need to be
handled separately.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm6115p-lenovo-j606f.dts | 57 +++++++++++++++++++++--
 1 file changed, 52 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6115p-lenovo-j606f.dts b/arch/arm64/boot/dts/qcom/sm6115p-lenovo-j606f.dts
index 81fdcaf48926..667273ae0553 100644
--- a/arch/arm64/boot/dts/qcom/sm6115p-lenovo-j606f.dts
+++ b/arch/arm64/boot/dts/qcom/sm6115p-lenovo-j606f.dts
@@ -65,9 +65,41 @@ ramoops@ffc00000 {
 	};
 };
 
-&dispcc {
-	/* HACK: disable until a panel driver is ready to retain simplefb */
-	status = "disabled";
+&mdss {
+	status = "okay";
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&pm6125_l18>;
+	status = "okay";
+
+	panel: panel@0 {
+		compatible = "lenovo,j606f-boe-nt36523w", "novatek,nt36523w";
+		reg = <0>;
+
+		reset-gpios = <&tlmm 82 GPIO_ACTIVE_LOW>;
+		vddio-supply = <&pm6125_l9>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&te_active &mdss_dsi_active>;
+
+		rotation = <180>; /* Yep, it's mounted upside down! */
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&mdss_dsi0_out>;
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	data-lanes = <0 1 2 3>;
+	remote-endpoint = <&panel_in>;
+};
+
+&mdss_dsi0_phy {
+	status = "okay";
 };
 
 &pm6125_gpios {
@@ -212,8 +244,9 @@ pm6125_l17: l17 {
 		};
 
 		pm6125_l18: l18 {
-			regulator-min-microvolt = <1104000>;
-			regulator-max-microvolt = <1312000>;
+			/* 1.104V-1.312V fixed @ 1.232V for DSIPHY */
+			regulator-min-microvolt = <1232000>;
+			regulator-max-microvolt = <1232000>;
 		};
 
 		pm6125_l19: l19 {
@@ -282,6 +315,20 @@ sdc2_gate_pin: sdc2-gate-state {
 		bias-pull-up;
 		output-high;
 	};
+
+	te_active: te-active-state {
+		pins = "gpio81";
+		function = "mdp_vsync";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	mdss_dsi_active: dsi-active-state {
+		pins = "gpio82";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
 };
 
 &ufs_mem_hc {

-- 
2.41.0

