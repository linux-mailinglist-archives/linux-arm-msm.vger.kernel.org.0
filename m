Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27A076BA12C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Mar 2023 22:09:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230250AbjCNVJF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Mar 2023 17:09:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230007AbjCNVI7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Mar 2023 17:08:59 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 276E6199C9
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 14:08:57 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id nn12so16680120pjb.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 14:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678828136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l3n0f9m7P1TRpWa333kmFfEY4nnR/IawDWid3xBuSig=;
        b=FEW7S9D8JBnRRT2S63sX1S6TwK3hbVBf9rwgr/ZHvwq8H3KlERVoRvruh92DmwhT4c
         /3C0qTdWqI7hTTWXH8pIJAhWAWOGg4HHkDFRQl9esqj3Vk6qFhFphrnqMHNunHhD/6ZU
         EXd2cSOZ+RD9Y/ot6LmFU9NXXUFOkDxoAE+M+CTqM1YUXwexT0V/OB+WWWnl6On2IAEu
         pef11b3EMIEaa4cD2Cb3ASxHRGvku6nrlDSFPutYL693h5imQVL5pZWG9xPwZUbmf3py
         NjsYjccYLfF7EWZPQSyqIq0a7ao/BSiOGdgm/1/uTE9GBF6kK5BAT2ENJs7e5O0xsm+e
         cNRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678828136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l3n0f9m7P1TRpWa333kmFfEY4nnR/IawDWid3xBuSig=;
        b=SvP8efM5lzBsbMyBjxhHLiUJi2kC6WjlxRBqXI/AplZJqQNvQb/exg/a6AVfPqOH49
         RODdpjxVr0Uom35mGNGD3K0AZlS53FdGHxqjOIYWhhPb70gaO46mwlsBciI4UzkLm110
         xy9L47HBEHJXq0ZSvWYe5SZWLlmwXV1LJhtT3vYPDm6tieZIaw8tfeY2S8X6B9akJQFy
         ZwOx9dcja6btDJxwRgIBTvuaYKMxzDtasIDcrBFRl6d85RLqXhHVLsVvnkGd2f8TUJ8l
         jzuVSFp3Jhs3zBXuA8wWhLWY1VPGNW7zu0PvlSXtPbxYGV9bdSdUa/oQkZqrjlw+7ktC
         LKGw==
X-Gm-Message-State: AO0yUKWCWWP7lY5DHkraYhtY/VVcnSoMJhHn/BXOgDZpg/8E/FuVWDJo
        6xL+mwE98FWGUiIgkyF70tQOCQeb/xcCEa2YSQE=
X-Google-Smtp-Source: AK7set9KeAwfiLSLzDwCaBtBzBLO6eqEk9kWtH6xjETBxZIxQFAfQ42+2pwsEvQAeqTF5qbcVNKIOg==
X-Received: by 2002:a17:903:cc:b0:1a0:75bb:2803 with SMTP id x12-20020a17090300cc00b001a075bb2803mr255747plc.63.1678828136350;
        Tue, 14 Mar 2023 14:08:56 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1c61:1acb:9af6:bd7f:78e7:7ae6])
        by smtp.gmail.com with ESMTPSA id kl8-20020a170903074800b0019edc1b421asm2190150plb.163.2023.03.14.14.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 14:08:55 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        linux-kernel@vger.kernel.org, bhupesh.linux@gmail.com,
        bhupesh.sharma@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski@linaro.org
Subject: [PATCH 1/2] dt-bindings: arm: qcom: Document the  Qualcomm qrb4210-rb2 board
Date:   Wed, 15 Mar 2023 02:38:27 +0530
Message-Id: <20230314210828.2049720-2-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230314210828.2049720-1-bhupesh.sharma@linaro.org>
References: <20230314210828.2049720-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Document the Qualcomm qrb4210-rb2 board based on SM4250 SoC.

Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 1bb24d46e4ee..e3201e6c503a 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -846,6 +846,7 @@ properties:
       - items:
           - enum:
               - oneplus,billie2
+              - qcom,qrb4210-rb2
           - const: qcom,sm4250
 
       - items:
-- 
2.38.1

