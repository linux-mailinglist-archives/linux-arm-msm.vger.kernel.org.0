Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1062427D1E
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Oct 2021 21:32:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230111AbhJITej (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 9 Oct 2021 15:34:39 -0400
Received: from ixit.cz ([94.230.151.217]:47582 "EHLO ixit.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229558AbhJITej (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 9 Oct 2021 15:34:39 -0400
Received: from localhost.localdomain (ip-89-176-96-70.net.upcbroadband.cz [89.176.96.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by ixit.cz (Postfix) with ESMTPSA id 8DC9D20064;
        Sat,  9 Oct 2021 21:32:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
        t=1633807959;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=xOuPj4IS2t4Q8/G0ZKBAB/g9l0/VvpkR+8d5nC4mNV8=;
        b=JZKViZfiSAajeIdKvj1oO0/7q20uY+eoga6yWpnbew4ID+B7RKb4fUSuAfaqz2xgwwje9E
        qK8N1KCJPG0QQg184CmgqeGh0oaieaSRIh+qrIRbhxdNQNtO7q/i9+uyoMJKZX7k+1CCL+
        POQehEwuShvkDkhuszVZ72+LxfMFZm8=
From:   David Heidelberg <david@ixit.cz>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~okias/devicetree@lists.sr.ht,
        David Heidelberg <david@ixit.cz>
Subject: [PATCH 1/2] dt-bindings: arm: qcom-ipq4019: add missing device compatible
Date:   Sat,  9 Oct 2021 21:31:01 +0200
Message-Id: <20211009193102.76852-1-david@ixit.cz>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

One board version (dk01.1-c1) didn't have set device compatible,
so let's list it.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index a2e679112737..470984d54720 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -174,6 +174,7 @@ properties:
 
       - items:
           - enum:
+              - qcom,ipq4019-ap-dk01.1-c1
               - qcom,ipq4019-ap-dk04.1-c3
               - qcom,ipq4019-ap-dk07.1-c1
               - qcom,ipq4019-ap-dk07.1-c2
-- 
2.33.0

