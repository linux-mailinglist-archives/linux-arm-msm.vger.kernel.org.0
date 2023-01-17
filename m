Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B01E66D4A2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jan 2023 03:52:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235772AbjAQCw4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Jan 2023 21:52:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235675AbjAQCwe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Jan 2023 21:52:34 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8BD2303E2
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jan 2023 18:48:52 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id o17-20020a05600c511100b003db021ef437so2042354wms.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jan 2023 18:48:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qk0VMlXiPa+i4ayp7VztPQc8wVANge6Uc5ro5vbjwLQ=;
        b=NcVkqEdSSVMg/UN3FPkwG0cLZu6mxh4a/MABS8zd1lO2hTr9mczswJoN0dLNH/kKll
         08w7hYsyMos0yc2l9WflE0gVeIF+ZfUS70xBXQqdA6YHjqWLQFIMTzNSa5aWVJHZWFgL
         KGCV13jfvBTEEeysteiAMP870/V9tVahpUePzh5TgYPwyDbIEXlX7xk0UgtGWpul2GD9
         YIt83CKTJgSHIUTtDCIYTD4EazkBN+vkCD/UW/NgSYg/ws3PUYmrpNKP2pCb+VS8v+F+
         Joane6FQIJDe0OgY+Y+9zkORDnXFnwNnjT6GcdgMF0D4s2ekKL/QPteMMzJtHW5RxG7s
         aNug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qk0VMlXiPa+i4ayp7VztPQc8wVANge6Uc5ro5vbjwLQ=;
        b=0ijaHWDknomGM0CrxtmqAqB8ht+BvY/JDsKhxrW2crWF5Q1bgaq+AyGZ8G29YgHRfd
         ZpLYIGCieY4PSmScqo7H6sYUAoCz2IkgqK+rrHy4IrXQwnMytcWSDx1izCydAutv857Q
         SNxTrg9Mn7IXeNRnPu3GQBn1t9uKshGYQzzSD/qothcS8k0RCJ6Aha9YLfPvhssNi7QH
         hF6Cv7Lq4tWvfCOqv6HpfpEyFiuW8yDHpgwrYZg4fqDj9sWyfBa2QV55G+vDjGATb0uu
         yTFtriMw5FPgXPq7mhmEBUSwIvN1g4Y1kEav25r9lc2w6RyVyFWHrFclUF+5kw4XrkKl
         C/qQ==
X-Gm-Message-State: AFqh2kr0bv0DrlAH5KG2mlHqJLjf7aNtukBiLTMIUvqOr3OEuAvBhrvk
        8OhrxW9lwpDrWb2wwglq98aisQ==
X-Google-Smtp-Source: AMrXdXuPt/jwsJTzS7848FxzhOZaBVAKnyGM+wBkufoq2JR77LRpwkg/pOuouyGgl6AjdYuK0sbCWQ==
X-Received: by 2002:a05:600c:4248:b0:3d9:7667:c0e4 with SMTP id r8-20020a05600c424800b003d97667c0e4mr1404587wmm.31.1673923731402;
        Mon, 16 Jan 2023 18:48:51 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id n7-20020a05600c4f8700b003c6bd12ac27sm39482660wmq.37.2023.01.16.18.48.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jan 2023 18:48:51 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        djakov@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     bryan.odonoghue@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, benl@squareup.com,
        shawn.guo@linaro.org, fabien.parent@linaro.org, leo.yan@linaro.org,
        dmitry.baryshkov@linaro.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 2/8] dt-bindings: soc: qcom: smd-rpm: Exclude MSM8936 from glink-channels
Date:   Tue, 17 Jan 2023 02:48:40 +0000
Message-Id: <20230117024846.1367794-3-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230117024846.1367794-1-bryan.odonoghue@linaro.org>
References: <20230117024846.1367794-1-bryan.odonoghue@linaro.org>
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

MSM8936/MSM8939 should like MSM8916 not require glink-channels.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml
index 11c0f4dd797ce..16fd67c0bd1fd 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml
@@ -80,6 +80,7 @@ if:
         enum:
           - qcom,rpm-apq8084
           - qcom,rpm-msm8916
+          - qcom,rpm-msm8936
           - qcom,rpm-msm8974
           - qcom,rpm-msm8976
           - qcom,rpm-msm8953
-- 
2.38.1

