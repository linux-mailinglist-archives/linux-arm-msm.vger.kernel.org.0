Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36C145EF1D7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Sep 2022 11:22:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235697AbiI2JWH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Sep 2022 05:22:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235679AbiI2JV7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Sep 2022 05:21:59 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E1F013070C
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Sep 2022 02:21:56 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 10so1344597lfy.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Sep 2022 02:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=5XV4I6V09d/gnCiP3+VfV7wzkqI+zAlHaOlWXMJBTEQ=;
        b=qoqb8SrzPRjbwwAAXrZ/QK67hnfyKTviFc+EOlfM8pj0NI6f8ZT7A0JxZenGAVyX0g
         z7Q7Vmf/cLdnHmHJzyHZvcSfsWk75cymN5qVn+Gopx7ANfrLP+C7dzcSGlW3vmMybmh9
         GYPxhBHxUNp4n0qBaiCTrafkhVIR+U4MOz3ze1/k4A76fGOgxp1Dm0OTHK/Z1O3zjy5R
         v5++dHF+odTVgkd1200cmSucm3OWqu5Ix2JH/IN6RKyc0BlN4D5Dau9/knQJ7ofk8I77
         VA+uve8GFRxZqNBM6piWCcob+Qq2m7HTjTQGnTvss7qXaOeXTEsa8jNzzSsQHnsZOFEI
         +gmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=5XV4I6V09d/gnCiP3+VfV7wzkqI+zAlHaOlWXMJBTEQ=;
        b=F8sBNIlpdDQOFSRgnr42KPnO7EA33Q39B3XqLJvblNHUgN1roInc3HUgZfUl/PJDNU
         n7E0wJ1KfDOyDxZBYTzmN9XBZOo4GPzLrMp4kwLTOU2uyR5yOqHHmSvrlLhuHjjxnGpg
         Q3edJWK7nZFgt/+uxle0AgrasStbsfVBTfsWoDpjCutceUJfzN8SGpeXhPEbDlaxIFy2
         nClouo4giimVQPlEnU0ELuPz+sLkhaVj8WzhYdmXpCyx7xuL15O7xTwuA4t2pCdFBNlH
         t/Bi4zIZeUwSrToFpnQj+znQI2ESqdikitZfptBDkvh07cH4j/nBhsryaQphwIsjkxDe
         KHPA==
X-Gm-Message-State: ACrzQf28lS7ufrR0vbuVS4RtJ/c7Bp2t8OE9pWLpehT2cXB3eOS3plHv
        WsPJM3OnxM33GbLgN9/0nvwZjw==
X-Google-Smtp-Source: AMsMyM5lXBrTzkjrtoqBlliQVUhYXv6iHQhmStHhycZghVXJbb+Bk90CcXG76y+AgXzuCWoUkDvEHg==
X-Received: by 2002:a05:6512:2805:b0:4a0:4fac:a958 with SMTP id cf5-20020a056512280500b004a04faca958mr1045525lfb.291.1664443314112;
        Thu, 29 Sep 2022 02:21:54 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id c22-20020a2e9496000000b0026c687f9f7bsm633271ljh.107.2022.09.29.02.21.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Sep 2022 02:21:53 -0700 (PDT)
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
Subject: [PATCH v2 11/11] ARM: dts: qcom: msm8974: add clocks and clock-names to mmcc device
Date:   Thu, 29 Sep 2022 12:21:45 +0300
Message-Id: <20220929092145.473009-12-dmitry.baryshkov@linaro.org>
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

Add clocks and clock-names nodes to the mmcc device to bind clocks using
the DT links.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-msm8974.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index 76b9aaf93196..1e55437b87cd 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -1493,6 +1493,30 @@ mmcc: clock-controller@fd8c0000 {
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
 			reg = <0xfd8c0000 0x6000>;
+			clocks = <&xo_board>,
+				 <&gcc GCC_MMSS_GPLL0_CLK_SRC>,
+				 <&gcc GPLL0_VOTE>,
+				 <&gcc GPLL1_VOTE>,
+				 <&rpmcc RPM_SMD_GFX3D_CLK_SRC>,
+				 <&dsi0_phy 1>,
+				 <&dsi0_phy 0>,
+				 <&dsi1_phy 1>,
+				 <&dsi1_phy 0>,
+				 <0>,
+				 <0>,
+				 <0>;
+			clock-names = "xo",
+				      "mmss_gpll0_vote",
+				      "gpll0_vote",
+				      "gpll1_vote",
+				      "gfx3d_clk_src",
+				      "dsi0pll",
+				      "dsi0pllbyte",
+				      "dsi1pll",
+				      "dsi1pllbyte",
+				      "hdmipll",
+				      "edp_link_clk",
+				      "edp_vco_div";
 		};
 
 		mdss: mdss@fd900000 {
-- 
2.35.1

