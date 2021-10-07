Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6C5F425ED0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Oct 2021 23:25:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241771AbhJGV1b (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Oct 2021 17:27:31 -0400
Received: from mail.z3ntu.xyz ([128.199.32.197]:58962 "EHLO mail.z3ntu.xyz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230120AbhJGV1Y (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Oct 2021 17:27:24 -0400
Received: from localhost.localdomain (ip-213-127-63-121.ip.prioritytelecom.net [213.127.63.121])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id 3B344C91C4;
        Thu,  7 Oct 2021 21:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1633641929; bh=RJQLF6oLD/LA6HJd8wF9mMr/P17NktfBH/lE5wJ42IE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=ZkbzQ5OuNDmyiGE2etBL2ndi3HyCEHycuQB4gWS7DxM8bqLZUjT/nJGUSqSRz+g5n
         yF0sw8jORPS2oIp3HjwzzTSkQhXOgUL8hLN/fyw+mmJbKy0cfVdgp3jIr/VPBhIn1f
         oouz1uZBH6U5HB7KSyFW+VYOi5ZfRy35VSNWpJoM=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        konrad.dybcio@somainline.org, Luca Weiss <luca@z3ntu.xyz>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@codeaurora.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 09/11] dt-bindings: arm: qcom: Document sm7225 and fairphone,fp4 board
Date:   Thu,  7 Oct 2021 23:24:36 +0200
Message-Id: <20211007212444.328034-10-luca@z3ntu.xyz>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211007212444.328034-1-luca@z3ntu.xyz>
References: <20211007212444.328034-1-luca@z3ntu.xyz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add binding documentation for Fairphone 4 smartphone which is based on
Snapdragon 750G (sm7225).

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 880ddafc634e..540dfafa3418 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -44,6 +44,7 @@ description: |
         sdm660
         sdm845
         sdx55
+        sm7225
         sm8150
         sm8250
         sm8350
@@ -217,6 +218,11 @@ properties:
               - qcom,sa8155p-adp
           - const: qcom,sa8155p
 
+      - items:
+          - enum:
+              - fairphone,fp4
+          - const: qcom,sm7225
+
       - items:
           - enum:
               - qcom,sm8150-mtp
-- 
2.33.0

