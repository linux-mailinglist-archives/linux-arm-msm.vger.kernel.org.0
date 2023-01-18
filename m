Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 140F16711D9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 04:24:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229660AbjARDYo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Jan 2023 22:24:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229723AbjARDYj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Jan 2023 22:24:39 -0500
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 291AC521D1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 19:24:37 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id y19so14289543edc.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 19:24:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ec+3vW1T9VybCypq+CSoRlgfeIlNrQ3oQZEGbJKYIC4=;
        b=zAHvllqq6rUVY5iYfOhH98ZC7MciV6bFnK+rqLYh4bRRJQXU97ZrWMQxORJMwyznPi
         BB35MM6SMhAXFT/BohQWOmDJyX6Wh0biF3vMkgekxW/oC/EdJP0EKlCsM0FJvBnqIUvr
         c8eVa3Ox4/7XWmuo3r8A63TuqKO8a+dApNkNlcfPDlMTtJsAwMLsGiarsiF2XfyqW4rZ
         03znCWUFoih1cXMC1gYe9Eefmg2C5HEgcZQbRj1aiExFMRMblTkfDQqYcZHOERuX4gAs
         7eKGdESU8FVWwxNLdsTWmOvS/XjtJDAQ382auxASuIWO33gyE7nCmlLPuVPceRAm544D
         p8vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ec+3vW1T9VybCypq+CSoRlgfeIlNrQ3oQZEGbJKYIC4=;
        b=WsZLkRfSuJVKzIKYv16Yy0eJSTHqixZgW2g/YPBedtP8DqSwP0Ds7eY8pLWfb9QFjA
         XwRcT2QlHEICrjEGV+wlnwWaJRYuBrA/jYcK/TDubUkiGfBeZVOWoZM9VKcAN5+RzefD
         uX/9ahoKZQ/9brDVr86hHcxV7RHxZolnWxgJD2d+p2IR+Y/mgzbkCUP/tv/bFez2DPPT
         v+QlQLdZJfu+9bb2l7/3rSoVkRmD7Z8byLwSbchkU/B5kPY+eoGMarhgFsoDE/S9RegI
         7+SJWDiM/A5GNH0piyPVoVf8rpWY86C1ZL7lLh8f3b3V0o/uPUWWAZmVx7x6B4Hko7YQ
         gnOw==
X-Gm-Message-State: AFqh2kqFmn4LW6gpYY0tGI9zcFrzvY+LCjVB3SNDBKdCsOb7J4aKwk2H
        4E2KcmS5rDpgd8WrT+wBpqq26Q==
X-Google-Smtp-Source: AMrXdXu5gi5ru//W/fWSwPRe4S1umaY4zHYGJpQmH9GsUo17e2O3IClFpdFWvpSftRfWxpfcmdKzuQ==
X-Received: by 2002:a05:6402:2289:b0:498:f82c:7068 with SMTP id cw9-20020a056402228900b00498f82c7068mr4439994edb.35.1674012275649;
        Tue, 17 Jan 2023 19:24:35 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id f11-20020a056402194b00b0048eb0886b00sm4713829edz.42.2023.01.17.19.24.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 19:24:35 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 1/4] dt-bindings: display/msm: dsi-controller-main: remove #address/#size-cells
Date:   Wed, 18 Jan 2023 05:24:29 +0200
Message-Id: <20230118032432.1716616-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230118032432.1716616-1-dmitry.baryshkov@linaro.org>
References: <20230118032432.1716616-1-dmitry.baryshkov@linaro.org>
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

Stop mentioning #address-cells/#size-cells which are defined in
display/dsi-controller.yaml. Use unevaluatedProperties instead of
additionalProperties to allow skipping properties defined in other
schema files.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/display/msm/dsi-controller-main.yaml           | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 7c326f8927fc..b07bdddc1570 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -72,10 +72,6 @@ properties:
     deprecated: true
     const: dsi
 
-  "#address-cells": true
-
-  "#size-cells": true
-
   syscon-sfpb:
     description: A phandle to mmss_sfpb syscon node (only for DSIv2).
     $ref: "/schemas/types.yaml#/definitions/phandle"
@@ -357,7 +353,7 @@ allOf:
             - const: iface
             - const: bus
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.39.0

