Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 47BBE505F0F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Apr 2022 22:55:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347883AbiDRU6Q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Apr 2022 16:58:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347856AbiDRU6O (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Apr 2022 16:58:14 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09A071B78A
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Apr 2022 13:55:29 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id d15so13291478pll.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Apr 2022 13:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=D0Pjpfn2h0yHA4TyFo3s+oy60CYDgrzpwwB8+O7oCMY=;
        b=HvgHMUy3tMeM5vAlg+/qjER3cYlHYMvZqF9VwrgEXtvDAfHEKW/r6IBuA3bHr1gRel
         PqaEiBr525Rez57geXplrTu07ozMeSXXu+UtO3uj+qY2Ga4MlLr0XTjKA4UAko6YEmaM
         Y8X/wMzNJgMKkoolA0LzjTe7z8rDMzTRYDdN8p8pNGyqKlBenybP7l4ZY4U1o5ynUxos
         0lbplO8t3UgNNBBRp6BnElDw/Ejp83Ol9F+yAQPkf+GcrZJMKef96dFcEBj5weJLzNWO
         5Bd+qWwozOxL+T2F6BOTtGKTSKEa3nWbqh7xzKdWTBjCgynK+EKzw3tKO2cj3zl0fs6J
         63tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=D0Pjpfn2h0yHA4TyFo3s+oy60CYDgrzpwwB8+O7oCMY=;
        b=HYjEr7ZQp9zBq01QHApo41kkEd6p5KnNE1Pje5Df/sAcRS466HVakF10SqJFb/4+tY
         Ybb13uAzkelkA5uVnc2Q1AjNBftWcTZx0Oze/xiW712WY85m3Wt0AgeLjqwHeihS7w1U
         jEMDw2XtbKW8WONXtnqR0FLOnuRVZjDTndeiU0k6q2ba4N8+SKqVeUc2GnqmNP6JmYbq
         LC/WNofOmtC/3Yi6svBtprvNdR2zOeXLGcD3RUZC1PQn3jOecFHBcVHtjkphEYc3Z2yJ
         crZ/12f7wd5PYUGnXsQyGQKvD+ghHzRhxDsnYTOcnaqXI7yJ274IKKAk+ZE9om41uQ7R
         fqRA==
X-Gm-Message-State: AOAM532HnztIdhP68F3FTbWDX5qag9uLxVPTKdgnlOTjC2dlEjWMVbmC
        TDPNPseCVwsTGq57cyELbfu/I3Bi7tamJg==
X-Google-Smtp-Source: ABdhPJwl2UU7NwRV0JPA/XtwgOxGT0J8cWxLkO0H3u0pjHgvrIEnU8T/NUk/ebucQrcnzR3lddNO3Q==
X-Received: by 2002:a17:90a:e103:b0:1cb:a0b3:805e with SMTP id c3-20020a17090ae10300b001cba0b3805emr20183027pjz.185.1650315328212;
        Mon, 18 Apr 2022 13:55:28 -0700 (PDT)
Received: from localhost.localdomain ([223.233.64.97])
        by smtp.gmail.com with ESMTPSA id q60-20020a17090a17c200b001cd567fecaesm13498859pja.26.2022.04.18.13.55.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Apr 2022 13:55:27 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        agross@kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org, vkoul@kernel.org,
        bjorn.andersson@linaro.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v3 2/4] dt-bindings: phy: qcom,qmp: Describe 'vdda-max-microamp' & 'vdda-pll-max-microamp' properties
Date:   Tue, 19 Apr 2022 02:25:07 +0530
Message-Id: <20220418205509.1102109-3-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220418205509.1102109-1-bhupesh.sharma@linaro.org>
References: <20220418205509.1102109-1-bhupesh.sharma@linaro.org>
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

Since a few boards based on QCoM qmp phy use the
'vdda-max-microamp' & 'vdda-pll-max-microamp' properties to
describe the ufs phy nodes, add them to the dt-bindings doc as well.

This fixes the following '$ make dtbs_check' warning(s):

sm8350-microsoft-surface-duo2.dt.yaml: phy@1d87000:
  'vdda-max-microamp', 'vdda-pll-max-microamp' do not match any of
   the regexes: '^phy@[0-9a-f]+$', 'pinctrl-[0-9]+'

Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
index c39ead81ecd7..411c79dbfa15 100644
--- a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
@@ -90,6 +90,14 @@ properties:
     minItems: 1
     maxItems: 3
 
+  vdda-max-microamp:
+    description:
+      Specifies max. load that can be drawn from phy supply.
+
+  vdda-pll-max-microamp:
+    description:
+      Specifies max. load that can be drawn from pll supply.
+
   vdda-phy-supply:
     description:
       Phandle to a regulator supply to PHY core block.
-- 
2.35.1

