Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8BFB1654AB2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Dec 2022 03:10:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235821AbiLWCKg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Dec 2022 21:10:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235791AbiLWCKe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Dec 2022 21:10:34 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB90924BFB
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Dec 2022 18:10:32 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id m14so3382343wrh.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Dec 2022 18:10:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u+Ok/Y8Pr2ds0xVbkzxTKyFSBfTt/36m9CaPlTa4hTI=;
        b=MrhN4Xb9RiUuzbzu5slyO/DpcQyG5glXnDF/6fqL9FJZMT/5dc2CHnWYXtss5wwPn2
         ckcR8BQ/3elmwT5pBC3a4mf3/Adv99wKrgjZ9dEPMbJoc8bVMj7leoXXLPTtaldcvV3Q
         07dMJ4wwtxmyipd+bHdalaiHQahJM+JPV/dAz7lMU1OQp3Ne9y5wfMMtjlps0w6YqIUj
         z3ZR8mJsgvYejDkdD7B0wNV7uYQbZ+4qHAqTRMWUWAadb8kdcTmrPVKr6Gyennx5r4VT
         cSZYiLEhwi3T2GlyUNEYuS/0vtyn/v19F0TB+RBqGQDyUikwtsQPDwEdzVY4RyFCOms2
         xUwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u+Ok/Y8Pr2ds0xVbkzxTKyFSBfTt/36m9CaPlTa4hTI=;
        b=X5XUk6+6YfuKayyjil8XC+8eLG9P5lAPApKR03M4mxwjNM0or1b8mlmSjfN9jpUpCw
         MiL7LvXxX3J8409I5B4aM9ifhqoEVvUF0kHU2Q/eHg43Nwb4A0wuRDDUy/rjmEOP/+G8
         6G69TNnmU7StAT5qxGTgm2x9wq3wD9i+iovlDPyNqoM2oP9IB+Yv0vOgnUxEof04rmB5
         oE9kiv6mV64NfB8p8LqqgKqoabcvj574vF5tvh0T5zVoAnuClUJqSu5J0SdiOHmApiy+
         TiJb51SLq2NxgEZ7m+rmH8QoNAifLxxyBW9aS8XaxOk86jZVnMjBiqqlWqLTMiN8QW5T
         kguA==
X-Gm-Message-State: AFqh2kpVpJ2yON/n5675JzRp7j85zYy2y4qvKTzDP+JC2FOdZ+WK4E2B
        1UtVJyXOLENesT3uNj8NnJ6/b4rcjT625Yg3hUI=
X-Google-Smtp-Source: AMrXdXuu2FQx7IxvbWNkPzFPFbP1DApQ4G+dhRhfQmOT0QbUCc2Q1fzyKDnhG2hNUyqkCCJ6/z7dag==
X-Received: by 2002:a5d:4d8c:0:b0:241:fb7d:2f15 with SMTP id b12-20020a5d4d8c000000b00241fb7d2f15mr4047043wru.29.1671761430916;
        Thu, 22 Dec 2022 18:10:30 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id j11-20020a5d452b000000b0022cc0a2cbecsm1849725wra.15.2022.12.22.18.10.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Dec 2022 18:10:30 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org
Cc:     robdclark@gmail.com, quic_abhinavk@quicinc.com,
        dmitry.baryshkov@linaro.org, sean@poorly.run, airlied@gmail.com,
        daniel@ffwll.ch, robh+dt@kernel.org, dianders@chromium.org,
        david@ixit.cz, krzysztof.kozlowski+dt@linaro.org,
        swboyd@chromium.org, konrad.dybcio@somainline.org,
        agross@kernel.org, andersson@kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        bryan.odonoghue@linaro.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v6 02/18] dt-bindings: msm: dsi-controller-main: Fix power-domain constraint
Date:   Fri, 23 Dec 2022 02:10:09 +0000
Message-Id: <20221223021025.1646636-3-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221223021025.1646636-1-bryan.odonoghue@linaro.org>
References: <20221223021025.1646636-1-bryan.odonoghue@linaro.org>
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

power-domain is required for the sc7180 dispcc GDSC but not every qcom SoC
has a similar dependency for example the apq8064.

Most Qcom SoC's using mdss-dsi-ctrl seem to have the ability to
power-collapse the MDP without collapsing DSI.

For example the qcom vendor kernel commit for apq8084, msm8226, msm8916,
msm8974.

https://review.carbonrom.org/plugins/gitiles/CarbonROM/android_kernel_oneplus_msm8994/+/7b5c011a770daa2811778937ed646237a28a8694

"ARM: dts: msm: add mdss gdsc supply to dsi controller device

 It is possible for the DSI controller to be active when MDP is
 power collapsed. DSI controller needs to have it's own vote for
 mdss gdsc to ensure that gdsc remains on in such cases."

This however doesn't appear to be the case for the apq8064 so we shouldn't
be marking power-domain as required in yaml checks.

Fixes: 4dbe55c97741 ("dt-bindings: msm: dsi: add yaml schemas for DSI bindings")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../devicetree/bindings/display/msm/dsi-controller-main.yaml     | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 55bfe1101d6f4..8ba61fef576a5 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -137,7 +137,6 @@ required:
   - phys
   - assigned-clocks
   - assigned-clock-parents
-  - power-domains
   - ports
 
 additionalProperties: false
-- 
2.38.1

