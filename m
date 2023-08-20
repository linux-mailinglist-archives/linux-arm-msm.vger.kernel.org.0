Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D1C60781CDF
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Aug 2023 10:10:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230111AbjHTIKt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 20 Aug 2023 04:10:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229676AbjHTIKq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 20 Aug 2023 04:10:46 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D67E9D2
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Aug 2023 01:05:48 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-4ff9b389677so3399476e87.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Aug 2023 01:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692518747; x=1693123547;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0FBq4YTR+0Eb6sKOYr6I2bt6IPGuv4RF8Oj9v7H5bKY=;
        b=FHCJb70x6bgYq7af5DTY604C3eCpKukIc5sgg7haKJ4ua8rxdXJuvyocaw1yuQcugD
         0gDj8xVX2Cobul2yuq5N9QJs86IDZgiiAEJAzhND9QIr4a/6N8QL3GxbEKR2md8A3kIG
         8rEtxyNh7KNArT4z9Ec6c+B69BH+I7bYmKnFOjJ//SpYsWIwJnAkivpgv5vynzEy96KU
         0WsmLZDrWzgvPsc72k4ZqgUVBorcvCGQrUbnctVv2zXznuodrTaIgXV0H63DUHu1JbkE
         sabbZdDLBSVBv06/UJnd421Oi8mURK6cKtmhPpBcYpD1oIuI+ov/mdMCRbwDMXvYRsQR
         Q8Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692518747; x=1693123547;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0FBq4YTR+0Eb6sKOYr6I2bt6IPGuv4RF8Oj9v7H5bKY=;
        b=AKHexC5KBgh9VTkvDyTi6jpcxiHmxtG6J+ElzWwwnZdmhWD0p8BsnuZ79rqLTrhhuj
         niEc08NrMrZL91GeavK5QlO46JSjYP52kRjMwJundj6n8mYeLDGR1EbsDBfMb/zqA3NG
         KdzoIH5fLGkQ/r4wBlJJAxyNJiFl8FzCh9lv1vIHloy0Fs40eUQV+An2kutSRzPasdII
         +VwlHtyBKdcl+i7ZmNTmXAIhKQWxCl3/rcNumYeZ+TfZfyi+yMShtAi3YH5jplh98EHA
         0cL+DbJq8VJZwfszkkldgWaLIeILiI1erkOpgsJDj0XyEav6I1zyzBfRD7VCLNEp7V8w
         d8sA==
X-Gm-Message-State: AOJu0YwSZqdh5FjzEUdS292JfB5K3nkJXnTdftD0h7lgTKQMm+bOoG0t
        iNonyYpLXwBgXzAweTVXN+W7ow==
X-Google-Smtp-Source: AGHT+IHVSKGunxzyjKs8EiRSL/Ef32A4iymXe6Uj4pISjyjeo+J1tZB61PFmnIeT4X7LrodP9G30VQ==
X-Received: by 2002:a05:6512:3196:b0:4f8:5d2f:902a with SMTP id i22-20020a056512319600b004f85d2f902amr3217400lfe.60.1692518747125;
        Sun, 20 Aug 2023 01:05:47 -0700 (PDT)
Received: from krzk-bin.. ([77.252.47.198])
        by smtp.gmail.com with ESMTPSA id b1-20020aa7df81000000b00528dc95ad4bsm3256338edy.95.2023.08.20.01.05.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Aug 2023 01:05:46 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: display: msm/dp: restrict opp-table to objects
Date:   Sun, 20 Aug 2023 10:05:43 +0200
Message-Id: <20230820080543.25204-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Simple 'opp-table:true' accepts a boolean property as opp-table, so
restrict it to object to properly enforce real OPP table nodes.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/display/msm/dp-controller.yaml         | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index a31ec9a4179f..f12558960cd8 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -80,7 +80,8 @@ properties:
 
   operating-points-v2: true
 
-  opp-table: true
+  opp-table:
+    type: object
 
   power-domains:
     maxItems: 1
-- 
2.34.1

