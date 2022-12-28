Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49B61657783
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Dec 2022 15:09:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232646AbiL1OJY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Dec 2022 09:09:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230012AbiL1OJX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Dec 2022 09:09:23 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02272C75F
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Dec 2022 06:09:22 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id g13so23746461lfv.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Dec 2022 06:09:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e4j1qGCEoGtKCI0wCRT6rOlwoDi/wlt0pDciUU2bxHI=;
        b=aH2o4vsdxPeZTdl2rooIpROLJR6U8vYZVwpfy5nJSxcJ3EfbkoRlpovoJvEefOOuu9
         BKvmKyWluut4CURswwF9a8WNvRc93wPvwvTTP8ucc2772PR/uxyCdDfgNghKzbN1kw4o
         Fpex3Lkdb0wYId5v1ADZcuMcRn46iUzjmnqZMUumLOUXghGL4mBXM14huEGQcV5zw0Sg
         psIPvpEO7MDn3IkGx25vUfDRWhd8cKM/GX7xSrT/qTrbdZ3c2XdF74OYvLTjV3DB4Dxc
         ou9sMZMOyXMrYrakZZetmrOkwH+s68+RKZQuLpYt5jzKVRcuCq0W3t6Ofa0BbF6LN9Z4
         RIaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e4j1qGCEoGtKCI0wCRT6rOlwoDi/wlt0pDciUU2bxHI=;
        b=8BAMRPmUhoeVN/lXKWDJISqmp9O+bdH7c2ZVtO6NnoBCv2jWqbAkl8Ve5Y6qMjDV7n
         of3bszu7kayoe8XkQxvGuR7N2xo7e61AIGTwmwavVZ3NxFUW+rd7zdrrOWh5KpzRrH7x
         0Vkumcx9Xg2NFFzLXcfcO+R3CpnfxeIiIuM46oR7ZMc7/X3oCqLt1swkKyVRI4J7CT+c
         UOp5ilc/xxGzx5mLNHrvxvSbpvZEdB/QSZZ97gT7kORgC5zIrX8DsMYuQwZFSij36gqZ
         U1bRSULAEb5t6eIMXw/aOnCDNlPGJsSOpnRUQc3fp2t64na9eblffFozojjV8fmPvJwY
         UT7w==
X-Gm-Message-State: AFqh2kp1xYKQai+66P6uMweieGgL/WOpaAotjD3q/1cDqkoajmUMqADG
        8jd6gMw6YopsLmz0ZR+cahPybw==
X-Google-Smtp-Source: AMrXdXtvOwy9176SBULSVKLT8ia+0BSCLTun/dqYKPkWXFY/GtiOB+PqVu5Q1obszAMr9WRQ7SdSjQ==
X-Received: by 2002:a05:6512:2506:b0:4a7:7d62:2808 with SMTP id be6-20020a056512250600b004a77d622808mr7364407lfb.27.1672236560306;
        Wed, 28 Dec 2022 06:09:20 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id 20-20020a2eb954000000b002778801240asm1935017ljs.10.2022.12.28.06.09.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Dec 2022 06:09:19 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/3] dt-bindings: clock: qcom,gcc-sm8350: drop core_bi_pll_test_se input
Date:   Wed, 28 Dec 2022 15:09:15 +0100
Message-Id: <20221228140917.118861-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
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

Drop unused core_bi_pll_test_se clock input to the clock controller.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/clock/qcom,gcc-sm8350.yaml | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sm8350.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8350.yaml
index 703d9e075247..b4fdde71ef18 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-sm8350.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8350.yaml
@@ -23,7 +23,6 @@ properties:
     items:
       - description: Board XO source
       - description: Sleep clock source
-      - description: PLL test clock source (Optional clock)
       - description: PCIE 0 Pipe clock source (Optional clock)
       - description: PCIE 1 Pipe clock source (Optional clock)
       - description: UFS card Rx symbol 0 clock source (Optional clock)
@@ -40,7 +39,6 @@ properties:
     items:
       - const: bi_tcxo
       - const: sleep_clk
-      - const: core_bi_pll_test_se # Optional clock
       - const: pcie_0_pipe_clk # Optional clock
       - const: pcie_1_pipe_clk # Optional clock
       - const: ufs_card_rx_symbol_0_clk # Optional clock
-- 
2.34.1

