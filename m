Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 352663C1D0C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jul 2021 03:31:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230235AbhGIBdh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Jul 2021 21:33:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230262AbhGIBdd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Jul 2021 21:33:33 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 141A6C061760
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jul 2021 18:30:50 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id s18so5366959ljg.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jul 2021 18:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KLWZj85HgqkOqv1HxmNCRrODidaWLC0A2DygbxwWKbA=;
        b=Q+7Q06TZMaRjb0umJVm8KyLu9MHa3JJHlLCPzVZ7OBOVBMu7IhodPJTBciQftzkP27
         Z9bskE9ahMvfBjG+XIf7Y/uhylwsmrCMDjm46DuoMBO+nAxF5BZbNDEYifc69xgt47aY
         l8uRhn4igEMAydPH4TU1JZUpHrnhC15LsuIakC1sqlCFye9ZkM+YIih3MeP1UpaAOyvv
         13WBz0AFMfa8G6gk/SJx9Z0Cdu2Hqc/IbqyDI1IBWQQJ/YSR1UiQ5BkVle+FdQ3XVNR3
         esK5CIfXyX9bjc9V24g9frP8cftRFEr6pTODIkXeHyeiUTVhf7duaeY9ZNMjvY/wEVwM
         tmJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KLWZj85HgqkOqv1HxmNCRrODidaWLC0A2DygbxwWKbA=;
        b=AmM/Cwr6q6lnE1UGltIruGrMS5di2rkdaUzTWc5/WfJ7SdVDXrEIZQc+hQCYfnEuwm
         ruHihWMUFUaE16wZqR7U97ZIKcdjrZZZTVDubQQYtCYk5/4JaRapbyccPp29dSdaH+09
         miuKMnZbR3K3q3HLU5e0ZI5oluOHwFXz4bcXa2dvjx+cTcZvlDCeBtSSCn/ioDCl3/i8
         oc2w1VMlqyw7UtS0AN3xhcDasqmLwiz/pCtEeNXHSAvJ4ixabAN0LOtf9mJOltWNVlk2
         c8JdMUc8mExbCVji1GIdSzCTnwA3+oVV5oPAm1059ZKSa89Vl+IoLa7czS/mRCMiPfIa
         FHIg==
X-Gm-Message-State: AOAM531fXmYUvjdR7iSJUcvHfCJZJPQr+la8tEOmNjXy7Sox13iY4vbe
        jir3INk8vXtKC7sXeJ1OWxEqcg==
X-Google-Smtp-Source: ABdhPJx2k6Xm8E5xsLvF3RDfCZJ65Ifo/B0TBeALDSbIwgbtTanatypBMXqYC8pOu436474jtNXeVw==
X-Received: by 2002:a05:651c:d4:: with SMTP id 20mr27455105ljr.68.1625794248294;
        Thu, 08 Jul 2021 18:30:48 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u16sm405637ljj.113.2021.07.08.18.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jul 2021 18:30:47 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/7] dt-bindings: clock: qcom,dispcc-sm8x50: add mmcx power domain
Date:   Fri,  9 Jul 2021 04:30:37 +0300
Message-Id: <20210709013043.495233-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210709013043.495233-1-dmitry.baryshkov@linaro.org>
References: <20210709013043.495233-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On sm8250 dispcc requires MMCX power domain to be powered up before
clock controller's registers become available. For now sm8250 was using
external regulator driven by the power domain to describe this
relationship. Switch into specifying power-domain and required opp-state
directly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml      | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml b/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml
index 0cdf53f41f84..d5c4fed56b6e 100644
--- a/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml
@@ -55,6 +55,11 @@ properties:
   reg:
     maxItems: 1
 
+  power-domains:
+    description:
+      A phandle and PM domain specifier for the MMCX power domain.
+    maxItems: 1
+
 required:
   - compatible
   - reg
@@ -69,6 +74,7 @@ additionalProperties: false
 examples:
   - |
     #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
     clock-controller@af00000 {
       compatible = "qcom,sm8250-dispcc";
       reg = <0x0af00000 0x10000>;
@@ -89,5 +95,6 @@ examples:
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;
+      power-domains = <&rpmhpd SM8250_MMCX>;
     };
 ...
-- 
2.30.2

