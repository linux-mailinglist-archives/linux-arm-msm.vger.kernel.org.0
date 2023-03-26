Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A16A6C9354
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Mar 2023 11:16:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230192AbjCZJQM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 26 Mar 2023 05:16:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbjCZJQL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 26 Mar 2023 05:16:11 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E591F9032
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Mar 2023 02:16:09 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id w9so24305487edc.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Mar 2023 02:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679822168;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RVdcLdPzcznfLu5pV3m1WzbNiFmKRhHrUVaPMwriaSA=;
        b=zobcUBWPrSp/4y+k/WK+lZBW+LnOtpPGzz007TUEr69BtXLN8ouhoLpQSFmm0NEZp2
         prpyGUwygdKax2iOjdm/M3CicbZ3oiSHDgh2M/8I601mxLM6cB7Uo8JB494tpEGKs/Nl
         9vIP9uXcvrH8crfzLvt5W0trcvzOkvp6IIJl1qMw2tW6BXGU95zpjXezuGfJk/tGGSNX
         eGBG0CzYApzkloxW0mRqeQ8vNpo70VXeGwIt2cy4sDpzRDU0u8hq2T07yuAhmNU0JoXE
         6DPUE98k3OpMzOv+o83wgndCT3+XUqSvdvHWqnWe+mtTE2V1Cc37K2iszpVwzgTS+uw7
         CZTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679822168;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RVdcLdPzcznfLu5pV3m1WzbNiFmKRhHrUVaPMwriaSA=;
        b=WXbe1ysou1ho5uOztJ5bgqN6CYMw8mPQIcvV/+cEjOvo9H/myqYd49wV8MwtGjU3VM
         sCCbfE/4CpR3+dnDGrQ+hhVoAD0VkkngorUrBY1kkdFj9KZweIlIXHjyEoL8TAcelAtZ
         VZPNOTaBM/YvPmh+i3EV0hAolgg3x2DGjaIjYepZ4MT4TMwPGmB61n108zJ/0HmRK+Rh
         0q3Fs8FcOfepp8OitD3iFIFr5HmJCBaAe3d5KMydwuzV/0pSF2C63TL1xRpWvRDCcyn7
         8N+MdEag/kImXvaeyW3nOARqOL4rf2Yqhanapq1eSQpgHN3uulzhCgT3oLTcRrcVBjmK
         Yr3w==
X-Gm-Message-State: AO0yUKXXs8UEzjct7Lu/2brjEjsBegZe0KYnHu92JtIppHE2QkUWp7wZ
        BCmiuWo7/FmNGXZMjwIYzeAkJQ==
X-Google-Smtp-Source: AK7set+21ZfoJE99Nq9jkZpPELlJ6LrY+qn8O3F+7udZkpqYQMkG59FrMIxIMxGZivvwWOl0kN1TrQ==
X-Received: by 2002:a05:6402:c17:b0:4ac:d90e:92b with SMTP id co23-20020a0564020c1700b004acd90e092bmr16023867edb.10.1679822168485;
        Sun, 26 Mar 2023 02:16:08 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:6cac:926d:a4f2:aa09])
        by smtp.gmail.com with ESMTPSA id x23-20020a50d617000000b004fa268da13esm13409297edi.56.2023.03.26.02.16.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Mar 2023 02:16:08 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2] arm64: dts: qcom: sdm630: move DSI opp-table out of soc node
Date:   Sun, 26 Mar 2023 11:16:05 +0200
Message-Id: <20230326091605.18908-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
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

The soc node is supposed to have only device nodes with MMIO addresses,
so move the DSI OPP out of it (it is used also by second DSI1 on
SDM660):

  sda660-inforce-ifc6560.dtb: soc: opp-table-dsi: {'compatible': ['operating-points-v2'], ... should not be valid under {'type': 'object'}
    From schema: dtschema/schemas/simple-bus.yaml

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes since v1:
1. Move the node out of soc. Don't add Konrad's review tag.
---
 arch/arm64/boot/dts/qcom/sdm630.dtsi | 38 ++++++++++++++--------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index 72d9a12b5e9c..b91e423a3cfc 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -328,6 +328,25 @@ memory@80000000 {
 		reg = <0x0 0x80000000 0x0 0x0>;
 	};
 
+	dsi_opp_table: opp-table-dsi {
+		compatible = "operating-points-v2";
+
+		opp-131250000 {
+			opp-hz = /bits/ 64 <131250000>;
+			required-opps = <&rpmpd_opp_svs>;
+		};
+
+		opp-210000000 {
+			opp-hz = /bits/ 64 <210000000>;
+			required-opps = <&rpmpd_opp_svs_plus>;
+		};
+
+		opp-262500000 {
+			opp-hz = /bits/ 64 <262500000>;
+			required-opps = <&rpmpd_opp_nom>;
+		};
+	};
+
 	pmu {
 		compatible = "arm,armv8-pmuv3";
 		interrupts = <GIC_PPI 6 IRQ_TYPE_LEVEL_HIGH>;
@@ -1450,25 +1469,6 @@ mmcc: clock-controller@c8c0000 {
 					<0>;
 		};
 
-		dsi_opp_table: opp-table-dsi {
-			compatible = "operating-points-v2";
-
-			opp-131250000 {
-				opp-hz = /bits/ 64 <131250000>;
-				required-opps = <&rpmpd_opp_svs>;
-			};
-
-			opp-210000000 {
-				opp-hz = /bits/ 64 <210000000>;
-				required-opps = <&rpmpd_opp_svs_plus>;
-			};
-
-			opp-262500000 {
-				opp-hz = /bits/ 64 <262500000>;
-				required-opps = <&rpmpd_opp_nom>;
-			};
-		};
-
 		mdss: display-subsystem@c900000 {
 			compatible = "qcom,mdss";
 			reg = <0x0c900000 0x1000>,
-- 
2.34.1

