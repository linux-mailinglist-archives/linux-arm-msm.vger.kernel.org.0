Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04113655FBE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Dec 2022 05:22:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231615AbiLZEWF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 25 Dec 2022 23:22:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231585AbiLZEWB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 25 Dec 2022 23:22:01 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7828421AC
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Dec 2022 20:21:59 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id b3so14708114lfv.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Dec 2022 20:21:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LS3CzouQUqu+qUJZ1aw23AQkTMax8Vw7vAt7vyr9HR4=;
        b=x5pNBQgIdwhZAUWicZ16n0Px8dJbH6togfjisI5qTWsN8WEXvkrDdonh0Jq+drhLBb
         KgTqvmxkb/pwsvECLJsLZxGPjCJZRPPePVHonLLQJ62v6iZ2ce/I6v8h3rU5adfNzv/G
         w9cV7bo/y23DWG3kaqFoEpKqgQGBOedqNWvUut0x/vLWX5pr05VE4V38oYgzMDHc2kb2
         trxDWr0sroDjmQVwRRRq0TF+i+fB/Gra7kqE0nBlv6odbIOOmQEwUUNr3/h/JO3Kj9uk
         O8Mhl0eAv2Rw0lxgXgDfHLoLrUb2zYZOIepvoP7W0480U++WvZeTwBio5QNsANXzB+qP
         HhUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LS3CzouQUqu+qUJZ1aw23AQkTMax8Vw7vAt7vyr9HR4=;
        b=7mZVMus4SC3ALVGMub1bxfy+z1a6wGAaxIQITAWd1kGjmQAAONP2ZwaxLWD6oSEcJj
         eNQsYohMooF3Hl2ys5kbC2b3q94JaZjhKNSTai3X4CZ9QEQr4Bm+qL5upqQxdsXwNBRX
         x5otCZlYKcX6OZ1w7kG03e8ZdACjPF7MClnDv1zIL1CUYF4SFEgNh9PckdhGWX6dLPV9
         D/FjFTYbvAeTzWTaBaNQoLuaqYguABStHUPcuCodhQ9zJ97cFAWHQychywE68ZVxkWj3
         XiLnjDEmRzQMGAJC8gOXHH5b40lcqYuPwwwWoWZGN555kn87yJlXlh1gEb5qZX9dwuwu
         oQFA==
X-Gm-Message-State: AFqh2koCjDCSNkOfSEo2CtapP47R+FPxHvfqK6PvzugqNxqIZ7kMlXMr
        SDvWMqtbiJw3UZwtWk4egAIN8g==
X-Google-Smtp-Source: AMrXdXtta8bOQY5LLSAWhWXH/c+JujT8KDWBQh2m7ufqH8Pr9kDoXHwDRCbzXEg/X1Dk+NCoNMw39g==
X-Received: by 2002:ac2:59c4:0:b0:4b6:f716:e832 with SMTP id x4-20020ac259c4000000b004b6f716e832mr4653973lfn.5.1672028517867;
        Sun, 25 Dec 2022 20:21:57 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id o9-20020ac25e29000000b004b4b5da5f80sm1641129lfg.219.2022.12.25.20.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Dec 2022 20:21:57 -0800 (PST)
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
Subject: [PATCH v2 03/16] dt-bindings: clock: qcom: gcc-qcs404: define clocks/clock-names for QCS404
Date:   Mon, 26 Dec 2022 06:21:41 +0200
Message-Id: <20221226042154.2666748-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221226042154.2666748-1-dmitry.baryshkov@linaro.org>
References: <20221226042154.2666748-1-dmitry.baryshkov@linaro.org>
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

Define clock/clock-names properties of the GCC device node to be used
on QCS404 platform.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/clock/qcom,gcc-qcs404.yaml        | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-qcs404.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-qcs404.yaml
index b70901e0d5cf..b2256f81b265 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-qcs404.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-qcs404.yaml
@@ -20,6 +20,24 @@ properties:
   compatible:
     const: qcom,gcc-qcs404
 
+  clocks:
+    items:
+      - description: XO source
+      - description: Sleep clock source
+      - description: PCIe 0 PIPE clock (optional)
+      - description: DSI phy instance 0 dsi clock
+      - description: DSI phy instance 0 byte clock
+      - description: HDMI phy PLL clock
+
+  clock-names:
+    items:
+      - const: cxo
+      - const: sleep_clk
+      - const: pcie_0_pipe_clk_src
+      - const: dsi0pll
+      - const: dsi0pllbyte
+      - const: hdmi_pll
+
 required:
   - compatible
 
-- 
2.35.1

