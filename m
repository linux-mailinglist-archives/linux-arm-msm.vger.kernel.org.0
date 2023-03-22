Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 21C626C529B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Mar 2023 18:36:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230044AbjCVRgW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Mar 2023 13:36:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229998AbjCVRgQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Mar 2023 13:36:16 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 161A462B45
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Mar 2023 10:36:05 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id ew6so13107026edb.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Mar 2023 10:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679506563;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cVFnu1zQ0MEJP8DPx2adTYSU0drd+r7H07N59ukTZGs=;
        b=LbgjyKnSs+epaWteDxKmSToBPtgsZlcWgOQCnZ17rn3Z8pU0PIbICP/5pD8yDh8n9a
         XqpMJK/YVLmRgpNUkKclQJzn9JJy9oKUjxsyGWtq6XIwuLCospI735pTr7EhEbKtXKQw
         JwNCVnuEO6aB4eHLY5xJpmhhI2BpHTjV2bO8j+TI+xaIz8lRFMpVUJVm95YdcYbLlG9Y
         nwT7h2fVwcG46Ke24w7x8jSN9t8Jn4BXZRmyeRD1cp0YebinYMtJ0bDUic2sW7prIxJa
         q740w8Y1tx1qkaiRndBcztdoMd9f5hrjAGVTdZ3qZPbn0pkfoqomcPoTka4JNxCINtCl
         c2zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679506563;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cVFnu1zQ0MEJP8DPx2adTYSU0drd+r7H07N59ukTZGs=;
        b=A4T51X9RkgSDxjRk3tvKPvro4nc9rjGJ+R6qNMfgMRLtAvIy3FH2qFQVjGmYYmI0n5
         Dn3IeoIvsFeAU/7EDptczFiiz7n/j3WTN1ZBNj5PxtENI9FFqnvYVO/BUkReaqaK9CC7
         NbjocvXXE93C6y51WpGp9Z0HG8AgIcWVoHEW9d0iVACGuKoTuVO2VMsNFl9Qcc1k0bZ9
         s9J4+3yCV7Rfrj8wD3xb/ZIy8r/Nhy25XzKZWIdzS2N5W5z3E+ajomugt9CGkR8Ptokb
         v3WdvXk/4W/3L46zOdzq+IYrK4s8C1tPuFVLZJdsuaiiXxsOi3AeSSKolkmx17/BnSp9
         Wm8g==
X-Gm-Message-State: AO0yUKUu32INGHcOaA8kNYhXJj3H5oAEquAk+C/662ipiMGOugxjnonn
        9mu0k/pTtErwfxff+ocBFDIOVw==
X-Google-Smtp-Source: AK7set/ItPz0amaF19eRdUHWUXMDX66S4p60wXqyVmt3LnJCNHWdUrbo8g9UQOJOJGgcy2Wn1+GfMA==
X-Received: by 2002:a17:907:6d0e:b0:939:e870:2b37 with SMTP id sa14-20020a1709076d0e00b00939e8702b37mr7552838ejc.70.1679506563565;
        Wed, 22 Mar 2023 10:36:03 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:5050:151b:e755:1c6])
        by smtp.gmail.com with ESMTPSA id t25-20020a170906065900b00939a61113d3sm2743910ejb.110.2023.03.22.10.36.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 10:36:03 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v3 1/2] dt-bindings: mailbox: qcom,apcs-kpss-global: correct SDX55 clocks
Date:   Wed, 22 Mar 2023 18:35:58 +0100
Message-Id: <20230322173559.809805-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

SDX55 and SDX65 DTS takes clocks in a bit different order.  Adjust
bindings to the DTS.

Fixes: 0d17014e9189 ("dt-bindings: mailbox: Add binding for SDX55 APCS")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
Acked-by: Manivannan Sadhasivam <mani@kernel.org>

---

Changes since v1:
1. Add Fixes tag
2. Add Acks
3. Split from other patchset, so it can be applied independently
---
 .../devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
index d888ead09282..2992227631c4 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
@@ -97,14 +97,14 @@ allOf:
       properties:
         clocks:
           items:
+            - description: reference clock
             - description: primary pll parent of the clock driver
             - description: auxiliary parent
-            - description: reference clock
         clock-names:
           items:
+            - const: ref
             - const: pll
             - const: aux
-            - const: ref
   - if:
       properties:
         compatible:
-- 
2.34.1

