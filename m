Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C47177FA11
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Aug 2023 17:00:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352542AbjHQPAQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Aug 2023 11:00:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352666AbjHQPAN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Aug 2023 11:00:13 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4A1530F1
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Aug 2023 07:59:51 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-991c786369cso1054988566b.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Aug 2023 07:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692284383; x=1692889183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=etL/n3iIerD/3favPB10Vxz8tYmFCIfiw+o1s0E1jRw=;
        b=gLqQwVag4j6WLy7UPvyheHVMlmXCtSkD+1PLKE9qtrB5nVJrSAqp+0kz+xv+VDbJi1
         jKE/hGupX5oK4S0uNwwIUVEfXayuaSdhkC3FIEW8MpTvEYrScK3KVJr6aAGymjtbqLdt
         TVSg1nGsoBAtgNzBzhr4n0HZgyUr560hTiqxSMVmm6L1NEkMtaw3UmPrgiVudGyz8gzp
         UqE7ZbDlJAg82aMe15RHCiqXgHZ8aUlVUELaDmIYlqwKVTK9cg2C6cTBE9oygGXfWDJn
         HRk82p8zUrYzZvbIgSioUmpitrH4acCg5KX1QaMFfEJvYLWIhhemQSmcNuWIQvr/mLIV
         RbPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692284383; x=1692889183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=etL/n3iIerD/3favPB10Vxz8tYmFCIfiw+o1s0E1jRw=;
        b=TGQGjBhjyCm8RWyeCxTsiRoHArP3rKRHsMuYTewvqJr3olXc04Wihm4mannwX8nD5q
         v/k7+It84fEZPgoTUH0Hgf4Kw+Ce3lxdMbIYKeS8llFph1RPLQOcqmeKwhPhtBusse6Y
         XuBi0raozmjqOty16UIm1iFoLzROyN8/eEflu0f2TEdPeAbvPl1sPKtQyWZm0SEPv4TL
         oo8P7OawnDaMysJurfea7XCJCDK+xON2gbfMLOB4a176Y56HEHbI1DzexHxOc0Xer7RM
         UuS9UlLcdYZqhoIAbls7m1gueYbUfkOtF8uTNJ+2DsKcvjumn3VolyuvUyn/WuC7DT/c
         z9mA==
X-Gm-Message-State: AOJu0Yz95j/4AR9NE90T8sR8mlH/0s2gErhrSB4a66EFs97DFRPsvHig
        7SttydUTR0LnKejwoxLOdjsEDA==
X-Google-Smtp-Source: AGHT+IHeXDSrhPybt02SUhe5x+g+/A5UCwhRAqPoHSTmVLbvzzDNwTMyaQ0YbS3gHY/Rq9LTt3h+EQ==
X-Received: by 2002:a17:906:7fc8:b0:99b:ca24:ce33 with SMTP id r8-20020a1709067fc800b0099bca24ce33mr3638518ejs.31.1692284383645;
        Thu, 17 Aug 2023 07:59:43 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id lj9-20020a170906f9c900b00988be3c1d87sm10233557ejb.116.2023.08.17.07.59.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 07:59:43 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 1/4] arm64: dts: qcom: sm8250: Add DisplayPort device node
Date:   Thu, 17 Aug 2023 17:59:37 +0300
Message-Id: <20230817145940.9887-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230817145940.9887-1-dmitry.baryshkov@linaro.org>
References: <20230817145940.9887-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Declare the displayport controller present on the Qualcomm SM8250 SoC.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 89 ++++++++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index eb00bbd3e1f3..8d705a1713fb 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -3638,6 +3638,8 @@ port@1 {
 
 				port@2 {
 					reg = <2>;
+
+					usb_1_qmpphy_dp_in: endpoint {};
 				};
 			};
 		};
@@ -4405,6 +4407,14 @@ dpu_intf2_out: endpoint {
 							remote-endpoint = <&mdss_dsi1_in>;
 						};
 					};
+
+					port@2 {
+						reg = <2>;
+
+						dpu_intf0_out: endpoint {
+							remote-endpoint = <&mdss_dp_in>;
+						};
+					};
 				};
 
 				mdp_opp_table: opp-table {
@@ -4432,6 +4442,85 @@ opp-460000000 {
 				};
 			};
 
+			mdss_dp: displayport-controller@ae90000 {
+				compatible = "qcom,sm8250-dp", "qcom,sm8350-dp";
+				reg = <0 0xae90000 0 0x200>,
+				      <0 0xae90200 0 0x200>,
+				      <0 0xae90400 0 0x600>,
+				      <0 0xae91000 0 0x400>,
+				      <0 0xae91400 0 0x400>;
+				interrupt-parent = <&mdss>;
+				interrupts = <12>;
+				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&dispcc DISP_CC_MDSS_DP_AUX_CLK>,
+					 <&dispcc DISP_CC_MDSS_DP_LINK_CLK>,
+					 <&dispcc DISP_CC_MDSS_DP_LINK_INTF_CLK>,
+					 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>;
+				clock-names = "core_iface",
+					      "core_aux",
+					      "ctrl_link",
+					      "ctrl_link_iface",
+					      "stream_pixel";
+
+				assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK_CLK_SRC>,
+						  <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
+				assigned-clock-parents = <&dp_phy 0>,
+							 <&dp_phy 1>;
+
+				phys = <&dp_phy>;
+				phy-names = "dp";
+
+				#sound-dai-cells = <0>;
+
+				operating-points-v2 = <&dp_opp_table>;
+				power-domains = <&rpmhpd SM8250_MMCX>;
+
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						mdss_dp_in: endpoint {
+							remote-endpoint = <&dpu_intf0_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						mdss_dp_out: endpoint {
+						};
+					};
+				};
+
+				dp_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					opp-160000000 {
+						opp-hz = /bits/ 64 <160000000>;
+						required-opps = <&rpmhpd_opp_low_svs>;
+					};
+
+					opp-270000000 {
+						opp-hz = /bits/ 64 <270000000>;
+						required-opps = <&rpmhpd_opp_svs>;
+					};
+
+					opp-540000000 {
+						opp-hz = /bits/ 64 <540000000>;
+						required-opps = <&rpmhpd_opp_svs_l1>;
+					};
+
+					opp-810000000 {
+						opp-hz = /bits/ 64 <810000000>;
+						required-opps = <&rpmhpd_opp_nom>;
+					};
+				};
+			};
+
 			mdss_dsi0: dsi@ae94000 {
 				compatible = "qcom,sm8250-dsi-ctrl",
 					     "qcom,mdss-dsi-ctrl";
-- 
2.39.2

