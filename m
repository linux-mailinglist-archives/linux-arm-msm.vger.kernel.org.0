Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA50B6585E9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Dec 2022 19:52:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232696AbiL1Swr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Dec 2022 13:52:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232777AbiL1Swn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Dec 2022 13:52:43 -0500
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 325B515F29
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Dec 2022 10:52:42 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id x37so10406807ljq.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Dec 2022 10:52:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MuuDeykd0fWyvmdgCKovFBE0sMM/OGwl3dw5AGj6x9c=;
        b=E5EEtHRxumfT6nN4kpWSTts5iN9mXfF93TS57v/567KycZ+2SmwkNTE5z6DsPcXMRB
         kCXzoM/1FiclLZ1n+WYMRwkiNZ3FSm6lcm0lFckRROJaQTe6GNuhGXIKTvfz2EINHgh8
         aNc9gtrncKt5am2uPkG5/UkzOl6IlIXweW0AD4Q70yi0In/pqeQJbAoUf4PYrLJRg1Zg
         gagNEtXepv6KOCtxX/MBeCOHjiJ7IGs1zTpf+Wyq9FKErnAoRkGkFo7f7O7HgdoWMyeJ
         97YH+cP8DeQQ4Oph024maq5iJNU2tnxl+jUWirk25pNwePsIDSikf94PiZuTQ4OcuMtv
         tKqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MuuDeykd0fWyvmdgCKovFBE0sMM/OGwl3dw5AGj6x9c=;
        b=xzd1ysJdd0jtKFRd/xQG7gRdWsx7Ac1goVJnOOt6s+MAvftoOMqSeenTiO0a43ueCV
         VVmAfZbjma5DHBBE+NbwZgI/T14NWiv6i6R1yY779pLbmBUw9eepeTP7GATpHIY9QqZ7
         KxS7/G9hV0Icmcf+trYnXaSE67wwfusJREvSLwGpcNyXgAKVYX5le2PgeMQEd8Ja/FV+
         OLPd3O0M4xxaVXm0ZLnnq/0O8ZXKgTPKcTqHu5+Zpj+dVcexS2UO/QOhv7wtkCNj1R9/
         n0jC5CZJ9k7Ue5DFV1nGjiABnz1AqbZlhskggaMBydZLLA3prk64Rq1zkx49b3DzvdEP
         1C0g==
X-Gm-Message-State: AFqh2kr1Q95Qy86l2htsA+XFztfxsgG4+w7xA/TAU1d8m/iiVAm+7mLJ
        W0E6/j8spsPd863bgVQDlJm2DGqQ6kNqGTWQJ+U=
X-Google-Smtp-Source: AMrXdXu+r3iM1uQ90G2yWnhNeYCGeEvXDj/kYPysaeAPHIhBgdV6QLA9CH5kKItOc5qmaJKTU8qeRA==
X-Received: by 2002:a05:651c:1cb:b0:278:f690:b736 with SMTP id d11-20020a05651c01cb00b00278f690b736mr7965293ljn.34.1672253560448;
        Wed, 28 Dec 2022 10:52:40 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id s7-20020a2e83c7000000b00279d206a43bsm2031893ljh.34.2022.12.28.10.52.39
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
Subject: [PATCH v2 02/16] dt-bindings: clock: qcom,gcc-sdx55: drop core_bi_pll_test_se
Date:   Wed, 28 Dec 2022 20:52:23 +0200
Message-Id: <20221228185237.3111988-3-dmitry.baryshkov@linaro.org>
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
 .../devicetree/bindings/clock/qcom,gcc-sdx55.yaml        | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sdx55.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sdx55.yaml
index 68d3099c96ae..428e954d7638 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-sdx55.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sdx55.yaml
@@ -24,15 +24,11 @@ properties:
     items:
       - description: Board XO source
       - description: Sleep clock source
-      - description: PLL test clock source (Optional clock)
-    minItems: 2
 
   clock-names:
     items:
       - const: bi_tcxo
       - const: sleep_clk
-      - const: core_bi_pll_test_se # Optional clock
-    minItems: 2
 
 required:
   - compatible
@@ -51,8 +47,9 @@ examples:
       compatible = "qcom,gcc-sdx55";
       reg = <0x00100000 0x1f0000>;
       clocks = <&rpmhcc RPMH_CXO_CLK>,
-               <&sleep_clk>, <&pll_test_clk>;
-      clock-names = "bi_tcxo", "sleep_clk", "core_bi_pll_test_se";
+               <&sleep_clk>;
+      clock-names = "bi_tcxo",
+                    "sleep_clk";
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;
-- 
2.39.0

