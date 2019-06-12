Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C37041B4F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2019 06:45:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730042AbfFLEpr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Jun 2019 00:45:47 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:40862 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730095AbfFLEpo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Jun 2019 00:45:44 -0400
Received: by mail-pf1-f195.google.com with SMTP id p184so5552199pfp.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jun 2019 21:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=nklP3shPG4ODY4LCy558nFWqV2jQgBjX6+qH4GruTes=;
        b=lPqruB5x/x03TcytL7LVzvnmJ+yemBLds1ibUr/mVVzOzZ6w2j2C/krp36OlLbD8yh
         QsJBhhfHx94RSc30x87DYrEs82Qlp6ePW+Q2k1cl3Cy0Chg59N6FHigUHCN1qXjo4YzO
         E9HeULmJlirqarV4/bJbL4ud/YtRa0MVr79nozbJxCNlAhECdlSJn5q2Ff0cD0l0brqk
         BqgRiRPv5iqlvPf1hNFdGHfbzJBGKQ5rW1It33qWoZwNzL+lSmHCiwTtAcWja0MpF37B
         iEBF+WvW2IOV0xub5iNXxw+LN0qiKsdNkUiuV7ADG8nxz1T7GdKU7ETtxVc5qFZLE03x
         yoNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=nklP3shPG4ODY4LCy558nFWqV2jQgBjX6+qH4GruTes=;
        b=iWSXo4p70LB2nwmb2uJCD/WLZrI/QUsoMtRC+jQAJI4/eKhJuxtkUoZIxy+3fEeP95
         DWObb6gcs/tpPb/9S6jQ96/cTGFAZwHqSNyJoV9zy2OUGC7d8B2aLjymqvkcQyjtcgDZ
         l2lVJjgVVrDFznNsXZWbwemjSGm2PwfpeMckxY1nws42x12CjFKsBUGeoVdSxiRglxV5
         w5nkIp7TJmtGyedObNfnjBFQMsLT1PGpzC+VnrJKMFN8wKJqziJ8LSyFrz/HWckIkQyS
         QtsHU30mKfV5JXPxAGoVfQYaynq9L2Fd8R0rWunoJIB8ZqPuPP+OAhjaGh7tRiEy8Pk2
         TDrg==
X-Gm-Message-State: APjAAAWAPBTKvPv4kbw1yFBzf3mZK5IIQGsWctYVPenyM8uVtOSd3P7S
        mdAsfYl0G/0AfvXIEP7Quq0T0Q==
X-Google-Smtp-Source: APXvYqwFBdGhHcjeVlfocEKbR9j58n78JNQlwypjDowu3shZmxffhL57NUrwLladwD1Gq2ifHwsVfw==
X-Received: by 2002:a17:90a:22c5:: with SMTP id s63mr29977778pjc.23.1560314743008;
        Tue, 11 Jun 2019 21:45:43 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id z126sm17129194pfb.100.2019.06.11.21.45.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Jun 2019 21:45:42 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v9 4/4] arm64: dts: qcom: sdm845: Add Q6V5 MSS node
Date:   Tue, 11 Jun 2019 21:45:36 -0700
Message-Id: <20190612044536.13940-5-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190612044536.13940-1-bjorn.andersson@linaro.org>
References: <20190612044536.13940-1-bjorn.andersson@linaro.org>
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Sibi Sankar <sibis@codeaurora.org>

This patch adds Q6V5 MSS remoteproc node for SDM845 SoCs.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v8:
- None

 arch/arm64/boot/dts/qcom/sdm845.dtsi | 58 ++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index c80881309f79..601cfb078bd5 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -1850,6 +1850,64 @@
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
+			power-domains = <&aoss_qmp 2>,
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

