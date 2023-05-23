Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA17770DEBE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 May 2023 16:09:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237287AbjEWOJ2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 May 2023 10:09:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237063AbjEWOJO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 May 2023 10:09:14 -0400
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACAFD170F
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 May 2023 07:07:30 -0700 (PDT)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2af7081c9ebso32753861fa.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 May 2023 07:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684850789; x=1687442789;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EDfmd2LIuPA0HfG9IqKD3+P6fxYepp/qyiFotzBuREY=;
        b=yOXW/G1QDsaAQQNpkxXpsb0NKccjnxTXVp15BbHbHVoMfBepGV14vktZyaZW2SSdTM
         +nGraDABo+SHIS8lSxUpdjTVHL2TDDCjPE5AAvXf7sIouMYygBIOVWhVs90rCG3IPyXd
         VaJmqIsZR68WwgwKanwYgBGHfM2ldTCrY9e4Kf+kWZDNnKYMdT64TmwxJTbYAf8f9IzM
         uKn2hzAatKBA0h7kqzftvKenqYhJhGTRX9t+gB4GRnYDRhLhKG2nMrGS6o4eYUbsYHsq
         AVUHiogSSUgKT67ZMYslQMAi2lp1g7cCTQh7agAXF6RKe7io8aBrquGROgnYFeTgLYBz
         D3Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684850789; x=1687442789;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EDfmd2LIuPA0HfG9IqKD3+P6fxYepp/qyiFotzBuREY=;
        b=DgP1D9UBK8hZe6rF6d2SqqSvvCnxy8VovSpoSim97TOG84hCadnVcL6xAISWyhQ+hx
         YDxO6Js+Ta5CxLSXwr0ZTVKl4NypCtDvcnR0ieyWAJZPbV7No1+TDdWo/uJB8412tnrD
         LfXQ7K+yVw4R1w4c3wDq2pxXCP6pyDCo93FW9aOhof4YduIVQ51pj+38hIDnX/DFYM+W
         niPzvPibc9GB6HXv0kWh3X7U/i8W/pXlcsKQx/kKdiHmzq9GUQywXkHa3VFryY8OXMOa
         zferr1OsRI6Nfvo295R9I5/NZQn3yG3FmrgPOWrA8HXL5NsuT/q24QdLYTLDJ6D9QVk4
         9B2w==
X-Gm-Message-State: AC+VfDwG5FKPVY1ZsQqoy8Lotm76iONucayGpu1JU4QGn4zFdW8cG+D1
        fCi27rT6EbFlX+GgP+JdRP3yuQ==
X-Google-Smtp-Source: ACHHUZ5uAGMlv7gLQ78zmefjII54MYHtC0gPTq4eUFeXrGSgWkrw/Xtc4d4nu4jEwbNh1ac29uhvxA==
X-Received: by 2002:a2e:99cf:0:b0:2ac:862d:ad9e with SMTP id l15-20020a2e99cf000000b002ac862dad9emr4767749ljj.46.1684850789130;
        Tue, 23 May 2023 07:06:29 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id l1-20020a2e9081000000b002adbe01cd69sm1633536ljg.9.2023.05.23.07.06.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 07:06:28 -0700 (PDT)
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
Subject: [PATCH v3 07/11] arm64: dts: qcom: sm6350: switch UFS QMP PHY to new style of bindings
Date:   Tue, 23 May 2023 17:06:18 +0300
Message-Id: <20230523140622.265692-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230523140622.265692-1-dmitry.baryshkov@linaro.org>
References: <20230523140622.265692-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.6
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
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index 18c4616848ce..a816bb212174 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -943,7 +943,7 @@ ufs_mem_hc: ufs@1d84000 {
 			      <0 0x01d90000 0 0x8000>;
 			reg-names = "std", "ice";
 			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
-			phys = <&ufs_mem_phy_lanes>;
+			phys = <&ufs_mem_phy>;
 			phy-names = "ufsphy";
 			lanes-per-direction = <2>;
 			#reset-cells = <1>;
@@ -988,10 +988,7 @@ ufs_mem_hc: ufs@1d84000 {
 
 		ufs_mem_phy: phy@1d87000 {
 			compatible = "qcom,sm6350-qmp-ufs-phy";
-			reg = <0 0x01d87000 0 0x18c>;
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges;
+			reg = <0 0x01d87000 0 0x1000>;
 
 			clock-names = "ref",
 				      "ref_aux";
@@ -1001,16 +998,9 @@ ufs_mem_phy: phy@1d87000 {
 			resets = <&ufs_mem_hc 0>;
 			reset-names = "ufsphy";
 
-			status = "disabled";
+			#phy-cells = <0>;
 
-			ufs_mem_phy_lanes: phy@1d87400 {
-				reg = <0 0x01d87400 0 0x128>,
-				      <0 0x01d87600 0 0x1fc>,
-				      <0 0x01d87c00 0 0x1dc>,
-				      <0 0x01d87800 0 0x128>,
-				      <0 0x01d87a00 0 0x1fc>;
-				#phy-cells = <0>;
-			};
+			status = "disabled";
 		};
 
 		ipa: ipa@1e40000 {
-- 
2.39.2

