Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E66AB43427D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Oct 2021 02:15:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229627AbhJTART (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Oct 2021 20:17:19 -0400
Received: from ixit.cz ([94.230.151.217]:54164 "EHLO ixit.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229610AbhJTART (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Oct 2021 20:17:19 -0400
Received: from localhost.localdomain (ip-89-176-96-70.net.upcbroadband.cz [89.176.96.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by ixit.cz (Postfix) with ESMTPSA id D3D0820064;
        Wed, 20 Oct 2021 02:15:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
        t=1634688904;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=TJnABHjMLDggxtip8elvVmUNdAmAKL7os6qzEq94uV4=;
        b=ueWZ0/NrRTEcCDgqXLyCayf+V1MfkDkqhzJLRo4tOLBPhIiITICXjCB2a4HxWuXHYfbSMx
        IrnyjEBd5w1WNctE1e7UsuGrd7ahKdFLcCX+0rcweLJPOnmk3ApPQxGdpdBDHsRC67Yth+
        b9qa6u69mb2eEoUZdh8IIuuRSelg2bw=
From:   David Heidelberg <david@ixit.cz>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@codeaurora.org>,
        David Heidelberg <david@ixit.cz>
Cc:     ~okias/devicetree@lists.sr.ht, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: arm: qcom: Nexus 4 was build by LG, not Asus
Date:   Wed, 20 Oct 2021 02:13:27 +0200
Message-Id: <20211020001327.37490-1-david@ixit.cz>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

I accidentally marked Nexus 4 (mako) as a Asus device, while it's LG.

Fixes: 9304af37d07b ("dt-bindings: arm: qcom, add missing devices")

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 470984d54720..a496e2883029 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -101,8 +101,8 @@ properties:
 
       - items:
           - enum:
-              - asus,nexus4-mako
               - asus,nexus7-flo
+              - lg,nexus4-mako
               - sony,xperia-yuga
               - qcom,apq8064-cm-qs600
               - qcom,apq8064-ifc6410
-- 
2.33.0

