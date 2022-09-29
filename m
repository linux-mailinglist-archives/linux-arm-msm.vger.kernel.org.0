Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 400495EF1D4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Sep 2022 11:22:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235643AbiI2JV7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Sep 2022 05:21:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235666AbiI2JV5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Sep 2022 05:21:57 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B97BB130718
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Sep 2022 02:21:54 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id z4so1350946lft.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Sep 2022 02:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=2ri0ph/SYDEenZkclIiEbJjOxBZZXyVDkmOCBrAKwwI=;
        b=pxLivEqrPEpobPO2Qb6lAWjBIt5uJMNjK6kE3cMrj1rG4R+/5DKTO1Ou8iOtwfmp4u
         TO7R8W5zn9BsRpxKOYbqWkRk5uPAFKBfT75WjBzU/fhzuIi1nkyswYjNLzmO4kaOx8zK
         3nWGDef6OOGih64vSllpmzHHUA4mOtIdyUJ8gxh64wnS0PW15vSQvNmYLG5ofUUzdTaH
         wL0eCbKxtWO5TysNqddONd0v9+kbcCwROMe8G6bU9w4D3TLEGiC3QLKa2z8+hFthb1vh
         cBuH2zFvRZUIWVI5CEDEqq8kOSLU3X0+feGQL8UOzHwGqtIPnP8ELwGtXv2DOXswYXTH
         rhSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=2ri0ph/SYDEenZkclIiEbJjOxBZZXyVDkmOCBrAKwwI=;
        b=DCcUiuC4ivkFWx5Gww0dZJz59OBiFp2PEkC3xwe1X08pN81e1ZuvSQ30XOrXTmIXEv
         DStp0gwBh7oxQmZXbnQ/s0n43VoYy7d6P9R5JuY+EQLHY8J61eixatY4cyhV0VhyD+O1
         IjMjHaPKGYYt2ZKjCKP9JdNNitawga8BOdWZGke/40tfo9XzTXxyM7CmlY4H6a+31Tqd
         ismZtCYzj6kuwn8bCCh4mFU0+eg/Fwh0PJMRkmO0khHFKflLdLoNWyhx7zGT1bG4L6dz
         7nd5GDV00VUm/21wREbK9ZKUjC7MPALjm3DwGyNMiro9PHXueFSziu6QYP85/ZkaOsBD
         BcbQ==
X-Gm-Message-State: ACrzQf30T23O5xLwpFLSZYtCEchg37FHuqctld1QgF77C8Ue3kcirvZe
        IKrzE+ZpHfKll5UHrWvojEWBpA==
X-Google-Smtp-Source: AMsMyM6FFb3UtU2JI2kLozMWAfKtTZKSNuXHFPxICLjTnqB9/P30+2zhIPpM8Uo0yfbq3jn2aUBaCw==
X-Received: by 2002:ac2:57c9:0:b0:49c:3e64:de95 with SMTP id k9-20020ac257c9000000b0049c3e64de95mr974586lfo.452.1664443312727;
        Thu, 29 Sep 2022 02:21:52 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id c22-20020a2e9496000000b0026c687f9f7bsm633271ljh.107.2022.09.29.02.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Sep 2022 02:21:52 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v2 09/11] ARM: dts: qcom: msm8974: add second DSI host and PHY
Date:   Thu, 29 Sep 2022 12:21:43 +0300
Message-Id: <20220929092145.473009-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220929092145.473009-1-dmitry.baryshkov@linaro.org>
References: <20220929092145.473009-1-dmitry.baryshkov@linaro.org>
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

Add second DSI host and PHY available on the msm8974 platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-msm8974.dtsi | 77 +++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index 7a9be0acf3f5..c09ed8728ec6 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -1541,6 +1541,13 @@ mdp5_intf1_out: endpoint {
 							remote-endpoint = <&dsi0_in>;
 						};
 					};
+
+					port@1 {
+						reg = <1>;
+						mdp5_intf2_out: endpoint {
+							remote-endpoint = <&dsi1_in>;
+						};
+					};
 				};
 			};
 
@@ -1614,6 +1621,76 @@ dsi0_phy: dsi-phy@fd922a00 {
 
 				status = "disabled";
 			};
+
+			dsi1: dsi@fd922e00 {
+				compatible = "qcom,mdss-dsi-ctrl";
+				reg = <0xfd922e00 0x1f8>;
+				reg-names = "dsi_ctrl";
+
+				interrupt-parent = <&mdss>;
+				interrupts = <4>;
+
+				assigned-clocks = <&mmcc BYTE1_CLK_SRC>, <&mmcc PCLK1_CLK_SRC>;
+				assigned-clock-parents = <&dsi1_phy 0>, <&dsi1_phy 1>;
+
+				clocks = <&mmcc MDSS_MDP_CLK>,
+					 <&mmcc MDSS_AHB_CLK>,
+					 <&mmcc MDSS_AXI_CLK>,
+					 <&mmcc MDSS_BYTE1_CLK>,
+					 <&mmcc MDSS_PCLK1_CLK>,
+					 <&mmcc MDSS_ESC1_CLK>,
+					 <&mmcc MMSS_MISC_AHB_CLK>;
+				clock-names = "mdp_core",
+					      "iface",
+					      "bus",
+					      "byte",
+					      "pixel",
+					      "core",
+					      "core_mmss";
+
+				phys = <&dsi1_phy>;
+
+				status = "disabled";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						dsi1_in: endpoint {
+							remote-endpoint = <&mdp5_intf2_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+						dsi1_out: endpoint {
+						};
+					};
+				};
+			};
+
+			dsi1_phy: phy@fd923000 {
+				compatible = "qcom,dsi-phy-28nm-hpm";
+				reg = <0xfd923000 0xd4>,
+				      <0xfd923100 0x280>,
+				      <0xfd923380 0x30>;
+				reg-names = "dsi_pll",
+					    "dsi_phy",
+					    "dsi_phy_regulator";
+
+				#clock-cells = <1>;
+				#phy-cells = <0>;
+
+				clocks = <&mmcc MDSS_AHB_CLK>, <&xo_board>;
+				clock-names = "iface", "ref";
+
+				status = "disabled";
+			};
 		};
 
 		gpu: adreno@fdb00000 {
-- 
2.35.1

