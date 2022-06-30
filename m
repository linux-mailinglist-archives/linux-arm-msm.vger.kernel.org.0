Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 88E4756120F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jun 2022 07:58:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230343AbiF3F6R (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Jun 2022 01:58:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229878AbiF3F6P (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Jun 2022 01:58:15 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 943E923F
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jun 2022 22:58:12 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id w24so17753171pjg.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jun 2022 22:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gNI2eErAlbnR33nd0lAZVKjou66LXCn6ck0SwxHv5j4=;
        b=d5+O04srINiHMfVNndzpsa6dNc8jJ5xaDyO5vi6a0dFIecI/i37uzbcZo+hqiDz8SX
         ZPAiQNVFjdhW25SzvxGfbZqLlpUJdYRZtW905YwHk3mvZOrTxzBE02a/vPIkz+hoYyGf
         53zP+cQt/oYmN7A+1gGnp8pKV89GoBjHeOs+k40TTB0EGj5beyrYGx7Ue7Djk/1pReSm
         vddAG4P9uHV2dvOKfacbSaxrfAWH4fjrgKg/ga1D72uvEYNpd2ka9cDsLZANOXgIjPeY
         9mEr3kBVR9ahZAs9Hvf6+kCYkKYd1j4jQEgJoSPfQjc/QUKzFYD2e0zLfLJFMpYDVbyY
         tRPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gNI2eErAlbnR33nd0lAZVKjou66LXCn6ck0SwxHv5j4=;
        b=Dcc9XZyvd3azQv8LIWLzz+LFtiY8n/V7IiOgQIfGGrhVK34RDyWtcbtpHafkRyl+9B
         5rTLDgABG9kjlG21U3zxyuIdWFsdx/yC33QXSHOaPRVGLyA7WAxrmdUIYX1n7jwxqP/1
         PAre5F80Ad5wfxCLf/PoVD6n/rWotB5Qs2vEjbHFVyHzztTeQTm84jVAhsXo3ghbsaHp
         XBUCckvumxaiiamrHioyBdi41cNtdrgVR2mXPtjps9aDWZMAbjW1+p99w3AadhzBbUhD
         K7xgYvOKFJFmr+pmdseuO9zET4eLILK+Fvm3kX52g0NWj6yfpPDqrwiQPNUBFY8D7+cx
         xVeQ==
X-Gm-Message-State: AJIora8ZQjYM45cVlQgp8N9nlYqcz5XzjBWnFoUQ/7xgbEpbsDpE82t2
        DPgJKmAlN4cB6V2gPpmbSR+MUw==
X-Google-Smtp-Source: AGRyM1sp43RP8loICF5kakWaLmA+jQrwb5s0TO/6VgBGlMCeg7CSpnVA2fI5eiiDTD58heB5y3Mobw==
X-Received: by 2002:a17:90b:4a03:b0:1ed:2071:e8c with SMTP id kk3-20020a17090b4a0300b001ed20710e8cmr10354265pjb.216.1656568691964;
        Wed, 29 Jun 2022 22:58:11 -0700 (PDT)
Received: from leo-build-box.lan ([154.3.32.171])
        by smtp.gmail.com with ESMTPSA id b14-20020a17090a550e00b001e31f4cc977sm3309288pji.56.2022.06.29.22.58.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jun 2022 22:58:11 -0700 (PDT)
From:   Leo Yan <leo.yan@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Leo Yan <leo.yan@linaro.org>
Subject: [PATCH v2 1/5] dt-bindings: interconnect: Update property for icc-rpm path tag
Date:   Thu, 30 Jun 2022 13:57:18 +0800
Message-Id: <20220630055723.704605-2-leo.yan@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220630055723.704605-1-leo.yan@linaro.org>
References: <20220630055723.704605-1-leo.yan@linaro.org>
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

To support path tag in icc-rpm driver, the "#interconnect-cells"
property is updated as enumerate values: 1 or 2.  Setting to 1 means
it is compatible with old DT binding that interconnect path only
contains node id; if set to 2 for "#interconnect-cells" property, then
the second specifier is used as a tag (e.g. vote for which buckets).

Signed-off-by: Leo Yan <leo.yan@linaro.org>
---
 .../devicetree/bindings/interconnect/qcom,rpm.yaml          | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,rpm.yaml b/Documentation/devicetree/bindings/interconnect/qcom,rpm.yaml
index 8a676fef8c1d..16df305ea243 100644
--- a/Documentation/devicetree/bindings/interconnect/qcom,rpm.yaml
+++ b/Documentation/devicetree/bindings/interconnect/qcom,rpm.yaml
@@ -45,7 +45,11 @@ properties:
       - qcom,sdm660-snoc
 
   '#interconnect-cells':
-    const: 1
+    description:
+      '1' is one cell in a interconnect specifier for the interconnect
+      node id, or '2' requires the interconnect node id and an extra
+      path tag.
+    enum: [ 1, 2 ]
 
   clocks:
     minItems: 2
-- 
2.25.1

