Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D5F53C2C9A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Jul 2021 03:33:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231753AbhGJBfs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Jul 2021 21:35:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231577AbhGJBfn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Jul 2021 21:35:43 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C3A0C0613EF
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jul 2021 18:32:57 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id h19so17057ljl.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jul 2021 18:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VrN3elTI7+Kzg6g/SXVfIltFU3nA2N1wG+nv/RHcI9U=;
        b=TsGqX9r08myLBRBpZxu83bcCsAtPbTnf38LqBnpRufsarBMYAAQIBQyo4YiewiqxOa
         550OxDGs1qnBM6P6Lmrj3egadxWAKVruhkURl+9ZNXDHCDL8CWZFVx67vT/IN2TwmbRG
         rRGY8ptYEAdhWxlWgDSO+l8hOE/zDc6jMK0g+eNPyoCcFReoN90TUvmkuEEXer0mFXAb
         Ge2B/lUjLMqaEBqPPbpAYhqFMwhXTCr7WiQWTJBgtQt388RsqZAOLwMGqXmE74xIKQQS
         L0RGE/yIoLIYIPcUEAWqXlQoCbZRoaoHbkB3Z/Y6lvW3nexqCJ/7jM77c7J57k3DwTEj
         s52Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VrN3elTI7+Kzg6g/SXVfIltFU3nA2N1wG+nv/RHcI9U=;
        b=T3MeFjICnfnvfmnHgJZtmtO7uGQC23/8wGrzN+dnnt/9wUJ0vpDpn2nB/HtCpYRtgr
         ugVIx3h0I0WDJVP92+z4uCycPPgFIXJ2/Y9XANqTmwpCcigX3ypMv7/RUOH0zJhNyf/0
         2u5f5UHgZZ1bGkJVyYsTj90lzm6urNLlZz5OONFx8DUx3qLjEbenuSLTT1CDsEVxapmK
         VzAMMQo2i5w8LRhrPVCOpeUNo7sD4z5f9JgDT6HuKMHNHEEasMi9UEAJ/i/ojJVYY9Ih
         C3zYvDXsS/v0eLLZNDdTSA72NWdcBcPCvtjZy44f7V8sZSBvTMkoHYXXSW/re0rNfDhA
         +dsQ==
X-Gm-Message-State: AOAM531rfzGjI+UwZUO3FmbtZ0tR+n16q0f3bHNfdriMpE39zL4d7ZAR
        gqCo5ubFwpqLa5k8+v7Q3Bpfew==
X-Google-Smtp-Source: ABdhPJy0X5/mqnBvFEI8/TZ91QxTtriJEzkTBGMP1Xr9Mp7g+lm+TvlFSBZCFghjhtnHuaX8sqWdcA==
X-Received: by 2002:a2e:b6ca:: with SMTP id m10mr2944239ljo.282.1625880775932;
        Fri, 09 Jul 2021 18:32:55 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id p13sm588788lfh.206.2021.07.09.18.32.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 18:32:55 -0700 (PDT)
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
Subject: [PATCH v4 1/6] dt-bindings: clock: qcom,dispcc-sm8x50: add mmcx power domain
Date:   Sat, 10 Jul 2021 04:32:48 +0300
Message-Id: <20210710013253.1134341-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210710013253.1134341-1-dmitry.baryshkov@linaro.org>
References: <20210710013253.1134341-1-dmitry.baryshkov@linaro.org>
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
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
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

