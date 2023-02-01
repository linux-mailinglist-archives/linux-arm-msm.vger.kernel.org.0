Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B1ED686A08
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Feb 2023 16:21:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232156AbjBAPV2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Feb 2023 10:21:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232253AbjBAPV0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Feb 2023 10:21:26 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DB847D9E
        for <linux-arm-msm@vger.kernel.org>; Wed,  1 Feb 2023 07:21:18 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id q10-20020a1cf30a000000b003db0edfdb74so2585920wmq.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Feb 2023 07:21:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LgMf41rQRnpfSO16TfNaM4asZfPKKcxkyDK6JrIdSHY=;
        b=sDPbCH9a4tYZ3zR1ztISMGXawM4AYviJBCRH2M6rJ7ItisZXeupM27wcGx4h6QeM2p
         iadobtP3AEeQ+i/s9IfOgoA3XIq7eQ8s36/TgeCs+Z+dl5ra+Hm8iFEHiGTOmV1zHpT4
         gUVHmQLJwJX1K7ccAdxQ3eFfjdqI+/RYYNeDjv1iOZYO0MJ0AdZHWjyBGMYpFXMuqztG
         cTl8oWIBXNtwmkhDca7ULQBk52ey8ZA9kSWQKbdJ4FQU+madcAG1rLRLMThLS092OeVj
         cV6oKePdQHaVheQk+hXxu/PgCVl2qxbLS8/NuB1K4SHBGTd52W4AZJrnBUl/LkkyxbgM
         oSoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LgMf41rQRnpfSO16TfNaM4asZfPKKcxkyDK6JrIdSHY=;
        b=qABZ9XMgf/hbrYWlVSwPmnqDuWdsDb6VdcX8CMsmWuW4XZrX1F2uK9cYutsO4MXSgN
         37d0cSih5A1UNjnH2iAu7u5j5equmztUO7XodvLr+2WzbfCqoETX9zl8HFVJn3Q54Dlr
         b7ekSq2n8cNyD7W7dEt/TTLobG1O45RMgS9EO+W45FfbUjMslMPXiw29uiFhwn9oHtmw
         Y5hE1ERvHgZkkXbrlh8WxwcwT+UQDL6T++NAAb4+3Zko8P8j2JrytXInajlVROjq1CUU
         qYIWie1qV4oozvusHDWCxDNdAxCLv77C3XNFuBNTE+8s0qMDzrYl8DVVmZs2WntMoNzL
         Y+LQ==
X-Gm-Message-State: AO0yUKWbB6izVTctKlO010XpWO4cTL+TK6uVPb/NsyAJ825ekUavjN1T
        JCcN9PWqqXo0KJVKmsYwQCjx2jzGFeK1Xv4N
X-Google-Smtp-Source: AK7set+Q9T4oseeyWKQwBg/d9CJwoFikCw5pS4/g+6Uwd+rTCHgqsRDJB+0/f8qxAcFJw/RUeB8jLw==
X-Received: by 2002:a05:600c:3b0f:b0:3de:1d31:1048 with SMTP id m15-20020a05600c3b0f00b003de1d311048mr2328769wms.29.1675264877062;
        Wed, 01 Feb 2023 07:21:17 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:d64:a4e6:40a8:8e69])
        by smtp.gmail.com with ESMTPSA id j19-20020a05600c42d300b003dc53217e07sm1893120wme.16.2023.02.01.07.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 07:21:16 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 1/5] dt-bindings: firmware: qcom,scm: add qcom,scm-sa8775p compatible
Date:   Wed,  1 Feb 2023 16:20:34 +0100
Message-Id: <20230201152038.203387-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230201152038.203387-1-brgl@bgdev.pl>
References: <20230201152038.203387-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add a compatible for the sa8775p platform's Secure Channel Manager
firmware interface.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index 4193492ba73e..fd3c787e44a8 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -39,6 +39,7 @@ properties:
           - qcom,scm-msm8996
           - qcom,scm-msm8998
           - qcom,scm-qdu1000
+          - qcom,scm-sa8775p
           - qcom,scm-sc7180
           - qcom,scm-sc7280
           - qcom,scm-sc8280xp
-- 
2.37.2

