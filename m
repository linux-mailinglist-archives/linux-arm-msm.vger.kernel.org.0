Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D45D691CD9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Feb 2023 11:35:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232102AbjBJKfD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Feb 2023 05:35:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232111AbjBJKfB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Feb 2023 05:35:01 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7A436E57F
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Feb 2023 02:34:59 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id a2so4609644wrd.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Feb 2023 02:34:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WWDkjwlGgT3PH+kCHntGEDuRpwlYGjixN1Q0st7M6IE=;
        b=DTtb9XX0HmyzQ0Lepxr066EtBXWOhEXXxUooHBpeNAknjrfDA02c8JQ1eB6gjl4FtO
         2JKeZK1cC4/MTMpLkpkIr6+jOX6pnkGt5DSuWyBvvcQn7uELvnP71iXJvyZjAstspxV/
         NncCcyY3wZ1ppDCJ0UUjdmZl1+ITh0Y2DBnac/KSG9iuyEbfEddihQIosRu0/BO8z0Tj
         W+LgonsYxPIf5qJX54xxzYG9pkd1j8gvM1d5qAd7UYgySNXxdkNvoXKRmY2c4SAVaXxY
         BGWSHwCXteoU0oJ7lJT5Nbr/kABHY9UmHW9nK6yLRlw/0VrL+GuhIWne52vWanXK9LmP
         GQqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WWDkjwlGgT3PH+kCHntGEDuRpwlYGjixN1Q0st7M6IE=;
        b=h/8NpZoaAYXLTC6rMV4z47ANJLxyJS8d8J4wEa83vwnRx37VTJ6YQ+1jSScJMFoVal
         NDYIIC2fDpeji05yuu3GFCX7R+NY8p93ut9jmuZpHOyVg6EQS2Y6Fiy5qUbQRylRfYFm
         NJOnba4uDeogNZFJmvXIrd6oeT7Ii6juY+HLDUvn6Qd4hBz7plwcPSj1xEtys7OE3m0N
         4J2cxjlfkDWLUO/owYxm+aAJjbRxcqc/bbrttJel13A38HdyKNgLKkV1YSXkjG/YHjvw
         H9JHi9GITiIVOzf5NgqLHoT+gedW7HXTdwk6JwM2iw3+FuOPunQgwfL2Vjg5E8XYZJEl
         3hVA==
X-Gm-Message-State: AO0yUKUpUzy+RV+m34If2p0Z14Zfi3G+sqBiTYd5z/8+EMbKZ30vEvne
        UOzCDE5twsszITPVkMTQ/Pdefg==
X-Google-Smtp-Source: AK7set9myIogqYWdKp5F40UlpBZ0CRjYTF+aeMY03o2WoHS0JtuOf+slbE8CTiotasScRtBIu1DuRQ==
X-Received: by 2002:a05:6000:1c7:b0:2c3:e54d:c043 with SMTP id t7-20020a05600001c700b002c3e54dc043mr13449947wrx.65.1676025298133;
        Fri, 10 Feb 2023 02:34:58 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id b18-20020a05600c4e1200b003e00c453447sm7937958wmq.48.2023.02.10.02.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Feb 2023 02:34:57 -0800 (PST)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Fri, 10 Feb 2023 11:34:52 +0100
Subject: [PATCH v2 3/5] arm64: dts: qcom: sm8350: add dp controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230206-topic-sm8450-upstream-dp-controller-v2-3-529da2203659@linaro.org>
References: <20230206-topic-sm8450-upstream-dp-controller-v2-0-529da2203659@linaro.org>
In-Reply-To: <20230206-topic-sm8450-upstream-dp-controller-v2-0-529da2203659@linaro.org>
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
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the Display Port controller subnode to the MDSS node.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 82 +++++++++++++++++++++++++++++++++++-
 1 file changed, 80 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index d490ce84a022..eb636b7dffa7 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -2862,13 +2862,20 @@ ports {
 
 					port@0 {
 						reg = <0>;
-						dpu_intf1_out: endpoint {
-							remote-endpoint = <&mdss_dsi0_in>;
+						dpu_intf0_out: endpoint {
+							remote-endpoint = <&mdss_dp_in>;
 						};
 					};
 
 					port@1 {
 						reg = <1>;
+						dpu_intf1_out: endpoint {
+							remote-endpoint = <&mdss_dsi0_in>;
+						};
+					};
+
+					port@2 {
+						reg = <2>;
 						dpu_intf2_out: endpoint {
 							remote-endpoint = <&mdss_dsi1_in>;
 						};
@@ -2876,6 +2883,77 @@ dpu_intf2_out: endpoint {
 				};
 			};
 
+			mdss_dp: displayport-controller@ae90000 {
+				compatible = "qcom,sm8350-dp";
+				reg = <0 0xae90000 0 0x200>,
+				      <0 0xae90200 0 0x200>,
+				      <0 0xae90400 0 0x600>,
+				      <0 0xae91000 0 0x400>;
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
+			                      "ctrl_link_iface",
+					      "stream_pixel";
+
+				assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK_CLK_SRC>,
+						  <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
+				assigned-clock-parents = <&usb_1_qmpphy 1>,
+							 <&usb_1_qmpphy 2>;
+
+				phys = <&usb_1_qmpphy 1>;
+			        phy-names = "dp";
+
+			        #sound-dai-cells = <0>;
+
+				operating-points-v2 = <&dp_opp_table>;
+				power-domains = <&rpmhpd SM8350_MMCX>;
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
 				compatible = "qcom,sm8350-dsi-ctrl", "qcom,mdss-dsi-ctrl";
 				reg = <0 0x0ae94000 0 0x400>;

-- 
2.34.1

