Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F19156B1E00
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Mar 2023 09:27:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230132AbjCII1O (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Mar 2023 03:27:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229706AbjCII0y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Mar 2023 03:26:54 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E1B6E20FD
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Mar 2023 00:24:54 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id cy23so3693823edb.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Mar 2023 00:24:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678350292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=54M36yJXtJywDqa3soejZEJ58/SqIkXRqwDM4xMj3tU=;
        b=J9gD5OKW64LqWoKLplDJq9sO4bxFw7M2PB2X137MWe2HC68kzicZA5zT+AQCjKQc3D
         IU9ZwHCPhFrUN09RO+92qFKGkV8j+FRgQWB6VqU0zMKhLDuCxcoQ+Q5SsPkaD/3qx0RW
         YL6IN8BAqwb9DCtg6Xp8LeaATU8bQfz/YC1h0dE48E7/HxY6ftnnvv6P6xLxbwYVkwVc
         emm2pECa9QXWWGiytLPTQqnQlcfbBPxmNDSpujN9JV51JQrRV2rzP0dSrr0OuyaKtjUY
         bSHyo54S9ZrpKNd+Wypw/U4570O48Y97X5e0TrogJkRVymKLN9Py62xMh/CDe1qbbw9h
         bDKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678350292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=54M36yJXtJywDqa3soejZEJ58/SqIkXRqwDM4xMj3tU=;
        b=TQ0UD2+Ru9cpxu1RGCIavFcU0OJIJUOfb7Uy+G1AOgxt9/E8lqZa2oWZ2/8cYLIk0g
         CaE5s2Ntv+X7xOa38aY6HsZqXoOPVHhwOE0QcRtGuRntMKCITVlTZ1YkyPXUxCxdFT1S
         HPsV7nKOkTdVQvvyRUcGw+Cz3HZDbQpKE8UF5/+md4ZK535tSXYLu8V94vrsEVHJreQ1
         GA3LOew1BwBelzBmcA9clR9FiJgLGwdhMXmKv+/c8vnsHpvfrJflXrRk8IMp99X9Moa6
         RoCdtBQypQ7Su7EqFvcUIqwBHNfZSgAVjBr+wHnrx44v8Q+5hBXxv9nMm9AfTV/mcOP5
         uwOQ==
X-Gm-Message-State: AO0yUKVgOJhd8m0J+WlwDkD/2JvhfI+GCHO0Ftqath3N5CVcfYpJanp4
        CSAka0ejDk9hWUUpM2H0VUHxxQ==
X-Google-Smtp-Source: AK7set9s7R/y8X/f0+7fhBT+wR9XtEeQ0fhtymoT0DuE/Wm6X1wC9Op5YKcVUacv9vnANA8xokgGLA==
X-Received: by 2002:a17:906:434c:b0:908:6a98:5b48 with SMTP id z12-20020a170906434c00b009086a985b48mr20284099ejm.40.1678350292465;
        Thu, 09 Mar 2023 00:24:52 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:7ee2:e73e:802e:45c1])
        by smtp.gmail.com with ESMTPSA id k7-20020a170906578700b008b904cb2bcdsm8662276ejq.11.2023.03.09.00.24.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 00:24:52 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/3] dt-bindings: remoteproc: qcom,sm6115-pas: correct memory-region constraints
Date:   Thu,  9 Mar 2023 09:24:45 +0100
Message-Id: <20230309082446.37362-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230309082446.37362-1-krzysztof.kozlowski@linaro.org>
References: <20230309082446.37362-1-krzysztof.kozlowski@linaro.org>
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

Qualcomm PAS devices expect exactly one memory region, not many.  Also,
the memory-region is now defined in device specific binding, not in
qcom,pas-common.yaml, thus also require it in the same place.

Fixes: 838c558bb8bc ("dt-bindings: remoteproc: qcom: Add sm6115 pas yaml file")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml        | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml
index f5d1fa9f45f1..1ac5b99b2fad 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml
@@ -32,7 +32,7 @@ properties:
       - const: xo
 
   memory-region:
-    minItems: 1
+    maxItems: 1
     description: Reference to the reserved-memory for the Hexagon core
 
   smd-edge: false
@@ -44,6 +44,7 @@ properties:
 required:
   - compatible
   - reg
+  - memory-region
 
 allOf:
   - $ref: /schemas/remoteproc/qcom,pas-common.yaml#
-- 
2.34.1

