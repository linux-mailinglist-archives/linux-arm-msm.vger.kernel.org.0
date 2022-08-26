Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D6B45A2181
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Aug 2022 09:13:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245103AbiHZHNI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Aug 2022 03:13:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245205AbiHZHNE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Aug 2022 03:13:04 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99A20D2B15;
        Fri, 26 Aug 2022 00:13:01 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 6B70DB82F0D;
        Fri, 26 Aug 2022 07:13:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EC8DC433D6;
        Fri, 26 Aug 2022 07:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1661497979;
        bh=GWbxaqQPf3YDrh/wku55nuv0G5gGQpAu0zw/lIu2ong=;
        h=From:To:Cc:Subject:Date:From;
        b=TErPfgUVDm2fH9fSCeiWSoXacYedd/MShDs0cjDxm13D3+I4Ne5r1XEunXO92CzVV
         mDo3WH1FZp2C/TD8j+10D/WG5YL8ejPBWHmWqXQSxOYuFRnaXrBFf1zoSvj2QRieP6
         5g7fJDF0eq02Iz4NGaF2ISqOa2MTd+JphqijcfBZ0YT9ejiBftiI3iO4vSl30xW2u7
         7UVcQHA1E/dMlmE/rkCNTVhCe/pZIuf6rCKLed35Oh0miVg01KlEi7SjMJ+UAzye5E
         kzuy7jW5eicnvdcvcvqD9G2DK50M2/ILMTW7ukFh2NV1T7169mC/W+hjEuHhqCtnHU
         0UhI2I0qaQKdg==
From:   Eric Biggers <ebiggers@kernel.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: sm8450: add Inline Crypto Engine registers and clock
Date:   Fri, 26 Aug 2022 00:12:44 -0700
Message-Id: <20220826071244.185584-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Eric Biggers <ebiggers@google.com>

Add the registers and clock for the Inline Crypto Engine (ICE) to the
device tree node for the UFS host controller on sm8450.  This makes
ufs_qcom support inline encryption when CONFIG_SCSI_UFS_CRYPTO=y.

The address and size of the register range, and the minimum and maximum
frequency of the ICE core clock, all match the values used downstream.

I've validated this on an SM8450 HDK using the 'encrypt' group of
xfstests on ext4 with MOUNT_OPTIONS="-o inlinecrypt".

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 4978c5ba5dd085..517b3a1fbe7c04 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -3069,7 +3069,9 @@ system-cache-controller@19200000 {
 		ufs_mem_hc: ufshc@1d84000 {
 			compatible = "qcom,sm8450-ufshc", "qcom,ufshc",
 				     "jedec,ufs-2.0";
-			reg = <0 0x01d84000 0 0x3000>;
+			reg = <0 0x01d84000 0 0x3000>,
+			      <0 0x01d88000 0 0x8000>;
+			reg-names = "std", "ice";
 			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
 			phys = <&ufs_mem_phy_lanes>;
 			phy-names = "ufsphy";
@@ -3093,7 +3095,8 @@ ufs_mem_hc: ufshc@1d84000 {
 				"ref_clk",
 				"tx_lane0_sync_clk",
 				"rx_lane0_sync_clk",
-				"rx_lane1_sync_clk";
+				"rx_lane1_sync_clk",
+				"ice_core_clk";
 			clocks =
 				<&gcc GCC_UFS_PHY_AXI_CLK>,
 				<&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
@@ -3102,7 +3105,8 @@ ufs_mem_hc: ufshc@1d84000 {
 				<&rpmhcc RPMH_CXO_CLK>,
 				<&gcc GCC_UFS_PHY_TX_SYMBOL_0_CLK>,
 				<&gcc GCC_UFS_PHY_RX_SYMBOL_0_CLK>,
-				<&gcc GCC_UFS_PHY_RX_SYMBOL_1_CLK>;
+				<&gcc GCC_UFS_PHY_RX_SYMBOL_1_CLK>,
+				<&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
 			freq-table-hz =
 				<75000000 300000000>,
 				<0 0>,
@@ -3111,7 +3115,8 @@ ufs_mem_hc: ufshc@1d84000 {
 				<75000000 300000000>,
 				<0 0>,
 				<0 0>,
-				<0 0>;
+				<0 0>,
+				<75000000 300000000>;
 			status = "disabled";
 		};
 

base-commit: 1c23f9e627a7b412978b4e852793c5e3c3efc555
-- 
2.37.2

