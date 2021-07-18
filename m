Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4594C3CC87F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Jul 2021 12:49:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232967AbhGRKwK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 18 Jul 2021 06:52:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231836AbhGRKwJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 18 Jul 2021 06:52:09 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1CA1C061762
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 Jul 2021 03:49:10 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id bn5so20814205ljb.10
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 Jul 2021 03:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EIpScdiCXHtz5HFKS+jehHcY8/9fE5GMmH0c5uPACAU=;
        b=AGXbjUn/f3tkWKTzx4g2vWUI5rxD3aacaiAgepT1wJ8AKNjwnPE5WAK2X84qlhjCwy
         RffR+Zr0Eu0JY1AyUZqurpCwnbWzFpsN0pBSLtD2Q9p10oDl6qo8guwUYrtq24voA0SU
         AaIxvQJ6vxPo0JjrEiPW+Nve9JDFOBUPKfHBuA0Ev+j01idNpH47tue4U4M9usRkv2WV
         vxG73R8vqG8GEPZ6LQXRpvDnOvB8a42enrn67mqn5ZN46rPOhH19ezQ6fM4SW0ocKKON
         cO5yCGPcs69TvgvuSo5vftylRTkvc8sOQr5BDJOmPtRheY1xKPsgDD3UIwMBECPtWMO4
         XqXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EIpScdiCXHtz5HFKS+jehHcY8/9fE5GMmH0c5uPACAU=;
        b=NDT7SqJkaShduxgVGlwUEgEea0pyxgsMhKh0c0fizWpQJNvBc5QKKssJUwMPFc9Bwo
         zJiQey4jhxHXN9HGgV3uuOc/e4Fmw+cgKgsoO+Tpu264TKnQcRW9lCifjzY1lDcaTu1N
         E2ro7fjRjr/6mAvUha+K4+HDLM4AGOhw9OK75yiUyIAP3Aq20KNCLMbQ3LfA4c8YUjAS
         sBStZfFMnfuUwNvmkExtrASMr+ZmOX+dtRXlBqFHGo4HE4m3ARuyhlGYJhOfAon2MoVc
         cnYYK+eFHRG3wqyK80mCvpVRdTP9pMwT/hKbyW06KRiOUhiHrTEJxJvxvtCIoiWDFlKG
         moGw==
X-Gm-Message-State: AOAM533cVoevrzE4jyPL1utR+uqEm2OTY3dZTGQRWXLqWsNrOmIyldA4
        Pvg7rlLh9fB+DPPbHCQHuygDjQ==
X-Google-Smtp-Source: ABdhPJzOptY7RHE6Ww4LdDbyp0j9IiGHw27LBAjoow5E5fHJnPAUgsG68vtXCYXp/sQC8rHd10KVoA==
X-Received: by 2002:a2e:7f1e:: with SMTP id a30mr18322867ljd.2.1626605349117;
        Sun, 18 Jul 2021 03:49:09 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id y22sm1039528lfh.154.2021.07.18.03.49.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jul 2021 03:49:08 -0700 (PDT)
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
        linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v5 2/9] dt-bindings: clock: qcom,videocc: add mmcx power domain
Date:   Sun, 18 Jul 2021 13:48:54 +0300
Message-Id: <20210718104901.454843-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210718104901.454843-1-dmitry.baryshkov@linaro.org>
References: <20210718104901.454843-1-dmitry.baryshkov@linaro.org>
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
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
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

