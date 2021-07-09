Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53D4A3C1E5B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jul 2021 06:31:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229719AbhGIEeb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Jul 2021 00:34:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229908AbhGIEe0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Jul 2021 00:34:26 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E51DDC06175F
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jul 2021 21:31:41 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id r16so5928170ljk.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jul 2021 21:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+l6RNZfO6t53h33tKaqwIC7dbp1+6FXvY3b6ZyHCbIM=;
        b=WlwvwLrQoeElCrOz8khcG1qUMUEX4LRnDzheKeTWgD0s/tDz3fm1rN5TCIGDvNLuWo
         VCeygJMIaI/e0Mx4OmU4mn7CbsYP+a2twV4vfJ1QwL1CbFLkihZ1ers+wr1iLTyzN6hI
         rVEyAGniCLt28C3LKq5xbcM0+urmeCV3MuGXUggWspmcLEXOKDmV/IMYZnkFONNhqa8D
         NMfMfVYJdp2WVsQ30HIsoUniSnmW1SERAu5uRkjqzYBJknZIlFVxMESm+QpmKsmvE5t2
         E7nyWENWm9fzwvquITAraHwHDC8DFgOtwlP9nr/T+YzFL2Lgpe5g8QXOeZDOrZeuk45/
         0kNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+l6RNZfO6t53h33tKaqwIC7dbp1+6FXvY3b6ZyHCbIM=;
        b=NldGMSgAKEpCcQhcHeUasgR7UJTScW70Ey5cTPhGGOQaeasvrUrnUWlkejgMBb3/aA
         +rV2Vb7zIjvM+I09pek9MZrb6WC3d+ysmtuvmnyj1S3vqDMNkhEfHexrZ69c3vHddWr5
         VR5L7rZvxZPMdaNKYvO1BjLi+WuJ2H/O5DTERN/FS1eqI0E2/3XtIsAvLp3rCWq50l2x
         Y8gMzI0zmceRdgOTj+7L2mVfMu0Wavw3wGrV6PrrpBeU0f8wd8rlIZlqvyZL1Ry5Rs8Z
         /p/hKQsLQU8FAVdUow8tSCiiUVF1zdACBVRkIFPb1BvyrcNq8lyHX1HCXebPlhVVWmTp
         9XcQ==
X-Gm-Message-State: AOAM533TpRNIRlIfSwCvGWt9SnCoeLeI0yz/0OuzMWAYQPNsfagFVUPn
        waiCF7BfHfOUhAZHQRoj3i/DeA==
X-Google-Smtp-Source: ABdhPJzJ2+kFilhrLt7SsXBip2dwdXrJIpKz5q8WYP9kQ47A3T9krwTqZFcblwqNnP6Hh6jPrB0U8w==
X-Received: by 2002:a2e:9c84:: with SMTP id x4mr22464773lji.161.1625805100191;
        Thu, 08 Jul 2021 21:31:40 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id h1sm13028lft.174.2021.07.08.21.31.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jul 2021 21:31:39 -0700 (PDT)
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
Subject: [RESEND PATCH v2 2/7] dt-bindings: clock: qcom,videocc: add mmcx power domain
Date:   Fri,  9 Jul 2021 07:31:31 +0300
Message-Id: <20210709043136.533205-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210709043136.533205-1-dmitry.baryshkov@linaro.org>
References: <20210709043136.533205-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On sm8250 videocc requires MMCX power domain to be powered up before
clock controller's registers become available. For now sm8250 was using
external regulator driven by the power domain to describe this
relationship. Switch into specifying power-domain and required opp-state
directly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/clock/qcom,videocc.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
index 567202942b88..db4ada6acf27 100644
--- a/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
@@ -47,6 +47,11 @@ properties:
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
@@ -61,6 +66,7 @@ additionalProperties: false
 examples:
   - |
     #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
     clock-controller@ab00000 {
       compatible = "qcom,sdm845-videocc";
       reg = <0x0ab00000 0x10000>;
@@ -69,5 +75,6 @@ examples:
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;
+      power-domains = <&rpmhpd SM8250_MMCX>;
     };
 ...
-- 
2.30.2

