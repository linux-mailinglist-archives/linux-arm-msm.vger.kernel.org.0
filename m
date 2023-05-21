Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9440F70AFF6
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 May 2023 21:36:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229563AbjEUTgl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 21 May 2023 15:36:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229571AbjEUTgk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 21 May 2023 15:36:40 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B1AFDD
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 May 2023 12:36:39 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2af278ca45eso28014661fa.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 May 2023 12:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684697797; x=1687289797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3c6yMNCBo2Th5nKj9JcDZUyMz8f9ppKaXvygn50ATHs=;
        b=RI0O9gknU0lpz2ZQiYQ1kJ3pzREN7UhSGCBX6mEyjoTK/5OQWgl+DvLDmLr2oF1acI
         a1Lwjo1lrfOyGoCVVtc45Azpxf3Px93tPvhBrVI7guoXv7nup0lNu5TGQ0cTz2PHWKM4
         +v4Z/PT2Iv+eEx00qZCjTX5EXyF+igC8cyr/SoJHQMLIDV5mt6ZDAjs0kOvEMII0OKA+
         yoMVfUzbo+Q4LyoPXXeaxf+Zu75ls9Em5WpfPHJQLel6qf53JA7DQ/YYzvjWp6QRtZrt
         97K1ta/WDhlcT2q/w2XsxoZbi/BvyyGtOoahjbXNEZoueazkbU/V55I+0hd6AL+ROr4y
         q3ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684697797; x=1687289797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3c6yMNCBo2Th5nKj9JcDZUyMz8f9ppKaXvygn50ATHs=;
        b=BP4UjyA6FLcNrdvdQWYncYE6l2a61xFd7SlAI41vgUvOPEzDzNZ6+/nu+IPyn/mIiy
         sSAtlkWqkaaomYsT1RHB8vCsVkEdHH0TUgsWyYvqdsW+/zc3Bho6KO4l/FP//tJqWhu4
         wzwlWFIzmm1FNbpivLi8rK4UzHP3Q694swcYgEuG8ZYwfZgqsyO3IDajY+vIpNPs5kBc
         hkXmlJZBUx6L3u8vFMM0ZdtWv6PzkwpwXmv1MWeAARC6dCGfaNioJRcSI2+zBreGXP81
         EHJyAdC7RdIQeyH007TODWGQkH+WTJaRZX6L0uSkUsyNI5ofyWJqcVYYcawLbd9Ewbpo
         CyfQ==
X-Gm-Message-State: AC+VfDxOOzmpZyk75FgJ5e4UaL6eKdJMgfMHOlH2GqVDd4qi377OLUgx
        yjWbGG5k1o5d8JyaaaZ1k3fGoQ==
X-Google-Smtp-Source: ACHHUZ7Q7JS3j1fRbzIwHuEKNzn6hQJqA2wg2j2HTTMLGlbAesvxtukiWmQ21xAfg4HKGQiPql/ugw==
X-Received: by 2002:a2e:8410:0:b0:2af:d2ef:49d4 with SMTP id z16-20020a2e8410000000b002afd2ef49d4mr628046ljg.1.1684697797602;
        Sun, 21 May 2023 12:36:37 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id q4-20020a2e8744000000b002adb98fdf81sm830009ljj.7.2023.05.21.12.36.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 May 2023 12:36:37 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v2 1/5] dt-bindings: phy: qcom,sc7180-qmp-usb3-dp-phy: add sm8150 USB+DP PHY
Date:   Sun, 21 May 2023 22:36:31 +0300
Message-Id: <20230521193635.3078983-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230521193635.3078983-1-dmitry.baryshkov@linaro.org>
References: <20230521193635.3078983-1-dmitry.baryshkov@linaro.org>
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

Add bindings for sm8150 USB+DP PHY. These bindings follow the older
style as this is a quick conversion to simplify further driver cleanup.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml    | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml
index 0ef2c9b9d466..a2ddf718ba76 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml
@@ -24,6 +24,7 @@ properties:
           - qcom,sc7180-qmp-usb3-dp-phy
           - qcom,sc8180x-qmp-usb3-dp-phy
           - qcom,sdm845-qmp-usb3-dp-phy
+          - qcom,sm8150-qmp-usb3-dp-phy
           - qcom,sm8250-qmp-usb3-dp-phy
       - items:
           - enum:
@@ -192,6 +193,7 @@ allOf:
         compatible:
           enum:
             - qcom,sc8180x-qmp-usb3-dp-phy
+            - qcom,sm8150-qmp-usb3-dp-phy
     then:
       properties:
         clocks:
-- 
2.39.2

