Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E2AC5B338E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Sep 2022 11:21:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231263AbiIIJUt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Sep 2022 05:20:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231137AbiIIJUq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Sep 2022 05:20:46 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEAD5B5179
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Sep 2022 02:20:44 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id x10so1102855ljq.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Sep 2022 02:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=CEQ6kD7E3x3cGbQZ0xWqW+Ktcext0aENc2Q7rleIIpo=;
        b=UQbRgGgAD9DMTUfnKoGoUryiinB3JrR/+fLyeAF6ApFQ/GGvwVhkMpUYAG3K61OL2Q
         H/LYVddfrB9r4eGyEEYZiEfDoYfeHjbaLf9/7uoX8M5GhkDMlDyAfE6B0J3BkheHhSvT
         DQ8XwEpJ7IkA7atE5AfljkcQLqox8ldzdAXMpBE2RGB8JsRw3l7+Qbpox5kQ8EstKtYq
         8Q5ZFg5bIKxypbxCt9XQe0h8Vxr/MlQAT7MRPnXTFv9z+qvuJtL+vQ/7yW/u3EL+HrKA
         pL6H9uF8i3ssZDH7hiOhuN7VdfAXbFVosgmiXELdIsbPPiZBRVPtCiejocKDT5WgTmWq
         M/hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=CEQ6kD7E3x3cGbQZ0xWqW+Ktcext0aENc2Q7rleIIpo=;
        b=pq66LXoVd4A4kN/P6F7ojKh5gPotCsKWajA8loBCdDbN6aj7wnUUh9clLSq7kJdr3X
         AAwBbTUQ20WYM+dkFuGJDvdF/xP6zKEdA7SWOQwvyNh74C5tN1Ovn21Tm4kGqb9r9CvD
         KuDIjEPzdbSc/73hHLsMe+v3YC5QfTRYTL+YqXqV8ADBbJsfV7oWfawMBpWRQzYmFRwo
         a9mniZfCelrw6vOutjhBkoLQdVzhbgbG+AI3Zip6JRgD9RqbxliKYA0+Vqi3IO29+xqe
         5tKCdq8e1FLtyC9SPUUN/ASIbWvow7WyUyMFe+X+QtOoV5vsF+36vfVvavuC7d5vNTnS
         ZicA==
X-Gm-Message-State: ACgBeo3DOnMP4/hWjPTpkDj5ixTroP+nymnQXK3k4cBVezanZM0k4zFo
        Po/rlNAqY6vLnh0vSA3JXMeRcA==
X-Google-Smtp-Source: AA6agR4wosQnzzG9FY77Geu239a8YeXktmczFJO8DCKG+49rSSbuKPHSoXNQFdiVVS3he73xSaSrbA==
X-Received: by 2002:a05:651c:1611:b0:261:e11c:c2ef with SMTP id f17-20020a05651c161100b00261e11cc2efmr3497449ljq.340.1662715243162;
        Fri, 09 Sep 2022 02:20:43 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id s6-20020a056512214600b00498fe38ea0fsm2170lfr.174.2022.09.09.02.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Sep 2022 02:20:42 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 02/15] dt-bindings: hwlock: qcom-hwspinlock: correct example indentation
Date:   Fri,  9 Sep 2022 11:20:22 +0200
Message-Id: <20220909092035.223915-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220909092035.223915-1-krzysztof.kozlowski@linaro.org>
References: <20220909092035.223915-1-krzysztof.kozlowski@linaro.org>
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

