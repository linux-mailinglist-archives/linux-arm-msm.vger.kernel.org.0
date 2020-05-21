Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51A661DC467
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2020 03:03:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726859AbgEUBDk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 May 2020 21:03:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726819AbgEUBDj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 May 2020 21:03:39 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2692C061A0F
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2020 18:03:39 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id nu7so2154062pjb.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2020 18:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gxRanuvI5KQIRmWH6q33bcoUu0lm4mjXkGuIPrGzvAE=;
        b=eCxOQfZSh5y1RZmnMJOYfxFq7MbVOgvPrO3DCKFQwB/Yc3OarHWNkrUiX1FHdsdTSR
         4JGeSXCjpqs1LkRK/1Ck1art0d2XaYJPXBVChtw7kI1RtqykPNNgeCcrdkXI23qWZtja
         g9xpmNl0GV6F8HimqmZkGvXGBU2dMiSXhE7Ks=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gxRanuvI5KQIRmWH6q33bcoUu0lm4mjXkGuIPrGzvAE=;
        b=XjmVN+JRxIXGpbouDFldE6IIUxUaEXK7CVmQqC3e1E3ek2qC7C19q8hjTsJ/hX18O4
         RjSgwLOEt56hAC8jtd03Bqtdi13lCIS61mPMk7kA1nYjJjampVFFAsg7FkzBZ2YXYV6H
         1A8jQz7/2RUi5hhgXcjAwrBNjyr7YbH4SFkGa/Uq5UGSlVGcB8SdTMgzxlsgCtuu9Ih+
         ASKdWLeFNPl6Lg+ATN3HznDGQCOUVl/KUPcIAliMnt24/2e0JMD4oN1yaQfzfAfwxei4
         VbunQiwfgaN7r6FX+A7wh+Zis7nbOXklwAGzJiMwo9PxOhngp7nDSvIMYUEzSd5uAFBD
         m31g==
X-Gm-Message-State: AOAM532Joi1dBdveVks9UHOPRL5HY8z8Qtm/huhOZA64BqPQd7UUexAm
        uW24/k3/aJ0iw82kXwERZ66BCA==
X-Google-Smtp-Source: ABdhPJyNqTICJlq/2OKpP0yn5cf6ISpdAzYYJbQ3iqeeESwI8F0nT/1076ldnKWDhzdzojojaQI2sA==
X-Received: by 2002:a17:902:301:: with SMTP id 1mr753221pld.245.1590023018891;
        Wed, 20 May 2020 18:03:38 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id 70sm2930983pfx.78.2020.05.20.18.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2020 18:03:38 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Evan Green <evgreen@chromium.org>,
        Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH] arm64: dts: qcom: sc7180: Move mss node to the right place
Date:   Wed, 20 May 2020 18:03:37 -0700
Message-Id: <20200521010337.229177-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.26.2.761.g0e0b3e54be-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The modem node has an address of 4080000 and thus should come after tlmm
and before gpu. Move the node to the right place to maintainer proper
address sort order.

Cc: Evan Green <evgreen@chromium.org>
Cc: Sibi Sankar <sibis@codeaurora.org>
Fixes: e14a15eba89a ("arm64: dts: qcom: sc7180: Add Q6V5 MSS node")
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 102 +++++++++++++--------------
 1 file changed, 51 insertions(+), 51 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 6b12c60c37fb..1027ef70f8db 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -1459,6 +1459,57 @@ pinconf-sd-cd {
 			};
 		};
 
+		remoteproc_mpss: remoteproc@4080000 {
+			compatible = "qcom,sc7180-mpss-pas";
+			reg = <0 0x04080000 0 0x4040>, <0 0x04180000 0 0x48>;
+			reg-names = "qdsp6", "rmb";
+
+			interrupts-extended = <&intc GIC_SPI 266 IRQ_TYPE_EDGE_RISING>,
+					      <&modem_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&modem_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&modem_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&modem_smp2p_in 3 IRQ_TYPE_EDGE_RISING>,
+					      <&modem_smp2p_in 7 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog", "fatal", "ready", "handover",
+					  "stop-ack", "shutdown-ack";
+
+			clocks = <&gcc GCC_MSS_CFG_AHB_CLK>,
+				 <&gcc GCC_MSS_Q6_MEMNOC_AXI_CLK>,
+				 <&gcc GCC_MSS_NAV_AXI_CLK>,
+				 <&gcc GCC_MSS_SNOC_AXI_CLK>,
+				 <&gcc GCC_MSS_MFAB_AXIS_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "iface", "bus", "nav", "snoc_axi",
+				      "mnoc_axi", "xo";
+
+			power-domains = <&aoss_qmp AOSS_QMP_LS_MODEM>,
+					<&rpmhpd SC7180_CX>,
+					<&rpmhpd SC7180_MX>,
+					<&rpmhpd SC7180_MSS>;
+			power-domain-names = "load_state", "cx", "mx", "mss";
+
+			memory-region = <&mpss_mem>;
+
+			qcom,smem-states = <&modem_smp2p_out 0>;
+			qcom,smem-state-names = "stop";
+
+			resets = <&aoss_reset AOSS_CC_MSS_RESTART>,
+				 <&pdc_reset PDC_MODEM_SYNC_RESET>;
+			reset-names = "mss_restart", "pdc_reset";
+
+			qcom,halt-regs = <&tcsr_mutex_regs 0x23000 0x25000 0x24000>;
+			qcom,spare-regs = <&tcsr_regs 0xb3e4>;
+
+			status = "disabled";
+
+			glink-edge {
+				interrupts = <GIC_SPI 449 IRQ_TYPE_EDGE_RISING>;
+				label = "modem";
+				qcom,remote-pid = <1>;
+				mboxes = <&apss_shared 12>;
+			};
+		};
+
 		gpu: gpu@5000000 {
 			compatible = "qcom,adreno-618.0", "qcom,adreno";
 			#stream-id-cells = <16>;
@@ -2054,57 +2105,6 @@ apss_merge_funnel_in: endpoint {
 			};
 		};
 
-		remoteproc_mpss: remoteproc@4080000 {
-			compatible = "qcom,sc7180-mpss-pas";
-			reg = <0 0x04080000 0 0x4040>, <0 0x04180000 0 0x48>;
-			reg-names = "qdsp6", "rmb";
-
-			interrupts-extended = <&intc GIC_SPI 266 IRQ_TYPE_EDGE_RISING>,
-					      <&modem_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
-					      <&modem_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
-					      <&modem_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
-					      <&modem_smp2p_in 3 IRQ_TYPE_EDGE_RISING>,
-					      <&modem_smp2p_in 7 IRQ_TYPE_EDGE_RISING>;
-			interrupt-names = "wdog", "fatal", "ready", "handover",
-					  "stop-ack", "shutdown-ack";
-
-			clocks = <&gcc GCC_MSS_CFG_AHB_CLK>,
-				 <&gcc GCC_MSS_Q6_MEMNOC_AXI_CLK>,
-				 <&gcc GCC_MSS_NAV_AXI_CLK>,
-				 <&gcc GCC_MSS_SNOC_AXI_CLK>,
-				 <&gcc GCC_MSS_MFAB_AXIS_CLK>,
-				 <&rpmhcc RPMH_CXO_CLK>;
-			clock-names = "iface", "bus", "nav", "snoc_axi",
-				      "mnoc_axi", "xo";
-
-			power-domains = <&aoss_qmp AOSS_QMP_LS_MODEM>,
-					<&rpmhpd SC7180_CX>,
-					<&rpmhpd SC7180_MX>,
-					<&rpmhpd SC7180_MSS>;
-			power-domain-names = "load_state", "cx", "mx", "mss";
-
-			memory-region = <&mpss_mem>;
-
-			qcom,smem-states = <&modem_smp2p_out 0>;
-			qcom,smem-state-names = "stop";
-
-			resets = <&aoss_reset AOSS_CC_MSS_RESTART>,
-				 <&pdc_reset PDC_MODEM_SYNC_RESET>;
-			reset-names = "mss_restart", "pdc_reset";
-
-			qcom,halt-regs = <&tcsr_mutex_regs 0x23000 0x25000 0x24000>;
-			qcom,spare-regs = <&tcsr_regs 0xb3e4>;
-
-			status = "disabled";
-
-			glink-edge {
-				interrupts = <GIC_SPI 449 IRQ_TYPE_EDGE_RISING>;
-				label = "modem";
-				qcom,remote-pid = <1>;
-				mboxes = <&apss_shared 12>;
-			};
-		};
-
 		sdhc_2: sdhci@8804000 {
 			compatible = "qcom,sc7180-sdhci", "qcom,sdhci-msm-v5";
 			reg = <0 0x08804000 0 0x1000>;

base-commit: d82fade846aa8bb34956120e3792f494058ec35e
-- 
Sent by a computer, using git, on the internet

