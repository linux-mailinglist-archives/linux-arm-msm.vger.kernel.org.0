Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 995B8472259
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Dec 2021 09:24:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232930AbhLMIYD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Dec 2021 03:24:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232897AbhLMIYA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Dec 2021 03:24:00 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22C8EC061756
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Dec 2021 00:24:00 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id y13so48911681edd.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Dec 2021 00:24:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5OtucOCvawfobrbHcXVhOtvyWLxWDxqsfH1lQJQrnfY=;
        b=b2PnGSWuGINO6Kc06wSvWB/2KCgGI1Az2mtYpXIZCMN2+N0W8TtaNbUh6bTa+tgDXr
         RhJXlZEtaUPFOshl3lbnvtuJQqxr0wz1lcZwIy0m/ev1DWIbOFsxJgKeOw76dOa3ag/5
         m+69i4aAyXaPYW8FOG4plEEPf3cGnYMmbiCgapwRK4NhQobjmPTsTwSCvNrbIKFzVTNv
         KcDVJkVQLxMY+VJbHP8JFRCZWHZoCDE51XFmPSoIdnyoyY4rBLUU2dcza2ameZPm949T
         8htFzJ6SYgEp04PXNUCGatNJbxyfbijnyfX4i+ESzBZ5PJgsB9q6uUIkubmj9cZzSZ4C
         MS5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5OtucOCvawfobrbHcXVhOtvyWLxWDxqsfH1lQJQrnfY=;
        b=B0L4J/ZRrEn3a2QOsYFAIsB+jFtPxkqzRQYah+HYsBdiJ8QnH+rcjR5U/2W4gUW+9z
         Viph8VEJXPuaYTzBbk07mB5n7mDWJIMRnOvwfpnQvoEwqCOgz/ejWn7yRiwGkRd+zbF8
         tEvCZLyDWTQPRRTnWVic1u12iHFZ20pOkrSpsHkQo/Wk1YrlYTADJZDT8i041NrBXvfX
         rZPiKI4NijRIi7kuX4XZKeIJuPxRQ+0ls1JeqLXldl3RHBBYyLrihIk7LUz1cqh0NWHN
         K41zJeqZKa/K000riFapH67Q10t/V0vm12Q1sCwthny7+onzyXg3M9TrM5gSLTJP6FsQ
         apbA==
X-Gm-Message-State: AOAM530PpgllnYZfLXA7AE9b3gkq8KSsq5KjQyhiWxt6H2BpxLDiJRGX
        PTuilI83cinDkBGG/P63F8tXx1iCZ6Cuu5g3jgM=
X-Google-Smtp-Source: ABdhPJwyA674Z/gyNKbInlldO/YhsQlOpSnq6T2TT3dlZZhrUq306LEmGAxdtjaueTbkS45BuyAgCA==
X-Received: by 2002:a05:6402:1453:: with SMTP id d19mr59965489edx.388.1639383838538;
        Mon, 13 Dec 2021 00:23:58 -0800 (PST)
Received: from localhost.localdomain ([2a02:a210:20c5:8c80:7d0a:cd68:c339:f426])
        by smtp.gmail.com with ESMTPSA id nb17sm5535561ejc.7.2021.12.13.00.23.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 00:23:58 -0800 (PST)
From:   Luca Weiss <luca.weiss@fairphone.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/8] arm64: dts: qcom: sm6350: Add MPSS nodes
Date:   Mon, 13 Dec 2021 09:22:03 +0100
Message-Id: <20211213082208.21492-4-luca.weiss@fairphone.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211213082208.21492-1-luca.weiss@fairphone.com>
References: <20211213082208.21492-1-luca.weiss@fairphone.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the required nodes for booting the MPSS on sm6350.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 66 ++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index 973e18fe3b67..9f9d4d916470 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -361,6 +361,32 @@ smem {
 		hwlocks = <&tcsr_mutex 3>;
 	};
 
+	smp2p-mpss {
+		compatible = "qcom,smp2p";
+		qcom,smem = <435>, <428>;
+
+		interrupts-extended = <&ipcc IPCC_CLIENT_MPSS
+					     IPCC_MPROC_SIGNAL_SMP2P
+					     IRQ_TYPE_EDGE_RISING>;
+		mboxes = <&ipcc IPCC_CLIENT_MPSS
+				IPCC_MPROC_SIGNAL_SMP2P>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <1>;
+
+		modem_smp2p_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		modem_smp2p_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
 	soc: soc@0 {
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -473,6 +499,46 @@ tcsr_mutex: hwlock@1f40000 {
 			#hwlock-cells = <1>;
 		};
 
+		mpss: remoteproc@4080000 {
+			compatible = "qcom,sm6350-mpss-pas";
+			reg = <0x0 0x04080000 0x0 0x4040>;
+
+			interrupts-extended = <&intc GIC_SPI 136 IRQ_TYPE_EDGE_RISING>,
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
+			power-domains = <&rpmhpd SM6350_CX>,
+					<&rpmhpd SM6350_MSS>;
+			power-domain-names = "cx", "mss";
+
+			memory-region = <&pil_modem_mem>;
+
+			qcom,qmp = <&aoss_qmp>;
+
+			qcom,smem-states = <&modem_smp2p_out 0>;
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
 		sdhc_2: sdhci@8804000 {
 			compatible = "qcom,sm6350-sdhci", "qcom,sdhci-msm-v5";
 			reg = <0 0x08804000 0 0x1000>;
-- 
2.34.1

