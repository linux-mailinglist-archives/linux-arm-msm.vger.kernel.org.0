Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A95AA70B057
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 May 2023 22:38:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230416AbjEUUis (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 21 May 2023 16:38:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231178AbjEUUip (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 21 May 2023 16:38:45 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E957DE9
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 May 2023 13:38:43 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-4f4b2bc1565so21726e87.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 May 2023 13:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684701522; x=1687293522;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TRJBo2K4JrjwLhHiK/ZocJWB2xdutU+lTQFD8QMjoGA=;
        b=KaypcyySOVmVu9LX0Ib3kZDV1gj2Zlz/g1TvDO1Af01uo0XwfurMgfRPpHdigfhcHp
         USTtQ2zgyTfDIJGN6P7NSn2n2SD4ZVsOfTbM0Nk2OMq9UfXgoMHaHM9EEIcGnDY80dlW
         dcHeCXJ/pKXGZjHzXBg+YxxpDlUWwY35SsJ/MbnSbbbOdahKmsgWKYtbwpdeRdx5Lp10
         Zs/lqJXlTO2YZBmhP5AYtoaLvDVj6C9WeXUfLvN40LGfzA0NQnYNXhXCC1TgrPsluZPH
         JPEcs03R4XPb1kei1ihUlKYGopLDGUdWDhysMIjJAFd8Y4jN4BzDPZ1Eeb/2g4fB/tFg
         GDbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684701522; x=1687293522;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TRJBo2K4JrjwLhHiK/ZocJWB2xdutU+lTQFD8QMjoGA=;
        b=kibRiyEXg/XKPxhlFDYoNSjtq/7fHsk6UZZa8VnSbhrHVbbYJjWeIuXOK9d6L4ip+E
         JCwb50+xvDpZOrNPwdRua+jEp/1yuIdpLW9mwaDlHx3ZDMRS4h+Qnw3qbuMu8GneD06R
         myG7wDCd36V0VUHbaz/pvdHDi4LkTZyI4KpDvQD0qDlv1gaCQPL4q7V3Tx4uxbUm9FsK
         0b+UQYN9Iud3PQJDYQIscW2mXI456GGCJ4ocun1LEYx4AL7C61bvAAy3nyxN6lZAY8ZM
         oBJcV/qjejZg1gV/UTp3+dH6jR594icT9XLGE5pGbTu4MznP/QHCp3ojF6VhvJ1GFtM+
         aTKw==
X-Gm-Message-State: AC+VfDxpwNjkP9KA1yxJhFAE0ACvucYwBbQIJgB7Qh8vLFj5j+GQBgS+
        h9HeveOq7d4yI2bp5GbwKp1cV+zEB0Pm/1nJ47A=
X-Google-Smtp-Source: ACHHUZ7a5bgCFlOpWk96ZeN+JJFoBpRjZPh/JTzfwA1mKlRn9YhFDlaVw2EpcKcbcvFScudkOlE7aA==
X-Received: by 2002:a05:6512:3c9:b0:4ee:dafa:cb00 with SMTP id w9-20020a05651203c900b004eedafacb00mr2919192lfp.60.1684701522242;
        Sun, 21 May 2023 13:38:42 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id a15-20020a056512020f00b004f3886a63d1sm718894lfo.298.2023.05.21.13.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 May 2023 13:38:41 -0700 (PDT)
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
        devicetree@vger.kernel.org, Johan Hovold <johan@kernel.org>
Subject: [PATCH v2 09/11] arm64: dts: qcom: sm8250: switch UFS QMP PHY to new style of bindings
Date:   Sun, 21 May 2023 23:38:32 +0300
Message-Id: <20230521203834.22566-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230521203834.22566-1-dmitry.baryshkov@linaro.org>
References: <20230521203834.22566-1-dmitry.baryshkov@linaro.org>
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

Change the UFS QMP PHY to use newer style of QMP PHY bindings (single
resource region, no per-PHY subnodes).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index a260e4a7305b..4e94fb3bd0bc 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -2166,7 +2166,7 @@ ufs_mem_hc: ufshc@1d84000 {
 				     "jedec,ufs-2.0";
 			reg = <0 0x01d84000 0 0x3000>;
 			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
-			phys = <&ufs_mem_phy_lanes>;
+			phys = <&ufs_mem_phy>;
 			phy-names = "ufsphy";
 			lanes-per-direction = <2>;
 			#reset-cells = <1>;
@@ -2210,10 +2210,8 @@ ufs_mem_hc: ufshc@1d84000 {
 
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
@@ -2221,16 +2219,10 @@ ufs_mem_phy: phy@1d87000 {
 
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

