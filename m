Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 310805619E0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jun 2022 14:08:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234269AbiF3MI4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Jun 2022 08:08:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233674AbiF3MIz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Jun 2022 08:08:55 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 126D0205C1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jun 2022 05:08:52 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id q9so26988156wrd.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jun 2022 05:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ep1P6XTEaNexZkYvrMILNzV0+nB7s8j8xxQKFiKCkDY=;
        b=S4AfW7peDmO0EaxFy5FO+eirXPDcekVZNcBYSKJovu4k6tn8S5q5i6LIEJCm1MqJTi
         kAPHski5fwgglMwM15fGoISZgEhnpQv2KWG+MUWwYq+6Y4wxnOaGlEZzsihmznkRofnY
         H2hv/iuskUHAdzB0vpWeCVL7SPPS/1XFA1A2DJQ2ozAyt7ZwbDwkWmPwTAEaD9H8Uyvw
         baf1CZBzY16C2nLwo/kuHVJvSuS+43jHLtsl6QCv8wATbaaFLuTprc2GwMiwuJVhT4Qh
         ialNz9wDnepcTnPQUugR4wtbw1Y56m3+d9VX+XmcNeSXkXSuOLobf1etTS579hldonbt
         P/cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ep1P6XTEaNexZkYvrMILNzV0+nB7s8j8xxQKFiKCkDY=;
        b=xCASIQlUsTewsI0eSABU5pOpQowZgc/aoO8lx+Dayr9Hoj/6+GEzTKI/zIAI0TGIG3
         fvQ0+55rPuEKenEj0NqTzuaexMBbHewB4YEY259Run9gk0yM7JX054iNsTMDFtPDVpwl
         8mF01oE/CBWIybdCsssIe2zS2BrP8VJKwSrrSZyuZmcFXRt5wO3Q3RZybm/xc4L25unX
         xo4onByXAmVRIALtD9rfEQwRh/kOWQvBe3GdLPct0uHoiNA0CFuYVDczpJR4JtsSZ+dQ
         +YgyjM4Yn7D27BnT0OyKCe+TUull9M5p3Lm9UhZaJIn79CRU2YRvhxx9O0nIaG6KRPP/
         5vJQ==
X-Gm-Message-State: AJIora/oy/9Ss3TW2aHCQcvDukREAViW8YCvJKf8OSCyIWRbvan48kpy
        pB42XiSVN7YOowUqoOoGirGPMw==
X-Google-Smtp-Source: AGRyM1vDMAgZbp7JXmzOGvCCpcaX+CS9YGuecoWNWTHwFWjrmB4Ec+v67bqswhRJqQqPUfhb0pkp8Q==
X-Received: by 2002:a05:6000:1147:b0:21b:93db:701a with SMTP id d7-20020a056000114700b0021b93db701amr7868034wrx.447.1656590930621;
        Thu, 30 Jun 2022 05:08:50 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id m1-20020a7bcb81000000b003a05621dc53sm6286532wmi.29.2022.06.30.05.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 05:08:50 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     robdclark@gmail.com, quic_abhinavk@quicinc.com,
        dmitry.baryshkov@linaro.org, sean@poorly.run, airlied@linux.ie,
        daniel@ffwll.ch, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     quic_mkrishn@quicinc.com, swboyd@chromium.org,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, bryan.odonoghue@linaro.org
Subject: [PATCH 2/7] dt-bindings: msm: dsi: Fix operating-points-v2 constraint
Date:   Thu, 30 Jun 2022 13:08:40 +0100
Message-Id: <20220630120845.3356144-3-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220630120845.3356144-1-bryan.odonoghue@linaro.org>
References: <20220630120845.3356144-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The existing msm8916.dtsi does not depend on nor require operating points.

Fixes: 4dbe55c97741 ("dt-bindings: msm: dsi: add yaml schemas for DSI bindings")
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../devicetree/bindings/display/msm/dsi-controller-main.yaml     | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 717a5d255ffe4..101adec8d9152 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -137,7 +137,6 @@ required:
   - assigned-clocks
   - assigned-clock-parents
   - power-domains
-  - operating-points-v2
   - ports
 
 additionalProperties: false
-- 
2.36.1

