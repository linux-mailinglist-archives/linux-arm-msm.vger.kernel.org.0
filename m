Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2AC2D77FA0E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Aug 2023 17:00:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352524AbjHQPAP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Aug 2023 11:00:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352668AbjHQPAO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Aug 2023 11:00:14 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54DE730EE
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Aug 2023 07:59:52 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-99cdb0fd093so1053210466b.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Aug 2023 07:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692284385; x=1692889185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e/n1mPlA3bD3cKDjIc3yPs+tXQOFq+U4vZNdJ+L1Dn4=;
        b=occYa08R7Z8nic08JlcWH5Dp/uUHr/UUyYkQ5rR96hz+WnhSp3hTVSt18E9+OTKYId
         eNIvG3goXUCgEe4LJIg2m0xQEGA7wF/MCbh5/UmYV0peXxZlTHR5p0K69Q+HeCjo1LAd
         0K/xs/epr0cIoixBNOK49GgAIuhUC9UVziTFJARX3rCB5bcKiC/1B62Wf9861kk6ONnl
         EIp2iuSpKMOc3d5oOFvgQ/ptJOsF43Ms1wDwjj6+kaOAAjANAt0EX1HpAHYXvtp4Szie
         FXlusP89ctKEA9XoGdNcH8ZsuclQaAX8nj1rdtbEAUCWMWbZolqNwfDgARTBUUZMldGe
         F8vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692284385; x=1692889185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e/n1mPlA3bD3cKDjIc3yPs+tXQOFq+U4vZNdJ+L1Dn4=;
        b=e8cH6UmrZKD4CEsk22y+JxJoIuNd2utGvuNJwBVEs1gD5F7oivxhqwttGfU6arQS4d
         7jJAoSMg1v4/usbpNeIdS/EIQSsMNUo9veR8NmLkcIoB/0yL7x6KW2eZxL0tZjPLWRKH
         Ip0C2x/2O3GBSo2SN+jsVug6Drr88ToM3hOBt3dXSLHa9NflQA2jNIRp5WaCQInnb0i9
         wL/m8GGJ/1oIolq62q5kA0R36iSn5jfwWvMGd2Mvu91iiT4D5T0UxewZEWUSqjrjWJST
         QndUlTdtgrvU3E2rAUdv7cwkzWQdbgOEy2KcV3L+c64pgAI88hluRtpxUO4og2ZLchs2
         BUbw==
X-Gm-Message-State: AOJu0Yx6ZxDoqUDaQS3N2DFz53f9VyhCGYql820TAWtx6yXB97XXyYRW
        eww0tqY0j2CAO662JApz/2sf5Q==
X-Google-Smtp-Source: AGHT+IF+0w+BKzzP8jEXAsFRgeM+qRBGveKGDzw5Xwja5f2AaVKGn03Fm1DGa0sPRL3l6q5Js1Wc9Q==
X-Received: by 2002:a17:906:1013:b0:99c:f966:9ea2 with SMTP id 19-20020a170906101300b0099cf9669ea2mr4459381ejm.25.1692284385125;
        Thu, 17 Aug 2023 07:59:45 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id lj9-20020a170906f9c900b00988be3c1d87sm10233557ejb.116.2023.08.17.07.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 07:59:44 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 2/4] arm64: dts: qcom: qrb5165-rb5: add onboard USB-C redriver
Date:   Thu, 17 Aug 2023 17:59:38 +0300
Message-Id: <20230817145940.9887-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230817145940.9887-1-dmitry.baryshkov@linaro.org>
References: <20230817145940.9887-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the nb7vpq904m, onboard USB-C redriver / retimer.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 52 +++++++++++++++++++++++-
 1 file changed, 50 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
index 303d07f9c6e5..a4f7a9f9c22c 100644
--- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
+++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
@@ -610,6 +610,46 @@ lt9611_out: endpoint {
 /* LS-I2C1 */
 &i2c15 {
 	status = "okay";
+
+	typec-mux@1c {
+		compatible = "onnn,nb7vpq904m";
+		reg = <0x1c>;
+
+		vcc-supply = <&vreg_s4a_1p8>;
+
+		retimer-switch;
+		orientation-switch;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				redriver_usb_con_ss: endpoint {
+					remote-endpoint = <&pm8150b_typec_mux_in>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				redriver_phy_con_ss: endpoint {
+					remote-endpoint = <&usb_1_qmpphy_out>;
+					data-lanes = <0 1 2 3>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				redriver_usb_con_sbu: endpoint {
+					remote-endpoint = <&pm8150b_typec_sbu_out>;
+				};
+			};
+		};
+	};
 };
 
 &mdss {
@@ -1299,7 +1339,7 @@ &usb_1_qmpphy {
 };
 
 &usb_1_qmpphy_out {
-	remote-endpoint = <&pm8150b_typec_mux_in>;
+	remote-endpoint = <&redriver_phy_con_ss>;
 };
 
 &usb_2 {
@@ -1388,7 +1428,15 @@ pm8150b_role_switch_in: endpoint {
 			port@1 {
 				reg = <1>;
 				pm8150b_typec_mux_in: endpoint {
-					remote-endpoint = <&usb_1_qmpphy_out>;
+					remote-endpoint = <&redriver_usb_con_ss>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				pm8150b_typec_sbu_out: endpoint {
+					remote-endpoint = <&redriver_usb_con_sbu>;
 				};
 			};
 		};
-- 
2.39.2

