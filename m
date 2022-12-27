Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9A0065666D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Dec 2022 02:32:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232542AbiL0Bca (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Dec 2022 20:32:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232371AbiL0Bc3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Dec 2022 20:32:29 -0500
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8CB22AFC
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Dec 2022 17:32:28 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id e13so9915790ljn.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Dec 2022 17:32:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1J+JLW+JOrxXoy4HXkqu5YJ4mlU978iZ0LW4LiFN3dM=;
        b=i2mBXemUB7BENkLv8GJbobhnUVlQmuP08CQ8PuFJLKOkBpVrIrxXc0KwMwPrcdkoXC
         wprmwlcLozYhibtBwlAx05MvzboJbTW23USWOpRVf/1SQ607Z3Gos7QolC1qW83KMFEA
         torArT6XxOq430vEaiJLXFhIcCpuOKkoeQ9jqdALN8R+C3gD08A9ZUwOxW6U2HcsyORP
         30sqGcNl+BMMzrR5LXUWk5BlbVMxLhSFI731QXH8wQONjVBaXE8Hk54KI1kYt0rRsfJ5
         DbxJW/IBRksYG4Ges37gNf8dnZ1ennm5VXpEZhoxqGB4vzpP+5Sx4Kv+i3ihGwoMrTRP
         34dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1J+JLW+JOrxXoy4HXkqu5YJ4mlU978iZ0LW4LiFN3dM=;
        b=NMxQ2rnCVCyU8QPnn0hvN9On5HFNNsnk6a8582UZBu3NCaFTjqf9Ljd8RRQRB4HnUW
         3bQ5j4qMUE6JazHKxIB+ZbvPEAJ9K4lWVh4xWpW7rcWPQE5YsZmsHsWm9eita6RX17+V
         D80gIg3BanosM2RXGrU9AYtARrh+lukuU+gXHhQlfdfszcEV6XzQC7n5tGPzLNxnobjM
         BbP34a15WoARD63vN900jMLfUno6Pj1iBxPBOQ3v40Z6rOPkjIbCiMLghvMY1x5JBKHl
         7ihKylgnuJnxsnqO9e/UcX0odZw33pWPiiJvXPP+A4YO9i6HR1G7Th/Xx1u31ACdycDk
         3unQ==
X-Gm-Message-State: AFqh2ko8U4vF+XiVFnXnJR06fMD2m0IEmZx3KHCKZ+YDr8Z761MwP/Cq
        aZlgSDXPyPxEpRxZ1+PTXx84ag==
X-Google-Smtp-Source: AMrXdXvizx5puQ1MceYv0WdD3Y/xFwj/iiK/sA5BbkJRedRnaGJimmFTdjLEDfJ2rT90wcChKngcQQ==
X-Received: by 2002:a2e:95d1:0:b0:278:eab6:7523 with SMTP id y17-20020a2e95d1000000b00278eab67523mr7683699ljh.37.1672104746989;
        Mon, 26 Dec 2022 17:32:26 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id v6-20020a2e87c6000000b0027fbb12aa53sm674752ljj.20.2022.12.26.17.32.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Dec 2022 17:32:26 -0800 (PST)
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
        devicetree@vger.kernel.org
Subject: [RFC PATCH 01/12] dt-bindings: clock: qcom,gcc-apq8084: define clocks/clock-names
Date:   Tue, 27 Dec 2022 03:32:14 +0200
Message-Id: <20221227013225.2847382-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221227013225.2847382-1-dmitry.baryshkov@linaro.org>
References: <20221227013225.2847382-1-dmitry.baryshkov@linaro.org>
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

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/clock/qcom,gcc-apq8084.yaml      | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-apq8084.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-apq8084.yaml
index 8ade176c24f4..02a856f14fbe 100644
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
 
@@ -38,5 +62,24 @@ examples:
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
2.35.1

