Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1BE4568E33
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Jul 2022 17:51:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234733AbiGFPuI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Jul 2022 11:50:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234728AbiGFPtQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Jul 2022 11:49:16 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D743A2A738
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Jul 2022 08:43:50 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id x10so12450614edd.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Jul 2022 08:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=bp6TrRUNMz/647uXOjAc4r6XoFgzEUxaQ9GO/reUgGE=;
        b=YHSY9u3k8ifgLH/tyyQ4TL9kKBhTKzADcNreVymdeon0SS7kHJSla2DX5rqli7rN5r
         Tx0x4igA0cIcY0KI9WVJX56kKU3/68ys5CjZNLTWvq7t5SebyR5HrjXf9vpbmrLj7tJs
         H0m3SHVvEn5zDsf5fN7mtkjD08kAdHY77xaalMcs/uAbyl1peQD0KKrn7Hbtn6TVZo6d
         uZNLOWCVx/Ut8l9XqqEfuQACQb9IbMNwNn2/7zbQzr0aHZwHDavq13crBJHTUyVk4sUk
         m0U4BPWMQ6QbjQ6C5sN2vuiAerLQx0bGgML5Cj1VtM9fi1wy+oCSFYQX5YhzfiocM8Xz
         R5UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bp6TrRUNMz/647uXOjAc4r6XoFgzEUxaQ9GO/reUgGE=;
        b=fXbBr4yx/jhYM9G33fO3R7rcyfZ0SD8Qn5kMZFFETn95g5hOU4wol+wCtl/XEspvrE
         n6pt4feF4Z4hFITqcs+Bha99ejY4xAu/D6XW0Ew8GEPyjuUd7fXKhZl565teapqFyKZd
         7zUhISOwTTJh0erMfkW2xFxxAlQ6cXYYJER2+XV6wEhyMLZul0DtPE0Bqq8nHQw3uFSe
         TJyIkHdUWHeQ6M0IXWSzBDrJ6i/8O7Ju64ZLKzSMAcvgQx2NP4UGNCi3dW1xJcP6xf4z
         V9o0qcVnKjUvMAcEWW/dQNPeiURAABOtDLKyR8C1oOOLLntlF1dCKxe6hjfQSo7G3zsn
         Yr9A==
X-Gm-Message-State: AJIora81w3aWsbdonM6eFSQBOztT13eT7WDXRZcmCX6o+eqP4WaIGkSP
        CSk3FR7Ia5MZOwnGGGbXrOEK2Q==
X-Google-Smtp-Source: AGRyM1vbUDyHqObESgfdXMVT/M+3wsImImnG65+RGNI0KYbw6m+BOekmUiqQv1KnlZuVjS/JiUqvjg==
X-Received: by 2002:a05:6402:440c:b0:43a:1124:e56a with SMTP id y12-20020a056402440c00b0043a1124e56amr30031299eda.134.1657122229465;
        Wed, 06 Jul 2022 08:43:49 -0700 (PDT)
Received: from prec5560.. (freifunk-gw.bsa1-cpe1.syseleven.net. [176.74.57.43])
        by smtp.gmail.com with ESMTPSA id fi18-20020a056402551200b0043a43fcde13sm7711033edb.13.2022.07.06.08.43.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 08:43:48 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        konrad.dybcio@somainline.org, mturquette@baylibre.com,
        sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, jonathan@marek.ca,
        robert.foss@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v8 5/5] arm64: dts: qcom: sm8350: Add DISPCC node
Date:   Wed,  6 Jul 2022 17:43:37 +0200
Message-Id: <20220706154337.2026269-6-robert.foss@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220706154337.2026269-1-robert.foss@linaro.org>
References: <20220706154337.2026269-1-robert.foss@linaro.org>
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

Add the dispcc clock-controller DT node for sm8350.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---

Changes since v2
 - Remove interconnect include - Bjorn

Changes since v3
 - Switch from .fw_name to .index

Changes since v5
 - Revert .fw_name to .index change

Changes since v6
 - Add r-b - Konrad


 arch/arm64/boot/dts/qcom/sm8350.dtsi | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 447a02f10463..aa0ca45ca184 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/clock/qcom,dispcc-sm8350.h>
 #include <dt-bindings/clock/qcom,gcc-sm8350.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/dma/qcom-gpi.h>
@@ -2531,6 +2532,31 @@ usb_2_dwc3: usb@a800000 {
 			};
 		};
 
+		dispcc: clock-controller@af00000 {
+			compatible = "qcom,sm8350-dispcc";
+			reg = <0 0x0af00000 0 0x10000>;
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>;
+			clock-names = "bi_tcxo",
+				      "dsi0_phy_pll_out_byteclk",
+				      "dsi0_phy_pll_out_dsiclk",
+				      "dsi1_phy_pll_out_byteclk",
+				      "dsi1_phy_pll_out_dsiclk",
+				      "dp_phy_pll_link_clk",
+				      "dp_phy_pll_vco_div_clk";
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+
+			power-domains = <&rpmhpd SM8350_MMCX>;
+			power-domain-names = "mmcx";
+		};
+
 		adsp: remoteproc@17300000 {
 			compatible = "qcom,sm8350-adsp-pas";
 			reg = <0 0x17300000 0 0x100>;
-- 
2.34.1

