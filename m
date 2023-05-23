Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8FB0270DEBB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 May 2023 16:09:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237093AbjEWOJ1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 May 2023 10:09:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237098AbjEWOJN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 May 2023 10:09:13 -0400
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECACB1708
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 May 2023 07:07:28 -0700 (PDT)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2af177f12d1so71502101fa.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 May 2023 07:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684850787; x=1687442787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z0bfrDOeRsWFRYCGDzaeVEK2/C4B8ywoYnHbBSFYq8Q=;
        b=RmCgTudmKOAk3F4f24pSHuO+esMLvE+vj6z68alIvfSRev1V7pX4PKdCHA/+uePRx9
         AQJCuNeJfZo2mLCs8/Coz94uReqmczFreYJHZ04q3o8iSc62zshtg4jauX+Z2+oHuNvm
         dmVskVpNY58lAt6qoLcPIuo3+cqYF4zqoCjXbJmWRM9JlI6aMclik9Y6Z7g5WBNeAbyL
         44yRSgZ0gT+ygoFhhyUZdXGZa0BPWvIWaF1DxqKqZLCfV2l8yMLcfcqzs+3MDSJ+Uy1v
         mIb9Kk96Uud+9IAkOT9cR0D9KrhPRoc/W79xXBpKsrKKgFffOyy/KohOTcSkRGjbxH3/
         V9BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684850787; x=1687442787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z0bfrDOeRsWFRYCGDzaeVEK2/C4B8ywoYnHbBSFYq8Q=;
        b=MEy4Ff71hs0AV4yMUan2aM/xPP1HJu+WOetx37dQJWzuTfm0iibdBxcD0Tm+/4LJyb
         7X1OR7CdE45IQp+yOmidAfguEKkhW/ognpB/yDfMlp0DZy8QJHIwbZ7t1F0SkJPEQkzp
         qscFUfeOs9/D3MVGV2oMDOWyc+mCril5qyfR5HoN7pximVF7kyYFuVSbAGJyzqQoj/nh
         0Yuel+eZaofRlpWQBmZz4HsC/hxYOvFC4mh4ZOCZTD1eEvsszKLdQ4Q91flwViLVB/ba
         19dg6QTltz3nfd+GlCNBeeifiCnvLoaGTJ+NS9S29ERaMtX3a4tvhmitUim03z1Fpn/N
         GpAg==
X-Gm-Message-State: AC+VfDxwHzBbkx6INc7ctNVL/p/GwhwpgLF3Tejyqa0OO5UX0lz/QJL9
        KLsb4k4GS6Zjt7utx7VnjTvQyg==
X-Google-Smtp-Source: ACHHUZ7ugcNovSJmk3laAoEQYms3ytGF4vxcJm4TGaIKuOVGpPTKHSmuCi0/mNoTsgT3QYgfCmTOPg==
X-Received: by 2002:a2e:968f:0:b0:2af:2d77:9be5 with SMTP id q15-20020a2e968f000000b002af2d779be5mr4163464lji.4.1684850787432;
        Tue, 23 May 2023 07:06:27 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id l1-20020a2e9081000000b002adbe01cd69sm1633536ljg.9.2023.05.23.07.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 07:06:27 -0700 (PDT)
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
Subject: [PATCH v3 05/11] arm64: dts: qcom: sdm845: switch UFS QMP PHY to new style of bindings
Date:   Tue, 23 May 2023 17:06:16 +0300
Message-Id: <20230523140622.265692-6-dmitry.baryshkov@linaro.org>
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

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 90424442bb4a..68660d532afa 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -2565,7 +2565,7 @@ ufs_mem_hc: ufshc@1d84000 {
 			      <0 0x01d90000 0 0x8000>;
 			reg-names = "std", "ice";
 			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
-			phys = <&ufs_mem_phy_lanes>;
+			phys = <&ufs_mem_phy>;
 			phy-names = "ufsphy";
 			lanes-per-direction = <2>;
 			power-domains = <&gcc UFS_PHY_GDSC>;
@@ -2611,10 +2611,8 @@ ufs_mem_hc: ufshc@1d84000 {
 
 		ufs_mem_phy: phy@1d87000 {
 			compatible = "qcom,sdm845-qmp-ufs-phy";
-			reg = <0 0x01d87000 0 0x18c>;
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges;
+			reg = <0 0x01d87000 0 0x1000>;
+
 			clock-names = "ref",
 				      "ref_aux";
 			clocks = <&gcc GCC_UFS_MEM_CLKREF_CLK>,
@@ -2622,16 +2620,9 @@ ufs_mem_phy: phy@1d87000 {
 
 			resets = <&ufs_mem_hc 0>;
 			reset-names = "ufsphy";
-			status = "disabled";
 
-			ufs_mem_phy_lanes: phy@1d87400 {
-				reg = <0 0x01d87400 0 0x108>,
-				      <0 0x01d87600 0 0x1e0>,
-				      <0 0x01d87c00 0 0x1dc>,
-				      <0 0x01d87800 0 0x108>,
-				      <0 0x01d87a00 0 0x1e0>;
-				#phy-cells = <0>;
-			};
+			#phy-cells = <0>;
+			status = "disabled";
 		};
 
 		cryptobam: dma-controller@1dc4000 {
-- 
2.39.2

