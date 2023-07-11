Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C40C74EDB7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jul 2023 14:09:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230248AbjGKMJy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Jul 2023 08:09:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229811AbjGKMJo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Jul 2023 08:09:44 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E05D19A8
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jul 2023 05:09:26 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2b69923a715so88593071fa.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jul 2023 05:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689077365; x=1691669365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w2uwj1bDNNvjwVF1sPPFd+G4qQu0YqRBY17DnaA0U10=;
        b=WZhGgoX9jtQwPJ9AKb1ozh9pXthX5HzfE7kPZXHkmnKd6rWS6Y2JrO0ZvBIDQM4zhr
         GZKHMunhuRK7oe3fjE7jB6zUvwvdXGN1pfeTgl2ybOOyFtojSBg1AaauKGg3rOvTON+O
         kfqco5eKI1dO3BgmrTqEDWxWROBUTH5LLkYxspsUCcxIw994ckcHpN3MDEUKOSacps0b
         krN4PfLOVQnRPJyqD/s8NbtL/PDeuj8jv9dQnH0GJUDTLQXKjwgaNTnnapff9ONKjUbv
         /pIYrXrO3wA5BvehQlwVe1fQ5QcB326SZKlTLBMerbcUm2N47z8OsGEehdMlZtc2955+
         vUlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689077365; x=1691669365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w2uwj1bDNNvjwVF1sPPFd+G4qQu0YqRBY17DnaA0U10=;
        b=c5myfpyjeiR9Vmahfue3rBrnL3+K8Yk77T41i0eDKOEpu75xnAF58mJ3Lf0r1TtYDB
         3xE0SQUxJODVTyGGRbcY4Tq/8S3TBEu12TILslk1RyNxK8NTVk8sMsWKpOYoIt6n0EpT
         x5C4DwshSs41Dh8A0gNnAKmP0Pqzm+iNL05erOWwpNflbPZfpfBMPKIMBBtZ/XAJz8pl
         zjRYlvmiBw1y36aqWUtIt049Mg+jAnTovjLe47eh3VB5HUkmdc22ERfE76xnFJdL7YKo
         2jS5EdFE3d4Gnzq+O6ltRT2NhxnKdgoxpIq5N/w0xWmrTIHp3v5VGatbDRDWkGYi4Xmr
         JcjQ==
X-Gm-Message-State: ABy/qLZXrFcSelpwjeVmDosC3O9p9G3d/93UpSZX2/e8C2L98yz2Ey+K
        7T9l8D9GYF6qfJrUuKp8z+vNtg==
X-Google-Smtp-Source: APBJJlE5IJlyE8QhwkDDqboYFcDJDnrTlgreC1HrQFzhZiylrgABsPgEDgaV/M6shmfvw4g42gs2QA==
X-Received: by 2002:ac2:5b1e:0:b0:4fb:8bab:48b6 with SMTP id v30-20020ac25b1e000000b004fb8bab48b6mr12540488lfn.52.1689077364959;
        Tue, 11 Jul 2023 05:09:24 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id h22-20020ac25976000000b004fbbd818568sm291447lfp.137.2023.07.11.05.09.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 05:09:24 -0700 (PDT)
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
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v4 10/10] arm64: dts: qcom: sm8250: switch USB+DP QMP PHY to new style of bindings
Date:   Tue, 11 Jul 2023 15:09:16 +0300
Message-Id: <20230711120916.4165894-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230711120916.4165894-1-dmitry.baryshkov@linaro.org>
References: <20230711120916.4165894-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Change the USB QMP PHY to use newer style of QMP PHY bindings (single
resource region, no per-PHY subnodes).

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 49 ++++++++--------------------
 1 file changed, 14 insertions(+), 35 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index e03007e23e91..d522dea65ba7 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -15,6 +15,7 @@
 #include <dt-bindings/interconnect/qcom,osm-l3.h>
 #include <dt-bindings/interconnect/qcom,sm8250.h>
 #include <dt-bindings/mailbox/qcom-ipcc.h>
+#include <dt-bindings/phy/phy-qcom-qmp.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/soc/qcom,apr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
@@ -3575,48 +3576,26 @@ usb_2_hsphy: phy@88e4000 {
 			resets = <&gcc GCC_QUSB2PHY_SEC_BCR>;
 		};
 
-		usb_1_qmpphy: phy@88e9000 {
+		usb_1_qmpphy: phy@88e8000 {
 			compatible = "qcom,sm8250-qmp-usb3-dp-phy";
-			reg = <0 0x088e9000 0 0x200>,
-			      <0 0x088e8000 0 0x40>,
-			      <0 0x088ea000 0 0x200>;
+			reg = <0 0x088e8000 0 0x3000>;
 			status = "disabled";
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges;
 
 			clocks = <&gcc GCC_USB3_PRIM_PHY_AUX_CLK>,
 				 <&rpmhcc RPMH_CXO_CLK>,
-				 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>;
-			clock-names = "aux", "ref_clk_src", "com_aux";
+				 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>,
+				 <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
+			clock-names = "aux",
+				      "ref",
+				      "com_aux",
+				      "usb3_pipe";
 
 			resets = <&gcc GCC_USB3_DP_PHY_PRIM_BCR>,
 				 <&gcc GCC_USB3_PHY_PRIM_BCR>;
 			reset-names = "phy", "common";
 
-			usb_1_ssphy: usb3-phy@88e9200 {
-				reg = <0 0x088e9200 0 0x200>,
-				      <0 0x088e9400 0 0x200>,
-				      <0 0x088e9c00 0 0x400>,
-				      <0 0x088e9600 0 0x200>,
-				      <0 0x088e9800 0 0x200>,
-				      <0 0x088e9a00 0 0x100>;
-				#clock-cells = <0>;
-				#phy-cells = <0>;
-				clocks = <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
-				clock-names = "pipe0";
-				clock-output-names = "usb3_phy_pipe_clk_src";
-			};
-
-			dp_phy: dp-phy@88ea200 {
-				reg = <0 0x088ea200 0 0x200>,
-				      <0 0x088ea400 0 0x200>,
-				      <0 0x088eaa00 0 0x200>,
-				      <0 0x088ea600 0 0x200>,
-				      <0 0x088ea800 0 0x200>;
-				#phy-cells = <0>;
-				#clock-cells = <1>;
-			};
+			#clock-cells = <1>;
+			#phy-cells = <1>;
 		};
 
 		usb_2_qmpphy: phy@88eb000 {
@@ -3765,7 +3744,7 @@ usb_1_dwc3: usb@a600000 {
 				iommus = <&apps_smmu 0x0 0x0>;
 				snps,dis_u2_susphy_quirk;
 				snps,dis_enblslpm_quirk;
-				phys = <&usb_1_hsphy>, <&usb_1_ssphy>;
+				phys = <&usb_1_hsphy>, <&usb_1_qmpphy QMP_USB43DP_USB3_PHY>;
 				phy-names = "usb2-phy", "usb3-phy";
 			};
 		};
@@ -4459,8 +4438,8 @@ dispcc: clock-controller@af00000 {
 				 <&mdss_dsi0_phy 1>,
 				 <&mdss_dsi1_phy 0>,
 				 <&mdss_dsi1_phy 1>,
-				 <&dp_phy 0>,
-				 <&dp_phy 1>;
+				 <&usb_1_qmpphy QMP_USB43DP_DP_LINK_CLK>,
+				 <&usb_1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
 			clock-names = "bi_tcxo",
 				      "dsi0_phy_pll_out_byteclk",
 				      "dsi0_phy_pll_out_dsiclk",
-- 
2.39.2

