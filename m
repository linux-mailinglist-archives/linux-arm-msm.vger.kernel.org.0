Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E1311690A73
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Feb 2023 14:38:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229814AbjBINiw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Feb 2023 08:38:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230168AbjBINiv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Feb 2023 08:38:51 -0500
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A32A63A9E
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Feb 2023 05:38:45 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id gr7so6424098ejb.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Feb 2023 05:38:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zds0/3eeUvjF+FcQBby6a6zcmQ/YYVcuAIZ4jl6+Y+0=;
        b=LOXug2D+INSabaa79hc2rwSzh0d5UNK0zuKIAM2HzZCVZGWhkH6UTp6ACDOQu1wI22
         7czjcii0wi9K7oTOuJVkW/rEOVDvY63SonM5fJG8eS2Yw33NyHRhdkwcCFyQW8CxaTMh
         KSEqEoGAEWzgJCZsjIoUmccPsQhQoFIhMgVPZwePTE9GdYKc6dLZKznQh/IBlIRx6EeO
         QysBgFNLj/1nXwDWalN65M6N2z2UljC17/sO99AY2qbM00eE0wx6Ig45aZn9GO+5BMXI
         y9ypx1DD4xOjzWzg8+KjxCEIo/ieLLIaepQ0DMS1mAm13KXWJQb6gOh4RG1gl5++mGk9
         mLmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zds0/3eeUvjF+FcQBby6a6zcmQ/YYVcuAIZ4jl6+Y+0=;
        b=upCnEOdgpF1EziJTWJoIGUu3DjhlVvbvfOJCd43SgpQ6oaF+CR69mHzqiLEBQZQ1H0
         rlsHgInaC4KL3d1BurQ9hbbTwctzdj1xjq53lpP0DvoKkz5MtY0oWJQPV9I2oaiEB3ZF
         uaV00LyQcNYlCH3Hz8ugRxG5V2iMJeHpsXXVnAyFm429N4hSdJX8BO4xSVG/TO8bbUf0
         vRqftgKjv0y1GXJbL/XCtZNkjj/Rk/NcP8PtiwXrVSuPUyijBbbeEnNgaw+d4lmav3eR
         VdnOiUbSgc/JNpfAoi6PA0TWQsOetuZaCwF3iRWUPEOsEQOcCXd4UteqGYqcbDUfkEx4
         iXCA==
X-Gm-Message-State: AO0yUKVRInXVYv1X8nwVmlx30B0l6f55SBswIp2Lq65uRc1sYPWAisjG
        tOuyp3AjodN25pwEUUfY5CqV2Q==
X-Google-Smtp-Source: AK7set+8/bAzPPRC2cVx7XNNhXZr/tIuErK7XlYxsDNYsHShQq/8ZS5dv/+wtanyix2qABilb2vZ2A==
X-Received: by 2002:a17:906:f209:b0:878:6477:d7 with SMTP id gt9-20020a170906f20900b00878647700d7mr11751771ejb.72.1675949924080;
        Thu, 09 Feb 2023 05:38:44 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id cd17-20020a170906b35100b0088f8ee84b76sm885553ejb.105.2023.02.09.05.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 05:38:43 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v3 2/6] arm64: dts: qcom: sm8350: reorder device nodes
Date:   Thu,  9 Feb 2023 15:38:35 +0200
Message-Id: <20230209133839.762631-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230209133839.762631-1-dmitry.baryshkov@linaro.org>
References: <20230209133839.762631-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Somehow sm8350 got its device nodes not fully sorted. Start reordering
DT nodes by their address. Move apps SMMU, GIC, timer, apps RSC, cpufreq
ADSP and cDSP nodes to the end to the proper position at the end of
/soc/.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 1228 +++++++++++++-------------
 1 file changed, 614 insertions(+), 614 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 0a422637b61f..b85bd8fd28c0 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -1421,111 +1421,6 @@ spi13: spi@a94000 {
 			};
 		};
 
-		apps_smmu: iommu@15000000 {
-			compatible = "qcom,sm8350-smmu-500", "arm,mmu-500";
-			reg = <0 0x15000000 0 0x100000>;
-			#iommu-cells = <2>;
-			#global-interrupts = <2>;
-			interrupts =    <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>,
-					<GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>,
-					<GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>,
-					<GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>,
-					<GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>,
-					<GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>,
-					<GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>,
-					<GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>,
-					<GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>,
-					<GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>,
-					<GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>,
-					<GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>,
-					<GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>,
-					<GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>,
-					<GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>,
-					<GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>,
-					<GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>,
-					<GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>,
-					<GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>,
-					<GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>,
-					<GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>,
-					<GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
-					<GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
-					<GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>,
-					<GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH>,
-					<GIC_SPI 182 IRQ_TYPE_LEVEL_HIGH>,
-					<GIC_SPI 183 IRQ_TYPE_LEVEL_HIGH>,
-					<GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>,
-					<GIC_SPI 185 IRQ_TYPE_LEVEL_HIGH>,
-					<GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH>,
-					<GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH>,
-					<GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH>,
-					<GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH>,
-					<GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>,
-					<GIC_SPI 191 IRQ_TYPE_LEVEL_HIGH>,
-					<GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>,
-					<GIC_SPI 315 IRQ_TYPE_LEVEL_HIGH>,
-					<GIC_SPI 316 IRQ_TYPE_LEVEL_HIGH>,
-					<GIC_SPI 317 IRQ_TYPE_LEVEL_HIGH>,
-					<GIC_SPI 318 IRQ_TYPE_LEVEL_HIGH>,
-					<GIC_SPI 319 IRQ_TYPE_LEVEL_HIGH>,
-					<GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH>,
-					<GIC_SPI 321 IRQ_TYPE_LEVEL_HIGH>,
-					<GIC_SPI 322 IRQ_TYPE_LEVEL_HIGH>,
-					<GIC_SPI 323 IRQ_TYPE_LEVEL_HIGH>,
-					<GIC_SPI 324 IRQ_TYPE_LEVEL_HIGH>,
-					<GIC_SPI 325 IRQ_TYPE_LEVEL_HIGH>,
-					<GIC_SPI 326 IRQ_TYPE_LEVEL_HIGH>,
-					<GIC_SPI 327 IRQ_TYPE_LEVEL_HIGH>,
-					<GIC_SPI 328 IRQ_TYPE_LEVEL_HIGH>,
-					<GIC_SPI 329 IRQ_TYPE_LEVEL_HIGH>,
-					<GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>,
-					<GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH>,
-					<GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH>,
-					<GIC_SPI 333 IRQ_TYPE_LEVEL_HIGH>,
-					<GIC_SPI 334 IRQ_TYPE_LEVEL_HIGH>,
-					<GIC_SPI 335 IRQ_TYPE_LEVEL_HIGH>,
-					<GIC_SPI 336 IRQ_TYPE_LEVEL_HIGH>,
-					<GIC_SPI 337 IRQ_TYPE_LEVEL_HIGH>,
-					<GIC_SPI 338 IRQ_TYPE_LEVEL_HIGH>,
-					<GIC_SPI 339 IRQ_TYPE_LEVEL_HIGH>,
-					<GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH>,
-					<GIC_SPI 341 IRQ_TYPE_LEVEL_HIGH>,
-					<GIC_SPI 342 IRQ_TYPE_LEVEL_HIGH>,
-					<GIC_SPI 343 IRQ_TYPE_LEVEL_HIGH>,
-					<GIC_SPI 344 IRQ_TYPE_LEVEL_HIGH>,
-					<GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH>,
-					<GIC_SPI 395 IRQ_TYPE_LEVEL_HIGH>,
-					<GIC_SPI 396 IRQ_TYPE_LEVEL_HIGH>,
-					<GIC_SPI 397 IRQ_TYPE_LEVEL_HIGH>,
-					<GIC_SPI 398 IRQ_TYPE_LEVEL_HIGH>,
-					<GIC_SPI 399 IRQ_TYPE_LEVEL_HIGH>,
-					<GIC_SPI 400 IRQ_TYPE_LEVEL_HIGH>,
-					<GIC_SPI 401 IRQ_TYPE_LEVEL_HIGH>,
-					<GIC_SPI 402 IRQ_TYPE_LEVEL_HIGH>,
-					<GIC_SPI 403 IRQ_TYPE_LEVEL_HIGH>,
-					<GIC_SPI 404 IRQ_TYPE_LEVEL_HIGH>,
-					<GIC_SPI 405 IRQ_TYPE_LEVEL_HIGH>,
-					<GIC_SPI 406 IRQ_TYPE_LEVEL_HIGH>,
-					<GIC_SPI 407 IRQ_TYPE_LEVEL_HIGH>,
-					<GIC_SPI 408 IRQ_TYPE_LEVEL_HIGH>,
-					<GIC_SPI 409 IRQ_TYPE_LEVEL_HIGH>,
-					<GIC_SPI 412 IRQ_TYPE_LEVEL_HIGH>,
-					<GIC_SPI 418 IRQ_TYPE_LEVEL_HIGH>,
-					<GIC_SPI 419 IRQ_TYPE_LEVEL_HIGH>,
-					<GIC_SPI 421 IRQ_TYPE_LEVEL_HIGH>,
-					<GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH>,
-					<GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH>,
-					<GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH>,
-					<GIC_SPI 690 IRQ_TYPE_LEVEL_HIGH>,
-					<GIC_SPI 691 IRQ_TYPE_LEVEL_HIGH>,
-					<GIC_SPI 692 IRQ_TYPE_LEVEL_HIGH>,
-					<GIC_SPI 693 IRQ_TYPE_LEVEL_HIGH>,
-					<GIC_SPI 694 IRQ_TYPE_LEVEL_HIGH>,
-					<GIC_SPI 695 IRQ_TYPE_LEVEL_HIGH>,
-					<GIC_SPI 696 IRQ_TYPE_LEVEL_HIGH>,
-					<GIC_SPI 697 IRQ_TYPE_LEVEL_HIGH>,
-					<GIC_SPI 707 IRQ_TYPE_LEVEL_HIGH>;
-		};
-
 		config_noc: interconnect@1500000 {
 			compatible = "qcom,sm8350-config-noc";
 			reg = <0 0x01500000 0 0xa580>;
@@ -2124,253 +2019,92 @@ rng: rng@10d3000 {
 			clock-names = "core";
 		};
 
-		intc: interrupt-controller@17a00000 {
-			compatible = "arm,gic-v3";
-			#interrupt-cells = <3>;
-			interrupt-controller;
-			#redistributor-regions = <1>;
-			redistributor-stride = <0 0x20000>;
-			reg = <0x0 0x17a00000 0x0 0x10000>,     /* GICD */
-			      <0x0 0x17a60000 0x0 0x100000>;    /* GICR * 8 */
-			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
-		};
+		ufs_mem_hc: ufshc@1d84000 {
+			compatible = "qcom,sm8350-ufshc", "qcom,ufshc",
+				     "jedec,ufs-2.0";
+			reg = <0 0x01d84000 0 0x3000>;
+			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
+			phys = <&ufs_mem_phy_lanes>;
+			phy-names = "ufsphy";
+			lanes-per-direction = <2>;
+			#reset-cells = <1>;
+			resets = <&gcc GCC_UFS_PHY_BCR>;
+			reset-names = "rst";
 
-		timer@17c20000 {
-			compatible = "arm,armv7-timer-mem";
-			#address-cells = <1>;
-			#size-cells = <1>;
-			ranges = <0 0 0 0x20000000>;
-			reg = <0x0 0x17c20000 0x0 0x1000>;
-			clock-frequency = <19200000>;
+			power-domains = <&gcc UFS_PHY_GDSC>;
 
-			frame@17c21000 {
-				frame-number = <0>;
-				interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
-					     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
-				reg = <0x17c21000 0x1000>,
-				      <0x17c22000 0x1000>;
-			};
+			iommus = <&apps_smmu 0xe0 0x0>;
 
-			frame@17c23000 {
-				frame-number = <1>;
-				interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
-				reg = <0x17c23000 0x1000>;
-				status = "disabled";
-			};
+			clock-names =
+				"core_clk",
+				"bus_aggr_clk",
+				"iface_clk",
+				"core_clk_unipro",
+				"ref_clk",
+				"tx_lane0_sync_clk",
+				"rx_lane0_sync_clk",
+				"rx_lane1_sync_clk";
+			clocks =
+				<&gcc GCC_UFS_PHY_AXI_CLK>,
+				<&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
+				<&gcc GCC_UFS_PHY_AHB_CLK>,
+				<&gcc GCC_UFS_PHY_UNIPRO_CORE_CLK>,
+				<&rpmhcc RPMH_CXO_CLK>,
+				<&gcc GCC_UFS_PHY_TX_SYMBOL_0_CLK>,
+				<&gcc GCC_UFS_PHY_RX_SYMBOL_0_CLK>,
+				<&gcc GCC_UFS_PHY_RX_SYMBOL_1_CLK>;
+			freq-table-hz =
+				<75000000 300000000>,
+				<0 0>,
+				<0 0>,
+				<75000000 300000000>,
+				<0 0>,
+				<0 0>,
+				<0 0>,
+				<0 0>;
+			status = "disabled";
+		};
 
-			frame@17c25000 {
-				frame-number = <2>;
-				interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
-				reg = <0x17c25000 0x1000>;
-				status = "disabled";
-			};
+		ufs_mem_phy: phy@1d87000 {
+			compatible = "qcom,sm8350-qmp-ufs-phy";
+			reg = <0 0x01d87000 0 0x1c4>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+			clock-names = "ref",
+				      "ref_aux";
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>;
 
-			frame@17c27000 {
-				frame-number = <3>;
-				interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
-				reg = <0x17c27000 0x1000>;
-				status = "disabled";
-			};
+			resets = <&ufs_mem_hc 0>;
+			reset-names = "ufsphy";
+			status = "disabled";
 
-			frame@17c29000 {
-				frame-number = <4>;
-				interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
-				reg = <0x17c29000 0x1000>;
-				status = "disabled";
+			ufs_mem_phy_lanes: phy@1d87400 {
+				reg = <0 0x01d87400 0 0x188>,
+				      <0 0x01d87600 0 0x200>,
+				      <0 0x01d87c00 0 0x200>,
+				      <0 0x01d87800 0 0x188>,
+				      <0 0x01d87a00 0 0x200>;
+				#clock-cells = <1>;
+				#phy-cells = <0>;
 			};
+		};
 
-			frame@17c2b000 {
-				frame-number = <5>;
-				interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
-				reg = <0x17c2b000 0x1000>;
-				status = "disabled";
-			};
+		slpi: remoteproc@5c00000 {
+			compatible = "qcom,sm8350-slpi-pas";
+			reg = <0 0x05c00000 0 0x4000>;
 
-			frame@17c2d000 {
-				frame-number = <6>;
-				interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
-				reg = <0x17c2d000 0x1000>;
-				status = "disabled";
-			};
-		};
+			interrupts-extended = <&pdc 9 IRQ_TYPE_LEVEL_HIGH>,
+					      <&smp2p_slpi_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_slpi_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_slpi_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_slpi_in 3 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog", "fatal", "ready",
+					  "handover", "stop-ack";
 
-		apps_rsc: rsc@18200000 {
-			label = "apps_rsc";
-			compatible = "qcom,rpmh-rsc";
-			reg = <0x0 0x18200000 0x0 0x10000>,
-				<0x0 0x18210000 0x0 0x10000>,
-				<0x0 0x18220000 0x0 0x10000>;
-			reg-names = "drv-0", "drv-1", "drv-2";
-			interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
-			qcom,tcs-offset = <0xd00>;
-			qcom,drv-id = <2>;
-			qcom,tcs-config = <ACTIVE_TCS  2>, <SLEEP_TCS   3>,
-					  <WAKE_TCS    3>, <CONTROL_TCS 0>;
-			power-domains = <&CLUSTER_PD>;
-
-			rpmhcc: clock-controller {
-				compatible = "qcom,sm8350-rpmh-clk";
-				#clock-cells = <1>;
-				clock-names = "xo";
-				clocks = <&xo_board>;
-			};
-
-			rpmhpd: power-controller {
-				compatible = "qcom,sm8350-rpmhpd";
-				#power-domain-cells = <1>;
-				operating-points-v2 = <&rpmhpd_opp_table>;
-
-				rpmhpd_opp_table: opp-table {
-					compatible = "operating-points-v2";
-
-					rpmhpd_opp_ret: opp1 {
-						opp-level = <RPMH_REGULATOR_LEVEL_RETENTION>;
-					};
-
-					rpmhpd_opp_min_svs: opp2 {
-						opp-level = <RPMH_REGULATOR_LEVEL_MIN_SVS>;
-					};
-
-					rpmhpd_opp_low_svs: opp3 {
-						opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
-					};
-
-					rpmhpd_opp_svs: opp4 {
-						opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
-					};
-
-					rpmhpd_opp_svs_l1: opp5 {
-						opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
-					};
-
-					rpmhpd_opp_nom: opp6 {
-						opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
-					};
-
-					rpmhpd_opp_nom_l1: opp7 {
-						opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
-					};
-
-					rpmhpd_opp_nom_l2: opp8 {
-						opp-level = <RPMH_REGULATOR_LEVEL_NOM_L2>;
-					};
-
-					rpmhpd_opp_turbo: opp9 {
-						opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
-					};
-
-					rpmhpd_opp_turbo_l1: opp10 {
-						opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
-					};
-				};
-			};
-
-			apps_bcm_voter: bcm-voter {
-				compatible = "qcom,bcm-voter";
-			};
-		};
-
-		cpufreq_hw: cpufreq@18591000 {
-			compatible = "qcom,sm8350-cpufreq-epss", "qcom,cpufreq-epss";
-			reg = <0 0x18591000 0 0x1000>,
-			      <0 0x18592000 0 0x1000>,
-			      <0 0x18593000 0 0x1000>;
-			reg-names = "freq-domain0", "freq-domain1", "freq-domain2";
-
-			clocks = <&rpmhcc RPMH_CXO_CLK>, <&gcc GCC_GPLL0>;
-			clock-names = "xo", "alternate";
-
-			#freq-domain-cells = <1>;
-		};
-
-		ufs_mem_hc: ufshc@1d84000 {
-			compatible = "qcom,sm8350-ufshc", "qcom,ufshc",
-				     "jedec,ufs-2.0";
-			reg = <0 0x01d84000 0 0x3000>;
-			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
-			phys = <&ufs_mem_phy_lanes>;
-			phy-names = "ufsphy";
-			lanes-per-direction = <2>;
-			#reset-cells = <1>;
-			resets = <&gcc GCC_UFS_PHY_BCR>;
-			reset-names = "rst";
-
-			power-domains = <&gcc UFS_PHY_GDSC>;
-
-			iommus = <&apps_smmu 0xe0 0x0>;
-
-			clock-names =
-				"core_clk",
-				"bus_aggr_clk",
-				"iface_clk",
-				"core_clk_unipro",
-				"ref_clk",
-				"tx_lane0_sync_clk",
-				"rx_lane0_sync_clk",
-				"rx_lane1_sync_clk";
-			clocks =
-				<&gcc GCC_UFS_PHY_AXI_CLK>,
-				<&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
-				<&gcc GCC_UFS_PHY_AHB_CLK>,
-				<&gcc GCC_UFS_PHY_UNIPRO_CORE_CLK>,
-				<&rpmhcc RPMH_CXO_CLK>,
-				<&gcc GCC_UFS_PHY_TX_SYMBOL_0_CLK>,
-				<&gcc GCC_UFS_PHY_RX_SYMBOL_0_CLK>,
-				<&gcc GCC_UFS_PHY_RX_SYMBOL_1_CLK>;
-			freq-table-hz =
-				<75000000 300000000>,
-				<0 0>,
-				<0 0>,
-				<75000000 300000000>,
-				<0 0>,
-				<0 0>,
-				<0 0>,
-				<0 0>;
-			status = "disabled";
-		};
-
-		ufs_mem_phy: phy@1d87000 {
-			compatible = "qcom,sm8350-qmp-ufs-phy";
-			reg = <0 0x01d87000 0 0x1c4>;
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges;
-			clock-names = "ref",
-				      "ref_aux";
-			clocks = <&rpmhcc RPMH_CXO_CLK>,
-				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>;
-
-			resets = <&ufs_mem_hc 0>;
-			reset-names = "ufsphy";
-			status = "disabled";
-
-			ufs_mem_phy_lanes: phy@1d87400 {
-				reg = <0 0x01d87400 0 0x188>,
-				      <0 0x01d87600 0 0x200>,
-				      <0 0x01d87c00 0 0x200>,
-				      <0 0x01d87800 0 0x188>,
-				      <0 0x01d87a00 0 0x200>;
-				#clock-cells = <1>;
-				#phy-cells = <0>;
-			};
-		};
-
-		slpi: remoteproc@5c00000 {
-			compatible = "qcom,sm8350-slpi-pas";
-			reg = <0 0x05c00000 0 0x4000>;
-
-			interrupts-extended = <&pdc 9 IRQ_TYPE_LEVEL_HIGH>,
-					      <&smp2p_slpi_in 0 IRQ_TYPE_EDGE_RISING>,
-					      <&smp2p_slpi_in 1 IRQ_TYPE_EDGE_RISING>,
-					      <&smp2p_slpi_in 2 IRQ_TYPE_EDGE_RISING>,
-					      <&smp2p_slpi_in 3 IRQ_TYPE_EDGE_RISING>;
-			interrupt-names = "wdog", "fatal", "ready",
-					  "handover", "stop-ack";
-
-			clocks = <&rpmhcc RPMH_CXO_CLK>;
-			clock-names = "xo";
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "xo";
 
 			power-domains = <&rpmhpd SM8350_LCX>,
 					<&rpmhpd SM8350_LMX>;
@@ -2425,176 +2159,67 @@ compute-cb@3 {
 			};
 		};
 
-		cdsp: remoteproc@98900000 {
-			compatible = "qcom,sm8350-cdsp-pas";
-			reg = <0 0x98900000 0 0x1400000>;
-
-			interrupts-extended = <&intc GIC_SPI 578 IRQ_TYPE_LEVEL_HIGH>,
-					      <&smp2p_cdsp_in 0 IRQ_TYPE_EDGE_RISING>,
-					      <&smp2p_cdsp_in 1 IRQ_TYPE_EDGE_RISING>,
-					      <&smp2p_cdsp_in 2 IRQ_TYPE_EDGE_RISING>,
-					      <&smp2p_cdsp_in 3 IRQ_TYPE_EDGE_RISING>;
-			interrupt-names = "wdog", "fatal", "ready",
-					  "handover", "stop-ack";
+		sdhc_2: mmc@8804000 {
+			compatible = "qcom,sm8350-sdhci", "qcom,sdhci-msm-v5";
+			reg = <0 0x08804000 0 0x1000>;
 
-			clocks = <&rpmhcc RPMH_CXO_CLK>;
-			clock-names = "xo";
+			interrupts = <GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 223 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hc_irq", "pwr_irq";
 
-			power-domains = <&rpmhpd SM8350_CX>,
-					<&rpmhpd SM8350_MXC>;
-			power-domain-names = "cx", "mxc";
+			clocks = <&gcc GCC_SDCC2_AHB_CLK>,
+				 <&gcc GCC_SDCC2_APPS_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "iface", "core", "xo";
+			resets = <&gcc GCC_SDCC2_BCR>;
+			interconnects = <&aggre2_noc MASTER_SDCC_2 0 &mc_virt SLAVE_EBI1 0>,
+					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_SDCC_2 0>;
+			interconnect-names = "sdhc-ddr","cpu-sdhc";
+			iommus = <&apps_smmu 0x4a0 0x0>;
+			power-domains = <&rpmhpd SM8350_CX>;
+			operating-points-v2 = <&sdhc2_opp_table>;
+			bus-width = <4>;
+			dma-coherent;
 
-			interconnects = <&compute_noc MASTER_CDSP_PROC 0 &mc_virt SLAVE_EBI1 0>;
+			status = "disabled";
 
-			memory-region = <&pil_cdsp_mem>;
+			sdhc2_opp_table: opp-table {
+				compatible = "operating-points-v2";
 
-			qcom,qmp = <&aoss_qmp>;
+				opp-100000000 {
+					opp-hz = /bits/ 64 <100000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+				};
 
-			qcom,smem-states = <&smp2p_cdsp_out 0>;
-			qcom,smem-state-names = "stop";
+				opp-202000000 {
+					opp-hz = /bits/ 64 <202000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>;
+				};
+			};
+		};
 
+		usb_1_hsphy: phy@88e3000 {
+			compatible = "qcom,sm8350-usb-hs-phy",
+				     "qcom,usb-snps-hs-7nm-phy";
+			reg = <0 0x088e3000 0 0x400>;
 			status = "disabled";
+			#phy-cells = <0>;
 
-			glink-edge {
-				interrupts-extended = <&ipcc IPCC_CLIENT_CDSP
-							     IPCC_MPROC_SIGNAL_GLINK_QMP
-							     IRQ_TYPE_EDGE_RISING>;
-				mboxes = <&ipcc IPCC_CLIENT_CDSP
-						IPCC_MPROC_SIGNAL_GLINK_QMP>;
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "ref";
 
-				label = "cdsp";
-				qcom,remote-pid = <5>;
+			resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
+		};
 
-				fastrpc {
-					compatible = "qcom,fastrpc";
-					qcom,glink-channels = "fastrpcglink-apps-dsp";
-					label = "cdsp";
-					qcom,non-secure-domain;
-					#address-cells = <1>;
-					#size-cells = <0>;
+		usb_2_hsphy: phy@88e4000 {
+			compatible = "qcom,sm8250-usb-hs-phy",
+				     "qcom,usb-snps-hs-7nm-phy";
+			reg = <0 0x088e4000 0 0x400>;
+			status = "disabled";
+			#phy-cells = <0>;
 
-					compute-cb@1 {
-						compatible = "qcom,fastrpc-compute-cb";
-						reg = <1>;
-						iommus = <&apps_smmu 0x2161 0x0400>,
-							 <&apps_smmu 0x1181 0x0420>;
-					};
-
-					compute-cb@2 {
-						compatible = "qcom,fastrpc-compute-cb";
-						reg = <2>;
-						iommus = <&apps_smmu 0x2162 0x0400>,
-							 <&apps_smmu 0x1182 0x0420>;
-					};
-
-					compute-cb@3 {
-						compatible = "qcom,fastrpc-compute-cb";
-						reg = <3>;
-						iommus = <&apps_smmu 0x2163 0x0400>,
-							 <&apps_smmu 0x1183 0x0420>;
-					};
-
-					compute-cb@4 {
-						compatible = "qcom,fastrpc-compute-cb";
-						reg = <4>;
-						iommus = <&apps_smmu 0x2164 0x0400>,
-							 <&apps_smmu 0x1184 0x0420>;
-					};
-
-					compute-cb@5 {
-						compatible = "qcom,fastrpc-compute-cb";
-						reg = <5>;
-						iommus = <&apps_smmu 0x2165 0x0400>,
-							 <&apps_smmu 0x1185 0x0420>;
-					};
-
-					compute-cb@6 {
-						compatible = "qcom,fastrpc-compute-cb";
-						reg = <6>;
-						iommus = <&apps_smmu 0x2166 0x0400>,
-							 <&apps_smmu 0x1186 0x0420>;
-					};
-
-					compute-cb@7 {
-						compatible = "qcom,fastrpc-compute-cb";
-						reg = <7>;
-						iommus = <&apps_smmu 0x2167 0x0400>,
-							 <&apps_smmu 0x1187 0x0420>;
-					};
-
-					compute-cb@8 {
-						compatible = "qcom,fastrpc-compute-cb";
-						reg = <8>;
-						iommus = <&apps_smmu 0x2168 0x0400>,
-							 <&apps_smmu 0x1188 0x0420>;
-					};
-
-					/* note: secure cb9 in downstream */
-				};
-			};
-		};
-
-		sdhc_2: mmc@8804000 {
-			compatible = "qcom,sm8350-sdhci", "qcom,sdhci-msm-v5";
-			reg = <0 0x08804000 0 0x1000>;
-
-			interrupts = <GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 223 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "hc_irq", "pwr_irq";
-
-			clocks = <&gcc GCC_SDCC2_AHB_CLK>,
-				 <&gcc GCC_SDCC2_APPS_CLK>,
-				 <&rpmhcc RPMH_CXO_CLK>;
-			clock-names = "iface", "core", "xo";
-			resets = <&gcc GCC_SDCC2_BCR>;
-			interconnects = <&aggre2_noc MASTER_SDCC_2 0 &mc_virt SLAVE_EBI1 0>,
-					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_SDCC_2 0>;
-			interconnect-names = "sdhc-ddr","cpu-sdhc";
-			iommus = <&apps_smmu 0x4a0 0x0>;
-			power-domains = <&rpmhpd SM8350_CX>;
-			operating-points-v2 = <&sdhc2_opp_table>;
-			bus-width = <4>;
-			dma-coherent;
-
-			status = "disabled";
-
-			sdhc2_opp_table: opp-table {
-				compatible = "operating-points-v2";
-
-				opp-100000000 {
-					opp-hz = /bits/ 64 <100000000>;
-					required-opps = <&rpmhpd_opp_low_svs>;
-				};
-
-				opp-202000000 {
-					opp-hz = /bits/ 64 <202000000>;
-					required-opps = <&rpmhpd_opp_svs_l1>;
-				};
-			};
-		};
-
-		usb_1_hsphy: phy@88e3000 {
-			compatible = "qcom,sm8350-usb-hs-phy",
-				     "qcom,usb-snps-hs-7nm-phy";
-			reg = <0 0x088e3000 0 0x400>;
-			status = "disabled";
-			#phy-cells = <0>;
-
-			clocks = <&rpmhcc RPMH_CXO_CLK>;
-			clock-names = "ref";
-
-			resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
-		};
-
-		usb_2_hsphy: phy@88e4000 {
-			compatible = "qcom,sm8250-usb-hs-phy",
-				     "qcom,usb-snps-hs-7nm-phy";
-			reg = <0 0x088e4000 0 0x400>;
-			status = "disabled";
-			#phy-cells = <0>;
-
-			clocks = <&rpmhcc RPMH_CXO_CLK>;
-			clock-names = "ref";
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "ref";
 
 			resets = <&gcc GCC_QUSB2PHY_SEC_BCR>;
 		};
@@ -2985,190 +2610,565 @@ mdss_dsi0_phy: phy@ae94400 {
 				status = "disabled";
 			};
 
-			mdss_dsi1: dsi@ae96000 {
-				compatible = "qcom,sm8350-dsi-ctrl", "qcom,mdss-dsi-ctrl";
-				reg = <0 0x0ae96000 0 0x400>;
-				reg-names = "dsi_ctrl";
+			mdss_dsi1: dsi@ae96000 {
+				compatible = "qcom,sm8350-dsi-ctrl", "qcom,mdss-dsi-ctrl";
+				reg = <0 0x0ae96000 0 0x400>;
+				reg-names = "dsi_ctrl";
+
+				interrupt-parent = <&mdss>;
+				interrupts = <5>;
+
+				clocks = <&dispcc DISP_CC_MDSS_BYTE1_CLK>,
+					 <&dispcc DISP_CC_MDSS_BYTE1_INTF_CLK>,
+					 <&dispcc DISP_CC_MDSS_PCLK1_CLK>,
+					 <&dispcc DISP_CC_MDSS_ESC1_CLK>,
+					 <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&gcc GCC_DISP_HF_AXI_CLK>;
+				clock-names = "byte",
+					      "byte_intf",
+					      "pixel",
+					      "core",
+					      "iface",
+					      "bus";
+
+				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE1_CLK_SRC>,
+						  <&dispcc DISP_CC_MDSS_PCLK1_CLK_SRC>;
+				assigned-clock-parents = <&mdss_dsi1_phy 0>,
+							 <&mdss_dsi1_phy 1>;
+
+				operating-points-v2 = <&dsi1_opp_table>;
+				power-domains = <&rpmhpd SM8350_MMCX>;
+
+				phys = <&mdss_dsi1_phy>;
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+
+				dsi1_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					/* TODO: opp-187500000 should work with
+					 * &rpmhpd_opp_low_svs, but one some of
+					 * sm8350_hdk boards reboot using this
+					 * opp.
+					 */
+					opp-187500000 {
+						opp-hz = /bits/ 64 <187500000>;
+						required-opps = <&rpmhpd_opp_svs>;
+					};
+
+					opp-300000000 {
+						opp-hz = /bits/ 64 <300000000>;
+						required-opps = <&rpmhpd_opp_svs>;
+					};
+
+					opp-358000000 {
+						opp-hz = /bits/ 64 <358000000>;
+						required-opps = <&rpmhpd_opp_svs_l1>;
+					};
+				};
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						mdss_dsi1_in: endpoint {
+							remote-endpoint = <&dpu_intf2_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+						mdss_dsi1_out: endpoint {
+						};
+					};
+				};
+			};
+
+			mdss_dsi1_phy: phy@ae96400 {
+				compatible = "qcom,sm8350-dsi-phy-5nm";
+				reg = <0 0x0ae96400 0 0x200>,
+				      <0 0x0ae96600 0 0x280>,
+				      <0 0x0ae96900 0 0x27c>;
+				reg-names = "dsi_phy",
+					    "dsi_phy_lane",
+					    "dsi_pll";
+
+				#clock-cells = <1>;
+				#phy-cells = <0>;
+
+				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&rpmhcc RPMH_CXO_CLK>;
+				clock-names = "iface", "ref";
+
+				status = "disabled";
+			};
+		};
+
+		dispcc: clock-controller@af00000 {
+			compatible = "qcom,sm8350-dispcc";
+			reg = <0 0x0af00000 0 0x10000>;
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&mdss_dsi0_phy 0>, <&mdss_dsi0_phy 1>,
+				 <&mdss_dsi1_phy 0>, <&mdss_dsi1_phy 1>,
+				 <0>,
+				 <0>;
+			clock-names = "bi_tcxo",
+				      "dsi0_phy_pll_out_byteclk",
+				      "dsi0_phy_pll_out_dsiclk",
+				      "dsi1_phy_pll_out_byteclk",
+				      "dsi1_phy_pll_out_dsiclk",
+				      "dp_phy_pll_link_clk",
+				      "dp_phy_pll_vco_div_clk";
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+
+			power-domains = <&rpmhpd SM8350_MMCX>;
+		};
+
+		apps_smmu: iommu@15000000 {
+			compatible = "qcom,sm8350-smmu-500", "arm,mmu-500";
+			reg = <0 0x15000000 0 0x100000>;
+			#iommu-cells = <2>;
+			#global-interrupts = <2>;
+			interrupts =    <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 182 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 183 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 185 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 191 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 315 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 316 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 317 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 318 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 319 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 321 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 322 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 323 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 324 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 325 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 326 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 327 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 328 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 329 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 333 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 334 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 335 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 336 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 337 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 338 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 339 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 341 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 342 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 343 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 344 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 395 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 396 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 397 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 398 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 399 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 400 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 401 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 402 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 403 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 404 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 405 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 406 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 407 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 408 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 409 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 412 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 418 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 419 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 421 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 690 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 691 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 692 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 693 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 694 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 695 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 696 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 697 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 707 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		adsp: remoteproc@17300000 {
+			compatible = "qcom,sm8350-adsp-pas";
+			reg = <0 0x17300000 0 0x100>;
+
+			interrupts-extended = <&pdc 6 IRQ_TYPE_LEVEL_HIGH>,
+					      <&smp2p_adsp_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_adsp_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_adsp_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_adsp_in 3 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog", "fatal", "ready",
+					  "handover", "stop-ack";
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "xo";
+
+			power-domains = <&rpmhpd SM8350_LCX>,
+					<&rpmhpd SM8350_LMX>;
+			power-domain-names = "lcx", "lmx";
+
+			memory-region = <&pil_adsp_mem>;
+
+			qcom,qmp = <&aoss_qmp>;
+
+			qcom,smem-states = <&smp2p_adsp_out 0>;
+			qcom,smem-state-names = "stop";
+
+			status = "disabled";
+
+			glink-edge {
+				interrupts-extended = <&ipcc IPCC_CLIENT_LPASS
+							     IPCC_MPROC_SIGNAL_GLINK_QMP
+							     IRQ_TYPE_EDGE_RISING>;
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
+		intc: interrupt-controller@17a00000 {
+			compatible = "arm,gic-v3";
+			#interrupt-cells = <3>;
+			interrupt-controller;
+			#redistributor-regions = <1>;
+			redistributor-stride = <0 0x20000>;
+			reg = <0x0 0x17a00000 0x0 0x10000>,     /* GICD */
+			      <0x0 0x17a60000 0x0 0x100000>;    /* GICR * 8 */
+			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		timer@17c20000 {
+			compatible = "arm,armv7-timer-mem";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0 0 0x20000000>;
+			reg = <0x0 0x17c20000 0x0 0x1000>;
+			clock-frequency = <19200000>;
+
+			frame@17c21000 {
+				frame-number = <0>;
+				interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0x17c21000 0x1000>,
+				      <0x17c22000 0x1000>;
+			};
+
+			frame@17c23000 {
+				frame-number = <1>;
+				interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0x17c23000 0x1000>;
+				status = "disabled";
+			};
+
+			frame@17c25000 {
+				frame-number = <2>;
+				interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0x17c25000 0x1000>;
+				status = "disabled";
+			};
+
+			frame@17c27000 {
+				frame-number = <3>;
+				interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0x17c27000 0x1000>;
+				status = "disabled";
+			};
+
+			frame@17c29000 {
+				frame-number = <4>;
+				interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0x17c29000 0x1000>;
+				status = "disabled";
+			};
+
+			frame@17c2b000 {
+				frame-number = <5>;
+				interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0x17c2b000 0x1000>;
+				status = "disabled";
+			};
+
+			frame@17c2d000 {
+				frame-number = <6>;
+				interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0x17c2d000 0x1000>;
+				status = "disabled";
+			};
+		};
 
-				interrupt-parent = <&mdss>;
-				interrupts = <5>;
+		apps_rsc: rsc@18200000 {
+			label = "apps_rsc";
+			compatible = "qcom,rpmh-rsc";
+			reg = <0x0 0x18200000 0x0 0x10000>,
+				<0x0 0x18210000 0x0 0x10000>,
+				<0x0 0x18220000 0x0 0x10000>;
+			reg-names = "drv-0", "drv-1", "drv-2";
+			interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
+			qcom,tcs-offset = <0xd00>;
+			qcom,drv-id = <2>;
+			qcom,tcs-config = <ACTIVE_TCS  2>, <SLEEP_TCS   3>,
+					  <WAKE_TCS    3>, <CONTROL_TCS 0>;
+			power-domains = <&CLUSTER_PD>;
 
-				clocks = <&dispcc DISP_CC_MDSS_BYTE1_CLK>,
-					 <&dispcc DISP_CC_MDSS_BYTE1_INTF_CLK>,
-					 <&dispcc DISP_CC_MDSS_PCLK1_CLK>,
-					 <&dispcc DISP_CC_MDSS_ESC1_CLK>,
-					 <&dispcc DISP_CC_MDSS_AHB_CLK>,
-					 <&gcc GCC_DISP_HF_AXI_CLK>;
-				clock-names = "byte",
-					      "byte_intf",
-					      "pixel",
-					      "core",
-					      "iface",
-					      "bus";
+			rpmhcc: clock-controller {
+				compatible = "qcom,sm8350-rpmh-clk";
+				#clock-cells = <1>;
+				clock-names = "xo";
+				clocks = <&xo_board>;
+			};
 
-				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE1_CLK_SRC>,
-						  <&dispcc DISP_CC_MDSS_PCLK1_CLK_SRC>;
-				assigned-clock-parents = <&mdss_dsi1_phy 0>,
-							 <&mdss_dsi1_phy 1>;
+			rpmhpd: power-controller {
+				compatible = "qcom,sm8350-rpmhpd";
+				#power-domain-cells = <1>;
+				operating-points-v2 = <&rpmhpd_opp_table>;
 
-				operating-points-v2 = <&dsi1_opp_table>;
-				power-domains = <&rpmhpd SM8350_MMCX>;
+				rpmhpd_opp_table: opp-table {
+					compatible = "operating-points-v2";
 
-				phys = <&mdss_dsi1_phy>;
+					rpmhpd_opp_ret: opp1 {
+						opp-level = <RPMH_REGULATOR_LEVEL_RETENTION>;
+					};
 
-				#address-cells = <1>;
-				#size-cells = <0>;
+					rpmhpd_opp_min_svs: opp2 {
+						opp-level = <RPMH_REGULATOR_LEVEL_MIN_SVS>;
+					};
 
-				status = "disabled";
+					rpmhpd_opp_low_svs: opp3 {
+						opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
+					};
 
-				dsi1_opp_table: opp-table {
-					compatible = "operating-points-v2";
+					rpmhpd_opp_svs: opp4 {
+						opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
+					};
 
-					/* TODO: opp-187500000 should work with
-					 * &rpmhpd_opp_low_svs, but one some of
-					 * sm8350_hdk boards reboot using this
-					 * opp.
-					 */
-					opp-187500000 {
-						opp-hz = /bits/ 64 <187500000>;
-						required-opps = <&rpmhpd_opp_svs>;
+					rpmhpd_opp_svs_l1: opp5 {
+						opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
 					};
 
-					opp-300000000 {
-						opp-hz = /bits/ 64 <300000000>;
-						required-opps = <&rpmhpd_opp_svs>;
+					rpmhpd_opp_nom: opp6 {
+						opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
 					};
 
-					opp-358000000 {
-						opp-hz = /bits/ 64 <358000000>;
-						required-opps = <&rpmhpd_opp_svs_l1>;
+					rpmhpd_opp_nom_l1: opp7 {
+						opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
 					};
-				};
 
-				ports {
-					#address-cells = <1>;
-					#size-cells = <0>;
+					rpmhpd_opp_nom_l2: opp8 {
+						opp-level = <RPMH_REGULATOR_LEVEL_NOM_L2>;
+					};
 
-					port@0 {
-						reg = <0>;
-						mdss_dsi1_in: endpoint {
-							remote-endpoint = <&dpu_intf2_out>;
-						};
+					rpmhpd_opp_turbo: opp9 {
+						opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
 					};
 
-					port@1 {
-						reg = <1>;
-						mdss_dsi1_out: endpoint {
-						};
+					rpmhpd_opp_turbo_l1: opp10 {
+						opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
 					};
 				};
 			};
 
-			mdss_dsi1_phy: phy@ae96400 {
-				compatible = "qcom,sm8350-dsi-phy-5nm";
-				reg = <0 0x0ae96400 0 0x200>,
-				      <0 0x0ae96600 0 0x280>,
-				      <0 0x0ae96900 0 0x27c>;
-				reg-names = "dsi_phy",
-					    "dsi_phy_lane",
-					    "dsi_pll";
-
-				#clock-cells = <1>;
-				#phy-cells = <0>;
-
-				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
-					 <&rpmhcc RPMH_CXO_CLK>;
-				clock-names = "iface", "ref";
-
-				status = "disabled";
+			apps_bcm_voter: bcm-voter {
+				compatible = "qcom,bcm-voter";
 			};
 		};
 
-		dispcc: clock-controller@af00000 {
-			compatible = "qcom,sm8350-dispcc";
-			reg = <0 0x0af00000 0 0x10000>;
-			clocks = <&rpmhcc RPMH_CXO_CLK>,
-				 <&mdss_dsi0_phy 0>, <&mdss_dsi0_phy 1>,
-				 <&mdss_dsi1_phy 0>, <&mdss_dsi1_phy 1>,
-				 <0>,
-				 <0>;
-			clock-names = "bi_tcxo",
-				      "dsi0_phy_pll_out_byteclk",
-				      "dsi0_phy_pll_out_dsiclk",
-				      "dsi1_phy_pll_out_byteclk",
-				      "dsi1_phy_pll_out_dsiclk",
-				      "dp_phy_pll_link_clk",
-				      "dp_phy_pll_vco_div_clk";
-			#clock-cells = <1>;
-			#reset-cells = <1>;
-			#power-domain-cells = <1>;
+		cpufreq_hw: cpufreq@18591000 {
+			compatible = "qcom,sm8350-cpufreq-epss", "qcom,cpufreq-epss";
+			reg = <0 0x18591000 0 0x1000>,
+			      <0 0x18592000 0 0x1000>,
+			      <0 0x18593000 0 0x1000>;
+			reg-names = "freq-domain0", "freq-domain1", "freq-domain2";
 
-			power-domains = <&rpmhpd SM8350_MMCX>;
+			clocks = <&rpmhcc RPMH_CXO_CLK>, <&gcc GCC_GPLL0>;
+			clock-names = "xo", "alternate";
+
+			#freq-domain-cells = <1>;
 		};
 
-		adsp: remoteproc@17300000 {
-			compatible = "qcom,sm8350-adsp-pas";
-			reg = <0 0x17300000 0 0x100>;
+		cdsp: remoteproc@98900000 {
+			compatible = "qcom,sm8350-cdsp-pas";
+			reg = <0 0x98900000 0 0x1400000>;
 
-			interrupts-extended = <&pdc 6 IRQ_TYPE_LEVEL_HIGH>,
-					      <&smp2p_adsp_in 0 IRQ_TYPE_EDGE_RISING>,
-					      <&smp2p_adsp_in 1 IRQ_TYPE_EDGE_RISING>,
-					      <&smp2p_adsp_in 2 IRQ_TYPE_EDGE_RISING>,
-					      <&smp2p_adsp_in 3 IRQ_TYPE_EDGE_RISING>;
+			interrupts-extended = <&intc GIC_SPI 578 IRQ_TYPE_LEVEL_HIGH>,
+					      <&smp2p_cdsp_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp_in 3 IRQ_TYPE_EDGE_RISING>;
 			interrupt-names = "wdog", "fatal", "ready",
 					  "handover", "stop-ack";
 
 			clocks = <&rpmhcc RPMH_CXO_CLK>;
 			clock-names = "xo";
 
-			power-domains = <&rpmhpd SM8350_LCX>,
-					<&rpmhpd SM8350_LMX>;
-			power-domain-names = "lcx", "lmx";
+			power-domains = <&rpmhpd SM8350_CX>,
+					<&rpmhpd SM8350_MXC>;
+			power-domain-names = "cx", "mxc";
 
-			memory-region = <&pil_adsp_mem>;
+			interconnects = <&compute_noc MASTER_CDSP_PROC 0 &mc_virt SLAVE_EBI1 0>;
+
+			memory-region = <&pil_cdsp_mem>;
 
 			qcom,qmp = <&aoss_qmp>;
 
-			qcom,smem-states = <&smp2p_adsp_out 0>;
+			qcom,smem-states = <&smp2p_cdsp_out 0>;
 			qcom,smem-state-names = "stop";
 
 			status = "disabled";
 
 			glink-edge {
-				interrupts-extended = <&ipcc IPCC_CLIENT_LPASS
+				interrupts-extended = <&ipcc IPCC_CLIENT_CDSP
 							     IPCC_MPROC_SIGNAL_GLINK_QMP
 							     IRQ_TYPE_EDGE_RISING>;
-				mboxes = <&ipcc IPCC_CLIENT_LPASS
+				mboxes = <&ipcc IPCC_CLIENT_CDSP
 						IPCC_MPROC_SIGNAL_GLINK_QMP>;
 
-				label = "lpass";
-				qcom,remote-pid = <2>;
+				label = "cdsp";
+				qcom,remote-pid = <5>;
 
 				fastrpc {
 					compatible = "qcom,fastrpc";
 					qcom,glink-channels = "fastrpcglink-apps-dsp";
-					label = "adsp";
+					label = "cdsp";
 					qcom,non-secure-domain;
 					#address-cells = <1>;
 					#size-cells = <0>;
 
+					compute-cb@1 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <1>;
+						iommus = <&apps_smmu 0x2161 0x0400>,
+							 <&apps_smmu 0x1181 0x0420>;
+					};
+
+					compute-cb@2 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <2>;
+						iommus = <&apps_smmu 0x2162 0x0400>,
+							 <&apps_smmu 0x1182 0x0420>;
+					};
+
 					compute-cb@3 {
 						compatible = "qcom,fastrpc-compute-cb";
 						reg = <3>;
-						iommus = <&apps_smmu 0x1803 0x0>;
+						iommus = <&apps_smmu 0x2163 0x0400>,
+							 <&apps_smmu 0x1183 0x0420>;
 					};
 
 					compute-cb@4 {
 						compatible = "qcom,fastrpc-compute-cb";
 						reg = <4>;
-						iommus = <&apps_smmu 0x1804 0x0>;
+						iommus = <&apps_smmu 0x2164 0x0400>,
+							 <&apps_smmu 0x1184 0x0420>;
 					};
 
 					compute-cb@5 {
 						compatible = "qcom,fastrpc-compute-cb";
 						reg = <5>;
-						iommus = <&apps_smmu 0x1805 0x0>;
+						iommus = <&apps_smmu 0x2165 0x0400>,
+							 <&apps_smmu 0x1185 0x0420>;
+					};
+
+					compute-cb@6 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <6>;
+						iommus = <&apps_smmu 0x2166 0x0400>,
+							 <&apps_smmu 0x1186 0x0420>;
 					};
+
+					compute-cb@7 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <7>;
+						iommus = <&apps_smmu 0x2167 0x0400>,
+							 <&apps_smmu 0x1187 0x0420>;
+					};
+
+					compute-cb@8 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <8>;
+						iommus = <&apps_smmu 0x2168 0x0400>,
+							 <&apps_smmu 0x1188 0x0420>;
+					};
+
+					/* note: secure cb9 in downstream */
 				};
 			};
 		};
-- 
2.39.1

