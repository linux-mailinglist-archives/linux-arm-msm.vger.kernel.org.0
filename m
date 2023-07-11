Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C2F2274F2BF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jul 2023 16:52:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231739AbjGKOwD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Jul 2023 10:52:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233046AbjGKOwC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Jul 2023 10:52:02 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0E9810C7
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jul 2023 07:52:00 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2b70404a5a0so91676201fa.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jul 2023 07:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689087119; x=1691679119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4TP85Sw52C7H7s8rcI4zy2XyYLS/5Z/UH1XDKXoCVO4=;
        b=UsHxGAH/Iaq+RcqvBtK+sBkQDtT1XhL7x+ZYGpxawd2B4tMabt1ncRpi7uRF34RTT+
         l3UMJ1gUpPdhU9iRJbMxjZAU/YEHLtJhk3GnKCkjognmo7DLCkRYx5t81pa8qprmYIDU
         9CQ858StoM1Vo+0AoZq/+2VtCnh0Cf4UIxsESTBcFsP6zdgxguYusI9whXFXEeisF5EI
         yLWpP2R2S1TWuX1DFW4iTfrZ8Ygr37CWRySuOmsq3ZSbBL3/cdIgzhL6h6TZAue/olQT
         9XWpMGDl5D+O1gQA0jne0jDAIuiwXr66PqGEWDj2LCX+2oxMSetoCCWgbA72fMh0e6JV
         TBDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689087119; x=1691679119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4TP85Sw52C7H7s8rcI4zy2XyYLS/5Z/UH1XDKXoCVO4=;
        b=bWNWSgSHFhqrxrdFSBIZoJunjiKEaHVujGWlC+W+iPwJ+TIKlQiyh4ROYqZ5Cxmkku
         FfigW6v7cvjD6nq0Qqf2wFY50IwLKCSeJBM3S4mn/O3A+H9lzTWBeVxuMGAGHjjwko6j
         hF30DRppuWcIYcx5eLQnV2RvKviZbuObHyY2nBRYqUwv1ATdpTeB8dO3pylQGM/rs5c9
         yEpuLLO06riMz6su4KH6ICDIdzGZbDkOM6to2TpoqLK3oVl6l4+kMVAbE4l0eym9ObZI
         9DEMehxmy1UUOuE4NYoewEJCbHvl4POTsO/LYJh9zA0f7l5WLh6L8yGaJ7scmOpUkAhc
         UXsQ==
X-Gm-Message-State: ABy/qLZsO0Id+n78aOA8gsQh5JbZRt1YEa5V14FjLVho/Hjazb011bk+
        ycFtUCSAHr3Wy2DKLg+/uqZ3jQ==
X-Google-Smtp-Source: APBJJlHpl5PumBOs1mrv+4Zmv/il64KVeVC+wtC9GZma7JCd4jBp9YeEJ+i3cS14nOKaw25q7kNr2Q==
X-Received: by 2002:a2e:7a06:0:b0:2b6:bd82:80b1 with SMTP id v6-20020a2e7a06000000b002b6bd8280b1mr14235518ljc.37.1689087119027;
        Tue, 11 Jul 2023 07:51:59 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id a10-20020a2eb16a000000b002b6ee363337sm492454ljm.120.2023.07.11.07.51.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 07:51:58 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org
Subject: [PATCH v4 06/11] arm64: dts: qcom: sm6115: switch UFS QMP PHY to new style of bindings
Date:   Tue, 11 Jul 2023 17:51:48 +0300
Message-Id: <20230711145153.4167820-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230711145153.4167820-1-dmitry.baryshkov@linaro.org>
References: <20230711145153.4167820-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
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
 arch/arm64/boot/dts/qcom/sm6115.dtsi | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index 9f2c968e3ad7..0adbc827ee1b 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -983,7 +983,7 @@ ufs_mem_hc: ufs@4804000 {
 			reg = <0x0 0x04804000 0x0 0x3000>, <0x0 0x04810000 0x0 0x8000>;
 			reg-names = "std", "ice";
 			interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
-			phys = <&ufs_mem_phy_lanes>;
+			phys = <&ufs_mem_phy>;
 			phy-names = "ufsphy";
 			lanes-per-direction = <1>;
 			#reset-cells = <1>;
@@ -1024,24 +1024,17 @@ ufs_mem_hc: ufs@4804000 {
 
 		ufs_mem_phy: phy@4807000 {
 			compatible = "qcom,sm6115-qmp-ufs-phy";
-			reg = <0x0 0x04807000 0x0 0x1c4>;
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges;
+			reg = <0x0 0x04807000 0x0 0x1000>;
 
 			clocks = <&gcc GCC_UFS_CLKREF_CLK>, <&gcc GCC_UFS_PHY_PHY_AUX_CLK>;
 			clock-names = "ref", "ref_aux";
 
 			resets = <&ufs_mem_hc 0>;
 			reset-names = "ufsphy";
-			status = "disabled";
 
-			ufs_mem_phy_lanes: phy@4807400 {
-				reg = <0x0 0x04807400 0x0 0x098>,
-				      <0x0 0x04807600 0x0 0x130>,
-				      <0x0 0x04807c00 0x0 0x16c>;
-				#phy-cells = <0>;
-			};
+			#phy-cells = <0>;
+
+			status = "disabled";
 		};
 
 		gpi_dma0: dma-controller@4a00000 {
-- 
2.39.2

