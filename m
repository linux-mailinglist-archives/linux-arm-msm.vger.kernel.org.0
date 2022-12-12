Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 880AB649B9A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Dec 2022 11:03:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231990AbiLLKDC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Dec 2022 05:03:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231967AbiLLKCx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Dec 2022 05:02:53 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F93664FA
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Dec 2022 02:02:51 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id v11so2269841ljk.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Dec 2022 02:02:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vZWHacJeruYxFR3J1MJB9nSgpjJtyeDKFZvrWwuGNHA=;
        b=FZJSZNpzm7/RAZPv0oeDgURlRfDtKH9M3oAjy81IDjF2lh1tJ5rIhesKLpcXTM24GR
         /NX8Wt+3SOQAEDNkQPs0FKGkb2I+FXLA0Jyb2T/RKq4lyRZAZGMVHbpAecBkhDb3wsT7
         kTvAMD5USVLmByN7Qpw3eKC8VZa5DlJn4mNCI/BD6q8MEn/9jkEoz+PxvtIkn3H409CC
         4HSpCAI6MZ0xIyLJ2ikZIivWi8FF01Mhpct6SfcLdTsiMQrhBVYtdoU5L1/N6vHN7UYZ
         epYlZw5tGMUfGCcNho7ULVuVqHt1XBOQmOLt6RN8DmmlVdRakqlif+fwn6gF85wCe9VV
         lDlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vZWHacJeruYxFR3J1MJB9nSgpjJtyeDKFZvrWwuGNHA=;
        b=RQSXtXTTI7N0jbYZh835MIfG20LcohEqNUkkXkqUPRf2MC6M0Pr5WVs1aZzylhIXbU
         i42LzbG4sv64Xt2vGViQxWblMxPDMGlIyG9q462xddf3bD+YKzAfkU8fWhpEPyQ0GRhD
         otX7ZoYkr4auxC6VrUsuzkjK6vVuisgNsV/1/IhweURjVc5BhJF0PeTUFdxVYxYlEh7F
         VKvWzAp5MAfhK5EqTthy/Ckn4mG7l9AruRETZf+ttDr7rbrgMq/qRvB9KHe52HwaZR8/
         gnm4GxgGJff15yz7k0ow64kMvcQs4ZjdKWZw6st+XCc076TpnrA2pBiEQms22eLLoVvG
         41gw==
X-Gm-Message-State: ANoB5pmijJr7pDtXtmUzBqM/YwYtyfxYfHXEjOTzVx+ny9r4RFCs8WgF
        2UpZEhcHLfodVLd2PJp390OBJg==
X-Google-Smtp-Source: AA0mqf6JRQ7OPWlwRL5x+edMw0Z36rNCK1WpY4YnVtd8IplZ/unben06t5K9UqCR+O3SzwX0irbFgQ==
X-Received: by 2002:a2e:9f49:0:b0:27a:1d04:6709 with SMTP id v9-20020a2e9f49000000b0027a1d046709mr3929921ljk.42.1670839369710;
        Mon, 12 Dec 2022 02:02:49 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id i124-20020a2e2282000000b0027712379ec8sm1145101lji.28.2022.12.12.02.02.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Dec 2022 02:02:49 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/6] arm64: dts: qcom: sdm845: move DSI/QUP/QSPI opp tables out of SoC node
Date:   Mon, 12 Dec 2022 11:02:30 +0100
Message-Id: <20221212100232.138519-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221212100232.138519-1-krzysztof.kozlowski@linaro.org>
References: <20221212100232.138519-1-krzysztof.kozlowski@linaro.org>
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

The SoC node is a simple-bus and its schema expect to have nodes only
with unit addresses:

  sdm850-lenovo-yoga-c630.dtb: soc@0: opp-table-qup: {'compatible': ['operating-points-v2'], 'phandle': [[60]], 'opp-50000000':
  ... 'required-opps': [[55]]}} should not be valid under {'type': 'object'}

Move to top-level OPP tables:
 - DSI and QUP which are shared between multiple nodes,
 - QSPI which cannot be placed in its node due to address/size cells.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

---

Changes since v1:
1. Only rebase due to node reorderings.
2. Add Rb tag.
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 154 +++++++++++++--------------
 1 file changed, 77 insertions(+), 77 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 88e7d4061aae..8eeb3aa261d5 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -604,6 +604,83 @@ cpu4_opp32: opp-2803200000 {
 		};
 	};
 
+	dsi_opp_table: opp-table-dsi {
+		compatible = "operating-points-v2";
+
+		opp-19200000 {
+			opp-hz = /bits/ 64 <19200000>;
+			required-opps = <&rpmhpd_opp_min_svs>;
+		};
+
+		opp-180000000 {
+			opp-hz = /bits/ 64 <180000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+		};
+
+		opp-275000000 {
+			opp-hz = /bits/ 64 <275000000>;
+			required-opps = <&rpmhpd_opp_svs>;
+		};
+
+		opp-328580000 {
+			opp-hz = /bits/ 64 <328580000>;
+			required-opps = <&rpmhpd_opp_svs_l1>;
+		};
+
+		opp-358000000 {
+			opp-hz = /bits/ 64 <358000000>;
+			required-opps = <&rpmhpd_opp_nom>;
+		};
+	};
+
+	qspi_opp_table: opp-table-qspi {
+		compatible = "operating-points-v2";
+
+		opp-19200000 {
+			opp-hz = /bits/ 64 <19200000>;
+			required-opps = <&rpmhpd_opp_min_svs>;
+		};
+
+		opp-100000000 {
+			opp-hz = /bits/ 64 <100000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+		};
+
+		opp-150000000 {
+			opp-hz = /bits/ 64 <150000000>;
+			required-opps = <&rpmhpd_opp_svs>;
+		};
+
+		opp-300000000 {
+			opp-hz = /bits/ 64 <300000000>;
+			required-opps = <&rpmhpd_opp_nom>;
+		};
+	};
+
+	qup_opp_table: opp-table-qup {
+		compatible = "operating-points-v2";
+
+		opp-50000000 {
+			opp-hz = /bits/ 64 <50000000>;
+			required-opps = <&rpmhpd_opp_min_svs>;
+		};
+
+		opp-75000000 {
+			opp-hz = /bits/ 64 <75000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+		};
+
+		opp-100000000 {
+			opp-hz = /bits/ 64 <100000000>;
+			required-opps = <&rpmhpd_opp_svs>;
+		};
+
+		opp-128000000 {
+			opp-hz = /bits/ 64 <128000000>;
+			required-opps = <&rpmhpd_opp_nom>;
+		};
+	};
+
 	pmu {
 		compatible = "arm,armv8-pmuv3";
 		interrupts = <GIC_PPI 5 IRQ_TYPE_LEVEL_HIGH>;
@@ -1117,30 +1194,6 @@ rng: rng@793000 {
 			clock-names = "core";
 		};
 
-		qup_opp_table: opp-table-qup {
-			compatible = "operating-points-v2";
-
-			opp-50000000 {
-				opp-hz = /bits/ 64 <50000000>;
-				required-opps = <&rpmhpd_opp_min_svs>;
-			};
-
-			opp-75000000 {
-				opp-hz = /bits/ 64 <75000000>;
-				required-opps = <&rpmhpd_opp_low_svs>;
-			};
-
-			opp-100000000 {
-				opp-hz = /bits/ 64 <100000000>;
-				required-opps = <&rpmhpd_opp_svs>;
-			};
-
-			opp-128000000 {
-				opp-hz = /bits/ 64 <128000000>;
-				required-opps = <&rpmhpd_opp_nom>;
-			};
-		};
-
 		gpi_dma0: dma-controller@800000 {
 			#dma-cells = <3>;
 			compatible = "qcom,sdm845-gpi-dma";
@@ -3799,30 +3852,6 @@ opp-201500000 {
 			};
 		};
 
-		qspi_opp_table: opp-table-qspi {
-			compatible = "operating-points-v2";
-
-			opp-19200000 {
-				opp-hz = /bits/ 64 <19200000>;
-				required-opps = <&rpmhpd_opp_min_svs>;
-			};
-
-			opp-100000000 {
-				opp-hz = /bits/ 64 <100000000>;
-				required-opps = <&rpmhpd_opp_low_svs>;
-			};
-
-			opp-150000000 {
-				opp-hz = /bits/ 64 <150000000>;
-				required-opps = <&rpmhpd_opp_svs>;
-			};
-
-			opp-300000000 {
-				opp-hz = /bits/ 64 <300000000>;
-				required-opps = <&rpmhpd_opp_nom>;
-			};
-		};
-
 		qspi: spi@88df000 {
 			compatible = "qcom,sdm845-qspi", "qcom,qspi-v1";
 			reg = <0 0x088df000 0 0x600>;
@@ -4420,35 +4449,6 @@ clock_camcc: clock-controller@ad00000 {
 			clock-names = "bi_tcxo";
 		};
 
-		dsi_opp_table: opp-table-dsi {
-			compatible = "operating-points-v2";
-
-			opp-19200000 {
-				opp-hz = /bits/ 64 <19200000>;
-				required-opps = <&rpmhpd_opp_min_svs>;
-			};
-
-			opp-180000000 {
-				opp-hz = /bits/ 64 <180000000>;
-				required-opps = <&rpmhpd_opp_low_svs>;
-			};
-
-			opp-275000000 {
-				opp-hz = /bits/ 64 <275000000>;
-				required-opps = <&rpmhpd_opp_svs>;
-			};
-
-			opp-328580000 {
-				opp-hz = /bits/ 64 <328580000>;
-				required-opps = <&rpmhpd_opp_svs_l1>;
-			};
-
-			opp-358000000 {
-				opp-hz = /bits/ 64 <358000000>;
-				required-opps = <&rpmhpd_opp_nom>;
-			};
-		};
-
 		mdss: mdss@ae00000 {
 			compatible = "qcom,sdm845-mdss";
 			reg = <0 0x0ae00000 0 0x1000>;
-- 
2.34.1

