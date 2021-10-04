Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 743964218B8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Oct 2021 22:51:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236939AbhJDUxF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Oct 2021 16:53:05 -0400
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.80]:28281 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236930AbhJDUxF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Oct 2021 16:53:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1633380669;
    s=strato-dkim-0002; d=gerhold.net;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=87RYJWciKXgbTBJhdBrbMj2V+kERkppVIR8/cBqKVOw=;
    b=EXmT3EsYWO5E58t24n3RyLuxOCocuaNf+UZ8+6K/smj6WeWAFfgcjWQVSjIBaGZXZ6
    Ev9AqbWA6630d0dfUvRx6kLv0yAuhztGzzAP4UOKSN6juTxCUc8h8UcAXiXEMikUvyPm
    ZQoiY7gLan4KDGIlzvdlXKY2IM4vpqJqlC4pmWF605JLBuYG+MM2bx2Oj1riiAwPV8yA
    ioQNoMn+wBSreK+EsakCW+GpFpjUYclxmy9jw7om21UilwhHo2rgHP5JYGF7bLXmT0KJ
    uNUx9EvicFzunXzdtwvusuejgwlY1OpZuPpBsdezfKA4Xf6BSLnr0YSnG5B7UvqIxzKx
    caDA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXTbAOHjRHIhr2eFePxBA="
X-RZG-CLASS-ID: mo00
Received: from droid..
    by smtp.strato.de (RZmta 47.33.8 DYNA|AUTH)
    with ESMTPSA id 301038x94Kp8KSl
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Mon, 4 Oct 2021 22:51:08 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH v2 08/15] dt-bindings: arm: cpus: Document qcom,msm8916-smp enable-method
Date:   Mon,  4 Oct 2021 22:49:48 +0200
Message-Id: <20211004204955.21077-8-stephan@gerhold.net>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211004201921.18526-1-stephan@gerhold.net>
References: <20211004201921.18526-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Since MSM8916 is an ARM v8 64-bit SoC the CPU cores are normally booted
using "psci" or "spin-table". Unfortunately, some devices come with signed
32-bit-only firmware without ARM64 and PSCI support. This setup is easy to
support since it's very similar to older 32-bit only Qualcomm SoCs
(e.g. MSM8226) and only requires adding a few new definitions to already
existing drivers.

Document the qcom,msm8916-smp enable-method. It is actually just an alias
of qcom,msm8226-smp since it should be implemented identically.
The enable-method is only valid on ARM32 and must not be used on ARM64.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
Changes in v2:
  - Clarify that this is only supposed to be used on ARM 32-bit
    (Add comment to commit message and DT schema)

The "see above for ARM v8 64-bit" comment refers to this a few lines
above in the DT schema:

      # On ARM v8 64-bit this property is required
      - enum:
          - psci
          - spin-table
---
 Documentation/devicetree/bindings/arm/cpus.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
index 11e3e09da2e5..6a95b2a76bdc 100644
--- a/Documentation/devicetree/bindings/arm/cpus.yaml
+++ b/Documentation/devicetree/bindings/arm/cpus.yaml
@@ -211,6 +211,8 @@ properties:
           - qcom,kpss-acc-v1
           - qcom,kpss-acc-v2
           - qcom,msm8226-smp
+          # Only valid on ARM 32-bit, see above for ARM v8 64-bit
+          - qcom,msm8916-smp
           - renesas,apmu
           - renesas,r9a06g032-smp
           - rockchip,rk3036-smp
@@ -295,7 +297,8 @@ properties:
       Specifies the ACC* node associated with this CPU.
 
       Required for systems that have an "enable-method" property
-      value of "qcom,kpss-acc-v1", "qcom,kpss-acc-v2" or "qcom,msm8226-smp"
+      value of "qcom,kpss-acc-v1", "qcom,kpss-acc-v2", "qcom,msm8226-smp"
+      or "qcom,msm8916-smp".
 
       * arm/msm/qcom,kpss-acc.txt
 
-- 
2.33.0

