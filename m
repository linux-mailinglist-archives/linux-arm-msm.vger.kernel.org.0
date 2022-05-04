Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D58351A098
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 May 2022 15:19:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350342AbiEDNXM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 May 2022 09:23:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350361AbiEDNXI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 May 2022 09:23:08 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5452C39B9F
        for <linux-arm-msm@vger.kernel.org>; Wed,  4 May 2022 06:19:31 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id y3so2805030ejo.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 May 2022 06:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cIxbMsIYOC41nyD069BUzktCiWAoIc1Hw5a409uln8M=;
        b=O6pIQLrnTXqGXjoUibcX5awF0VD5FEN531oxXY/6EUZ1VhVGdnwoZ1/LeOSvKx6tAN
         cmI/EGnXI/rSzAqODaIzfmd0pgvRQ2JB/hUH9D0O65GDm2WBsdNX45FmlJHRN5GpBvJA
         2Hf6k0buqbzGPKkiqYpsWNz1JSy/1v4uMK3WWSDnPPWNwHfnB2hechyV0yGFf4FAzOqz
         ff0ueW6q42HCthGjFrT18uA2Brfuh24iC2xRufNYgHPf6LzEdPv+ziuNgE4GT6UAS8+c
         Pz0AyQhc2PQIrPir9ZyS48xmsH7NQmtytuwFBdUdU1tjkEcxRlEFZlr6nFuVpb0xkt0k
         jLaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cIxbMsIYOC41nyD069BUzktCiWAoIc1Hw5a409uln8M=;
        b=P5YJHm6WT7sYSO/tKc3WMHhtDZfKFDwAqBjejoQ2+bYm/ycidn2M6Z1zHNPTbGb1dH
         Gtt/3KGu5CAWuqhWh5pzuA4sEJ33CXdrBhGZIpNpg+zW61GlAkCgPWs+f43dzRaU0zQ+
         vIGTXJ3rUVJBA6cwuIhhV//Yr1TrmhUT3Audch14kvW1Ykkb40iaTmaRAeEFpAvFUmmq
         jCD+/qT5HsJQ6hy47lByDZ0lk5IJYvSiB9yR7OnoaO8sWVkNkctDhzE+GxsHgWN7zFMb
         FXJl0cQW/5nRj6J7MALw0ZLhYEqcE0gUdc9EtTSkw1b4vDTsNZKlS8myOKaiBuXKQGdv
         59Fg==
X-Gm-Message-State: AOAM5323awtMJ09o6o1pSS7KRVsmbfSqlJqGGk3DQvS2qZpiVxN26o1W
        w1tLddrEHyLCLeP2bFb+9AQbjQ==
X-Google-Smtp-Source: ABdhPJyuS3YxpEL7hJnfn9pk/WUIYNUrf65URgEiaFNNqK23PLeYMn6slxsruSPDITumPuxYywifrg==
X-Received: by 2002:a17:907:1c0d:b0:6f3:b742:ef56 with SMTP id nc13-20020a1709071c0d00b006f3b742ef56mr20212422ejc.504.1651670369760;
        Wed, 04 May 2022 06:19:29 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id gx3-20020a1709068a4300b006f3ef214dc4sm5660924ejc.42.2022.05.04.06.19.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 06:19:29 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 02/13] dt-bindings: soc: qcom: qcom,smd-rpm: add power-controller
Date:   Wed,  4 May 2022 15:19:12 +0200
Message-Id: <20220504131923.214367-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220504131923.214367-1-krzysztof.kozlowski@linaro.org>
References: <20220504131923.214367-1-krzysztof.kozlowski@linaro.org>
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

Document power-controller child of Qualcomm RPM over SMD to fix
dtbs_check warnings like:

  msm8916-huawei-g7.dtb: rpm-requests: 'power-controller' do not match any of the regexes: 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml
index f0f1bf06aea6..cc1b35080162 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml
@@ -51,6 +51,9 @@ properties:
     $ref: /schemas/clock/qcom,rpmcc.yaml#
     unevaluatedProperties: false
 
+  power-controller:
+    $ref: /schemas/power/qcom,rpmpd.yaml#
+
   qcom,smd-channels:
     $ref: /schemas/types.yaml#/definitions/string-array
     description: Channel name used for the RPM communication
-- 
2.32.0

