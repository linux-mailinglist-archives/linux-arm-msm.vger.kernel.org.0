Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6173C56104B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jun 2022 06:35:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231891AbiF3Efp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Jun 2022 00:35:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230135AbiF3Efo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Jun 2022 00:35:44 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8390E1F2D7
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jun 2022 21:35:43 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id h14-20020a1ccc0e000000b0039eff745c53so852171wmb.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jun 2022 21:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lAB0XA/QUtzjvvdVj5TZsij0CUewEyhxlHuwrr+z+/I=;
        b=IGpmhgGV+bN8n4jkVU/FQ9qSnGDuv4uNhnmtMKouQ2FWajTDd9vJ2m8BJBDnMiixjs
         25cFC6S7Hi/E5k5KLDetzk5nLrUby9S322RB9aoc+5+uUWbRnsUil614YhCT5DB8oUKD
         bKhhxHjxzI/4rmuTGBBfycY40iCc3++NDMFif2FOwWafzbrar9RVRnx88mZ+aLnIWT2A
         Xaf777IHHxII5TaeBgNyA3VtT+72ebYa+uzKfLeP1v+DdK4B1V13U9qjjCqJH92XLL+k
         KZOJSPJlfkpHWB8XD8WdTuOx2j77fR0DZXbKpKotL6KOGzTaiWDSmNhQje2EKfGYL0SB
         InYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lAB0XA/QUtzjvvdVj5TZsij0CUewEyhxlHuwrr+z+/I=;
        b=EKxIBUzMBswT6DABE1tfe7pnH+U/q2SVmgzLov4Jtea54ozGYWuxCq/pWDUQZF3S44
         EIA/Z/T2gSw9bvNs7+Ely+IUYTg9jGF0Vv2Nt7TUCaXWE7vtvgcq9qPCHONII3qqRJ1Y
         XcIZtIz+mdUpx5nlQC+/K9X8B6kLyXEIb4zS/wg1HgC43vV3i1hd9Cn3TI3TA4zAmUJF
         HBKMFulgNAUJtGXIma0u4sWv6oK6DgxoaIcDjE/9T8cGPzjBJwCYG4DA1g4ez+5HuvVz
         gP5zdKmSv7YXV0VCEVs7pyENOiPUq+DpdsEE883OfOXfKWx4S+8mKEGtz6gqeeR3nD4U
         jFhA==
X-Gm-Message-State: AJIora9TczwqQwUk8N1DckKoStv0IPDjSFFAQKApFf7qLKSIrGT4NCS3
        5JUqckO4fcOk5b5l9yueQDe2yQ==
X-Google-Smtp-Source: AGRyM1tJJTX7TL131B5lf3LzQBza6PPM+nKmvX9YuoZiXRj++vDakDjuwYCgD99s8N/9enr3OK4Ppg==
X-Received: by 2002:a05:600c:da:b0:3a1:20eb:dd40 with SMTP id u26-20020a05600c00da00b003a120ebdd40mr7456509wmm.25.1656563742063;
        Wed, 29 Jun 2022 21:35:42 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id k1-20020a5d6281000000b0021b9e360523sm18642335wru.8.2022.06.29.21.35.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jun 2022 21:35:41 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        jassisinghbrar@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        bryan.odonoghue@linaro.org
Subject: [PATCH 2/2] dt-bindings: mailbox: qcom: Add clock-output-names
Date:   Thu, 30 Jun 2022 05:35:36 +0100
Message-Id: <20220630043536.3308546-3-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220630043536.3308546-1-bryan.odonoghue@linaro.org>
References: <20220630043536.3308546-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add clock-output-names as optional so that SoCs such as the msm8939 which
have multiple a53 PLLs can latch the appropriate output name in
drivers/clk/qcom/apcs-msm8916.c.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml   | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
index f342494fd6108..7f3816cbc0353 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
@@ -63,6 +63,11 @@ properties:
       - const: aux
       - const: ref
 
+  clock-output-names:
+    Usage: optional
+    Value type: <string>
+    Definition: Name of the output clock.
+
 required:
   - compatible
   - reg
-- 
2.36.1

