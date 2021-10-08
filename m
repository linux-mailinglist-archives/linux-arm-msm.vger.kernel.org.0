Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 841AB4273F1
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Oct 2021 00:53:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231905AbhJHWzW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Oct 2021 18:55:22 -0400
Received: from ixit.cz ([94.230.151.217]:54434 "EHLO ixit.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231888AbhJHWzW (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Oct 2021 18:55:22 -0400
Received: from localhost.localdomain (ip-89-176-96-70.net.upcbroadband.cz [89.176.96.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by ixit.cz (Postfix) with ESMTPSA id C588A23B26;
        Sat,  9 Oct 2021 00:53:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
        t=1633733602;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=4lk86BuJNbA2cvXYwrhWrX4P/CIKIclMMA6PrIMFqQA=;
        b=I1QI2QrDzzRYr5n6MQU88Ny3dj/ATdIugfGvZRGNeFUMiH/AozlL4P3xrQ7/DfF8rLDaNJ
        FVA7V4XTb3xycZAVedlN3AjBXNEybnMasma53bQfBNI2MdM+oOWDl7BX7P+QGXUONRX37v
        vEZ8KZn6Rz5vDSziVbZp+geCErTXBFw=
From:   David Heidelberg <david@ixit.cz>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, David Heidelberg <david@ixit.cz>
Subject: [PATCH] dt-bindings: arm: qcom, change vendor-prefix lge to lg
Date:   Sat,  9 Oct 2021 00:51:57 +0200
Message-Id: <20211008225157.51287-1-david@ixit.cz>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

lge never existed, use correct lg vendor-prefix
other lge -> lg conversions are comming in different series

Fixes: 9304af37d07b ("dt-bindings: arm: qcom, add missing devices")

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 239c02b6cbf6..b0b4f9d72935 100644
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

