Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90A0329D453
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Oct 2020 22:51:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728147AbgJ1VvW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Oct 2020 17:51:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728121AbgJ1VvO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Oct 2020 17:51:14 -0400
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com [IPv6:2607:f8b0:4864:20::f2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D64E7C0613D2
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2020 14:51:14 -0700 (PDT)
Received: by mail-qv1-xf2f.google.com with SMTP id bl9so528899qvb.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2020 14:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=eVyqGjvfohdsbrYhdD/p8pzCpzKljI3AzNSUpTK32Wo=;
        b=a3f/43froPNpVcVXZ6k1VnyH1sem1ux4I7smr6NCTtzZfcNGHHGRF6DID+ixtzNnKt
         DBWpxCf9XycFS4Fqtf2I4R8RjVVMJUJqyhHSi0bfLLxWzwgsvi+2kpcIylLYoxTT98H+
         Guonng2LHV7BASnrcuugFBuBuhWG1eMR9YvTtSZfayqa/KMGXQr0hVLtOIFD8YqKZeSO
         yPKzTS7ms6xxBDHHpZ4lElpGJ7DO3FmnxgTvEGVt+ezAEr2wD+Hcz2z3Hs+U+vqgPLeS
         HVw3sdg5YmK2QqaOdYTwbllL+JCcxdhf+t9dI1D4YKZsH3R5N81SZN/cciBshopC8vjK
         6bJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=eVyqGjvfohdsbrYhdD/p8pzCpzKljI3AzNSUpTK32Wo=;
        b=f4k0Q568jg9MTjlNwrJISe7Nf4A3U+2FagpI4WET2yObEl6RqxDl/1QvAOhBkatmJB
         W2F57KJx3JVii85hDnsB5q/V2AFAZNxJbtLZ+LsJGeNfts6QWXOHZGhTnZ8KN1tA/bm/
         6pHKjuqwGrsExsitFxfEqF2oIS0q8YOpLCLPYGj0hMD711Vbu4vO9wZ7aip2VhuXxryT
         W9ihMCRB2xOX4sRJR8y8Ys6ZGg+tEfd+bzzaEneL8Ukzr2ybkysYruciRqLznB8F06ih
         WaLGlHBUqCdPe7R/QVixQidZxlhK8cxOb3bB0tW67Lser4bnaRzAsl1VGFF2tWSuq+/n
         du0Q==
X-Gm-Message-State: AOAM533mmx9FhEfLRwhdovyYsLg4/N8cJCMqYpqRc0PfqHuDzpnlLf3y
        /bjOlIU7IMZp66vrjWf0WJbJcQDmuKtc
X-Google-Smtp-Source: ABdhPJzZQsPZCrT9I8dKOJrQcceX296IYhD6o42iY3UR6M0j3Ecp49oF0iQ7ke9WBgq6ATTs6M9vcg==
X-Received: by 2002:a17:902:b7c5:b029:d6:1158:99af with SMTP id v5-20020a170902b7c5b02900d6115899afmr6209912plz.26.1603870991742;
        Wed, 28 Oct 2020 00:43:11 -0700 (PDT)
Received: from localhost.localdomain ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id e7sm4289579pgj.19.2020.10.28.00.43.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2020 00:43:11 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     sboyd@kernel.org, mturquette@baylibre.com, robh+dt@kernel.org
Cc:     bjorn.andersson@linaro.org, vkoul@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] dt-bindings: clock: Introduce RPMHCC bindings for SDX55
Date:   Wed, 28 Oct 2020 13:12:31 +0530
Message-Id: <20201028074232.22922-4-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201028074232.22922-1-manivannan.sadhasivam@linaro.org>
References: <20201028074232.22922-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Vinod Koul <vkoul@kernel.org>

Add compatible for SDX55 RPMHCC and DT include.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
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

