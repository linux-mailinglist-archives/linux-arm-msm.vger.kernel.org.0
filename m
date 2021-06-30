Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 411CA3B831C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jun 2021 15:32:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234907AbhF3Ne0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Jun 2021 09:34:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234913AbhF3NeX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Jun 2021 09:34:23 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 053D2C061787
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jun 2021 06:31:54 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id t17so5231424lfq.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jun 2021 06:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nNBOq0bo15wva/D2WTCq88A/17ZeZyPRomS/LrNe0ts=;
        b=dgIY7sK4bnZntJsFdKeuX3JSXJijisPf4DrByhje8LZyHq2IWlhKVP9ku1xgZUzpAf
         sJWmXN80L2edOpoIl0L+D9g1zNv3tkeyos/BqwQa07bx+5RrBdGrTiOa/TebxsbQNiv6
         /NZPnfZS/AuQAyccnvHLFdjQIBN8dUXq1/waUmbVrAhiJjUClWN0IbU9EXh0dcvp3esK
         AUbTUloBr+crrte1LDaHE0hBUOciBT092e8iikvHXYMEHuWY8KlzOydsxPF2hfhs86id
         RLc2NT9iscm5unOzaEBluXFP0UbvZukVXIZDho2VFUVs7AmsMf1uin/zQ33PQw+K4oFp
         qXUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nNBOq0bo15wva/D2WTCq88A/17ZeZyPRomS/LrNe0ts=;
        b=NVIoYwA9sjTc15pfemrK6Q8xpEjPxNV8TGWhJMYJyqbCqUeg7TOlFj7FqJey3+eEJk
         x2qfO+d8xfILmIZEZAoODk2n9/kRgk+LITiXo+OG5EqCe+Sl/u8Rm5K9IZ3gS1sej3hj
         C3qejngZYlnYoRrUCqpfn10I4kt96QxZGh7xETk1RHw9LWIox2K8EOfUdkbpy3wIfPCD
         ZgjLtJe1EX+08Xdj56r5CsIffs72GZbaSZVytXgjnTq/96JG+UAl7Jlon3k8OxztP0lt
         yJr+JBCY+uiHnzZ8pl+rFyDB9llMcut8dc06xeAsbgE4I5fbSStDmDWigTg+OMNdKX53
         yyjw==
X-Gm-Message-State: AOAM531tktO6RUpdZdTOYDlwqwBvJ/ieV6PLsskVIU2leE/IJXpBMB4p
        u4sN5dh3UcqJCWycYxOEDeAylg==
X-Google-Smtp-Source: ABdhPJzdmU+WJzwkad4YSPbt5INjxwDGUwStMVsVt49AZYkHTIMCGR6hXow3w1TJOc0Tf4F3l08Gcg==
X-Received: by 2002:ac2:546b:: with SMTP id e11mr28134650lfn.282.1625059912401;
        Wed, 30 Jun 2021 06:31:52 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id x20sm1578098lfd.128.2021.06.30.06.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jun 2021 06:31:51 -0700 (PDT)
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
Subject: [PATCH 1/6] dt-bindings: clock: qcom,dispcc-sm8x50: add mmcx power domain
Date:   Wed, 30 Jun 2021 16:31:44 +0300
Message-Id: <20210630133149.3204290-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210630133149.3204290-1-dmitry.baryshkov@linaro.org>
References: <20210630133149.3204290-1-dmitry.baryshkov@linaro.org>
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
 .../bindings/clock/qcom,dispcc-sm8x50.yaml    | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml b/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml
index 0cdf53f41f84..48d86fb34fa7 100644
--- a/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml
@@ -55,6 +55,16 @@ properties:
   reg:
     maxItems: 1
 
+  power-domains:
+    description:
+      A phandle and PM domain specifier for the MMCX power domain.
+    maxItems: 1
+
+  required-opps:
+    description:
+      Performance state to use for MMCX to enable register access.
+    maxItems: 1
+
 required:
   - compatible
   - reg
@@ -64,6 +74,15 @@ required:
   - '#reset-cells'
   - '#power-domain-cells'
 
+# Either both properties are present or both are absent
+dependencies:
+  power-domains:
+    required:
+      - required-opps
+  required-opps:
+    required:
+      - power-domains
+
 additionalProperties: false
 
 examples:
-- 
2.30.2

