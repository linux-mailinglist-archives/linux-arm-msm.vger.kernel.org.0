Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ECF276C32A4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Mar 2023 14:22:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231181AbjCUNWY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Mar 2023 09:22:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230489AbjCUNWN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Mar 2023 09:22:13 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE6DC29169
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Mar 2023 06:21:54 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id az3-20020a05600c600300b003ed2920d585so11073685wmb.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Mar 2023 06:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679404912;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KrPRBzb1vVCm4YUTuPonj2zAD2+yOGeBsiiAQHsNxwQ=;
        b=ZYQxVxE0kJLb3VEZrwghO7AsdtSQZ0mEe0TI4CL8kTy2Yb5KEiuA8M/WsZNq6iLDUB
         lgE8LlCpEiTYtSw34lqxqyhMQwaeVKLvgMqWdiR8b2g9ofZTLDAuyovCrFhpw9/dAPW2
         Dgs25riGj3uPYtl1SJw5wSxe7oyGzwAg44vNR2V0ukZjgdjq10kEqxyqEY5QXJAXjkAH
         yv7EzlzK3NrsWg30j0h69R3gDiO187kk4wqJMSQ6xJkw1IlNpQfLzO6qTM2BUh8XdQgc
         T3udNr4KWmZ9eNB/OgodPEXIhKw6sLmtshgkm0mONil7YVP5bAoDyNTnjnx5gCX3fzcm
         Ddhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679404912;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KrPRBzb1vVCm4YUTuPonj2zAD2+yOGeBsiiAQHsNxwQ=;
        b=NdghVs7WEdh+UtD8SdFx1QrIhl28gi2v5Sjq89Rc+6t6O3/mviVltTo0gnprk843SA
         0GFxwggRnpre6Brf7UJg3XBY2yPBBc3PnGr/Yt9YcVOElzHUJ0xzSzEJz1VDXmUx86xp
         Dqv7wyM+5WTY7bY8TQLULCvPCMYvpgtrKiz5T4MF7aAyR/6OmG4+r3kcYluLBBKs4jab
         MxZDVkmyInRTCrERDfPjBajW/W+7mRQ2qR0OkUSRwlmRYbDWomkfRMYYgVUB/ch007jw
         D8xVlbVVJVug7rcaPnVuzUBkEi3Bu8oTpmm2mzmamdWqTxwSWFjSgqa2ln9JAtFV9/qw
         uMJQ==
X-Gm-Message-State: AO0yUKU0MkfKmcp7hsb/sfkhzF/x49txYsBZxrvblPcy0+RIlxCjzois
        EitDHP301bteQVeRGAG2VPi3Gw==
X-Google-Smtp-Source: AK7set9iLtdcKYLHByOMYUmRUIu65Ea5Hw5aWGFbpKZ/kGCqm6QdCzJx2CrA7viecRrNMMUC+Km2Pg==
X-Received: by 2002:a1c:4b05:0:b0:3ed:f9d3:f961 with SMTP id y5-20020a1c4b05000000b003edf9d3f961mr2209218wma.29.1679404912594;
        Tue, 21 Mar 2023 06:21:52 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id v26-20020a05600c215a00b003eafc47eb09sm13393016wml.43.2023.03.21.06.21.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 06:21:52 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Tue, 21 Mar 2023 14:21:51 +0100
Subject: [PATCH v5 11/12] arm64: dts: qcom: sm8550-mtp: add pmic glink node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230130-topic-sm8450-upstream-pmic-glink-v5-11-552f3b721f9e@linaro.org>
References: <20230130-topic-sm8450-upstream-pmic-glink-v5-0-552f3b721f9e@linaro.org>
In-Reply-To: <20230130-topic-sm8450-upstream-pmic-glink-v5-0-552f3b721f9e@linaro.org>
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
X-Mailer: b4 0.12.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the pmic glink node linked with the DWC3 USB controller
switched to OTG mode and tagged with usb-role-switch.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550-mtp.dts | 45 ++++++++++++++++++++++++++++++++-
 1 file changed, 44 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
index 9d4ddb883a70..e2b9bb6b1e27 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
@@ -27,6 +27,40 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	pmic-glink {
+		compatible = "qcom,sm8550-pmic-glink", "qcom,pmic-glink";
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
+
+				port@0 {
+					reg = <0>;
+
+					pmic_glink_hs_in: endpoint {
+						remote-endpoint = <&usb_1_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					pmic_glink_ss_in: endpoint {
+						remote-endpoint = <&usb_1_dwc3_ss>;
+					};
+				};
+			};
+		};
+	};
+
 	vph_pwr: vph-pwr-regulator {
 		compatible = "regulator-fixed";
 		regulator-name = "vph_pwr";
@@ -561,7 +595,16 @@ &usb_1 {
 };
 
 &usb_1_dwc3 {
-	dr_mode = "peripheral";
+	dr_mode = "otg";
+	usb-role-switch;
+};
+
+&usb_1_dwc3_hs {
+	remote-endpoint = <&pmic_glink_hs_in>;
+};
+
+&usb_1_dwc3_ss {
+	remote-endpoint = <&pmic_glink_ss_in>;
 };
 
 &usb_1_hsphy {

-- 
2.34.1

