Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ECE69104F5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 May 2019 06:37:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726217AbfEAEhq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 May 2019 00:37:46 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:33494 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726199AbfEAEhp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 May 2019 00:37:45 -0400
Received: by mail-pg1-f193.google.com with SMTP id k19so7852145pgh.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Apr 2019 21:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=a10hGuK3vdCOEjNUJMZxmg7vPboJuN/bkuHq4KflRrI=;
        b=pDVa8e7jbf89RlDz7t1+7lQQ+gTrLa77cMVKC9yzBXt2ZLJ0JEj/hwmcULHc622DgJ
         3kIrUqha4lTIRi7Y+3OGpb3Z4iCFXn3zrarCVhLebOkzUpvOyvL35hYNH/zkbL97xw2S
         ZCu1Xn0NiiZrCYi++EtqzAonCHVqP4OetOyUAwDA2Tt1Qg4sNW8iSYQGJKR1L7o/kdsi
         mVPU6SCgzyZ9L6A674KvQtkVOZ1KYE/3mTtKOfAzErDR79jQcEZuzPs5wi/e2O/frGo2
         HVrwooQxILs73RIAzRRqQ8lD/8BhZdiHLigNfww2WuM+8GC9gC4tcCLyJFClGCW7wPH9
         HWLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=a10hGuK3vdCOEjNUJMZxmg7vPboJuN/bkuHq4KflRrI=;
        b=UDxiIPQEaVdlU3cK7Vn+69wtAaCH++m0aaiq+0nJjgKguQZY5dACNX+GiFIsvKozXc
         96gO1zfc0aM5FWPdO2UazEot3aD3ipkDDu5ZCMXt0I7LmuYi8VrKcAKHam93k992+NEC
         DaZug4bDzqfMu1BS6pl8zzdwiiOm3XB6A/T+hgOw2b5HHXPJR/bPvBBk3drso5BMFR3j
         mRicWpPxw3MIqszGSSOys70LOSR6lokUCPJG+XNic0GUiibXMGZ2qzD9X8rD2dMGs8I+
         p3JWq9MzR/1KqyTU23gH+r8fvtPfINK5026RkrJph4Lrer3l2y9FVGN/FKltB9bYEEmJ
         dHqw==
X-Gm-Message-State: APjAAAUiKVQczrHerbUksegd5xzVi1kMCmtJn/tnRf8SD3kyhuHChsHt
        eqUOsFcOhGpz8wHKHNjBfpYDd4KqdbQ=
X-Google-Smtp-Source: APXvYqxDL3tBlXKBoiRHapCs8F39VS8hqCDS0TDifmuNZad6+uhihpKq85ibaXI51cIOXSctG7fOEQ==
X-Received: by 2002:a63:541d:: with SMTP id i29mr43040926pgb.174.1556685464670;
        Tue, 30 Apr 2019 21:37:44 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id q128sm55912865pga.60.2019.04.30.21.37.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Apr 2019 21:37:43 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v7 4/4] arm64: dts: qcom: sdm845: Add Q6V5 MSS node
Date:   Tue, 30 Apr 2019 21:37:34 -0700
Message-Id: <20190501043734.26706-5-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190501043734.26706-1-bjorn.andersson@linaro.org>
References: <20190501043734.26706-1-bjorn.andersson@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Sibi Sankar <sibis@codeaurora.org>

This patch adds Q6V5 MSS remoteproc node for SDM845 SoCs.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v6:
- None

 arch/arm64/boot/dts/qcom/sdm845.dtsi | 58 ++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 666bc88d3e81..2f3ab6acda3d 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -1672,6 +1672,64 @@
 			};
 		};
 
+		mss_pil: remoteproc@4080000 {
+			compatible = "qcom,sdm845-mss-pil";
+			reg = <0 0x04080000 0 0x408>, <0 0x04180000 0 0x48>;
+			reg-names = "qdsp6", "rmb";
+
+			interrupts-extended =
+				<&intc GIC_SPI 266 IRQ_TYPE_EDGE_RISING>,
+				<&modem_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+				<&modem_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
+				<&modem_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
+				<&modem_smp2p_in 3 IRQ_TYPE_EDGE_RISING>,
+				<&modem_smp2p_in 7 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog", "fatal", "ready",
+					  "handover", "stop-ack",
+					  "shutdown-ack";
+
+			clocks = <&gcc GCC_MSS_CFG_AHB_CLK>,
+				 <&gcc GCC_MSS_Q6_MEMNOC_AXI_CLK>,
+				 <&gcc GCC_BOOT_ROM_AHB_CLK>,
+				 <&gcc GCC_MSS_GPLL0_DIV_CLK_SRC>,
+				 <&gcc GCC_MSS_SNOC_AXI_CLK>,
+				 <&gcc GCC_MSS_MFAB_AXIS_CLK>,
+				 <&gcc GCC_PRNG_AHB_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "iface", "bus", "mem", "gpll0_mss",
+				      "snoc_axi", "mnoc_axi", "prng", "xo";
+
+			qcom,smem-states = <&modem_smp2p_out 0>;
+			qcom,smem-state-names = "stop";
+
+			resets = <&aoss_reset AOSS_CC_MSS_RESTART>,
+				 <&pdc_reset PDC_MODEM_SYNC_RESET>;
+			reset-names = "mss_restart", "pdc_reset";
+
+			qcom,halt-regs = <&tcsr_mutex_regs 0x23000 0x25000 0x24000>;
+
+			power-domains = <&aoss_qmp AOSS_QMP_LS_MODEM>,
+					<&rpmhpd SDM845_CX>,
+					<&rpmhpd SDM845_MX>,
+					<&rpmhpd SDM845_MSS>;
+			power-domain-names = "load_state", "cx", "mx", "mss";
+
+			mba {
+				memory-region = <&mba_region>;
+			};
+
+			mpss {
+				memory-region = <&mpss_region>;
+			};
+
+			glink-edge {
+				interrupts = <GIC_SPI 449 IRQ_TYPE_EDGE_RISING>;
+				label = "modem";
+				qcom,remote-pid = <1>;
+				mboxes = <&apss_shared 12>;
+			};
+		};
+
 		gpucc: clock-controller@5090000 {
 			compatible = "qcom,sdm845-gpucc";
 			reg = <0 0x05090000 0 0x9000>;
-- 
2.18.0

