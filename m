Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D180705999
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 May 2023 23:33:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231232AbjEPVdt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 May 2023 17:33:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231187AbjEPVdm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 May 2023 17:33:42 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C4DE83E3
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 May 2023 14:33:35 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1aaea43def7so1204425ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 May 2023 14:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684272815; x=1686864815;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TaOxHre3ovU7Pucxt1LaFOdz4xHkq3r9vi0PelhMX8M=;
        b=ne06lyEwjM7O4iAjEMmkP2olsQa1SYoyDcr9IDMCIw/mkTZF47zsnrWyWxg3YT32fE
         9s9hdew09T72tnaBYay273DCw62AyaooCF0d0pctaYULw3Aw/eD0vQVJgvytl8wxEzB6
         vgsRJUddY3JDFOj7NB5yoGvd9Ti1s9LwqaFDfTAyQk3+L0aaKW+FV4Cr/Tm89f0BPx5I
         vuhsNqWySr6VIOLa0O679cqCuGPDQ4HWS2+8kdwHe77d5qcagN0PXw21d6KMv+4Ymxlu
         WHni67YyZYkyb9YvNL1YjK5PwoixZxgVNOzoG8MOIJ0w+2zUlUR1ZJb14itaqpAIihdL
         zBYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684272815; x=1686864815;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TaOxHre3ovU7Pucxt1LaFOdz4xHkq3r9vi0PelhMX8M=;
        b=TpVihuqojtHYW6nGXxvThJovKmo34ExaE/yeCCQTfEs1bpPPIJIDL+eSKLo+Mhxcsn
         7Ls9KJUrcVLgB+RnkpNCxp1eeg8OCrQGKTqJtwAT7Fe12y+Hh4Ga/ysxYWEQnukZtP/1
         x3yiQs52x80KzYoTkdzAY97MQMIOWj/MQfVKEWQGHlTKt/k3ko7V0z2I1BdQHLRKZvMu
         LC35WqAa/83zxn5KE6BAZq9wFUYFGE1wRhwaOJREVZ8aJ3+GNXnhdVociUoysDvCrKb8
         XgRboc3Wqnte6QC+O34sm60i/1+qSM76KrDhGmFGbruf9oHCTjzlVpQcgC5Xgyz7WIKa
         DkRA==
X-Gm-Message-State: AC+VfDwbkAV9fNFdQL4zLVzHWFpgSZwMNjbkOReLcd+w9rSnURIVTepB
        ia4MGTst9Ck7tnheMxWrEiwYnVaoGWZNAsp0Atg=
X-Google-Smtp-Source: ACHHUZ4ZGljxUp/iPSpE0amboQqfvsm8xUGfCjrmqOst9hNkLm6F0dhVR7oqm9/JWDtyvW1rK3EdAQ==
X-Received: by 2002:a17:902:e74f:b0:1ad:b5b4:e424 with SMTP id p15-20020a170902e74f00b001adb5b4e424mr25731499plf.38.1684272814957;
        Tue, 16 May 2023 14:33:34 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1c60:6bed:7a51:340a:a439:1b87])
        by smtp.gmail.com with ESMTPSA id jh19-20020a170903329300b001ac7af57fd4sm16027676plb.86.2023.05.16.14.33.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 May 2023 14:33:34 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        linux-kernel@vger.kernel.org, bhupesh.linux@gmail.com,
        bhupesh.sharma@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, krzysztof.kozlowski@linaro.org
Subject: [PATCH v5 4/5] arm64: dts: qcom: sm6115: Add EUD dt node and dwc3 connector
Date:   Wed, 17 May 2023 03:03:07 +0530
Message-Id: <20230516213308.2432018-5-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230516213308.2432018-1-bhupesh.sharma@linaro.org>
References: <20230516213308.2432018-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the Embedded USB Debugger(EUD) device tree node for
SM6115 / SM4250 SoC.

The node contains EUD base register region, EUD mode manager
register region and TCSR Base register region along with the
interrupt entry.

Also add the typec connector node for EUD which is attached to
EUD node via port. EUD is also attached to DWC3 node via port.

To enable the role switch, we need to set dr_mode = "otg" property
for 'usb_dwc3' sub-node in the board dts file.

Also the EUD device can be enabled on a board once linux is boot'ed
by setting:
 $ echo 1 > /sys/bus/platform/drivers/qcom_eud/../enable

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm6115.dtsi | 50 ++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index f67863561f3f..92a82d7172ca 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -180,6 +180,18 @@ core3 {
 		};
 	};
 
+	eud_typec: connector {
+		compatible = "usb-c-connector";
+
+		ports {
+			port@0 {
+				con_eud: endpoint {
+					remote-endpoint = <&eud_con>;
+				};
+			};
+		};
+	};
+
 	firmware {
 		scm: scm {
 			compatible = "qcom,scm-sm6115", "qcom,scm";
@@ -647,6 +659,37 @@ gcc: clock-controller@1400000 {
 			#power-domain-cells = <1>;
 		};
 
+		eud: eud@1610000 {
+			compatible = "qcom,sm6115-eud", "qcom,eud";
+			reg = <0x0 0x01610000 0x0 0x2000>,
+			      <0x0 0x01612000 0x0 0x1000>,
+			      <0x0 0x003c0000 0x0 0x40000>;
+			reg-names = "eud-base", "eud-mode-mgr", "tcsr-base";
+			interrupts = <GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					eud_ep: endpoint {
+						remote-endpoint = <&usb2_role_switch>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					eud_con: endpoint {
+						remote-endpoint = <&con_eud>;
+					};
+				};
+			};
+		};
+
 		usb_hsphy: phy@1613000 {
 			compatible = "qcom,sm6115-qusb2-phy";
 			reg = <0x0 0x01613000 0x0 0x180>;
@@ -1144,6 +1187,13 @@ usb_dwc3: usb@4e00000 {
 				snps,has-lpm-erratum;
 				snps,hird-threshold = /bits/ 8 <0x10>;
 				snps,usb3_lpm_capable;
+				usb-role-switch;
+
+				port {
+					usb2_role_switch: endpoint {
+						remote-endpoint = <&eud_ep>;
+					};
+				};
 			};
 		};
 
-- 
2.38.1

