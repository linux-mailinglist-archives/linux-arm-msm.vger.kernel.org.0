Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 54BF970B052
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 May 2023 22:38:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231177AbjEUUip (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 21 May 2023 16:38:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229837AbjEUUin (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 21 May 2023 16:38:43 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 277D7EA
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 May 2023 13:38:41 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-4f3bb395e69so1149468e87.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 May 2023 13:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684701520; x=1687293520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tvQv73DcEHQsVe/JKPU5MHMTOCvtg71K1/S9y9H33HI=;
        b=B4crKEIqd8MJzJpXDxa1RdHFRIUO+iHDURLVdTC65oQGKgc23PqAjkXEy3ZAJpp+5U
         hAHY5orpDDbVAaCO4FCe6y85jPHPqOEcH9Bs5GuHvIpFxoDTQj4tLSBk0OtvBKx88BCI
         TR1d6SRP4RK3InsB0v07TACJ8svTxHDbkXD35cwcMvXOv9nqDwhDX9QXRl8PirA/NXQM
         f+wKrRtMiDZ4wU+VwwMRXcrJJ6gyYr1nW68+HJpQ2yv2iMps6T112Snco43qoPr+4HXh
         9IjzDhXVB7AhIXjkx+yYEP8OGoqSiEj0aDFIRv4/2tqM/gLwVQ9J5wl3j++oxKJqcvb6
         WdKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684701520; x=1687293520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tvQv73DcEHQsVe/JKPU5MHMTOCvtg71K1/S9y9H33HI=;
        b=WL2TYyWgJJNyvbUpe0GDStC4F70naq6QRZiLH0M87//mPj8975PWWFsR2zOm+YLFn+
         ED9Z+Cz1w+vfflTFl1IEXugCMxTRy8xUEVWkFAI4EgVOgl3DMwGwgGHfKzM1YqrY2z9q
         /fY3BwQsV+7f9yS+j313BzvKCbYOZvq26VhS/clXlpXq0On2CHCQLDeEiwPbh3SC2/MC
         xCdub6A+ilbGkFv3KFZjT2Ai7zGz06Vl2BBH1knd6u+fyJp3PLbdjmIvcvC8S6kN5o7K
         xZVWs60OLyuuCvrJ5u/gvQh2rs0ULle43iL5U5GPNQSAEK2ve8asPxnNt3ykB810F85Y
         PdJw==
X-Gm-Message-State: AC+VfDwStX5X0YAUIMRU+7/XlPjHIXF0Tiv52lMREtoJLp5iRk50N7p7
        fJl0ZNRl5K9Ifs2v44YwT+g+YQ==
X-Google-Smtp-Source: ACHHUZ71rPdWZsrjpDgzdEiF9Q9akw+D4F3lQ/tnaRQECKLy/Get1xRaf4SZ51w1WKu1MLX1VCZ4YA==
X-Received: by 2002:ac2:5603:0:b0:4f4:4cd4:6df4 with SMTP id v3-20020ac25603000000b004f44cd46df4mr535311lfd.25.1684701520702;
        Sun, 21 May 2023 13:38:40 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id a15-20020a056512020f00b004f3886a63d1sm718894lfo.298.2023.05.21.13.38.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 May 2023 13:38:40 -0700 (PDT)
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
Subject: [PATCH v2 07/11] arm64: dts: qcom: sm6350: switch UFS QMP PHY to new style of bindings
Date:   Sun, 21 May 2023 23:38:30 +0300
Message-Id: <20230521203834.22566-8-dmitry.baryshkov@linaro.org>
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

