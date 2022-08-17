Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 07DFB596963
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Aug 2022 08:21:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238252AbiHQGVN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Aug 2022 02:21:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238901AbiHQGVM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Aug 2022 02:21:12 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 269E76DF8A
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Aug 2022 23:21:11 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id by6so12605574ljb.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Aug 2022 23:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=wA2XrQK8GobP+7+mFahAbX5R2GUCpHyA1dRW5wEOdPI=;
        b=hK/Rozp88H4rhDeZ+hY4Vhv7WUHpdiV8VqtypguCgSMbfbOG39z4PlqBBfIwqmytdA
         XRdn2S19b163p0zAowdILn0FyCka6+CzvCB9P4y00XRgjZTzeq4q3Zb/6Ez5mT8eWXAw
         H+JmiXtq6zcoRUFsPvfh9jSuXPXovPrHlqrjHrz1Lt+3aLdwJLk5HCGeQsxwxfA02kmC
         qpc7SGbfj3nx5zuuBUm7Norcpxzhqs9lDSiDeKyY1cCm56Ee0Dn86tNwa1r1EtiCoUxL
         T6kZK8IU/vESioX5i3/NUSmxOBDoYAbNwDjSJEaDCnWN9kWqsrZAVrsEhsdk4g/ZlTSz
         9pRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=wA2XrQK8GobP+7+mFahAbX5R2GUCpHyA1dRW5wEOdPI=;
        b=HFaxjNPNgX/AwY2UNT98KSXvIKxdlIpAy8YHJTJPxvcBV11gY4k4uxCKNDj9TQnV2f
         iy1NZNfRufNRS27AZAEjMfh5eLNT5CK4zpudoIgPEkllpyitEMgv2pIKjbfUETdsIlKs
         75tWPu4mbY6nXdMIpBf2zfzxknQ0+/tJGJXXZXonKcEcsQEM0V74jOCtZTpPxmNphALV
         9ZSKUQsl++9IVBbRdLS4H2Lw0XuLYAidXXJYi3+QsFMZQMXAMz5Z2t0kBPT31ulKbsYF
         TzArKYtVnjmEq1FCKA8YSQp9qaDoI7HQFKCPxMq7yf0kfikZkTbMTBmbnLpLd+x+tyFW
         h1HQ==
X-Gm-Message-State: ACgBeo3PCiLqp7QJ6r8utaOR0EuDkeh4vkJgwFv7aG4+MFDG275za1Fb
        Cyzk9XC7gYvWXPz/CK9XzWQGlw==
X-Google-Smtp-Source: AA6agR7EPsSNDenvWlk7mQ7+9HvJl9nFBJ+rv42B4kn2sy7EgcmK0pK6X2fIUsdKLahQuueV9Ndwug==
X-Received: by 2002:a2e:b894:0:b0:25e:cb1f:365d with SMTP id r20-20020a2eb894000000b0025ecb1f365dmr7440471ljp.285.1660717269206;
        Tue, 16 Aug 2022 23:21:09 -0700 (PDT)
Received: from krzk-bin.. (d15l54h48cw7vbh-qr4-4.rev.dnainternet.fi. [2001:14bb:ae:539c:1b1c:14b7:109b:ed76])
        by smtp.gmail.com with ESMTPSA id u27-20020ac258db000000b0048b0062a14fsm1581002lfo.144.2022.08.16.23.21.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 23:21:08 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Del Regno <angelogioacchino.delregno@somainline.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 4/5] dt-bindings: display/msm: dpu-sc7280: add missing DPU opp-table
Date:   Wed, 17 Aug 2022 09:20:58 +0300
Message-Id: <20220817062059.18640-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220817062059.18640-1-krzysztof.kozlowski@linaro.org>
References: <20220817062059.18640-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The 'display-controller' child (DPU) of Display SubSystem (MDSS) uses
opp-table, so reference it which allows restricting DPU schema to fixed
list of properties.

Fixes: 57fd4f34ddac ("dt-bindings: msm: add DT bindings for sc7280")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml
index f427eec3d3a4..584d646021d5 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml
@@ -72,6 +72,7 @@ patternProperties:
   "^display-controller@[0-9a-f]+$":
     type: object
     description: Node containing the properties of DPU.
+    additionalProperties: false
 
     properties:
       compatible:
@@ -112,6 +113,8 @@ patternProperties:
         maxItems: 1
 
       operating-points-v2: true
+      opp-table:
+        type: object
 
       ports:
         $ref: /schemas/graph.yaml#/properties/ports
-- 
2.34.1

