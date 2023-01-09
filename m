Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0AB64661E08
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jan 2023 05:55:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233865AbjAIEzE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 8 Jan 2023 23:55:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234286AbjAIEzC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 8 Jan 2023 23:55:02 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5814165A6
        for <linux-arm-msm@vger.kernel.org>; Sun,  8 Jan 2023 20:55:01 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id b3so11251783lfv.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Jan 2023 20:55:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DID9COo2nYdAarXKNZ2YWNnEFoeCTLjj4eRpr+otzXU=;
        b=JFKOXyrqCGKt1n2jdk/oQP95R+pLTHiofilXEf0zrvpIGm7uA1dtD+GpX0QXXo9nUl
         M4teUQplHS8NRAPPzBKuDcajxXiJg0GiqMea5bSsjayajdF7n3gMYtaJRCkYkhGjj7zX
         XvGad7N7+dHCcWlN9GYsP/gueVHZXykURyVxeQF+9lnk0Cw2kll44jP0zdDKZq/nq0Mr
         Etoql/Dv/JLWatxCffL/uPivB7I/Wb26MBF66fUTSv+0AqRf5jF+f9090271KyyNsfDz
         mY1EIx13sJc/CGrc6QcXJWEeEcmCVUHJl2Yqpz0ZDnuoEp1bvjEUQa6pj0aWEypvw5rJ
         CdMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DID9COo2nYdAarXKNZ2YWNnEFoeCTLjj4eRpr+otzXU=;
        b=siT1Un7D57riAekmAUvRKueznV2otfcVKKS4fcZ9WDcnSSHfp65hSZqhaDu2VCPRnx
         8i+VVORw/595tDL08pZHRCuX08/F11nwo+Z+iyMCw8DrinDMPMR5HbSCa6Zav52Q4ECD
         gxgdF30na28wN0qkj8Oqj36Qh7a9Z5BBTs38b70hzVkChfsKdxT1Jtwzj6iUvu+zr+lk
         XhqEOuvg29RMWoks/98mhDpz7J4hzd+KdRxYgvsJSuNSlMNBR2yYGbw/x3xfb+B8UFOb
         nwHkuMxakjnciTJexz/wXFyatbRB0HgRBbjYqZgG/n9YdVQMckYvxDExwlrMxeS61moz
         LTdw==
X-Gm-Message-State: AFqh2kq7cdVvhlsi7alGG39x7DtqxIw7dlLcfK7unBvTgEcUwZQTLiPB
        AJT3y8jbIaaWDlFx9OK/5hlpng==
X-Google-Smtp-Source: AMrXdXsF163H4fyf+LIUaMixbRv3n5SksxhxqwQ2uZfZkoazcmt9VWBTcLHEZ+STMU/9PNXpVPlEhw==
X-Received: by 2002:a05:6512:3b87:b0:4a4:68b7:d623 with SMTP id g7-20020a0565123b8700b004a468b7d623mr21040244lfv.10.1673240099760;
        Sun, 08 Jan 2023 20:54:59 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id f21-20020ac25335000000b004b57a810e09sm1417235lfh.288.2023.01.08.20.54.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jan 2023 20:54:59 -0800 (PST)
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
Subject: [PATCH] dt-bindings: display/msm: qcom,sdm845-mdss: document the DP device
Date:   Mon,  9 Jan 2023 06:54:58 +0200
Message-Id: <20230109045458.316114-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
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

Document the DP controller added to the sdm845 display subsystem.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml   | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml
index 300d8f1ac45c..8f60be6147d8 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml
@@ -46,6 +46,12 @@ patternProperties:
       compatible:
         const: qcom,sdm845-dpu
 
+  "^displayport-controller@[0-9a-f]+$":
+    type: object
+    properties:
+      compatible:
+        const: qcom,sdm845-dp
+
   "^dsi@[0-9a-f]+$":
     type: object
     properties:
-- 
2.39.0

