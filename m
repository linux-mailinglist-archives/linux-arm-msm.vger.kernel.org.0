Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2632578D860
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Aug 2023 20:30:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232776AbjH3SaV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Aug 2023 14:30:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242970AbjH3J67 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Aug 2023 05:58:59 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EACB5CDD
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Aug 2023 02:58:56 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-99bf8e5ab39so707587966b.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Aug 2023 02:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1693389535; x=1693994335; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4WJXFKBPivuvpwQ6jhhHOzI4G6pGyYQNiDeZ/V0B5Vw=;
        b=MoZY9pPxilgBBRsXnGVnVL3hic/IHnNnC5KVyj4Vty5j7wogS+MJ41fN0hwrEJLR9Y
         YND617iI56GqC4jKvA7UoFdNJxp6TpRZvMJ4DR1rw8Ct4B/COsj6KqILPCW0iTcRqAJ2
         eW0yx+VYeG2XnCiVNYkaOq1wbHOs6USJ0aJERHb0JQd13MFJtCf6SwBTPWy/rULJSSQD
         +HNHQxQ6tfXb3hwOldfIyEYu3DhOmOW8YBLdhgIXe1YR1wR0rubMvN7EnEUo1ZIAJa6+
         KzRyDefkYyPRkJ7nIkfiuRiLNVSxTtb6m6UyqU6PPvI/f+/AQqLiNTS70ws2atv2VoKs
         P3qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693389535; x=1693994335;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4WJXFKBPivuvpwQ6jhhHOzI4G6pGyYQNiDeZ/V0B5Vw=;
        b=Pkr7uFch5U9ySSF/bkhjoZl99QJ8oKmQHD2dqbFlOEGA/MXtFpp4hF353FiUTNq+Am
         dCJi4Jbsr5sLVmm6I3VXu60Q0sKG+TMgfrghI/jXd+kjdIcDY6My8N8xuzmCuSCkF45v
         995wPaqv81HUxN1zD9Wwssq9VlhGU6aDGZ8cN0yotAY/MC/77AXyB18vQTqWtUIif+iL
         vNAvoSH0GfGj3SCxDYAQ9jtOcjMfWylJNMTpy2m/rgp159Ew/p6rNsFmzy2v8/wO9jbW
         sS9M/iYckqENx4OEtWZmh3R//dt9LGJI0L484CMyVZTSIdJi7BUdL4baZ77phfCUc/0e
         wNxQ==
X-Gm-Message-State: AOJu0YyiotR8h9fe+CoMyYMOSJCVbDIPFD1XwD5/6/Vl60T1Q4MK5DXh
        PZzNSmJv0WdAdYkl33nRQL5KOQ==
X-Google-Smtp-Source: AGHT+IFKLkuiehndiEFuV1D5Mo9Zs1yQrxnE7Qv9Ywvmj3voRbSWIyG43aNwn+Yw9fOV3z1/ycB/Qg==
X-Received: by 2002:a17:906:301b:b0:9a1:aea2:d18d with SMTP id 27-20020a170906301b00b009a1aea2d18dmr1164824ejz.48.1693389535513;
        Wed, 30 Aug 2023 02:58:55 -0700 (PDT)
Received: from otso.luca.vpn.lucaweiss.eu (5073ED84.static.ziggozakelijk.nl. [80.115.237.132])
        by smtp.gmail.com with ESMTPSA id i15-20020a1709064ecf00b009a2202bfce5sm6957130ejv.118.2023.08.30.02.58.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 02:58:55 -0700 (PDT)
From:   Luca Weiss <luca.weiss@fairphone.com>
Date:   Wed, 30 Aug 2023 11:58:35 +0200
Subject: [PATCH 10/11] dt-bindings: arm: qcom: Add QCM6490 Fairphone 5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230830-fp5-initial-v1-10-5a954519bbad@fairphone.com>
References: <20230830-fp5-initial-v1-0-5a954519bbad@fairphone.com>
In-Reply-To: <20230830-fp5-initial-v1-0-5a954519bbad@fairphone.com>
To:     cros-qcom-dts-watchers@chromium.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-pm@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.12.3
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fairphone 5 is a smartphone based on the QCM6490 SoC.

Also allow qcom,board-id and qcom,msm-id for QCM6490 since it's required
by the bootloader.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index adbfaea32343..b09a41812cf0 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -391,6 +391,11 @@ properties:
           - const: qcom,qrb2210
           - const: qcom,qcm2290
 
+      - items:
+          - enum:
+              - fairphone,fp5
+          - const: qcom,qcm6490
+
       - description: Qualcomm Technologies, Inc. Distributed Unit 1000 platform
         items:
           - enum:
@@ -1074,6 +1079,7 @@ allOf:
               - qcom,msm8994
               - qcom,msm8996
               - qcom,msm8998
+              - qcom,qcm6490
               - qcom,sdm450
               - qcom,sdm630
               - qcom,sdm632

-- 
2.42.0

