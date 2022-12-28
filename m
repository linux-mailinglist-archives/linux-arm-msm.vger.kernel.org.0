Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D6CF6576CF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Dec 2022 14:11:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230389AbiL1NLR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Dec 2022 08:11:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232023AbiL1NLQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Dec 2022 08:11:16 -0500
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3966411818
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Dec 2022 05:11:15 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id tz12so38268119ejc.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Dec 2022 05:11:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yIvj6CLKAGPbCzVViYil+tBlKneBu3LIA/3PrIIlxx4=;
        b=DRQ24GnDGTJCp91rOOPpd4MtC7ukbeiX4EMp7aaJqkpCm2c4YkEhnQWvzuFja3CjCQ
         xI8qWXKmegyowqhNcU0SRG6LG/3GTHzQVxYleWpeTMVFfvPr7egRzwtTTWtdAUS8KHRO
         szlcy8xQTiLOXFeK0pyHFjIIfvlKZynD1wkg68WL3IGYgSEl67eXeV9d/EvA/oEkJV/1
         GMf0IFUgvhrMLi2dGnhjqq2drvfm7x3zG1+No14q//ZhIWA14kk3GPU+MXbaNLB38jvA
         JNIql6COciiep7X4T8M1aFIBNsgChvXrzni5hhVsOsLBBV5BarNDFp4VFceKo2y4iE8s
         N6hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yIvj6CLKAGPbCzVViYil+tBlKneBu3LIA/3PrIIlxx4=;
        b=cmhHWyp6vJ5E2TNXxeLaQwxQUpmjewqVdCed9fLJDFB5ivWNZiH1djemgliVh4l1Nv
         2eKVNAb3wOsqxNsmOfesLqut9YqWlqM90Y7zfcl2G9LCB/UrD6VtBKE57eLLYR/X3vDc
         oDqKbk8I7ZUrBiwQImsMuU5JcQcmWmeJe1qn/OH+Oi/Dd2VTXwGErlcYLekHdixAWaTn
         hRez7YAWoh44XjwdyDJh3zAAyHGHovjJvXKx+nhfZOpacE7W9PkQYrNZBNezIMCoMJPh
         Kg+bAhyQ7yl1lX/vt+rLV+UDc5pyeuZnkz/V0tr5mNvtSCLc1Gl7xKYEzgrthnlD8+qS
         TI2g==
X-Gm-Message-State: AFqh2kobWtKEAodyypcvGinLsdV6+YOJfCpHsxlpLuDrjO+jJAMCZRcD
        RTPJnNqUk4UUkIzTZS6AcM3j/g==
X-Google-Smtp-Source: AMrXdXvpJhSvObvLScgLH6nL9n1cKt22C9piLD5CYaGNWqas2AZDzHDkw5CZGHCuOLlqJ7typZS3DQ==
X-Received: by 2002:a17:906:6b96:b0:7c1:4bb2:f62b with SMTP id l22-20020a1709066b9600b007c14bb2f62bmr21246963ejr.27.1672233073820;
        Wed, 28 Dec 2022 05:11:13 -0800 (PST)
Received: from planet9.chello.ie (2001-1c06-2302-5600-85f6-04b5-1651-3b6c.cable.dynamic.v6.ziggo.nl. [2001:1c06:2302:5600:85f6:4b5:1651:3b6c])
        by smtp.gmail.com with ESMTPSA id g11-20020a056402180b00b0046bb7503d9asm7099545edy.24.2022.12.28.05.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Dec 2022 05:11:13 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     robdclark@gmail.com, quic_abhinavk@quicinc.com,
        dmitry.baryshkov@linaro.org, sean@poorly.run, airlied@gmail.com,
        daniel@ffwll.ch, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     quic_mkrishn@quicinc.com, andersson@kernel.org,
        swboyd@chromium.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        bryan.odonoghue@linaro.org
Subject: [PATCH v2 1/1] dt-bindings: msm: dsi-phy-28nm: Add missing qcom,dsi-phy-regulator-ldo-mode
Date:   Wed, 28 Dec 2022 13:11:10 +0000
Message-Id: <20221228131110.213116-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221228131110.213116-1-bryan.odonoghue@linaro.org>
References: <20221228131110.213116-1-bryan.odonoghue@linaro.org>
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

Add in missing qcom,dsi-phy-regulator-ldo-mode to the 28nm DSI PHY.
When converting from .txt to .yaml we missed this one.

Fixes: 4dbe55c97741 ("dt-bindings: msm: dsi: add yaml schemas for DSI bindings")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../devicetree/bindings/display/msm/dsi-phy-28nm.yaml         | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml
index 3d8540a06fe22..95076c90ea171 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml
@@ -25,6 +25,10 @@ properties:
       - description: dsi phy register set
       - description: dsi phy regulator register set
 
+  qcom,dsi-phy-regulator-ldo-mode:
+    type: boolean
+    description: Indicates if the LDO mode PHY regulator is wanted.
+
   reg-names:
     items:
       - const: dsi_pll
-- 
2.34.1

