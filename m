Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 610EB70B05C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 May 2023 22:38:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231178AbjEUUiu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 21 May 2023 16:38:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231189AbjEUUiq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 21 May 2023 16:38:46 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2739E3
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 May 2023 13:38:44 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-4f3a9ad31dbso3813834e87.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 May 2023 13:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684701523; x=1687293523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/UZaHZEJviemE81XyTdp/8utctQbN84VrZL5H97wJ0Y=;
        b=x5SaxrdZ8QS4LHChbsiW5FpNhdo+M4eY2zabzjP9EpZ9Zcf5Tj3cYNPbWRJRxYAHpG
         O1JxJgwXp6Iea5a8/jF+tMrzao0NlgWeuazqGWR2q9tIVlCY/myrMfXa5153Ub13znNJ
         356l7r8m6Ml9Xoco0X7ngTeHrSe6FgaQ7UpNPkZOolN9Gk8SD3zl2iA/viW/+5EUMdjR
         3JGfethlq7yjvo0LWaenltg2Vj6uprheFgrDNQ2KVbF59lY1BbcHOQTLeENOd3V0lN2p
         7TxCgGOpljvqmKrkKUflVgEkQXXnK7N60WhiCugw0gH9/3T35b+ALS6jkDRjKRQ48Utd
         2Kag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684701523; x=1687293523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/UZaHZEJviemE81XyTdp/8utctQbN84VrZL5H97wJ0Y=;
        b=RjZe0uWmZuTg+I6hxPfLfjOVfuF2S17sgvVGhJajSRg54TwavCLJGZa+cdStLTPE4m
         0F4bj8mEaJbtszPktwrkbAm9RUOys/xNE63KhguwkDI/8ibdWBf+zuWz2MJH1ZjAOOdN
         PFocH/REWVb3pMP1HuRKHeoXol2Y5QcBsJmCh4sLYhDJzZFwkivq5WBO4MNfmpcNurJo
         xErE89CieZIELnCzHyCOjKLWJC9c7jQyYpIowORQ6KR/2cshTWi4XfxWeX7N6IDmQb5s
         /1ry5zd2LqZd/vN46zX/3kDlUK/OKymC4jihltV78odHBnk8cKJCbV8NzEN1jezp33F1
         9XhA==
X-Gm-Message-State: AC+VfDxY1quyy+0cQRkyMVkTdbq1uPDM+TaLFRuyFN3cag77aJEv7ZVM
        /ROyzJ7Ce0pr/Bd/+WINRQ50mg==
X-Google-Smtp-Source: ACHHUZ6DvZ1icO55sjIe+oBUTsVCOGiA5PicZ0WwFJRwF2wPjABNddnCOBGHg9s9Lv+FF+wJsMuCmw==
X-Received: by 2002:ac2:4430:0:b0:4f3:a99c:fbbe with SMTP id w16-20020ac24430000000b004f3a99cfbbemr2780753lfl.14.1684701522982;
        Sun, 21 May 2023 13:38:42 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id a15-20020a056512020f00b004f3886a63d1sm718894lfo.298.2023.05.21.13.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 May 2023 13:38:42 -0700 (PDT)
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
Subject: [PATCH v2 10/11] arm64: dts: qcom: sm8350: switch UFS QMP PHY to new style of bindings
Date:   Sun, 21 May 2023 23:38:33 +0300
Message-Id: <20230521203834.22566-11-dmitry.baryshkov@linaro.org>
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
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 28 ++++++++++------------------
 1 file changed, 10 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index ebcb481571c2..6173521ff544 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -656,9 +656,9 @@ gcc: clock-controller@100000 {
 				 <0>,
 				 <0>,
 				 <0>,
-				 <&ufs_mem_phy_lanes 0>,
-				 <&ufs_mem_phy_lanes 1>,
-				 <&ufs_mem_phy_lanes 2>,
+				 <&ufs_mem_phy 0>,
+				 <&ufs_mem_phy 1>,
+				 <&ufs_mem_phy 2>,
 				 <&usb_1_qmpphy QMP_USB43DP_USB3_PIPE_CLK>,
 				 <0>;
 		};
@@ -1658,7 +1658,7 @@ ufs_mem_hc: ufshc@1d84000 {
 				     "jedec,ufs-2.0";
 			reg = <0 0x01d84000 0 0x3000>;
 			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
-			phys = <&ufs_mem_phy_lanes>;
+			phys = <&ufs_mem_phy>;
 			phy-names = "ufsphy";
 			lanes-per-direction = <2>;
 			#reset-cells = <1>;
@@ -1702,10 +1702,8 @@ ufs_mem_hc: ufshc@1d84000 {
 
 		ufs_mem_phy: phy@1d87000 {
 			compatible = "qcom,sm8350-qmp-ufs-phy";
-			reg = <0 0x01d87000 0 0x1c4>;
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges;
+			reg = <0 0x01d87000 0 0x1000>;
+
 			clock-names = "ref",
 				      "ref_aux";
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
@@ -1713,17 +1711,11 @@ ufs_mem_phy: phy@1d87000 {
 
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
 
 		ipa: ipa@1e40000 {
-- 
2.39.2

