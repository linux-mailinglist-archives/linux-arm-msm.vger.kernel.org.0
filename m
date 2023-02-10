Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA4BD69210F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Feb 2023 15:44:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232163AbjBJOol (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Feb 2023 09:44:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232296AbjBJOof (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Feb 2023 09:44:35 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F382765E4
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Feb 2023 06:44:33 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id n28-20020a05600c3b9c00b003ddca7a2bcbso4220729wms.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Feb 2023 06:44:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oB/TvOEFZT+W+sDYygPAtotZsUziIZY1jUdQwqpQGl4=;
        b=oLF0a73loPNaqavl96UdisNYXdtJXeqN6xIdiG927eZjyuErwCqfQ7x6CMAd8N2Y4s
         OS0EbKlfNC9ah58QdEY6Wyz3YBOH272Qcxi6omYBSgjr2Z55iMcC5/6u/whZoUeiPWP7
         OKbEBtsHBhKGSNYr8uNKds90xe8Hn+csABnGcH/Q64M1F7UT5BjoCY/P3Q/2WisqL3hz
         HCllgFcM3PRWtsj1XReV0aavOSkmPXKOsFBU2lkBNsrHkpcKGdMLeHUAwN2iy+Y8EENI
         XW8KV0EMd0uKFaPw4qAcjGgxPUX6xuFC5IxMnYJlyTmEJ6b9pmmXVbSAqEblx44KCMkS
         zaBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oB/TvOEFZT+W+sDYygPAtotZsUziIZY1jUdQwqpQGl4=;
        b=vJPwBR4KIm/mCGbea8HjBNJuYwD56nxw4ZcFnwP40tBY4epPS+gMKpP+fLkcitEfNY
         qLihhknNL7ydU16lIrg+1EpO8DHZ4c8NOFdbv3aZodc5xG6UQ14n3P9im9gCVluEJulR
         7pbyIfFh4l3i1Xok1v5ZysQyBQ6KiwT0SRMlj1xVTkT+6Y8niQF2efFnarSDdDCDYzx9
         6E/xiUB3jVWwLjSu9gxQ+bRfxKUrv7Qx+SqwrLFwIoma99isRUpoL7479O+o8fIhNfxc
         LtFjWU6fONkVtfrEyP6Gi/DagksXOB2slGOAsz2cMMb135GNIAUZNpMi24Jjf0f+QaFq
         JFHA==
X-Gm-Message-State: AO0yUKVFiMeM3r4Tu/+/URkWIUJrV0G4lbXEZO0f/aAwBYMGCaLU2f7k
        RcOjSa4O2BNEcscZahqU6+19qg==
X-Google-Smtp-Source: AK7set/bpm2sO+qBJOu0PVt39/eQpQu2LGg5gAcFgui5x/8vlhsySdyVoXrfTbwkLjEdgumDqQujcA==
X-Received: by 2002:a05:600c:4a9c:b0:3dd:1b6f:4f30 with SMTP id b28-20020a05600c4a9c00b003dd1b6f4f30mr17297527wmp.3.1676040272957;
        Fri, 10 Feb 2023 06:44:32 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id l40-20020a05600c1d2800b003dd1b00bd9asm6103000wms.32.2023.02.10.06.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Feb 2023 06:44:32 -0800 (PST)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Fri, 10 Feb 2023 15:44:25 +0100
Subject: [PATCH v3 5/5] arm64: dts: qcom: sm8450: add dp controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230206-topic-sm8450-upstream-dp-controller-v3-5-636ef9e99932@linaro.org>
References: <20230206-topic-sm8450-upstream-dp-controller-v3-0-636ef9e99932@linaro.org>
In-Reply-To: <20230206-topic-sm8450-upstream-dp-controller-v3-0-636ef9e99932@linaro.org>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the Display Port controller subnode to the MDSS node.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 79 ++++++++++++++++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 6caa2c8efb46..72d54beb7d7c 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -2751,6 +2751,13 @@ dpu_intf2_out: endpoint {
 						};
 					};
 
+					port@2 {
+						reg = <2>;
+						dpu_intf0_out: endpoint {
+							remote-endpoint = <&mdss_dp0_in>;
+						};
+					};
+
 				};
 
 				mdp_opp_table: opp-table {
@@ -2783,6 +2790,78 @@ opp-500000000 {
 				};
 			};
 
+			mdss_dp0: displayport-controller@ae90000 {
+				compatible = "qcom,sm8350-dp";
+				reg = <0 0xae90000 0 0xfc>,
+				      <0 0xae90200 0 0xc0>,
+				      <0 0xae90400 0 0x770>,
+				      <0 0xae91000 0 0x98>,
+				      <0 0xae91400 0 0x98>;
+				interrupt-parent = <&mdss>;
+				interrupts = <12>;
+				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX0_AUX_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK>;
+				clock-names = "core_iface",
+					      "core_aux",
+					      "ctrl_link",
+			                      "ctrl_link_iface",
+					      "stream_pixel";
+
+				assigned-clocks = <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
+						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>;
+				assigned-clock-parents = <&usb_1_qmpphy QMP_USB43DP_DP_LINK_CLK>,
+							 <&usb_1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
+
+				phys = <&usb_1_qmpphy QMP_USB43DP_DP_PHY>;
+			        phy-names = "dp";
+
+			        #sound-dai-cells = <0>;
+
+				operating-points-v2 = <&dp_opp_table>;
+				power-domains = <&rpmhpd SM8450_MMCX>;
+
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						mdss_dp0_in: endpoint {
+							remote-endpoint = <&dpu_intf0_out>;
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
 				compatible = "qcom,sm8450-dsi-ctrl", "qcom,mdss-dsi-ctrl";
 				reg = <0 0x0ae94000 0 0x400>;

-- 
2.34.1

