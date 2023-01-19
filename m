Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8FFB9673549
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Jan 2023 11:16:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230120AbjASKQ5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Jan 2023 05:16:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230049AbjASKQz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Jan 2023 05:16:55 -0500
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9394460BA
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jan 2023 02:16:51 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id bk15so4313381ejb.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jan 2023 02:16:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CCiWcJgs3v2UFVbhnt0FHWa8hkSYJwHrTQ1+qu+SAeE=;
        b=ei1Np/Ve2C++EtWJmYhy9OJDbx3kjT4RHsjZwQlW399cQ9/zgOfUPzs1QAQCkqGFtm
         JRejEIdaUl+wZCN53dyM7Jfaf8tVajvO6aRoaZ9CPoaCaFspo3lml9aj5l9ml/1swATk
         XSzefJR16pn/F0ZfAHDkagIhIAw+i9lOcJqAzTgMVw0g7ItQN32s66YiRVqHSh6qZdZm
         q4xVpBR9tacSF8RZmOX1KTBbvaIqvG0zAmQOkzrKrQjPedzlp0aVruOOMDQ0DIbc5LIv
         2khlvNMtnTlEFKsu7nb+/u6vgycAznZE4of0sAwXKIWsFpKMeMhtf7ComrQRgs8ybZMs
         1JNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CCiWcJgs3v2UFVbhnt0FHWa8hkSYJwHrTQ1+qu+SAeE=;
        b=j63JzEu7L3xETkoezZaf8UVurh40gkBOf91Xuk2+Bi6FqvFzVzlblEW/q3dgPhOjN/
         O7o2BPCqNFzeBTxDOJylXNIJEdKiEXl4tgTnTWvr+ogm8fut+9m/6TUctuzOOuj7D9f8
         DOwDlroMoyxBOTfec48CQ/jnua8iOgeWPZkm2TAoMV99+nH83IOpk/UIn58VOzfAhAh7
         dATRYVsbKiV65I37GEWRPuVNRWzFf0gYCkt8Dwi0qkF1WqN+uLldRzxXasqXm6hq6UoY
         X9S0/i/8DL+UTIb2v2I3YkM21YQMAwFgthdPUrqie6KYHBNptD4K+3an3ybtsH99pLWd
         qZhQ==
X-Gm-Message-State: AFqh2kqOjLv8Uk5GVHUCzb7Cedlbod7u4cSvnMJdeemlJjS/YAY8+aZ2
        0NZyWxWFkD3MrFxJUl0jqdg3EDth0QzFyQ5i
X-Google-Smtp-Source: AMrXdXvGlBggF3OBnlkkzUFz3ravUut2adNhCG+1cPWiWMR83av0Rdob2kg6qIj/l53/pd4wUOALeQ==
X-Received: by 2002:a17:906:774f:b0:870:94e:13f9 with SMTP id o15-20020a170906774f00b00870094e13f9mr10565932ejn.0.1674123410057;
        Thu, 19 Jan 2023 02:16:50 -0800 (PST)
Received: from localhost.localdomain (abxh150.neoplus.adsl.tpnet.pl. [83.9.1.150])
        by smtp.gmail.com with ESMTPSA id x11-20020a170906b08b00b0084c62b7b7d8sm16083276ejy.187.2023.01.19.02.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 02:16:49 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org, bhupesh.sharma@linaro.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] arm64: dts: qcom: sm6115: Add mdss_ prefix to mdss nodes
Date:   Thu, 19 Jan 2023 11:16:43 +0100
Message-Id: <20230119101644.10711-1-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a mdss_ prefix to mdss nodes to keep them all near each other
when referencing them by label in device DTs.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm6115.dtsi | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index 08f93b1dc2f8..c0f9bdc25508 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -1097,7 +1097,7 @@ ports {
 					port@0 {
 						reg = <0>;
 						dpu_intf1_out: endpoint {
-							remote-endpoint = <&dsi0_in>;
+							remote-endpoint = <&mdss_dsi0_in>;
 						};
 					};
 				};
@@ -1132,7 +1132,7 @@ opp-384000000 {
 				};
 			};
 
-			dsi0: dsi@5e94000 {
+			mdss_dsi0: dsi@5e94000 {
 				compatible = "qcom,dsi-ctrl-6g-qcm2290";
 				reg = <0x05e94000 0x400>;
 				reg-names = "dsi_ctrl";
@@ -1155,11 +1155,11 @@ dsi0: dsi@5e94000 {
 
 				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>,
 						  <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
-				assigned-clock-parents = <&dsi0_phy 0>, <&dsi0_phy 1>;
+				assigned-clock-parents = <&mdss_dsi0_phy 0>, <&mdss_dsi0_phy 1>;
 
 				operating-points-v2 = <&dsi_opp_table>;
 				power-domains = <&rpmpd SM6115_VDDCX>;
-				phys = <&dsi0_phy>;
+				phys = <&mdss_dsi0_phy>;
 
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -1172,14 +1172,14 @@ ports {
 
 					port@0 {
 						reg = <0>;
-						dsi0_in: endpoint {
+						mdss_dsi0_in: endpoint {
 							remote-endpoint = <&dpu_intf1_out>;
 						};
 					};
 
 					port@1 {
 						reg = <1>;
-						dsi0_out: endpoint {
+						mdss_dsi0_out: endpoint {
 						};
 					};
 				};
@@ -1204,7 +1204,7 @@ opp-187500000 {
 				};
 			};
 
-			dsi0_phy: phy@5e94400 {
+			mdss_dsi0_phy: phy@5e94400 {
 				compatible = "qcom,dsi-phy-14nm-2290";
 				reg = <0x05e94400 0x100>,
 				      <0x05e94500 0x300>,
@@ -1229,8 +1229,8 @@ dispcc: clock-controller@5f00000 {
 			reg = <0x05f00000 0x20000>;
 			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
 				 <&sleep_clk>,
-				 <&dsi0_phy 0>,
-				 <&dsi0_phy 1>,
+				 <&mdss_dsi0_phy 0>,
+				 <&mdss_dsi0_phy 1>,
 				 <&gcc GCC_DISP_GPLL0_DIV_CLK_SRC>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;
-- 
2.39.1

