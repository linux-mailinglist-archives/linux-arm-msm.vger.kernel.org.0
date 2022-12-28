Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E17F76576F9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Dec 2022 14:33:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232799AbiL1Nc4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Dec 2022 08:32:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232924AbiL1Nct (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Dec 2022 08:32:49 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7423DFCCB
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Dec 2022 05:32:48 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id bp15so23607930lfb.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Dec 2022 05:32:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P5tQYKHsVwL/3X4f6mO9KIe9nSmBA5SG36mL/sBnxuw=;
        b=na6QyVRATYBMiNz087xeFTe7v2cua/oUnl8H1bqwp2YmSGtcIIx3eJl/erHrtDa7+b
         0ZABJX/x1ofdyg+CHAQhqgoCkVY0YYmGUWcsS/YRbcqYp8b47f7VvLUO7Dvo3UrDIAn7
         fvT4hoIxkcywRRPzUW56O5mJeuzbR0W0jmCyqRCBsx8Dn8vJjBVfO3UiH0JdYjWtSNjK
         +1dSw1fets98Hk24k507okbkGMPcitQz5FLEpIwgbGtNSu2bLl1pM1B9S6ZzXap7emQa
         HZd8sNofZO0iJ7wlsPQHYlTTrrVoLF2rkL+60/9/j6ToFRn9MXyIkOf7raMnNlD/2vQE
         8Lfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P5tQYKHsVwL/3X4f6mO9KIe9nSmBA5SG36mL/sBnxuw=;
        b=Zb0s/n34hRqxCq/IbN1OAJ7iPCHB1zkJBRohE9MnVrDOEH8BaCpDkhJXjWQ6QqzgS/
         tVgndm7tGVSf34OX9S/C5hMEX8LdfBRQN1ZRmv+6khONH5BxXgPlUCvS+ooYPIJ/MxYI
         qErte/9AlspjFhMaDSzRNIScvzXzK4AKqtWlo44ITyPweQ0IOEDtrbvecgolfGKu9R4r
         m58lPgfYHoQcs0CjQTkktTw8RnzdSLeVMppm47aY8IKRsFcl+p5BRdtCYjSLtXGwwm2n
         aVJlWC42wJiWBPnHnK6nL0nOKG5FV09AuWySQIySJcrK5PeNT7/PBjqed4SKkKl/13Bj
         zuDQ==
X-Gm-Message-State: AFqh2krAvjm/fd6cITQDvyntuI4o5jJfbD3vMqhqn1+dnAgZBqxCxvTl
        8JvZ7vkjPuqxAmRzD3zwejKCNw==
X-Google-Smtp-Source: AMrXdXvRP13dyff/tGHbpUgrZ/XgLdURx4/UVf0cgGrU7t87mCdALTKFlCKBK4vAWR1fRH0lQxsBHw==
X-Received: by 2002:ac2:5b41:0:b0:4a4:68b9:66dd with SMTP id i1-20020ac25b41000000b004a468b966ddmr7248572lfp.40.1672234366871;
        Wed, 28 Dec 2022 05:32:46 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id d7-20020ac241c7000000b004a47e7b91c4sm2613876lfi.195.2022.12.28.05.32.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Dec 2022 05:32:46 -0800 (PST)
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
Subject: [PATCH 02/16] dt-bindings: clock: qcom,gcc-sdx55: drop core_bi_pll_test_se
Date:   Wed, 28 Dec 2022 15:32:29 +0200
Message-Id: <20221228133243.3052132-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221228133243.3052132-1-dmitry.baryshkov@linaro.org>
References: <20221228133243.3052132-1-dmitry.baryshkov@linaro.org>
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
2.35.1

