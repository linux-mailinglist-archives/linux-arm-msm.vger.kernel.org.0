Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 872034C9959
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Mar 2022 00:30:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236095AbiCAXbZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Mar 2022 18:31:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232607AbiCAXbY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Mar 2022 18:31:24 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61CFC5E14C
        for <linux-arm-msm@vger.kernel.org>; Tue,  1 Mar 2022 15:30:41 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id t13so17515280lfd.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Mar 2022 15:30:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UQNq0c2dJJYa7b6ah0fC7gdt+Ffzi4Qm4L0w9uhVvV4=;
        b=sdTEU6BkjPd37R6aZf9jdnWFxduBmKrfWssUTL6Rl7/rkptl3mEEA0989wFlo7894q
         xkM/+RgKC4jyfQDNiulqxjk/jNG9x30mLbvPs0ZXHZS1uS+20+7ltV8pvvsQYuhujoWO
         lcfhkDsEgmEBLn91L9Iya6OiebKQjqm5vFu7hGWrd5GJEB/p9QDHRn7Zw5XYU6cz13IZ
         lesMltaTRM1l4Gy5HOEsj2AzdA3z9p0iRQfxRTLdBL3MBMghFAaTXXtSoqntITh2gUjQ
         /1U9G8B/ek4bRKPBFVAzqs80qrNPBzoaOK5bpVzK318Xxa3NsA5e9JIUi3T/SS6gawSS
         UhXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UQNq0c2dJJYa7b6ah0fC7gdt+Ffzi4Qm4L0w9uhVvV4=;
        b=NKv6M88O4O6kJwKMfG3/jvrONJo42B7z4rrcgq3MT7O20HIsM2PS5P5GpFaj77tJka
         AuWWsrTv+MOGvNJPr2lWPEq/DTWP+uhjvXsZY2BfXu8xE92Q7OoNfJq6wVE3rRwQJPS1
         4kAIlTqKbKA4cSIizhBavdjCagvSSFecbJUy2AfQQOZxXuf4gkw3nbHVNlLsi7Tkk8kD
         2LmM/a6kitV2NSFiwaa6xdnSeJvl5vUu7b1HJRjkRZe2kQnPt6TZPN4v4JgA/5z7GJbj
         HYPR26lXTMmZAXzrYwFX1RELuTrCbuP8iDz6pLq0wIJCPFg1MEtVkC0Zas7AOKce7C9t
         queg==
X-Gm-Message-State: AOAM532i853AZyncAl5Tjabflnv0eIrgNOvdc8P+/zZP+UtrrIrolEmX
        RAsca4xdq7a6KDZjlghdUb2PIQ==
X-Google-Smtp-Source: ABdhPJx+nrWmjTTMludgJc2WsT0DEfSDum0jxuW/aGmAvRr5e8ATFvDQNkaJn8zjS5SK37bivfXUEQ==
X-Received: by 2002:ac2:4475:0:b0:443:5a36:26b5 with SMTP id y21-20020ac24475000000b004435a3626b5mr17600380lfl.424.1646177438686;
        Tue, 01 Mar 2022 15:30:38 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id c19-20020a056512325300b004433050ccb4sm1718833lfr.192.2022.03.01.15.30.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Mar 2022 15:30:38 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh@kernel.org>,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH] dt-bindings: display/msm: add missing brace in dpu-qcm2290.yaml
Date:   Wed,  2 Mar 2022 02:30:37 +0300
Message-Id: <20220301233037.2257996-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
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

Add missing brace in dpu-qcm2290.yaml. While we are at it, also fix
indentation for another brace, so it matches the corresponding line.

Reported-by: Rob Herring <robh@kernel.org>
Cc: Loic Poulain <loic.poulain@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml b/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
index 8766b13f0c46..b1b4652077db 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
@@ -209,6 +209,7 @@ examples:
                                         remote-endpoint = <&dsi0_in>;
                                 };
                         };
-                 };
+                };
          };
+    };
 ...
-- 
2.34.1

