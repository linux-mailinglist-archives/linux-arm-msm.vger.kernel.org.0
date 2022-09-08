Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2796E5B2942
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Sep 2022 00:29:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230055AbiIHW3C (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Sep 2022 18:29:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229992AbiIHW26 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Sep 2022 18:28:58 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21334F342F
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Sep 2022 15:28:56 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id z20so21688768ljq.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Sep 2022 15:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=ncF6xJEmvKoJZyCXKGKehRon/gM8MA4X4LW/slRHPU8=;
        b=rMmEOnYLtDYlcvKq3iKgCXJGqTG6Hf/AtETuvpfXh3hkD6tG1OGpmkJAXyjuqnW6/s
         aVi2UIthFEpPhStOVPf+gFNsh7n5PigTn+/TnKAq2Km2d1C7g5IDGi1HK35vXwKh6Le9
         3o2R56e+skKzSEO0AF2UDVuQxGi1U41O/S8Wne96CoD3+9V3+U74OngM78ETIvhvA0ME
         YMjQxQR8yaZuaDOvJMuUMxmI15QVoaCttgW0LAPkZazodKKBQEPm1+0PHQl/QzMW+9Ob
         bikPQFk5TMsn+hN3lBzCY6CLb63U5KIaO0kcrQV/TJoFnuDuO4XGr4OQ279Ufiw0axMY
         +sug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=ncF6xJEmvKoJZyCXKGKehRon/gM8MA4X4LW/slRHPU8=;
        b=1NdyIOQHXSCEbhBLaIR7g281csvYhKPslFWGpw5oO75cSIUNqpBuPIqHvqv3hDsDB6
         Xqg1NZCbI8VV9i5Um1MXSgDmX9mu4ZN43TzFu86sOAi5hAM10uHTTJCsua64QKL0is7I
         FTG9WJgk8Q0ExlephpHYqSdSaretj+10gf40Hq2eDvmT49p01kHUIYGF1kwkclJVeNw1
         vmqgw01W2b8ufWb3/FQGO2o6Y7+WmG85IOxVzDq5WN0GIAn8oDWYnOhRojRZVl9rAetK
         7TbmA05M/aOgl9Jv2k5wnyjSD/6cPP5iaFYVXTMJwZLThe6KI6TL2xSwh3wWWdBm5BJ1
         QJdQ==
X-Gm-Message-State: ACgBeo3eT9jo0kbo0aSsR7+ja3W6g7eLWFGNk6Y8k6UDGXvtCgtVngTL
        C+fvLV7DMv8JKR7p7KVfocKhGg==
X-Google-Smtp-Source: AA6agR5dutiq+xyitDaWxqamQygqAyVtV62Xankfs7gZNFJpL0Ilgur66LBxo3eHpWBStFpBhC+4Gg==
X-Received: by 2002:a2e:8711:0:b0:264:8da5:7a52 with SMTP id m17-20020a2e8711000000b002648da57a52mr2940577lji.173.1662676134499;
        Thu, 08 Sep 2022 15:28:54 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id a25-20020ac25e79000000b00497a3e11608sm1389078lfr.303.2022.09.08.15.28.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Sep 2022 15:28:54 -0700 (PDT)
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
Subject: [PATCH v3 4/4] arm64: dts: qcom: sm8450: add display clock controller
Date:   Fri,  9 Sep 2022 01:28:50 +0300
Message-Id: <20220908222850.3552050-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220908222850.3552050-1-dmitry.baryshkov@linaro.org>
References: <20220908222850.3552050-1-dmitry.baryshkov@linaro.org>
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

Add device node for display clock controller on Qualcomm SM8450 platform

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 4978c5ba5dd0..9062ac4afbca 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -7,6 +7,7 @@
 #include <dt-bindings/clock/qcom,gcc-sm8450.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/clock/qcom,sm8450-camcc.h>
+#include <dt-bindings/clock/qcom,sm8450-dispcc.h>
 #include <dt-bindings/dma/qcom-gpi.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/mailbox/qcom-ipcc.h>
@@ -2317,6 +2318,33 @@ camcc: clock-controller@ade0000 {
 			status = "disabled";
 		};
 
+		dispcc: clock-controller@af00000 {
+			compatible = "qcom,sm8450-dispcc";
+			reg = <0 0x0af00000 0 0x20000>;
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK_A>,
+				 <&gcc GCC_DISP_AHB_CLK>,
+				 <&sleep_clk>,
+				 <0>, /* dsi0 */
+				 <0>,
+				 <0>, /* dsi1 */
+				 <0>,
+				 <0>, /* dp0 */
+				 <0>,
+				 <0>, /* dp1 */
+				 <0>,
+				 <0>, /* dp2 */
+				 <0>,
+				 <0>, /* dp3 */
+				 <0>;
+			power-domains = <&rpmhpd SM8450_MMCX>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+			status = "disabled";
+		};
+
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sm8450-pdc", "qcom,pdc";
 			reg = <0 0x0b220000 0 0x30000>, <0 0x174000f0 0 0x64>;
-- 
2.35.1

