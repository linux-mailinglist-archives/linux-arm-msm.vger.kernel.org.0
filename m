Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7EC7C66542D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jan 2023 07:04:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235634AbjAKGEP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Jan 2023 01:04:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233598AbjAKGEI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Jan 2023 01:04:08 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C1D8B4B3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jan 2023 22:04:06 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id bp15so21901853lfb.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jan 2023 22:04:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8suBYAm3Zd4AZ9SNJ+UeQbMRVa9pu1Uwc0Ft1fj2TgE=;
        b=xT0Y2QMZpxxS07pCb1bEW1rsItDU20udTNj5XZVDeNHqO3mUgQhk10B9ccKW/7wYYX
         bgT65NNQ6/i/lTd7BDjyC+ETvi94DGFXQ5czE/jNKYGFr78Hud8NX+1W8dqRX7/wFaUX
         zrKBWP9evUFbSYHT7YrBxAXGa8bTNZaHpxl8XotNzwwDxEQ7jTipH4PywsyeNdRINeUb
         ztMGzYg3Rm21BMzLaaopybks7igut67vYThAP6Nko9IftnPbw+euu8m54gPv0Ld8HgRE
         qsP4XlaniUCwci5krcclmg5xb5xasOVi0aeI2rH0nXvC1y8VUvJr74qhNBjbPtai+sVP
         uurA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8suBYAm3Zd4AZ9SNJ+UeQbMRVa9pu1Uwc0Ft1fj2TgE=;
        b=Zb/jM3oFi7hlpvMlz+LD0F/akCOu0f0gtxjMWA7ifnA6YGpYw69KjMbNkANrtwbSVT
         s7Dk+XhQXj58tpBxN6vOlwolta2U53+afgqMsuBR3rsJVuDIhtXpxYqTyJhLjsrzFVHF
         04TGsVazRZ4NS35D2pgWi841HtP/ide34wm6bmOEue7VHtczBCuL39sPq/TPx7iyus0S
         vNnvDoy/p6U2ePze7iKrEbavLyfzrdEYUHY1S/PouTnt+JVCNujvRIEn9zY35Slw1CK6
         3LqRMQx4zORpDTlob6TVvzfBLnfKse/HEQ3O5V0948lleSs95XOAqpC9/SRm16T3LQVn
         N4FA==
X-Gm-Message-State: AFqh2ko8RsazLzEsLEgX9c1fjjM1/UEhQoPGj7DPoghvA9LNcc+Mfxdr
        DKue+ySKAkDAyur1mBQpaHqGPQ==
X-Google-Smtp-Source: AMrXdXvQOe5YGsUULTNDaCBeYjsTjOhjRXjv42oqvh2YZy9JVHuRB7gVafQIt1lS2meYPpzGxyHTdQ==
X-Received: by 2002:a05:6512:3f1b:b0:4cb:2aa:9e58 with SMTP id y27-20020a0565123f1b00b004cb02aa9e58mr17898668lfa.13.1673417044601;
        Tue, 10 Jan 2023 22:04:04 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id b7-20020a056512070700b004cb143f7391sm2524607lfs.258.2023.01.10.22.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 22:04:04 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 01/12] dt-bindings: clock: qcom,gcc-apq8084: define clocks/clock-names
Date:   Wed, 11 Jan 2023 08:03:51 +0200
Message-Id: <20230111060402.1168726-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230111060402.1168726-1-dmitry.baryshkov@linaro.org>
References: <20230111060402.1168726-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Define clock/clock-names properties of the GCC device node to be used
on APQ8084 platform.

Note: the driver uses a single pcie_pipe clock, however most probably
there are two pipe clocks, one from each of PCIe QMP PHYs.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/clock/qcom,gcc-apq8084.yaml      | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-apq8084.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-apq8084.yaml
index 8ade176c24f4..d84608269080 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-apq8084.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-apq8084.yaml
@@ -25,6 +25,30 @@ properties:
   compatible:
     const: qcom,gcc-apq8084
 
+  clocks:
+    items:
+      - description: XO source
+      - description: Sleep clock source
+      - description: UFS RX symbol 0 clock
+      - description: UFS RX symbol 1 clock
+      - description: UFS TX symbol 0 clock
+      - description: UFS TX symbol 1 clock
+      - description: SATA ASIC0 clock
+      - description: SATA RX clock
+      - description: PCIe PIPE clock
+
+  clock-names:
+    items:
+      - const: xo
+      - const: sleep_clk
+      - const: ufs_rx_symbol_0_clk_src
+      - const: ufs_rx_symbol_1_clk_src
+      - const: ufs_tx_symbol_0_clk_src
+      - const: ufs_tx_symbol_1_clk_src
+      - const: sata_asic0_clk
+      - const: sata_rx_clk
+      - const: pcie_pipe
+
 required:
   - compatible
 
@@ -32,11 +56,31 @@ unevaluatedProperties: false
 
 examples:
   - |
+    /* UFS PHY on APQ8084 is not supported (yet), so these bindings just serve an example */
     clock-controller@fc400000 {
         compatible = "qcom,gcc-apq8084";
         reg = <0xfc400000 0x4000>;
         #clock-cells = <1>;
         #reset-cells = <1>;
         #power-domain-cells = <1>;
+
+        clocks = <&xo_board>,
+                 <&sleep_clk>,
+                 <&ufsphy 0>,
+                 <&ufsphy 1>,
+                 <&ufsphy 2>,
+                 <&ufsphy 3>,
+                 <&sata 0>,
+                 <&sata 1>,
+                 <&pcie_phy>;
+        clock-names = "xo",
+                      "sleep_clk",
+                      "ufs_rx_symbol_0_clk_src",
+                      "ufs_rx_symbol_1_clk_src",
+                      "ufs_tx_symbol_0_clk_src",
+                      "ufs_tx_symbol_1_clk_src",
+                      "sata_asic0_clk",
+                      "sata_rx_clk",
+                      "pcie_pipe";
     };
 ...
-- 
2.39.0

