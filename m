Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 447F470B04D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 May 2023 22:38:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230452AbjEUUin (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 21 May 2023 16:38:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229837AbjEUUil (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 21 May 2023 16:38:41 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33835D2
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 May 2023 13:38:40 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-4f3a99b9177so3914193e87.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 May 2023 13:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684701518; x=1687293518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RcRQZHeKYyII6sReSP+kjuVN5EwqkM/8SDe2wNc8djc=;
        b=oLUYY72DuoBSqziokugey866gW1sNGyX/3GVnISI525Of9+ITBK1Oz0j4LaETCzSTC
         tsfiMfqtecVfIqNqSrXG1TZMXCb7X7waMoUzuEPQ/FQ8jrkMAWnfUXyijOSXyD+2h4lb
         hEeFvBh6lpX5rpcJzM8wGYiIk3Zl+tsbPf4Tgod2szoC011rvUhZRebzHKN766KSCSPr
         WXTzmKlXhO5otAQSbbiS06ZjrQ1fZnQfeHtwi25m6VgZKAvkVpx4/fJVc7rAKE1kC5P8
         aDe5fPHIG6aNwsgPmNhe4vtQ7xknxyWIw/t2sdnG9MMIme+UTWGrcwxm41d/bMmsy8wS
         DP0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684701518; x=1687293518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RcRQZHeKYyII6sReSP+kjuVN5EwqkM/8SDe2wNc8djc=;
        b=S9awS8cnWCk0/p2Kloz/6j6G6oyXNtflKUBtSpPTOPDnmDeX4xvYha7jaBzVGeNqUT
         x9nnASeQMi6ooxNAq9Tvr0IhuwG1VIgjzoaqnrRD5p/bYca6CqxPJF896ynu3U1zFyYn
         iZL1g0bo8N1jOor/XBV/wFG2lwb9o3sWh1i0xPfPzBXvL6Pu3m521yVgtgPHPRYA9f/R
         edxy5GVQvlUJuj2KO6ZdPDF4F3oer/BsbDFOd8bqsCdM0dI9q8gZ6C/092RQvM+hnfPl
         Qxw4+Z1qLndieuUuw9yLCSotLBSh0jGKHKdUZjiPsfB095X9Pu1MrORD7ZGQHJ5n/oBn
         WMEg==
X-Gm-Message-State: AC+VfDyR4HOFAz6+F5PrsM1dTK2FwlaSFbr27NWJswD3+linuPrQMmAj
        2cL3idDoFNBKvSLZV6u+Qyn7U3bUlA1bw7TDRvA=
X-Google-Smtp-Source: ACHHUZ7IbTp5ckmapM1PL/dQZFNPqHPkCOUUS/a+grGe7wnCs+zs/td86bI5N/5cVO/yfcttwPYQMg==
X-Received: by 2002:ac2:593c:0:b0:4f3:b588:48d0 with SMTP id v28-20020ac2593c000000b004f3b58848d0mr1587937lfi.14.1684701518536;
        Sun, 21 May 2023 13:38:38 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id a15-20020a056512020f00b004f3886a63d1sm718894lfo.298.2023.05.21.13.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 May 2023 13:38:38 -0700 (PDT)
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
Subject: [PATCH v2 04/11] arm64: dts: qcom: msm8998: switch UFS QMP PHY to new style of bindings
Date:   Sun, 21 May 2023 23:38:27 +0300
Message-Id: <20230521203834.22566-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230521203834.22566-1-dmitry.baryshkov@linaro.org>
References: <20230521203834.22566-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
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
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index b150437a8355..848fbd2cb3f8 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -980,7 +980,7 @@ ufshc: ufshc@1da4000 {
 			compatible = "qcom,msm8998-ufshc", "qcom,ufshc", "jedec,ufs-2.0";
 			reg = <0x01da4000 0x2500>;
 			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
-			phys = <&ufsphy_lanes>;
+			phys = <&ufsphy>;
 			phy-names = "ufsphy";
 			lanes-per-direction = <2>;
 			power-domains = <&gcc UFS_GDSC>;
@@ -1021,11 +1021,8 @@ ufshc: ufshc@1da4000 {
 
 		ufsphy: phy@1da7000 {
 			compatible = "qcom,msm8998-qmp-ufs-phy";
-			reg = <0x01da7000 0x18c>;
-			#address-cells = <1>;
-			#size-cells = <1>;
+			reg = <0x01da7000 0x1000>;
 			status = "disabled";
-			ranges;
 
 			clock-names =
 				"ref",
@@ -1037,14 +1034,7 @@ ufsphy: phy@1da7000 {
 			reset-names = "ufsphy";
 			resets = <&ufshc 0>;
 
-			ufsphy_lanes: phy@1da7400 {
-				reg = <0x01da7400 0x128>,
-				      <0x01da7600 0x1fc>,
-				      <0x01da7c00 0x1dc>,
-				      <0x01da7800 0x128>,
-				      <0x01da7a00 0x1fc>;
-				#phy-cells = <0>;
-			};
+			#phy-cells = <0>;
 		};
 
 		tcsr_mutex: hwlock@1f40000 {
-- 
2.39.2

