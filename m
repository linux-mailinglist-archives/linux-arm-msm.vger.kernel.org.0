Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 15CB0306CE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2019 05:01:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726859AbfEaDBQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 May 2019 23:01:16 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:35528 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726813AbfEaDBH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 May 2019 23:01:07 -0400
Received: by mail-pg1-f196.google.com with SMTP id t1so3182376pgc.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2019 20:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=9oOs0PxskGic5/b7RTQxcSk0/t3lEcqZGj07P5otHq8=;
        b=qsAugKex9pTeXPylDLyCfPWEn5qgXavR8GgzLC8UoUgRLxKALJvN8kOs8Eo26U4cz8
         EEGILf5qHnDVR9odU6omKYCjSGE5tW9LNJgaoSc1JxAglOLlDqq3s/BLtEjYgdQBi1Yc
         DIBVezOpjlK5Lgi6k8FC7L0WQrNFsIRpkD8GSuopMc7njgTpXuRcmGSeri1S1ADXhdHJ
         87YALectKjjH+Sp/Zxpms6dMYCf8VJ0WmIy39GwgQipD9m/66jiPu+QdMBZQGWSMqzgc
         UgcoH2gfLsTo2ZQACZkHnP5b5S5WR4tlXGKBZ5rkGGzRFq5D3spsK+FSryHtXhXHGsGj
         Dm6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=9oOs0PxskGic5/b7RTQxcSk0/t3lEcqZGj07P5otHq8=;
        b=GYBzmU9Y/DrKD1DMCWG/m+0H80oFzx1r5qdjupRSHHAU1bJT74EPnL8mZO0/TjFT27
         ielLGQtWNbBDVbeawk2vrtyMFBGR4Ib6W+Lod1DzrNYaHbOtSDvr0g+hqWLIZkZyql9M
         OfqDHL/wdbTv8eTOSuP/VpNlgaf917dLZFAwMcJyxpKZ7pbLe9asRE6Rb/tNssQr8i5J
         yuieu//KY1XWQm5rrkDiuATTFZMMW42RmkgHer+JzqYyh2l+Zd4fe6tXrXKfxaS0OI42
         KbjKN7jIWSvo0FQ6th19JbYgbW/eRH3lyNU6bLNiBfriNkL1v3HYQYQ+Vy/gkt0qQDd7
         /UgQ==
X-Gm-Message-State: APjAAAWIlNsyu1lNb2dngGUnrYevizspev2Ogk8Z1RBs+dRshykdh2/K
        V6yF7rSDJD+FpF3UCSwtrxTsHA==
X-Google-Smtp-Source: APXvYqyCJHRGfPuE7i7mQ60SXgUVFTvJNFmajEQIQuHvG/1GR5NKyMsxFJSfrXyyjMhagJamkQOUCA==
X-Received: by 2002:a63:2d0:: with SMTP id 199mr6615078pgc.188.1559271666672;
        Thu, 30 May 2019 20:01:06 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id m8sm6991549pff.137.2019.05.30.20.01.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 May 2019 20:01:05 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>
Cc:     David Brown <david.brown@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Doug Anderson <dianders@chromium.org>,
        Arun Kumar Neelakantam <aneela@codeaurora.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v8 4/4] arm64: dts: qcom: sdm845: Add Q6V5 MSS node
Date:   Thu, 30 May 2019 20:00:57 -0700
Message-Id: <20190531030057.18328-5-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190531030057.18328-1-bjorn.andersson@linaro.org>
References: <20190531030057.18328-1-bjorn.andersson@linaro.org>
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

Changes since v7:
- None

 arch/arm64/boot/dts/qcom/sdm845.dtsi | 58 ++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index b25c251b6503..978ceaec78cb 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -1671,6 +1671,64 @@
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

