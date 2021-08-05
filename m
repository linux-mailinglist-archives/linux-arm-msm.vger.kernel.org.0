Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E55B33E10CF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Aug 2021 11:06:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238895AbhHEJHF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Aug 2021 05:07:05 -0400
Received: from mail-40140.protonmail.ch ([185.70.40.140]:54624 "EHLO
        mail-40140.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238957AbhHEJHE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Aug 2021 05:07:04 -0400
Date:   Thu, 05 Aug 2021 09:06:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1628154407;
        bh=SXMEC18CYiKQqQqQFgXywsbnYpjc6x7IYoNBnflk2EU=;
        h=Date:To:From:Cc:Reply-To:Subject:From;
        b=TjQuwxceKb2FQ30YjbKNYq0pzWzEFHz2oGPOMN0y1r/oWhnIKz9RK4ticuJ+AeKQI
         poEPuzUWSMiv0aXDbVrIc6+5AjUvqj8dDZxTuMqTFmaCgxyeFQQ/KcOFwfV3gXRm2x
         uyViptRliKaS5eCEDprZiC9vdQk/sB9zdIszXESk=
To:     bjorn.andersson@linaro.org
From:   Sireesh Kodali <sireeshkodali@protonmail.com>
Cc:     agross@kernel.org, mturquette@baylibre.com, robh+dt@kernel.org,
        sboyd@kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Vladimir Lypak <junak.pub@gmail.com>,
        Adam Skladowski <a_skl39@protonmail.com>,
        Sireesh Kodali <sireeshkodali@protonmail.com>
Reply-To: Sireesh Kodali <sireeshkodali@protonmail.com>
Subject: [PATCH RESEND 1/2] dt-bindings: clock: add Qualcomm MSM8953 GCC driver bindings
Message-ID: <Q6uB3NRxqtD8Prsmliv8ZdsTXGeviv7lb2jQ743jr1E@cp4-web-036.plabs.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.4 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,UPPERCASE_50_75
        shortcircuit=no autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Vladimir Lypak <junak.pub@gmail.com>

Add bindings and compatible to document MSM8953 GCC (Global Clock
Controller) driver.

Signed-off-by: Vladimir Lypak <junak.pub@gmail.com>
Signed-off-by: Adam Skladowski <a_skl39@protonmail.com>
Signed-off-by: Sireesh Kodali <sireeshkodali@protonmail.com>
---
 .../devicetree/bindings/clock/qcom,gcc.yaml   |   2 +
 include/dt-bindings/clock/qcom,gcc-msm8953.h  | 234 ++++++++++++++++++
 2 files changed, 236 insertions(+)
 create mode 100644 include/dt-bindings/clock/qcom,gcc-msm8953.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc.yaml b/Docume=
ntation/devicetree/bindings/clock/qcom,gcc.yaml
index 8453eeddf30e..2f20f8aa932a 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc.yaml
@@ -23,6 +23,7 @@ description: |
   - dt-bindings/clock/qcom,gcc-ipq806x.h (qcom,gcc-ipq8064)
   - dt-bindings/reset/qcom,gcc-ipq806x.h (qcom,gcc-ipq8064)
   - dt-bindings/clock/qcom,gcc-msm8939.h
+  - dt-bindings/clock/qcom,gcc-msm8953.h
   - dt-bindings/reset/qcom,gcc-msm8939.h
   - dt-bindings/clock/qcom,gcc-msm8660.h
   - dt-bindings/reset/qcom,gcc-msm8660.h
@@ -46,6 +47,7 @@ properties:
       - qcom,gcc-msm8660
       - qcom,gcc-msm8916
       - qcom,gcc-msm8939
+      - qcom,gcc-msm8953
       - qcom,gcc-msm8960
       - qcom,gcc-msm8974
       - qcom,gcc-msm8974pro
diff --git a/include/dt-bindings/clock/qcom,gcc-msm8953.h b/include/dt-bind=
ings/clock/qcom,gcc-msm8953.h
new file mode 100644
index 000000000000..783162da6148
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,gcc-msm8953.h
@@ -0,0 +1,234 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+
+#ifndef _DT_BINDINGS_CLK_MSM_GCC_8953_H
+#define _DT_BINDINGS_CLK_MSM_GCC_8953_H
+
+/* Clocks */
+#define APC0_DROOP_DETECTOR_CLK_SRC=09=090
+#define APC1_DROOP_DETECTOR_CLK_SRC=09=091
+#define APSS_AHB_CLK_SRC=09=09=092
+#define BLSP1_QUP1_I2C_APPS_CLK_SRC=09=093
+#define BLSP1_QUP1_SPI_APPS_CLK_SRC=09=094
+#define BLSP1_QUP2_I2C_APPS_CLK_SRC=09=095
+#define BLSP1_QUP2_SPI_APPS_CLK_SRC=09=096
+#define BLSP1_QUP3_I2C_APPS_CLK_SRC=09=097
+#define BLSP1_QUP3_SPI_APPS_CLK_SRC=09=098
+#define BLSP1_QUP4_I2C_APPS_CLK_SRC=09=099
+#define BLSP1_QUP4_SPI_APPS_CLK_SRC=09=0910
+#define BLSP1_UART1_APPS_CLK_SRC=09=0911
+#define BLSP1_UART2_APPS_CLK_SRC=09=0912
+#define BLSP2_QUP1_I2C_APPS_CLK_SRC=09=0913
+#define BLSP2_QUP1_SPI_APPS_CLK_SRC=09=0914
+#define BLSP2_QUP2_I2C_APPS_CLK_SRC=09=0915
+#define BLSP2_QUP2_SPI_APPS_CLK_SRC=09=0916
+#define BLSP2_QUP3_I2C_APPS_CLK_SRC=09=0917
+#define BLSP2_QUP3_SPI_APPS_CLK_SRC=09=0918
+#define BLSP2_QUP4_I2C_APPS_CLK_SRC=09=0919
+#define BLSP2_QUP4_SPI_APPS_CLK_SRC=09=0920
+#define BLSP2_UART1_APPS_CLK_SRC=09=0921
+#define BLSP2_UART2_APPS_CLK_SRC=09=0922
+#define BYTE0_CLK_SRC=09=09=09=0923
+#define BYTE1_CLK_SRC=09=09=09=0924
+#define CAMSS_GP0_CLK_SRC=09=09=0925
+#define CAMSS_GP1_CLK_SRC=09=09=0926
+#define CAMSS_TOP_AHB_CLK_SRC=09=09=0927
+#define CCI_CLK_SRC=09=09=09=0928
+#define CPP_CLK_SRC=09=09=09=0929
+#define CRYPTO_CLK_SRC=09=09=09=0930
+#define CSI0PHYTIMER_CLK_SRC=09=09=0931
+#define CSI0P_CLK_SRC=09=09=09=0932
+#define CSI0_CLK_SRC=09=09=09=0933
+#define CSI1PHYTIMER_CLK_SRC=09=09=0934
+#define CSI1P_CLK_SRC=09=09=09=0935
+#define CSI1_CLK_SRC=09=09=09=0936
+#define CSI2PHYTIMER_CLK_SRC=09=09=0937
+#define CSI2P_CLK_SRC=09=09=09=0938
+#define CSI2_CLK_SRC=09=09=09=0939
+#define ESC0_CLK_SRC=09=09=09=0940
+#define ESC1_CLK_SRC=09=09=09=0941
+#define GCC_APC0_DROOP_DETECTOR_GPLL0_CLK=0942
+#define GCC_APC1_DROOP_DETECTOR_GPLL0_CLK=0943
+#define GCC_APSS_AHB_CLK=09=09=0944
+#define GCC_APSS_AXI_CLK=09=09=0945
+#define GCC_APSS_TCU_ASYNC_CLK=09=09=0946
+#define GCC_BIMC_GFX_CLK=09=09=0947
+#define GCC_BIMC_GPU_CLK=09=09=0948
+#define GCC_BLSP1_AHB_CLK=09=09=0949
+#define GCC_BLSP1_QUP1_I2C_APPS_CLK=09=0950
+#define GCC_BLSP1_QUP1_SPI_APPS_CLK=09=0951
+#define GCC_BLSP1_QUP2_I2C_APPS_CLK=09=0952
+#define GCC_BLSP1_QUP2_SPI_APPS_CLK=09=0953
+#define GCC_BLSP1_QUP3_I2C_APPS_CLK=09=0954
+#define GCC_BLSP1_QUP3_SPI_APPS_CLK=09=0955
+#define GCC_BLSP1_QUP4_I2C_APPS_CLK=09=0956
+#define GCC_BLSP1_QUP4_SPI_APPS_CLK=09=0957
+#define GCC_BLSP1_UART1_APPS_CLK=09=0958
+#define GCC_BLSP1_UART2_APPS_CLK=09=0959
+#define GCC_BLSP2_AHB_CLK=09=09=0960
+#define GCC_BLSP2_QUP1_I2C_APPS_CLK=09=0961
+#define GCC_BLSP2_QUP1_SPI_APPS_CLK=09=0962
+#define GCC_BLSP2_QUP2_I2C_APPS_CLK=09=0963
+#define GCC_BLSP2_QUP2_SPI_APPS_CLK=09=0964
+#define GCC_BLSP2_QUP3_I2C_APPS_CLK=09=0965
+#define GCC_BLSP2_QUP3_SPI_APPS_CLK=09=0966
+#define GCC_BLSP2_QUP4_I2C_APPS_CLK=09=0967
+#define GCC_BLSP2_QUP4_SPI_APPS_CLK=09=0968
+#define GCC_BLSP2_UART1_APPS_CLK=09=0969
+#define GCC_BLSP2_UART2_APPS_CLK=09=0970
+#define GCC_BOOT_ROM_AHB_CLK=09=09=0971
+#define GCC_CAMSS_AHB_CLK=09=09=0972
+#define GCC_CAMSS_CCI_AHB_CLK=09=09=0973
+#define GCC_CAMSS_CCI_CLK=09=09=0974
+#define GCC_CAMSS_CPP_AHB_CLK=09=09=0975
+#define GCC_CAMSS_CPP_AXI_CLK=09=09=0976
+#define GCC_CAMSS_CPP_CLK=09=09=0977
+#define GCC_CAMSS_CSI0PHYTIMER_CLK=09=0978
+#define GCC_CAMSS_CSI0PHY_CLK=09=09=0979
+#define GCC_CAMSS_CSI0PIX_CLK=09=09=0980
+#define GCC_CAMSS_CSI0RDI_CLK=09=09=0981
+#define GCC_CAMSS_CSI0_AHB_CLK=09=09=0982
+#define GCC_CAMSS_CSI0_CLK=09=09=0983
+#define GCC_CAMSS_CSI0_CSIPHY_3P_CLK=09=0984
+#define GCC_CAMSS_CSI1PHYTIMER_CLK=09=0985
+#define GCC_CAMSS_CSI1PHY_CLK=09=09=0986
+#define GCC_CAMSS_CSI1PIX_CLK=09=09=0987
+#define GCC_CAMSS_CSI1RDI_CLK=09=09=0988
+#define GCC_CAMSS_CSI1_AHB_CLK=09=09=0989
+#define GCC_CAMSS_CSI1_CLK=09=09=0990
+#define GCC_CAMSS_CSI1_CSIPHY_3P_CLK=09=0991
+#define GCC_CAMSS_CSI2PHYTIMER_CLK=09=0992
+#define GCC_CAMSS_CSI2PHY_CLK=09=09=0993
+#define GCC_CAMSS_CSI2PIX_CLK=09=09=0994
+#define GCC_CAMSS_CSI2RDI_CLK=09=09=0995
+#define GCC_CAMSS_CSI2_AHB_CLK=09=09=0996
+#define GCC_CAMSS_CSI2_CLK=09=09=0997
+#define GCC_CAMSS_CSI2_CSIPHY_3P_CLK=09=0998
+#define GCC_CAMSS_CSI_VFE0_CLK=09=09=0999
+#define GCC_CAMSS_CSI_VFE1_CLK=09=09=09100
+#define GCC_CAMSS_GP0_CLK=09=09=09101
+#define GCC_CAMSS_GP1_CLK=09=09=09102
+#define GCC_CAMSS_ISPIF_AHB_CLK=09=09=09103
+#define GCC_CAMSS_JPEG0_CLK=09=09=09104
+#define GCC_CAMSS_JPEG_AHB_CLK=09=09=09105
+#define GCC_CAMSS_JPEG_AXI_CLK=09=09=09106
+#define GCC_CAMSS_MCLK0_CLK=09=09=09107
+#define GCC_CAMSS_MCLK1_CLK=09=09=09108
+#define GCC_CAMSS_MCLK2_CLK=09=09=09109
+#define GCC_CAMSS_MCLK3_CLK=09=09=09110
+#define GCC_CAMSS_MICRO_AHB_CLK=09=09=09111
+#define GCC_CAMSS_TOP_AHB_CLK=09=09=09112
+#define GCC_CAMSS_VFE0_AHB_CLK=09=09=09113
+#define GCC_CAMSS_VFE0_AXI_CLK=09=09=09114
+#define GCC_CAMSS_VFE0_CLK=09=09=09115
+#define GCC_CAMSS_VFE1_AHB_CLK=09=09=09116
+#define GCC_CAMSS_VFE1_AXI_CLK=09=09=09117
+#define GCC_CAMSS_VFE1_CLK=09=09=09118
+#define GCC_CPP_TBU_CLK=09=09=09=09119
+#define GCC_CRYPTO_AHB_CLK=09=09=09120
+#define GCC_CRYPTO_AXI_CLK=09=09=09121
+#define GCC_CRYPTO_CLK=09=09=09=09122
+#define GCC_DCC_CLK=09=09=09=09123
+#define GCC_GP1_CLK=09=09=09=09124
+#define GCC_GP2_CLK=09=09=09=09125
+#define GCC_GP3_CLK=09=09=09=09126
+#define GCC_JPEG_TBU_CLK=09=09=09127
+#define GCC_MDP_TBU_CLK=09=09=09=09128
+#define GCC_MDSS_AHB_CLK=09=09=09129
+#define GCC_MDSS_AXI_CLK=09=09=09130
+#define GCC_MDSS_BYTE0_CLK=09=09=09131
+#define GCC_MDSS_BYTE1_CLK=09=09=09132
+#define GCC_MDSS_ESC0_CLK=09=09=09133
+#define GCC_MDSS_ESC1_CLK=09=09=09134
+#define GCC_MDSS_MDP_CLK=09=09=09135
+#define GCC_MDSS_PCLK0_CLK=09=09=09136
+#define GCC_MDSS_PCLK1_CLK=09=09=09137
+#define GCC_MDSS_VSYNC_CLK=09=09=09138
+#define GCC_MSS_CFG_AHB_CLK=09=09=09139
+#define GCC_MSS_Q6_BIMC_AXI_CLK=09=09=09140
+#define GCC_OXILI_AHB_CLK=09=09=09141
+#define GCC_OXILI_AON_CLK=09=09=09142
+#define GCC_OXILI_GFX3D_CLK=09=09=09143
+#define GCC_OXILI_TIMER_CLK=09=09=09144
+#define GCC_PCNOC_USB3_AXI_CLK=09=09=09145
+#define GCC_PDM2_CLK=09=09=09=09146
+#define GCC_PDM_AHB_CLK=09=09=09=09147
+#define GCC_PRNG_AHB_CLK=09=09=09148
+#define GCC_QDSS_DAP_CLK=09=09=09149
+#define GCC_QUSB_REF_CLK=09=09=09150
+#define GCC_RBCPR_GFX_CLK=09=09=09151
+#define GCC_SDCC1_AHB_CLK=09=09=09152
+#define GCC_SDCC1_APPS_CLK=09=09=09153
+#define GCC_SDCC1_ICE_CORE_CLK=09=09=09154
+#define GCC_SDCC2_AHB_CLK=09=09=09155
+#define GCC_SDCC2_APPS_CLK=09=09=09156
+#define GCC_SMMU_CFG_CLK=09=09=09157
+#define GCC_USB30_MASTER_CLK=09=09=09158
+#define GCC_USB30_MOCK_UTMI_CLK=09=09=09159
+#define GCC_USB30_SLEEP_CLK=09=09=09160
+#define GCC_USB3_AUX_CLK=09=09=09161
+#define GCC_USB3_PIPE_CLK=09=09=09162
+#define GCC_USB_PHY_CFG_AHB_CLK=09=09=09163
+#define GCC_USB_SS_REF_CLK=09=09=09164
+#define GCC_VENUS0_AHB_CLK=09=09=09165
+#define GCC_VENUS0_AXI_CLK=09=09=09166
+#define GCC_VENUS0_CORE0_VCODEC0_CLK=09=09167
+#define GCC_VENUS0_VCODEC0_CLK=09=09=09168
+#define GCC_VENUS_TBU_CLK=09=09=09169
+#define GCC_VFE1_TBU_CLK=09=09=09170
+#define GCC_VFE_TBU_CLK=09=09=09=09171
+#define GFX3D_CLK_SRC=09=09=09=09172
+#define GP1_CLK_SRC=09=09=09=09173
+#define GP2_CLK_SRC=09=09=09=09174
+#define GP3_CLK_SRC=09=09=09=09175
+#define GPLL0=09=09=09=09=09176
+#define GPLL0_EARLY=09=09=09=09177
+#define GPLL2=09=09=09=09=09178
+#define GPLL2_EARLY=09=09=09=09179
+#define GPLL3=09=09=09=09=09180
+#define GPLL3_EARLY=09=09=09=09181
+#define GPLL4=09=09=09=09=09182
+#define GPLL4_EARLY=09=09=09=09183
+#define GPLL6=09=09=09=09=09184
+#define GPLL6_EARLY=09=09=09=09185
+#define JPEG0_CLK_SRC=09=09=09=09186
+#define MCLK0_CLK_SRC=09=09=09=09187
+#define MCLK1_CLK_SRC=09=09=09=09188
+#define MCLK2_CLK_SRC=09=09=09=09189
+#define MCLK3_CLK_SRC=09=09=09=09190
+#define MDP_CLK_SRC=09=09=09=09191
+#define PCLK0_CLK_SRC=09=09=09=09192
+#define PCLK1_CLK_SRC=09=09=09=09193
+#define PDM2_CLK_SRC=09=09=09=09194
+#define RBCPR_GFX_CLK_SRC=09=09=09195
+#define SDCC1_APPS_CLK_SRC=09=09=09196
+#define SDCC1_ICE_CORE_CLK_SRC=09=09=09197
+#define SDCC2_APPS_CLK_SRC=09=09=09198
+#define USB30_MASTER_CLK_SRC=09=09=09199
+#define USB30_MOCK_UTMI_CLK_SRC=09=09=09200
+#define USB3_AUX_CLK_SRC=09=09=09201
+#define VCODEC0_CLK_SRC=09=09=09=09202
+#define VFE0_CLK_SRC=09=09=09=09203
+#define VFE1_CLK_SRC=09=09=09=09204
+#define VSYNC_CLK_SRC=09=09=09=09205
+
+/* GCC block resets */
+#define GCC_CAMSS_MICRO_BCR=09=09=090
+#define GCC_MSS_BCR=09=09=09=091
+#define GCC_QUSB2_PHY_BCR=09=09=092
+#define GCC_USB3PHY_PHY_BCR=09=09=093
+#define GCC_USB3_PHY_BCR=09=09=094
+#define GCC_USB_30_BCR=09=09=09=095
+
+/* GDSCs */
+#define CPP_GDSC=09=09=09=090
+#define JPEG_GDSC=09=09=09=091
+#define MDSS_GDSC=09=09=09=092
+#define OXILI_CX_GDSC=09=09=09=093
+#define OXILI_GX_GDSC=09=09=09=094
+#define USB30_GDSC=09=09=09=095
+#define VENUS_CORE0_GDSC=09=09=096
+#define VENUS_GDSC=09=09=09=097
+#define VFE0_GDSC=09=09=09=098
+#define VFE1_GDSC=09=09=09=099
+
+#endif
--=20
2.32.0


