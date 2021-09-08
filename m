Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D5CD403B11
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Sep 2021 15:56:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349470AbhIHN4c (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Sep 2021 09:56:32 -0400
Received: from ixit.cz ([94.230.151.217]:34730 "EHLO ixit.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231304AbhIHN4b (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Sep 2021 09:56:31 -0400
Received: from newone.lan (ixit.cz [94.230.151.217])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by ixit.cz (Postfix) with ESMTPSA id 749C324A25;
        Wed,  8 Sep 2021 15:55:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
        t=1631109321;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=I0acloQnTQGjEElBrRVwhD3k1ePNYT9gjmoa3R81RgE=;
        b=efixGqHkdly5hegWhB1EF7FMZAiS7ZoA/q8jpoRB0LcSXvqPgWMPyxe3B9S1sEmY+Ol6Tp
        0kxzhqfmx7qZv5bifN/NsYpierqldpZx8yP7DP0j5Hcj03iV90q27mtYlj6IUO3IlMzfHW
        TUzAL1Tzg+zHRELWf1EW80xzsAx54/0=
From:   David Heidelberg <david@ixit.cz>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, David Heidelberg <david@ixit.cz>
Subject: [PATCH] dt-bindings: arm: qcom, add missing devices
Date:   Wed,  8 Sep 2021 15:54:09 +0200
Message-Id: <20210908135409.5896-1-david@ixit.cz>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 9aeb500630e0..5169ebb97946 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -95,6 +95,9 @@ properties:
 
       - items:
           - enum:
+              - asus,nexus4-mako
+              - asus,nexus7-flo
+              - sony,xperia-yuga
               - qcom,apq8064-cm-qs600
               - qcom,apq8064-ifc6410
           - const: qcom,apq8064
@@ -130,6 +133,7 @@ properties:
           - enum:
               - fairphone,fp2
               - lge,hammerhead
+              - samsung,klte
               - sony,xperia-amami
               - sony,xperia-castor
               - sony,xperia-honami
-- 
2.33.0

