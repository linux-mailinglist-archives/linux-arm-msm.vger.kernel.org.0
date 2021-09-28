Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1ACBC41B86F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Sep 2021 22:38:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242629AbhI1UkJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Sep 2021 16:40:09 -0400
Received: from mail.z3ntu.xyz ([128.199.32.197]:52000 "EHLO mail.z3ntu.xyz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242016AbhI1UkI (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Sep 2021 16:40:08 -0400
Received: from localhost.localdomain (ip-213-127-63-121.ip.prioritytelecom.net [213.127.63.121])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id 7B925C8FD4;
        Tue, 28 Sep 2021 20:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1632861507; bh=AgjIuOx9dWqDATQ37NMIqqkUWI6WO/V5tMSEfStAkC0=;
        h=From:To:Cc:Subject:Date;
        b=aI5bDofyAayklefVb98SUcMvK4cwhdHvRxilAiqj/yFCxqqJe7Ufv10qANNRDHdHH
         W0C0bOlsdKSNcwG6EU5jw/bUsOIHWIjt09LB1wCmnD5ohaiGSRp4RM7iGsmMZL6Mnd
         I1cs9vpsEklmkUE9kGr7l48/rweTzlkdymRP8Py8=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, Luca Weiss <luca@z3ntu.xyz>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@codeaurora.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: arm: qcom: rename vendor of apq8026-lenok
Date:   Tue, 28 Sep 2021 22:38:14 +0200
Message-Id: <20210928203815.77175-1-luca@z3ntu.xyz>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In order to avoid having prefixes for multiple internal divisions of LG
use the "lg" prefix instead of "lge".

Fixes: 21f3cbf693b0 ("dt-bindings: arm: qcom: Document APQ8026 SoC binding")
Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index a2e679112737..06da9ab5c0b6 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -96,7 +96,7 @@ properties:
 
       - items:
           - enum:
-              - lge,lenok
+              - lg,lenok
           - const: qcom,apq8026
 
       - items:
-- 
2.33.0

