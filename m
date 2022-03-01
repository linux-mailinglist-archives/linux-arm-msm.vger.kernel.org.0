Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A9164C83CB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Mar 2022 07:15:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232553AbiCAGPt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Mar 2022 01:15:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232507AbiCAGPr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Mar 2022 01:15:47 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1233C66205
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Feb 2022 22:15:06 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id b11so25111209lfb.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Feb 2022 22:15:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xxnvqMi7loFZg8YC55UooLLfc9/nJhoDzRCsB8Z5IYs=;
        b=G8RGYkP6VH3YiXkI0EPv8kYUZKFQE71kxeMWHvf/C6Brv+B1ih+M0puIe1I/lT/QDL
         AzRAK9UaLwSKuE9Wu2YUKOgHPV+DFfo3s3TU3VwcsFxJJKrPFVCJ39mEIqs5QLKymL6F
         rh0nCiG1h81DcD622VFU4bC56j4ziqAGZfUiXrPOZ7pDsoq7Rq9I3wHodO1oG7zaQYgc
         LQm5Odza9io1aYuBEn0+GjQUTyWSIWhiURi8cvoS8HcunYIK825iKvYpBU8Y4nC5/2dZ
         uxonmoRAQgvoKhpxWFC+ZQWRT2G9Y90k7imrBN2nG+KD0CBOpWrpK3+s8j6vp9K9etbD
         2YhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xxnvqMi7loFZg8YC55UooLLfc9/nJhoDzRCsB8Z5IYs=;
        b=e/yUW30GcIfpTCLM4ZTH1BeWWCKaj7+hRponqOXspDZs9g4La7RJS+wKo+wYsjnylW
         SaXMOjbSE0zWDwBkuJbKkYbabzajYU8cJIXsIdGJoeoCrsgyAgBgt4ce1U1hGyTA0kM7
         rtTQhGgxzAkfuN85Yd95Tnw8XQn25UIPJmzasZcHoLAeVa7777DZ0Zfp959m5OURnmNZ
         iPrcUlHB16taiAG/vaKp7wtltDA2LWJqnIBvCKov5hAj3PUNTe+p1/NlZ+YjrH+HFDd2
         oJAOJQJnDClWROslUqph37rBsGIzaYVwXUbOWFNyTamqf96cuJNSaSJOwtnbc/S1m/ij
         4dvA==
X-Gm-Message-State: AOAM531SGXiMbGY28/TtkiVTaKoyEBRhRVi7zAS/qaNQ8AnJAQLJwPRE
        DwnikpD7DIsMYIBw3Juf5zpktg==
X-Google-Smtp-Source: ABdhPJzoFgzGDk8n2z8bgKHYVVFv1HdTEbmxMKTzChuDWJ8vKPPdL2mi/EZXpNDCk9X+ZZrjv2ftzQ==
X-Received: by 2002:a19:f011:0:b0:443:9d63:df20 with SMTP id p17-20020a19f011000000b004439d63df20mr14601776lfc.69.1646115304419;
        Mon, 28 Feb 2022 22:15:04 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id f15-20020ac25ccf000000b004442220c67fsm1318898lfq.27.2022.02.28.22.15.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 22:15:03 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 3/7] arm64: dts: qcom: sm8450: add PCIe1 PHY node
Date:   Tue,  1 Mar 2022 09:14:56 +0300
Message-Id: <20220301061500.2110569-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220301061500.2110569-1-dmitry.baryshkov@linaro.org>
References: <20220301061500.2110569-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add device tree node for the second PCIe PHY device found on the Qualcomm
SM8450 platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 38 ++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 47db7759e543..45c0bf2b7fd2 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -685,9 +685,11 @@ gcc: clock-controller@100000 {
 			#power-domain-cells = <1>;
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
 				 <&pcie0_lane>,
+				 <&pcie1_lane>,
 				 <&sleep_clk>;
 			clock-names = "bi_tcxo",
 				      "pcie_0_pipe_clk",
+				      "pcie_1_pipe_clk",
 				      "sleep_clk";
 		};
 
@@ -863,6 +865,42 @@ pcie0_lane: lanes@1c06200 {
 			};
 		};
 
+		pcie1_phy: phy@1c0f000 {
+			compatible = "qcom,sm8450-qmp-gen4x2-pcie-phy";
+			reg = <0 0x01c0f000 0 0x200>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+			clocks = <&gcc GCC_PCIE_1_PHY_AUX_CLK>,
+				 <&gcc GCC_PCIE_1_CFG_AHB_CLK>,
+				 <&gcc GCC_PCIE_1_CLKREF_EN>,
+				 <&gcc GCC_PCIE_1_PHY_RCHNG_CLK>;
+			clock-names = "aux", "cfg_ahb", "ref", "refgen";
+
+			resets = <&gcc GCC_PCIE_1_PHY_BCR>;
+			reset-names = "phy";
+
+			assigned-clocks = <&gcc GCC_PCIE_1_PHY_RCHNG_CLK>;
+			assigned-clock-rates = <100000000>;
+
+			status = "disabled";
+
+			pcie1_lane: lanes@1c0e000 {
+				reg = <0 0x1c0e000 0 0x200>, /* tx */
+				      <0 0x1c0e200 0 0x300>, /* rx */
+				      <0 0x1c0f200 0 0x200>, /* pcs */
+				      <0 0x1c0e800 0 0x200>, /* tx */
+				      <0 0x1c0ea00 0 0x300>, /* rx */
+				      <0 0x1c0f400 0 0xc00>; /* pcs_pcie */
+				clocks = <&gcc GCC_PCIE_1_PIPE_CLK>;
+				clock-names = "pipe0";
+
+				#clock-cells = <0>;
+				#phy-cells = <0>;
+				clock-output-names = "pcie_1_pipe_clk";
+			};
+		};
+
 		config_noc: interconnect@1500000 {
 			compatible = "qcom,sm8450-config-noc";
 			reg = <0 0x01500000 0 0x1c000>;
-- 
2.34.1

