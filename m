Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1C10358AD7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Apr 2021 19:06:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232665AbhDHRGX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Apr 2021 13:06:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232566AbhDHRGA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Apr 2021 13:06:00 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B0A2C0613E0
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Apr 2021 10:05:48 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id ep1-20020a17090ae641b029014d48811e37so1734695pjb.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Apr 2021 10:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3x6NN0RMF6oM3dbqENncJ4pFgq9ZKIyr1RsN2Tb2XX8=;
        b=NRAy4n+M8JIo/MIPJ7wWmm2Nghtrk0v0IMH60Z9LkBM0OhvUOLCE2X+4n7kq8hwPMb
         Bj+/b314XEZAolws4BAfpOxjekvhUPwYwWK1fn6kzVkuYzSY/19802VFalFHExfnXfpE
         pDU8KnMPR81IQqHQLnh8mFb0dA8MW/169NPaNGf+9qhTRThFiPNX05ZbYQlZD+MOYad3
         KU3YgJOUTJXnX6DXaC9MlmS93lJVc07LfhnNXMpa3/PzRKvqzCD21fhqLMgPid3njDCG
         7Syam/5V3PUREw9OSiFxOjXUjK7Cwk04TmCZiCmTuiBa16BNNpYGqGFi32wO61cDE50Z
         VQEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3x6NN0RMF6oM3dbqENncJ4pFgq9ZKIyr1RsN2Tb2XX8=;
        b=i1zEd9k41idTHf1/0Nwd20CFEhwdYDI5pJhicyZG5kYA23txlP4JAn30qx8y9A2F//
         Mu3WvtGa7swp649gAO5iooHfdYtbWNzlAW/FVWa0YihlFk6IEacUm43Aj/5iHuT9fyve
         3dNGnWts4fpmZv/z5u3PK8CVU7/+7ZCTsku6yauD4tpyrSR9RA9zZEOsawkos0MwnBPj
         9ax9W0WAa5vXvCACpWQ+q2eXbIjV7Q9upTytr4GWK55Le7mDw9Ivxpxh1W5BRQjgrXrL
         5KYIRZxlnM+4dH73YXf/hPvc0qKm1Iac6P0RuKBAWG6yG5rZfWekANAI3qECrSxW9zzE
         g4EQ==
X-Gm-Message-State: AOAM530OlytrBaTqMZVF2lYMrKMSr5PjWLdirGgm3E358vVAMU5oGw0E
        6Gmj/E8JWrSQGKAQpY+ZkT8I
X-Google-Smtp-Source: ABdhPJxZ9ceevhue4KAsxMou2ASMZad2hEJM1+3mn4l2Mzr7yr6xD04auXkO1OvEXuoUV2P4XZ12Ug==
X-Received: by 2002:a17:902:8bcb:b029:e6:a4a1:9d7e with SMTP id r11-20020a1709028bcbb02900e6a4a19d7emr8602380plo.25.1617901547954;
        Thu, 08 Apr 2021 10:05:47 -0700 (PDT)
Received: from localhost.localdomain ([103.77.37.191])
        by smtp.gmail.com with ESMTPSA id y194sm65183pfb.21.2021.04.08.10.05.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 10:05:47 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 15/15] ARM: dts: qcom: sdx55: Add Modem remoteproc node
Date:   Thu,  8 Apr 2021 22:34:57 +0530
Message-Id: <20210408170457.91409-16-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210408170457.91409-1-manivannan.sadhasivam@linaro.org>
References: <20210408170457.91409-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add modem support to SDX55 using the PAS remoteproc driver.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 .../boot/dts/qcom-sdx55-telit-fn980-tlb.dts   |  5 +++
 arch/arm/boot/dts/qcom-sdx55.dtsi             | 33 +++++++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-sdx55-telit-fn980-tlb.dts b/arch/arm/boot/dts/qcom-sdx55-telit-fn980-tlb.dts
index 6da366ec15b3..3065f84634b8 100644
--- a/arch/arm/boot/dts/qcom-sdx55-telit-fn980-tlb.dts
+++ b/arch/arm/boot/dts/qcom-sdx55-telit-fn980-tlb.dts
@@ -255,6 +255,11 @@ nand@0 {
 	};
 };
 
+&remoteproc_mpss {
+	status = "okay";
+	memory-region = <&mpss_adsp_mem>;
+};
+
 &usb_hsphy {
 	status = "okay";
 	vdda-pll-supply = <&vreg_l4e_bb_0p875>;
diff --git a/arch/arm/boot/dts/qcom-sdx55.dtsi b/arch/arm/boot/dts/qcom-sdx55.dtsi
index aa3edecf5810..bed83d1ddc29 100644
--- a/arch/arm/boot/dts/qcom-sdx55.dtsi
+++ b/arch/arm/boot/dts/qcom-sdx55.dtsi
@@ -328,6 +328,39 @@ sdhc_1: sdhci@8804000 {
 			status = "disabled";
 		};
 
+		remoteproc_mpss: remoteproc@4080000 {
+			compatible = "qcom,sdx55-mpss-pas";
+			reg = <0x04080000 0x4040>;
+
+			interrupts-extended = <&intc GIC_SPI 250 IRQ_TYPE_EDGE_RISING>,
+					      <&modem_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&modem_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&modem_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&modem_smp2p_in 3 IRQ_TYPE_EDGE_RISING>,
+					      <&modem_smp2p_in 7 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog", "fatal", "ready", "handover",
+					  "stop-ack", "shutdown-ack";
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "xo";
+
+			power-domains = <&rpmhpd SDX55_CX>,
+					<&rpmhpd SDX55_MSS>;
+			power-domain-names = "cx", "mss";
+
+			qcom,smem-states = <&modem_smp2p_out 0>;
+			qcom,smem-state-names = "stop";
+
+			status = "disabled";
+
+			glink-edge {
+				interrupts = <GIC_SPI 114 IRQ_TYPE_EDGE_RISING>;
+				label = "mpss";
+				qcom,remote-pid = <1>;
+				mboxes = <&apcs 15>;
+			};
+		};
+
 		usb: usb@a6f8800 {
 			compatible = "qcom,sdx55-dwc3", "qcom,dwc3";
 			reg = <0x0a6f8800 0x400>;
-- 
2.25.1

