Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 570E9600292
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Oct 2022 19:58:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229764AbiJPR6v (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 16 Oct 2022 13:58:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229597AbiJPR6u (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 16 Oct 2022 13:58:50 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CFDF29355
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Oct 2022 10:58:48 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id az22-20020a05600c601600b003c6b72797fdso8207220wmb.5
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Oct 2022 10:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=inHqJMeb2eEi15CeXM8hxUEa9+fOAmjhPmMj86FNlH4=;
        b=FLBlIV98RjiuFB3okQgYY1NdF4LKCCe/h4qJ5u/sKQs3WzY6L/WxRnv452yUgasoCT
         4aBg/+EC9CkqE1dYK+BsgnYlAHO1uIj7jP8DhnmPdaznwBvehseM6gt0D1Plcngq3Fto
         QeuWYtg7yzTQw3tkvbx46zGRT5lWN0QwakRAgV3WYy3bdUbSJnDReNRwf/XRTSiUoiUr
         mmEOSEJCeCW+0dSbBUVCEjDrZ+YFRaFehA+HQVWdSXzcsa4EWuAvoWRimXDVGgjmxj5x
         ixon/FcZPSC/I6cFF4c9qO4oKG0iYHryekNeUJ7ze8fEVeRPu37L9gdisK+lViUy0pK7
         i2zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=inHqJMeb2eEi15CeXM8hxUEa9+fOAmjhPmMj86FNlH4=;
        b=c5KkDeTUuXphVUkVD6liaOpDvT9l1OApbvSyA7jJ7aWo/gvnEpJf2t1AFVqVoEFGBO
         MljVRFfQcEMiY61TmlOufbNx8ywgPg4QjdmD82LzdpeP4EvhhqMRcbd1kLiQtOzQD8eV
         vd9u4StkOh9mvQOcDJ6cLdjfaF736LiqiR9JpBf5RdMwvK1BqTwB2+TWvbBFzZNT4YAQ
         COKV36ECQHqyDCkIyp2le83DeP22+/3JdxZz4QNn9HRaEIehwze2Q3yheH3IvR50deY9
         qpWSVxyf6h/3HyrHOth6Te8/itpO2uoZqVavvSLJAmfGeYlnJ1Y9/Hu0enNGMKORfKXt
         Fp+A==
X-Gm-Message-State: ACrzQf2hPVZbC+yePBWwnMtQpSFhL9b/cgiwwmZg+molApFM7ZPIHLqy
        nb8w+ELKT4dbcljTnSv34G1fBg==
X-Google-Smtp-Source: AMsMyM431LFQ1Iv5/30swx1zHXOZ8BKqg5dayG2AA+J3f/4e2MKG28IT27EWO+HMs54d5BvoVuqVhg==
X-Received: by 2002:a1c:2743:0:b0:3b3:4066:fa61 with SMTP id n64-20020a1c2743000000b003b34066fa61mr17221591wmn.79.1665943126905;
        Sun, 16 Oct 2022 10:58:46 -0700 (PDT)
Received: from localhost.localdomain (cpc76482-cwma10-2-0-cust629.7-3.cable.virginm.net. [86.14.22.118])
        by smtp.gmail.com with ESMTPSA id m6-20020a1c2606000000b003c452678025sm13217786wmm.4.2022.10.16.10.58.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Oct 2022 10:58:46 -0700 (PDT)
From:   Caleb Connolly <caleb.connolly@linaro.org>
To:     caleb.connolly@linaro.org
Cc:     Luca Weiss <luca@z3ntu.xyz>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Lee Jones <lee@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH] dt-bindings: mfd: qcom,spmi-pmic: support rradc type
Date:   Sun, 16 Oct 2022 18:57:57 +0100
Message-Id: <20221016175757.1911016-1-caleb.connolly@linaro.org>
X-Mailer: git-send-email 2.38.0
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

'adc@' nodes can also be the rradc.

Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
---
This patch is based on Luca's series:
https://lore.kernel.org/linux-arm-msm/20220925211744.133947-2-luca@z3ntu.xyz/

Luca: feel free to apply this as a fixup if you re-send
---
 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index b5a06c1b67bb..cba25562e1da 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -102,6 +102,7 @@ patternProperties:
     oneOf:
       - $ref: /schemas/iio/adc/qcom,spmi-iadc.yaml#
       - $ref: /schemas/iio/adc/qcom,spmi-vadc.yaml#
+      - $ref: /schemas/iio/adc/qcom,spmi-rradc.yaml#
 
   "^adc-tm@[0-9a-f]+$":
     type: object
-- 
2.38.0

