Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 06DDE6BEC5D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Mar 2023 16:06:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230259AbjCQPGw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Mar 2023 11:06:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231428AbjCQPEq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Mar 2023 11:04:46 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA19D145B7F
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Mar 2023 08:04:33 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id i9so4727964wrp.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Mar 2023 08:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679065473;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ReaB5rrl626TQ7XHSiG6p5ZQGCluXJKDnds+E5f0Tbc=;
        b=WXhjrIdAfVHiF8NLxeoCPXbaxeGSHYyJODGYN92G5ELpkBJl/TJxTcpfFC4SvwHodI
         I+x1StaIafDJDnHYR8fDDBRJGiSPXiBZKWqIvn/x21r5fCkOWlHg3X0vI90agqM1TbEA
         1p9tbt8fD3JfhiNaKZyVXCkbWXU+ZqbsI94NtW/f8WRTcU3ZzqSqjgcwV4V/N2x428au
         gh2X8b6sBiezzOjqlEMdf8Ifu1wHyh8dtZHtw24vXQVwdqU2TUyWh6xbQC7gzq6I+pYu
         lAWCLk0zpGKaJbUpwPcCqx8eXVyQs837KvOucT0Q9NKLPWEDf/p8CGKGaMnVa6zce6l/
         Rqrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679065473;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ReaB5rrl626TQ7XHSiG6p5ZQGCluXJKDnds+E5f0Tbc=;
        b=OTMtl3AMlEIGCSTJoaEeIVgMmGyVwV7pdIW3c5oiihM6e4W1gHc7IFuxfv9/1+bTij
         z1oxLU+b3brwh6IKSHNMZV+fgCZSwSWyRtQ8QMp+LDlkD6qEyoMygr4lhO35eHlDr7vG
         uajVt5JCxaJ2/OUmORcpEU3AFFc7E+85kKaux+edAfNQOuVT0RWgzv5kUaLdQ4PkpW5g
         gAA2qsiFuSZn3fQEecdT22tlUrkuMquXeAzqfq4Pjc3+Xcn1vnCgTOxCpvrmxXvmg9Eo
         e1cPS4gmjy5tL5Cr+M/bjUsTZZk6xJ10tofXMVn3tqs0NpfB0+W2w0OCZQoFyC8Mp/xi
         1aBA==
X-Gm-Message-State: AO0yUKXU+6mY6gN/76LeFoPY5xse1vXcQELGDKzuk+dFWLgrDR8Wthr8
        elwUVZCec6UR+x3O7j5NC5mmNA==
X-Google-Smtp-Source: AK7set9YIM4syfd0k/zPwZ/LnKShfYni1ghT7/PXB6wYiPO+QFDsjuZ38afoWeaSCIyBTOXnWQ3i8w==
X-Received: by 2002:adf:f30a:0:b0:2cf:f061:4902 with SMTP id i10-20020adff30a000000b002cff0614902mr6996724wro.47.1679065473106;
        Fri, 17 Mar 2023 08:04:33 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id q14-20020a05600000ce00b002be505ab59asm2133773wrx.97.2023.03.17.08.04.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 08:04:32 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Fri, 17 Mar 2023 16:04:25 +0100
Subject: [PATCH v4 09/12] arm64: dts: qcom: sm8350-hdk: add pmic glink node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230130-topic-sm8450-upstream-pmic-glink-v4-9-38bf0f5d07bd@linaro.org>
References: <20230130-topic-sm8450-upstream-pmic-glink-v4-0-38bf0f5d07bd@linaro.org>
In-Reply-To: <20230130-topic-sm8450-upstream-pmic-glink-v4-0-38bf0f5d07bd@linaro.org>
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

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts | 67 ++++++++++++++++++++++++++++++++-
 1 file changed, 65 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
index 09baf6959c71..01affb16d039 100644
--- a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
@@ -31,6 +31,40 @@ hdmi_con: endpoint {
 		};
 	};
 
+	pmic-glink {
+		compatible = "qcom,sm8350-pmic-glink", "qcom,pmic-glink";
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
@@ -674,8 +708,37 @@ &usb_1 {
 };
 
 &usb_1_dwc3 {
-	/* TODO: Define USB-C connector properly */
-	dr_mode = "peripheral";
+	dr_mode = "otg";
+	usb-role-switch;
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			usb_1_dwc3_hs: endpoint {
+				remote-endpoint = <&pmic_glink_hs_in>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+
+			usb_1_dwc3_ss: endpoint {
+				remote-endpoint = <&pmic_glink_ss_in>;
+			};
+		};
+	};
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

