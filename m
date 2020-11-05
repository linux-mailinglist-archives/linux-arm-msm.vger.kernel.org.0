Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26EC62A7C2C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Nov 2020 11:48:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730074AbgKEKsm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Nov 2020 05:48:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730059AbgKEKsl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Nov 2020 05:48:41 -0500
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF48CC0613D3
        for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2020 02:48:41 -0800 (PST)
Received: by mail-pf1-x429.google.com with SMTP id z3so1170241pfb.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2020 02:48:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=qDk/WLdPfqfnVhfBhaQ9EDmCSmTng2GQJJLJH9JNtu4=;
        b=MEfDeOCfActV1/s6XUhH7BWGz8UGY3f8v9vADXaSpUvQpebf/cEUmHQ00WkArwIMt8
         XSXO0/1ftU/OYwVI4IG+ARtrR9XOnGwxBYdAZH+jQj4yepbKAqExqOoGEzJwkUUBtirJ
         Ddv/ktPu6dID6hyPKNhp4StHLwNi3ynvgxOaSIiEH5H0v1OTcPgsuojy1fJDCg6edOWe
         jVj2K32+KNzEDQbV2hFKTyxhmxliwf4k5YEuqwB6r1Zy92TCNryJp7RlPqxRm5mwwupq
         MKv8+WrQGjxuotQlRcIiyYfBGza9sNbgOa/9Rtn/hzR7TjgcfYjKeTQysANpwn8m2Mz1
         hVSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=qDk/WLdPfqfnVhfBhaQ9EDmCSmTng2GQJJLJH9JNtu4=;
        b=AU062uANR0TnmJ8pzSvv1QJuFExogofUk20l/VuLvgmvjwcIkt8t2CX83TcOiiQ+yN
         Ci0+wOr3Jlaf2w1GEnxhB32XXkJGUJx10cSZfD0GoRPDD963ltkMFIHNyUkLQle4NnE0
         T8MYRGhG62VJ1WxLXEBzDfblYs3Z6DfP8qgMznquR386nbq4elYUOQwdQcNU0YMJzTkG
         /Fd+Pwu34s+NzA+cI1Byx2BD+54LiCMuKeDZRUHcHk140giismMU5Xas1k1ErCwnoAg9
         XRvazoi6Tmu4IVRUMz+ZxZ3l/bnbxoaPmBACMnBRiVRJRJosFjJUB8eadmqbE3oSM885
         BmOA==
X-Gm-Message-State: AOAM530Dm5lO4RutveSThAIjnH4TMrOGdt30ibx+G2gSHVPHOxi2TMQb
        SRGrJJlX/LusPmjAwf7VnYch
X-Google-Smtp-Source: ABdhPJy/HechZX5iFlKIjv90tNKWNE+UEGwgYegiNm9++/Q1+euGEuzre5ZQkIiA4GFZyCij1sDFZg==
X-Received: by 2002:aa7:8548:0:b029:164:769a:353 with SMTP id y8-20020aa785480000b0290164769a0353mr2032591pfn.45.1604573321280;
        Thu, 05 Nov 2020 02:48:41 -0800 (PST)
Received: from localhost.localdomain ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id a84sm2131234pfa.53.2020.11.05.02.48.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2020 02:48:40 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     sboyd@kernel.org, mturquette@baylibre.com, robh+dt@kernel.org
Cc:     bjorn.andersson@linaro.org, vkoul@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 3/4] dt-bindings: clock: Introduce RPMHCC bindings for SDX55
Date:   Thu,  5 Nov 2020 16:18:16 +0530
Message-Id: <20201105104817.15715-4-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201105104817.15715-1-manivannan.sadhasivam@linaro.org>
References: <20201105104817.15715-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Vinod Koul <vkoul@kernel.org>

Add compatible for SDX55 RPMHCC and DT include.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
 include/dt-bindings/clock/qcom,rpmh.h                    | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index a46a3a799a70..a54930f111ba 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -19,6 +19,7 @@ properties:
     enum:
       - qcom,sc7180-rpmh-clk
       - qcom,sdm845-rpmh-clk
+      - qcom,sdx55-rpmh-clk
       - qcom,sm8150-rpmh-clk
       - qcom,sm8250-rpmh-clk
 
diff --git a/include/dt-bindings/clock/qcom,rpmh.h b/include/dt-bindings/clock/qcom,rpmh.h
index 2e6c54e65455..cd806eccb7dd 100644
--- a/include/dt-bindings/clock/qcom,rpmh.h
+++ b/include/dt-bindings/clock/qcom,rpmh.h
@@ -21,5 +21,6 @@
 #define RPMH_IPA_CLK				12
 #define RPMH_LN_BB_CLK1				13
 #define RPMH_LN_BB_CLK1_A			14
+#define RPMH_QPIC_CLK				15
 
 #endif
-- 
2.17.1

