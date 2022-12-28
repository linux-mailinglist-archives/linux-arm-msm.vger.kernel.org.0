Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F050B6585E6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Dec 2022 19:52:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231932AbiL1Swq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Dec 2022 13:52:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231316AbiL1Swo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Dec 2022 13:52:44 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31C7A15801
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Dec 2022 10:52:43 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id u12so13591281ljj.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Dec 2022 10:52:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dRV0cBSMOk6ezUoovi34JcMJADM3mKVE6I4nfLkmye0=;
        b=DoAzLdgLNokGuQx7nwDRWrbaKG387ksnTCGckuAkN0SV+Z1VD9+W08ayH4Da9S9bq/
         c5b8Sijx+VK5DQLSLM9gRh+ObCUWfsOB3KCYpOFqdq4mW8xwQCaQ9Q/qe7OaNaKEOTdJ
         y8eKeYZQvvg0QPqnLCILH42U/Z21HsKuxSgGPYuAEMs2GgctO4NgvLtOoUZHFGwg9A68
         hMIBAiKncFYMN6yx89iT/EKUL+MLXbOtMR1lFQE3S+fAiZ5iShhNQNaeaVQtTH0+7Vui
         W4TFyYGRqQNonJJykPzY2IslD+zQ+k1/sYOswI/VBAOqRjZZirX8So3aA6/7v0jJCrSX
         92Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dRV0cBSMOk6ezUoovi34JcMJADM3mKVE6I4nfLkmye0=;
        b=wPMO2SDdoDH9/jDhckfCTFU8PMUBkx5ZxVehPP8riqsYLYXuyOUyyeclDa2LohHxx9
         XhQYulq4iBbPxr5/zfNPksbseTw6AB4DQsEZe1kU4vx6g2UDCgDMrhjS35as13XQM61K
         M2t3swksrTuCubFLFgdFFWNzl5JbeacnXg/nG/sf4XOwvxfJdhg2qHAY3FBtk6qXH9Bj
         WzOxTdv6WJy4YBRND5X22F9kG5f2WspFslyb37YfURni6xvL+mZjsltNA+xj3eiUdpJm
         c/GeJm0KlN+pzynNiFhECw8vQJUI0PnZwTXqaQmk5mw4h47S/yvu81GMxgGvV6nnyYof
         yQWg==
X-Gm-Message-State: AFqh2kpRsTS8bJsDuH0RjWmxn5k6ZAD2SK3va3SNU/7lLX3CNmoR1DYy
        mAr8cmgP08uWE1AykTArpAfs5U4q6k1qOKT49sw=
X-Google-Smtp-Source: AMrXdXuVj5Q132g/sdP+a+iwNrSRTPv1A/0QhI9POTWd6iin7ELnIxxRwYfdFwEBupMmF+L8Q0AmTw==
X-Received: by 2002:a2e:bcc7:0:b0:27e:34cf:17b1 with SMTP id z7-20020a2ebcc7000000b0027e34cf17b1mr7342606ljp.29.1672253561488;
        Wed, 28 Dec 2022 10:52:41 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id s7-20020a2e83c7000000b00279d206a43bsm2031893ljh.34.2022.12.28.10.52.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Dec 2022 10:52:40 -0800 (PST)
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
Subject: [PATCH v2 03/16] dt-bindings: clock: qcom,gcc-sdx65: drop core_bi_pll_test_se
Date:   Wed, 28 Dec 2022 20:52:24 +0200
Message-Id: <20221228185237.3111988-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221228185237.3111988-1-dmitry.baryshkov@linaro.org>
References: <20221228185237.3111988-1-dmitry.baryshkov@linaro.org>
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

The test clock apparently it's not used by anyone upstream. Remove it.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/clock/qcom,gcc-sdx65.yaml         | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sdx65.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sdx65.yaml
index ba62baab916c..523e18d7f150 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-sdx65.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sdx65.yaml
@@ -26,8 +26,6 @@ properties:
       - description: Sleep clock source
       - description: PCIE Pipe clock source
       - description: USB3 phy wrapper pipe clock source
-      - description: PLL test clock source (Optional clock)
-    minItems: 5
 
   clock-names:
     items:
@@ -36,8 +34,6 @@ properties:
       - const: sleep_clk
       - const: pcie_pipe_clk
       - const: usb3_phy_wrapper_gcc_usb30_pipe_clk
-      - const: core_bi_pll_test_se # Optional clock
-    minItems: 5
 
 required:
   - compatible
@@ -56,9 +52,9 @@ examples:
       compatible = "qcom,gcc-sdx65";
       reg = <0x100000 0x1f7400>;
       clocks = <&rpmhcc RPMH_CXO_CLK>, <&rpmhcc RPMH_CXO_CLK_A>, <&sleep_clk>,
-               <&pcie_pipe_clk>, <&usb3_phy_wrapper_gcc_usb30_pipe_clk>, <&pll_test_clk>;
+               <&pcie_pipe_clk>, <&usb3_phy_wrapper_gcc_usb30_pipe_clk>;
       clock-names = "bi_tcxo", "bi_tcxo_ao", "sleep_clk",
-                    "pcie_pipe_clk", "usb3_phy_wrapper_gcc_usb30_pipe_clk", "core_bi_pll_test_se";
+                    "pcie_pipe_clk", "usb3_phy_wrapper_gcc_usb30_pipe_clk";
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;
-- 
2.39.0

