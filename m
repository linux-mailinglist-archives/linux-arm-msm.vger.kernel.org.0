Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FFDE21F5BE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2020 17:05:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728721AbgGNPFb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Jul 2020 11:05:31 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:27935 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726187AbgGNPFa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Jul 2020 11:05:30 -0400
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 14 Jul 2020 08:05:29 -0700
Received: from sivaprak-linux.qualcomm.com ([10.201.3.202])
  by ironmsg04-sd.qualcomm.com with ESMTP; 14 Jul 2020 08:05:25 -0700
Received: by sivaprak-linux.qualcomm.com (Postfix, from userid 459349)
        id DD5F521723; Tue, 14 Jul 2020 20:35:23 +0530 (IST)
From:   Sivaprakash Murugesan <sivaprak@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Cc:     Sivaprakash Murugesan <sivaprak@codeaurora.org>
Subject: [PATCH 1/4] clk: qcom: ipq8074: remove gcc reset bindings
Date:   Tue, 14 Jul 2020 20:35:19 +0530
Message-Id: <1594739122-29327-2-git-send-email-sivaprak@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1594739122-29327-1-git-send-email-sivaprak@codeaurora.org>
References: <1594739122-29327-1-git-send-email-sivaprak@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Remove ipq8074 gcc reset bindings from gcc clock bindings file,
so that it can be added in reset bindings.

This will avoid confusion while adding new clock and resets.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>
---
 include/dt-bindings/clock/qcom,gcc-ipq8074.h | 139 +--------------------------
 1 file changed, 3 insertions(+), 136 deletions(-)

diff --git a/include/dt-bindings/clock/qcom,gcc-ipq8074.h b/include/dt-bindings/clock/qcom,gcc-ipq8074.h
index e3e018565add..07c0ca02cc17 100644
--- a/include/dt-bindings/clock/qcom,gcc-ipq8074.h
+++ b/include/dt-bindings/clock/qcom,gcc-ipq8074.h
@@ -230,141 +230,8 @@
 #define GCC_GP1_CLK				221
 #define GCC_GP2_CLK				222
 #define GCC_GP3_CLK				223
-
-#define GCC_BLSP1_BCR				0
-#define GCC_BLSP1_QUP1_BCR			1
-#define GCC_BLSP1_UART1_BCR			2
-#define GCC_BLSP1_QUP2_BCR			3
-#define GCC_BLSP1_UART2_BCR			4
-#define GCC_BLSP1_QUP3_BCR			5
-#define GCC_BLSP1_UART3_BCR			6
-#define GCC_BLSP1_QUP4_BCR			7
-#define GCC_BLSP1_UART4_BCR			8
-#define GCC_BLSP1_QUP5_BCR			9
-#define GCC_BLSP1_UART5_BCR			10
-#define GCC_BLSP1_QUP6_BCR			11
-#define GCC_BLSP1_UART6_BCR			12
-#define GCC_IMEM_BCR				13
-#define GCC_SMMU_BCR				14
-#define GCC_APSS_TCU_BCR			15
-#define GCC_SMMU_XPU_BCR			16
-#define GCC_PCNOC_TBU_BCR			17
-#define GCC_SMMU_CFG_BCR			18
-#define GCC_PRNG_BCR				19
-#define GCC_BOOT_ROM_BCR			20
-#define GCC_CRYPTO_BCR				21
-#define GCC_WCSS_BCR				22
-#define GCC_WCSS_Q6_BCR				23
-#define GCC_NSS_BCR				24
-#define GCC_SEC_CTRL_BCR			25
-#define GCC_ADSS_BCR				26
-#define GCC_DDRSS_BCR				27
-#define GCC_SYSTEM_NOC_BCR			28
-#define GCC_PCNOC_BCR				29
-#define GCC_TCSR_BCR				30
-#define GCC_QDSS_BCR				31
-#define GCC_DCD_BCR				32
-#define GCC_MSG_RAM_BCR				33
-#define GCC_MPM_BCR				34
-#define GCC_SPMI_BCR				35
-#define GCC_SPDM_BCR				36
-#define GCC_RBCPR_BCR				37
-#define GCC_RBCPR_MX_BCR			38
-#define GCC_TLMM_BCR				39
-#define GCC_RBCPR_WCSS_BCR			40
-#define GCC_USB0_PHY_BCR			41
-#define GCC_USB3PHY_0_PHY_BCR			42
-#define GCC_USB0_BCR				43
-#define GCC_USB1_PHY_BCR			44
-#define GCC_USB3PHY_1_PHY_BCR			45
-#define GCC_USB1_BCR				46
-#define GCC_QUSB2_0_PHY_BCR			47
-#define GCC_QUSB2_1_PHY_BCR			48
-#define GCC_SDCC1_BCR				49
-#define GCC_SDCC2_BCR				50
-#define GCC_SNOC_BUS_TIMEOUT0_BCR		51
-#define GCC_SNOC_BUS_TIMEOUT2_BCR		52
-#define GCC_SNOC_BUS_TIMEOUT3_BCR		53
-#define GCC_PCNOC_BUS_TIMEOUT0_BCR		54
-#define GCC_PCNOC_BUS_TIMEOUT1_BCR		55
-#define GCC_PCNOC_BUS_TIMEOUT2_BCR		56
-#define GCC_PCNOC_BUS_TIMEOUT3_BCR		57
-#define GCC_PCNOC_BUS_TIMEOUT4_BCR		58
-#define GCC_PCNOC_BUS_TIMEOUT5_BCR		59
-#define GCC_PCNOC_BUS_TIMEOUT6_BCR		60
-#define GCC_PCNOC_BUS_TIMEOUT7_BCR		61
-#define GCC_PCNOC_BUS_TIMEOUT8_BCR		62
-#define GCC_PCNOC_BUS_TIMEOUT9_BCR		63
-#define GCC_UNIPHY0_BCR				64
-#define GCC_UNIPHY1_BCR				65
-#define GCC_UNIPHY2_BCR				66
-#define GCC_CMN_12GPLL_BCR			67
-#define GCC_QPIC_BCR				68
-#define GCC_MDIO_BCR				69
-#define GCC_PCIE1_TBU_BCR			70
-#define GCC_WCSS_CORE_TBU_BCR			71
-#define GCC_WCSS_Q6_TBU_BCR			72
-#define GCC_USB0_TBU_BCR			73
-#define GCC_USB1_TBU_BCR			74
-#define GCC_PCIE0_TBU_BCR			75
-#define GCC_NSS_NOC_TBU_BCR			76
-#define GCC_PCIE0_BCR				77
-#define GCC_PCIE0_PHY_BCR			78
-#define GCC_PCIE0PHY_PHY_BCR			79
-#define GCC_PCIE0_LINK_DOWN_BCR			80
-#define GCC_PCIE1_BCR				81
-#define GCC_PCIE1_PHY_BCR			82
-#define GCC_PCIE1PHY_PHY_BCR			83
-#define GCC_PCIE1_LINK_DOWN_BCR			84
-#define GCC_DCC_BCR				85
-#define GCC_APC0_VOLTAGE_DROOP_DETECTOR_BCR	86
-#define GCC_APC1_VOLTAGE_DROOP_DETECTOR_BCR	87
-#define GCC_SMMU_CATS_BCR			88
-#define GCC_UBI0_AXI_ARES			89
-#define GCC_UBI0_AHB_ARES			90
-#define GCC_UBI0_NC_AXI_ARES			91
-#define GCC_UBI0_DBG_ARES			92
-#define GCC_UBI0_CORE_CLAMP_ENABLE		93
-#define GCC_UBI0_CLKRST_CLAMP_ENABLE		94
-#define GCC_UBI1_AXI_ARES			95
-#define GCC_UBI1_AHB_ARES			96
-#define GCC_UBI1_NC_AXI_ARES			97
-#define GCC_UBI1_DBG_ARES			98
-#define GCC_UBI1_CORE_CLAMP_ENABLE		99
-#define GCC_UBI1_CLKRST_CLAMP_ENABLE		100
-#define GCC_NSS_CFG_ARES			101
-#define GCC_NSS_IMEM_ARES			102
-#define GCC_NSS_NOC_ARES			103
-#define GCC_NSS_CRYPTO_ARES			104
-#define GCC_NSS_CSR_ARES			105
-#define GCC_NSS_CE_APB_ARES			106
-#define GCC_NSS_CE_AXI_ARES			107
-#define GCC_NSSNOC_CE_APB_ARES			108
-#define GCC_NSSNOC_CE_AXI_ARES			109
-#define GCC_NSSNOC_UBI0_AHB_ARES		110
-#define GCC_NSSNOC_UBI1_AHB_ARES		111
-#define GCC_NSSNOC_SNOC_ARES			112
-#define GCC_NSSNOC_CRYPTO_ARES			113
-#define GCC_NSSNOC_ATB_ARES			114
-#define GCC_NSSNOC_QOSGEN_REF_ARES		115
-#define GCC_NSSNOC_TIMEOUT_REF_ARES		116
-#define GCC_PCIE0_PIPE_ARES			117
-#define GCC_PCIE0_SLEEP_ARES			118
-#define GCC_PCIE0_CORE_STICKY_ARES		119
-#define GCC_PCIE0_AXI_MASTER_ARES		120
-#define GCC_PCIE0_AXI_SLAVE_ARES		121
-#define GCC_PCIE0_AHB_ARES			122
-#define GCC_PCIE0_AXI_MASTER_STICKY_ARES	123
-#define GCC_PCIE1_PIPE_ARES			124
-#define GCC_PCIE1_SLEEP_ARES			125
-#define GCC_PCIE1_CORE_STICKY_ARES		126
-#define GCC_PCIE1_AXI_MASTER_ARES		127
-#define GCC_PCIE1_AXI_SLAVE_ARES		128
-#define GCC_PCIE1_AHB_ARES			129
-#define GCC_PCIE1_AXI_MASTER_STICKY_ARES	130
-#define GCC_PCIE0_AXI_SLAVE_STICKY_ARES		131
-#define GCC_PCIE0_AXI_S_BRIDGE_CLK		132
-#define GCC_PCIE0_RCHNG_CLK_SRC			133
-#define GCC_PCIE0_RCHNG_CLK			134
+#define GCC_PCIE0_AXI_S_BRIDGE_CLK		224
+#define GCC_PCIE0_RCHNG_CLK_SRC			225
+#define GCC_PCIE0_RCHNG_CLK			226
 
 #endif
-- 
2.7.4

