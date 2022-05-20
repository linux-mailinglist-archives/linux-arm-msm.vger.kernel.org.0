Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3036B52EC2A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 May 2022 14:33:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349349AbiETMdL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 May 2022 08:33:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349312AbiETMdF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 May 2022 08:33:05 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60AF115A778
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 May 2022 05:33:04 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id l13so7406958lfp.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 May 2022 05:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hRNYPngTV+U+MXi/lSp4vZpHzlUN8RyLOj3ZsKeL1G4=;
        b=l6tzYjvUol1igMfcE1sAQeFoh0wrBh2vxblUVk8bco+xUl8Fm5Ow69Xopuqdsb5BAP
         bc1hQX0D829cx+784vZX7jMmbPe/tqALc08p99X8j/PhbYTkxQyNIBqlpmjOw6TSpwtG
         1U0Lw3dNXjdgTn4veFZmNW6o0+1223UBYOPqphOL1r09K5Y6DM8tU8LhbttgvcAud+C6
         XdKesSy6TIQ1yyWuawyt8j3nvJW70aqrSrJAkCIBHOqxUygd48s4D0/lvu+5bRWsYUoZ
         unZiOIC+5vvKkClXl0ki7VnA8R5WT/oExVw615UYzt1ppw4AMHrNyTcSiiyAPwcNI+MD
         EOtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hRNYPngTV+U+MXi/lSp4vZpHzlUN8RyLOj3ZsKeL1G4=;
        b=iPDoEVHdELRibCwz3ssUj4kj0Qbyqq41AWNMhUa7WzxL0Yc8FoAD8bH/RVC9/URIGU
         1UcXa73RhvftyOAP39HpsHshdPFfMfQtuNDti9Yj8pKjbiB+tq6f0XASXimaPmbToXsj
         Tihf8Qvn5jamH8FvIPw9HhuKvM2e2UM6cPfNux8XXWdf5HSRRRnhHh2183tYb9BpdYYo
         Idl1X2j6nG9feBEdBuCGmqEWr8WMyaxTvmJb9j0+BfFJjWO5neGlj1q7iLBlmXJRXiNL
         pMM3DJoVeFJ+X5MGtyU3isL+BihUn34ZMynpkKCbV6BN8Zo8qpkQPesmecagmras6JvS
         nc+g==
X-Gm-Message-State: AOAM531JrGNT16e3sHAZ0fzpjD+9Mvy1MWPHbcO8eGIZ3Eb1TaBF4yzD
        ZzWMwaG6TSQVP+99XN6ynEA4Cw==
X-Google-Smtp-Source: ABdhPJwJ0WSDAtXXmEVPvzjb6YV3MaY/0VDb2R7sc/gkBysh+OexhqhKzoTU19ay/TnRVXDfLlYyGw==
X-Received: by 2002:a05:6512:2806:b0:478:54db:fa23 with SMTP id cf6-20020a056512280600b0047854dbfa23mr1718508lfb.253.1653049983941;
        Fri, 20 May 2022 05:33:03 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id a14-20020a056512374e00b0047255d211bfsm643973lfs.238.2022.05.20.05.33.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 May 2022 05:33:03 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Vinod Koul <vkoul@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 7/9] dt-bindings: arm: qcom: add missing SM8150 board compatibles
Date:   Fri, 20 May 2022 14:32:50 +0200
Message-Id: <20220520123252.365762-7-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220520123252.365762-1-krzysztof.kozlowski@linaro.org>
References: <20220520123252.365762-1-krzysztof.kozlowski@linaro.org>
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

Document several board compatibles already present in Linux kernel.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index a08f297c9d5d..7b6deb766c6c 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -301,7 +301,11 @@ properties:
 
       - items:
           - enum:
+              - microsoft,surface-duo
+              - qcom,sm8150-hdk
               - qcom,sm8150-mtp
+              - sony,bahamut-generic
+              - sony,griffin-generic
           - const: qcom,sm8150
 
       - items:
-- 
2.32.0

