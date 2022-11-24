Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A087636F2C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Nov 2022 01:48:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229631AbiKXAsa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Nov 2022 19:48:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229635AbiKXAsW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Nov 2022 19:48:22 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE941C68B8
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Nov 2022 16:48:13 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id v7so273803wmn.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Nov 2022 16:48:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tY9zIcCRGEu7zo0/qER9MM7m6z693FsbNLfr6+dvuHk=;
        b=HioKk5uWFil0Wena7oP7RdN+LDvb0Fz4Cr8QBLcParrvhSNKE4aP3CD5Cr2E8W5GsP
         /JBhSfjTQLHz93Ti5CeJytS8yS6J9dHiozFEtkZou9sEOm4Nb8tvC8EFEFaClK7nmsRO
         oSJXj2MHtlJDqUWeibWa02dCTVKGEtRco7qxY2loBi9IFWdAy/i8570iGgLtXqUO5aWw
         VRV99cZNi4fRi3zfhv0EMeItbYCeVeTf9gnZel4hsM0xhaM1gMiNT7AGaMEXIdiD7KyI
         FhllxQ5N/+3TZVLiUznkmblAYM5T2nWemUti7w3sP5ryRD7m7t79Y89Ds7/3BZzv7U9h
         gyIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tY9zIcCRGEu7zo0/qER9MM7m6z693FsbNLfr6+dvuHk=;
        b=jEajLvvTdYPdMxu6/A9Ei2TLKLXNeSVl5+vNg9HtteMoQz4B9oEH19qN0BhWYZzQ7u
         wX1/9txVsNP9oSXhBRNjzV0VRUoHcrtKV5+ase8LgCcxNuXi0KxiiJpi1Ka/us94qi5B
         AzQQav81R5RruMAqiqceOD1wVFdPZOOqczK8lOrcLeVcZvp1/WqysHgTCqAl4xX45nrN
         Bg4hvP0K/WbXLDsFgF30TmNGJKC2LI6X67n6HB21EdjFWHjGgVVdm0xXdXVRF08Ns1lJ
         V3iPKC8sNfh73ofBUcBKCqjS7GN4Cax3glxbZOPUiQxZ5TmZraryhppbJ0XAZf3npM6u
         xEIQ==
X-Gm-Message-State: ANoB5pmgxzJLu+DfrCyCkuQRkgYcL0WAYBYdEDM9YhJREcb9vomay4aL
        atEKEyytBmxKsq1YNQmMvW2C1q1nUCDBVQ==
X-Google-Smtp-Source: AA0mqf7g4djkFPxv22hQv3S9vFbRPNPg6xb2eSD1P08WLUS7G5q4KIZhgyvhyz/SXAZRY2dgSh6cRA==
X-Received: by 2002:a7b:c3d5:0:b0:3d0:306c:f7a3 with SMTP id t21-20020a7bc3d5000000b003d0306cf7a3mr4849498wmj.128.1669250892155;
        Wed, 23 Nov 2022 16:48:12 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id n38-20020a05600c3ba600b003c6bbe910fdsm5245076wms.9.2022.11.23.16.48.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Nov 2022 16:48:11 -0800 (PST)
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
Subject: [PATCH v3 06/18] dt-bindings: msm: dsi-controller-main: Fix description of core clock
Date:   Thu, 24 Nov 2022 00:47:49 +0000
Message-Id: <20221124004801.361232-7-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221124004801.361232-1-bryan.odonoghue@linaro.org>
References: <20221124004801.361232-1-bryan.odonoghue@linaro.org>
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

There's a typo in describing the core clock as an 'escape' clock. The
accurate description is 'core'.

Fixes: 4dbe55c97741 ("dt-bindings: msm: dsi: add yaml schemas for DSI bindings")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../devicetree/bindings/display/msm/dsi-controller-main.yaml    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 88aac7d33555c..0c09b9230b7f5 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -40,7 +40,7 @@ properties:
       - description: Display byte clock
       - description: Display byte interface clock
       - description: Display pixel clock
-      - description: Display escape clock
+      - description: Display core clock
       - description: Display AHB clock
       - description: Display AXI clock
 
-- 
2.38.1

