Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A3B775ED898
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Sep 2022 11:15:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231703AbiI1JPC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Sep 2022 05:15:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233459AbiI1JO5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Sep 2022 05:14:57 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4ACAD63F4
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 02:14:55 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id e18so8108490wmq.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 02:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date;
        bh=sB1pDwELM5sb4xybKJcteQ6UdX8NBQ9VAI6UQW1HiBI=;
        b=fUObDJ8yfTl5kymSx/mqVuIpCths0IIErK5/8hutkVNPbL4f1IKP2vfUuGEZg0txUt
         w+WLaWqQBR4L6oBeor3sBgxz0dOq85huHrk/VYnONMTdIDDwDZIvwnK5VD4UROqJysCh
         /oiyvs90BFAb0gpNd7KmMMuzeYY1Om5cqNHrFnYEBysC+AsH6o/RxCKhdH+e/Ai09Swi
         uJX8gwbNYFILLUYdgF/GQQgetd7i8nAKk58Ao+IswIOnCuIL13e9NO6DrILGpPR1libo
         rdYFD9tCSVzPMQak5DsCyNp28cbAL3NatQoq2cKsgil+0aKjZeTWOV/FS56OUliul8Zu
         uqxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=sB1pDwELM5sb4xybKJcteQ6UdX8NBQ9VAI6UQW1HiBI=;
        b=sLS+r+kcs5KmSAAzkkBXYMwrr++fU4rU/M+KFhHCA8sw4bx5lIR2WwijpZbIGgUoMo
         YdfUfwmLp8GMAtbdNnkKk8wnrNuPf6vtMw2lV2sZtTOD5iE1kMUfbgn5EeMT6FHR+SDQ
         T3fM8NLDb4St01DJLMXuaADZ+nFn3/dkTLCvw2CtxivMQKzWFnnSGQ5Kkp72+JsxPeib
         f1slKoJYXHExuB4rFu9DNFHFmlhROMNj8r7WYEyYGKCfx3qBfowSpHEDQ3ercwfOhozt
         kdlniUAjecJ/ha/uR5w71wV+c4agJuBrHKgq73m1M9uT3OcF03Kla4YUSBAEhy6XfIUD
         LlZA==
X-Gm-Message-State: ACrzQf1knYFx+5xNBfeXRzFQ5U4Jrl0uOr5XuejAVC+NryRWzWa1WN4u
        PamH8ssAHBe5N+sl210l/Nf9jg==
X-Google-Smtp-Source: AMsMyM6Ea1VPSETuEitRBpqVKuyOgR26+4yDT+bXZT8hUzrRHXN3gxpX/vDZ3mk2T6jorS8FDnOnsA==
X-Received: by 2002:a05:600c:1c05:b0:3b4:c1cb:d45f with SMTP id j5-20020a05600c1c0500b003b4c1cbd45fmr5987820wms.2.1664356493923;
        Wed, 28 Sep 2022 02:14:53 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id p2-20020a5d6382000000b0022a53fe201fsm2420016wru.68.2022.09.28.02.14.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 02:14:53 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Wed, 28 Sep 2022 09:14:51 +0000
Subject: [PATCH v1 1/7] dt-bindings: arm: qcom: document the swir,mangoh-green-wp8548
 board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220928-mdm9615-dt-schema-fixes-v1-1-b6e63a7df1e8@linaro.org>
References: <20220928-mdm9615-dt-schema-fixes-v1-0-b6e63a7df1e8@linaro.org>
In-Reply-To: <20220928-mdm9615-dt-schema-fixes-v1-0-b6e63a7df1e8@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     devicetree@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.10.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The qcom.yaml was lacking documentation of this board, fix this.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index fb1d00bcc847..e9f38f0cef19 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -262,6 +262,12 @@ properties:
               - qcom,ipq8074-hk10-c2
           - const: qcom,ipq8074
 
+      - description: Sierra Wireless MangOH Green with WP8548 Module
+        items:
+          - const: swir,mangoh-green-wp8548
+          - const: swir,wp8548
+          - const: qcom,mdm9615
+
       - description: Qualcomm Technologies, Inc. SC7180 IDP
         items:
           - enum:

-- 
b4 0.10.0
