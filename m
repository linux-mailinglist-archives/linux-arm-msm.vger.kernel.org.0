Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9DA5C752927
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jul 2023 18:53:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231925AbjGMQxA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Jul 2023 12:53:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235338AbjGMQwt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Jul 2023 12:52:49 -0400
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com [IPv6:2001:4860:4864:20::2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 264E92706
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jul 2023 09:52:48 -0700 (PDT)
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-1b38121a011so706514fac.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jul 2023 09:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689267167; x=1691859167;
        h=content-transfer-encoding:author:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/TQQu9i4zVTx/pAbl1XLa7p043pJkUqA0em0AaQVe1Q=;
        b=EOJTZVfBLXbJ+tgLJUJRaAhYQO95hGodf9yyM3ZyJmDrHCRlhC2xTABoIUd+3Cl1Yo
         XO6MFz+wN+mKMs6tq2jcRQ64XxumnSH7k9awmG8P4d7raV506yyFNuk+QzDmoxlG7chk
         Xm8c4ZN86UiZ92TA62A3E7CqOGXkzsg58hlso09jztugiWJsrZlajfgdFEImk3AudVEl
         cx4jXLpbjX+rbI6inQvzyxatK+J3NV0dtyEMl2rdalG0LM16oQKztrzu1e9wqiv4IAZx
         OywlZGqh1gyC+BOajdMLtm5QuJcdzMOffKpKItqBLM8fiPpYEPx/vCTS+0PA28sPaCRn
         hNEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689267167; x=1691859167;
        h=content-transfer-encoding:author:mime-version:message-id:date
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/TQQu9i4zVTx/pAbl1XLa7p043pJkUqA0em0AaQVe1Q=;
        b=JwUIRoRrW1HrMfJsTJYsDDQC9G+LXpqgLHqov/8aIOtbI/XMt48k5GBe6lnadRRNT9
         CEIKdFydW7jNRCvc3jAMcD4XwILVMaNJxSe0Nt76tAwdVBiPPYoloyoCaxvA3sCzBmBu
         Ez/OcpV/EYbA+ZSPY1cOEq/KJIsHcVKMem5PuDy0XMLrMvn2/S/00RzcHiRi8FVv6rRL
         pV1/R4H/ZyDVvJbrfW54PhsM0k0wQRuHV0bMx4gYasCdCUUXyGuWqL+fzezkAi8hI3ud
         /HdEfTuapZm/0JUJ4SPl/64jYDO7QZ4HiuNRdHo4P+tRcpqR69wUAH1eJ8u7UAGqZwJB
         n3yQ==
X-Gm-Message-State: ABy/qLZqGWHS1PbkcSQ1xAYW3a+oNXNSAf/XqFM5qyPKqzl07HTbbzhD
        ppLH45ivBUdGGVEYDkUawB4gxQ==
X-Google-Smtp-Source: APBJJlECN8Pkf5oJl1wriKAi9i7oMviETr74ANXnYL6u7bXmI8D7Lz2S54OFWvuw32qLmK8Qci/xoA==
X-Received: by 2002:a05:6870:c188:b0:19f:5c37:abb9 with SMTP id h8-20020a056870c18800b0019f5c37abb9mr2495348oad.12.1689267167408;
        Thu, 13 Jul 2023 09:52:47 -0700 (PDT)
Received: from x-wing.lan ([49.207.50.231])
        by smtp.gmail.com with ESMTPSA id d3-20020a17090abf8300b002633fa95ac2sm12009150pjs.13.2023.07.13.09.52.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jul 2023 09:52:46 -0700 (PDT)
From:   Amit Pundir <amit.pundir@linaro.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Caleb Connolly <caleb.connolly@linaro.org>,
        Bryan Donoghue <bryan.odonoghue@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dt <devicetree@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 1/2] dt-bindings: display/msm: mdss-common: add memory-region property
Date:   Thu, 13 Jul 2023 22:22:37 +0530
Message-Id: <20230713165238.2814849-1-amit.pundir@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Author: Amit Pundir <amit.pundir@linaro.org>
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

Add and document the reserved memory region property in the
mdss-common schema.

For now (sdm845-db845c), it points to a framebuffer memory
region reserved by the bootloader for splash screen.

Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
---
v5: Moving the dt-binding to mdss-common schema with
    updated commit message and property description.

v4: Adding this new dt-binding patch, in qcom,sdm845-mdss
    schema, in the v4 of the follow-up patch for
    sdm845-db845c.
    https://lore.kernel.org/lkml/20230712130215.666924-2-amit.pundir@linaro.org/

 .../devicetree/bindings/display/msm/mdss-common.yaml         | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/mdss-common.yaml b/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
index ccd7d6417523..84ed2757ded5 100644
--- a/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
+++ b/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
@@ -77,6 +77,12 @@ properties:
     items:
       - description: MDSS_CORE reset
 
+  memory-region:
+    maxItems: 1
+    description:
+      Phandle to a node describing a reserved framebuffer memory region.
+      For example, the splash memory region set up by the bootloader.
+
 required:
   - reg
   - reg-names
-- 
2.25.1

