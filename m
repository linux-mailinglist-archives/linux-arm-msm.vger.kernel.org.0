Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3D961D67EA
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2020 14:06:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727972AbgEQMGD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 17 May 2020 08:06:03 -0400
Received: from h2.fbrelay.privateemail.com ([131.153.2.43]:43659 "EHLO
        h2.fbrelay.privateemail.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727915AbgEQMGD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 17 May 2020 08:06:03 -0400
Received: from MTA-05-3.privateemail.com (mta-05.privateemail.com [198.54.127.60])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by h1.fbrelay.privateemail.com (Postfix) with ESMTPS id 073E4805AB;
        Sun, 17 May 2020 07:54:32 -0400 (EDT)
Received: from MTA-05.privateemail.com (localhost [127.0.0.1])
        by MTA-05.privateemail.com (Postfix) with ESMTP id 9D2016004B;
        Sun, 17 May 2020 07:54:29 -0400 (EDT)
Received: from localhost.localdomain (unknown [10.20.151.204])
        by MTA-05.privateemail.com (Postfix) with ESMTPA id 19FDA60049;
        Sun, 17 May 2020 11:54:29 +0000 (UTC)
From:   Eli Riggs <eli@rje.li>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, Eli Riggs <eli@rje.li>
Subject: [PATCH 1/3] dt-bindings: arm: qcom: Add sm6125 SoC and xiaomi,willow
Date:   Sun, 17 May 2020 04:54:06 -0700
Message-Id: <20200517115410.3374-1-eli@rje.li>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add compatibles for SM6125 aka SDM665 aka Snapdragon 665, as well
as xiaomi,willow aka Xiaomi Redmi Note 8T, the international
edition of the Note 8.

Signed-off-by: Eli Riggs <eli@rje.li>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 64ddae3bd39fd..4142e38a353ef 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -38,6 +38,7 @@ description: |
         msm8996
         sc7180
         sdm845
+        sm6125
 
   The 'board' element must be one of the following strings:
 
@@ -158,4 +159,9 @@ properties:
               - qcom,ipq6018-cp01-c1
           - const: qcom,ipq6018
 
+      - items:
+          - enum:
+              - xiaomi,willow
+          - const: qcom,sm6125
+
 ...
-- 
2.20.1

