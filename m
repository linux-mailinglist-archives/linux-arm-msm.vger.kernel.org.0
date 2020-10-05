Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 991132842BC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Oct 2020 00:59:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725917AbgJEW7Y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Oct 2020 18:59:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726934AbgJEW7X (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Oct 2020 18:59:23 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CC47C0613A9
        for <linux-arm-msm@vger.kernel.org>; Mon,  5 Oct 2020 15:59:23 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id m16so6654499ljo.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Oct 2020 15:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ec+lFJXXpYdKVcAgS5nPom7szthl3JZjRQTJpgctzh8=;
        b=Np6/nG/eJvBBMJLrAgvsX1rVlX8XCQOEJb0clj70XhtGRdyKiyeOBwUVTBucC/u5kf
         47NjAtgZK69FJUtmEbCvRqm+A2CPkOQ2UONrAitFKQGyhs0giW1c4OkLW3rerCDtTekK
         mEEuH7Y7vH483S6+BXG4ufi7pPeDBIcG0jXMBvyhTqnEVgumunXeZWj02d+isIZEwKrQ
         34+42k+jwDSHB+HvH7V5KCyJ8/+XI4//cLhn4SRFu7bIdJ8TgKbapqbONqzCihjyrcDE
         Gdf7gkQgkK6O58YRPQwN9HMdB9R2HX5nZAXw5fFVn8ZeVBieMRz4pfvjvOD5OVyZz3o0
         G3Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ec+lFJXXpYdKVcAgS5nPom7szthl3JZjRQTJpgctzh8=;
        b=A+OK5k8TQsDq/0JQnXGDaCFqg9DaKWiH5wLZhA/8stnn8NfmtXupo0EXUpf0sYkYrL
         m95nTlAi68t0OKvrqVPkfJ0fzPg50o17DcB31epyHZ4+FCWeWmUKtbQwJfEwNvgeZXxa
         8qYfTvtj0CBBIymg++NNTpBdXwXANoR8fmiA8AmJqAd7usfQMmR9i4ku9efE3brbuY9S
         NaPpAm4/KqfmP9KiTMf/g76r/bKlVi7vv3uxcfs4K+NqFvLgtEvretrD9Mgm7YBQh/iL
         JPsmly9HSRKfFdevV7h74WjP1g0V/ajhM0fIgAaMNIvZUrMd8h2rrVhPJrg4tMa6QNCj
         U7Mw==
X-Gm-Message-State: AOAM532sZ9NDYTiEyIWRMpz5DKvMxZLRJFT9NmJVfNig1/bn0pI6Soqa
        KR+RJDj3+Ql3s4/QuGxkJIKbVQ==
X-Google-Smtp-Source: ABdhPJyO4hWrst8T/YXLgSsUBU8nv3D+f+hrPiaTj9/PbHRINIqlppWntp7xMkx36oDDa5h/YdSYdg==
X-Received: by 2002:a2e:c49:: with SMTP id o9mr647629ljd.296.1601938761840;
        Mon, 05 Oct 2020 15:59:21 -0700 (PDT)
Received: from eriador.lan ([188.162.64.219])
        by smtp.gmail.com with ESMTPSA id x4sm353831ljc.80.2020.10.05.15.59.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2020 15:59:21 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v1 1/3] dt-bindings: clock: qcom,dispcc: document power domain bindings
Date:   Tue,  6 Oct 2020 01:59:12 +0300
Message-Id: <20201005225914.315852-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201005225914.315852-1-dmitry.baryshkov@linaro.org>
References: <20201005225914.315852-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

SM8250 requires special power domain for accessing MMDS_GDSC registers.
Add bindings for the MMCX power domain.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/clock/qcom,sdm845-dispcc.yaml    | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sdm845-dispcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sdm845-dispcc.yaml
index 4a3be733d042..ff0db55470ac 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sdm845-dispcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sdm845-dispcc.yaml
@@ -58,6 +58,16 @@ properties:
   reg:
     maxItems: 1
 
+  power-domains:
+    maxItems: 1
+
+  power-domain-names:
+    items:
+      - const: mmcx
+
+  required-opps:
+    maxItems: 1
+
 required:
   - compatible
   - reg
@@ -73,6 +83,7 @@ examples:
   - |
     #include <dt-bindings/clock/qcom,gcc-sdm845.h>
     #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
     clock-controller@af00000 {
       compatible = "qcom,sdm845-dispcc";
       reg = <0x0af00000 0x10000>;
@@ -97,5 +108,22 @@ examples:
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;
+      /* this is a part of sm8250 setup the power domain example */
+      power-domains = <&rpmhpd SDM845_CX>;
+      power-domain-names = "mmcx";
+      required-opps = <&rpmhpd_opp_low_svs>;
+    };
+    rpmhpd: power-controller {
+      compatible = "qcom,sdm845-rpmhpd";
+      #power-domain-cells = <1>;
+      operating-points-v2 = <&rpmhpd_opp_table>;
+
+      rpmhpd_opp_table: opp-table {
+        compatible = "operating-points-v2";
+
+        rpmhpd_opp_low_svs: opp3 {
+          opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
+        };
+      };
     };
 ...
-- 
2.28.0

