Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDC3331BF51
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Feb 2021 17:31:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231289AbhBOQ3w (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 Feb 2021 11:29:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231777AbhBOQ1p (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 Feb 2021 11:27:45 -0500
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com [IPv6:2607:f8b0:4864:20::830])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFA18C061794
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Feb 2021 08:27:04 -0800 (PST)
Received: by mail-qt1-x830.google.com with SMTP id c1so5200810qtc.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Feb 2021 08:27:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=L2b11X7RX6S9uuGP/RiVj8dxHh//FmXWH5wSG8YTYW4=;
        b=MuJgvEB0ZpIC9h67r8fVYYq/jQlxeFLFcjO30PFkl06L2uTt1L38nnXaPOqtyRhYWe
         6fzUPoQoa8NPKaeP8mT8JD5TlGePOUN/ExN1FZk5wyUhu9LzquVFp9A2WHo+KOYvmthq
         AAWe0z1jcpEjQ78MibVQdGpNhxbIPbb5GONQbC+aJaplQtcl2AKJho3Ea5SWwnomLD59
         6by+LgGx0NleG0hdxEGFy1d7GU3+yRVt6sJuI3hdzj1Sw8liz6z8nGk0Qj89r208yduS
         zrMkYEbOM1vQlCtCKP/PBK7exMpWgoyLs8/06RrXSc+cO7WYgePAym00dRbwEXLuPR9i
         ZlmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=L2b11X7RX6S9uuGP/RiVj8dxHh//FmXWH5wSG8YTYW4=;
        b=pyFbGiAfGXx4StmBR8gGZZr7h50llzJvYqxA9KrSrf6jzIOPan+p2sdVp+SBfk7GB/
         HkCff3N0xmQyl+H1+oHjem6R9XYtttrIj9n+5Pnb1xCB6XhWHnRw/GNEjpQIGZ3aDU2c
         4pJe76Qmp45W1vbxfPYw1P7rtx+S2UPG23ilHdf6THQSstPT8ykLLDYI6yAs/bIQ3RTm
         cJh6uiLldv5ykZx7jlrFnA7Gtd4GswlkLf3fQGXr8lFW70Jrr1/fmWuiTujKdv1lk30g
         HidfnwRlQ/20//wMx+InG/wq+vk3FxBEETZ/ow5pThaaMpPZ1JqKMVzUBCBlkg7oOAz8
         xCVg==
X-Gm-Message-State: AOAM530ZPYAfrjYaY5/WEPtqoqYCaQC16ZR7AEAFd9yfeR6TcdoAVZdU
        aO4LQxKzwaCRf4rQ9hkua7BL7/3M0V5LfRpC
X-Google-Smtp-Source: ABdhPJyyAN5o6cHtOzDq559SJRuK26oNIP7uZjHkmGmB3ZKRW92mYDz7qjvzMkJdv/1CRxH+qebACg==
X-Received: by 2002:ac8:3693:: with SMTP id a19mr8916544qtc.54.1613406423689;
        Mon, 15 Feb 2021 08:27:03 -0800 (PST)
Received: from localhost.localdomain (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
        by smtp.gmail.com with ESMTPSA id u7sm10928811qta.75.2021.02.15.08.27.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Feb 2021 08:27:03 -0800 (PST)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 2/2] arm64: dts: qcom: sm8250: fix display nodes
Date:   Mon, 15 Feb 2021 11:26:05 -0500
Message-Id: <20210215162607.21360-3-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20210215162607.21360-1-jonathan@marek.ca>
References: <20210215162607.21360-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Apply these fixes to the newly added sm8250 display ndoes
 - Use sm8250 compatibles instead of sdm845 compatibles
 - Remove "notused" interconnect (which apparently was blindly copied from
   my old patches)
 - Use dispcc node example from dt-bindings, removing clocks which aren't
   documented or used by the driver and fixing the region size.

Fixes: 7c1dffd471b1 ("arm64: dts: qcom: sm8250.dtsi: add display system nodes")
Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 31 +++++++---------------------
 1 file changed, 8 insertions(+), 23 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 947e1accae3a..693ac533f9b6 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -2323,14 +2323,13 @@ usb_2_dwc3: dwc3@a800000 {
 		};
 
 		mdss: mdss@ae00000 {
-			compatible = "qcom,sdm845-mdss";
+			compatible = "qcom,sm8250-mdss";
 			reg = <0 0x0ae00000 0 0x1000>;
 			reg-names = "mdss";
 
-			interconnects = <&gem_noc MASTER_AMPSS_M0 &config_noc SLAVE_DISPLAY_CFG>,
-					<&mmss_noc MASTER_MDP_PORT0 &mc_virt SLAVE_EBI_CH0>,
+			interconnects = <&mmss_noc MASTER_MDP_PORT0 &mc_virt SLAVE_EBI_CH0>,
 					<&mmss_noc MASTER_MDP_PORT1 &mc_virt SLAVE_EBI_CH0>;
-			interconnect-names = "notused", "mdp0-mem", "mdp1-mem";
+			interconnect-names = "mdp0-mem", "mdp1-mem";
 
 			power-domains = <&dispcc MDSS_GDSC>;
 
@@ -2356,7 +2355,7 @@ mdss: mdss@ae00000 {
 			ranges;
 
 			mdss_mdp: mdp@ae01000 {
-				compatible = "qcom,sdm845-dpu";
+				compatible = "qcom,sm8250-dpu";
 				reg = <0 0x0ae01000 0 0x8f000>,
 				      <0 0x0aeb0000 0 0x2008>;
 				reg-names = "mdp", "vbif";
@@ -2580,7 +2579,7 @@ opp-358000000 {
 
 		dispcc: clock-controller@af00000 {
 			compatible = "qcom,sm8250-dispcc";
-			reg = <0 0x0af00000 0 0x20000>;
+			reg = <0 0x0af00000 0 0x10000>;
 			mmcx-supply = <&mmcx_reg>;
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
 				 <&dsi0_phy 0>,
@@ -2588,28 +2587,14 @@ dispcc: clock-controller@af00000 {
 				 <&dsi1_phy 0>,
 				 <&dsi1_phy 1>,
 				 <0>,
-				 <0>,
-				 <0>,
-				 <0>,
-				 <0>,
-				 <0>,
-				 <0>,
-				 <0>,
-				 <&sleep_clk>;
+				 <0>;
 			clock-names = "bi_tcxo",
 				      "dsi0_phy_pll_out_byteclk",
 				      "dsi0_phy_pll_out_dsiclk",
 				      "dsi1_phy_pll_out_byteclk",
 				      "dsi1_phy_pll_out_dsiclk",
-				      "dp_link_clk_divsel_ten",
-				      "dp_vco_divided_clk_src_mux",
-				      "dptx1_phy_pll_link_clk",
-				      "dptx1_phy_pll_vco_div_clk",
-				      "dptx2_phy_pll_link_clk",
-				      "dptx2_phy_pll_vco_div_clk",
-				      "edp_phy_pll_link_clk",
-				      "edp_phy_pll_vco_div_clk",
-				      "sleep_clk";
+				      "dp_phy_pll_link_clk",
+				      "dp_phy_pll_vco_div_clk";
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
-- 
2.26.1

