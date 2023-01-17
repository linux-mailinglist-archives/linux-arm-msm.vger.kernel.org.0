Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9EEE866E03B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jan 2023 15:20:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231878AbjAQOUf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Jan 2023 09:20:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231772AbjAQOUd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Jan 2023 09:20:33 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAA7732525
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 06:20:32 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id q10-20020a1cf30a000000b003db0edfdb74so62231wmq.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 06:20:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r70HIPPoSUCJDW7BtmV/6Lm1b7r37Y3H9xwbUY6W4Xo=;
        b=uRRabZd19roB+Ol4p25HXFYM9ypkBiyoXdUJADadlr6OfWgI31cbSLM81p/bduBPLG
         HmlnS1wNdz2KHXDCqNmsCB0Go9MDZIwvp1llUhAvtf1WgFqDt66kfw3MN14YXZlk9oD+
         H49MviBNnhLyIcO7ljKQIJKzJqZvaaWY24lgutszKLNkeWHljrOMrRAGHF+og6mcnJ8y
         8pbt/IQ6KM9lfbDEMMNNiCAkchcmbq8jKCT78KquAJpXDb9zS1qKf30qmKEZB8SyMAB5
         tP1jgw0EBUYZGjtyogxGUZGwX8YZQaL4zLNpz2xCaFFD10j6iYEdw5FKKr0in9nKQ24c
         7wGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r70HIPPoSUCJDW7BtmV/6Lm1b7r37Y3H9xwbUY6W4Xo=;
        b=PrfTC+XK0OTC75jMY+eEFMiZuTlDgoHBk4aKA9TwA4ypCeOQ7kY1IJ+RtZY5C9dsHG
         wlKUmjnlRQSSo3I/vVTrfAxQkN2C2Nlx+TD5mF0CYEsA3Bt2QBS5IGXS4SZAYSWm5qRM
         xl4L6JiXdw9TQXPYf5iK8+d6FfbvgOYXoS1WW5KwcJO4umAz9U1hktmjLTCV6518/Sl+
         hmKUOsVgfe5pfbm3Z1gCZXXi0HqIW62YKtaSfEu5xHPTQ2D1Y2oJAr3YA6loVfYeZ4DV
         c5GX/VINtRjbO/ZSvPUoD8eVvwAhPU1fkJ/rcPhzMsz9rVf/gwZVP0chDqW8Xe4VUe+/
         5t6w==
X-Gm-Message-State: AFqh2kp7fPyJezxW9CMB8rmlNip150GCr80yCBJHPHIOcpCf4JWKvHrC
        WUjp3NfCERjwvUOxiZAZAiR3nA==
X-Google-Smtp-Source: AMrXdXsAllzHCawsRFdiyLfn7UCdizc4IAPDTAwzUNxLeYtqmbUsSPokyJ4aOzCfJQQcLAX2fcBYbQ==
X-Received: by 2002:a05:600c:331d:b0:3d6:ecc4:6279 with SMTP id q29-20020a05600c331d00b003d6ecc46279mr11932841wmp.27.1673965231276;
        Tue, 17 Jan 2023 06:20:31 -0800 (PST)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id i8-20020a05600c354800b003cf894dbc4fsm40443133wmq.25.2023.01.17.06.20.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 06:20:30 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "vkoul@kernel.org" <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Johan Hovold <johan@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 1/6] dt-bindings: phy: Add QMP UFS PHY comptible for SM8550
Date:   Tue, 17 Jan 2023 16:20:10 +0200
Message-Id: <20230117142015.509675-2-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230117142015.509675-1-abel.vesa@linaro.org>
References: <20230117142015.509675-1-abel.vesa@linaro.org>
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

Document the QMP UFS PHY compatible for SM8550.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
index 760791de0869..64ed331880f6 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
@@ -18,6 +18,7 @@ properties:
     enum:
       - qcom,sc8280xp-qmp-ufs-phy
       - qcom,sm6125-qmp-ufs-phy
+      - qcom,sm8550-qmp-ufs-phy
 
   reg:
     maxItems: 1
-- 
2.34.1

