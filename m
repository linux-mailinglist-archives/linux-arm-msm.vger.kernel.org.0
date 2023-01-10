Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89B79664C5D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jan 2023 20:23:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239819AbjAJTXL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Jan 2023 14:23:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239528AbjAJTWq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Jan 2023 14:22:46 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F21CF5329A
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jan 2023 11:22:44 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id m26-20020a05600c3b1a00b003d9811fcaafso10904606wms.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jan 2023 11:22:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uPKIsPLN5aJ8m2V2u6J9M4j3Y5N3lS/nTl2zakrSabY=;
        b=A8w67MK45VArk3cK6G+xKVKvdEJFQaory9yT0jghmdWL7Rajy0swdGmCUz9eFciAXJ
         H72w5SzUSyf5KozK5jMVKQ1lyxP6UEbnovNdaj5aUDuvq6HfApnlmKObNGt9F3+K3tBH
         DID6Ghcb1XW48suhd0SfRQZoMCR7upsw96EOiik2P6UWnh/FGyoJYIUdtE+3d60xELbU
         2qiJmhvJYsgn7tvUhC2f/gqa4fb/qJOSrZAbZ8MmLl/S8GbLZPErzuHQUDZ/Xw6pAZqi
         XvnTmJCViinyrILiCWcEtNwSTBbK77uQSYJazZB70zj0aFytLatyMU4S4yIS2sZWg9jY
         jklA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uPKIsPLN5aJ8m2V2u6J9M4j3Y5N3lS/nTl2zakrSabY=;
        b=Aie/ZnBvDX4yWNUSSHpVH9BtnrOuRfBTSIdVCFaipe5dJC+xUaEqoF85/isS7JqAYh
         H13dAbOjpBKUEzquNNg5v7s4vfy2IIwScwq/Wzvb8Lw+fGSF/RUWuP5bhVUxY+EFOnz6
         XzJxrYRekXYinl12iz5mLY5Rc6FpwXDJe+P3tX+rBvIR75y0OiqEhF3mwwiA8gyYECXp
         wgRm148CjfdVXMQxgiC75rYb9y97VOn6heW8OmPz0DauqRioLw9CLP9LW2Ts8XUto8dg
         Liz+s+KIE/oL3N8FJG8nhP5brPybbIC2fHUZY3DfHpym59KQJQ/M2XEke83Ox/QEF286
         er9A==
X-Gm-Message-State: AFqh2kp0digl94k1kpXboR59XdYpxnCvHyLpoJm82HsNcMMysrtSPcq3
        H0l/BgmzduQr+0c2Fng9PVkNLw==
X-Google-Smtp-Source: AMrXdXvfdK2K/FiWYbRqJXhuAHn4w03xHu3kQnkjC8fGsEfTxompCyurPdcN8GD5vV1O26okK81+5A==
X-Received: by 2002:a05:600c:354b:b0:3d0:4993:d45b with SMTP id i11-20020a05600c354b00b003d04993d45bmr51661918wmq.4.1673378563568;
        Tue, 10 Jan 2023 11:22:43 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id l14-20020a05600c4f0e00b003d96c811d6dsm22284343wmq.30.2023.01.10.11.22.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 11:22:43 -0800 (PST)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Tue, 10 Jan 2023 20:22:38 +0100
Subject: [PATCH v2 3/3] arm64: dts: qcom: sm8550-mtp: add DSI panel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230104-topic-sm8550-upstream-dts-display-v2-3-9fbb15263e0d@linaro.org>
References: <20230104-topic-sm8550-upstream-dts-display-v2-0-9fbb15263e0d@linaro.org>
In-Reply-To: <20230104-topic-sm8550-upstream-dts-display-v2-0-9fbb15263e0d@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.11.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add nodes for the Visionox VTDR6130 found on the SM8550-MTP
device.

TLMM states are also added for the Panel reset GPIO and
Tearing Effect signal for when the panel is running in
DSI Command mode.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550-mtp.dts | 56 +++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
index 5b7e301cc2a2..cbb63a31f0ff 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
@@ -370,6 +370,34 @@ &mdss {
 &mdss_dsi0 {
 	vdda-supply = <&vreg_l3e_1p2>;
 	status = "okay";
+
+	panel@0 {
+		compatible = "visionox,vtdr6130";
+		reg = <0>;
+
+		pinctrl-names = "default", "sleep";
+		pinctrl-0 = <&sde_dsi_active>, <&sde_te_active>;
+		pinctrl-1 = <&sde_dsi_suspend>, <&sde_te_suspend>;
+
+		vddio-supply = <&vreg_l12b_1p8>;
+		vci-supply = <&vreg_l13b_3p0>;
+		vdd-supply = <&vreg_l11b_1p2>;
+
+		reset-gpios = <&tlmm 133 GPIO_ACTIVE_LOW>;
+
+		status = "okay";
+
+		port {
+			panel0_in: endpoint {
+				remote-endpoint = <&mdss_dsi0_out>;
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&panel0_in>;
+	data-lanes = <0 1 2 3>;
 };
 
 &mdss_dsi0_phy {
@@ -415,6 +443,34 @@ &sleep_clk {
 
 &tlmm {
 	gpio-reserved-ranges = <32 8>;
+
+	sde_dsi_active: sde-dsi-active-state {
+		pins = "gpio133";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	sde_dsi_suspend: sde-dsi-suspend-state {
+		pins = "gpio133";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	sde_te_active: sde-te-active-state {
+		pins = "gpio86";
+		function = "mdp_vsync";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	sde_te_suspend: sde-te-suspend-state {
+		pins = "gpio86";
+		function = "mdp_vsync";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
 };
 
 &uart7 {

-- 
2.34.1
