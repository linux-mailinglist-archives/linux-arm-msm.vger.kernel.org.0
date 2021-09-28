Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19E7F41B4F7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Sep 2021 19:21:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242043AbhI1RXV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Sep 2021 13:23:21 -0400
Received: from mo4-p02-ob.smtp.rzone.de ([81.169.146.169]:19514 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242008AbhI1RXU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Sep 2021 13:23:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1632849691;
    s=strato-dkim-0002; d=gerhold.net;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=y4uOiDAp8t62rZRNRmbMQrHAwdutrhAvadGOkgVUDtw=;
    b=pRTrCqvEdkOi6IpvFoxV+NVs4P7tnTwLDyF1DaAqF5wuSRkG8sUIga8+fJcMdc/ZIQ
    7A2RKdKlyI6da/++ZO3wKP6zCgZCAXkNYk0VEWO0n4PnggiTRKug1mm/5QF2K4kAo2bH
    Z0vTa7VoKBgxFl1rzGlq07j6Zt05l2y7u0Y5lpOmCzFCwSYx1olswlSrh4Q6R3SPPRIy
    yAVZEunMjKKbTKs9LTR5xEfijF2m49dOMFfAyOS2kZzMZBP8S7vvZpfDG7Zo46k2CK/i
    CHOyggo+z8MKPJXY4a5N7p/RsmKFSUfkb+MR9xy9N/yN53AyVDzRPWFYn5jtG0A90Jrh
    Nbqg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXTbAOHjRHIhr3eFSKSxc="
X-RZG-CLASS-ID: mo00
Received: from droid..
    by smtp.strato.de (RZmta 47.33.8 DYNA|AUTH)
    with ESMTPSA id 301038x8SHLUoBO
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Tue, 28 Sep 2021 19:21:30 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 08/15] dt-bindings: arm: cpus: Document qcom,msm8916-smp enable-method
Date:   Tue, 28 Sep 2021 19:12:24 +0200
Message-Id: <20210928171231.12766-9-stephan@gerhold.net>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210928171231.12766-1-stephan@gerhold.net>
References: <20210928171231.12766-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Document the qcom,msm8916-smp enable method. It is actually just
an alias for qcom,msm8226-smp since it should be implemented identically.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 Documentation/devicetree/bindings/arm/cpus.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
index 11e3e09da2e5..5602a8f3c513 100644
--- a/Documentation/devicetree/bindings/arm/cpus.yaml
+++ b/Documentation/devicetree/bindings/arm/cpus.yaml
@@ -211,6 +211,7 @@ properties:
           - qcom,kpss-acc-v1
           - qcom,kpss-acc-v2
           - qcom,msm8226-smp
+          - qcom,msm8916-smp
           - renesas,apmu
           - renesas,r9a06g032-smp
           - rockchip,rk3036-smp
@@ -295,7 +296,8 @@ properties:
       Specifies the ACC* node associated with this CPU.
 
       Required for systems that have an "enable-method" property
-      value of "qcom,kpss-acc-v1", "qcom,kpss-acc-v2" or "qcom,msm8226-smp"
+      value of "qcom,kpss-acc-v1", "qcom,kpss-acc-v2", "qcom,msm8226-smp"
+      or "qcom,msm8916-smp".
 
       * arm/msm/qcom,kpss-acc.txt
 
-- 
2.33.0

