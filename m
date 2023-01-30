Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5DA20680A1D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jan 2023 10:55:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236184AbjA3Jzd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Jan 2023 04:55:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236036AbjA3JzU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Jan 2023 04:55:20 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF94D2E0EF
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jan 2023 01:55:03 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id t18so10488032wro.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jan 2023 01:55:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9qpfZbV87FyFuvr+iZnxd4/KOs94ZFAOk/H8YKUJg3U=;
        b=B5sKSpSVlHfCSQ82uDxYDeVBZWSPmhmOdoEMBEOR/c3TrKafde2Lx9u9+dyuCY41bj
         uT8uNVME9MF+uXFm0Nqy3BXgU94OvVxB1ogzgWaRnoTReFoRoxw2xVk0/fVxEeU4Cr9m
         fNBwPcCTJOG5BSid8ra+fYoJ0fTXRded+B38z5i57F9PB00UDe7JO2DL9NpZiTaLDmkk
         33JBl8j3Z6HM3aMG70nNkXVMDBPQ+Y/aiZdL7ywNMAOu9LEHZGQEVdhDnGuQ/9k9Ktjr
         GRHE9C+1DMKx/DbuKdmirz4B277SA36xbkXGDmyH+lwE0+3cKsJn7IS3z3rvLlP9WQlX
         Z2gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9qpfZbV87FyFuvr+iZnxd4/KOs94ZFAOk/H8YKUJg3U=;
        b=5UIUem6rBYplKTh1NdcR4FvZWudsZaqWZaj+TpGEzlTCToxTctn8D7rvfWjx1OUmcf
         5XpFxX+llm/q0TKKgxwq5mBHEMQr/qkYrT3EGoJ2PQpklcOirJF8nM/SE9gIv5+1hv5x
         3d4LxMryK0R4lCgBaA+RA6NiVWfdhYHoQHGqra3PtzQ6K6ipM/YxcfJKsdPivecHUqlT
         /LKttn/75tglRWyrF6l/CawS8chkumduLCzozy+aW3sANQJpPu0NjB/jI8NGWMM6w+SM
         dN//YHHVuVoAa8d5OSAmMgtGCcHunIUc3BvMm9IQqEllfOVIDuFHbadddhQ3Q7haNd4b
         QuYw==
X-Gm-Message-State: AFqh2koAZpfrifaRvhl7MFxajjYm3qozg+CDoOCkpCQv1yqWZ+gufDzo
        a5IkqJcLD+Jy4k/HhJXjMKw//9RQTLkDwEUmaCY=
X-Google-Smtp-Source: AMrXdXvc1qIyezyrdyKuq2duVb7031gcaJhbyeZno9kbBFreYHAqVvTAwrNxA27Y2xKguesRSDWJSA==
X-Received: by 2002:a05:6000:1c06:b0:2bf:6f4a:3f66 with SMTP id ba6-20020a0560001c0600b002bf6f4a3f66mr34498642wrb.21.1675072480040;
        Mon, 30 Jan 2023 01:54:40 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id k4-20020a5d4284000000b00241fde8fe04sm11453537wrq.7.2023.01.30.01.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 01:54:39 -0800 (PST)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Mon, 30 Jan 2023 10:54:36 +0100
Subject: [PATCH 5/7] arm64: dts: qcom: sm8450-hdk: add pmic glink node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230130-topic-sm8450-upstream-pmic-glink-v1-5-0b0acfad301e@linaro.org>
References: <20230130-topic-sm8450-upstream-pmic-glink-v1-0-0b0acfad301e@linaro.org>
In-Reply-To: <20230130-topic-sm8450-upstream-pmic-glink-v1-0-0b0acfad301e@linaro.org>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the pmic glink node linked with the DWC3 USB controller
switched to OTG mode and tagged with usb-role-switch.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 34 ++++++++++++++++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
index 5bdc2c1159ae..5ab12c911bfe 100644
--- a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
@@ -87,6 +87,31 @@ lt9611_3v3: lt9611-3v3-regulator {
 		enable-active-high;
 	};
 
+	pmic-glink {
+		compatible = "qcom,sm8450-pmic-glink", "qcom,pmic-glink";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		connector@0 {
+			compatible = "usb-c-connector";
+			reg = <0>;
+			power-role = "dual";
+			data-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				port@0 {
+					reg = <0>;
+					pmic_glink_dwc3_in: endpoint {
+						remote-endpoint = <&usb_1_dwc3_out>;
+					};
+				};
+			};
+		};
+	};
+
 	vph_pwr: vph-pwr-regulator {
 		compatible = "regulator-fixed";
 		regulator-name = "vph_pwr";
@@ -724,7 +749,14 @@ &usb_1 {
 };
 
 &usb_1_dwc3 {
-	dr_mode = "peripheral";
+	dr_mode = "otg";
+	usb-role-switch;
+
+	port {
+		usb_1_dwc3_out: endpoint {
+		      remote-endpoint = <&pmic_glink_dwc3_in>;
+	      };
+	};
 };
 
 &usb_1_hsphy {

-- 
2.34.1

