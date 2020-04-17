Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEB1D1AD41C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2020 03:28:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727857AbgDQB2i (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Apr 2020 21:28:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725858AbgDQB2i (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Apr 2020 21:28:38 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCB6AC061A0C;
        Thu, 16 Apr 2020 18:28:37 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id h25so317474lja.10;
        Thu, 16 Apr 2020 18:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Tas9+PJOq1SU5PaTRpFIGQLRtXsUd9SyfvUfOPfxID4=;
        b=GoCmbeVymW5kZTztq1FiOXPWi00IQUPCf4CzXN4kT60xQ3zXH62Q8O/MMqErEOKkcK
         l5aehNafYAptkqEA+Cs+vT2zsG0oOtn0ImM3hze7T4i7TPovxWU10ku1M/nDy1bhUp+K
         H6NuuVE+x469Qv9JV8rJ7SC8FI3nGMNtszZleKdX/YNImHqzWfTMGQrIi9PcoAmtricV
         w/ByhYAkAfzslAmLvpdoT6J5cOovuPwtK/+HCUgA/Rw9Ub/d2oTtlhRKX2XMrEytaT1I
         Ldwib76dMmj/2ka2dbpcfy4DkpcJP6AXTv+tM5Pd5Y9gfDzz8IVwZT1bCoGiFZPAiFy5
         W8jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Tas9+PJOq1SU5PaTRpFIGQLRtXsUd9SyfvUfOPfxID4=;
        b=GEfn9QvzpDdjlqebpjcR3RZLBV2rRY6OGO4UJsc/YwTfmIVeSWrsQEYN8RgsZk8bw+
         NpmzxOObxitwo8bBHj/fQPzgZ+MQgi4m8BUwW8ozyowTzLg+okX4CfwAei4Tfgwmgut4
         y9bEhmOAgjDUngpobUF+JT0ir31uiy9V1WwrO1u4pcjZiUK19aMpK0s412PM6v2/H0Uj
         D9/oEsOUjWZeACvzE2M9DNYqMGJhbvZIIVAIbpItsQIK5B5Lc36agQ43ebl6YAfDeJND
         1NJLz2vap5BMaShloZviLaGqbwEBkdsWorCxumjd3EWYqt5hiWq7F6f//JAVcxn/Onmg
         tr2Q==
X-Gm-Message-State: AGi0PuYePWkJvV2Ew73MILMjgMG+ARkXsVShaz6IAKRtxZDprv/auidD
        Qrl8LSLmsyeAd7NAi9xgq8g=
X-Google-Smtp-Source: APiQypJummCqAa3wVXH5AUSo4f8GMvUWYhhI06v/eHFOJqaiC6yDuyIjGLgCIqIvx2eE1PpsnPhj0Q==
X-Received: by 2002:a05:651c:208:: with SMTP id y8mr508515ljn.280.1587086916322;
        Thu, 16 Apr 2020 18:28:36 -0700 (PDT)
Received: from localhost.localdomain ([94.229.111.13])
        by smtp.gmail.com with ESMTPSA id w25sm14644650ljo.78.2020.04.16.18.28.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2020 18:28:35 -0700 (PDT)
From:   Alexey Minnekhanov <alexey.min@gmail.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
Cc:     Alexey Minnekhanov <alexeymin@postmarketos.org>,
        Alexey Minnekhanov <alexey.min@gmail.com>
Subject: [PATCH v2 1/3] dt-bindings: arm: qcom: Add sdm630 and sdm660 SoCs
Date:   Fri, 17 Apr 2020 04:26:28 +0300
Message-Id: <20200417012630.222352-2-alexey.min@gmail.com>
X-Mailer: git-send-email 2.25.3
In-Reply-To: <20200417012630.222352-1-alexey.min@gmail.com>
References: <20200417012630.222352-1-alexey.min@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a SoC strings for the Qualcomm SDM630 and SDM660 SoCs.
Also document the new xiaomi,lavender compatible used in
a device tree binding.

Signed-off-by: Alexey Minnekhanov <alexey.min@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 64ddae3bd39f..6031aee0f5a8 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -37,6 +37,8 @@ description: |
         msm8994
         msm8996
         sc7180
+        sdm630
+        sdm660
         sdm845
 
   The 'board' element must be one of the following strings:
@@ -153,6 +155,11 @@ properties:
               - qcom,sc7180-idp
           - const: qcom,sc7180
 
+      - items:
+          - enum:
+              - xiaomi,lavender
+          - const: qcom,sdm660
+
       - items:
           - enum:
               - qcom,ipq6018-cp01-c1
-- 
2.25.3

