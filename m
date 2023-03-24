Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2216F6C75A5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Mar 2023 03:25:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230098AbjCXCZi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Mar 2023 22:25:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231300AbjCXCZh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Mar 2023 22:25:37 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BF592A6FD
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 19:25:34 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id t11so428373lfr.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 19:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679624733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wA9AQ+nWHNjK6KtfMTvCgN8/qi0qBN7EegezNZNg5hs=;
        b=hID1HrRg6E899TA9x0zkyKEDqR0WwU3JyZ4G+MgmZIZh676SF8V2fzxP3gOBh6ErjX
         BJHG0csV58CZOvnG8E4gAN8ojABAjMis51EYdnS/hMISnLdA+C5aUaB8tnbAWVbNqPUV
         xfOcpdq1iwQqj2L5Yw8/ssz+Ta2GCQjGXwxBv5TP6gH3EAMt6t9Qn16zGPqBD4/eXi0i
         JV0iUt6RcbOtJFCvAvIdqlS357lCh7nno8sQXwHJGZJ/64WLPwh2CjVOSczql0NdkzQS
         U0jswYv0z691vJWzdzolOzKqaoCsXVcZJ5Ftx69OZH3vy4dwGTay99xJGP7hcFCS5p1E
         Cpqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679624733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wA9AQ+nWHNjK6KtfMTvCgN8/qi0qBN7EegezNZNg5hs=;
        b=UAutY/4nGfbSH2UUVhMR+oE2GDy6FYKf6qYUEw5BzGmqj3BLnNwdjs3EFLXzgFVHOX
         GMEnuP1Hf1eHcm58TwTx9fcT3oKkY9kz5rGgaJcvjgFsZUkZaTfuEEW5clDhVT3dAxc9
         WrLDiKzC0ABiR/DTD1Krcgg8yp1Mcc9rLPk5n9b7GJoiQnebOi4ChkU+yGM45Z/14aw6
         k1NDeeCzXXhVsBTf6LXIAt1ay/ad4xZMHfSOJHHqfuFVnZYvjOA3PFn6ai6SNsuHqaSa
         HiDnEMReyhcTPmVDeod8UJSAeBSZOxTtpnakb40Q+hZ4I+6eg7dbfVr2l1CzsxMt/331
         oCcg==
X-Gm-Message-State: AAQBX9d6rTT2jISxa5ELgX9BVHYFSRUzyHXKVZ4djmo/pgX+nBIx2rV+
        be3UFOlMvUUNPc/VW3bBZZiTzg==
X-Google-Smtp-Source: AKy350bnW+OIDOutoiEi+uQeFC4+2ygLb0gojeMbeOKd78pZgtFgXt6ErGXzwf2TH8zz0DSrSpZ4mw==
X-Received: by 2002:ac2:50c3:0:b0:4b4:8f01:f8b1 with SMTP id h3-20020ac250c3000000b004b48f01f8b1mr208641lfm.31.1679624733810;
        Thu, 23 Mar 2023 19:25:33 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id x4-20020a19f604000000b004db3aa3c542sm3162628lfe.47.2023.03.23.19.25.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 19:25:33 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 17/41] arm64: dts: qcom: sm8350: switch USB QMP PHY to new style of bindings
Date:   Fri, 24 Mar 2023 05:24:50 +0300
Message-Id: <20230324022514.1800382-18-dmitry.baryshkov@linaro.org>
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

Change the USB QMP PHY to use newer style of QMP PHY bindings (single
resource region, no per-PHY subnodes).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 32 +++++++++++-----------------
 1 file changed, 13 insertions(+), 19 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 0dc50170db7b..da764ca42129 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -2155,34 +2155,28 @@ usb_1_qmpphy: phy@88e9000 {
 			status = "disabled";
 		};
 
-		usb_2_qmpphy: phy-wrapper@88eb000 {
+		usb_2_qmpphy: phy@88eb000 {
 			compatible = "qcom,sm8350-qmp-usb3-uni-phy";
-			reg = <0 0x088eb000 0 0x200>;
+			reg = <0 0x088eb000 0 0x2000>;
 			status = "disabled";
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges;
 
 			clocks = <&gcc GCC_USB3_SEC_PHY_AUX_CLK>,
 				 <&rpmhcc RPMH_CXO_CLK>,
 				 <&gcc GCC_USB3_SEC_CLKREF_EN>,
-				 <&gcc GCC_USB3_SEC_PHY_COM_AUX_CLK>;
-			clock-names = "aux", "ref_clk_src", "ref", "com_aux";
+				 <&gcc GCC_USB3_SEC_PHY_COM_AUX_CLK>,
+				 <&gcc GCC_USB3_SEC_PHY_PIPE_CLK>;
+			clock-names = "aux",
+				      "ref_clk_src",
+				      "ref",
+				      "com_aux",
+				      "pipe";
+			clock-output-names = "usb3_uni_phy_pipe_clk_src";
+			#clock-cells = <0>;
+			#phy-cells = <0>;
 
 			resets = <&gcc GCC_USB3PHY_PHY_SEC_BCR>,
 				 <&gcc GCC_USB3_PHY_SEC_BCR>;
 			reset-names = "phy", "common";
-
-			usb_2_ssphy: phy@88ebe00 {
-				reg = <0 0x088ebe00 0 0x200>,
-				      <0 0x088ec000 0 0x200>,
-				      <0 0x088eb200 0 0x1100>;
-				#phy-cells = <0>;
-				#clock-cells = <0>;
-				clocks = <&gcc GCC_USB3_SEC_PHY_PIPE_CLK>;
-				clock-names = "pipe0";
-				clock-output-names = "usb3_uni_phy_pipe_clk_src";
-			};
 		};
 
 		dc_noc: interconnect@90c0000 {
@@ -2327,7 +2321,7 @@ usb_2_dwc3: usb@a800000 {
 				iommus = <&apps_smmu 0x20 0x0>;
 				snps,dis_u2_susphy_quirk;
 				snps,dis_enblslpm_quirk;
-				phys = <&usb_2_hsphy>, <&usb_2_ssphy>;
+				phys = <&usb_2_hsphy>, <&usb_2_qmpphy>;
 				phy-names = "usb2-phy", "usb3-phy";
 			};
 		};
-- 
2.30.2

