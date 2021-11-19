Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 118FE457844
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Nov 2021 22:40:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230436AbhKSVn6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 Nov 2021 16:43:58 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.53]:34899 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229633AbhKSVn6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 Nov 2021 16:43:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1637358046;
    s=strato-dkim-0002; d=gerhold.net;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=oiRitK5VJP7/t+9OumbYNHeEIbRBna47wZNgODpkra8=;
    b=obBot1J1Z6Sm4kR/HPLP0Yt1zs5WMQ9Ec+MvKyiVIXxx9OBIUFmgSCU3aODmoUE50r
    QiT0M5GE32AkYJll7GUk9DMN5zw/6oSFcWhnG3p38a0U0G/wi3kfoOx0cynqRs8adJ0l
    1i7x8SIq8GtNaNe5XrTVJIqYMnV0qKCA/3ionxoqHlm1o/gR5Pfys1IVRXQXQCKxPUQj
    3nyek3WTA54s6F2yXIysfO8YfOMw8saFjahbe3KTDaytmJZjd05hqqSPa5QIjCVonOV3
    JHYo2UOreH1BmLP/dOV4klWxS1DyTrCzkFu1JG2LyAylSLhCUoXDhkdklXirSTsyrEXu
    KDmQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXQ7UOGqRde+a0fiL0Iik="
X-RZG-CLASS-ID: mo00
Received: from droid..
    by smtp.strato.de (RZmta 47.34.5 AUTH)
    with ESMTPSA id j05669xAJLek0CR
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Fri, 19 Nov 2021 22:40:46 +0100 (CET)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Maulik Shah <mkshah@codeaurora.org>,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH v2 1/3] dt-bindings: soc: qcom: stats: Document compatibles with fixed offset
Date:   Fri, 19 Nov 2021 22:39:51 +0100
Message-Id: <20211119213953.31970-2-stephan@gerhold.net>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211119213953.31970-1-stephan@gerhold.net>
References: <20211119213953.31970-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Document additional compatibles that can be used similarly to qcom,rpm-stats
for older RPM firmware versions that have the sleep stats at a fixed offset
rather than a dynamic one. The exact offset might vary depending on the SoC
so use SoC-specific compatible names to avoid confusion.

Cc: Maulik Shah <mkshah@codeaurora.org>
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
Changes in v2:
  - Use SoC-specific compatibles instead of qcom,rpm-legacy-stats
---
 Documentation/devicetree/bindings/soc/qcom/qcom-stats.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom-stats.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom-stats.yaml
index 99dff7d73b7e..473adca4e973 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom-stats.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom-stats.yaml
@@ -21,6 +21,11 @@ properties:
     enum:
       - qcom,rpmh-stats
       - qcom,rpm-stats
+      # For older RPM firmware versions with fixed offset for the sleep stats
+      - qcom,apq8084-rpm-stats
+      - qcom,msm8226-rpm-stats
+      - qcom,msm8916-rpm-stats
+      - qcom,msm8974-rpm-stats
 
   reg:
     maxItems: 1
-- 
2.34.0

