Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 490A17D9B18
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Oct 2023 16:20:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346102AbjJ0OUr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Oct 2023 10:20:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346144AbjJ0OUn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Oct 2023 10:20:43 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22539D55
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Oct 2023 07:20:36 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5406c099cebso3219675a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Oct 2023 07:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1698416434; x=1699021234; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3gjHEFUm80fZ96p4jtqSmwtfKBYmZPw1ufj7tVz3aJ8=;
        b=hAASgH4miMG9tQ6nv9Ljmp3mnLo6bL4rZk1ECBJtqOMCawuBxMCzq/R6e8veZcVHUO
         yM0D7kAKSNbP9S2KkwRbA0BoMiVm0iseksHOdvdobFbnA1eqzO/KWMSaWdr/+O1umZDm
         hsLO7BC4rrG3YYg3HjkNckfcKKYidEImXHBDgVzF39LUmT3Kq4mDBRK0LI7Izx/Vq3BV
         QI0w9esm+qWrVcoOi/7MJqdEvRYiyhjCKw6wdlyH5W36kWOFnzQR9FeOZ/IvAyaimJVV
         kLD9uRx9a6QW3pFe2oOckRV5EqZS7SBzUGaUXWslQ4uW9uH92UpDKfW8ReJ6Ks80051u
         K2Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698416434; x=1699021234;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3gjHEFUm80fZ96p4jtqSmwtfKBYmZPw1ufj7tVz3aJ8=;
        b=gDyFkm884NrwPZvuz7d/PKi39piEPBpeGhSWYd48cgUNsz9ILEOdDMRQc28GwQtrsZ
         7wikkrYAk6h4ldpH+JvkPZT2vq9OPmgG/xMKKIrugc8mNUAcsGiGn8C9P83le9ekEFlN
         hy70oMZa7SRhP87J3epwC9VxOHXc16c9X/RKRLFK2TrMBkdgQ9QTRHYk2xolBvTCyeC8
         cYZjzibb1jcc4To2r3baxoL5oYPCXSD6Zp8wGA71zA9lW/eRH+y9h9y/+QaRArEMfvAB
         bIJbPOimEmsndluNL905eDIILvvo2Z1yvosesS2+2n1U04ulyTLtT37MC5wCaF5s39gT
         khVg==
X-Gm-Message-State: AOJu0YxUxYYDV2pAHIDWtg0ookFelwSBuqxIR/jBnaVeqf9iecBAjl40
        FwCBN63tE2VGfy/8gzg2et5WkA==
X-Google-Smtp-Source: AGHT+IFFEum3ku3NgsmiyJ528uMp81r9kVcsKB66H9szS8+kJThVUi2qmB56bFGPngNR4k85urr72w==
X-Received: by 2002:a17:906:7489:b0:9b2:ccd8:2d2b with SMTP id e9-20020a170906748900b009b2ccd82d2bmr1634997ejl.77.1698416434453;
        Fri, 27 Oct 2023 07:20:34 -0700 (PDT)
Received: from otso.luca.vpn.lucaweiss.eu (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id z23-20020a170906075700b0099cc36c4681sm1254076ejb.157.2023.10.27.07.20.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Oct 2023 07:20:34 -0700 (PDT)
From:   Luca Weiss <luca.weiss@fairphone.com>
Date:   Fri, 27 Oct 2023 16:20:28 +0200
Subject: [PATCH 6/9] arm64: dts: qcom: sc7280: Add ADSP node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231027-sc7280-remoteprocs-v1-6-05ce95d9315a@fairphone.com>
References: <20231027-sc7280-remoteprocs-v1-0-05ce95d9315a@fairphone.com>
In-Reply-To: <20231027-sc7280-remoteprocs-v1-0-05ce95d9315a@fairphone.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>,
        =?utf-8?q?Matti_Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.12.3
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the node for the ADSP found on the SC7280 SoC, using standard
Qualcomm firmware.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 69 ++++++++++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 23bb6c41fca3..cc153f4e6979 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -3578,6 +3578,75 @@ qspi: spi@88dc000 {
 			status = "disabled";
 		};
 
+		remoteproc_adsp: remoteproc@3700000 {
+			compatible = "qcom,sc7280-adsp-pas";
+			reg = <0 0x03700000 0 0x100>;
+
+			interrupts-extended = <&pdc 6 IRQ_TYPE_LEVEL_HIGH>,
+					      <&adsp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&adsp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&adsp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&adsp_smp2p_in 3 IRQ_TYPE_EDGE_RISING>,
+					      <&adsp_smp2p_in 7 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog", "fatal", "ready", "handover",
+					  "stop-ack", "shutdown-ack";
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "xo";
+
+			power-domains = <&rpmhpd SC7280_LCX>,
+					<&rpmhpd SC7280_LMX>;
+			power-domain-names = "lcx", "lmx";
+
+			memory-region = <&adsp_mem>;
+
+			qcom,qmp = <&aoss_qmp>;
+
+			qcom,smem-states = <&adsp_smp2p_out 0>;
+			qcom,smem-state-names = "stop";
+
+			status = "disabled";
+
+			glink-edge {
+				interrupts-extended = <&ipcc IPCC_CLIENT_LPASS
+							     IPCC_MPROC_SIGNAL_GLINK_QMP
+							     IRQ_TYPE_EDGE_RISING>;
+
+				mboxes = <&ipcc IPCC_CLIENT_LPASS
+						IPCC_MPROC_SIGNAL_GLINK_QMP>;
+
+				label = "lpass";
+				qcom,remote-pid = <2>;
+
+				fastrpc {
+					compatible = "qcom,fastrpc";
+					qcom,glink-channels = "fastrpcglink-apps-dsp";
+					label = "adsp";
+					qcom,non-secure-domain;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					compute-cb@3 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <3>;
+						iommus = <&apps_smmu 0x1803 0x0>;
+					};
+
+					compute-cb@4 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <4>;
+						iommus = <&apps_smmu 0x1804 0x0>;
+					};
+
+					compute-cb@5 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <5>;
+						iommus = <&apps_smmu 0x1805 0x0>;
+					};
+				};
+			};
+		};
+
 		remoteproc_wpss: remoteproc@8a00000 {
 			compatible = "qcom,sc7280-wpss-pas";
 			reg = <0 0x08a00000 0 0x10000>;

-- 
2.42.0

