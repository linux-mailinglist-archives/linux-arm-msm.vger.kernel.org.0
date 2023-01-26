Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C6B9F67D943
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jan 2023 00:03:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233270AbjAZXDc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Jan 2023 18:03:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233206AbjAZXDb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Jan 2023 18:03:31 -0500
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com [IPv6:2607:f8b0:4864:20::d32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF89C4F851
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jan 2023 15:03:30 -0800 (PST)
Received: by mail-io1-xd32.google.com with SMTP id s26so1188762ioa.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jan 2023 15:03:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BQXELW2Do44btByeSJJTILU+sMVZVBVp+PBgWqh0iPQ=;
        b=nJw+DUTuQVLOvRz1HyscPLmtu2IerGNqddKZ1FOVXITdFDXtG4bbvVyjK343q2XMAh
         WdJ+QzKGM53Wepv6E3ojcLezJQuvDDeXF+XurvAjhINj8MUU6Gbw1AD3sPBZxK6QCk55
         GoANUAOcWSQY6AwT2VZZ3RUynOJyLTe5cTXA4oPrA6UetAByhIFJXBwfL6NYMMkBT1vT
         Q18mN13y4idZlUrMhKJNSRRQoh/bpRGJyZ9XfDV3IBQF77KMKD1XT+S2nHAMGE2SWAhJ
         ti9RpzbOxyCmNAYwV8fca4SZHUQtCFCPCAeBplogm1hS6zCEUIUdKD/v3fZSRiiHyvgi
         5Q/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BQXELW2Do44btByeSJJTILU+sMVZVBVp+PBgWqh0iPQ=;
        b=hnrOejdhk5pyD/19SLDC4NDGjZhl6Cp43gYkkkGBGIkyc5AmY/uwzWElhkqOyp95fH
         /bRO1KDjjWjy3Ujlt7goKB49rsAs831ALA6e+x3jC6N0igshKHj5qjaWGnwmHtQEBQzK
         gRE3SUo9E4LxxnAq/bYb9YorSSdNypxmifFL5cDF8X0+0sF7mhOdZr7NkxsgEB5ZLv1D
         bDQB1diDsnF+cLRFsiU8vctYZDZmkNSgyS/dRnrq1QUJldnnPbHDyYjIZi48IYYdlJj/
         qjaY7a5i+s/8DnAWhBsGVrVlz+7+4JFlPtPcay1BM7wDHLpnoPL/4V/Skyth7GxAbN86
         jV7Q==
X-Gm-Message-State: AFqh2kqHI3wEtKCjbarsb7hnE0SzFGdzULpiB2xyxLIi7hB8vPz0vRTB
        5QhdxePtpUBM1M7hwWpz5JYfRg==
X-Google-Smtp-Source: AMrXdXvphCStfkzdhH5mxfm28KLN/HVvq8n/TNZxgZ6w6uE1XwDEsrJLYnwCwxvmH3W0q6nw92XU6Q==
X-Received: by 2002:a6b:7210:0:b0:704:d931:45ec with SMTP id n16-20020a6b7210000000b00704d93145ecmr25938852ioc.20.1674774210025;
        Thu, 26 Jan 2023 15:03:30 -0800 (PST)
Received: from eriador.lumag.spb.ru ([194.204.33.9])
        by smtp.gmail.com with ESMTPSA id l4-20020a6bd104000000b006f8b7d869a0sm670924iob.1.2023.01.26.15.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 15:03:29 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Jassi Brar <jassisinghbrar@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 1/7] dt-bindings: mailbox: qcom: add SDX55 compatible
Date:   Fri, 27 Jan 2023 01:03:13 +0200
Message-Id: <20230126230319.3977109-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230126230319.3977109-1-dmitry.baryshkov@linaro.org>
References: <20230126230319.3977109-1-dmitry.baryshkov@linaro.org>
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

The commit 0d17014e9189 ("dt-bindings: mailbox: Add binding for SDX55
APCS") added SDX55 compatible string to one of clock-selection
conditions, but failed to add one to the main schema's compatible list.
Fix this omission.

Fixes: 0d17014e9189 ("dt-bindings: mailbox: Add binding for SDX55 APCS")
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
index 943f9472ae10..36deddca1524 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
@@ -39,6 +39,7 @@ properties:
               - qcom,msm8953-apcs-kpss-global
               - qcom,msm8994-apcs-kpss-global
               - qcom,qcs404-apcs-apps-global
+              - qcom,sdx55-apcs-gcc
           - const: syscon
   reg:
     maxItems: 1
-- 
2.39.0

