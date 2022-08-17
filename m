Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8EB3C596FA9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Aug 2022 15:19:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239783AbiHQNOk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Aug 2022 09:14:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239695AbiHQNOa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Aug 2022 09:14:30 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F2B14BD0F
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Aug 2022 06:14:25 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id v10so13506132ljh.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Aug 2022 06:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=CEQ6kD7E3x3cGbQZ0xWqW+Ktcext0aENc2Q7rleIIpo=;
        b=ZLW1S4NiQU/zIX4dyxR1JbzzCb9w3pYh1ElEDkry2G49gQQwdoV4ZbBEqfMgLxvwk3
         qn+U7LlGYMMHtOuupRnX8wo5BaXQZ/2ZwVjnVyzLnIEYucldFUClvsxpWRN+iETeLROc
         3cDiMgCF/bt9aMWhEKVS/XdpDnVf3PlchWidgj0aheh6UxqdZNGDEthcLtIMhjOy+kIR
         e7b7pEC56l7+71GHun2fdcULFqQ1kKpR6UTQP+eE1SPSEp+UjB0ZTuCl8BMBLmHkGfIB
         B3kS5jZR+NQJvCcCVOQ1NLmZagOGE+A7fVI2sHna6YocLY8uTFyo+GSzeX70G6nxCuNx
         2ZJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=CEQ6kD7E3x3cGbQZ0xWqW+Ktcext0aENc2Q7rleIIpo=;
        b=DG1fZ5DJpRAN4/Borma89E/42aLc9lK4urr0+C029RSDC9Wbx6j9TVzdCUa6J/8Zeb
         F/jyvGZe7jzwCn4Q9pbVbqifGGTMvU61hUm1KGn/xCpUfuK78kcVvFCcKyY0iJ9WhZyR
         WeouCOdXNSUMEEjOJtT55H1ahlQtDceRq+Snia0oWhcVkY7rcJranpVBRs1lAvU+E4V0
         INQbD/wQzhOMb1huFBCZqmceBNOd5PG1xMIYdGGR4GhHRtZ02lB+C+BVA1O8wxtngLHT
         Z7qYd0BFz18kLctJbK0L9JuuYkrDyOSbW/5OIIyr6wcPtNFmz/kbBjvI9U4vdOBDSUYz
         /gCQ==
X-Gm-Message-State: ACgBeo02wwZGgrWOZpi8SZCHTgEncAr9GVWhqmOWBiJbC54H/6yKJeN2
        G0CEpYVOXYVdFzYXBC29ZDLITg==
X-Google-Smtp-Source: AA6agR7KrrzN7b/lcEy++KQc/DJ9TjbfJCRkrrA6FmPSFUqMwZ0dAq5BtJWI5XRcsnwJW3AfxaUL6g==
X-Received: by 2002:a05:651c:14e:b0:25f:dbf7:8636 with SMTP id c14-20020a05651c014e00b0025fdbf78636mr8007233ljd.51.1660742063840;
        Wed, 17 Aug 2022 06:14:23 -0700 (PDT)
Received: from krzk-bin.. (d15l54h48cw7vbh-qr4-4.rev.dnainternet.fi. [2001:14bb:ae:539c:1b1c:14b7:109b:ed76])
        by smtp.gmail.com with ESMTPSA id k1-20020a2ea261000000b0026182f31aa0sm1411307ljm.1.2022.08.17.06.14.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 06:14:23 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Lee Jones <lee@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RFT PATCH 02/12] dt-bindings: hwlock: qcom-hwspinlock: correct example indentation
Date:   Wed, 17 Aug 2022 16:14:05 +0300
Message-Id: <20220817131415.714340-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220817131415.714340-1-krzysztof.kozlowski@linaro.org>
References: <20220817131415.714340-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use some consistent indentation (4-space) for DTS example.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/hwlock/qcom-hwspinlock.yaml    | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/hwlock/qcom-hwspinlock.yaml b/Documentation/devicetree/bindings/hwlock/qcom-hwspinlock.yaml
index de98b961fb38..1a3adf75934b 100644
--- a/Documentation/devicetree/bindings/hwlock/qcom-hwspinlock.yaml
+++ b/Documentation/devicetree/bindings/hwlock/qcom-hwspinlock.yaml
@@ -43,9 +43,9 @@ additionalProperties: false
 
 examples:
   - |
-        tcsr_mutex: hwlock@1f40000 {
-                compatible = "qcom,tcsr-mutex";
-                reg = <0x01f40000 0x40000>;
-                #hwlock-cells = <1>;
-        };
+    hwlock@1f40000 {
+        compatible = "qcom,tcsr-mutex";
+        reg = <0x01f40000 0x40000>;
+        #hwlock-cells = <1>;
+    };
 ...
-- 
2.34.1

