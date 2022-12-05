Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2EB786438EE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Dec 2022 00:04:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234067AbiLEXEH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Dec 2022 18:04:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233946AbiLEXEG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Dec 2022 18:04:06 -0500
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64C355FB5
        for <linux-arm-msm@vger.kernel.org>; Mon,  5 Dec 2022 15:04:05 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id m18so530972eji.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Dec 2022 15:04:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=waK5wVs7Hxj63T++mcTd6rjgYYGu6Rza9RGnKsblQEs=;
        b=EvnuvAkcJxXxc3IwD2eY7PNJvyvrmtHM38ypsJrkVpZLbHetYwUdEg24qXWHLABIRu
         ZjZU0H4MTDU61eM82/+SJrrsiSYIZcLnO7rZSyHznBWWfPD3Sbk+4nkO34GTxQE5wX18
         w26qW2Ah1lVB9VXCKGe3+QxgCM2Qs0pST74j1IaRgotic6wpypTrleqE9/ZeuAjHli92
         HS9YMqlGd30jFUz1SPXbbrYPFPkUU/9SIKvp/LM6lEVk4LwdB1uaY+VNQbe0DKx7e2rc
         F/uELPS8LhOrRaHjZyRBFCObKeCyetfI2zVSPjGIzTjw5ORoXezjEoockweeobIbRg6E
         bM0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=waK5wVs7Hxj63T++mcTd6rjgYYGu6Rza9RGnKsblQEs=;
        b=qINGnzeAbqJQYzQBsPwTxmz3kcMwqQYx42NEnZhi0MWsntS39B1dPyS5fLIRuNglBc
         PfhWZLitAFSpKiHdAHsq7Er21x/ZR51e+PeDk8DzoHy1g7VfAaBYs5rOtDP/zni/1rgf
         Qve+ka3ictFdLl28H07JW3oavf+UVAPORHzuyKrn14z0lSbGPk4zQXCORMPqI96UqZ77
         lbGGs/byvMHmI0zm5HmJXJGI9793VvwyEvWMlSoHwPpJ2pjJVLIzQCEAhroGUliTzLwG
         76gomoRWRkgYMx4v+LwuwoQyj1EFKMjc1/rjd60OPe/WyW5mnE6gFB1XO/qpcRxYJ4UY
         8AGg==
X-Gm-Message-State: ANoB5pnUxIbKQZ41LvruXpZugnbzHp9TfMB6dOVUvNIMHQHQglF7XVBx
        BhJINaPOgx8lR5HR8ah/CoZaCg==
X-Google-Smtp-Source: AA0mqf76itTxA4PyQ8w8/yBb2mNDMV01nDDUjtqh1LykSkt/ERfxXS8/mb7ifYqZgzh8BMirqZH7yA==
X-Received: by 2002:a17:906:1445:b0:7a1:6786:444f with SMTP id q5-20020a170906144500b007a16786444fmr54124879ejc.409.1670281443869;
        Mon, 05 Dec 2022 15:04:03 -0800 (PST)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id kw26-20020a170907771a00b00783f32d7eaesm6655642ejc.164.2022.12.05.15.04.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 15:04:03 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 01/10] dt-bindings: arm: qcom: Document SM8550 SoC and boards
Date:   Tue,  6 Dec 2022 01:03:33 +0200
Message-Id: <20221205230342.494923-2-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221205230342.494923-1-abel.vesa@linaro.org>
References: <20221205230342.494923-1-abel.vesa@linaro.org>
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

Document the SM8550 SoC binding and the MTP board.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 463509f0f23a..4f0aa06402bf 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -68,6 +68,7 @@ description: |
         sm8250
         sm8350
         sm8450
+        sm8550
 
   The 'board' element must be one of the following strings:
 
@@ -819,6 +820,11 @@ properties:
               - sony,pdx223
           - const: qcom,sm8450
 
+      - items:
+          - enum:
+              - qcom,sm8550-mtp
+          - const: qcom,sm8550
+
   # Board compatibles go above
 
   qcom,msm-id:
-- 
2.34.1

