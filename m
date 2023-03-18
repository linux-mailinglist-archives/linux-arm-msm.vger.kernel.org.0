Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 871E56BF9EC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Mar 2023 13:19:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229841AbjCRMS7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 18 Mar 2023 08:18:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229925AbjCRMS6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 18 Mar 2023 08:18:58 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 474FA3D0AE
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Mar 2023 05:18:49 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id r19-20020a05600c459300b003eb3e2a5e7bso4840480wmo.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Mar 2023 05:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679141929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WI0JWAq1Qy9TsaI8cMhQK4FjxjeVaLM5k+fSC4hp/Qw=;
        b=TrV66uIedf+yF19hp/cGovG0zW335l6n/XEgCu0TAd3XmmOawfE2v5VRQCBywmykon
         Ku43GWWsNo72z/kZD1/MZIzKJZHObC3stVPPYUuV6048a7Wp/UmTjYiZzMSa4ExNjE5k
         xSWWVFWm5GwP9Of+YYvMNbpRxT+yC6Ha0vwkiPZ3OhVmqe3zSirAiVgIa44Q2hBmNr94
         Vvoe1cSaP+JQSW0C+nPH2LQnKWVN0rn35MrVKQRzBZOHfUvV/ihGXBWCypHeScH6eZHy
         k9ZHmkj/QuNV82xJLtp+JU+Iv885B4KiSW+Nydn8sGNwPCygrZFFOmRMT5yHLsE7bLDw
         Fw8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679141929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WI0JWAq1Qy9TsaI8cMhQK4FjxjeVaLM5k+fSC4hp/Qw=;
        b=x9UDFfkmhdFTzt9OofByex0pzEOrQGYDWCQOkCJbZxgEJ/mO48yiShSmsO7w5mxTSv
         4OTn/aVRExRmFf93uTMg5gJci1K/tkQkm7E2j3uHbmIx8tsVEyi06hUNyfXNY3txXekM
         AGYPGfZBH+eicb6W1eqob0EC0qOd7fGECbrSVxrnGjwVjwLMqQWOcbBIDd+fzz0++fKB
         QwqN2IPH4KWhvpqUk7sxwJrBKLXmUE58WrUSy8jVRM0+cdhcJADAQxRZTG5AEhKrVwx7
         drxkKj3TaHmenoGIQ4cqnTopK3JZDNcLSQUi/cKhOCnYk1kdbAUir524U5O0D4Mh5BFc
         7K1w==
X-Gm-Message-State: AO0yUKUewmKW878+gFFZh40aEhvyx74hihldJKBpCIRWn43LMpBA+hT1
        8w5HFtOvNLHm6no3KuMtMQcXRg==
X-Google-Smtp-Source: AK7set8Dli9SYmFUEc+jzvDBSGXNZzhLikV+Bz3HnfvvnjI+1w2/LdXLsJxkW1WMwq2U4Y8p5/BeBw==
X-Received: by 2002:a05:600c:4fc8:b0:3ed:1f98:670f with SMTP id o8-20020a05600c4fc800b003ed1f98670fmr4001689wmq.20.1679141929484;
        Sat, 18 Mar 2023 05:18:49 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id az40-20020a05600c602800b003e2096da239sm10814997wmb.7.2023.03.18.05.18.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Mar 2023 05:18:48 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, andersson@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     wcheng@codeaurora.org, caleb.connolly@linaro.org,
        bryan.odonoghue@linaro.org, konrad.dybcio@linaro.org,
        subbaram@quicinc.com, jackp@quicinc.com, robertom@qti.qualcomm.com
Subject: [PATCH v4 14/18] arm64: dts: qcom: pm8150b: Add a TCPM description
Date:   Sat, 18 Mar 2023 12:18:24 +0000
Message-Id: <20230318121828.739424-15-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230318121828.739424-1-bryan.odonoghue@linaro.org>
References: <20230318121828.739424-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Type-C port management functionality lives inside of the PMIC block on
pm8150b.

The Type-C port management logic controls orientation detection, vbus/vconn
sense and to send/receive Type-C Power Domain messages.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/pm8150b.dtsi | 70 +++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm8150b.dtsi b/arch/arm64/boot/dts/qcom/pm8150b.dtsi
index 66752cc063d60..6db32bdbf5747 100644
--- a/arch/arm64/boot/dts/qcom/pm8150b.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8150b.dtsi
@@ -7,6 +7,8 @@
 #include <dt-bindings/iio/qcom,spmi-vadc.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/spmi/spmi.h>
+#include <dt-bindings/usb/typec/qcom,pmic-typec.h>
+#include <dt-bindings/usb/typec/qcom,pmic-pdphy.h>
 
 / {
 	thermal-zones {
@@ -37,6 +39,14 @@ trip2 {
 			};
 		};
 	};
+
+	tcpm: pm8150b-tcpm {
+		compatible = "qcom,pmic-virt-tcpm";
+		qcom,pmic-typec = <&pm8150b_typec>;
+		qcom,pmic-pdphy = <&pm8150b_pdphy>;
+
+		status = "disabled";
+	};
 };
 
 &spmi_bus {
@@ -59,6 +69,66 @@ pm8150b_vbus: usb-vbus-regulator@1100 {
 			reg = <0x1100>;
 		};
 
+		pm8150b_typec: typec@1500 {
+			compatible = "qcom,pm8150b-typec";
+			reg = <0x1500>;
+			interrupts = <0x2 0x15 PMIC_TYPEC_OR_RID_IRQ
+				      IRQ_TYPE_EDGE_RISING>,
+				     <0x2 0x15 PMIC_TYPEC_VPD_IRQ
+				      IRQ_TYPE_EDGE_BOTH>,
+				     <0x2 0x15 PMIC_TYPEC_CC_STATE_IRQ
+				      IRQ_TYPE_EDGE_RISING>,
+				     <0x2 0x15 PMIC_TYPEC_VCONN_OC_IRQ
+				      IRQ_TYPE_EDGE_BOTH>,
+				     <0x2 0x15 PMIC_TYPEC_VBUS_IRQ
+				      IRQ_TYPE_EDGE_RISING>,
+				     <0x2 0x15 PMIC_TYPEC_ATTACH_DETACH_IRQ
+				      IRQ_TYPE_EDGE_RISING>,
+				     <0x2 0x15 PMIC_TYPEC_LEGACY_CABLE_IRQ
+				      IRQ_TYPE_EDGE_BOTH>,
+				     <0x2 0x15 PMIC_TYPEC_TRY_SNK_SRC_IRQ
+				      IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "or-rid-detect-change",
+					  "vpd-detect",
+					  "cc-state-change",
+					  "vconn-oc",
+					  "vbus-change",
+					  "attach-detach",
+					  "legacy-cable-detect",
+					  "try-snk-src-detect";
+			vdd-vbus-supply = <&pm8150b_vbus>;
+		};
+
+		pm8150b_pdphy: pdphy@1700 {
+			compatible = "qcom,pm8150b-pdphy";
+			reg = <0x1700>;
+			interrupts = <0x2 0x17 PMIC_PDPHY_SIG_TX_IRQ
+				      IRQ_TYPE_EDGE_RISING>,
+				     <0x2 0x17 PMIC_PDPHY_SIG_RX_IRQ
+				      IRQ_TYPE_EDGE_RISING>,
+				     <0x2 0x17 PMIC_PDPHY_MSG_TX_IRQ
+				      IRQ_TYPE_EDGE_RISING>,
+				     <0x2 0x17 PMIC_PDPHY_MSG_RX_IRQ
+				      IRQ_TYPE_EDGE_RISING>,
+				     <0x2 0x17 PMIC_PDPHY_MSG_TX_FAIL_IRQ
+				      IRQ_TYPE_EDGE_RISING>,
+				     <0x2 0x17 PMIC_PDPHY_MSG_TX_DISCARD_IRQ
+				      IRQ_TYPE_EDGE_RISING>,
+				     <0x2 0x17 PMIC_PDPHY_MSG_RX_DISCARD_IRQ
+				      IRQ_TYPE_EDGE_RISING>,
+				     <0x2 0x17 PMIC_PDPHY_FR_SWAP_IRQ
+				      IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "sig-tx",
+					  "sig-rx",
+					  "msg-tx",
+					  "msg-rx",
+					  "msg-tx-failed",
+					  "msg-tx-discarded",
+					  "msg-rx-discarded",
+					  "fr-swap";
+			vdd-phy-supply = <&vreg_l2a_3p1>;
+		};
+
 		pm8150b_temp: temp-alarm@2400 {
 			compatible = "qcom,spmi-temp-alarm";
 			reg = <0x2400>;
-- 
2.39.2

