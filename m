Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B96386AA3E4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Mar 2023 23:09:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233471AbjCCWJW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Mar 2023 17:09:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233586AbjCCWIz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Mar 2023 17:08:55 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FA206424D
        for <linux-arm-msm@vger.kernel.org>; Fri,  3 Mar 2023 13:59:31 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id g17so5398893lfv.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Mar 2023 13:59:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677880703;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dIy97MlLq0rj6R7WBk66We2Y8cheU7mrKCO9U6h0C2I=;
        b=KXTD2I7egTk7SuX2R0F75t8v9OUYAimGS+m4oBeKjc44cxrS+CLibwdEaNfVfr6M9C
         Up3lDpMq2k69HtlvZ41ed9iHPAYPuR3ljrIgchkTCkLnq4ttyR+3YOsxM5lJKbSF2HaL
         sjjF6hg3wxJsNMX3uVRLPIawva7Q9FktwsfzqexjdJH5PQIu4q3bgQlivSn8uJtv1aLy
         UBV4JdXmzkZyUAsyv6oA0pNjU3CYawqw9/j34WwGvj8D8GLSXC0XxxfHygchigpGCmcR
         vHYKQW709JYenWtzjymrb9YB0Zo0Kv70qT/SRmWcOIzqwESaAJU1ReyyBWkksKds/G7N
         w7sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677880703;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dIy97MlLq0rj6R7WBk66We2Y8cheU7mrKCO9U6h0C2I=;
        b=tWfqGGtzODvi3HxIDIwbWhM/3J+RGGR8DyKanUtCuvNwYmH1XcudssD5hg01SuAFKy
         cnDIa96UwsRKjEJJhl/IHw5IS95huyfIyrfgiJpVey1ZI3nL0xRvPAIOmzf6bB0PSRhi
         cfHQYrCjEXJZG9yjEsiYuSbiNu8bLWgSa5Q9U6kC/PUfrOkSg0+YNAa/eePPt8okqLXz
         AbljC0S/ET5iOtRqSMCpJXnF2xumi69KqJNdtXKT8GZQcaE0bzRVDCY2tm4/xFZZ+SEi
         m6+HbjAGaXHjoE01niYrqmjT0gf5TW/K1UVopPmv9nUL5bF/FQD+HV0cxPhzNcbdOblI
         BaRg==
X-Gm-Message-State: AO0yUKUT6o8U6omFEGVSypWwZ8xfz/7np3ZQf96kA9b8S4qU8IogUQm1
        /ToreImk1CXkaQaSIT1w2battA==
X-Google-Smtp-Source: AK7set8HQBC0fU9KjBOzvd9fU0aHQXoZn+05l05oJl8iRbAXOCfuOxeCmhTyu5C88qs2JNxIk+qf4A==
X-Received: by 2002:a19:7614:0:b0:4e0:ce21:b92 with SMTP id c20-20020a197614000000b004e0ce210b92mr1051356lff.16.1677880703035;
        Fri, 03 Mar 2023 13:58:23 -0800 (PST)
Received: from [192.168.1.101] (abym99.neoplus.adsl.tpnet.pl. [83.9.32.99])
        by smtp.gmail.com with ESMTPSA id e27-20020ac2547b000000b004cafa01ebbfsm552670lfn.101.2023.03.03.13.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 13:58:22 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Fri, 03 Mar 2023 22:58:08 +0100
Subject: [PATCH 08/15] arm64: dts: qcom: sm6375: Add modem nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230303-topic-sm6375_features0_dts-v1-8-8c8d94fba6f0@linaro.org>
References: <20230303-topic-sm6375_features0_dts-v1-0-8c8d94fba6f0@linaro.org>
In-Reply-To: <20230303-topic-sm6375_features0_dts-v1-0-8c8d94fba6f0@linaro.org>
To:     Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Georgi Djakov <djakov@kernel.org>,
        Sibi Sankar <quic_sibis@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1677880689; l=2988;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=93tjFAm3KE3wlOIxpjBJdVGBzNUVK9fKZaM4nNn4KS8=;
 b=pwKO0/M2FqeHx3dB2gg68oBMUOr1ydRxxOUnKx+GLZ7BadpXYciYEIVO21+lwdaSQeWOSG5KPcpW
 zOXO+Mw7DSHYDHIz3+KwnDZsnDxRgGEvxkIh5ROVTi2OfdkMVjY2
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add required nodes to make the embedded 5G modem boot up on SM6375.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm6375.dtsi | 82 ++++++++++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6375.dtsi b/arch/arm64/boot/dts/qcom/sm6375.dtsi
index e473a90f3dea..90f18754a63b 100644
--- a/arch/arm64/boot/dts/qcom/sm6375.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6375.dtsi
@@ -565,6 +565,47 @@ smp2p_cdsp_in: slave-kernel {
 		};
 	};
 
+	smp2p-modem {
+		compatible = "qcom,smp2p";
+		qcom,smem = <435>, <428>;
+		interrupts-extended = <&ipcc IPCC_CLIENT_MPSS
+					     IPCC_MPROC_SIGNAL_SMP2P
+					     IRQ_TYPE_EDGE_RISING>;
+		mboxes = <&ipcc IPCC_CLIENT_MPSS
+				IPCC_MPROC_SIGNAL_SMP2P>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <1>;
+
+		smp2p_modem_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		smp2p_modem_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		ipa_smp2p_out: ipa-ap-to-modem {
+			qcom,entry-name = "ipa";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		ipa_smp2p_in: ipa-modem-to-ap {
+			qcom,entry-name = "ipa";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		wlan_smp2p_in: wlan-wpss-to-ap {
+			qcom,entry-name = "wlan";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
 	soc: soc@0 {
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -1170,6 +1211,47 @@ usb_1_dwc3: usb@4e00000 {
 			};
 		};
 
+		remoteproc_mss: remoteproc@6000000 {
+			compatible = "qcom,sm6375-mpss-pas";
+			reg = <0 0x06000000 0 0x4040>;
+
+			interrupts-extended = <&intc GIC_SPI 307 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_modem_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_modem_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_modem_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_modem_in 3 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_modem_in 7 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack",
+					  "shutdown-ack";
+
+			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>;
+			clock-names = "xo";
+
+			power-domains = <&rpmpd SM6375_VDDCX>;
+			power-domain-names = "cx";
+
+			memory-region = <&pil_mpss_wlan_mem>;
+
+			qcom,smem-states = <&smp2p_modem_out 0>;
+			qcom,smem-state-names = "stop";
+
+			status = "disabled";
+
+			glink-edge {
+				interrupts-extended = <&ipcc IPCC_CLIENT_MPSS
+							     IPCC_MPROC_SIGNAL_GLINK_QMP
+							     IRQ_TYPE_EDGE_RISING>;
+				mboxes = <&ipcc IPCC_CLIENT_MPSS
+						IPCC_MPROC_SIGNAL_GLINK_QMP>;
+				label = "modem";
+				qcom,remote-pid = <1>;
+			};
+		};
+
 		remoteproc_adsp: remoteproc@a400000 {
 			compatible = "qcom,sm6375-adsp-pas";
 			reg = <0 0x0a400000 0 0x100>;

-- 
2.39.2

