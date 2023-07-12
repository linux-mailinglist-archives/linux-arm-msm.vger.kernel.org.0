Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB4DA750474
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jul 2023 12:33:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231213AbjGLKdJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Jul 2023 06:33:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230482AbjGLKdI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Jul 2023 06:33:08 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F16D19BE
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jul 2023 03:33:01 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-666ecf9a0ceso3754590b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jul 2023 03:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689157981; x=1691749981;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e13SfAv3mkxr13sh2zccycdVfYk3DnppP3UbAnCxXg0=;
        b=Ca09rhEgb6ojq0u0UvM/5aFL0yWnVY4h58QT7BgJDNvSXGhILsRiZHU0jdCSqzcbpu
         hnW96pJxl9ZX5UhmbaN0AGWhNkxJ/l+Vwhq2U/PDIdbkTW3qZub6dwDP/ozUJ0wyFxbJ
         QTtjsEQig7p/InOOk9vidRP+BLNWQPG0BBy+eSRwvx2Y9APZXKyhGLVMxlvls7mnu8Xt
         DuqJVk8KmAEfZtgc75z/ynAQeOolYAjBVU3J/bo/eClNcXtdgcEgKRFJDGxxs8U6zZlk
         vF4gaNRAuId2ngjU+8fw4kJlnxORfzkJyJSY16gwqhyZeUglmi+TTluufre00QzhhDr6
         BrWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689157981; x=1691749981;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e13SfAv3mkxr13sh2zccycdVfYk3DnppP3UbAnCxXg0=;
        b=UGaMFK2zsoqKBVhRrVZMKqumVj75lLurcgvs7mI0P+jd0MZmJcB5eUiSSkTwH/FOBn
         cPeyOGRuEgppRmh7gnNaFZWoHic8X1PQHslhpJHwcocH7vpM1/DJOq9mrw5ETanmZIZ5
         kp66YwGnaP51IMyPlGGuk9JOQVLOGLPmlnHU9bRBZx2QE9H0nfG1rT8lgo54J24c+ICT
         kfSS9TYM98jYL1pt/5I2zvedJMxCXMQGWD0o543f2mCX5jMGUrwJI/MRRlo2EWd0X0o9
         ph8T6Y2Rtva/LLfwgW4YPZ1XFPoLx8nQ8ZR7Vt5xngE6gaGOpIdeq5vOEI3XpxfAvEuG
         KqqQ==
X-Gm-Message-State: ABy/qLZzLAIC/3+glXFEHtawAZawcOMuWV+HyHTRfi3GiHl6fZQkZkXB
        Wj/Bx138C+5KBVPXU2D6ApRH
X-Google-Smtp-Source: APBJJlEQDnyYoBcNDFB/bYy8lcIhnHgt9U2pSTW3WQh93Asm59Ne5LcrdAai6EmmSgEX11TkGYo8Qg==
X-Received: by 2002:a05:6a20:6a0a:b0:117:a2f3:3c93 with SMTP id p10-20020a056a206a0a00b00117a2f33c93mr19240704pzk.2.1689157980845;
        Wed, 12 Jul 2023 03:33:00 -0700 (PDT)
Received: from localhost.localdomain ([117.207.27.131])
        by smtp.gmail.com with ESMTPSA id k15-20020aa790cf000000b00666b3706be6sm3247860pfk.107.2023.07.12.03.32.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jul 2023 03:33:00 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     vireshk@kernel.org, nm@ti.com, sboyd@kernel.org,
        myungjoo.ham@samsung.com, kyungmin.park@samsung.com,
        cw00.choi@samsung.com, andersson@kernel.org,
        konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc:     linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        quic_asutoshd@quicinc.com, quic_cang@quicinc.com,
        quic_nitirawa@quicinc.com, quic_narepall@quicinc.com,
        quic_bhaskarv@quicinc.com, quic_richardp@quicinc.com,
        quic_nguyenb@quicinc.com, quic_ziqichen@quicinc.com,
        bmasney@redhat.com, krzysztof.kozlowski@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 02/14] dt-bindings: opp: Increase maxItems for opp-hz property
Date:   Wed, 12 Jul 2023 16:01:57 +0530
Message-Id: <20230712103213.101770-3-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230712103213.101770-1-manivannan.sadhasivam@linaro.org>
References: <20230712103213.101770-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Current limit of 16 will be exhausted by platforms specifying the frequency
for 9 clocks using opp-hz, like Qcom SDM845 SoC: 9 * 2 (64 bits) = 18

So let's increase the limit to 32 which should be enough for most platforms
(hopefully).

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 Documentation/devicetree/bindings/opp/opp-v2-base.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/opp/opp-v2-base.yaml b/Documentation/devicetree/bindings/opp/opp-v2-base.yaml
index 47e6f36b7637..e2f8f7af3cf4 100644
--- a/Documentation/devicetree/bindings/opp/opp-v2-base.yaml
+++ b/Documentation/devicetree/bindings/opp/opp-v2-base.yaml
@@ -56,7 +56,7 @@ patternProperties:
           need to be configured and that is left for the implementation
           specific binding.
         minItems: 1
-        maxItems: 16
+        maxItems: 32
         items:
           maxItems: 1
 
-- 
2.25.1

