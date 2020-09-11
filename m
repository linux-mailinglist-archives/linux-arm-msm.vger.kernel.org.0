Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3980A2660F0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Sep 2020 16:09:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725798AbgIKOIS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Sep 2020 10:08:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726222AbgIKNSO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Sep 2020 09:18:14 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FB59C06179A
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2020 06:09:59 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id d15so5756172lfq.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2020 06:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=m4ns89YXuM0U6R9CSxExw55LeHRMBm6M9s8J9s8KJ5Y=;
        b=MyFqACBLzEsrNY0onzRu9H2Pgubk3KjyVfKXRb8fM3agrYTYxV1/3561aCaUSBWAMU
         ++C8z0rXTCH01Ia6ahO6l0U5CopuutNfVaEYOnlJLEVaIRkbfpwveN9kIJjyWfoEqW31
         ky3j8tZxK0k2SBvWncA5VBxnq/+Xcs4DACk+jvRnvrnggJBZZlwxhu1YBxgWqseZsxM3
         RICde87H4cmidvHQ653IZc/kMxc3HwDlHUIBHOs4UIJfxIym/eGX9fARjRiHqxNMGv2U
         YuH1RIGVU2X1Kr1qJ404HiG0o9xV8p3ZOSXRLtbgeFVzF3qffq+SMclUnKa1frfv9LbH
         mnwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=m4ns89YXuM0U6R9CSxExw55LeHRMBm6M9s8J9s8KJ5Y=;
        b=Ba/+Fxa9d9eDnX5V9Fmb2RLDJzxyP9ZGljgfPe+3/QRKYLNOmwNfXl34sysLYl3Z06
         T2rxv3NuNcH9O2DtojH/4l7LAElnjnJaOT0/HLZbuwEQklutDczvXZZxL+fq79wrJ6wW
         misxnDQEzR6H9vlCOxQrM+zdLN2ZBKnv+o6/0IjcsJTPt2GvOVAtFKpRFOMwQCsg6FYM
         z1DcuHxYSXaO6Ij56M0KHZMqEb9K2luzHk0RuEYRPtCWsqcrRKO6LQfz5dbuxk1uHaqG
         7GQRIkfmU3PRwmvYC4/PST780+yFqxXmNwpA1ojtxZEOnD4MjlHK8rIiIrSvPsr5cTKS
         2aHQ==
X-Gm-Message-State: AOAM532i4vAPqBOWxSlg7QOJ/bdjdZ5gTtFTrcr2RgdWXoBOuXyOc5QZ
        MdWCQ4qekBO53NLZPlQl8vLIfw==
X-Google-Smtp-Source: ABdhPJxi0VYmp7gBeTBQ6AgxQP5uwzZL5/ZV44fTfyZC9ey0/o3x03y5vAjoHzqYMHQf+jjl1MmmHA==
X-Received: by 2002:a19:8005:: with SMTP id b5mr732861lfd.70.1599829797711;
        Fri, 11 Sep 2020 06:09:57 -0700 (PDT)
Received: from eriador.lan ([188.162.64.141])
        by smtp.gmail.com with ESMTPSA id 10sm429500lfq.64.2020.09.11.06.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2020 06:09:57 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        devicetree@vger.kernel.org
Subject: [RFC 1/4] dt-bindings: clock: qcom,dispcc: document power domain bindings
Date:   Fri, 11 Sep 2020 16:09:47 +0300
Message-Id: <20200911130950.578483-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200911130950.578483-1-dmitry.baryshkov@linaro.org>
References: <20200911130950.578483-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

SM8250 requires special power domain for accessing MMDS_GDSC registers.
Add bindings for the MMCX power domain.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/clock/qcom,dispcc.yaml           | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,dispcc.yaml b/Documentation/devicetree/bindings/clock/qcom,dispcc.yaml
index 0b905a4e9ada..6325d9969913 100644
--- a/Documentation/devicetree/bindings/clock/qcom,dispcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,dispcc.yaml
@@ -66,6 +66,16 @@ properties:
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
@@ -81,6 +91,7 @@ examples:
   - |
     #include <dt-bindings/clock/qcom,gcc-sdm845.h>
     #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
     clock-controller@af00000 {
       compatible = "qcom,sdm845-dispcc";
       reg = <0x0af00000 0x10000>;
@@ -105,5 +116,22 @@ examples:
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

