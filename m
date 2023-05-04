Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE1D06F6782
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 May 2023 10:30:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230376AbjEDIaz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 May 2023 04:30:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229751AbjEDIaV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 May 2023 04:30:21 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 541BB5FD0
        for <linux-arm-msm@vger.kernel.org>; Thu,  4 May 2023 01:27:30 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-64115eef620so10642032b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 May 2023 01:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683188847; x=1685780847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=COJNbf8X1QXmXQi0xblWwRsADPSolif0cLFJONfAOSY=;
        b=jS5Ks9QKbtZG86PD7o8WW1wCSZ+5f//pd5Ym3kY59p/4EsygOn+psSvk9YGkswETvM
         WYP/iEUIu+WOMMU+NrhU16of7CdeCFKhX7222BgtQF/xLC7jB5o9rplx1OD4uOkYGFf/
         CsjDUJjyJhI8uWJduemRdPWdmaDympOWfUPG4OBLT0jLMV8/h/iIVd9BDMIhvZBqngmD
         xblEFOr/NguajqFWhb+wk1xIu8Y0nkoVfNs7Gqqc3jsRRt8VhWvaisgM1SOfK0CA/dMz
         fkf8Ic53cpeUsmVZul8PilH3IfihN858qMhcEMLS4hB73WfvOkZooeyo8b7ALsZSNvw5
         FhpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683188847; x=1685780847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=COJNbf8X1QXmXQi0xblWwRsADPSolif0cLFJONfAOSY=;
        b=fOrMc/SLWNttyK5WdaeKAi8aqvG1snEf+OmsD8IndCQ+WJr+QPC89/3t0C+0dDBVGK
         iRc2hdAKalIwVRF4OMAnNOcr7PTP1VJ5ZnaO+BDHuWAw71nNuphAFNL9+0OVu27kgbjh
         q5wNVY1t2yN+AKQQjh6tbUkdFjIXO2F/xq3oVjIbnXn0b8PqykAB5LDQJ1GaLAoa36Wb
         d/tCm/zIcneimjJC4ExwaXh+omD6wwt6kmOAoDlNmazESsGhMA5Udb594vmTnlYSEKmD
         dKikEfYa7ZE4v8WPTyCf/lu6Q8PjzOdwood41L3fHAfMXOd6kuc5c4+MeFZfAAsNUNhv
         R8cg==
X-Gm-Message-State: AC+VfDxhz9XVk/Ax+30D5FB8V5O7967wDv27hR7yKV7GkNAWES1rvQC1
        1dItF1mRO9SBLNR01pI1EL3sjaBUP26LY27EdYU=
X-Google-Smtp-Source: ACHHUZ5LvqEtzAzPtkkWN7jUUp3stg1KN+12dK//XzhtRsniZm60Q/rSMr5SkUmAQYyldMNMkNTRuQ==
X-Received: by 2002:a05:6a00:23d5:b0:643:b00:8899 with SMTP id g21-20020a056a0023d500b006430b008899mr1389950pfc.15.1683188847354;
        Thu, 04 May 2023 01:27:27 -0700 (PDT)
Received: from localhost.localdomain ([223.233.65.180])
        by smtp.gmail.com with ESMTPSA id s1-20020a056a00178100b00625d84a0194sm24913973pfg.107.2023.05.04.01.27.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 May 2023 01:27:27 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        linux-kernel@vger.kernel.org, bhupesh.linux@gmail.com,
        bhupesh.sharma@linaro.org, robh+dt@kernel.org,
        linux-usb@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
        krzysztof.kozlowski@linaro.org
Subject: [PATCH v3 4/5] arm64: dts: qcom: sm6115: Add EUD dt node and dwc3 connector
Date:   Thu,  4 May 2023 13:56:43 +0530
Message-Id: <20230504082644.1461582-5-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230504082644.1461582-1-bhupesh.sharma@linaro.org>
References: <20230504082644.1461582-1-bhupesh.sharma@linaro.org>
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

Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm6115.dtsi | 48 ++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index f67863561f3f..6865342fc42f 100644
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
@@ -647,6 +659,35 @@ gcc: clock-controller@1400000 {
 			#power-domain-cells = <1>;
 		};
 
+		eud: eud@1610000 {
+			compatible = "qcom,sm6115-eud", "qcom,eud";
+			reg = <0x0 0x01610000 0x0 0x2000>,
+			      <0x0 0x01612000 0x0 0x1000>,
+			      <0x0 0x003c0000 0x0 0x40000>;
+			interrupts = <GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH>;
+			qcom,secure-mode-enable;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					eud_ep: endpoint {
+						remote-endpoint = <&usb2_role_switch>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
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
@@ -1144,6 +1185,13 @@ usb_dwc3: usb@4e00000 {
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

