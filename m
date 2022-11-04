Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 385FA619740
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Nov 2022 14:14:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231721AbiKDNOM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Nov 2022 09:14:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231831AbiKDNOG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Nov 2022 09:14:06 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0AE62E9CA
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Nov 2022 06:14:05 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id t10so6348680ljj.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Nov 2022 06:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CHU8hrHc1OdY4ACUIuU7p6ODVXbXU6UY27yzizf7x4o=;
        b=cexTu/LwfVUpWlSdlSLDgE4GFfg/djgwgRyKeGrqIN8mtolRgv3UF4yX7RfKlRb3rR
         DTLbwGvOtm8A4obZzAxRJGHoYhKU0EYUnW9RSi6FTXr5VS+0VK1KdkRBw4nf1a1DB29j
         kGsrI0cqmImzNzLmVEaLQl+LIWGeKFpWuLj0/6m6XJg2B8BSyKH02gImud3SequMf9QO
         ///lHGUvjAcCNZLj8zbuJ5ht1QyJgXU/vwrWymLnFq2CWvPyr0DoI+80LdgtRzBFylAP
         MW+XdTjterdFG6R1tOcXeKUTh7s1lEo8Nh6xQimaJrvP8R4WrgQDW5E/KqJrqBO7WyEo
         PB/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CHU8hrHc1OdY4ACUIuU7p6ODVXbXU6UY27yzizf7x4o=;
        b=aG5W/v5wxK/97KPhO5LTV/q0vNqoRKpmo2HMM/erpjCADu+2U7UCFw1n2gdCvsI2UA
         nlxxJjUUQeqznz+IWOsnmhZc+P0lgVvxgtgUWtnUVDdGjV7d6CuKMX90BqPeLuIFTQXH
         YYLySQepcTGJ1j6BypEgW18UBDnGeHTBrXD3DEas5fCXGo+2WpsQuMc2Y8ilhtHE1aSP
         NRc53+iHwIptypgbNg3VWdVrZUThiongBFys6TqYjgecWnvqJcSw4YPhjQJ5njjXfcnw
         ya5NfbrXSzbTBvsgFL8jDoFrzdVabxw85qN8vdGBOcS+n9MZziP691pN3LrfRmMQoNes
         lzQg==
X-Gm-Message-State: ACrzQf1HvQFIOReoQtmXwbWd1vGxvemTYGVqkawGQiG2KXVM4era+m4j
        U3uqsGoZpI0QehjZ18r1+zLthg==
X-Google-Smtp-Source: AMsMyM5VwoYUrsY1mgVbYrFymCEiknDJJHc0p6AbopTAAL3arUhx0ALhD5G5mbHBL0p2Ccfrpq6ehQ==
X-Received: by 2002:a05:651c:2104:b0:277:4656:2c95 with SMTP id a4-20020a05651c210400b0027746562c95mr2036784ljq.440.1667567645337;
        Fri, 04 Nov 2022 06:14:05 -0700 (PDT)
Received: from localhost.localdomain ([195.165.23.90])
        by smtp.gmail.com with ESMTPSA id t27-20020a19911b000000b004a95d5098f2sm457050lfd.226.2022.11.04.06.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Nov 2022 06:14:05 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v1 5/5] arm64: dts: qcom: sm8450-hdk: Enable HDMI Display
Date:   Fri,  4 Nov 2022 16:13:58 +0300
Message-Id: <20221104131358.1025987-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221104131358.1025987-1-dmitry.baryshkov@linaro.org>
References: <20221104131358.1025987-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Vinod Koul <vkoul@kernel.org>

Add the HDMI display nodes and link it to DSI. Also enable missing dispcc
nodes

Signed-off-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 45 +++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
index 9522dd29a38a..f37f226e9b11 100644
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
+			hdmi_con: endpoint {
+				remote-endpoint = <&lt9611_out>;
+			};
+		};
+	};
+
 	lt9611_1v2: lt9611-vdd12-regulator {
 		compatible = "regulator-fixed";
 		regulator-name = "LT9611_1V2";
@@ -389,6 +400,26 @@ lt9611_codec: hdmi-bridge@2b {
 		pinctrl-names = "default";
 		pinctrl-0 = <&lt9611_irq_pin &lt9611_rst_pin>;
 
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				lt9611_a: endpoint {
+					remote-endpoint = <&dsi0_out>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				lt9611_out: endpoint {
+					remote-endpoint = <&hdmi_con>;
+				};
+			};
+		};
 	};
 };
 
@@ -512,9 +543,23 @@ &mdss_mdp {
 	status = "okay";
 };
 
+&dispcc {
+	status = "okay";
+};
+
 &dsi0 {
 	status = "okay";
 	vdda-supply = <&vreg_l6b_1p2>;
+
+	ports {
+		port@1 {
+			endpoint {
+				remote-endpoint = <&lt9611_a>;
+				data-lanes = <0 1 2 3>;
+			};
+		};
+	};
+
 };
 
 &dsi0_phy {
-- 
2.35.1

