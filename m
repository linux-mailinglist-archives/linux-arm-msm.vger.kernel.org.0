Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D63922C5131
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Nov 2020 10:29:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389464AbgKZJ10 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Nov 2020 04:27:26 -0500
Received: from mail.kernel.org ([198.145.29.99]:39392 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389459AbgKZJ1Y (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Nov 2020 04:27:24 -0500
Received: from localhost.localdomain (unknown [122.179.79.180])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 86DB021741;
        Thu, 26 Nov 2020 09:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606382843;
        bh=LD75lgaqb59sJzCpirku30QIpwZaYJz+X4dPKlsIfbU=;
        h=From:To:Cc:Subject:Date:From;
        b=QBxc00rSogAbcqw1+G6XbsBMwEwi5gvxRmftH1EPGpf8gZytWmhXJW5pOqZTAuqMl
         34NGdeii4yi7EHe0/VFTLOeEwr/GxR2ATuMKep0LSGgQUM3rhD441o+IZmnzmTJf7U
         RvjCQT1CisK0hROPMnk3/p+ECOm+LcafQtyosHnY=
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: power: Add rpm power domain bindings for sdx55
Date:   Thu, 26 Nov 2020 14:57:10 +0530
Message-Id: <20201126092711.1084518-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add RPM power domain bindings for the SDX55 SoC

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 Documentation/devicetree/bindings/power/qcom,rpmpd.yaml | 1 +
 include/dt-bindings/power/qcom-rpmpd.h                  | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
index 8058955fb3b9..fe20a73f47ca 100644
--- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
+++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
@@ -22,6 +22,7 @@ properties:
       - qcom,qcs404-rpmpd
       - qcom,sc7180-rpmhpd
       - qcom,sdm845-rpmhpd
+      - qcom,sdx55-rpmhpd
       - qcom,sm8150-rpmhpd
       - qcom,sm8250-rpmhpd
 
diff --git a/include/dt-bindings/power/qcom-rpmpd.h b/include/dt-bindings/power/qcom-rpmpd.h
index 5e61eaf73bdd..9fa2d66fca4a 100644
--- a/include/dt-bindings/power/qcom-rpmpd.h
+++ b/include/dt-bindings/power/qcom-rpmpd.h
@@ -15,6 +15,11 @@
 #define SDM845_GFX	7
 #define SDM845_MSS	8
 
+/* SDX55 Power Domain Indexes */
+#define SDX55_MSS	0
+#define SDX55_MX	1
+#define SDX55_CX	2
+
 /* SM8150 Power Domain Indexes */
 #define SM8150_MSS	0
 #define SM8150_EBI	1
-- 
2.26.2

