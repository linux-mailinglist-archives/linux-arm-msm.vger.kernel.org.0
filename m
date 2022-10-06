Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 788F55F640B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Oct 2022 11:58:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231603AbiJFJ6e (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Oct 2022 05:58:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231558AbiJFJ6S (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Oct 2022 05:58:18 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 690BA82D16
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Oct 2022 02:58:17 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id y23-20020a1c4b17000000b003bd336914f9so594723wma.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Oct 2022 02:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date;
        bh=nih6K/iOH4NWZI3ARD7h83GsYopkCtps47Aq4lvZzNg=;
        b=JMM7jKixtXMGtXillk7/AJX3GCp2mUoK5P3vRzS2xwfMcMRSmqa2d1B4g4SO9GTFuA
         MYOarfSDLmml7ydx+hdZ020adhnILXB8ZIpWJ1IJY63mM3m2oFaJqos8Wtco/SO7TFgX
         dUNwXTj+PePl9OJpNpv4oT/EXM83QwKyT6iWOpkCXEHpabxdJhilbH0n7RbMaOxpagtr
         H5e3A0m4YGqjNi80/DHT5JG5NpHy5wvQ9mRhTPzcha2hLQZWzyhJr8g8BN9/VgwjufrJ
         dlNdpn2kewsvO73R0/UKyPC8FYZd/FU2n7esXtRpYvXGzwD73coNdXCXkEH5f2001Ewx
         Z3cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=nih6K/iOH4NWZI3ARD7h83GsYopkCtps47Aq4lvZzNg=;
        b=1iwtJ5gGCfTPPdjKOf7X69ffMu2fvZHC/6+bkcbO7LQDrxdwyF9SFE2vjyxk54hpff
         m/IghLKGmMML01P7v/v3G8vxOcVpZC3y08F4An64zueN5QqmrqkXWNEbizJ1iwIz4AtI
         MQcSRqLCOFFHxUOeUzyATzp042ag+ZQN117URzwcYQd8FI2sHvZHYISl9yCXfsB8f1Ru
         Oy/y6UINCvxmkGyTo1UMEnbPuYPh9eMliGJEYUxl6OLeJ2n8QZVBrySUfhWhZuUeoP88
         P9WUtjZk0nu+hwhaU3imYBgj7RC466NijaQ+uoPOTL5rdnedsaFoF0rRzln6l1/wWKfC
         ZraQ==
X-Gm-Message-State: ACrzQf2N+tx45Pa2UmMEUK+eRT62JuVqoPNMuQYZKZfToQM0FJnVEeLN
        D+Tpg9ak/648PtfLdwkmQlNljTTFWXj5LkkN
X-Google-Smtp-Source: AMsMyM4sjs3gknfpIApTwoNfjyL3v4ulJKadJBMHIxN8VrMkfyx7G2Cpnnf9LaLRw2P974Z5/miUcw==
X-Received: by 2002:a05:600c:4209:b0:3b4:fb11:3b8b with SMTP id x9-20020a05600c420900b003b4fb113b8bmr6077837wmh.144.1665050286353;
        Thu, 06 Oct 2022 02:58:06 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id q11-20020adf9dcb000000b0022ac672654dsm17935603wre.58.2022.10.06.02.58.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 02:58:05 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Thu, 06 Oct 2022 09:58:03 +0000
Subject: [PATCH 6/6] dt-bindings: soc: qcom: ipc-rpm: refer to
 qcom,ipc-rpm-regulator.yaml
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221005-mdm9615-pinctrl-yaml-v1-6-0cbc006e2a30@linaro.org>
References: <20221005-mdm9615-pinctrl-yaml-v1-0-0cbc006e2a30@linaro.org>
In-Reply-To: <20221005-mdm9615-pinctrl-yaml-v1-0-0cbc006e2a30@linaro.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>, Lee Jones <lee@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     linux-gpio@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
X-Mailer: b4 0.10.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Now we have bindings for the expected regulators subnode, refer
to the right qcom,ipc-rpm-regulator.yaml bindings.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,ipc-rpm.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,ipc-rpm.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,ipc-rpm.yaml
index d416950189d1..d18200d5c5b5 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,ipc-rpm.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,ipc-rpm.yaml
@@ -47,7 +47,7 @@ properties:
 
   regulators:
     type: object
-    $ref: /schemas/regulator/regulator.yaml#
+    $ref: /schemas/regulator/qcom,ipc-rpm-regulator.yaml#
 
 required:
   - compatible

-- 
b4 0.10.1
