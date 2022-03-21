Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 972424E279C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Mar 2022 14:34:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347942AbiCUNf3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Mar 2022 09:35:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347930AbiCUNf0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Mar 2022 09:35:26 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EE7A3CA54
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Mar 2022 06:33:56 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id h13so17865775ede.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Mar 2022 06:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aM6GQeVZtCegHilLMs+aD7A4drFAdvrQdeDC75uWokk=;
        b=0ZmJa6mEHVzoEvukgeG4nEGyuYrvNOV6BVoc0wD/1/Ux1o12tc/3YNQvOS4/iqjC4m
         GIFrwlLgMqP2tMUXoOlcRU60T1e5cQM/56JodEjpAdsgh7bI95LBnCAuale6tVLavsQQ
         H6YxEyLf3ZAz1jRLELbLsh6snRv0r/osgE3nNZ8lsw6tg3ZsgJikmuz1LcEhSMhovPia
         IYRTtLWa0Vok4cjLZvKEIggAjxNmyYiJ+fgWM0hAlxwHGyRahM/6oWSx144DCShIsw7h
         6HJWMJYp5CjDOrg4DrwtBlmFHafmu96DRTE0/3fCg1hJonH20hIDw+EpDetqIlCRvC6C
         z8DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aM6GQeVZtCegHilLMs+aD7A4drFAdvrQdeDC75uWokk=;
        b=6M95n8dzPw9o1CNIt0QEjUaJ3LLDEfV0JTCQDqivk8IHfDiSYqmE61B1NizW30Xvil
         hBJmVfFJldnTlI6wdXW8E/3GlZCxaetPK1lKerDXvxZHYi1pQJGWB4+WKxJOdH19iQ5I
         HbKGrjZlBfXZ1svfCfgNz8SwjCRadlL1BdrsBEduyX79YdRbhVPSYiawnUB9xkQ7JBPP
         3/8KohEffXLM0jSgCe75+zBOwGP3ebw1aPPZsyEtkavvSRXvS0In7FFwDqVEkQ+RKL/G
         kvPfM3ZcCH+ON/aFFQNFeqgJrb9lGqqDOOaYsb1e63ztjPCcTDsc0Yz1a9CuRWIcIH/3
         rKXw==
X-Gm-Message-State: AOAM532KbtPX18esZlscjFGqu5i5cZZ2dGLw33jr3Yn5cBEUgStSPGIf
        GbbMeq1Dz9/aLYI2HyfMOiGeDezz8Q27uw==
X-Google-Smtp-Source: ABdhPJwK5bxupTxJOcHJW/CL8XeUHz5cLnTleQNzf5yTSvwqrflM4qAG71Qe/NROSCms+FRKCcnQlw==
X-Received: by 2002:a05:6402:3591:b0:419:26ea:1e22 with SMTP id y17-20020a056402359100b0041926ea1e22mr10468061edc.27.1647869634278;
        Mon, 21 Mar 2022 06:33:54 -0700 (PDT)
Received: from otso.arnhem.chello.nl (a246182.upc-a.chello.nl. [62.163.246.182])
        by smtp.gmail.com with ESMTPSA id r22-20020a17090638d600b006d584aaa9c9sm6862154ejd.133.2022.03.21.06.33.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Mar 2022 06:33:53 -0700 (PDT)
From:   Luca Weiss <luca.weiss@fairphone.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/6] arm64: dts: qcom: sm6350: Add UFS nodes
Date:   Mon, 21 Mar 2022 14:33:17 +0100
Message-Id: <20220321133318.99406-6-luca.weiss@fairphone.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220321133318.99406-1-luca.weiss@fairphone.com>
References: <20220321133318.99406-1-luca.weiss@fairphone.com>
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

Add the necessary nodes for UFS and its PHY.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v2:
- rename node to ufs@ -> this makes this patch now (soft-)depend on
  https://lore.kernel.org/linux-arm-msm/20220320110616.18355-1-krzk@kernel.org/

 arch/arm64/boot/dts/qcom/sm6350.dtsi | 77 ++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index d7c9edff19f7..75e4b2b4d3af 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -541,6 +541,83 @@ uart2: serial@98c000 {
 			};
 		};
 
+		ufs_mem_hc: ufs@1d84000 {
+			compatible = "qcom,sm6350-ufshc", "qcom,ufshc",
+				     "jedec,ufs-2.0";
+			reg = <0 0x01d84000 0 0x3000>,
+			      <0 0x01d90000 0 0x8000>;
+			reg-names = "std", "ice";
+			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
+			phys = <&ufs_mem_phy_lanes>;
+			phy-names = "ufsphy";
+			lanes-per-direction = <2>;
+			#reset-cells = <1>;
+			resets = <&gcc GCC_UFS_PHY_BCR>;
+			reset-names = "rst";
+
+			power-domains = <&gcc UFS_PHY_GDSC>;
+
+			iommus = <&apps_smmu 0x80 0x0>;
+
+			clock-names = "core_clk",
+				      "bus_aggr_clk",
+				      "iface_clk",
+				      "core_clk_unipro",
+				      "ref_clk",
+				      "tx_lane0_sync_clk",
+				      "rx_lane0_sync_clk",
+				      "rx_lane1_sync_clk",
+				      "ice_core_clk";
+			clocks = <&gcc GCC_UFS_PHY_AXI_CLK>,
+				 <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
+				 <&gcc GCC_UFS_PHY_AHB_CLK>,
+				 <&gcc GCC_UFS_PHY_UNIPRO_CORE_CLK>,
+				 <&rpmhcc RPMH_QLINK_CLK>,
+				 <&gcc GCC_UFS_PHY_TX_SYMBOL_0_CLK>,
+				 <&gcc GCC_UFS_PHY_RX_SYMBOL_0_CLK>,
+				 <&gcc GCC_UFS_PHY_RX_SYMBOL_1_CLK>,
+				 <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
+			freq-table-hz =
+				<50000000 200000000>,
+				<0 0>,
+				<0 0>,
+				<37500000 150000000>,
+				<75000000 300000000>,
+				<0 0>,
+				<0 0>,
+				<0 0>,
+				<0 0>;
+
+			status = "disabled";
+		};
+
+		ufs_mem_phy: phy@1d87000 {
+			compatible = "qcom,sm6350-qmp-ufs-phy";
+			reg = <0 0x01d87000 0 0x18c>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			clock-names = "ref",
+				      "ref_aux";
+			clocks = <&gcc GCC_UFS_MEM_CLKREF_CLK>,
+				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>;
+
+			resets = <&ufs_mem_hc 0>;
+			reset-names = "ufsphy";
+
+			status = "disabled";
+
+			ufs_mem_phy_lanes: phy@1d87400 {
+				reg = <0 0x01d87400 0 0x128>,
+				      <0 0x01d87600 0 0x1fc>,
+				      <0 0x01d87c00 0 0x1dc>,
+				      <0 0x01d87800 0 0x128>,
+				      <0 0x01d87a00 0 0x1fc>;
+				#phy-cells = <0>;
+			};
+		};
+
 		tcsr_mutex: hwlock@1f40000 {
 			compatible = "qcom,tcsr-mutex";
 			reg = <0x0 0x01f40000 0x0 0x40000>;
-- 
2.35.1

