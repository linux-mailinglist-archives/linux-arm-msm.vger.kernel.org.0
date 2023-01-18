Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D5926711A8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 04:17:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229509AbjARDRX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Jan 2023 22:17:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229483AbjARDRW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Jan 2023 22:17:22 -0500
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 728484FCD8
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 19:17:21 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id vw16so16934830ejc.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 19:17:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YuXEVz5lZVRCSDGEzKxtDD/QLwFWgZQYOz3RZgwz8FQ=;
        b=qplg+wrjhIH6EEdvDp1srATPDxbgXUvXY9aBqyjZkSL7ZHb8SLbi1Y4b6hzEG1GHSf
         2+4IoimjE4KNYJKVQANsWfbUOhRoIHgV9+7wWRB7h787Rse787N8I3OwypipHduAeIma
         uLz4ACNFGt5gBZFgNZxrC563Nvp1qg6jyUPW3wu0yJcZ2tTu9E6mfiMJ3GV53Lz5PWSU
         Lv9yo89HTNXhGHcbUBXvOwAet1GMreDBeyQcRf9xSEWpT+ep1XgIuCoaxk3to5xMRBuf
         DMtKSrfbkRz+3ozcA0V+IOrzcxUb7HfmrPLlVjtfz7XJTK9IR1TgYKGUtZ/liu5irGnd
         zgMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YuXEVz5lZVRCSDGEzKxtDD/QLwFWgZQYOz3RZgwz8FQ=;
        b=ul/QgpECm1F7BCvnsMZCroqIYRD5LMLhuFAZkK9KPKO/lno6aXjomBULM4p167rpfF
         7xZLEamAZQdxM0c7RSWxoA9dkGcRXTCQuAclQo+PVJMcXeQEY9g0Vqr4nY/Z0fBOaD0/
         YyS5ziIl4fwKGoiImBDdSPbmTIK04fOqj6y17atNezn0LajwUM233wZziLEW6h+LJES+
         JBpbN+kGITejU9w+P6u35xn0INnTActN2EcDmi292H4cwvTqZYDfAlZKaR7qCOt22RNY
         8oQyBrfOqWsDRbzJ3RyYwNEOtIo9PkLoiNs5hidRleHr4oW0rwl2gspShi6rZBWkAYWc
         FQxQ==
X-Gm-Message-State: AFqh2kqKygWSr83Lm2b34B+/lxS95LJfFV/uD9EepeVJs6e+fqpN1/Cl
        ovavpf5vNe5BRxQHC3b2d8kJ3Q==
X-Google-Smtp-Source: AMrXdXuKcerAn5f2RBWfmyK+LN/3rQh8i7OXoydjvcr98jXhNoQjDuIph3i03ywLQyfjDWIK+zD5Hw==
X-Received: by 2002:a17:906:fcb3:b0:86f:8ccb:5d0a with SMTP id qw19-20020a170906fcb300b0086f8ccb5d0amr5353941ejb.36.1674011840044;
        Tue, 17 Jan 2023 19:17:20 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id 2-20020a170906210200b00876479361edsm535639ejt.149.2023.01.17.19.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 19:17:19 -0800 (PST)
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
Subject: [PATCH 1/4] dt-bindings: display/msm: add qcom,sc8280xp-edp to list of eDP devices
Date:   Wed, 18 Jan 2023 05:17:15 +0200
Message-Id: <20230118031718.1714861-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
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

Add qcom,sc8280xp-edp to the list of eDP devices, unblocking `aux-bus'
property and fobidding `#sound-dai-cells' property. Also since
sc8280xp-edp, overriding sc8280xp-dp, will contain 5 reg resources, drop
the reg contraint (as it will become equivalent to the top-level one,
requiring min 4 and max 5 reg entries).

Fixes: b6f8c4debc00 ("dt-bindings: msm/dp: Add SDM845 and SC8280XP compatibles")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/display/msm/dp-controller.yaml         | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 3e54956e57db..efe4257c031f 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -151,11 +151,10 @@ allOf:
             enum:
               - qcom,sc7280-edp
               - qcom,sc8180x-edp
+              - qcom,sc8280xp-edp
     then:
       properties:
         "#sound-dai-cells": false
-        reg:
-          maxItems: 4
     else:
       properties:
         aux-bus: false
-- 
2.39.0

