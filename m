Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68BFC529A17
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 May 2022 09:02:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240702AbiEQHBc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 May 2022 03:01:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240527AbiEQHB3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 May 2022 03:01:29 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8B7431343
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 May 2022 00:01:22 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id dk23so32796263ejb.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 May 2022 00:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZjLxakQ0FSfyTvd+sfZt6yVLmsWKYw5HJWioql1MULA=;
        b=HQY/XKhJJ47vJX89ecJOgBcJXEoDja7yEsRe5wcWIsu8QaGJ2m1Dcghz5EmgQ3FIJr
         oTJk5/mqhhfdh1m/eCuJ2iffLzQdvYxFus6pfki7RqQ9iRuQFVkglT7vd8zBzqNWMRB2
         7OBCSLwbi8LSEX1ZKUC9ZdHXZ+XfO8o3eTY3UpkllrQvjJWD8e4NTY5jpoKyzVdFQbZc
         0oQJe2FoxJi88Ddlb18TiePefyEKxRuO+uTs+uk9Az/mraqj5tGef4HIyIFnFOR1akoT
         1C9/lt0alTRFJOdRVRSpwCjZhAaKafX4lRgAd0F2FLibWsiG/cmrU/vsiRHMA54O7UPQ
         /DQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZjLxakQ0FSfyTvd+sfZt6yVLmsWKYw5HJWioql1MULA=;
        b=p67gYV8DS49uYfw0kNWQPDoUh2eLrls4p4meCSYtrKb94pfoRyFjGiyr090LYXohT1
         NpSHR585oR9mzxrnlmsuiSJgQz3DhmzAjVpLlv+i36hQ0I4H+cktew9HSaFRbQJiNNL9
         LN6dAfHSNSTzUjoX5ywlx+I2IKQEqla2zn3OTHMq/oTb9Lc2RyDShQM5SbICAEFLfqqc
         0loCC1azkXTzNSXAnIFTugq8JEl1Cr6RprfUphMyd50arO7NWMmFIfuKU+XBntrz4lUo
         7isVKxLVCCNfI+8r4eMwvH/XEqAAJzeWJQJKG3xmUqc897pUReYhcQkusBb1xP7TYh/v
         MISQ==
X-Gm-Message-State: AOAM531Ie9yjF6H0TUOP7crCBRqm84BXzKTJoaR5m4juBkFIENNkeLiu
        qanNpTRTczcBgtvB3zOcz4Jm+A==
X-Google-Smtp-Source: ABdhPJxTPLYtnDAjRe9X2IdxWarT1jcYAAPfoKCM0yNozDKFc/Ek6ZjA+hyu70A8B8uGnhpicokqAQ==
X-Received: by 2002:a17:907:948d:b0:6fa:7f00:ed57 with SMTP id dm13-20020a170907948d00b006fa7f00ed57mr18079250ejc.761.1652770881471;
        Tue, 17 May 2022 00:01:21 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id b5-20020a056402138500b0042617ba637esm6487016edv.8.2022.05.17.00.01.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 May 2022 00:01:21 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 03/12] dt-bindings: remoteproc: qcom,adsp: add interconnects
Date:   Tue, 17 May 2022 09:01:04 +0200
Message-Id: <20220517070113.18023-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220517070113.18023-1-krzysztof.kozlowski@linaro.org>
References: <20220517070113.18023-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

SM8350 ADSP Peripheral Image Loader already defines interconnects, so
document the property:

  sm8350-hdk.dtb: remoteproc@4080000: 'interconnects' does not match any of the regexes: 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
index 810ef9d2bcc1..6e1fdfe91043 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
@@ -67,6 +67,9 @@ properties:
     minItems: 1
     maxItems: 8
 
+  interconnects:
+    maxItems: 1
+
   interrupts:
     minItems: 5
     maxItems: 6
-- 
2.32.0

