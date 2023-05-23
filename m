Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF6C070DEC3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 May 2023 16:09:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237226AbjEWOJa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 May 2023 10:09:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237169AbjEWOJQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 May 2023 10:09:16 -0400
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 204261718
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 May 2023 07:07:32 -0700 (PDT)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2af29e51722so50214201fa.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 May 2023 07:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684850790; x=1687442790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N7OXVIkjrWVLvZ3qsnkAad9UB/zj1wCOAqS0MZBYARE=;
        b=SJ0R6plCpIPvEk+0BoEMGpm/9zncnxBQK+2RoeJh1OnB/d91jgaa5TQLpkz5MfA/yx
         gSmf/eqT0Is1+SzqWKvS1RamFDyK3fbZ1Yv5CrqA7WlLJS3bZiz0O1Zj3Q0wh2KpVC5Q
         pAyGyVO+Em7ei6Yo3/AX+AUlcky5WT/41SSSs5nH00tN/R9Nx0FVj8L6LQiNGXN+ZSZh
         es9nCkkA5NtgDOjn9TPDwJ71y3uAJ4g4G8DzILju81mem1ddE/ZHCYzvhD8JO2TYDSjR
         GoVwA68knnKrSpXf2oCZenqRQHbLxyBkGpefwqNgbeig06caDijraQPRpLiUsyi29dxi
         pVvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684850790; x=1687442790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N7OXVIkjrWVLvZ3qsnkAad9UB/zj1wCOAqS0MZBYARE=;
        b=jFrQ64hSMVIercXDpaKD98SbPeR3qYp8F2IVfZEfOcgK1oLuiMGfNoH/5Cu+as1rEm
         VUJROhmxRqnFxMgII9EuykQoDw66EcUpEuOtKTZ9SHaiPRepI3c1OsUdmR5GuhAbCoF/
         2wkXYpUsTi3H/JytP8kOnY8wu3AMzJK4DRYNDfMeqQKpANvlvaCIO2umtrFcsUgpu3HU
         MKWBCID/plfb/RHe+wlFAkc5Usbf9elSK7fCE/hdKKI/GFqtDOVq+YdSmOFWELLvlK0O
         opPxsUChhNB/Yj4OS0PHHijJpRko1ryEzvX1Jk2fhzLpcmzM5YB7wwIB0IBiOWpiGQ3b
         im1Q==
X-Gm-Message-State: AC+VfDwzoBtithkin5ry3OV7Q9fqQSegJMgq7rfvaIrmutiZvS2jCf41
        5PgAyjpqwOJnKy3q8xaj+Soyig==
X-Google-Smtp-Source: ACHHUZ6i+Nva3NLYuIxC8pAEsJo3OYiWZwFoFqEC2O+BoyB3/cmSUocl19hauHBHH1VHN3l1QNFgFg==
X-Received: by 2002:a2e:96c7:0:b0:2ad:cd36:3379 with SMTP id d7-20020a2e96c7000000b002adcd363379mr5584565ljj.39.1684850790601;
        Tue, 23 May 2023 07:06:30 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id l1-20020a2e9081000000b002adbe01cd69sm1633536ljg.9.2023.05.23.07.06.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 07:06:30 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org
Subject: [PATCH v3 09/11] arm64: dts: qcom: sm8250: switch UFS QMP PHY to new style of bindings
Date:   Tue, 23 May 2023 17:06:20 +0300
Message-Id: <20230523140622.265692-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230523140622.265692-1-dmitry.baryshkov@linaro.org>
References: <20230523140622.265692-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Change the UFS QMP PHY to use newer style of QMP PHY bindings (single
resource region, no per-PHY subnodes).

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 7bea916900e2..b6e631bfcdf9 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -2165,7 +2165,7 @@ ufs_mem_hc: ufshc@1d84000 {
 				     "jedec,ufs-2.0";
 			reg = <0 0x01d84000 0 0x3000>;
 			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
-			phys = <&ufs_mem_phy_lanes>;
+			phys = <&ufs_mem_phy>;
 			phy-names = "ufsphy";
 			lanes-per-direction = <2>;
 			#reset-cells = <1>;
@@ -2209,10 +2209,8 @@ ufs_mem_hc: ufshc@1d84000 {
 
 		ufs_mem_phy: phy@1d87000 {
 			compatible = "qcom,sm8250-qmp-ufs-phy";
-			reg = <0 0x01d87000 0 0x1c0>;
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges;
+			reg = <0 0x01d87000 0 0x1000>;
+
 			clock-names = "ref",
 				      "ref_aux";
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
@@ -2220,16 +2218,10 @@ ufs_mem_phy: phy@1d87000 {
 
 			resets = <&ufs_mem_hc 0>;
 			reset-names = "ufsphy";
-			status = "disabled";
 
-			ufs_mem_phy_lanes: phy@1d87400 {
-				reg = <0 0x01d87400 0 0x16c>,
-				      <0 0x01d87600 0 0x200>,
-				      <0 0x01d87c00 0 0x200>,
-				      <0 0x01d87800 0 0x16c>,
-				      <0 0x01d87a00 0 0x200>;
-				#phy-cells = <0>;
-			};
+			#phy-cells = <0>;
+
+			status = "disabled";
 		};
 
 		tcsr_mutex: hwlock@1f40000 {
-- 
2.39.2

