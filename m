Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A9AD6C75B2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Mar 2023 03:25:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231520AbjCXCZy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Mar 2023 22:25:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231405AbjCXCZt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Mar 2023 22:25:49 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D536298CA
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 19:25:48 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id y20so424191lfj.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 19:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679624747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IbN39otk6hUcNcOTu8YjAxJiwFKo8lxNu3zhs1JvPwk=;
        b=qkQHjyWc11QFGQoW74e5LTQdtxbsund52LJypDk2lVQka9VjR/JD5VvTXQQ7vJQXLA
         c9e6n8HWQPb70YrBuCD5m8M/aSjSji0L/Rk+0LUoj3G96zHKh64Qty74OtPFfdqIUgoA
         EncMbp8HrIcMeBhFDbg538JRfAVIV6sLr7jos3/KAn2RizeLLST4nbAPCcx7jifJ5kX5
         S0eNrSYdOM9vVEEoAA1IrxvSbEMxymKT8oy1GmCCJ+TgTedjjJyuxR6nwdG66NuefI/7
         7AfEMXZnSlEQKiXuDUG8RXPycT6R85rgRXKBAngfq2O1EmUoE1e2B9AdythLkuWYJzaK
         y0xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679624747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IbN39otk6hUcNcOTu8YjAxJiwFKo8lxNu3zhs1JvPwk=;
        b=eEwe/5fGAl0Kkj8Suu73UEAD4/Wz4MCddmBrnjZH0ogc6gMChYqxiUdzVzhg1s+lcz
         1SV3DyuJCg8YZnXy24gjMDkEtqKKPGWfmciJEi8E8cQF8FfzonztmP3RXNwoPhlg4ZsB
         60q9NJuos2IjOF5rRvf6vpRzHl/ZaAT3bnqB81OBjMxsjp7+V+erzyrL/U0gDD94Pg/h
         h7N4gI8gvyOp8SP7+de4MOSvQlJS3VSFItn6qoIA/7UKgBiPBteLxGLvQ1r6dVfa6fWa
         fRgJoIVrqAJ8H6LhTb07QGnURRKC0ZSTUzuqox2MFA+x08qZfvwFsWubYVMeSJWNfImT
         C3Uw==
X-Gm-Message-State: AAQBX9d/cyxB64xXGx4N7dY2HtXN4gNQGE4FPGCWNpy+tnIdvdVnv3kg
        ozBob7p98LswnzZO2TzvI0r6HA==
X-Google-Smtp-Source: AKy350ZBifnlHbpd9ue1HMmnbbAwFKf/OLhranzn29rVCriboFuJS3c4+uOQkuXb1tl0BVgos1n02g==
X-Received: by 2002:a05:6512:51c:b0:4cd:adad:fd9 with SMTP id o28-20020a056512051c00b004cdadad0fd9mr195876lfb.38.1679624747606;
        Thu, 23 Mar 2023 19:25:47 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id x4-20020a19f604000000b004db3aa3c542sm3162628lfe.47.2023.03.23.19.25.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 19:25:47 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 30/41] arm64: dts: qcom: sm8450: switch UFS QMP PHY to new style of bindings
Date:   Fri, 24 Mar 2023 05:25:03 +0300
Message-Id: <20230324022514.1800382-31-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230324022514.1800382-1-dmitry.baryshkov@linaro.org>
References: <20230324022514.1800382-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Change the UFS QMP PHY to use newer style of QMP PHY bindings (single
resource region, no per-PHY subnodes).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 28 ++++++++++------------------
 1 file changed, 10 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index db264ceb748b..01fe1108cca2 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -745,9 +745,9 @@ gcc: clock-controller@100000 {
 				 <&pcie0_lane>,
 				 <&pcie1_lane>,
 				 <0>,
-				 <&ufs_mem_phy_lanes 0>,
-				 <&ufs_mem_phy_lanes 1>,
-				 <&ufs_mem_phy_lanes 2>,
+				 <&ufs_mem_phy 0>,
+				 <&ufs_mem_phy 1>,
+				 <&ufs_mem_phy 2>,
 				 <&usb_1_qmpphy QMP_USB43DP_USB3_PIPE_CLK>;
 			clock-names = "bi_tcxo",
 				      "sleep_clk",
@@ -4075,7 +4075,7 @@ ufs_mem_hc: ufshc@1d84000 {
 			      <0 0x01d88000 0 0x8000>;
 			reg-names = "std", "ice";
 			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
-			phys = <&ufs_mem_phy_lanes>;
+			phys = <&ufs_mem_phy>;
 			phy-names = "ufsphy";
 			lanes-per-direction = <2>;
 			#reset-cells = <1>;
@@ -4125,10 +4125,8 @@ ufs_mem_hc: ufshc@1d84000 {
 
 		ufs_mem_phy: phy@1d87000 {
 			compatible = "qcom,sm8450-qmp-ufs-phy";
-			reg = <0 0x01d87000 0 0x1c4>;
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges;
+			reg = <0 0x01d87000 0 0x1000>;
+
 			clock-names = "ref", "ref_aux", "qref";
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
 				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>,
@@ -4136,17 +4134,11 @@ ufs_mem_phy: phy@1d87000 {
 
 			resets = <&ufs_mem_hc 0>;
 			reset-names = "ufsphy";
-			status = "disabled";
 
-			ufs_mem_phy_lanes: phy@1d87400 {
-				reg = <0 0x01d87400 0 0x188>,
-				      <0 0x01d87600 0 0x200>,
-				      <0 0x01d87c00 0 0x200>,
-				      <0 0x01d87800 0 0x188>,
-				      <0 0x01d87a00 0 0x200>;
-				#clock-cells = <1>;
-				#phy-cells = <0>;
-			};
+			#clock-cells = <1>;
+			#phy-cells = <0>;
+
+			status = "disabled";
 		};
 
 		sdhc_2: mmc@8804000 {
-- 
2.30.2

