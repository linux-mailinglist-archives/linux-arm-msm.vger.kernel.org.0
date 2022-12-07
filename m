Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF97564512D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Dec 2022 02:28:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229825AbiLGB2O (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Dec 2022 20:28:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229909AbiLGB2L (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Dec 2022 20:28:11 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48DAB51C27
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Dec 2022 17:28:10 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id c1so26413600lfi.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Dec 2022 17:28:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=usZC8CFKIGNnvjFpBH+SET7VsIUOeyE2acRZh0YmuAw=;
        b=sfndZZ8LPJdrMvH71iPAy6zfrtiZRSGV1kuYFJQVisH20EjFlZyBt0qbSiF7M1ZCE3
         Ad0zmflQQJqNlTlziMyiYQdRalgMHFJn+FAKbM9xRwdpI7YB3EFGbyOKyLPBrD29sWwW
         ABGMADJE/XL7HxA/P8hU22at5gMewpcKhdTzfIQRuu/YYb2O/3qNfDNzr1WZeDbDxzx5
         IeZ+FtNX/Y/gj+YDQIR62AhuCKucelw0wDjFCRyHS3Lu63cy2kZrhte/FKv4XT9FFUTg
         V2QCCGQF/lehjLJsnfRriVswxolFkGmth0okcgh69dd3uP0hifKZhcHoFQMSNlSAbam5
         AT4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=usZC8CFKIGNnvjFpBH+SET7VsIUOeyE2acRZh0YmuAw=;
        b=XPXO4aDcHTkrU1K3IeAdRsCReZlHCe+wOuSe7YzzcCRT6XXuSkE/qdyN2dRWBJbn4n
         NaCSI/kTNsXJN2BkklnhFZH+Gdkrc8Q0QY7CTq+ctVUVeeb4Rv20ciqTgKpo3uXdKXq+
         jn5T0Ch3R1JWkqHlec85ElQSHTqESSRVfGHNyHSfZ2kOIHgjmk0E5S/H9JPdl5tw2vYK
         8pduxdY82H2xDtnX6hnPi4FRahrg4U1ZOQ5y4KR9oCQ694NvLN61suwBkiiF08KPsUmX
         ObacdV9hT1DPfV8BL6DzP7GpM4ZwDq2XfwdaIIzFlAm9Tn4MX49Cn2XIZmI0xjWgOH15
         LShQ==
X-Gm-Message-State: ANoB5plDXt3mT+N5mHnXy/HetL0QXc8mbT7CrJjD7bfu4FkYdjFAe2Dn
        fK2iV7Xr9mKF0vfCXUQnIZQdsg==
X-Google-Smtp-Source: AA0mqf5XUSJd46BzRdQjE/d0PZsIJxwKuDRCp9/AXcfACW+MK0n5DxetfpDGRxbrEShmiMzspu2VQQ==
X-Received: by 2002:a05:6512:32b2:b0:4b5:2dc:8107 with SMTP id q18-20020a05651232b200b004b502dc8107mr17295741lfe.209.1670376488647;
        Tue, 06 Dec 2022 17:28:08 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id n26-20020a05651203fa00b004b5626ef9f4sm1461157lfq.262.2022.12.06.17.28.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Dec 2022 17:28:08 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, Vinod Koul <vkoul@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: [PATCH v4 5/5] arm64: dts: qcom: sm8450-hdk: Enable HDMI Display
Date:   Wed,  7 Dec 2022 03:28:03 +0200
Message-Id: <20221207012803.114959-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221207012803.114959-1-dmitry.baryshkov@linaro.org>
References: <20221207012803.114959-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Vinod Koul <vkoul@kernel.org>

Add the HDMI display nodes and link it to DSI.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 37 +++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
index 4f345786352a..166458963c2f 100644
--- a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
@@ -20,6 +20,17 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	hdmi-out {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_connector_out: endpoint {
+				remote-endpoint = <&lt9611_out>;
+			};
+		};
+	};
+
 	lt9611_1v2: lt9611-vdd12-regulator {
 		compatible = "regulator-fixed";
 		regulator-name = "LT9611_1V2";
@@ -392,6 +403,27 @@ lt9611_codec: hdmi-bridge@2b {
 
 		pinctrl-names = "default";
 		pinctrl-0 = <&lt9611_irq_pin &lt9611_rst_pin>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				lt9611_a: endpoint {
+					remote-endpoint = <&mdss_dsi0_out>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				lt9611_out: endpoint {
+					remote-endpoint = <&hdmi_connector_out>;
+				};
+			};
+		};
 	};
 };
 
@@ -404,6 +436,11 @@ &mdss_dsi0 {
 	status = "okay";
 };
 
+&mdss_dsi0_out {
+	remote-endpoint = <&lt9611_a>;
+	data-lanes = <0 1 2 3>;
+};
+
 &mdss_dsi0_phy {
 	vdds-supply = <&vreg_l5b_0p88>;
 	status = "okay";
-- 
2.35.1

