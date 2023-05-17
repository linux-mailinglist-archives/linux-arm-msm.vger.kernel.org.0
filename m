Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9433705D04
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 May 2023 04:19:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231685AbjEQCTA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 May 2023 22:19:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231860AbjEQCS7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 May 2023 22:18:59 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD4963A87
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 May 2023 19:18:57 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2ad89c7a84fso1356471fa.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 May 2023 19:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684289936; x=1686881936;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jz3z44BI7g+ZmvQgxzmcrsNHfKROiTCAupO35cRRnoc=;
        b=kClaBUy5lYVkbTQ4Y1cUJwNbIfWweEZ9YpHHoXgU0YAabya48bWQJ40fOFY8occH7R
         iUB537yrAKyH8y3/CZ35khah+4shCszE2vw8LGliDpoRT5ERpRRuqG9SpIX62FlqxasE
         8AJkq8nNQfzYEihmiNM85u3oaaKAZy3FguBd13dlM3v+CIETv/2BvrvvzXrVeWhAzIKs
         9lXsNIFCACfT69BlQ5jKdewnUKK/Q9u+2A2ny73nGHLR/l9zCOuO1L056nZgFbbuRc+Z
         7akF67a/qZiybKXtnhzhAwFAzs8wmgMBmLMN5pLR64GRNeIUC2oxF6/zVOYSsB9FZgHe
         YJiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684289936; x=1686881936;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jz3z44BI7g+ZmvQgxzmcrsNHfKROiTCAupO35cRRnoc=;
        b=Qq4XWlvIPoKrRSbRd6hNH444JSrhYGh01ilbp10ZEloRalXKtKYZgPu+c0yv1LRnp1
         kx6XmVe7aOlNev9xoqaN6Z7OL7IMkcJDObAeNoHIkL9tUxGDRTD5/+jHn38Y81PbzYlx
         xBg3tPcYH23NsHPgG61lU86ye7DHh8LCT5YN7GZ9w7lEjqdlPofKJNhqAcQRryBnptFz
         z5Kw3arUK31W5KlrgAqIjz/Wm6F/HtWXO9iskQPlWBPwLEpfs5orr8wsnRnIXHlp9O6F
         xuA2/afEn3iuzm3qHl9iAw0T9Uj8eHnVfNClKoYpK13eRbfig4yU4TO98D4DruC5qeCU
         ADAw==
X-Gm-Message-State: AC+VfDxJoAZJ0lrX8BJRZmV3Pt9gy4syT4xz/L7L9VIj370JH2zN1/Ks
        NHnsdKDhq7C4LRQi6HnO+n6dnw==
X-Google-Smtp-Source: ACHHUZ66dOMCy0XMY0FXupx0/9rdyz37oDv9BaNAMlw1txb6SKgIFfXhT/CSzr6/Wir6weBJvgNNvQ==
X-Received: by 2002:a2e:3e08:0:b0:2ac:767c:ae14 with SMTP id l8-20020a2e3e08000000b002ac767cae14mr8096551lja.19.1684289935902;
        Tue, 16 May 2023 19:18:55 -0700 (PDT)
Received: from [10.167.154.1] (public-gprs529629.centertel.pl. [31.61.188.30])
        by smtp.gmail.com with ESMTPSA id z22-20020a2e9656000000b002af01da6c67sm384232ljh.32.2023.05.16.19.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 May 2023 19:18:55 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Wed, 17 May 2023 04:18:49 +0200
Subject: [PATCH 1/2] dt-bindings: cache: qcom,llcc: Fix SM8550 description
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230517-topic-kailua-llcc-v1-1-d57bd860c43e@linaro.org>
References: <20230517-topic-kailua-llcc-v1-0-d57bd860c43e@linaro.org>
In-Reply-To: <20230517-topic-kailua-llcc-v1-0-d57bd860c43e@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "Borislav Petkov (AMD)" <bp@alien8.de>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1684289932; l=955;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=+mECFcNGWfDIiv+m+e4NFJpbpPzCAtKBP5iEoJkWFJE=;
 b=t3vQgRkUriq5xl5T/CjwoBBUauqUfLsRKPULgh8X7ioEfzBYhNw0iUT5FNdZEQihgTiSD5Rva
 OprF4TwyDHzB5BeGxYNfSuMznWbDpTY8gyrTP9HSDQCX2NRww3xkUPP
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

SM8550 (LLCCv4.1) has 4 register regions, this was not described
between its addition and the restructurization that happened in
the commit referenced in the fixes tag.

Fix it.

Fixes: 43aa006e074c ("dt-bindings: arm: msm: Fix register regions used for LLCC banks")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 Documentation/devicetree/bindings/cache/qcom,llcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
index d8b91944180a..44892aa589fd 100644
--- a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
+++ b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
@@ -129,6 +129,7 @@ allOf:
               - qcom,sm8250-llcc
               - qcom,sm8350-llcc
               - qcom,sm8450-llcc
+              - qcom,sm8550-llcc
     then:
       properties:
         reg:

-- 
2.40.1

